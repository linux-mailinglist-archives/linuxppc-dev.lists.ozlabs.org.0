Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 619BF2BB1A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:44:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3p14WtCzDr3j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 04:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CfLFQK5w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd3Z45DTszDr0X
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:34:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKH4MuR103793
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=pp1;
 bh=e5M1lpsfFPdrd73A8GM+ZN+oQyxDTzW+UyO6RYPpS1c=;
 b=CfLFQK5wOFEEiA/fLEEyT/RLfxi+T9ACvPt9KgAdMAcftkhfjUA3ACpI7Qs1yNBOrQS8
 dOUnR9AUxGnBilvdWXCuI2BLGAXz/mFRg+VfomEiJLpzui+s9FImURusZLIJU/Cf0MGr
 F8r4MpgbOjYyhoV6z2H9QivttdgNQ0drs8mH7LHRGnkVT07YeVVL/JFG3GauUCV6Ch+l
 GHHEq8dAgB3Qd7UhjD/oTb1iI56SeMoYnZsfTE2D6LrDB8p4gg8TtYJoQ5c9ro7lCOk+
 SvLSn4+tTJdv3YqMrXSUuKJlPJvALyNL+1dXAuBKo7LDvQmtu2XQFFIY7y3lQSf4jfX2 nA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xgu83cbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:34:02 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKHXFC7028287
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:34:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 34t6v8cx54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:33:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHWg99393766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:32:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FFDAA4040;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 057E7A404D;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.3.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:32:41 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V2 2/5] ocxl: Initiate a TLB invalidate command
Date: Fri, 20 Nov 2020 18:32:38 +0100
Message-Id: <20201120173241.59229-3-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200116
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a TLB Invalidate is required for the Logical Partition, the following
sequence has to be performed:

1. Load MMIO ATSD AVA register with the necessary value, if required.
2. Write the MMIO ATSD launch register to initiate the TLB Invalidate
   command.
3. Poll the MMIO ATSD status register to determine when the TLB Invalidate
   has been completed.

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h   | 50 ++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/ocxl.c | 55 +++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index 3f38aed7100c..9c90e87e7659 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -3,12 +3,59 @@
 #ifndef _ASM_PNV_OCXL_H
 #define _ASM_PNV_OCXL_H
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 
 #define PNV_OCXL_TL_MAX_TEMPLATE        63
 #define PNV_OCXL_TL_BITS_PER_RATE       4
 #define PNV_OCXL_TL_RATE_BUF_SIZE       ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
 
+#define PNV_OCXL_ATSD_TIMEOUT		1
+
+/* TLB Management Instructions */
+#define PNV_OCXL_ATSD_LNCH		0x00
+/* Radix Invalidate */
+#define   PNV_OCXL_ATSD_LNCH_R		PPC_BIT(0)
+/* Radix Invalidation Control
+ * 0b00 Just invalidate TLB.
+ * 0b01 Invalidate just Page Walk Cache.
+ * 0b10 Invalidate TLB, Page Walk Cache, and any
+ * caching of Partition and Process Table Entries.
+ */
+#define   PNV_OCXL_ATSD_LNCH_RIC	PPC_BITMASK(1, 2)
+/* Number and Page Size of translations to be invalidated */
+#define   PNV_OCXL_ATSD_LNCH_LP		PPC_BITMASK(3, 10)
+/* Invalidation Criteria
+ * 0b00 Invalidate just the target VA.
+ * 0b01 Invalidate matching PID.
+ */
+#define   PNV_OCXL_ATSD_LNCH_IS		PPC_BITMASK(11, 12)
+/* 0b1: Process Scope, 0b0: Partition Scope */
+#define   PNV_OCXL_ATSD_LNCH_PRS	PPC_BIT(13)
+/* Invalidation Flag */
+#define   PNV_OCXL_ATSD_LNCH_B		PPC_BIT(14)
+/* Actual Page Size to be invalidated
+ * 000 4KB
+ * 101 64KB
+ * 001 2MB
+ * 010 1GB
+ */
+#define   PNV_OCXL_ATSD_LNCH_AP		PPC_BITMASK(15, 17)
+/* Defines the large page select
+ * L=0b0 for 4KB pages
+ * L=0b1 for large pages)
+ */
+#define   PNV_OCXL_ATSD_LNCH_L		PPC_BIT(18)
+/* Process ID */
+#define   PNV_OCXL_ATSD_LNCH_PID	PPC_BITMASK(19, 38)
+/* NoFlush – Assumed to be 0b0 */
+#define   PNV_OCXL_ATSD_LNCH_F		PPC_BIT(39)
+#define   PNV_OCXL_ATSD_LNCH_OCAPI_SLBI	PPC_BIT(40)
+#define   PNV_OCXL_ATSD_LNCH_OCAPI_SINGLETON	PPC_BIT(41)
+#define PNV_OCXL_ATSD_AVA		0x08
+#define   PNV_OCXL_ATSD_AVA_AVA		PPC_BITMASK(0, 51)
+#define PNV_OCXL_ATSD_STAT		0x10
+
 int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled, u16 *supported);
 int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
 
