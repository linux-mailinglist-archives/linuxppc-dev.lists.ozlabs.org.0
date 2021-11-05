Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB93446238
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:34:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hlxh92Cdzz3clL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:34:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlxfR5TKVz2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EACE6C9A1574;
 Fri,  5 Nov 2021 11:26:41 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003302ac547-e5fe-47d6-b88a-18926a23c883,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 08/11] powerpc/xive: Add a debugfs toggle for StoreEOI
Date: Fri, 5 Nov 2021 11:26:33 +0100
Message-ID: <20211105102636.1016378-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d0c63b67-7196-463e-952c-c702e84ee009
X-Ovh-Tracer-Id: 495677436890811357
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It can be used to deactivate temporarily StoreEOI for tests or
performance on platforms supporting the feature (POWER10)

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 75c683ffae7e..11e2aaa13965 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -84,6 +84,16 @@ static DEFINE_PER_CPU(struct xive_cpu *, xive_cpu);
 /* An invalid CPU target */
 #define XIVE_INVALID_TARGET	(-1)
 
+/*
+ * Global toggle to switch on/off StoreEOI
+ */
+static bool xive_store_eoi = true;
+
+static bool xive_is_store_eoi(struct xive_irq_data *xd)
+{
+	return xd->flags & XIVE_IRQ_FLAG_STORE_EOI && xive_store_eoi;
+}
+
 /*
  * Read the next entry in a queue, return its content if it's valid
  * or 0 if there is no new entry.
@@ -208,7 +218,7 @@ static notrace u8 xive_esb_read(struct xive_irq_data *xd, u32 offset)
 {
 	u64 val;
 
-	if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
+	if (offset == XIVE_ESB_SET_PQ_10 && xive_is_store_eoi(xd))
 		offset |= XIVE_ESB_LD_ST_MO;
 
 	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
@@ -233,7 +243,7 @@ static void xive_irq_data_dump(struct xive_irq_data *xd, char *buffer, size_t si
 	u64 val = xive_esb_read(xd, XIVE_ESB_GET);
 
 	snprintf(buffer, size, "flags=%c%c%c PQ=%c%c 0x%016llx 0x%016llx",
-		 xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
+		 xive_is_store_eoi(xd) ? 'S' : ' ',
 		 xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
 		 xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
 		 val & XIVE_ESB_VAL_P ? 'P' : '-',
@@ -395,7 +405,7 @@ static void xive_do_source_eoi(struct xive_irq_data *xd)
 	xd->stale_p = false;
 
 	/* If the XIVE supports the new "store EOI facility, use it */
-	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI) {
+	if (xive_is_store_eoi(xd)) {
 		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
 		return;
 	}
@@ -1824,6 +1834,7 @@ static void xive_core_debugfs_create(void)
 		debugfs_create_file(name, 0400, xive_eq_dir, (void *)cpu,
 				    &xive_eq_debug_fops);
 	}
+	debugfs_create_bool("store-eoi", 0600, xive_dir, &xive_store_eoi);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.31.1

