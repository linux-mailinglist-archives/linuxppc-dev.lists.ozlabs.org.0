Return-Path: <linuxppc-dev+bounces-12896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DDBDDA15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmljz5xDrz3clw;
	Wed, 15 Oct 2025 20:13:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760519591;
	cv=none; b=YcadMjgzE9wHAJH36vq7CL78/Xvno2tXn8RM1ZpL3sz/wnAJzX5kw5XQd/RwwAJx1Bd/2b1dUumhU6xla+FIKmOAwXA2ptMWl35V235Ry57yZLr/Y/CToKEcurJuEzUD69hGRsQICf3P8+ua1N2esNJejEYhDYFVEccU7pPZ5PXvXd9UnafN9sXGDDWqj3HEIfmYvUSW3dgAOSNI2FmKIqwTXMdcNsM2SiB0s7Tp+pRtx/LPca14gOOirZPQYJcd0nnZIIrzJ3RXui1qxSri1RveWUnW6z8Ks7Lvh8CoNy2brcO8URbLYNzzPRVuIiltaWcCK3NuuDwvZAATjs6nGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760519591; c=relaxed/relaxed;
	bh=AK5JNO+tk0EUNoLAagtlVnkvBynllSeAX1mkYPchUeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SVrymStOFThafmNRB3VzTHhzz7l/s/18zL8uh0VslkchaLgVTUBccvLiwtUYX/EOm7pKCDEuiE0byRhzTqXU5Do4QG2GmT0mDbGEPzm6aeinDxGhwKQdnXMe9wBZqioczVCNPB8p/tfIl99PYLyWK8Le+D0I22ytuecrDhuogffEjiRwaCwNk77XIp5VqvuKfKusAamm/dYqiPL1/JNRbfoq6w6ZgFwwJ7+zd2hypxiTdp2ClH+lw0dPc744WCcs8JttodIXsH5I+odaFwl4igIZuas8bQBTNs4AmYYEf+Prx+wp+vTXxX0lx81vLmClykQvgKrjY9OlC89g4SutKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T/fn/Q7E; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T/fn/Q7E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmljz09MLz3clq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:13:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D36264172E;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5DDC4CEF8;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519588;
	bh=ywR7wdHo9iJDPAMnOLxx2KSfcpdMYgaVYoeQgeEMVE0=;
	h=From:To:Cc:Subject:Date:From;
	b=T/fn/Q7Et3W/XoUP2+BW/BncjyLdn9Q59dx4I+uKrVGVx83N3CoqpvJHFxWuqRsC+
	 XdbXTMel6OirvBhxiFjPLifrL1qZ1WA1GV0CfnbnyJ0gLcqjgJlrUBUk085bytleC1
	 Ps1/U8qadzNDPEXTFtbAw3rfhPCKp+JJvyNHVNWiVzxBuTqLX4e1h0uwpfnG6FXSGu
	 ahv0t+DTPlJs6QFO33ojzLxd9DpyMUAoYg7u/ZEvqC360GdrnKWc4kvzqrKjjOzNyu
	 sfpnfCdbcfzoWkUMqnORIpnF4VZ9xrYID8Bc3PCTstBRCa5sVe3z7x9f1ejmwsSTxY
	 9ePteT4berpfg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v5 00/14] Remove DMA map_page/map_resource and their unmap callbacks
Date: Wed, 15 Oct 2025 12:12:46 +0300
Message-ID: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251015-remove-map-page-a28302e6cc7d
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is a combination of previous two steps [1, 2] to reduce
number of accesses to struct page in the code "below" DMA layer.

In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

Thanks

[1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
[2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

---
Leon Romanovsky (14):
      dma-mapping: prepare dma_map_ops to conversion to physical address
      dma-mapping: convert dummy ops to physical address mapping
      ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
      ARM: dma-mapping: Switch to physical address mapping callbacks
      xen: swiotlb: Switch to physical address mapping callbacks
      dma-mapping: remove unused mapping resource callbacks
      alpha: Convert mapping routine to rely on physical address
      MIPS/jazzdma: Provide physical address directly
      parisc: Convert DMA map_page to map_phys interface
      powerpc: Convert to physical address DMA mapping
      sparc: Use physical address DMA mapping
      x86: Use physical address for DMA mapping
      xen: swiotlb: Convert mapping routine to rely on physical address
      dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            |  48 ++++-----
 arch/arm/mm/dma-mapping.c                | 180 +++++++++----------------------
 arch/mips/jazz/jazzdma.c                 |  20 ++--
 arch/powerpc/include/asm/iommu.h         |   8 +-
 arch/powerpc/kernel/dma-iommu.c          |  22 ++--
 arch/powerpc/kernel/iommu.c              |  14 +--
 arch/powerpc/platforms/ps3/system-bus.c  |  33 +++---
 arch/powerpc/platforms/pseries/ibmebus.c |  15 +--
 arch/powerpc/platforms/pseries/vio.c     |  21 ++--
 arch/sparc/kernel/iommu.c                |  30 ++++--
 arch/sparc/kernel/pci_sun4v.c            |  31 +++---
 arch/sparc/mm/io-unit.c                  |  38 +++----
 arch/sparc/mm/iommu.c                    |  46 ++++----
 arch/x86/kernel/amd_gart_64.c            |  19 ++--
 drivers/parisc/ccio-dma.c                |  54 +++++-----
 drivers/parisc/iommu-helpers.h           |  10 +-
 drivers/parisc/sba_iommu.c               |  54 +++++-----
 drivers/xen/grant-dma-ops.c              |  20 ++--
 drivers/xen/swiotlb-xen.c                |  63 +++++------
 include/linux/dma-map-ops.h              |  14 +--
 kernel/dma/dummy.c                       |  13 ++-
 kernel/dma/mapping.c                     |  26 +----
 kernel/dma/ops_helpers.c                 |  12 ++-
 23 files changed, 361 insertions(+), 430 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251015-remove-map-page-a28302e6cc7d

Best regards,
--  
Leon Romanovsky <leon@kernel.org>