@@ -31,4 +78,7 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
 int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
 		      uint64_t lpcr, void __iomem **arva);
 void pnv_ocxl_unmap_lpar(void __iomem **arva);
+void pnv_ocxl_tlb_invalidate(void __iomem **arva,
+			     unsigned long pid,
+			     unsigned long addr);
 #endif /* _ASM_PNV_OCXL_H */
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index bc20cf867900..07878496954b 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -531,3 +531,58 @@ void pnv_ocxl_unmap_lpar(void __iomem **arva)
 	iounmap(*arva);
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_lpar);
+
+void pnv_ocxl_tlb_invalidate(void __iomem **arva,
+			     unsigned long pid,
+			     unsigned long addr)
+{
+	unsigned long timeout = jiffies + (HZ * PNV_OCXL_ATSD_TIMEOUT);
+	uint64_t val = 0ull;
+	int pend;
+
+	if (!(*arva))
+		return;
+
+	if (addr) {
+		/* load Abbreviated Virtual Address register with
+		 * the necessary value
+		 */
+		val |= FIELD_PREP(PNV_OCXL_ATSD_AVA_AVA, addr >> (63-51));
+		out_be64(*arva + PNV_OCXL_ATSD_AVA, val);
+	}
+
+	/* Write access initiates a shoot down to initiate the
+	 * TLB Invalidate command
+	 */
+	val = PNV_OCXL_ATSD_LNCH_R;
+	if (addr) {
+		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_RIC, 0b00);
+		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_IS, 0b00);
+	} else {
+		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_RIC, 0b10);
+		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_IS, 0b01);
+		val |= PNV_OCXL_ATSD_LNCH_OCAPI_SINGLETON;
+	}
+	val |= PNV_OCXL_ATSD_LNCH_PRS;
+	val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_AP, 0b101);
+	val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_PID, pid);
+	out_be64(*arva + PNV_OCXL_ATSD_LNCH, val);
+
+	/* Poll the ATSD status register to determine when the
+	 * TLB Invalidate has been completed.
+	 */
+	val = in_be64(*arva + PNV_OCXL_ATSD_STAT);
+	pend = val >> 63;
+
+	while (pend) {
+		if (time_after_eq(jiffies, timeout)) {
+			pr_err("%s - Timeout while reading XTS MMIO ATSD status register (val=%#llx, pidr=0x%lx)\n",
+			       __func__, val, pid);
+			return;
+		}
+		cpu_relax();
+		val = in_be64(*arva + PNV_OCXL_ATSD_STAT);
+		pend = val >> 63;
+	}
+}
+EXPORT_SYMBOL_GPL(pnv_ocxl_tlb_invalidate);
-- 
2.28.0

