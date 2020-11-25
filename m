Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9312C448D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:57:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch5BW3Qg9zDqnW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:57:39 +1100 (AEDT)
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
 header.s=pp1 header.b=fueQrWqY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5282ltPzDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:50:23 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APFWMkL149776
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BzKMUeKJzuU+Mqsy9ttdo5Vjep+ETwfWLsz48OgRfH4=;
 b=fueQrWqY0jQIU7b6cQ4875+XR3W79i160HcG8DZiyKtUzl9SlI446q3w9xzUhDRnSG50
 ycj2uV6u1P66NS8kBR1+TJqAmh3R4nrlLT8ypBJ+OBjR++HucXlaGPwc8XMrJ1KSbTUh
 eUcoFGnDntSVd6tg8cBckx/3XeP1vgaolp+GGSIqECzph81rwL+ZX3/gZDY4XKAohZWe
 pegbhFaImkFjh++GuR0M1x8ppHHn60CsagKL3nRUzpZNGRTtwGZjEFyX+qv91GY3pR8M
 1f1mkLkTAZdz/fAP0Ostov9R6ndzAq0nm9ktQXqk4Yx9hSM9BDDZ8LQxbsd78mluLmSD Rg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351q2ue9hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:20 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APFWeeT022740
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 34xth8afht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APFoFwr19005942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 15:50:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FAB42061;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8882142041;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.47.8])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 15:50:13 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V4 1/5] ocxl: Assign a register set to a Logical Partition
Date: Wed, 25 Nov 2020 16:50:09 +0100
Message-Id: <20201125155013.39955-2-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
References: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_09:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250096
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

Platform specific function to assign a register set to a Logical Partition.
The "ibm,mmio-atsd" property, provided by the firmware, contains the 16
base ATSD physical addresses (ATSD0 through ATSD15) of the set of MMIO
registers (XTS MMIO ATSDx LPARID/AVA/launch/status register).

For the time being, the ATSD0 set of registers is used by default.

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pnv-ocxl.h   |  3 ++
 arch/powerpc/platforms/powernv/ocxl.c | 45 +++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
index d37ededca3ee..60c3c74427d9 100644
--- a/arch/powerpc/include/asm/pnv-ocxl.h
+++ b/arch/powerpc/include/asm/pnv-ocxl.h
@@ -28,4 +28,7 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **p
 void pnv_ocxl_spa_release(void *platform_data);
 int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
 
+int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
+		      uint64_t lpcr, void __iomem **arva);
+void pnv_ocxl_unmap_lpar(void __iomem *arva);
 #endif /* _ASM_PNV_OCXL_H */
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index ecdad219d704..57fc1062677b 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -483,3 +483,48 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
 	return rc;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
+
+int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
+		      uint64_t lpcr, void __iomem **arva)
+{
+	struct pci_controller *hose = pci_bus_to_host(dev->bus);
+	struct pnv_phb *phb = hose->private_data;
+	u64 mmio_atsd;
+	int rc;
+
+	/* ATSD physical address.
+	 * ATSD LAUNCH register: write access initiates a shoot down to
+	 * initiate the TLB Invalidate command.
+	 */
+	rc = of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
+					0, &mmio_atsd);
+	if (rc) {
+		dev_info(&dev->dev, "No available ATSD found\n");
+		return rc;
+	}
+
+	/* Assign a register set to a Logical Partition and MMIO ATSD
+	 * LPARID register to the required value.
+	 */
+	rc = opal_npu_map_lpar(phb->opal_id, pci_dev_id(dev),
+			       lparid, lpcr);
+	if (rc) {
+		dev_err(&dev->dev, "Error mapping device to LPAR: %d\n", rc);
+		return rc;
+	}
+
+	*arva = ioremap(mmio_atsd, 24);
+	if (!(*arva)) {
+		dev_warn(&dev->dev, "ioremap failed - mmio_atsd: %#llx\n", mmio_atsd);
+		rc = -ENOMEM;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(pnv_ocxl_map_lpar);
+
+void pnv_ocxl_unmap_lpar(void __iomem *arva)
+{
+	iounmap(arva);
+}
+EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_lpar);
-- 
2.28.0

