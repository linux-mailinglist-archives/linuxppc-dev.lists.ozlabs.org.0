Return-Path: <linuxppc-dev+bounces-5670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9636A218B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 09:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjZf768mgz2xt7;
	Wed, 29 Jan 2025 19:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738138383;
	cv=none; b=CjWr7pc3j05cLwnvzA6Gnt3FzUM62/qpwP6F+pUZ/y53V9cQA2vlgwOI70RVr2wwg9QYXox+Cjvhnea/OKean1C5hh7tI2W5w7Ou95cxUi78Gz8dLxIah8FmUg23JCjH+MNXJPNdjCNxQKle4LTacCuAthGh4559AVJsITyIrCYx3oVuMlH3cs+N8riwS5OcqgkTS99AaOOsif3DeImiMbJIyDqgG7baDSurBWCshNshdMXSog09DnLfUYwppBk/Fy5+j4MSHkr48qkhsRf6JOSiBgh7isqMacriRTCOYst7t3zTbU4euFJOOey2sp4yxMoUcKhIlmMFMEYB0RU1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738138383; c=relaxed/relaxed;
	bh=hK8c3jsYlNpEX7+mgSkiCU9qayKu6OQ/X4AlSjaHOFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RXZNkffn1bVHSdlx+yMAq3gHLpeDtiVgvAEDzZnbwA6mhqfxf00KsYM2Jt9qogWnO63EvzEGr+x229WeMxp23mF5teJLKfNpgXnwSf1QWBJQ2IBxNPl2AUue0zt5RYI+AKfqG60bcahQAVL7/ftP8v7I006L6USky0ti0CEGtmXfEDz19KpFh8PGbixKdRk08M/ph8IugB2bOXGdgGnQN8BNa9L/X0S13DrnEFKm+iZlv9iAZ5wK1SiaCwVon05E8JaYwCmDV1iN4oTF31n67EkvI5mSwYvl/I6+uBy55HS6mrNzkQNZFoQGZP1HR3tLqC3oKCAtiJy16b2Pvc1u+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UHfkgD/Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UHfkgD/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjZf631jvz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 19:13:02 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so703785a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 00:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138380; x=1738743180; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hK8c3jsYlNpEX7+mgSkiCU9qayKu6OQ/X4AlSjaHOFw=;
        b=UHfkgD/YIXTDZY7FkZE2uzK112u1lN+j9ArB0KyLOs5khSsO+8Qvzm4PGYb5chY9eB
         WcUpAZlu78An+jONnqJENXjVnn88Vihvs7ZfgUHtvOiXerygiCNQBCOEp+Sxlximm6vw
         GWXeIxuaZeOCw0KU60Ztp45z8DS5Ejs1qoSBmcOCYwSR4IKCiX4pdJWDA+uvZgq+9Z7i
         GqiXz6TIxNSYZq8gqWIq3k8wacSeoxhE9LVc+H/LettQDAiGV5V7ixwlk1Pd+lTfv3Wh
         oFxYiGYImCQ9js2EXWJ5fovsbG+YGkzEK7AOQB5n2Im4vgDfpG4TShpglcAv7vojng54
         gpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138380; x=1738743180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hK8c3jsYlNpEX7+mgSkiCU9qayKu6OQ/X4AlSjaHOFw=;
        b=g/xxbIHU3v8fTHu87J8DjMbzoBtZfpz3ZwpQUcpSTAbsRsgZ02ZK/mq9A4fSJ5zwm7
         M1PMxpnlFINpAzAX6XFsNlKkXQXaSi9K9VpVZxukwoAKaMVEgb1FgrkzYmJ7Y5BAZerY
         tDzyHJjh2HdyBkdtfSsU5JZoCPlH1TgjS7YPQ9b16H/t2yRcbEs/dAZubxVP+X/L3BKe
         TrVoSnz78zsZsuEE8DaKTLKFA4YT4W/t171dZy4z1COtFZgNfSy+kkMRNShOi1lBrYs4
         vPZSGLAjCPFFUa37ukQlQEsV3d2Zd/WUFeL3gYxWTr6BD0ubxh0DDDSE1Xmo6wID5iEa
         +p3w==
X-Gm-Message-State: AOJu0YzTQGM25tY1eAsATFQ1gWnKis8c5t3/WtMpzpvRQZ2XyWgSX4d3
	koB+277N2Yvtnx5wSBXm2lzc0QcJE0cBvaS436NfhcZuDsgSZgOjd+klbw==
