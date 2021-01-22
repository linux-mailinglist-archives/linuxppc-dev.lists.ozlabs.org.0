Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054E300B46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 19:33:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMnv32gWZzDsTk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 05:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMnsK4ZfpzDrNG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 05:31:32 +1100 (AEDT)
Date: Fri, 22 Jan 2021 13:31:27 -0500
From: Rich Felker <dalias@libc.org>
To: Florian Weimer <fweimer@redhat.com>, musl@lists.openwall.com,
 libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Subject: Re: [musl] Re: [PATCH v2] powerpc/64/signal: balance return
 predictor stack in signal trampoline
Message-ID: <20210122183127.GQ23432@brightrain.aerifal.cx>
References: <20200511101952.1463138-1-npiggin@gmail.com>
 <87im7pp5yl.fsf@oldenburg.str.redhat.com>
 <20210122144402.GP23432@brightrain.aerifal.cx>
 <20210122181922.pcxyomeg5xcf2umu@work-tp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122181922.pcxyomeg5xcf2umu@work-tp>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 03:19:22PM -0300, Raoni Fassina Firmino wrote:
> On Fri, Jan 22, 2021 at 09:44:05AM -0500, Rich Felker wrote:
> > Maybe I'm missing something but I don't see how this would break musl;
> > we just inspect the PC in the mcontext, which I don't see any changes
> > to and which should still point to the next instruction of the
> > interrupted context. I don't have a test environment though so I'll
> > have to wait for feedback from ppc users to be sure. Are there any
> > further details on how it's breaking glibc?
> 
> For glibc, backtrace() compares the return-address from each stack frame
> to the value of `__kernel_sigtramp_rt64` to identify the frame with the
> mcontext information, but now the return-address is not the start of the
> routine, but the middle of it, so it fails to catch this special frame.

Is there a reason it's backtracing rather than just looking at the
interrupted context (pointed to by the third argument to the signal
handler)?

Rich
