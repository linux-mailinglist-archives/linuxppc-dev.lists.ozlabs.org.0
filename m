Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5317C6E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:15:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzPT52kpzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:15:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YzLw1gnDzDrDQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:12:56 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026JxgDR009028; Fri, 6 Mar 2020 15:12:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ykk05dwt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:12:45 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 026KCj8u065940;
 Fri, 6 Mar 2020 15:12:45 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ykk05dwt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:12:45 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026JvmG8009710;
 Fri, 6 Mar 2020 20:12:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2yffk75yps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 20:12:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026KCi0g61079822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 20:12:44 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 118946E04E;
 Fri,  6 Mar 2020 20:12:44 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786D16E04C;
 Fri,  6 Mar 2020 20:12:43 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 20:12:43 +0000 (GMT)
Subject: [PATCH V7 02/14] powerpc/xive: Define xive_native_alloc_get_irq_info()
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1583525239.9256.5.camel@hbabu-laptop>
References: <1583525239.9256.5.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Mar 2020 12:12:41 -0800
Message-ID: <1583525561.9256.7.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_07:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=889 suspectscore=3 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060121
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
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
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
index d08ea11..fd337da 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -139,6 +139,8 @@ int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
 int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
 bool xive_native_has_queue_state_support(void);
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



