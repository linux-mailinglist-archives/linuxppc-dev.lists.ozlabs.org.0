Return-Path: <linuxppc-dev+bounces-6924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACCA5D32E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 00:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC9BN1MdGz2yVV;
	Wed, 12 Mar 2025 10:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741736172;
	cv=none; b=USiTgtiRzzgzd7Uku/g2YgqW+SaLGhabcDsXSpiN1T4SN9uZM/c1Nat6fKZyEX0Qklk9f8qfq+nBUBEJN/21WafWlRyvo7iFaVMH2AuWx24dnHxG6cvq7htZvq0osZxUlOlBkBpiCPL7GOGyZ+7rr9xdgBNnZjLE/eJBfN+Ow04ZjhkVRfCLf9sJh1vzr62t7LDeBnpx8ChH9jcBHH4GPM7FbZi7xT+MJVzau2e0pdup8llrKognIsVzP94Kf+jZcgh4QlbsapeBbOw3lGcc8ruqNVfDhOPuLUoCNj4x6lfS7IKcsiaK7syTauvQOMihXV2EHcWNFPt+SkSxqhUyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741736172; c=relaxed/relaxed;
	bh=OJ/N6RDNJhsKkhEU6U2fwKdV9v3px1FNP1P5wQQOOck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtKuUcnTX6ZXzs6PRYifuOC5bjiws3PAMmc+eNGEyJ/XQX0zCrfAJubTHZNs1Yswhszwg5DsYNEN8PfDRYimA7JVQCJrzDY7h9PO5uOTbUh8DWe4n89hi3Yz4Wv91itgrJQZTJlZ8Lj+8vb4aER/+klImvUhg45cdXVHCecYMQfJfpStq1a7Nr8xhnRLgw8snQqxBOgjq5qSzW6CsLIQxgFkM92CJRBFGaZtVvos0hsQ9GkkS/cvUPVFdCznPH+K0RntfOYzjeqo2DEzHIfSzydMPg2T4PjEKTcrb1wbLuqUhnrDwliF+YJvH+jywenYaBWLsQJVNDoM29+1ag2hPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.176; helo=mail-vk1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.176; helo=mail-vk1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC9BK55pNz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 10:36:09 +1100 (AEDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524038ba657so355313e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741736166; x=1742340966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ/N6RDNJhsKkhEU6U2fwKdV9v3px1FNP1P5wQQOOck=;
        b=msfNlGSR48BNrjp0Fj9QxqmVGryvGbiEpNtF7hgaSgOpogxWs2LPkaFKPFXOMSSe/0
         dddt0POehwPn5PAXhRpBOLe0h596/xMIdinVA6r8OlfXy+wHDbLNrnmD/SC/8atDMXkZ
         JgQ9JDBa8NxH7iVlJU/M2oU0Lz0hXVbKSzy4rEioc/gWzek6mDRnGGwyZc7ugaHLlXpJ
         I/5gp14TQvkv7rUZhABelip2U/S7PhIlUzq6sXPbuPqVm75dNuGrek5uEjfK3OH+XkKB
         uJuS1tNfBqB2cPS9596GcXqM0U9YKccOeNS930IcjZ91+vzMWiupcvsgRGp7M9ZeGxeP
         cOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUfP94mC9/ejw0Epu/Kgd7ZFpk2KwOPF7l5WWp9nx9Nm926JLYgO4igATqKTCi2DT+toMD1rh7SVd4GFU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8tUEEbrjqL6aUs15ITEWL5xe4n5nrC1yNkFvBtOVeKzLEY2P0
	jXywrSwE9Drutoeu4urdVAEF0PkzYyTc2zh24G+bdxq56U2kyxhazDhQN898
X-Gm-Gg: ASbGncv654LfaLl1fr6uEMMSkWiYMzgUxnyROvN14gXluMCRI90PTiQVFMvLL/6oS6M
	RSmDnIjzDZbBtqm2HpW1fmL/JvHHgniFfaFdSxZ/CJ+ZKbtEyCopa2gkjfsOmoWDPr2yBBkDs7z
	PeEeMLoJWjHQMl6Wp0Fg/u1Lx7nZsq7cSyuG+ZBiRgft1MIuhyzyEzCHokG8B8z4b+mr9G2Zcri
	jbMQLuq5CCGWoELiTrw5rkCKMKXI67yGJn8RnLQWpaQAUzzqyd5S7WFR1S4ome5vX0VBE0pT7lh
	R30a6VabXbXkDyYxmuIl/L99kWzC0FogaYwRdp/kRrUvQ+NXwkgkebnBobzwZ43tuq3ESaO+unV
	Chci+XkK2oHI=
X-Google-Smtp-Source: AGHT+IGX6wsIBMl8paB3scmRQSEtjIZ4rQbQzeA8XaXAFKDwVy0Vzx7bvUkysvs+lJkA9fpBJZEN0g==
X-Received: by 2002:a05:6122:1d07:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-524194aa47cmr4407547e0c.0.1741729303165;
        Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8cbd59esm1924952e0c.47.2025.03.11.14.41.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5240a432462so228714e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1N9dpHVDfoXhV+DCfI7QCx44oFAGx5k9+wpc9AZ5OsXkCqsvik8xxs4h93t6A/fOxglH/8Dml30uK7VU=@lists.ozlabs.org
X-Received: by 2002:a05:6122:489c:b0:523:e4c6:dddb with SMTP id
 71dfb90a1353d-52419478380mr4380371e0c.0.1741729302782; Tue, 11 Mar 2025
 14:41:42 -0700 (PDT)
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
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
In-Reply-To: <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 22:41:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp2UP71Gi3RsrYhaKY-FGNeXSzj4L3BI-snK3mtBDJzZMW7SrRY1lIN6cU
Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mark,

On Tue, 11 Mar 2025 at 22:33, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Mar 11, 2025 at 11:06:56PM +0200, Mike Rapoport wrote:
> > On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:
> > > This patch appears to be causing breakage on a number of 32 bit arm
> > > platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> > > die on boot with no output, a bisect with qemu points at this commit and
> > > those for physical platforms appear to be converging on the same place.
>
> > Can you share how this can be reproduced with qemu?
>
> https://lava.sirena.org.uk/scheduler/job/1184953
>
> Turns out it's actually producing output on qemu:
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.14.0-rc6-next-20250311 (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1741691801
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 64 MiB at 0x00000000
>
> - I'd only been sampling the logs for the physical platforms, none of
> which had shown anything.

Hangs that early need "earlycon", which the qemu boot above does have.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

