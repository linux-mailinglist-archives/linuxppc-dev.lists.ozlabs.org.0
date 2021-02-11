Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84151318467
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 05:43:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbkXQ0T77zDwmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:43:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbkVm2nQqzDwk4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 15:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WHKKAh5P; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbkVl4Yc9z9s1l;
 Thu, 11 Feb 2021 15:41:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613018512;
 bh=XZIJXgbO1KqMKnW3T+HnSm+5++f1RbxBkJ/WTWFEgPA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=WHKKAh5PGP6VE6c3UICueTMADK3KXPDFEn8HtzIjHfMt19htL8ODgc7NLf/jkgnSi
 T7yesfk3kpQXMZkUWHu1DpXFoB6z5DDyDSDB6x0YjPepRPzj3Lh2boNGHptTK6scVe
 RC1pvbcS0HOLCmhpoj06Nk3wX+HZuPF9d3kquxvDfr3icCZGb/6izJnMolu92ube1Z
 pe5EMaVKO3c8ZX7ST/g7jMVd6O/xaIGAb03sA1VUamZogOPbhEb6IvHlUMa6B1FRUq
 3zJTj+wrPBqQoLNAG7IOryeSZCi3hTLwMtOM83Phu6DM2i8rMvTjeWUa7n5XaBWVf1
 JiO4iAYNHUsDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Declaring unrecoverable_exception() as __noreturn ?
In-Reply-To: <1613004125.9jpd8u2w0w.astroid@bobo.none>
References: <5ecc1a9a-92eb-7006-6c94-2b7b700d182a@csgroup.eu>
 <1613004125.9jpd8u2w0w.astroid@bobo.none>
Date: Thu, 11 Feb 2021 15:41:48 +1100
Message-ID: <87mtwbnrlf.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Christophe Leroy's message of February 11, 2021 2:44 am:
>> As far as I can see, almost all callers of unrecoverable_exception() expect it to never return.
>> 
>> Can we mark it __noreturn ?
>
> I don't see why not, do_exit is noreturn. We could make die() noreturn 
> as well.

I'm always nervous about that, because we can return if a debugger is
involved:

DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
{
	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
		 regs->trap, regs->nip, regs->msr);
	die("Unrecoverable exception", regs, SIGABRT);
}

void die(const char *str, struct pt_regs *regs, long err)
{
	unsigned long flags;

	/*
	 * system_reset_excption handles debugger, crash dump, panic, for 0x100
	 */
	if (TRAP(regs) != 0x100) {
		if (debugger(regs))
			return;


We obviously don't want to optimise for that case, but it worries me
slightly if we're marking things noreturn when they can actually return.

cheers
