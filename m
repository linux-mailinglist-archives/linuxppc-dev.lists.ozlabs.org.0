Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7F3F6FE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 08:56:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvcGN2MxMz2yPS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:56:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aCB2aXtl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aCB2aXtl; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvcFg56vVz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 16:56:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvcFc43ytz9sRf;
 Wed, 25 Aug 2021 16:56:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629874565;
 bh=jSlsrM1HwMJvkNNLTTYatOR6fzYRjXvzYjOwr9yNskQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aCB2aXtlQfFCgiUkftH6/Do/ODK3fAMwydmKyqU4Qs/jlULSY4ST4uY/SN7FgNRZf
 D2VriOe51K+kzhkcDehiISDHUD1T3NltEfnSI0gslH8WXsZoimlPZ0/eII3DO/1slt
 gnbd1P3fZuPKP3dRxX0xEKu4nZYG82nmfaRm8YWXq921tg6+KAacsjqQUM36jT1vaS
 9JW8ScwrUy8UUJ1/JPjfmspves05/kq1sDkCXhrCWBmJxHNsTQ1rItG/dis+Yw+5CG
 Zpa/1JiUMbKQSvIY02jLgn0sxQx1EmZeKh485JNT9peMbi7v8SQnYRxuk8B0+xwCYG
 phIfScszNAVzw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 npiggin@gmail.com
Subject: Re: [PATCH v3 1/3] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
In-Reply-To: <f5f598a5-3830-ee21-aff5-cba06deeb959@csgroup.eu>
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
 <87zgt6aybp.fsf@mpe.ellerman.id.au>
 <f5f598a5-3830-ee21-aff5-cba06deeb959@csgroup.eu>
Date: Wed, 25 Aug 2021 16:56:01 +1000
Message-ID: <87wnoaau7y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 25/08/2021 =C3=A0 07:27, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> In those hot functions that are called at every interrupt, any saved
>>> cycle is worth it.
>>>
>>> interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
>>> called from three places:
>>> - From entry_32.S
>>> - From interrupt_64.S
>>> - From interrupt_exit_user_restart() and interrupt_exit_kernel_restart()
>>>
>>> In entry_32.S, there are inambiguously called based on MSR_PR:
>>>
>>> 	interrupt_return:
>>> 		lwz	r4,_MSR(r1)
>>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>>> 		andi.	r0,r4,MSR_PR
>>> 		beq	.Lkernel_interrupt_return
>>> 		bl	interrupt_exit_user_prepare
>>> 	...
>>> 	.Lkernel_interrupt_return:
>>> 		bl	interrupt_exit_kernel_prepare
>>>
>>> In interrupt_64.S, that's similar:
>>>
>>> 	interrupt_return_\srr\():
>>> 		ld	r4,_MSR(r1)
>>> 		andi.	r0,r4,MSR_PR
>>> 		beq	interrupt_return_\srr\()_kernel
>>> 	interrupt_return_\srr\()_user: /* make backtraces match the _kernel va=
riant */
>>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>>> 		bl	interrupt_exit_user_prepare
>>> 	...
>>> 	interrupt_return_\srr\()_kernel:
>>> 		addi	r3,r1,STACK_FRAME_OVERHEAD
>>> 		bl	interrupt_exit_kernel_prepare
>>>
>>> In interrupt_exit_user_restart() and interrupt_exit_kernel_restart(),
>>> MSR_PR is verified respectively by BUG_ON(!user_mode(regs)) and
>>> BUG_ON(user_mode(regs)) prior to calling interrupt_exit_user_prepare()
>>> and interrupt_exit_kernel_prepare().
>>>
>>> The verification in interrupt_exit_user_prepare() and
>>> interrupt_exit_kernel_prepare() are therefore useless and can be remove=
d.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Acked-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/kernel/interrupt.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>=20
>> I'll pick this one up independent of the other two patches.
>
> Second patch should be ok as well, no ?

Yeah I guess.

I'm not sure if we'll want to keep cpu_has_msr_ri() if we have a
CONFIG_PPC_MSR_RI, but that's a pretty minor detail.

So yeah I'll take patch 2 as well.

cheers
