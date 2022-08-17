Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582859699C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 08:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6yxd69KLz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V5KRJdow;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6yx439TBz2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V5KRJdow;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M6ywr2Fflz4x3w;
	Wed, 17 Aug 2022 16:36:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660718232;
	bh=5lvMCowArwqyA9jSE0Pt5Ze40kYbuyRJPhxadHGIwKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V5KRJdowJmJQRJnS7vKpdn3ZRXD54gk+olJ2P9NPfjmi7kMUASVQ2UXCdDQyrJ2l4
	 iCeFUua0EzB2yY0V/Z2I6yNQvrzfQPnJW1W5hxs27Vmfkv+k2UjzPlcs8lpiwhfw0s
	 rXEgyRzix9FElmstXFR+laxsxOuSRDwwsndo9tYxJEmh/ZBPqWv8VEb8et3MiTTUHN
	 x10j5udzl/wNVZu2HvSBSJ+AMCucLU+aGNDpNcmlYlO+lqwPbmi66mdTVNq3+seiCv
	 ALvJpMs3moLPQf8qL2I07gi/1+uKcpDS0UK8SnIKfeX71p9KEinWWl/Ojv6Y5XtZQh
	 hNA8dcj2NpgRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zi Yan <zi.yan@sent.com>, linux-mm@kvack.org
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to
 ARCH_FORCE_MAX_ORDER
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
References: <20220815143959.1511278-1-zi.yan@sent.com>
Date: Wed, 17 Aug 2022 16:36:57 +1000
Message-ID: <87tu6bv0ja.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: James Houghton <jthoughton@google.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, Zi Yan <ziy@nvidia.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, lin
 ux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A
 . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zi Yan <zi.yan@sent.com> writes:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
...
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
