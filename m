Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A693182B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:46:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbdH02HLTzDwkH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 11:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UzPdigDc; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbdDz1sCBzDwk6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 11:44:31 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id d2so2274046pjs.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=RjRzByxnrrosUGFffdYsIW8Mj1/VmVlyjuLokyJB9Ck=;
 b=UzPdigDcte7HDmGK3o27VbkYSNJITnOUIchWn8A0RJptZwprPpX81HpQaarBMbGrqK
 jNJhDwm3KcfqrL1FicETV8jidxjbVQQEAo3stF8BojTDckBBgQ3julB9kQ2xgbAtrRdE
 7vv3rMBUvnSyLDs0NevpVzRPzlGeUVySyah32UNwwweO4FmI2cOMWp1tb3XlMk9TN3pU
 xrAGkkIWM4u3gdVv06dYTky6bDwm00WNxdoNR5HnR/65lCrvARbmtYAft270XueyA2je
 BKFXU/zAyDaNbIPZIdjmPrdIAIPlhxX4NTpDZNWYBFzpZC3nWdN315IiVoGNmkh8CfX0
 xV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RjRzByxnrrosUGFffdYsIW8Mj1/VmVlyjuLokyJB9Ck=;
 b=Ti+dCucp6VvowaLv1PG5/8l0qxsBPHJwP0Bm4IgFglB9shtEEKYCtmrSIeiFhKt0hM
 ZnISSgCEusbRreMsVZWUZQ/5HORul/C5axDCoryPrIyPjzB0DMHJLaRqH1vdbvMc6ZFc
 7aLqWJXwXDZZd3t8n8zDYGl/gNTNyGqPUe9VGCcMPG723qNiwPICOEGMArrfE+0zXHA2
 yw+JkmL2wMbPg2gepBGUXzfFWhfE2NI4x69TTSqSLKALgzRpULGtNME25JYFqZoWBpJz
 KBKHap/pz5dtTG5NOHNVARKa6L3kD4FpfixB8g8owyRTpyCTmrC4m67+1KhvjGzWlqzy
 6XmQ==
X-Gm-Message-State: AOAM531P7lbBLUHo5uVIMfE9GCqBXVaWGmUMWnQOKJJmDaQGBbmaNf9i
 RZme5YNOhnkyQWrJvJgcoGSSugBvFA0=
X-Google-Smtp-Source: ABdhPJxos2x/CMZmx+FDTd5Y5QJqH+TsOZvTRQspvs06hHDwfwdGq8wOs4H7oL4licVvw+cQ8Q7B0Q==
X-Received: by 2002:a17:902:8b89:b029:e0:6c0:dea8 with SMTP id
 ay9-20020a1709028b89b02900e006c0dea8mr5291635plb.28.1613004267982; 
 Wed, 10 Feb 2021 16:44:27 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id h17sm3265869pfr.200.2021.02.10.16.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 16:44:27 -0800 (PST)
Date: Thu, 11 Feb 2021 10:44:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Declaring unrecoverable_exception() as __noreturn ?
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <5ecc1a9a-92eb-7006-6c94-2b7b700d182a@csgroup.eu>
In-Reply-To: <5ecc1a9a-92eb-7006-6c94-2b7b700d182a@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1613004125.9jpd8u2w0w.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 11, 2021 2:44 am:
> As far as I can see, almost all callers of unrecoverable_exception() expe=
ct it to never return.
>=20
> Can we mark it __noreturn ?

I don't see why not, do_exit is noreturn. We could make die() noreturn=20
as well.

>=20
> Below is interrupt_exit_kernel_prepare() with then without unrecoverable_=
exception() declared as=20
> __noreturn. (CONFIG_PREEMPT_NONE, and with the BUG_ON() removed)
>=20
> With the __noreturn added, we get no stack frame on the likely path

Nice!

Thanks,
Nick

