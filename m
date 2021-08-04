Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D73DFD59
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gflsn2bgTz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 18:54:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fk37KOcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fk37KOcr; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GflsJ017Vz302G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 18:53:54 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so5168654pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=jAaZlMkl00zT0OtQniQ7FZrvBURnMn0WpyG8CxlOJn4=;
 b=fk37KOcrmxMPrw7cXIiBvrn80IgC1iRB7IkdNmQkax/PkAu2NsEsTirizGutmU0QG3
 VOTUOnlbIbIdLU0C4uyIcoRR6n4b/fVNrmKQNEezNIobfi1RL5uwvOj39pFxVgRTEy7H
 AvGcHpBt8z3iaVpcL+yI3PzBkSXCtI3XLjQQkvm8URA0+/IcP1KxVDb7Xyk2csBABKZ+
 OTv00GJ1mmF+6sI5vx+ExobgY5rfNtwZNlDkIr38Dd5SRIl39N6BIHjCT7AfiPFL/gqH
 Y5n/jMA4zpg1cXov+VHFc1ZKEG6zqaiOIa2bttWvHaATHK+M8V1EEGMEaPbbEaP1hTA0
 oNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jAaZlMkl00zT0OtQniQ7FZrvBURnMn0WpyG8CxlOJn4=;
 b=oBz1/nQUY6JiS6keSPSHzeslkTbta9LfkwynBxpXVkzjLt/VBdvr0SeojHRmvG0Oih
 vUp21i6t89MG7PxIAcsyG83bhgmV0g76Pw0Yh6dORG7VNNUvo8YrMWaB05p7wVdgHHmc
 y5DCKtFbRn8N7fF0N3Shj5aW1mKQsaRWI4fgpTQmXe1B9djKTQm5Ly+APzfwmRZ5YOUJ
 1Ix1MnQk37riwcQtQmP9SHfU8IK33xv6oXb5PmzuZT3iwTVOpVX4EA8dyt940kxjfjnf
 FwsSD9ALUqETROSpXxtqrja0AKkTJb3kJL1SXwMgx0KZUXhaVMxKz+NvwcQ2/cmLQZNm
 HnYA==
X-Gm-Message-State: AOAM532f+oVJXgDugTGi4bRP5L8oQQl4GQr9oxDDn0rsiLdsTtcyCQso
 2fZnboO1au0S6TzCuKDPhCQ=
X-Google-Smtp-Source: ABdhPJwcXvw0oSoxqi2MuD7Y5yzBqeL8SRppbr8D0zPLRVYAgmrTaQA5Pd9K8CuLIjyynNaYi0XY+Q==
X-Received: by 2002:a17:902:b78b:b029:12c:6f89:51aa with SMTP id
 e11-20020a170902b78bb029012c6f8951aamr21910891pls.3.1628067232884; 
 Wed, 04 Aug 2021 01:53:52 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
 by smtp.gmail.com with ESMTPSA id
 u13sm1893006pfh.123.2021.08.04.01.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:53:52 -0700 (PDT)
Date: Wed, 04 Aug 2021 18:53:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Remove MSR_PR check in
 interrupt_exit_{user/kernel}_prepare()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <b36623df00ef3d2296f928487b6e23f93a217afa.1628054802.git.christophe.leroy@csgroup.eu>
 <1628064412.48kzr1eula.astroid@bobo.none>
 <cd5f54fd-fbf4-e471-9971-1e8c86755754@csgroup.eu>
In-Reply-To: <cd5f54fd-fbf4-e471-9971-1e8c86755754@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628067212.yli25q0lwj.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 4, 2021 6:37 pm:
>=20
>=20
> Le 04/08/2021 =C3=A0 10:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of August 4, 2021 3:27 pm:
>>> In those hot functions that are called at every interrupt, any saved
>>> cycle is worth it.
>>>
>>> interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare() are
>>> called from three places:
>>> - From entry_32.S
>>> - From interrupt_64.S
>>> - From interrupt_exit_user_restart() and interrupt_exit_kernel_restart(=
)
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
>>=20
>> Probably okay to do now things are ironing out.
>>=20
>> Unless we want to make a new define for interrupt handler debug and put
>> a bunch of these asserts under it. There's quite a lot more here, and
>> in asm/interrupt.h, etc.
>=20
> But that one is so trivial that I'm not sure there is any point in keepin=
g it even as a kind of=20
> additional DEBUG level, unless you want those BUG_ONs because you don't t=
rust the compiler.

Fair point.

Acked-by: Nicholas Piggin <npiggin@gmail.com>
