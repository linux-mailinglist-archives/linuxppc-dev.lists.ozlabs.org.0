Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5281C82F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 11:34:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZRQYUPbp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxNvH3ghNz3cXJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 21:34:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZRQYUPbp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxNt353Scz3cVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 21:32:59 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d3e2972f65so7953235ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 02:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703241177; x=1703845977; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Poe65Z2yDaErk/4LWhHXog9xzSO4kyIOOR5KpTUL6AQ=;
        b=ZRQYUPbpka5vTYHPIYpXlg9ssPz0ZqNFtPiWfVLAfZQKVIXiXDWv1k7Hf3F6SJovEw
         F0vr0cXf1GQLGC+RcYHh1kg9XmaysdPofDeas6iof0/UgTCzfkymVOr+Jf/GE/+D7+2z
         9Jlpl8NIz5JIT1YlQ9aVMGRi7POWKYutiCAi5MgzihK1gk0YRtDbUqwoGCC/4KGT8x6Q
         3OzQ/pPp8BwT/AZT8VXYtnQWD7oTzB+yNrISe2u9f0nBt1wLvfNoUU9M3gH32OkfdSnI
         eHf+wO4488v0idVto6Td/L8lqFCA4xOA5zBcYm4etBlOPlWrx6/NLN3eLYKoLlGBmncc
         PtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703241177; x=1703845977;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Poe65Z2yDaErk/4LWhHXog9xzSO4kyIOOR5KpTUL6AQ=;
        b=WgFF3zkPNnUmcTbtPFPfnLwL7cSRuQo/yPbCVbQ57oareXgi+mv5lJXCL11CvYeNsW
         xveANBuaY2mv8lcXT7BpPwnHoLIn9ujNGGDfyMlUrLlfIQ4MuUxiJt95yDOspJahjDr4
         HXNnNP74P4s0vhyPUFX6nb55DhT4VSc5n1McOk4gyOHGZQJhaopl0U9elwq4bf2jZIG9
         3ev/i6ftiT3C5lgLOlGOKk8ySqav4PArp41fYBP8o+7x2/7nmWPh8TjHd06b4u8SNfoo
         TdlbzBd/K+9AdQQgNwOdDgBpnoYHEfsppHWHa+2SBmidroQKbGck+gz3S/Xzv4hYHHat
         U1Tw==
X-Gm-Message-State: AOJu0YxgUvN0C7CJ8Xq1Qr5V9S2n+kxhN+XOtml/g+bqpwtlYXhmKYP9
	84d3GbXBtVq3lmc6F1YhLDpq3bVeRiM=
X-Google-Smtp-Source: AGHT+IGvnoH20jMcgBcVZMJvPAKQdE467EA25TN2MUEGXMYmuHqbRdnZibE+be+1Ra73zZ4leCoP1w==
X-Received: by 2002:a17:902:ce89:b0:1d4:13ca:ab26 with SMTP id f9-20020a170902ce8900b001d413caab26mr885263plg.68.1703241176665;
        Fri, 22 Dec 2023 02:32:56 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id ja22-20020a170902efd600b001d078445059sm3147807plb.143.2023.12.22.02.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 02:32:56 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 20:32:51 +1000
Message-Id: <CXUSLS07KV0L.1YBG3AE5BLHU0@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 10/29] powerpc/sprs: Specify SPRs with
 data rather than code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-11-npiggin@gmail.com>
 <49fe69ad-828e-4ac7-8693-7fd983e5152e@redhat.com>
