Return-Path: <linuxppc-dev+bounces-4379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4109FA0DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:09:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFmNr5kc5z2xn3;
	Sun, 22 Dec 2024 01:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734790140;
	cv=none; b=BxrX2U6Hp3SWQwWP3G2oz9LYlNR1Ma36ChwE/r15MzkCD91gcLYvG9CwpIUn5g7A9XSa2x5UTKz51p2vhL3O3p5XwiMx5bQrewKX8QSMoIVjrcMtp/bNQQ3kUOVg+1oxLIfuzexsdIuoee4tRU+YdHDqUsWUAAKnPX9cj2iJQtibdtGLfwTsbOe/xmsHVEFfoO0FWcrwRg+/qe4lDKJ2M6jscsQ4gWnmCjU16tpdDPyz/nKytZix1FXX8kvaH6HijivBj8C473HdmFtMaXCIRBWpeponIVcI882A9T6LMMakwW0jV5EsDMTpNF1e89N/0D1CRrh4HPUnYGxUlNO9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734790140; c=relaxed/relaxed;
	bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9ZaJlIWzBiM4GzMm1/6lSozcqT4WBUdT36o1zekgIX/JqSXUeqASTQx7cG/X0bPQElD2zsgmj4PvkRlNyUU3AmDotx7lvPaiXsyQGX1OjcwDvAGPkeeNfxzdNVdT8NQrSTNrdLeimpYG+BWXbx2snk+WRSmYoGixNHpcdVyWK8V2dDINOpi+wyyzX9WCHyqRWgdomuyd8COgIb2p15PM5H4+lUh7DFsCXf8M0CN1kW2Svhjk6EjiQcgRympk9IPrTpwbfAImgms7h+3otkMAO56HX6SCwjeu+t/dJRqjnfSWPg+MKmimIGpjBPpcrWbdFj0+yF/3UdS6b5ggn99wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFmNn6Wymz2xjb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:08:55 +1100 (AEDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71e15717a2dso1468935a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 06:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734790132; x=1735394932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
        b=F20gYhr3lujghAmHilAhR54Pp3eRKMPLne2FakPX3ii7Q/G2GcWAzk3jUXJ2u69wVH
         SAk6ljgOBb3s5iPTqWX/uszxLPFVQy+9C+TvChXZmdfeuD9x4KvP6KX0mB6bihWsJDpR
         tR8UeS+dRcAKpYEorpTEGEvvS3FM2RwOBH/jUIsf139Eve/dBesIod2uSxxyYXvWVZfu
         yGWeOlddHbdVL+mzSSBJvWDUeg7odNmt3jJ28RSB+Iz9o/dkJhFeY/QCafkPpvkykkXk
         wFh1WRgeogZ0sjwxjZfwdlwMqIc+brQ3EEIdpUKPFeZLIRm+g2W/g+XL2uLbn6FnNpEm
         71EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAPZyCY7DIcPit2S+luXQu2WCX4ZNk86aeIY5b/vLqoWKrksGFJ7VAUw/YsajOQsCM46x/ducrQZ7dPow=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlDvvx7gOgkBsYJ67AhxqMMEb7+LSeCc1a444A4YkQa1jlSzwJ
	/o9nfi74+crbgo8/HPdJD4e/q+XN2mPmc30bS9vnyuRM4/WBGWih8HA3hFn/
X-Gm-Gg: ASbGncteZ0UtYuY8IRo+gx7j7UPPlphntXnzq7OalucNmnjWjsd964TalkBcraNzaxm
	ArL44AwLuA+vKHs0VCnj2EAHvl0TSW/wT+EFGpGYLDAp/gPGgDJMgacrkkeUhyrZyUuI9jtiQHb
	5wEOL2XYuWXmBgAOHd2T6CU9aYqHtOaTqusR4ceqHL/itLDb5xT6I8DlQJUblFlGTvMSfueEme/
	Q2DYm6vSc+4A6NSZ+Df0P3L7Ue0pbePTBYT4UPgWUI4TKSLRTSm7qxuBKcDb5TLgXX7TfC0DI38
	zMQTR0wMLLe/dI919J4=
X-Google-Smtp-Source: AGHT+IHkWWMgWKVAYN1bd14VwY9D+LeVeRCp1P6YShmUrMAXUf5z8E0A8iw1i29nTxW53dPjEKIHDw==
X-Received: by 2002:a05:6871:2209:b0:29f:b7f1:d844 with SMTP id 586e51a60fabf-2a7fb1859c1mr3979056fac.2.1734790132288;
        Sat, 21 Dec 2024 06:08:52 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6475sm1522988fac.53.2024.12.21.06.08.51
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 06:08:51 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so1563164fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 06:08:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu13zLXT1/xGm88QXEPsN/MW/qrv3bwqO3e7aCwHGeardVHTSoMrsS4o1WKkXAfWkp+ikgB9dgFq9DlDI=@lists.ozlabs.org
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr7064126137.5.1734789822327; Sat, 21 Dec 2024
 06:03:42 -0800 (PST)
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
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
In-Reply-To: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Dec 2024 15:03:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Guo,

On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
<guoweikang.kernel@gmail.com> wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediat=
e
> panic is required. To simplify this behavior and reduce repetitive checks=
,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
>
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>

Thanks for your patch!

> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_add=
r_t size, phys_addr_t align)
>                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
>  }
>
> +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t size,
> +                                                      phys_addr_t align,
> +                                                      const char *func)
> +{
> +       void *addr =3D memblock_alloc(size, align);
> +
> +       if (unlikely(!addr))
> +               panic("%s: Failed to allocate %llu bytes\n", func, size);
> +       return addr;
> +}

Please make this out-of-line, and move it to mm/memblock.c, so we have
just a single copy in the final binary.

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +        __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>                                                phys_addr_t align)
>  {
> diff --git a/init/main.c b/init/main.c

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

