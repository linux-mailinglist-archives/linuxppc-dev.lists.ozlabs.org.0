Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496B3DFC7C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:08:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfksG1wXZz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 18:08:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=soV5H8Ia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=soV5H8Ia; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfkrn5bfJz302N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 18:08:24 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso2479585pjo.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iF8GqUw3fJkSuKkM1TDURToz/fDqSBL3RQMnD7NkKi4=;
 b=soV5H8Iaxlk13Zsqs/hVkR+nh/fQ+droSHbxWuKIwOf/yzzy9YzHm5qGn9Pld7ekHR
 Zle8+Ikp4lSC2Q6X4IgF4ktAwCDEKcB/BtF5gYxik/DpNXWJXqu0cHVHRvwH07fzeHCK
 EDEUHZCk+GgCP00JIkDa8C7NLzZUbJrmjWKIHpBVo+Zd6NlaJ3nhBINpBwUgRgWr4F9A
 v2oLTpGT67CgWpTpZv+Zci1E5QMBgP7dzQ0BMpyRdLrO7t7GODl0XfaZ2GzRruXDpGIb
 Qflmjn7ajBMMJcVk8uSsYjSZ1Zb4aNTaaaygAfe6EwPCM9X5WyPI8MrO+Jtx/7OaBmrp
 dljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iF8GqUw3fJkSuKkM1TDURToz/fDqSBL3RQMnD7NkKi4=;
 b=IwsFIZmKz3vmHwNaiHwVX6O//+AMDP3q/NIe7sJril7brSS0Rn9H6Hy1vAijf28WAk
 itwld+nteNZpc6njWKHI+V0tnQGZ2qrzCN1YU2xhcRC8Lj5xhhQwqxkUjCX23gK4TsVJ
 G6npoZyuYh2/ljXUGBEIRqnUsV46v7zMcHXeKKN+JjJlQf974fduUN3Z6LFQbXXQkfWC
 JkwkDNJzjA0MVZDFD7Ipvsu3YswZ3puwbIk2H698ha51m2kTbBGik4Ax7jhhchbtTE3F
 oD/y2BT6B7dy5iaSRdNBmRyZDyR1Jg41X/02Ob3V0ChDN5lRavimHCJgxwf/jPonm/ds
 eBDA==
X-Gm-Message-State: AOAM531sRoinICoRqk2g6h1eJixUmbtOm8MfcIczXqBtEBuKwc6tsXT5
 hXwHnYjtH6A9pHcz8MGsxmA=
X-Google-Smtp-Source: ABdhPJzBcxvudp/M5au72pgDSSu33yGC2Lt+KJhqCRM8D6bWhoyw/dh6MAN471eUedhDYAR6imgz3g==
X-Received: by 2002:a62:e416:0:b029:3c5:f084:7212 with SMTP id
 r22-20020a62e4160000b02903c5f0847212mr343016pfh.76.1628064501299; 
 Wed, 04 Aug 2021 01:08:21 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
 by smtp.gmail.com with ESMTPSA id
 j19sm1662743pfr.82.2021.08.04.01.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:08:20 -0700 (PDT)
Date: Wed, 04 Aug 2021 18:08:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <b36623df00ef3d2296f928487b6e23f93a217afa.1628054802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b36623df00ef3d2296f928487b6e23f93a217afa.1628054802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628064412.48kzr1eula.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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

Excerpts from Christophe Leroy's message of August 4, 2021 3:27 pm:
> In those hot functions that are called at every interrupt, any saved
> cycle is worth it.
>=20
> interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
> called from three places:
> - From entry_32.S
> - From interrupt_64.S
> - From interrupt_exit_user_restart() and interrupt_exit_kernel_restart()
>=20
> In entry_32.S, there are inambiguously called based on MSR_PR:
>=20
> 	interrupt_return:
> 		lwz	r4,_MSR(r1)
> 		addi	r3,r1,STACK_FRAME_OVERHEAD
> 		andi.	r0,r4,MSR_PR
> 		beq	.Lkernel_interrupt_return
> 		bl	interrupt_exit_user_prepare
> 	...
> 	.Lkernel_interrupt_return:
> 		bl	interrupt_exit_kernel_prepare
>=20
> In interrupt_64.S, that's similar:
>=20
> 	interrupt_return_\srr\():
> 		ld	r4,_MSR(r1)
> 		andi.	r0,r4,MSR_PR
> 		beq	interrupt_return_\srr\()_kernel
> 	interrupt_return_\srr\()_user: /* make backtraces match the _kernel vari=
ant */
> 		addi	r3,r1,STACK_FRAME_OVERHEAD
> 		bl	interrupt_exit_user_prepare
> 	...
> 	interrupt_return_\srr\()_kernel:
> 		addi	r3,r1,STACK_FRAME_OVERHEAD
> 		bl	interrupt_exit_kernel_prepare
>=20
> In interrupt_exit_user_restart() and interrupt_exit_kernel_restart(),
> MSR_PR is verified respectively by BUG_ON(!user_mode(regs)) and
> BUG_ON(user_mode(regs)) prior to calling interrupt_exit_user_prepare()
> and interrupt_exit_kernel_prepare().
>=20
> The verification in interrupt_exit_user_prepare() and
> interrupt_exit_kernel_prepare() are therefore useless and can be removed.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Probably okay to do now things are ironing out.

Unless we want to make a new define for interrupt handler debug and put=20
a bunch of these asserts under it. There's quite a lot more here, and
in asm/interrupt.h, etc.

Thanks,
Nick

> ---
>  arch/powerpc/kernel/interrupt.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 21bbd615ca41..f26caf911ab5 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -465,7 +465,6 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs)
> =20
>  	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
>  		BUG_ON(!(regs->msr & MSR_RI));
> -	BUG_ON(!(regs->msr & MSR_PR));
>  	BUG_ON(arch_irq_disabled_regs(regs));
>  	CT_WARN_ON(ct_state() =3D=3D CONTEXT_USER);
> =20
> @@ -499,7 +498,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs)
>  	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
>  	    unlikely(!(regs->msr & MSR_RI)))
>  		unrecoverable_exception(regs);
> -	BUG_ON(regs->msr & MSR_PR);
>  	/*
>  	 * CT_WARN_ON comes here via program_check_exception,
>  	 * so avoid recursion.
> --=20
> 2.25.0
>=20
>=20
