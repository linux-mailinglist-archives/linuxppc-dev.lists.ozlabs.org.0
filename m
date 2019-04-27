Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 571FDB307
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 09:12:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rhvQ6G70zDqbW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 17:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rhsF5TFdzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 17:10:39 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4FBB8200081;
 Sat, 27 Apr 2019 09:10:35 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41E36200055;
 Sat, 27 Apr 2019 09:10:35 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net
 (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B5345205ED;
 Sat, 27 Apr 2019 09:10:34 +0200 (CEST)
From: laurentiu.tudor@nxp.com
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, roy.pledge@nxp.com,
 camelia.groza@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v2 0/9] Prerequisites for NXP LS104xA SMMU enablement
Date: Sat, 27 Apr 2019 10:10:22 +0300
Message-Id: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

This patch series contains several fixes in preparation for SMMU
support on NXP LS1043A and LS1046A chips. Once these get picked up,
I'll submit the actual SMMU enablement patches consisting in the
required device tree changes.

This patch series contains only part of the previously submitted one,
(including also the device tree changes) available here:

    https://patchwork.kernel.org/cover/10634443/

Changes in v2:
 - dropped patches dealing with mapping reserved memory in iommu
 - changed logic for qman portal probe status (Leo)
 - moved "#ifdef CONFIG_PAMU" in header file (Leo)
 - rebased on v5.1.0-rc5

Laurentiu Tudor (9):
  soc/fsl/qman: fixup liodns only on ppc targets
  soc/fsl/qbman_portals: add APIs to retrieve the probing status
  fsl/fman: backup and restore ICID registers
  fsl/fman: add API to get the device behind a fman port
  dpaa_eth: defer probing after qbman
  dpaa_eth: base dma mappings on the fman rx port
  dpaa_eth: fix iova handling for contiguous frames
  dpaa_eth: fix iova handling for sg frames
  dpaa_eth: fix SG frame cleanup

 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 136 ++++++++++++------
 drivers/net/ethernet/freescale/fman/fman.c    |  35 ++++-
 drivers/net/ethernet/freescale/fman/fman.h    |   4 +
 .../net/ethernet/freescale/fman/fman_port.c   |  14 ++
 .../net/ethernet/freescale/fman/fman_port.h   |   2 +
 drivers/soc/fsl/qbman/bman_portal.c           |  20 ++-
 drivers/soc/fsl/qbman/qman_ccsr.c             |   2 +-
 drivers/soc/fsl/qbman/qman_portal.c           |  21 ++-
 drivers/soc/fsl/qbman/qman_priv.h             |   9 +-
 include/soc/fsl/bman.h                        |   8 ++
 include/soc/fsl/qman.h                        |   9 ++
 11 files changed, 202 insertions(+), 58 deletions(-)

-- 
2.17.1

