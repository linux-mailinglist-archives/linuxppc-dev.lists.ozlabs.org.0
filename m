Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABB1AFF94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 03:36:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4958Rc70MwzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 11:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4958PQ0MN7zDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 11:34:15 +1000 (AEST)
Date: Sun, 19 Apr 2020 21:34:12 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200420013412.GZ11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587344003.daumxvs1kh.astroid@bobo.none>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 11:10:25AM +1000, Nicholas Piggin wrote:
> Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
> > Note that because lr is clobbered we need at least once normally
> > call-clobbered register that's not syscall clobbered to save lr in.
> > Otherwise stack frame setup is required to spill it.
> 
> The kernel would like to use r9-r12 for itself. We could do with fewer 
> registers, but we have some delay establishing the stack (depends on a
> load which depends on a mfspr), and entry code tends to be quite store
> heavy whereas on the caller side you have r1 set up (modulo stack 
> updates), and the system call is a long delay during which time the 
> store queue has significant time to drain.
> 
> My feeling is it would be better for kernel to have these scratch 
> registers.

If your new kernel syscall mechanism requires the caller to make a
whole stack frame it otherwise doesn't need and spill registers to it,
it becomes a lot less attractive. Some of those 90 cycles saved are
immediately lost on the userspace side, plus you either waste icache
at the call point or require the syscall to go through a
userspace-side helper function that performs the spill and restore.

The right way to do this is to have the kernel preserve enough
registers that userspace can avoid having any spills. It doesn't have
to preserve everything, probably just enough to save lr. (BTW are
syscall arg registers still preserved? If not, this is a major cost on
the userspace side, since any call point that has to loop-and-retry
(e.g. futex) now needs to make its own place to store the original
values.)

Rich
