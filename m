Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36294157F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 17:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYK6v19qfz3cfK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 01:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYK6W4XF8z3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 01:34:58 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2202D68AA6; Tue, 30 Jul 2024 17:34:51 +0200 (CEST)
Date: Tue, 30 Jul 2024 17:34:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240730153450.GA30021@lst.de>
References: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il> <202407300338.oaUo6jtB-lkp@intel.com> <20240730021208.GA8272@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730021208.GA8272@thelio-3990X>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linuxppc-dev@lists.ozlabs.org, Ramon Fried <ramon@neureality.ai>, kernel test robot <lkp@intel.com>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024 at 07:12:08PM -0700, Nathan Chancellor wrote:
> >          |             ~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~~
> >    include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
> >       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> >          |                                        ^~~~~
> >    2 warnings generated.
> 
> FWIW, this is likely a false positive due to an issue in Clang with the
> control flow graph for global variables:
> 
> https://github.com/ClangBuiltLinux/linux/issues/92
> 
> DMA_BIT_MASK() has been the biggest offender :/ If there is any way to
> refactor this code to avoid this, that would be great (as that has been
> one of our longest outstanding issues and getting it fixed in the
> compiler does not seem super easy at this point).

I have no idea what you'd want changed here, but I'll happily take
patches.

