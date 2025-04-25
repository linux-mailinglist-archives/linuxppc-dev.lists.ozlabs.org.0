Return-Path: <linuxppc-dev+bounces-7982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C5A9CAA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 15:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkYr620MSz2yrQ;
	Fri, 25 Apr 2025 23:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745588422;
	cv=none; b=Jl7ezdqbEiRAPKOom3j37zaL1U5ycWF9mfuvwUc0Y2EqALvSuQ45pR0S/sYlsNM2jFvhT6A0zFbZzfVQej4CCR7ttjUVQcj4E0ZRrykDQ0dZijSS/qpeLPUKhMEMhPuxfpgMrjE/uGrxZXmtc3sTyEs+EVJ2XFZV/hi7nDSSLKmyEljO+rIV7nq8T79dtEd2wWdVL8M0V+fT6IQM1TcGtj1kwAqjCK5BpCxgeXjOW0TslVKM8VyUsChjl7PDyWqx/9QlQhJDm1+KkvtgWBLCHpGUXhUvYoPzpy/VhGHEOcFZPhJk7Be3KCWIPy/wWkBuh7scbhfj3LdGnxF1n2eyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745588422; c=relaxed/relaxed;
	bh=CUX3iU9MlpgbAoef/RkAMF6W8R5Oxw3f36kDBjHmbhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jx5t0AbV/duk8wF72OYz6dlPvbYKha+X/rEsXNEm9IbI9/+pYr3zku1LdVx+/IC4sOW2wvgSFG9iHjZ/7cBMbT6kOENvlVbnC+OxmfaobtI6ENORYW+jkJsFXfFNXdeOxJrtK2fcimgc33UEkeC6wwIooXF2UlFNnRyvPL6OLgjVQOLfJ8e94p3Zc6nXm/nekXQlJuZCiGRI4s4siBS7j2TdDutspTtp7gR4SpPX1ltvGEIZzYOJqaqolnFCUGnuPu4MK9henO3mzEnS6M+7wXRulL64eyIG2/Q8OLCY85KiZYgCJq6SKzXWygXeo3aB7TQ6SpB7WFaFg9prXG5Khw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkYr521jsz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 23:40:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5C66168F;
	Fri, 25 Apr 2025 06:39:40 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36E233F59E;
	Fri, 25 Apr 2025 06:39:45 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Will McVicker <willmcvicker@google.com>
Subject: [PATCH] bus: fsl_mc: Fix driver_managed_dma check
Date: Fri, 25 Apr 2025 14:39:28 +0100
Message-Id: <20250425133929.646493-3-robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since it's not currently safe to take device_lock() in the IOMMU probe
path, that can race against really_probe() setting dev->driver before
attempting to bind. The race itself isn't so bad, since we're only
concerned with dereferencing dev->driver itself anyway, but sadly my
attempt to implement the check with minimal churn leads to a kind of
TOCTOU issue, where dev->driver becomes valid after to_fsl_mc_driver(NULL)
is already computed, and thus the check fails to work as intended.

Will and I both hit this with the platform bus, but the pattern here is
the same, so fix it for correctness too.

Reported-by: Will McVicker <willmcvicker@google.com>
Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index a8be8cf246fb..67031136ef66 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -139,9 +139,9 @@ static int fsl_mc_bus_uevent(const struct device *dev, struct kobj_uevent_env *e
 
 static int fsl_mc_dma_configure(struct device *dev)
 {
+	const struct device_driver *drv = READ_ONCE(dev->driver);
 	struct device *dma_dev = dev;
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
 	u32 input_id = mc_dev->icid;
 	int ret;
 
@@ -153,8 +153,8 @@ static int fsl_mc_dma_configure(struct device *dev)
 	else
 		ret = acpi_dma_configure_id(dev, DEV_DMA_COHERENT, &input_id);
 
-	/* @mc_drv may not be valid when we're called from the IOMMU layer */
-	if (!ret && dev->driver && !mc_drv->driver_managed_dma) {
+	/* @drv may not be valid when we're called from the IOMMU layer */
+	if (!ret && drv && !to_fsl_mc_driver(drv)->driver_managed_dma) {
 		ret = iommu_device_use_default_domain(dev);
 		if (ret)
 			arch_teardown_dma_ops(dev);
-- 
2.39.2.101.g768bb238c484.dirty