In-Reply-To: <49fe69ad-828e-4ac7-8693-7fd983e5152e@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 4:14 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > A significant rework that builds an array of 'struct spr', where each
> > element describes an SPR. This makes various metadata about the SPR
> > like name and access type easier to carry and use.
> >=20
> > Hypervisor privileged registers are described despite not being used
> > at the moment for completeness, but also the code might one day be
> > reused for a hypervisor-privileged test.
> >=20
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/sprs.c | 643 ++++++++++++++++++++++++++++++++++--------------=
-
> >   1 file changed, 450 insertions(+), 193 deletions(-)
> >=20
> > diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> > index 57e487ce..cd8b472d 100644
> > --- a/powerpc/sprs.c
> > +++ b/powerpc/sprs.c
> > @@ -28,231 +28,465 @@
> >   #include <asm/processor.h>
> >   #include <asm/barrier.h>
> >  =20
> > -uint64_t before[1024], after[1024];
> > -
> > -/* Common SPRs for all PowerPC CPUs */
> > -static void set_sprs_common(uint64_t val)
> > +/* "Indirect" mfspr/mtspr which accept a non-constant spr number */
> > +static uint64_t __mfspr(unsigned spr)
> >   {
> > -	mtspr(9, val);		/* CTR */
> > -	// mtspr(273, val);	/* SPRG1 */  /* Used by our exception handler */
> > -	mtspr(274, val);	/* SPRG2 */
> > -	mtspr(275, val);	/* SPRG3 */
> > +	uint64_t tmp;
> > +	uint64_t ret;
> > +
> > +	asm volatile(
> > +"	bcl	20, 31, 1f		\n"
> > +"1:	mflr	%0			\n"
> > +"	addi	%0, %0, (2f-1b)		\n"
> > +"	add	%0, %0, %2		\n"
> > +"	mtctr	%0			\n"
> > +"	bctr				\n"
> > +"2:					\n"
> > +".LSPR=3D0				\n"
> > +".rept 1024				\n"
> > +"	mfspr	%1, .LSPR		\n"
> > +"	b	3f			\n"
> > +"	.LSPR=3D.LSPR+1			\n"
> > +".endr					\n"
> > +"3:					\n"
> > +	: "=3D&r"(tmp),
> > +	  "=3Dr"(ret)
> > +	: "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
> > +	: "lr", "ctr");
> > +
> > +	return ret;
> >   }
> >  =20
> > -/* SPRs from PowerPC Operating Environment Architecture, Book III, Ver=
s. 2.01 */
> > -static void set_sprs_book3s_201(uint64_t val)
> > +static void __mtspr(unsigned spr, uint64_t val)
> >   {
> > -	mtspr(18, val);		/* DSISR */
> > -	mtspr(19, val);		/* DAR */
> > -	mtspr(152, val);	/* CTRL */
> > -	mtspr(256, val);	/* VRSAVE */
> > -	mtspr(786, val);	/* MMCRA */
> > -	mtspr(795, val);	/* MMCR0 */
> > -	mtspr(798, val);	/* MMCR1 */
> > +	uint64_t tmp;
> > +
> > +	asm volatile(
> > +"	bcl	20, 31, 1f		\n"
> > +"1:	mflr	%0			\n"
> > +"	addi	%0, %0, (2f-1b)		\n"
> > +"	add	%0, %0, %2		\n"
> > +"	mtctr	%0			\n"
> > +"	bctr				\n"
> > +"2:					\n"
> > +".LSPR=3D0				\n"
> > +".rept 1024				\n"
> > +"	mtspr	.LSPR, %1		\n"
> > +"	b	3f			\n"
> > +"	.LSPR=3D.LSPR+1			\n"
> > +".endr					\n"
> > +"3:					\n"
> > +	: "=3D&r"(tmp)
> > +	: "r"(val),
> > +	  "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
> > +	: "lr", "ctr", "xer");
> >   }
> >  =20
> > +static uint64_t before[1024], after[1024];
> > +
> > +#define SPR_PR_READ	0x0001
> > +#define SPR_PR_WRITE	0x0002
> > +#define SPR_OS_READ	0x0010
> > +#define SPR_OS_WRITE	0x0020
> > +#define SPR_HV_READ	0x0100
> > +#define SPR_HV_WRITE	0x0200
> > +
> > +#define RW		0x333
> > +#define RO		0x111
> > +#define WO		0x222
> > +#define OS_RW		0x330
> > +#define OS_RO		0x110
> > +#define OS_WO		0x220
> > +#define HV_RW		0x300
> > +#define HV_RO		0x100
> > +#define HV_WO		0x200
> > +
> > +#define SPR_ASYNC	0x1000	/* May be updated asynchronously */
> > +#define SPR_INT		0x2000	/* May be updated by synchronous interrupt */
> > +#define SPR_HARNESS	0x4000	/* Test harness uses the register */
> > +
> > +struct spr {
> > +	const char	*name;
> > +	uint8_t		width;
> > +	uint16_t	access;
> > +	uint16_t	type;
> > +};
> > +
> > +/* SPRs common denominator back to PowerPC Operating Environment Archi=
tecture */
> > +static const struct spr sprs_common[1024] =3D {
> > +  [1] =3D {"XER",		64,	RW,		SPR_HARNESS, }, /* Compiler */
> > +  [8] =3D {"LR", 		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr *=
/
> > +  [9] =3D {"CTR",		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr *=
/
> > + [18] =3D {"DSISR",	32,	OS_RW,		SPR_INT, },
> > + [19] =3D {"DAR",		64,	OS_RW,		SPR_INT, },
> > + [26] =3D {"SRR0",	64,	OS_RW,		SPR_INT, },
> > + [27] =3D {"SRR1",	64,	OS_RW,		SPR_INT, },
> > +[268] =3D {"TB",		64,	RO	,	SPR_ASYNC, },
> > +[269] =3D {"TBU",		32,	RO,		SPR_ASYNC, },
> > +[272] =3D {"SPRG0",	64,	OS_RW,		SPR_HARNESS, }, /* Int stack */
> > +[273] =3D {"SPRG1",	64,	OS_RW,		SPR_HARNESS, }, /* Scratch */
> > +[274] =3D {"SPRG2",	64,	OS_RW, },
> > +[275] =3D {"SPRG3",	64,	OS_RW, },
> > +[287] =3D {"PVR",		32,	OS_RO, },
>
> Just a little stylish nit: You've got a space before the closing "}", but=
 no=20
> space after the opening "{". Looks a little bit weird to me. Maybe add a=
=20
> space after the "{", too?

Yes that is inconsistent. I'll fix.

Thanks,
Nick
