Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE15183CA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:38:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dkJ93h8BzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 09:38:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dk4w6D32zDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 09:28:43 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EC2341A11B8;
 Thu, 12 Mar 2020 23:28:39 +0100 (CET)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE43D1A11C9;
 Thu, 12 Mar 2020 23:28:39 +0100 (CET)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 28EBB40AB2; Thu, 12 Mar 2020 15:28:39 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 1/6] soc: fsl: qe: fix sparse warnings for qe.c
Date: Thu, 12 Mar 2020 17:28:22 -0500
Message-Id: <20200312222827.17409-2-leoyang.li@nxp.com>
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
drivers/soc/fsl/qe/qe.c:426:9: warning: cast to restricted __be32
drivers/soc/fsl/qe/qe.c:528:41: warning: incorrect type in assignment (different base types)
drivers/soc/fsl/qe/qe.c:528:41:    expected unsigned long long static [addressable] [toplevel] [usertype] extended_modes
drivers/soc/fsl/qe/qe.c:528:41:    got restricted __be64 const [usertype] extended_modes

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/soc/fsl/qe/qe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 96c2057d8d8e..447146861c2c 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -423,7 +423,7 @@ static void qe_upload_microcode(const void *base,
 		qe_iowrite32be(be32_to_cpu(code[i]), &qe_immr->iram.idata);
 	
 	/* Set I-RAM Ready Register */
-	qe_iowrite32be(be32_to_cpu(QE_IRAM_READY), &qe_immr->iram.iready);
+	qe_iowrite32be(QE_IRAM_READY, &qe_immr->iram.iready);
 }
 
 /*
@@ -525,7 +525,7 @@ int qe_upload_firmware(const struct qe_firmware *firmware)
 	 */
 	memset(&qe_firmware_info, 0, sizeof(qe_firmware_info));
 	strlcpy(qe_firmware_info.id, firmware->id, sizeof(qe_firmware_info.id));
-	qe_firmware_info.extended_modes = firmware->extended_modes;
+	qe_firmware_info.extended_modes = be64_to_cpu(firmware->extended_modes);
 	memcpy(qe_firmware_info.vtraps, firmware->vtraps,
 		sizeof(firmware->vtraps));
 
-- 
2.17.1

