Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A4C943EA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 03:25:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVZIR7ZC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZB8w2Ml8z3bvP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 11:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVZIR7ZC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZB8F2Sl3z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 11:24:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1F11CE17FD;
	Thu,  1 Aug 2024 01:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD22C116B1;
	Thu,  1 Aug 2024 01:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722475467;
	bh=Pgpqo4RtxVJ1ue8DwjL2l0l2UL9ejI31ZTKHWsBrk4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVZIR7ZCGTG0w41hQSmLUNL6cZMuc0xp588STEletZW6rGg2Zw5ATIgyJNDcnVReb
	 B3EfWzjWskItTFqdGEFqKaNkyGttT9TLBlQWyu/w8Tuxs0k3bHkwZd0cu+hd+HJiBM
	 TLWeLNnPzjvU1idP/yzgeefl8ZzJqv2fdNIoFW2QL9yRXpPiUWdGcYIxH9/tq99yFQ
	 xlNDkZrz9RPWiLvSDiSFXG1SG7k6RBe2KkK8hixvDn+6BA8ozx+ajPaXfsgWLA8nel
	 7BEThuYora+MdjBceQZNxXOF5muIGxkG3oYUZNn0HCWNcoz+pncWSlk+9RsOGJ4U29
	 oEus3plyggpmg==
Date: Wed, 31 Jul 2024 18:24:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240801012424.GA1640480@thelio-3990X>
References: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
 <202407300338.oaUo6jtB-lkp@intel.com>
 <20240730021208.GA8272@thelio-3990X>
 <20240730153450.GA30021@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730153450.GA30021@lst.de>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, linuxppc-dev@lists.ozlabs.org, Ramon Fried <ramon@neureality.ai>, kernel test robot <lkp@intel.com>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024 at 05:34:50PM +0200, Christoph Hellwig wrote:
> On Mon, Jul 29, 2024 at 07:12:08PM -0700, Nathan Chancellor wrote:
> > >          |             ~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~~
> > >    include/linux/dma-mapping.h:77:40: note: expanded from macro 'DMA_BIT_MASK'
> > >       77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
> > >          |                                        ^~~~~
> > >    2 warnings generated.
> > 
> > FWIW, this is likely a false positive due to an issue in Clang with the
> > control flow graph for global variables:
> > 
> > https://github.com/ClangBuiltLinux/linux/issues/92
> > 
> > DMA_BIT_MASK() has been the biggest offender :/ If there is any way to
> > refactor this code to avoid this, that would be great (as that has been
> > one of our longest outstanding issues and getting it fixed in the
> > compiler does not seem super easy at this point).
> 
> I have no idea what you'd want changed here, but I'll happily take
> patches.

Unfortunately, I am not sure either... I do not see anything obviously,
so perhaps it could just be avoided with the __diag() infrastructure?

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 3dbc0b89d6fb..b58e7eb9c8f1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -20,7 +20,12 @@
  * it for entirely different regions. In that case the arch code needs to
  * override the variable below for dma-direct to work properly.
  */
+__diag_push();
+__diag_ignore(clang, 13, "-Wconstant-conversion",
+	      "Clang incorrectly thinks the n == 64 case in DMA_BIT_MASK() can happen here,"
+	      "which would truncate with a 32-bit phys_addr_t");
 phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
+__diag_pop();
 
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
