Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660F3039FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:16:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2hM3QYNzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IDFoxHqT; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2f22ZdWzDqnw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:14:31 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id n10so11172398pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 02:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AufToq98zm1hDLicuSunK9zxehNiKXorrBl+3tMYjHc=;
 b=IDFoxHqT9YGX1nRw9slh3ddYDX3A8f7YxAO0nvy3+s5UESiUHMxDOkfcS1xmWmmzYd
 zPfYu05b7B0UWRaNgYS9ieIWkv7nX2edJ6yLr8OjjtbjH0p+D0aPq+NSzZZazvoQe8EZ
 8+DxPeqcHw4WpNkr/Y/Loo9FCwY67IVHXr0YU32rltiNWXco5sRusdut/SUdaE5YeNMv
 noHdPRXdjPKjweRG7OvjdR0GCrvsMnFneHUGuVHoXc6Cv/30zTXeq0MNN1XsKbEV8VHM
 O6+5RqWmlipxWLmU5XyR1lwC5OkxvcoKEMNo/eQ0abTuQjTXg4BFOg9yfY9TjUnuG2kn
 JVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AufToq98zm1hDLicuSunK9zxehNiKXorrBl+3tMYjHc=;
 b=m13NnTKaHhK2HXR1X5U9lRbJpnUGCR3TOzllVt/IRdOtzRVsM0nOTcUS6q1UX8nOpa
 UDF4IWiXhjiWVcq6Aumx0sgyUNzj/X5UmzVjot0i8UkSA5ZcamBwkbsIqqRlYsDK4rJC
 lpcHwnu9B0TOYz+kjbRiwDdVgnuWShRXA81Rd63J4rezHfHHHZRthSGUKQpxlpby/LXI
 uErprCdmdoXvwd4Jizp0OvS1QY5qcxTLZqx+h0cPmpsqpn/Xq5aCowtunal8pU83YmcL
 qvGg/jEkb9OpNC5Ox7p1cvRF+MHRxl3PBJ8JKEUmvh+ykIS0bWzftlYBwtNNcyGJ1UXJ
 Wh3g==
X-Gm-Message-State: AOAM531gZLfOuJqHlwfb4ktLgfHKnp31yxb15Ps1tgO8EGGa3ntP/4ur
 ehCzvTDWWIyoissy7PClzOE=
X-Google-Smtp-Source: ABdhPJxjNnzxd7smqSwMm+XA2DvScVdz92o0jODy+08rgBvbJBZXeNlouvKyD/ICZWyodnNRVG29hQ==
X-Received: by 2002:a63:fc54:: with SMTP id r20mr5008629pgk.167.1611656069155; 
 Tue, 26 Jan 2021 02:14:29 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 17sm18899224pgy.53.2021.01.26.02.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:14:28 -0800 (PST)
Date: Tue, 26 Jan 2021 20:14:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 19/23] powerpc/syscall: Avoid stack frame in likely
 part of system_call_exception()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <cdaf4ac33405e9a00ab277eccc5fd240d95e65b1.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cdaf4ac33405e9a00ab277eccc5fd240d95e65b1.1611585031.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611655998.arfe12oiu0.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
