Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A013B183CAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:40:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkLV5vjTzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:40:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk503WB3zDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:52 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4258E1A11CF;
 Thu, 12 Mar 2020 23:28:41 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0304B1A11CB;
 Thu, 12 Mar 2020 23:28:41 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 762B440BCF; Thu, 12 Mar 2020 15:28:40 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 5/6] soc: fsl: qe: fix sparse warnings for ucc_fast.c
Date: Thu, 12 Mar 2020 17:28:26 -0500
Message-Id: <20200312222827.17409-6-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
In-Reply-To: <20200312222827.17409-1-leoyang.li@nxp.com>
References: <20200312222827.17409-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following sparse warnings:

drivers/soc/fsl/qe/ucc_fast.c:218:22: warning: incorrect type in assignment (different base types)
drivers/soc/fsl/qe/ucc_fast.c:218:22:    expected unsigned int [noderef] [usertype] <asn:2> *p_ucce
drivers/soc/fsl/qe/ucc_fast.c:218:22:    got restricted __be32 [noderef] <asn:2> *
drivers/soc/fsl/qe/ucc_fast.c:219:22: warning: incorrect type in assignment (different base types)
drivers/soc/fsl/qe/ucc_fast.c:219:22:    expected unsigned int [noderef] [usertype] <asn:2> *p_uccm
drivers/soc/fsl/qe/ucc_fast.c:219:22:    got restricted __be32 [noderef] <asn:2> *

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 include/soc/fsl/qe/ucc_fast.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/soc/fsl/qe/ucc_fast.h b/include/soc/fsl/qe/ucc_fast.h
index ba0e838f962a..dc4e79468094 100644
--- a/include/soc/fsl/qe/ucc_fast.h
+++ b/include/soc/fsl/qe/ucc_fast.h
@@ -178,10 +178,10 @@ struct ucc_fast_info {
 struct ucc_fast_private {
 	struct ucc_fast_info *uf_info;
 	struct ucc_fast __iomem *uf_regs; /* a pointer to the UCC regs. */
-	u32 __iomem *p_ucce;	/* a pointer to the event register in memory. */
-	u32 __iomem *p_uccm;	/* a pointer to the mask register in memory. */
+	__be32 __iomem *p_ucce;	/* a pointer to the event register in memory. */
+	__be32 __iomem *p_uccm;	/* a pointer to the mask register in memory. */
 #ifdef CONFIG_UGETH_TX_ON_DEMAND
-	u16 __iomem *p_utodr;	/* pointer to the transmit on demand register */
+	__be16 __iomem *p_utodr;/* pointer to the transmit on demand register */
 #endif
 	int enabled_tx;		/* Whether channel is enabled for Tx (ENT) */
 	int enabled_rx;		/* Whether channel is enabled for Rx (ENR) */
-- 
2.17.1

