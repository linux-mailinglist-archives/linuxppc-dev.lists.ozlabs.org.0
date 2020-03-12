Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1192183C95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:35:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkDP6N2tzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:35:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk4w6JmGzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:43 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 071591A11CE;
 Thu, 12 Mar 2020 23:28:41 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BDF3F1A11BA;
 Thu, 12 Mar 2020 23:28:40 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 2BBC640AB2; Thu, 12 Mar 2020 15:28:40 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 4/6] soc: fsl: qe: fix sparse warnings for qe_ic.c
Date: Thu, 12 Mar 2020 17:28:25 -0500
Message-Id: <20200312222827.17409-5-leoyang.li@nxp.com>
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

drivers/soc/fsl/qe/qe_ic.c:253:32: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:253:32:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:253:32:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:254:26: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:254:26:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:254:26:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:269:32: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:269:32:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:269:32:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:270:26: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:270:26:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:270:26:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:341:31: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:341:31:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:341:31:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:357:31: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:357:31:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:357:31:    got unsigned int [noderef] [usertype] <asn:2> *regs
drivers/soc/fsl/qe/qe_ic.c:450:26: warning: incorrect type in argument 1 (different base types)
drivers/soc/fsl/qe/qe_ic.c:450:26:    expected restricted __be32 [noderef] [usertype] <asn:2> *base
drivers/soc/fsl/qe/qe_ic.c:450:26:    got unsigned int [noderef] [usertype] <asn:2> *regs

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/soc/fsl/qe/qe_ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 0dd5bdb04a14..0390af999900 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -44,7 +44,7 @@
 
 struct qe_ic {
 	/* Control registers offset */
-	u32 __iomem *regs;
+	__be32 __iomem *regs;
 
 	/* The remapper for this QEIC */
 	struct irq_domain *irqhost;
-- 
2.17.1

