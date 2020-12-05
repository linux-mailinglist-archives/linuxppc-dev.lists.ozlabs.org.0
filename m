Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 706552CFE7E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 20:38:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpKcb3WXgzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 06:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prevas.dk (client-ip=40.107.22.132;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=j1M7cxF6; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2132.outbound.protection.outlook.com [40.107.22.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpK9j71bQzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 06:18:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1pBv1/Je+UeSjJD6JemeRUbBnfsVd/w0nQqTS2f97GIvT721jMKIWePja0SO5+0Cs8DnabMHTWmeMuuWDgFfQcliYJhG4UxfxCkt5bu9y8VGIYWexym5GXkMwy4GIuh0Ed5oc3VhT8sK+YN6qo/SzOhy0JRyvdy3uGMdPZibMXKI2XxAqzNRj0G7WBoQcGc9KRGRQBOqOUogKhCk2SORweUHTEfBsJQkc9+gxrjnLkU48LzB+S2uWb/84pR+Ig7V2u1y5gnRsmIJq/DWx/07lwAvS1Hzi46JVoTpWq7CET5xp4FY2auDEHp5Lv9KsyFHbAfC6OZj5cpke+8xck7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbeuYQ5z0yv0bqY63C91Xkj2WIbCJKoREPOQvXArM50=;
 b=YLhJwxjc6u9nkloj1WogjmNfPc/fPl/tRFsHsG88UW3hdUXz631bkdE/nuTTL0cJAaQXteA967D6kLO4ghW6F544S6DS800lsBNHD8Q+gx9A2SFDxhw8gXX8ndadi65ZqbxvhqzMZoKAGNBsZ58DzCAe/OHmOH/RD+rWHgFRozOmmo26T/cGokrVevk2Ta2+Hi6MxvfPscBWaybQ8Zg4qh2dkWIxVLbZsJxBjuV+2UzFdLeEyr7R1tJMpg39mIAEewioCcPQOdsTH7iPvI3L5xIMXYqzDmAGv3F+53mtr5OU3d4s5/KBewOyi/HAlhlRkvRkkSWAKvrrEDDR+aY8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbeuYQ5z0yv0bqY63C91Xkj2WIbCJKoREPOQvXArM50=;
 b=j1M7cxF6A/OcmRRsmR0n/11lJUQQuNE4Jd095L0qdEMc9Cpakh+X4sel28ye/vjYXnNGA9zS0Sc6I0YXXtguU1nTjwoxoW5yEDIcvCh/Z6VWzbD2+0ZCaO40I5ib5qfjxnaDI6ZeFW2U4lBhYrXWgXPCtMqFNWY9fJraHIetvGI=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Sat, 5 Dec
 2020 19:18:22 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 19:18:22 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 06/20] soc: fsl: qe: add cpm_muram_free_addr() helper
Date: Sat,  5 Dec 2020 20:17:29 +0100
Message-Id: <20201205191744.7847-7-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM5PR0701CA0063.eurprd07.prod.outlook.com
 (2603:10a6:203:2::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by
 AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Sat, 5 Dec 2020 19:18:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6012a865-70f2-4f38-635c-08d8995287d8
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB13637B36B5A7A2BAB99DCA8293F00@AM4PR1001MB1363.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NNuj/RlT3jp7WI22eCyms92qPqR7Kb5imhdsBqPkO6OGXdMFzw3OcWRf4BqAZakEfKzd7SiC6TxAs+btcoICs+hRQbLKeyDFoNSfpArVm4jSZsodmT6IKsi3Tg3qVrUCUFTGv72uRMNNEHCJS54/FtGar+e0O48KA71tIFmuO3B+QwDqNrfo9d23ki2PhXGXIaow3UjnDuJZzJRhwrqOSaSB8M47Sb6/kPTOREM6DH2XkEkutlneRup29+6XGMO9FAJR//PVtFN6DJ6wj7cwAwJjK+SKv9xxAqUzrWNDkFuSxchAYA5i/VS/l98zm1u7dyeeR0aiW4zBtdC6D29zlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39840400004)(346002)(136003)(366004)(376002)(2616005)(2906002)(8676002)(8936002)(52116002)(36756003)(66476007)(66946007)(66556008)(4326008)(8976002)(5660300002)(1076003)(6486002)(44832011)(6512007)(186003)(26005)(110136005)(316002)(86362001)(478600001)(16526019)(54906003)(956004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bSclpNEkcYOXhHSIAqOtV3AArJXSfsvKPHUBlj4tgEe3rliFNXL3y7FHN6kq?=
 =?us-ascii?Q?mxA/zg6XY9yc0NPOPF9a7PxC+EqX1ZP3Sqnc6VEYaSDhZb6LW8l1hjwv7oye?=
 =?us-ascii?Q?LO+kfOQ03XZvBDYdvLLdTQoH1w26DDmh9OLyFUCPyMGmEzcXAlTQxwYXGfOB?=
 =?us-ascii?Q?0WuGOHIm2HbQspvhcW/6p2UwKZGmk/UpKfVmfmWGu1Ydb3BUvSmqo19Yaz8a?=
 =?us-ascii?Q?b3OnuD90wiQlmUmuLObKos10y/lnTYJHv+bYnqbcZSg3ClM46vyCV+BEDCIf?=
 =?us-ascii?Q?E62NYSwl0oAdNhtBUMvkqtu0WRIYD0uu1RQF9VvSDZGy5D5KV96Y6dq67xrk?=
 =?us-ascii?Q?LT62yZ3Gj4RTD2Nx2kMHwBMi3VH9TXVNT/y5GTs4eJI3bga3uFjNMk0Z1+1L?=
 =?us-ascii?Q?JQjc7TUT3PUsws9zlthWXyNouEC2UQ9dYQEyk36n6S8IGnsXaZATUTWwGr7w?=
 =?us-ascii?Q?kuNRRmj5pAZqZwAhzJGbKtrDsLdIAlA7/Uv/Xm3F6nHbUSWmTcb2LdGG1tja?=
 =?us-ascii?Q?IK3LsmEhGjx7zCvtt2VQFaJcIf8ax0sZuBpPy/zfPDcqodZfjWIsHolDrbpj?=
 =?us-ascii?Q?w1wR2SXwhAp/QxW+QJr5CGnPa77qawW9js394/H3MSzuDVTlte6SdAA/1QNX?=
 =?us-ascii?Q?6A1eGrAeTTDP6ovM5MUjQyWjHIL2HAZ+MlmdTKFzyEssmcOZKzfdwjdSncky?=
 =?us-ascii?Q?/uNYECU7w2a3mVi74RcD5zAczhgNnZF79CElwuqE78/7n2LSUPuXaS4iocN9?=
 =?us-ascii?Q?q7RLYERpeP2g7+uU6RXvu+K3pa2gFW5oMc+uIOgt/beKhCd3cP1tg0Nz0tsy?=
 =?us-ascii?Q?cO2nIlEnXwzhj4IoTLTKKSmogMHy5iTyBzK40UXWOWQLZ3o5h8iiZoVAp3+k?=
 =?us-ascii?Q?pWddAwhI1lDrswxqoMYUfX2fNnzVkT1Xswr2YCUQAOw1DhJ8iNiZt938RaJU?=
 =?us-ascii?Q?A8fEwn5wlZMfI1FW3cdujekOfJFODDrIbpyHCp7LzmQ3xJCWngcxTYprEewq?=
 =?us-ascii?Q?7Q/g?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6012a865-70f2-4f38-635c-08d8995287d8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 19:18:22.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFOW1GGhUi3LbVEg4FgTaP9gELyQMqvGeDBGGDilHQukeptGGT9Y/Ld7XgJ5H0iPq8puypekc6mgIU8SasK2dp0XHVp3yaPn9nl5FNItG4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1363
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a helper that takes a virtual address rather than the muram
offset. This will be used in a couple of places to avoid having to
store both the offset and the virtual address, as well as removing
NULL checks from the callers.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 12 ++++++++++++
 include/soc/fsl/qe/qe.h        |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 303cc2f5eb4a..448ef7f5321a 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -238,3 +238,15 @@ dma_addr_t cpm_muram_dma(void __iomem *addr)
 	return muram_pbase + (addr - muram_vbase);
 }
 EXPORT_SYMBOL(cpm_muram_dma);
+
+/*
+ * As cpm_muram_free, but takes the virtual address rather than the
+ * muram offset.
+ */
+void cpm_muram_free_addr(const void __iomem *addr)
+{
+	if (!addr)
+		return;
+	cpm_muram_free(cpm_muram_offset(addr));
+}
+EXPORT_SYMBOL(cpm_muram_free_addr);
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 8ee3747433c0..66f1afc393d1 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -104,6 +104,7 @@ s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
 void __iomem *cpm_muram_addr(unsigned long offset);
 unsigned long cpm_muram_offset(const void __iomem *addr);
 dma_addr_t cpm_muram_dma(void __iomem *addr);
+void cpm_muram_free_addr(const void __iomem *addr);
 #else
 static inline s32 cpm_muram_alloc(unsigned long size,
 				  unsigned long align)
@@ -135,6 +136,9 @@ static inline dma_addr_t cpm_muram_dma(void __iomem *addr)
 {
 	return 0;
 }
+static inline void cpm_muram_free_addr(const void __iomem *addr)
+{
+}
 #endif /* defined(CONFIG_CPM) || defined(CONFIG_QUICC_ENGINE) */
 
 /* QE PIO */
@@ -239,6 +243,7 @@ static inline int qe_alive_during_sleep(void)
 #define qe_muram_addr cpm_muram_addr
 #define qe_muram_offset cpm_muram_offset
 #define qe_muram_dma cpm_muram_dma
+#define qe_muram_free_addr cpm_muram_free_addr
 
 #ifdef CONFIG_PPC32
 #define qe_iowrite8(val, addr)     out_8(addr, val)
-- 
2.23.0

