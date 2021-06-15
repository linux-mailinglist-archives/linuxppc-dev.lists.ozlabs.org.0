Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF83A738F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 04:06:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3s9k2ZXNz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nlLmevIK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nlLmevIK; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3s9J22Jcz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 12:05:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3s9G4Wr3z9sWQ;
 Tue, 15 Jun 2021 12:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623722739;
 bh=epeHMjATznR0exM/epOqCWPEov8DN2r1UKRHz+qa0Yw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nlLmevIKllnDU/8gwUCfScQf/M2o3zZR8yqgWW6XvnB+iPXUdwLP1CO4MCZbHkUv9
 HBjv0hdLuZseNcCNA+NO6yfeL+Mbt07TWiTC5bLGNJCmw8b10T64qI5zuS5yoeoc4k
 L2ePYqHqyVj307wj8Gu87LWM4pfBxG9pFY14hIIrh4SxpMjlrFyzg0npP7sOW59doy
 eWVF1lfNJapMFUVPb23xi/Z7MJ/9ZXBvVcAa/BmMkHxMBJg7s5n1+a6TCvVR/9xDTT
 uKVp5QA/6OeiRaN8P8KhHlT9yd2AGA7kK1L2+de5QYCl04WC9lZOjzmXdPvSFc21J+
 B1D6F+yDjlI5w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
In-Reply-To: <1623631623.jvh0hlk56m.astroid@bobo.none>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
 <1623631623.jvh0hlk56m.astroid@bobo.none>
Date: Tue, 15 Jun 2021 12:05:38 +1000
Message-ID: <87wnqvubkd.fsf@mpe.ellerman.id.au>
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
Cc: dja@axtens.net, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
>> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
>> to minimise uaccess switches") the 64-bit signal code was rearranged to
>> use user_write_access_begin/end().
>> 
>> As part of that change the call to copy_siginfo_to_user() was moved
>> later in the function, so that it could be done after the
>> user_write_access_end().
>> 
>> In particular it was moved after we modify regs->nip to point to the
>> signal trampoline. That means if copy_siginfo_to_user() fails we exit
>> handle_rt_signal64() with an error but with regs->nip modified, whereas
>> previously we would not modify regs->nip until the copy succeeded.
>> 
>> Returning an error from signal delivery but with regs->nip updated
>> leaves the process in a sort of half-delivered state. We do immediately
>> force a SEGV in signal_setup_done(), called from do_signal(), so the
>> process should never run in the half-delivered state.
>> 
>> However that SEGV is not delivered until we've gone around to
>> do_notify_resume() again, so it's possible some tracing could observe
>> the half-delivered state.
>> 
>> There are other cases where we fail signal delivery with regs partly
>> updated, eg. the write to newsp and SA_SIGINFO, but the latter at least
>> is very unlikely to fail as it reads back from the frame we just wrote
>> to.
>> 
>> Looking at other arches they seem to be more careful about leaving regs
>> unchanged until the copy operations have succeeded, and in general that
>> seems like good hygenie.
>> 
>> So although the current behaviour is not cleary buggy, it's also not
>> clearly correct. So move the call to copy_siginfo_to_user() up prior to
>> the modification of regs->nip, which is closer to the old behaviour, and
>> easier to reason about.
>
> Good catch, should it still have a Fixes: tag though? Even if it's not
> clearly buggy we want it to be patched.

Yeah I'll add one.

cheers
