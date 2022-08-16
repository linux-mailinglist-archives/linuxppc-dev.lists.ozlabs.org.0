Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E13595843
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 12:31:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6S9L366Pz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 20:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6S8t5D2Qz3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 20:30:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3D9260989;
	Tue, 16 Aug 2022 10:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9BDC433C1;
	Tue, 16 Aug 2022 10:30:27 +0000 (UTC)
Date: Tue, 16 Aug 2022 11:30:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to
 ARCH_FORCE_MAX_ORDER
Message-ID: <Yvtxv2jywm3+Q3ut@arm.com>
References: <20220815143959.1511278-1-zi.yan@sent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
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
Cc: James Houghton <jthoughton@google.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Qin Jian <qin
 jian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 10:39:59AM -0400, Zi Yan wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 571cc234d0b3..c6fcd8746f60 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1401,7 +1401,7 @@ config XEN
>  	help
>  	  Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
>  
> -config FORCE_MAX_ZONEORDER
> +config ARCH_FORCE_MAX_ORDER
>  	int
>  	default "14" if ARM64_64K_PAGES
>  	default "12" if ARM64_16K_PAGES

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
