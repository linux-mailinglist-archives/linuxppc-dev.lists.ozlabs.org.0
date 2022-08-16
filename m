Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C585964E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 23:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6lDF0w2xz3brF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NSg1bKhy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NSg1bKhy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Szr1gFRz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 21:07:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EAA696114B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 11:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545E9C4347C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660648069;
	bh=4MGnUkOgJK43wRliQHo1gFwCDv8iRH3dd6NYX9GNPIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NSg1bKhyRbmEl4xQCkeeQMXefbzYn7Fu6+yGnneTCy/Nzz6KwdPE/LppcquhYPsEC
	 /bnFkzijA2uGVC2L1WLNFVfeTiaG47nTM2mBwhDa5dkHxDhNEf/e+5AD+Pt32bExac
	 bjg0X6BhxmWeNwCjmjE66y2fzNBSo6oGRwSBj0ERZGW5WqqKKIFvMZBTV94rxf+cfp
	 cgutExjGb0R1Guj66JL73DY4pMNJlVUhUKDA9LgU/J6gvlllp8K6yxAQzN5fMDFCD1
	 z+VIBmqs3zZnMYpUQJaYqkXe07E4Nr2n54ety4NwO8ULnVzThTh4P05/qsJufqiyox
	 qwzgPq0mW2W+g==
Received: by mail-pl1-f181.google.com with SMTP id p18so8885354plr.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 04:07:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo2C59qdfBAseeVg4Nj67x9HWrQ1O/iPNnJRSdsuBbB63GDNcGpl
	LMhVF+CT0th3kzl5JcwyHrrKZayFAB63V3T3wag=
X-Google-Smtp-Source: AA6agR6jPSaNNOF5k9aH9Wvt0lAB54bLIxg5uSvrINyZxUK1+FmKqYfk1bSdzRgwlPgw75Neoa0irEIOwci8GPjPWYs=
X-Received: by 2002:a05:6102:b14:b0:38a:88dd:c169 with SMTP id
 b20-20020a0561020b1400b0038a88ddc169mr8394631vst.84.1660648058275; Tue, 16
 Aug 2022 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com> <Yvtxv2jywm3+Q3ut@arm.com>
In-Reply-To: <Yvtxv2jywm3+Q3ut@arm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 16 Aug 2022 19:07:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:48:41 +1000
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
Cc: James Houghton <jthoughton@google.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, Zi Yan <ziy@nvidia.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linu
 x-arm-kernel <linux-arm-kernel@lists.infradead.org>, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For LoongArch:

Acked-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Aug 16, 2022 at 6:30 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Aug 15, 2022 at 10:39:59AM -0400, Zi Yan wrote:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 571cc234d0b3..c6fcd8746f60 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1401,7 +1401,7 @@ config XEN
> >       help
> >         Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
> >
> > -config FORCE_MAX_ZONEORDER
> > +config ARCH_FORCE_MAX_ORDER
> >       int
> >       default "14" if ARM64_64K_PAGES
> >       default "12" if ARM64_16K_PAGES
>
> For arm64:
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
