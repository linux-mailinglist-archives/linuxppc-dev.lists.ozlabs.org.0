Return-Path: <linuxppc-dev+bounces-10641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACDAB1B007
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 10:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx5lY2gWHz3bh6;
	Tue,  5 Aug 2025 18:13:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754381593;
	cv=none; b=BNVjzW4OcI3oQ3Z3WQDchRMdqc/apz/e0QbV5GC8MeROCGDXCwvLGdrUH110OWtjusybIGHdhZORdQ2pVHxzhMHitwS1q0fuWBL6efY6xYJoWcxxuiHQRGC0bPAWZK3zemyymwazV1SmXWk3kgxmJEDflCd5QAz4bKPi0ZdJgXZ9EjRxTibmAgy32K9rNZsTmZpBtFzj4t5PHTYRuhbwdcJJ/LyDqST6LJyFJ+roXXpRCDupTxuikT3lzqejWVA84uo2TrOzcT9si1ZSy/FWkRWRgt7RwTPf1V06VKLbu53oecZugkyprt4wbliVdlm2Gx5ctlhCg16oWaksPaZLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754381593; c=relaxed/relaxed;
	bh=FYbREyEF6GDi+6BqzkUaervyY8mSRtfMj7JERduR6Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGlrFK8IBFE3e3QNBEZZWtn/uZ1Xr/7afTFUmQ3ZwpNaVbYpyqYu+rYLVb/jt//Kev81IwoRjkf91PgJjWnfI/ul3otoiqEbxvyZhdGSUUYXic1NyUK+8HA7RA3mTSoG8i/ao4DD4z++kh2192pR6dVX2HrqpjG6fPvYthIKjyY1V55jlwLyPaC04gbV8cMO/MI3dTN9ORUU2zP67x5orNvzNW2p7o25NHLcSzPlBKo23Re2Th2fD+zOqc3XuGf8WGi+wy5twrdjMORaRI8XSlvb3iP/blhs3o9BRVAJ0Mem1YAKAcK/PutNYwA8vrpsdCG9/Ke6UePDGRSj8VgOUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx5lW4PP3z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 18:13:10 +1000 (AEST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5397c00ad9eso538216e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 01:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381588; x=1754986388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYbREyEF6GDi+6BqzkUaervyY8mSRtfMj7JERduR6Tc=;
        b=QzyfwVE6o48Xc6usgfgUByO29Ep9n7+eDzlVSXBWl2Tx3ah1OqCGIb3/+KYLXTg/n7
         T0pWvKyp43ZOIYqRv7R/UA1j2Y6YOe3xivAL1dh/7X47FfNGYSz3Dx6+Esn9/W9lPJXt
         GKZAuJKHtjo591y/ZgnznAQrklDwFUJRMEi5UuybNY0jDq1SazoMywgGtlMLRITFTpyY
         S1j5prSrJvbqNfBQgb0q+GrhSgO1Sj/PDQq9f/KvqXuYoWElC490giafT8cYlKw9yMtJ
         7eCk79WnVCh3w4lRxyRxfOlWdnxS2LKy6I/wpslfP31+KUTuYBO8g1LP530AdHd3kt2G
         AMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV52au0JXRYY8vhtfeHrRsOHljIgSoD1B55Q2ir1/UyqrOnuJyKEF8LH1Latlwik4MkTiU44ynBcwKE6rk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy89HwordcZJTY3pX6GZLRHob4IXvVgQMZxkcUXy0x8cr04tzFA
	/abiFd5sVzf564CzPFglyk+SgdqELvOH3nh3UUILim29eL5n7Hu3+zNWay5ILcQs
X-Gm-Gg: ASbGncu121v0wT728VAq1GifZlIB1DMMshrR+fV0AiPJmQD7vQH55YbVuNobFCBMP9g
	yqDqBctpqpKG5mdYFH2zyIKg+3T8paBQ7nlV9Jo+P9UjC3m+OSAjv4NQq6khip341Y9EufDzk49
	85feN9ch4Ek93PA0lSGdr/s+3UwcQcXcoVduxzQOTK8nL3OSVWNp3Kti53fF3kVkPpEDK8W2OM+
	Gu6qpP6heROK3tCv+voSwbTT35tWA7lsXBjl3sXnIF8C3wbreYbRONnROg8W80sbp4dQRaHzFo7
	0gxs7oXu1ei3sB4CexbQ2h3hSZzml+fTgcvaRHqK0zAwFQK0y354ojuQ34M9Vunw2UtqhTSro5m
	xbWjI0k1Ixg19VzG7ws1AkNKqUFGzH1wlc/iu/A6CeZt3xUEhD15yuOS2E4cC
X-Google-Smtp-Source: AGHT+IEi8+OQRgR/a5RZQE6QdqpYNge2H/5zOdKixm/XkanD0mH59MnzRbhtjbhTYQx79im2xBNdHg==
X-Received: by 2002:a05:6122:30ac:b0:531:45f1:604d with SMTP id 71dfb90a1353d-5395f2ae17amr5140910e0c.6.1754381587987;
        Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936cb4c27sm3315443e0c.21.2025.08.05.01.13.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88bbfe763ecso1192578241.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVshLnX1STOpvzY4odP1jXdjNzHw12o2KSCFTLD9uBd6gpC73qcuVzemSQY93eBOthc2LJMAa2Gig90BO0=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3a0b:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4fdc480dc77mr4806207137.21.1754381587163; Tue, 05 Aug 2025
 01:13:07 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250804163910.work.929-kees@kernel.org> <20250804164417.1612371-11-kees@kernel.org>
In-Reply-To: <20250804164417.1612371-11-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Aug 2025 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
X-Gm-Features: Ac12FXxoASDmKZziFEtov1BZOWBk9xds-hH6z1CBqhINtQO4YVRNUk0c1YQzJUM
Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
Subject: Re: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 4 Aug 2025 at 18:44, Kees Cook <kees@kernel.org> wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> Add missing __attribute_const__ annotations to M68K's implementations
> of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
> pure mathematical functions that always return the same result for
> the same input with no side effects, making them eligible for compiler
> optimization.
>
> Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

# ffs: pass:9 fail:0 skip:0 total:9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

