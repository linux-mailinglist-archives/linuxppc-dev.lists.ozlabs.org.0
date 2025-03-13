Return-Path: <linuxppc-dev+bounces-6976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0537A5F9C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 16:26:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDBDq1bTGz3c9w;
	Fri, 14 Mar 2025 02:26:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741879611;
	cv=none; b=YHlYQA81AydCXaQG1bk0y61fxbcO0cWW1mVVwD5Hn57a9NfMlDCP02A5Pb1fgw9Thb+EhufmOX/lMiIhhXNwUiOuyytGk+GaUge56KcoE41FdNiOdbSsSgm8UgZM9liix+1EzBgRZiNAwQLdEivOR3qm/reOqWIiSNHjYzu/QlGrko97sEBA84V9zkZeSqcM43jZGW7eqUdo4/AsyyT8jSX46on328b6Cml3slZM7hgP4W9o7RAWEP1YqxV81tVmN33uCsbXKOUWeruFIOa9gqovTfD50w3lCBipwWQKUwu81NVBZZ0ecn21Q3xrzgiNeDFcQTpWlSejS8fx7XYwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741879611; c=relaxed/relaxed;
	bh=1ii1IFZdoC6n5uv3UgvYeObshpXYt3dV3HzZ5zG8DvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO4pK5iLyLUzgqS1smKm4LIqpg6t1d2n3csrGFYBlktDZyXiTb8QGz0qOOwwMlFQSXg4scQ2oZ4s8QamuQRWDrr1Skr8Ojh7j19nyS7oGciMjgqEzWupNcQfSJ1AFCIB502JUW40s9rwMXissZ9d+2pmLSEgKdUUAaFlYdUdkt5Mvv0X6/xFgKyEnYwsrHmH6fBB0E47PbdBGmN3/5BHz2wcgLIoKNEjE3yzgFjbqPVMfFaLofeY9VDlUsK5W8x7VGabki3z5BBz2OP0W/a9ugpEPJx+RJgwMczh/Se09MB9/5z0uQSxiCKW+Js1UMryfGypNwxXvgQ2mmrDWTgIeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDBDn2JTXz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 02:26:48 +1100 (AEDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so4137443a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 08:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879604; x=1742484404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ii1IFZdoC6n5uv3UgvYeObshpXYt3dV3HzZ5zG8DvA=;
        b=t5Noo+x0+7Uzxg/0SpsuFivCW55nkkBIGFMqtbAg41iYde/METPqKyNsR2L4sCkfif
         pmaNy/IhjQ6bII+WN7ssM/tUXwcrbw1m3HznyOPzLYcyx41ZRV/0BK7bEOht7vO5Fr33
         bmkRSPOOFYgKTvzaF3PosmZ85c3jc1/q7+ATzAyTCgtGFtW0DFp2dx5JU8FankegJ5zc
         vvT4NCNFMO1vYoyodJd3V0RLA1tsJ9RRqA6CTXV4BJvS0Tk2r92JE3C/Qed5Qty4mZ1b
         HBNgyKsfdHhatmw23fZHtUgz42Zri+uY9ouZA5vkVLmWvlv97plRjg7rgvmdekQuSn4R
         LzWg==
X-Forwarded-Encrypted: i=1; AJvYcCXjygb9A0s1LuW7IJWMrKGppmbvrBTTeHh3JbwwHxTdbQLcUxc1s3PnCfyvg4Zv4fbG3NYqo5Cz+5YW2Yk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsZ4JeA0R54HegZyYLFbROL7EgvvcqGyW/k6/Tp0TIcq6P8bqI
	fl9IZUX0WUaNcqB/3kirHV8YF8WOMX2oh4TZvwFkKOyBx4nlEpJLMH0eLgyLhK0=
X-Gm-Gg: ASbGnctf8ZbMW5zV07j6kx1V6/HqK2LmKOHMLawwD+T7JWH8bwLD6NiZsIH92G1YqLh
	dgUIjB9Is7Yth6pXDey+upldj42DTaJPilQeBVF5E3TLU0M54du6s2A65MkTtVmIqaSKS2IcS6P
	WKHt0jwrbYSZRiReuUlt1KKzxAdSXaXo4k+0pGrCyLZ/fIC2nYxTVGO/9+p6Jkk+V4dG1QlIaqV
	/Iq7MYX2AsJjQ6LPMoQBCRDUN0o1p2rVyEi8vEwyvDkiDU+qJbQgGIfzTOfWRGcpSRihIFf5Fr5
	HbuXd0JZoqMnvfc7UYoWubv0jPCCCYLUwuPsip1V5QTLnGeNtmk4TMSt+QwOzXBv6NgagzOsBhb
	Nn6MFbSI=
X-Google-Smtp-Source: AGHT+IGerm4HS0GZkRklhgpFWYMQmzHudTyLko8izWBnTIVlklXCEhadE4AoThkA585F7zD/QwnKPg==
X-Received: by 2002:a17:907:3da1:b0:ac2:b2b5:40ce with SMTP id a640c23a62f3a-ac31237416bmr352050766b.13.1741879604417;
        Thu, 13 Mar 2025 08:26:44 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9bb0sm92093966b.47.2025.03.13.08.26.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:26:43 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so2113657a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 08:26:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFBu6rj7nqaW7RbxKneo/oQpAksXPUx4fuuxG3ADkctqRVUFuL6zpvZC6Cl5f1vZLNmSpNSV2Of3HA3So=@lists.ozlabs.org
X-Received: by 2002:a17:907:9626:b0:ac3:d1c:89ce with SMTP id
 a640c23a62f3a-ac312305664mr252326866b.9.1741879178133; Thu, 13 Mar 2025
 08:19:38 -0700 (PDT)
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
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-14-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 16:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9qHWq5jtnIT3-BmFGhQQ_nRM0uVNr9PeQK5Y9eEomJSZyndfwbc1wpbs
Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
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
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> The point where the memory is released from memblock to the buddy allocator
> is hidden inside arch-specific mem_init()s and the call to
> memblock_free_all() is needlessly duplicated in every artiste cure and
> after introduction of arch_mm_preinit() hook, mem_init() implementation on
> many architecture only contains the call to memblock_free_all().
>
> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> relevant architectures to make it more explicit where the free memory is
> released from memblock to the buddy allocator and to reduce code
> duplication in architecture specific code.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/mm/init.c          |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

