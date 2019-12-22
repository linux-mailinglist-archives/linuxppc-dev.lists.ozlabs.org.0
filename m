Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD584128D84
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2019 12:12:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47gfwD01WKzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2019 22:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47gfrN2B9yzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2019 22:09:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBMB7C4u097044; Sun, 22 Dec 2019 06:09:12 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x21kx7h4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Dec 2019 06:09:12 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBMB7ggR097737;
 Sun, 22 Dec 2019 06:09:12 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x21kx7h4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Dec 2019 06:09:12 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBMB76qL003710;
 Sun, 22 Dec 2019 11:09:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2x1b164em3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Dec 2019 11:09:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBMB9Aij43778462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 22 Dec 2019 11:09:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F09228060;
 Sun, 22 Dec 2019 11:09:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4C0F28058;
 Sun, 22 Dec 2019 11:09:09 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 22 Dec 2019 11:09:09 +0000 (GMT)
Subject: [PATCH V4 02/14] powerpc/xive: Define xive_native_alloc_get_irq_info()
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <1577012478.12797.71.camel@hbabu-laptop>
References: <1577012478.12797.71.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Dec 2019 03:09:01 -0800
Message-ID: <1577012941.12797.73.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-22_01:2019-12-17,2019-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=958
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=3 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912220104
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


pnv_ocxl_alloc_xive_irq() in ocxl.c allocates IRQ and gets trigger port
address. VAS also needs this function, but based on chip ID. So moved
this common function to xive/native.c.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/xive.h       |  2 ++
 arch/powerpc/platforms/powernv/ocxl.c | 20 ++------------------
 arch/powerpc/sysdev/xive/native.c     | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index 7ba6a90..382f5ed 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -139,6 +139,8 @@ extern int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
 extern int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
 extern bool xive_native_has_queue_state_support(void);
 extern u32 xive_native_alloc_irq_on_chip(u32 chip_id);
+extern int xive_native_alloc_get_irq_info(u32 chip_id, u32 *irq,
+					u64 *trigger_addr);
 
 static inline u32 xive_native_alloc_irq(void)
 {
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 8c65aac..fb8f99a 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -487,24 +487,8 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
 
 int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr)
 {
-	__be64 flags, trigger_page;
-	s64 rc;
-	u32 hwirq;
-
-	hwirq = xive_native_alloc_irq();
-	if (!hwirq)
-		return -ENOENT;
-
-	rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page, NULL,
-				NULL);
-	if (rc || !trigger_page) {
-		xive_native_free_irq(hwirq);
-		return -ENOENT;
-	}
-	*irq = hwirq;
-	*trigger_addr = be64_to_cpu(trigger_page);
-	return 0;
-
+	return xive_native_alloc_get_irq_info(OPAL_XIVE_ANY_CHIP, irq,
+						trigger_addr);
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_alloc_xive_irq);
 
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 14d4406..abdd892 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -295,6 +295,29 @@ u32 xive_native_alloc_irq_on_chip(u32 chip_id)
 }
 EXPORT_SYMBOL_GPL(xive_native_alloc_irq_on_chip);
 
+int xive_native_alloc_get_irq_info(u32 chip_id, u32 *irq, u64 *trigger_addr)
+{
+	__be64 flags, trigger_page;
+	u32 hwirq;
+	s64 rc;
+
+	hwirq = xive_native_alloc_irq_on_chip(chip_id);
+	if (!hwirq)
+		return -ENOENT;
+
+	rc = opal_xive_get_irq_info(hwirq, &flags, NULL, &trigger_page, NULL,
+				NULL);
+	if (rc || !trigger_page) {
+		xive_native_free_irq(hwirq);
+		return -ENOENT;
+	}
+	*irq = hwirq;
+	*trigger_addr = be64_to_cpu(trigger_page);
+
+	return 0;
+}
+EXPORT_SYMBOL(xive_native_alloc_get_irq_info);
+
 void xive_native_free_irq(u32 irq)
 {
 	for (;;) {
-- 
1.8.3.1



