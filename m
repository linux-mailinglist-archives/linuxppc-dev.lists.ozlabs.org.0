Return-Path: <linuxppc-dev+bounces-4428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEB9FAB21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 08:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGqV93Bkpz2ytp;
	Mon, 23 Dec 2024 18:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734939137;
	cv=none; b=jIgcbacXSKiGWglykM+ceAEqyE9wFcHLURzIIHiRHEKGn0Ckk+gcVwjDrKd7+C6BkdD41otxbCO9BSP+Fjk9cVKkY36gTzQAi8cz+EzAeDKqukm/wLwasqNU64MeugNH8FO3iCb5pBwJF0DS/0j4bqJ9Wh2ORWyUAbC+dktmBJA+c5JRNotT+OATgB/9nX1B6zAWFxmMSKNDZG3j5bC84KgjvA5pw0JHFlimZKbodODIqqY2R7m7ihvi5jzv+nUDwCCR3QryvOeyFpWTwSTHVXen9ZIGmOfwCliX4s5ZqJiApe9ByaNJkel7vJwX/nb6c0LGdT9NXJVM8zYzoMygQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734939137; c=relaxed/relaxed;
	bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iO1VaoyZpl49sqoR96N50hxWV+VV8jm74rGIiu5cwwHuIAJpkl02MnIMUMFKPtgoMT3vashIJ96Dw7X1j4G1b1B6i3jM9+a0Xkq/5s2FO88icRmB0Oi1tO241l+Wc443UDdmed4wjQpQSh0/idqGCJrELCF1f9tK9ffnwgQEWCaGJ8gI+i++J2oLFCdf1wFsxTXN7Ncpf7N8FK3I4SU3u87jB6BTSrFRQBnrLzcK59BHsAYRKXm7CsiEbW4jzcKfIt7o6kAaXhrODYL7oxadO1988nhrIO5rdrO9s6UkuXU3aaMO2ghiMHDsQgGfcXjJEHjJyOwPik/jNf2+9Jzhag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nKd5GJQa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nKd5GJQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGqV76mLSz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 18:32:14 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6efeb120f4dso30106427b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 23:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734939132; x=1735543932; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=nKd5GJQabHgCeXecROH7lPql5Kr11GM69/Xy4pq0oDVJO5tPc6GwUyETyl5sM1P6Oa
         87D0L5H53Ayj/wPZa3bmP5XQzuDcYrPmBUyuhDEKMFuotqDu1NHTXc+AmIFlFA+T4gQ5
         Z90HstOD/j9ekmW6w5Et0H4dA3Y32vm0QAsw3ohDmCojN1/KjcLoHQEGnW6GHh05Pghe
         qmdEkvoHUIXv0EUubVuFfsF83B/s1kZdUYCN6Db0ebwogFoMufkOxNCK7dR3U4bNnL/9
         +Q7UFQBPkY0EyBJYCcSB1c3pDZxvBNEJaHnXx7nQl/OyGpT53gtc7dvsTJjM4gi0ytxs
         9ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734939132; x=1735543932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=SOAfNH4RqyUFg3J4jBc93ADPCu4J5ACQE1j8EK6Ocr29mxYd5QORyHewSHRkB9qE96
         zbjKKLjOYAmH0G5UEZDhiKRiZHYD7wEvc0PEtdpAyWNox8EdGw7g1/uqx4nJghkGy2Z7
         pYe6/xwz5a5ZVv2IkOkXG2FLghCBiYy2coS2sLM9bxigklG+Cpn2185GnFtRZpolS2SH
         vOl99n766vINfSG+Mq4ym8okP2xUJFmRABbgLFJ70cYKB2K86QvYqBvoG5wbHTlaGVd0
         Ry+um6PzOWKh3q4mYd6bOIfQzICIMxOKfEKWHCMB1d/zwCqF9lWsYe77Syb11pgtQfkL
         PzNA==
X-Forwarded-Encrypted: i=1; AJvYcCW/OJ422XAmQg73zwtMkzAl8vrcAkisrk9YD/Kji5l9BYcexLirnn48peoWS05uyO2x8MKLWLzk2KUKgkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHn8QOEHGtgWaVufr1lSDkcFJC5LHjhiQZw6+F+tLpzlq1RIB5
	w/3cHotIK0xT8umyZoav/+zlNyNaIGEpeTUC8BIp/PpVIACKhH7Qv2v6/BJGg5Z57P6CCYDw3r1
	So8uChmkMowGB1z2n/ulqUJSFEXw=
X-Gm-Gg: ASbGncu/IphHN0DDPN+0vPlZ0fYygvtyoVilUbSyX9z1O//qfM/df5oH3wNPf0LKtV5
	auXLToPzOc/W4cXo2rk8B+SJUOZUl/9Jb81dsi3g=
X-Google-Smtp-Source: AGHT+IE9Zx6rrSxmo/TfVMJEMfCSEvv5kTOAJj2WU/ZWv6yREWR2EgA4NDWJv08ZAUMMHtBOTiCxaj5H+lZ0CIJRFqw=
X-Received: by 2002:a05:690c:6e0c:b0:6ef:6b56:fb46 with SMTP id
 00721157ae682-6f3f824cb08mr87351047b3.40.1734939131915; Sun, 22 Dec 2024
 23:32:11 -0800 (PST)
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
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com> <Z2kNTjO8hXzN66bX@kernel.org>
In-Reply-To: <Z2kNTjO8hXzN66bX@kernel.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Mon, 23 Dec 2024 15:32:01 +0800
Message-ID: <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mike Rapoport <rppt@kernel.org> wrote on Monday 23 December 2024 at 15:12
>
> On Sun, Dec 22, 2024 at 07:15:37PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Changelog:
> > ----------
> > v1: initial version
> > v2: add __memblock_alloc_or_panic support panic output caller
> > v3: panic output phys_addr_t use printk's %pap
> > v4: make __memblock_alloc_or_panic out-of-line, move to memblock.c
> > v6: Fix CI compile error
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/
> > v6: Fix CI compile warinigs
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/
> > v7: add chagelog and adjust function declaration alignment format
> > ----------
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: Xi Ruoyao <xry111@xry111.site>
>
> If people commented on your patch it does not mean you should add
> Reviewed-by or Acked-by tags for them. Wait for explicit tags from the
> reviewers.

First of all, thank you for your reminder and patience. In fact, this
is the first time I received a patch discussion when submitting a
patch.
About Reviewed-by or Acked-by tags, I will not add it myself in the
future. Regarding this patch, do I need to provide a new patch to
update it? Or will you modify it?  Looking forward to your reply

>
> And don't respin that often, "Reviewers are busy people and may not get to
> your patch right away" [1].
>

OK, I will be more patient and update after confirming that there are
no more comments.

> [1] https://docs.kernel.org/process/submitting-patches.html
>
>
> --
> Sincerely yours,
> Mike.


--
Best regards,
Guo

