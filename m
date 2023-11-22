Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834ED7F3D16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 06:02:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YogX3JWO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZpyk32knz3dL1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 16:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YogX3JWO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZpxv0Ns9z3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 16:01:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700629314;
	bh=cnv4HPjqzpENgSwb6uKQtFMG29qppfeUnvFNRoTLgL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YogX3JWOhSw5uZggo5VoYNmRhvjL8UEBdsqPezIoy7PJ+trAgLaMfMJs8byrttGCR
	 taH/aP/aqTwAsrEhaMUx7N+eG51Ves5Mz12AtHGR8kGJ3+jQ2eV9K5RpF/lFQIAgWx
	 XwlXSVNwBejFErkFRBYnW/zxGfE48on1DDTfDMXdeMlhuiswDvqpTDRqQt0iANRZ8M
	 zU5aTHtRkC6S4A1UHdKohYl1b6sIXunJ6ZvricfU8x2pNex6H1vd2LEtjm6WbXOjK5
	 rX4upN14k9Nt8TwL9fMBYdQJIt/Uxy2anQtmpEV6O/HNz+w+nKIw40CwvAoFaWtOyB
	 oEMqJMXhDzGGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZpxr3Ynvz4xNG;
	Wed, 22 Nov 2023 16:01:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
In-Reply-To: <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
Date: Wed, 22 Nov 2023 16:01:50 +1100
Message-ID: <87leaqjs8x.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Timothy Pearson <tpearson@raptorengineering.com> writes:
>
...
>
> So a little more detail on this, just to put it to rest properly vs.
> assuming hand analysis caught every possible pathway. :)
>
> The debugging that generates this stack trace also verifies the following in __giveup_fpu():
>
> 1.) tsk->thread.fp_state.fpr doesn't contain the FPSCR contents prior to calling save_fpu()
> 2.) tsk->thread.fp_state.fpr contains the FPSCR contents directly after calling save_fpu()
> 3.) MSR_FP is set both in the task struct and in the live MSR.
>
> Only if all three conditions are met will it generate the trace.  This
> is a generalization of the hack I used to find the problem in the
> first place.
>
> If the state will subsequently be reloaded from the thread struct,
> that means we're reloading the registers from the thread struct that
> we just verified was corrupted by the earlier save_fpu() call.  There
> are only two ways I can see for that to be true -- one is if the
> registers were already clobbered when giveup_all() was entered, and
> the other is if save_fpu() went ahead and clobbered them right here
> inside giveup_all().
>
> To see which scenario we were dealing with, I added a bit more
> instrumentation to dump the current register state if MSR_FP bit was
> already set in registers (i.e. not dumping data from task struct, but
> using the live FPU registers instead), and sure enough the registers
> are corrupt on entry, so something else has already called save_fpu()
> before we even hit giveup_all() in this call chain.

Can you share the debug patch you're using?

cheers