> When r3 is not modified, reload it from regs->orig_r3 to free
> volatile registers. This avoids a stack frame for the likely part
> of system_call_exception()
>=20
> Before the patch:
>=20
> c000b4d4 <system_call_exception>:
> c000b4d4:	7c 08 02 a6 	mflr    r0
> c000b4d8:	94 21 ff e0 	stwu    r1,-32(r1)
> c000b4dc:	93 e1 00 1c 	stw     r31,28(r1)
> c000b4e0:	90 01 00 24 	stw     r0,36(r1)
> c000b4e4:	90 6a 00 88 	stw     r3,136(r10)
> c000b4e8:	81 6a 00 84 	lwz     r11,132(r10)
> c000b4ec:	69 6b 00 02 	xori    r11,r11,2
> c000b4f0:	55 6b ff fe 	rlwinm  r11,r11,31,31,31
> c000b4f4:	0f 0b 00 00 	twnei   r11,0
> c000b4f8:	81 6a 00 a0 	lwz     r11,160(r10)
> c000b4fc:	55 6b 07 fe 	clrlwi  r11,r11,31
> c000b500:	0f 0b 00 00 	twnei   r11,0
> c000b504:	7c 0c 42 e6 	mftb    r0
> c000b508:	83 e2 00 08 	lwz     r31,8(r2)
> c000b50c:	81 82 00 28 	lwz     r12,40(r2)
> c000b510:	90 02 00 24 	stw     r0,36(r2)
> c000b514:	7d 8c f8 50 	subf    r12,r12,r31
> c000b518:	7c 0c 02 14 	add     r0,r12,r0
> c000b51c:	90 02 00 08 	stw     r0,8(r2)
> c000b520:	7c 10 13 a6 	mtspr   80,r0
> c000b524:	81 62 00 70 	lwz     r11,112(r2)
> c000b528:	71 60 86 91 	andi.   r0,r11,34449
> c000b52c:	40 82 00 34 	bne     c000b560 <system_call_exception+0x8c>
> c000b530:	2b 89 01 b6 	cmplwi  cr7,r9,438
> c000b534:	41 9d 00 64 	bgt     cr7,c000b598 <system_call_exception+0xc4>
> c000b538:	3d 40 c0 5c 	lis     r10,-16292
> c000b53c:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
> c000b540:	39 4a 41 e8 	addi    r10,r10,16872
> c000b544:	80 01 00 24 	lwz     r0,36(r1)
> c000b548:	7d 2a 48 2e 	lwzx    r9,r10,r9
> c000b54c:	7c 08 03 a6 	mtlr    r0
> c000b550:	7d 29 03 a6 	mtctr   r9
> c000b554:	83 e1 00 1c 	lwz     r31,28(r1)
> c000b558:	38 21 00 20 	addi    r1,r1,32
> c000b55c:	4e 80 04 20 	bctr
>=20
> After the patch:
>=20
> c000b4d4 <system_call_exception>:
> c000b4d4:	81 6a 00 84 	lwz     r11,132(r10)
> c000b4d8:	90 6a 00 88 	stw     r3,136(r10)
> c000b4dc:	69 6b 00 02 	xori    r11,r11,2
> c000b4e0:	55 6b ff fe 	rlwinm  r11,r11,31,31,31
> c000b4e4:	0f 0b 00 00 	twnei   r11,0
> c000b4e8:	80 6a 00 a0 	lwz     r3,160(r10)
> c000b4ec:	54 63 07 fe 	clrlwi  r3,r3,31
> c000b4f0:	0f 03 00 00 	twnei   r3,0
> c000b4f4:	7d 6c 42 e6 	mftb    r11
> c000b4f8:	81 82 00 08 	lwz     r12,8(r2)
> c000b4fc:	80 02 00 28 	lwz     r0,40(r2)
> c000b500:	91 62 00 24 	stw     r11,36(r2)
> c000b504:	7c 00 60 50 	subf    r0,r0,r12
> c000b508:	7d 60 5a 14 	add     r11,r0,r11
> c000b50c:	91 62 00 08 	stw     r11,8(r2)
> c000b510:	7c 10 13 a6 	mtspr   80,r0
> c000b514:	80 62 00 70 	lwz     r3,112(r2)
> c000b518:	70 6b 86 91 	andi.   r11,r3,34449
> c000b51c:	40 82 00 28 	bne     c000b544 <system_call_exception+0x70>
> c000b520:	2b 89 01 b6 	cmplwi  cr7,r9,438
> c000b524:	41 9d 00 84 	bgt     cr7,c000b5a8 <system_call_exception+0xd4>
> c000b528:	80 6a 00 88 	lwz     r3,136(r10)
> c000b52c:	3d 40 c0 5c 	lis     r10,-16292
> c000b530:	55 29 10 3a 	rlwinm  r9,r9,2,0,29
> c000b534:	39 4a 41 e4 	addi    r10,r10,16868
> c000b538:	7d 2a 48 2e 	lwzx    r9,r10,r9
> c000b53c:	7d 29 03 a6 	mtctr   r9
> c000b540:	4e 80 04 20 	bctr
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index a3510fa4e641..476909b11051 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -115,6 +115,9 @@ notrace long system_call_exception(long r3, long r4, =
long r5,
>  			return regs->gpr[3];
>  		}
>  		return -ENOSYS;
> +	} else {
> +		/* Restore r3 from orig_gpr3 to free up a volatile reg */
> +		r3 =3D regs->orig_gpr3;
>  	}
> =20
>  	/* May be faster to do array_index_nospec? */
> --=20

Nice optimisation, great analysis and catch. I'll have to test it on=20
ppc64.

Thanks,
Nick
