Return-Path: <linuxppc-dev+bounces-15074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD8CE5ADD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 02:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdpt5mqXz2xqj;
	Mon, 29 Dec 2025 12:26:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766971590;
	cv=none; b=mm/7WrQLkxCO7tmVewe7iWU5nQHc6SHMVsOiWztRZ0MfZ0IhWwmv/Ro8ZpX4mD5F1VdN/ys+MZExUjhIoITLwKH2QZLeQFIVo0emqDBCUm93RjkAvsj4NrR457oBbmgLNl3rEcTAz592J/qe2TJ3zeEaLp4IaZi+ciVsWt/bN7Q/zim2J66zriVEMrRs9hKyFDDUaOc/22fm8ri3H2JIrQh0zHJjDEWRKaewpSWrLqDzcfJZ0CjeHl3s/+Cs5wUYC7ylIRwW9HltY6gu0SR9FiuX4kYjrXZHQYUv4AiLX58qsxyAbo1+mXpkJV0QAUqDtZeL99pFgjhHoD6PuxfJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766971590; c=relaxed/relaxed;
	bh=W+mdphFdhHyow6rAPBZM50HCMYbmaBeO4dGerIc0iH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yc7hNChikkPluO08G3vaDhZ+0O9LHMUIch3OJQTG4nPk0AXhidpBiQ7nQMk8UzG0wa3EvZRFjHuZUAkMomBssQtiSld0Ec4TRYPY5lcC7A+GKiS2qFX4AnWzxAcaEgXVYLpmWgFeQLZ/z1GqZUSb0QBSRPloHfkkoRmVS3UJsQUEXWmZarnl8ezchIf7nsxfg3gtMzSAYUlgFJKMLsHvmWF5MENhFSTSDLJBHK9fFXJJCZkNgGnm37QtIlogo8vRyt7O0ZdWd5P0h8ittNTEJVX6AbzRn1NBM3BaHsz8rv9XjUZRRtQzx4Tr+1rOKrfpaOrFBccvx6wVbmZfD0SSWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZuXxQnT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZuXxQnT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfdps26wCz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 12:26:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 372E444466
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD7EC4CEFB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766971557;
	bh=QcHUIuYE7RQs56jGjmqpy2oUOjx983YRYnPBuaD4boU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KZuXxQnTWZjo6Lof5URsYlUjW0kwpYMb41Lqh7FwvUUm9w1vnlBjwPxtNvEcQ4tet
	 xmbWdsyOlecjZiWdQ3OFYCXytV323wGrcpIwVCzMSP0WxMEv4p/59MZY+eJkJWKz/9
	 rHd0dU5C4eZqkItfe0w2njo8Ppk0fIVPjJIAtf9k9mvQgTl6eAaFB3RhXp4Ouin/m2
	 8Xo6lYrybspCjJYNWuiBoY18l0zZprRiO3vj4+HjBHpxL7iGOgtyhyQVt1xe5ngKuk
	 BeergKRsgklh8YNSbG3a/Qk9qDKSXVlKWvaYLTpqByfmGWpzi+yyXyI2KK5D3PZ9XS
	 AAjY/KtRm5xHg==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso5022158f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Dec 2025 17:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmuDM+1PnSYBT8m+Wz0iREyCmMGsGRpcGEV2Z/GuIAtrLOsJGj8k2ah8cxWnCn1XNSIUhRLMDSiHt0Ub4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMintYRijx/ki4w0iKzV8OuOMPk9Rxax6cqLDXpUKp0yQH+/dz
	jRlpkGRDZv4letFbUXteHM4iEhm3aI7NegYIyR/UrRnrrlgiyXJjDiu11eH1r1MD5HFVJV23UqJ
	baThF8gkjb1r7Ki24x4nEe+A454Cjtcc=
X-Google-Smtp-Source: AGHT+IH0/4lM/7b5Nef4Fb6rn6mJpOxGdWgk9AqK9LZQSl+6Va320QICtWgPPv8KCBU6m5HaJgurTChUGp2fBhZ8S4E=
X-Received: by 2002:a05:6000:2308:b0:430:ff0c:35f9 with SMTP id
 ffacd0b85a97d-4324e50d989mr31524498f8f.48.1766971554637; Sun, 28 Dec 2025
 17:25:54 -0800 (PST)
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
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-6-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-6-rppt@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Dec 2025 09:25:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
X-Gm-Features: AQt7F2ovPXIqQiKDAgz2Iigjc3UdRKj7ty_Tsln8fN_MKzmJJ5LWRy6ejtLdRVA
Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
Subject: Re: [PATCH 05/28] csky: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Dec 28, 2025 at 8:41=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/csky/kernel/setup.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
> index e0d6ca86ea8c..8968815d93e6 100644
> --- a/arch/csky/kernel/setup.c
> +++ b/arch/csky/kernel/setup.c
> @@ -51,6 +51,14 @@ static void __init setup_initrd(void)
>  }
>  #endif
>
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +       max_zone_pfns[ZONE_NORMAL] =3D max_low_pfn;
> +#ifdef CONFIG_HIGHMEM
> +       max_zone_pfns[ZONE_HIGHMEM] =3D max_pfn;
> +#endif
> +}
> +
LGTM!

Acked-by: Guo Ren <guoren@kernel.org>

>  static void __init csky_memblock_init(void)
>  {
>         unsigned long lowmem_size =3D PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET=
_OFFSET);
> @@ -83,12 +91,9 @@ static void __init csky_memblock_init(void)
>         setup_initrd();
>  #endif
>
> -       max_zone_pfn[ZONE_NORMAL] =3D max_low_pfn;
> -
>         mmu_init(min_low_pfn, max_low_pfn);
>
>  #ifdef CONFIG_HIGHMEM
> -       max_zone_pfn[ZONE_HIGHMEM] =3D max_pfn;
>
>         highstart_pfn =3D max_low_pfn;
>         highend_pfn   =3D max_pfn;
> @@ -97,6 +102,7 @@ static void __init csky_memblock_init(void)
>
>         dma_contiguous_reserve(0);
>
> +       arch_zone_limits_init(max_zone_pfn);
>         free_area_init(max_zone_pfn);
>  }
>
> --
> 2.51.0
>


--=20
Best Regards
 Guo Ren

