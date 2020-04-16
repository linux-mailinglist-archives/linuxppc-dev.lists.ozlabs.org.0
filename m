Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 567EC1AB612
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:04:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492kbW2Z03zDrFd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:04:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492kYq2xqyzDqw1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:03:08 +1000 (AEST)
Date: Wed, 15 Apr 2020 23:03:04 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416030304.GQ11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416004843.GO11469@brightrain.aerifal.cx>
 <1587002854.f0slo0111r.astroid@bobo.none>
 <20200416023542.GP11469@brightrain.aerifal.cx>
 <1587004907.ioxh0bxsln.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587004907.ioxh0bxsln.astroid@bobo.none>
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
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 12:53:31PM +1000, Nicholas Piggin wrote:
> > Not to mention the dcache line to access
> > __hwcap or whatever, and the icache lines to setup access TOC-relative
> > access to it. (Of course you could put a copy of its value in TLS at a
> > fixed offset, which would somewhat mitigate both.)
> > 
> >> And finally, the HWCAP test can eventually go away in future. A vdso
> >> call can not.
> > 
> > We support nearly arbitrarily old kernels (with limited functionality)
> > and hardware (with full functionality) and don't intend for that to
> > change, ever. But indeed glibc might want too eventually drop the
> > check.
> 
> Ah, cool. Any build-time flexibility there?
> 
> We may or may not be getting a new ABI that will use instructions not 
> supported by old processors.
> 
> https://sourceware.org/legacy-ml/binutils/2019-05/msg00331.html
> 
> Current ABI continues to work of course and be the default for some 
> time, but building for new one would give some opportunity to drop
> such support for old procs, at least for glibc.

What does "new ABI" entail to you? In the terminology I use with musl,
"new ABI" and "new ISA level" are different things. You can compile
(explicit -march or compiler default) binaries that won't run on older
cpus due to use of new insns etc., but we consider it the same ABI if
you can link code for an older/baseline ISA level with the
newer-ISA-level object files, i.e. if the interface surface for
linkage remains compatible. We also try to avoid gratuitous
proliferation of different ABIs unless there's a strong underlying
need (like addition of softfloat ABIs for archs that usually have FPU,
or vice versa).

In principle the same could be done for kernels except it's a bigger
silent gotcha (possible ENOSYS in places where it shouldn't be able to
happen rather than a trapping SIGILL or similar) and there's rarely
any serious performance or size benefit to dropping support for older
kernels.

Rich
