Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1F18ACB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:21:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jcHG1WdtzDr96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 17:21:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jc8F3qn8zDr6V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 17:15:09 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J63SfO030965; Thu, 19 Mar 2020 02:14:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3vtpeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:14:59 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J64GtQ034589;
 Thu, 19 Mar 2020 02:14:58 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3vtpe5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:14:58 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J64v2w010699;
 Thu, 19 Mar 2020 06:14:57 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2yrpw6pbd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 06:14:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J6EvW855116208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 06:14:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9DACAC05E;
 Thu, 19 Mar 2020 06:14:56 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E3F8AC065;
 Thu, 19 Mar 2020 06:14:56 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 06:14:56 +0000 (GMT)
Subject: [PATCH v8 04/14] powerpc/vas: Alloc and setup IRQ and trigger port
 address
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1584598120.9256.15237.camel@hbabu-laptop>
References: <1584598120.9256.15237.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Mar 2020 23:14:33 -0700
Message-ID: <1584598473.9256.15248.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190026
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


Alloc IRQ and get trigger port address for each VAS instance. Kernel
register this IRQ per VAS instance and sets this port for each send
window. NX interrupts the kernel when it sees page fault.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas.c | 34 ++++++++++++++++++++++++++++------
 arch/powerpc/platforms/powernv/vas.h |  2 ++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index ed9cc6d..168ab68 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -15,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <asm/prom.h>
+#include <asm/xive.h>
 
 #include "vas.h"
 
@@ -25,10 +26,12 @@
 
 static int init_vas_instance(struct platform_device *pdev)
 {
-	int rc, cpu, vasid;
-	struct resource *res;
-	struct vas_instance *vinst;
 	struct device_node *dn = pdev->dev.of_node;
+	struct vas_instance *vinst;
+	uint32_t chipid, irq;
+	struct resource *res;
+	int rc, cpu, vasid;
+	uint64_t port;
 
 	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
 	if (rc) {
@@ -36,6 +39,12 @@ static int init_vas_instance(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	rc = of_property_read_u32(dn, "ibm,chip-id", &chipid);
+	if (rc) {
+		pr_err("No ibm,chip-id property for %s?\n", pdev->name);
+		return -ENODEV;
+	}
+
 	if (pdev->num_resources != 4) {
 		pr_err("Unexpected DT configuration for [%s, %d]\n",
 				pdev->name, vasid);
@@ -69,9 +78,22 @@ static int init_vas_instance(struct platform_device *pdev)
 
 	vinst->paste_win_id_shift = 63 - res->end;
 
-	pr_devel("Initialized instance [%s, %d], paste_base 0x%llx, "
-			"paste_win_id_shift 0x%llx\n", pdev->name, vasid,
-			vinst->paste_base_addr, vinst->paste_win_id_shift);
+	rc = xive_native_alloc_get_irq_info(chipid, &irq, &port);
+	if (rc)
+		return rc;
+
+	vinst->virq = irq_create_mapping(NULL, irq);
+	if (!vinst->virq) {
+		pr_err("Inst%d: Unable to map global irq %d\n",
+				vinst->vas_id, irq);
+		return -EINVAL;
+	}
+
+	vinst->irq_port = port;
+	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
+			pdev->name, vasid, vinst->paste_base_addr,
+			vinst->paste_win_id_shift, vinst->virq,
+			vinst->irq_port);
 
 	for_each_possible_cpu(cpu) {
 		if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 5574aec..598608b 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -313,6 +313,8 @@ struct vas_instance {
 	u64 paste_base_addr;
 	u64 paste_win_id_shift;
 
+	u64 irq_port;
+	int virq;
 	struct mutex mutex;
 	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
 	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
-- 
1.8.3.1



