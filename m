Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849719EF22
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:32:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wY1Q157jzDqjL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bxxcUclJ; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wXzd5SgnzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:30:37 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id g32so6784240pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=648EAhn9hTOhllyK3oVrEDDOYCSilIvDFvIjAPE8GhI=;
 b=bxxcUclJf8+lji8sagKNvnK4HTPxHYNA7JPK4mbJf7kx1s940XWv0qeKm3DFkgIsKa
 oDz+R6IA+vGnR2XyHg+dJe8qXlFk6k/lMrl9ZlZBrEcIAhoDJ2cXrBhFIedyVYq+HCFf
 iM+aTBqU42HhZ2HhJFBEsjK+AWyx4RZZZ9+SdWdYbN4HEV7pJ0JdsIZYvVXpEah78VbT
 jQ35jEcC5zIwkQjSVhvfcU9PK0T3BZHIuhgNByOLibxeptbYhNlNtFzIA7g6TlK8LzCf
 QLCEcbI4QYrz7SAyYCSHlztGHje/rHPc/WDI/d1SW4yURWC7Nqz+dfDs715M5+oHGgPC
 r+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=648EAhn9hTOhllyK3oVrEDDOYCSilIvDFvIjAPE8GhI=;
 b=eZF2r1x/Lw1+FxuB+mtGoIJGwdUOPEuVJbrXC8Arpq/tAtFzvSH7B9wOPbepdF8RWM
 kxfWpkPhGwnRKsmi841YIzUUNOgTe/M8dSU4ryhhMEy3qC42MqgAoak6S/+a2B6tYUCA
 jgWW184Y3RfP4jXhc9wVP8A0Rj1FpRLgFVd4TmnKFlgL4E8PjJe3gZI6/VxvquO2UUlg
 oQQTW43sckdIQGVQViKze5Yzx2/BCGbNoM1Ws2+OVEdQDgwN0i6jO4LhShROm5kWatje
 RlzESz8+frWVbroJPucSmSuydq3BLf61dD/7f2QKD2c0Zdb5ZAzcJPCbs/nF2Sbi3G5l
 NUHw==
X-Gm-Message-State: AGi0PuYElUAgaHV4AyM1TttZJORgIKo+yZ8KStxZSAWn0C6OXooGs1pa
 INYYehEyB68teTXWmlH/TW8=
X-Google-Smtp-Source: APiQypLycg7rmddIB5cNO7bQaKa8vS5cjqEx0U87WncWxwPgJatFRyY7oXCv0uSj/o0G//6ZmjDBXA==
X-Received: by 2002:a63:a556:: with SMTP id r22mr6770647pgu.429.1586136634359; 
 Sun, 05 Apr 2020 18:30:34 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y30sm10381405pff.67.2020.04.05.18.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:30:33 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:29:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 11/13] powerpc/syscall: Avoid stack frame in likely
 part of syscall_call_exception()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <fc0109635dbca7464d13451ce648ee49893711df.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <fc0109635dbca7464d13451ce648ee49893711df.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586136357.atgut3zasc.astroid@bobo.none>
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

Christophe Leroy's on April 6, 2020 3:44 am:
> When r3 is not modified, reload it from regs->orig_r3 to free
> volatile registers. This avoids a stack frame for the likely part
> of syscall_call_exception()
>=20
> Before : 353 cycles on null_syscall
> After  : 347 cycles on null_syscall
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
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/syscall.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 69d75fc4a5eb..630c423e089a 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -91,6 +91,8 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
> =20
>  	} else if (unlikely(r0 >=3D NR_syscalls)) {
>  		return -ENOSYS;
> +	} else {
> +		r3 =3D regs->orig_gpr3;
>  	}

So this just gives enough volatiles to avoid spilling to stack? I wonder
about other various options here if they would cause a spill anyway.

Interesting optimisation, it would definitely need a comment. Would be
nice if we had a way to tell the compiler that a local can be reloaded
from a particular address.

Thanks,
Nick

=
