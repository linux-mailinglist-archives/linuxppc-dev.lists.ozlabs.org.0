Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D47144CF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 09:10:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482dP74cKmzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482dKx0k28zDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 19:07:16 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M824j8133200; Wed, 22 Jan 2020 03:07:05 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xnx9b6j44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 03:07:04 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00M823Ko133191;
 Wed, 22 Jan 2020 03:07:04 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xnx9b6j2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 03:07:04 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00M85NWb013776;
 Wed, 22 Jan 2020 08:07:02 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2xksn6b4je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 08:07:02 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00M871tk40567152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:07:01 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBCC213605E;
 Wed, 22 Jan 2020 08:07:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B5FE136059;
 Wed, 22 Jan 2020 08:07:01 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jan 2020 08:07:00 +0000 (GMT)
Subject: [PATCH V5 02/14] powerpc/xive: Define xive_native_alloc_get_irq_info()
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1579679802.26081.6.camel@hbabu-laptop>
References: <1579679802.26081.6.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jan 2020 00:06:56 -0800
Message-ID: <1579680416.26081.19.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=943 phishscore=0 mlxscore=0 suspectscore=3
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001220073
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
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
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



