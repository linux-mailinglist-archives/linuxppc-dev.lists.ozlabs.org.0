Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F917C6DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:13:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzMl0kLyzDrL5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:13:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YzLD2fgkzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:12:18 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026JxDLN139778; Fri, 6 Mar 2020 15:12:07 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ykgng42tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:12:07 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 026JxfUn140967;
 Fri, 6 Mar 2020 15:12:07 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ykgng42te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:12:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026Jsof7012007;
 Fri, 6 Mar 2020 20:12:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2yffk7uevr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 20:12:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026KC5DZ52560318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 20:12:05 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D4F7B2064;
 Fri,  6 Mar 2020 20:12:05 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B21ECB2067;
 Fri,  6 Mar 2020 20:12:04 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 20:12:04 +0000 (GMT)
Subject: [PATCH V7 01/14] powerpc/xive: Define xive_native_alloc_irq_on_chip()
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1583525239.9256.5.camel@hbabu-laptop>
References: <1583525239.9256.5.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Mar 2020 12:12:02 -0800
Message-ID: <1583525522.9256.6.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_07:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=3 mlxlogscore=971 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003060121
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


This function allocates IRQ on a specific chip. VAS needs per chip
IRQ allocation and will have IRQ handler per VAS instance.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/xive.h   | 9 ++++++++-
 arch/powerpc/sysdev/xive/native.c | 6 +++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index 93f982db..d08ea11 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -5,6 +5,8 @@
 #ifndef _ASM_POWERPC_XIVE_H
 #define _ASM_POWERPC_XIVE_H
 
+#include <asm/opal-api.h>
+
 #define XIVE_INVALID_VP	0xffffffff
 
 #ifdef CONFIG_PPC_XIVE
@@ -108,7 +110,6 @@ struct xive_q {
 int xive_native_populate_irq_data(u32 hw_irq,
 				  struct xive_irq_data *data);
 void xive_cleanup_irq_data(struct xive_irq_data *xd);
-u32 xive_native_alloc_irq(void);
 void xive_native_free_irq(u32 irq);
 int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
 
@@ -137,6 +138,12 @@ int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
 				u32 qindex);
 int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
 bool xive_native_has_queue_state_support(void);
+extern u32 xive_native_alloc_irq_on_chip(u32 chip_id);
+
+static inline u32 xive_native_alloc_irq(void)
+{
+	return xive_native_alloc_irq_on_chip(OPAL_XIVE_ANY_CHIP);
+}
 
 #else
 
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 0ff6b73..14d4406 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -279,12 +279,12 @@ static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
 }
 #endif /* CONFIG_SMP */
 
-u32 xive_native_alloc_irq(void)
+u32 xive_native_alloc_irq_on_chip(u32 chip_id)
 {
 	s64 rc;
 
 	for (;;) {
-		rc = opal_xive_allocate_irq(OPAL_XIVE_ANY_CHIP);
+		rc = opal_xive_allocate_irq(chip_id);
 		if (rc != OPAL_BUSY)
 			break;
 		msleep(OPAL_BUSY_DELAY_MS);
@@ -293,7 +293,7 @@ u32 xive_native_alloc_irq(void)
 		return 0;
 	return rc;
 }
-EXPORT_SYMBOL_GPL(xive_native_alloc_irq);
+EXPORT_SYMBOL_GPL(xive_native_alloc_irq_on_chip);
 
 void xive_native_free_irq(u32 irq)
 {
-- 
1.8.3.1