>=20
> 000003a8 <interrupt_exit_kernel_prepare>:
>   3a8:	81 43 00 84 	lwz     r10,132(r3)
>   3ac:	71 4a 00 02 	andi.   r10,r10,2
>   3b0:	41 82 00 30 	beq     3e0 <interrupt_exit_kernel_prepare+0x38>
>   3b4:	80 62 00 70 	lwz     r3,112(r2)
>   3b8:	74 63 00 01 	andis.  r3,r3,1
>   3bc:	40 82 00 34 	bne     3f0 <interrupt_exit_kernel_prepare+0x48>
>   3c0:	7d 40 00 a6 	mfmsr   r10
>   3c4:	55 4a 04 5e 	rlwinm  r10,r10,0,17,15
>   3c8:	7d 40 01 24 	mtmsr   r10
>   3cc:	7d 20 00 a6 	mfmsr   r9
>   3d0:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
>   3d4:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
>   3d8:	7d 20 01 24 	mtmsr   r9
>   3dc:	4e 80 00 20 	blr
>   3e0:	94 21 ff f0 	stwu    r1,-16(r1)
>   3e4:	7c 08 02 a6 	mflr    r0
>   3e8:	90 01 00 14 	stw     r0,20(r1)
>   3ec:	48 00 00 01 	bl      3ec <interrupt_exit_kernel_prepare+0x44>
> 			3ec: R_PPC_REL24	unrecoverable_exception
>   3f0:	38 e2 00 70 	addi    r7,r2,112
>   3f4:	3d 00 00 01 	lis     r8,1
>   3f8:	7c c0 38 28 	lwarx   r6,0,r7
>   3fc:	7c c6 40 78 	andc    r6,r6,r8
>   400:	7c c0 39 2d 	stwcx.  r6,0,r7
>   404:	40 a2 ff f4 	bne     3f8 <interrupt_exit_kernel_prepare+0x50>
>   408:	38 60 00 01 	li      r3,1
>   40c:	4b ff ff b4 	b       3c0 <interrupt_exit_kernel_prepare+0x18>
>=20
> Without the modification:
>=20
> 000003a8 <interrupt_exit_kernel_prepare>:
>   3a8:	94 21 ff f0 	stwu    r1,-16(r1)
>   3ac:	93 e1 00 0c 	stw     r31,12(r1)
>   3b0:	81 23 00 84 	lwz     r9,132(r3)
>   3b4:	71 29 00 02 	andi.   r9,r9,2
>   3b8:	41 82 00 38 	beq     3f0 <interrupt_exit_kernel_prepare+0x48>
>   3bc:	81 22 00 70 	lwz     r9,112(r2)
>   3c0:	75 23 00 01 	andis.  r3,r9,1
>   3c4:	40 82 00 4c 	bne     410 <interrupt_exit_kernel_prepare+0x68>
>   3c8:	7d 20 00 a6 	mfmsr   r9
>   3cc:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
>   3d0:	7d 20 01 24 	mtmsr   r9
>   3d4:	7d 20 00 a6 	mfmsr   r9
>   3d8:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
>   3dc:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
>   3e0:	7d 20 01 24 	mtmsr   r9
>   3e4:	83 e1 00 0c 	lwz     r31,12(r1)
>   3e8:	38 21 00 10 	addi    r1,r1,16
>   3ec:	4e 80 00 20 	blr
>   3f0:	7c 08 02 a6 	mflr    r0
>   3f4:	90 01 00 14 	stw     r0,20(r1)
>   3f8:	48 00 00 01 	bl      3f8 <interrupt_exit_kernel_prepare+0x50>
> 			3f8: R_PPC_REL24	unrecoverable_exception
>   3fc:	81 22 00 70 	lwz     r9,112(r2)
>   400:	80 01 00 14 	lwz     r0,20(r1)
>   404:	75 23 00 01 	andis.  r3,r9,1
>   408:	7c 08 03 a6 	mtlr    r0
>   40c:	41 82 ff bc 	beq     3c8 <interrupt_exit_kernel_prepare+0x20>
>   410:	39 02 00 70 	addi    r8,r2,112
>   414:	3d 20 00 01 	lis     r9,1
>   418:	7c e0 40 28 	lwarx   r7,0,r8
>   41c:	7c e7 48 78 	andc    r7,r7,r9
>   420:	7c e0 41 2d 	stwcx.  r7,0,r8
>   424:	40 a2 ff f4 	bne     418 <interrupt_exit_kernel_prepare+0x70>
>   428:	38 60 00 01 	li      r3,1
>   42c:	7d 20 00 a6 	mfmsr   r9
>   430:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
>   434:	7d 20 01 24 	mtmsr   r9
>   438:	7d 20 00 a6 	mfmsr   r9
>   43c:	55 29 07 fa 	rlwinm  r9,r9,0,31,29
>   440:	55 29 04 5e 	rlwinm  r9,r9,0,17,15
>   444:	7d 20 01 24 	mtmsr   r9
>   448:	83 e1 00 0c 	lwz     r31,12(r1)
>   44c:	38 21 00 10 	addi    r1,r1,16
>   450:	4e 80 00 20 	blr
>=20
