Return-Path: <linuxppc-dev+bounces-12519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4CEB92588
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 19:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVqK522s1z2yr1;
	Tue, 23 Sep 2025 03:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758560809;
	cv=none; b=a2f/xeU5w6RiEgKmoYexde5xYSNnqcjmlu/YZc2y51qk/rur4Q4/2qmOOV98l9tKkUJAnd5T9bRlhn4UXI7tnhE/hLwmikL03SrhRoFvLyrR6JmcYKnb9luDAJ11YcvuuBtX8xXb1gCU/me9LeG9a7yAy86qc8r2Z/SFqCj/AEyB8Yz9dtUw/GUXLSw3hqZ7dFZOL1QXXmH7ljwcnQaD6r2irgZMseSQkJpT1KCH+VpJ3SBLetU1E+px6MDXEDO055qLfocUSURIrkzSlGPFqLnD+rwtSsZUopxg5CXUOdpcjY9BFQCvowPmtM6YmUWQjY2rxIq/eRyiDWNgMyQ3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758560809; c=relaxed/relaxed;
	bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGv90iZYA58s7nOa6up2bmrcMRPYUJowEzUZIz8y2DVg+lIcFtGYc6QwLvnwnQ6lvvP6aIA5ltKKsg5arIbZ0q5BGiJ5a/k8yuPqQo3eQI8mHzwjV1MMzaC621U/71A+h0oWeMkBA12jlcrmEdGPzv5g2wB8TvZ6FD9YN8KQEP9HykDZFV5TLljlj+lmprS247lDEw9VKoQHqbyMyHuDEesmUDYUNQKEauj1PLUd87eNHmwk3j1MOT8R22mjei5a6TtfvHpwsSXhgNg31J3pxoCXQptMub4h06S0h4KoAwa4aisdGeuzVvtcD3NlycuEgjMEuQX1ohKQIlcGtgK7VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr; dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sdw/L1Es; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org) smtp.mailfrom=freebox.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sdw/L1Es;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebox.fr (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVqK310vLz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 03:06:45 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57eef777d3eso1128218e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758560800; x=1759165600; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=sdw/L1Es0SiDUcIwEi0ryM8XWoor4t5xpp8afyEf+nmCUbZrvFLYZQk+bDt3BeCuT1
         uunli+ZfRhch3sgoyLrCID4hQ8BhiHi2gbEBxFsjBnaQzxGUPPWQyFqEYcgPYyPnF/lW
         l+lYvQ8mf8+x5sqqbUudx/F8fMr+95RtpX3vjnTilXe1ONbsEC9Q/+T967a4oYY5ux+p
         miz98jng3c343xyjxKgALXDuAZt+FVulJfbr6xhEiMZ1CoRcqOjE2jf2+Rbt5M0YoMxG
         dHzDkWVJh784X4cWLGwJv53zElThdQ3b6VzY8T847ByC+ndoFHbPu2eeC2MokgPt2hds
         5hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758560800; x=1759165600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=o88yYXhKCujfnCO0QIpFqbQujVODJEA+yPUtMFS8IMbg4g+HvqKPYyqDkmrJc8Ea9b
         McG+8Dq5tw2LRpvTwyP9UK+PQkiDEl5/Dy9gSSu9a8iSffphQ4dvNdndqsBYbNlzcnaz
         0yvzqSVHqEjxWhc2FZHnfxuWS/dSUUxmccOvxbxDeLGhk4IVQoeddriz4w2mBCsJywV/
         +ob/Nnsb7OWsv7GFHevFsWlB787dyFK66cre8D/KOnF2qBu2Tir0VumySK0RgfIV5oKp
         ZBLzLjJfZfRsQMr3sQc4TBPNzOuCqejHJBrAnccmsTntfqb8UFSaUCZtVLHWtbZWf6wR
         G2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUJBJV5wUL/BFx25jYVJdxjsRNPJO95d0orTF5fSQSCcB22cejWXL24Axj3oZPkAHgr5CeckfiPuFZp1rk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywy6s9W9TbVap3d1WUkD+7CUU5ed0AHlHnPOZ6bVTO4KEnF+R08
	+/oP4hb9MUGDLVVomwC0bxb7B39KjVWJI4g0dRpSGLua+/JWi/rfRQDGUHCM4LnTWTvrz3UEtyS
	aHK3HKY6ZgyKh6HGcXx1IlfECkUmJu+rKZgZqvNnRxA==
X-Gm-Gg: ASbGncu35ayrti9qnQSKPJWutXBV565BPaaZNyWYvL9ufTDXKO8JSLoDIal86kUdHT/
	gagdBtBL04LPUGNyl1kCRpEBZlZqLl53TXD3kRpt9eQQuUlwHQjmC7zzzO0UydhniA12vbwvK0a
	7m6wooJ07XC8mv+4svOSDXUnSf/x7JGdFqXm6FQzNqW+rSkhEtDf8b5gFr1hI+C0Akdp3OhszHu
	dyD
X-Google-Smtp-Source: AGHT+IGGtpp1dzmc7QwuqgW2pSLIm4mtcBhZLeu+2i3+Ni9prtVcG/n56U1c5SPCEyTQDr/U3BLl49JsojBTLduSacs=
X-Received: by 2002:a05:6512:4013:b0:57b:aff6:68a2 with SMTP id
 2adb3069b0e04-57baff66a5amr2706206e87.26.1758560800251; Mon, 22 Sep 2025
 10:06:40 -0700 (PDT)
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
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com> <20250919143436.GC2132010@nvidia.com>
 <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
In-Reply-To: <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 22 Sep 2025 19:05:49 +0200
X-Gm-Features: AS18NWDJSAue7YE7c8rlG0jvR5lve033dTh_Rnu2Tx6e392cgPO_ZPu-mU9r2No
Message-ID: <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	imx@lists.linux.dev, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
> > On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
[...]
> > I am right it sounds like we can drop vivt cache support with highmem?
> > vivt is alot easier to understand if kmap isn't running around
> > creating virtual addresses aliases!
>
> I think so, yes. I've prototyped a patch for it to add a dependency
> on !VIVT and the drop the code paths that are clearly no longer
> needed without it. This obviously needs proper testing, but the
> diffstat is promising:
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f14bac913d50..0a31cfaf3818 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1214,6 +1214,7 @@ config ARCH_SPARSEMEM_ENABLE
>  config HIGHMEM
>         bool "High Memory Support"
>         depends on MMU
> +       depends on !CPU_CACHE_VIVT
>         select KMAP_LOCAL
>         select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
>         help
>  arch/arm/Kconfig                    |  1 +
>  arch/arm/configs/gemini_defconfig   |  1 -
>  arch/arm/configs/multi_v5_defconfig |  1 -
>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>  arch/arm/include/asm/highmem.h      | 56 +-----------------------
>  arch/arm/mm/cache-feroceon-l2.c     | 31 +------------
>  arch/arm/mm/cache-xsc3l2.c          | 47 +++-----------------
>  arch/arm/mm/dma-mapping.c           | 14 ++----
>  arch/arm/mm/flush.c                 | 19 ++------
>  mm/highmem.c                        | 86 +++++--------------------------------
>  10 files changed, 27 insertions(+), 230 deletions(-)
>
> I did get an email from Nicolas Schichan (added to Cc here),
> and he is still supporting a widely deployed Kirkwood based
> platform that uses 1GB RAM configurations. He should get
> a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
> would expect that to continue working, possibly with minor
> bugfixes.

Hello Arnd,

We don't use HIGMEM on our Kirkwood platform, we are happy using a
2G/2G WMSPLIT. We don't need a lot of virtual address space for
userland, and with the 2G split we don't waste physical memory.

I'm happy to test your patch serie with VMSPLIT_3G_OPT and see if it
still boots with it once you send it.

Regards,

-- 
Nicolas Schichan

