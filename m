Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D6183C9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:37:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkGJ0wD3zDqjc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:36:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk4w6FkxzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:43 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B4CDA1A11AF;
 Thu, 12 Mar 2020 23:28:40 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 76B601A11CD;
 Thu, 12 Mar 2020 23:28:40 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 C9D9740A63; Thu, 12 Mar 2020 15:28:39 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 3/6] soc: fsl: qe: fix sparse warnings for ucc.c
Date: Thu, 12 Mar 2020 17:28:24 -0500
Message-Id: <20200312222827.17409-4-leoyang.li@nxp.com>
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

drivers/soc/fsl/qe/ucc.c:637:20: warning: incorrect type in assignment (different address spaces)
drivers/soc/fsl/qe/ucc.c:637:20:    expected struct qe_mux *qe_mux_reg
drivers/soc/fsl/qe/ucc.c:637:20:    got struct qe_mux [noderef] <asn:2> *
drivers/soc/fsl/qe/ucc.c:652:9: warning: incorrect type in argument 1 (different address spaces)
drivers/soc/fsl/qe/ucc.c:652:9:    expected void const volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc.c:652:9:    got restricted __be32 *
drivers/soc/fsl/qe/ucc.c:652:9: warning: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/ucc.c:652:9:    expected void volatile [noderef] <asn:2> *addr
drivers/soc/fsl/qe/ucc.c:652:9:    got restricted __be32 *

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/soc/fsl/qe/ucc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index 90157acc5ba6..d6c93970df4d 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -632,7 +632,7 @@ int ucc_set_tdm_rxtx_sync(u32 tdm_num, enum qe_clock clock,
 {
 	int source;
 	u32 shift;
-	struct qe_mux *qe_mux_reg;
+	struct qe_mux __iomem *qe_mux_reg;
 
 	qe_mux_reg = &qe_immr->qmx;
 
-- 
2.17.1

