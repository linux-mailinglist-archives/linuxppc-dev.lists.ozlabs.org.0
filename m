Return-Path: <linuxppc-dev+bounces-636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F3961F24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtvDq3GSHz2yXm;
	Wed, 28 Aug 2024 16:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724825483;
	cv=none; b=Dyp2lyODLPZYI91Zyq79pKExeY8eocIRRxMDhzybVrjavInwIyQu1Y6ilpvz4kzNDFOR0DkvLT04sdScG6BqktP0rEICwcFgL1lyxbqV5YLzuZBmOrb19npbmes5F0kmr0WNHWWt58QN7lFeQnkmsuAnpLn7ex0TJ0wd2ESEIlKtPa5Fp2Tj7rwu+z0VfsFhpUTaU3FuSvm6KfFMZqtv7dAqMpUQKTgJelXjxVC8F8c0qqfwORvJ12q6G/KuyqLAiqDIIO+vM/VdMTZvAnyaQzirAzp7qJg4UzbyKcATSUbynHkYanwtZFE6wpRVPVyxiXQ3pLLXZbmkyg0HOKjuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724825483; c=relaxed/relaxed;
	bh=xXPvEjkN13oRSPiD1VpIsI6lICkEOhwDSVN6M4ebF3M=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SRS-Rewrite; b=MGpnAuTkv/5MnbpQRGBU2IJ/RXVjyIxETjnbS79QMVZHbvCfHUPbtVZrOvB992HN8aBzZ2GJ0lJkBDuMJnaHzV9vHYLIrfDYHdR/5mhgojPuHb4+GyiFD854FCgSLxc7G61soCKqDw3nP6/11PU5m94C6l32POyrSkM8eRQn/giYdUhqOYDwUJtHzJ5/kp0SawRA6GWxLynMH8/JYK3pu43aLSz2J1FoUTJxi3GWJ5G0tj9GGXYSzehI+cvTm3p9YXPdz+1lFRGSdTDNdIijjMD+8HmQJBuqAppJIQjLgf9dAG53I7YsPn+JnlbymMF1Y1VsNx1IvLl77lh6BEeaUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+4c6678e563c2e29e76cf+7675+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtvDj50T8z2xtQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:11:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=xXPvEjkN13oRSPiD1VpIsI6lICkEOhwDSVN6M4ebF3M=; b=G6ceizxaxo/5YPTjysre3RE3P5
	r6theemKFI6tHVBOtljvn4KkqxAS2QAOgq2kFNqL/qSweoZ78GG5roeidLnOxQYaFwBGFSvMgjIxT
	Nd3VjlhZeAlYoMTPJ/A+LgEVZKiJo8/6vpC94GKnxo/yeszqxNmOI2uH+gYkKm6wByymb+IQbHgRs
	lDgiPm0CITsg8ivicn6DOIMDexltTWRjLyX7eFt13Mh7KXkquOY+RUG+jycl2hgcaS99zex+kd+o9
	eIbY6ta0tPyXUDbcb5Au2QNiyOxW5yX9stCLkEzWH5+UibAoch+LaUcS6z8gLwS5pfwAXC+wswjoI
	AbBwVQ3w==;
Received: from [2001:4bb8:2dc:a2cd:2ccf:8fbe:8ab4:c9db] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBtg-0000000E1uh-0axG;
	Wed, 28 Aug 2024 06:11:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-media@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] vdpa_sim: don't select DMA_OPS
Date: Wed, 28 Aug 2024 09:10:28 +0300
Message-ID: <20240828061104.1925127-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

vdpa_sim has been fixed to not override the dma_map_ops in commit
6c3d329e6486 ("vdpa_sim: get rid of DMA ops"), so don't select the
symbol and don't depend on HAS_DMA.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vdpa/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 5265d09fc1c409..b08de3b7706109 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -11,8 +11,7 @@ if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator core"
-	depends on RUNTIME_TESTING_MENU && HAS_DMA
-	select DMA_OPS
+	depends on RUNTIME_TESTING_MENU
 	select VHOST_RING
 	select IOMMU_IOVA
 	help
-- 
2.43.0