X-Gm-Gg: ASbGncv8rl3SwOVHaHooyN2ODJ6aipyDHa5H9cspuddPie6g6fR5x7XZ+t/6yJ179lv
	dlGKfWRmR75PuQdATg3eQ+U9wpMl9tYcXF95SD2575koxFSG4C4R4vuUe69klfSHVcf8FzppqJJ
	0H046KsLMVAUphH64Dk5227D6sH/xP1InX7aNILCGWsCzEqO5VtP93yOoKH5OntRS27hZI1bIji
	sdbHi30tWFTho2GaXaHMKWSFu/LaP3BIvOTbGDS881+8T1QXWkEqtdrinyrN6zDWEKs/eoHOEp3
	9d98tull
X-Google-Smtp-Source: AGHT+IEHnOBZNqtmjl+mi2C9PXem4P4ksAmCb6fb4MAFqpm9XVo5zBXAoxp/RRj0u0Yy5i+AbZYgMA==
X-Received: by 2002:a17:90b:524b:b0:2f2:a974:1e45 with SMTP id 98e67ed59e1d1-2f83a122cc4mr3511853a91.16.1738138379910;
        Wed, 29 Jan 2025 00:12:59 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc9a038sm981198a91.7.2025.01.29.00.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:12:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 18:12:55 +1000
Message-Id: <D7EEMQ8UULSQ.YCX4FDTAX6RP@gmail.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
 <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
 <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 4:57 PM AEST, Paul Mackerras wrote:
> On Wed, Jan 29, 2025 at 04:21:26PM +1000, Nicholas Piggin wrote:
>> On Wed Jan 29, 2025 at 8:55 AM AEST, Paul Mackerras wrote:
>> > This adds support for Microwatt systems with more than one core, and
>> > updates the device tree for a 2-core version.  (This does not prevent
>> > the kernel from running on a single-core system.)
>> >
>> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>>=20
>> Well, I'm impressed you added SMP :)
>>=20
>> What happens with a 1 CPU system? Do we time out waiting for secondaries
>> and continue, or is there something more graceful?
>
> There's a field in the SYSCON register which tells you how many cores
> there are.  microwatt_init_smp() looks at that field and only starts
> the CPUs that are there.

Ah, nice.

> Oops, sorry, I see that I forgot to do 'git add' on
> arch/powerpc/platforms/microwatt/smp.c.  Here it is (I'll include it
> properly in v2, of course):
>
> // SPDX-License-Identifier: GPL-2.0-or-later
>
> /*
>  * SMP support functions for Microwatt
>  * Copyright 2025 Paul Mackerras <paulus@ozlabs.org>
>  */
>
> #include <linux/kernel.h>
> #include <linux/smp.h>
> #include <linux/io.h>
> #include <asm/early_ioremap.h>
> #include <asm/xics.h>
>
> #include "microwatt.h"
>
> static void __init microwatt_smp_probe(void)
> {
> 	xics_smp_probe();
> }
>
> static void microwatt_smp_setup_cpu(int cpu)
> {
> 	if (cpu !=3D 0)
> 		xics_setup_cpu();
> }
>
> static struct smp_ops_t microwatt_smp_ops =3D {
> 	.probe		=3D microwatt_smp_probe,
> 	.message_pass	=3D NULL,		/* Use smp_muxed_ipi_message_pass */
> 	.kick_cpu	=3D smp_generic_kick_cpu,
> 	.setup_cpu	=3D microwatt_smp_setup_cpu,
> };
>
> /* XXX get from device tree */
> #define SYSCON_BASE	0xc0000000

#define SYSCON_LENGTH 0x100

?

>
> #define SYSCON_CPU_CTRL	0x58
>
> void __init microwatt_init_smp(void)
> {
> 	volatile unsigned char __iomem *syscon;
> 	int ncpus;
> 	int timeout;
>
> 	syscon =3D early_ioremap(SYSCON_BASE, 0x100);

ioremap is not up by SMP init time? I always have to
trawl through init spaghetti to work it out. I guess it's
early SMP init.

> 	if (syscon =3D=3D NULL) {
> 		pr_err("Failed to map SYSCON\n");
> 		return;
> 	}
> 	ncpus =3D (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
> 	if (ncpus < 2)
> 		goto out;
>
> 	smp_ops =3D &microwatt_smp_ops;
>
> 	/*
> 	 * Write two instructions at location 0:
> 	 * mfspr r3, PIR
> 	 * b __secondary_hold
> 	 */
> 	*(unsigned int *)KERNELBASE =3D 0x7c7ffaa6;
> 	*(unsigned int *)(KERNELBASE+4) =3D 0x4800005c;

Could move constants to PPC_INST_ ?

>
> 	/* enable the other CPUs, they start at location 0 */
> 	writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
>
> 	timeout =3D 10000;
> 	while (!__secondary_hold_acknowledge) {
> 		if (--timeout =3D=3D 0)
> 			break;
> 		barrier();
> 	}
>
>  out:
> 	early_iounmap((void *)syscon, 0x100);
> }

Looks okay otherwise.

Thanks,
Nick

