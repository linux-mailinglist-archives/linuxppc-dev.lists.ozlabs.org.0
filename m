Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A002C4485
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:55:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch57R6k95zDqnW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:54:59 +1100 (AEDT)
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
 header.s=pp1 header.b=SlexHC0V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5274GxVzDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:50:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APFWP2a145036
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dN8LC4b/jcFI2yBh6PfcN7ukjSusP9zweZhKP46yvgo=;
 b=SlexHC0VpCBZyVYbe9rpltHWwwSdpN0hZaHKCQV3BZxMRxXJ1Lul0NqCckpAP1Un4Y/5
 Swp+kgnHqXoc56tWNfysSgYzaGwzgabe684tRs6aIMYBr4oQSwkJ6YlZyvYoj089BVlH
 bq6/OZhpxPEAK7b4D5zNdcwFbpd9vMvTx9PD9h57wYiq451Dds9yiLsvvQ3UYJ0z6Uw5
 WqtgG4mO3Of1lLg4N3HfAgu+SrpLMxeh6Dr98F/oauD/e7QFZX8NVNcrHRehyWZua0Gj
 mQjL880Qr2ZCYEk3+TBJ/+uSL2NhI9iSTyIgUp5s1pCU0HJUsEiTbvWnxTVEfKgtGc/v Dg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351qy5559v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:20 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APFWaEH000705
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 34y6k4t83w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:17 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APFoE8549480040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 15:50:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65F4D42054;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C7A04204B;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.47.8])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V4 3/5] ocxl: Update the Process Element Entry
Date: Wed, 25 Nov 2020 16:50:11 +0100
Message-Id: <20201125155013.39955-4-clombard@linux.vnet.ibm.com>
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
 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=966
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

To complete the MMIO based mechanism, the fields: PASID, bus, device and
function of the Process Element Entry have to be filled. (See
OpenCAPI Power Platform Architecture document)

                   Hypervisor Process Element Entry
Word
    0 1 .... 7  8  ...... 12  13 ..15  16.... 19  20 ........... 31
0                  OSL Configuration State (0:31)
1                  OSL Configuration State (32:63)
2               PASID                      |    Reserved
3       Bus   |   Device    |Function |        Reserved
4                             Reserved
5                             Reserved
6                               ....

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/context.c       | 4 +++-
 drivers/misc/ocxl/link.c          | 4 +++-
 drivers/misc/ocxl/ocxl_internal.h | 9 ++++++---
 drivers/scsi/cxlflash/ocxl_hw.c   | 6 ++++--
 include/misc/ocxl.h               | 2 +-
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index c21f65a5c762..9eb0d93b01c6 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -70,6 +70,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
 {
 	int rc;
 	unsigned long pidr = 0;
+	struct pci_dev *dev;
 
 	// Locks both status & tidr
 	mutex_lock(&ctx->status_mutex);
@@ -81,8 +82,9 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
 	if (mm)
 		pidr = mm->context.id;
 
+	dev = to_pci_dev(ctx->afu->fn->dev.parent);
 	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid, pidr, ctx->tidr,
-			      amr, mm, xsl_fault_error, ctx);
+			      amr, pci_dev_id(dev), mm, xsl_fault_error, ctx);
 	if (rc)
 		goto out;
 
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index fd73d3bc0eb6..77381dda2c45 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -494,7 +494,7 @@ static u64 calculate_cfg_state(bool kernel)
 }
 
 int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
-		u64 amr, struct mm_struct *mm,
+		u64 amr, u16 bdf, struct mm_struct *mm,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data)
 {
@@ -529,6 +529,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
+	pe->pasid = cpu_to_be32(pasid << (31 - 19));
+	pe->bdf = cpu_to_be16(bdf);
 	pe->lpid = cpu_to_be32(mfspr(SPRN_LPID));
 	pe->pid = cpu_to_be32(pidr);
 	pe->tid = cpu_to_be32(tidr);
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 0bad0a123af6..10125a22d5a5 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -84,13 +84,16 @@ struct ocxl_context {
 
 struct ocxl_process_element {
 	__be64 config_state;
-	__be32 reserved1[11];
+	__be32 pasid;
+	__be16 bdf;
+	__be16 reserved1;
+	__be32 reserved2[9];
 	__be32 lpid;
 	__be32 tid;
 	__be32 pid;
-	__be32 reserved2[10];
+	__be32 reserved3[10];
 	__be64 amr;
-	__be32 reserved3[3];
+	__be32 reserved4[3];
 	__be32 software_state;
 };
 
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index e4e0d767b98e..244fc27215dc 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -329,6 +329,7 @@ static int start_context(struct ocxlflash_context *ctx)
 	struct ocxl_hw_afu *afu = ctx->hw_afu;
 	struct ocxl_afu_config *acfg = &afu->acfg;
 	void *link_token = afu->link_token;
+	struct pci_dev *pdev = afu->pdev;
 	struct device *dev = afu->dev;
 	bool master = ctx->master;
 	struct mm_struct *mm;
@@ -360,8 +361,9 @@ static int start_context(struct ocxlflash_context *ctx)
 		mm = current->mm;
 	}
 
-	rc = ocxl_link_add_pe(link_token, ctx->pe, pid, 0, 0, mm,
-			      ocxlflash_xsl_fault, ctx);
+	rc = ocxl_link_add_pe(link_token, ctx->pe, pid, 0, 0,
+			      pci_dev_id(pdev), mm, ocxlflash_xsl_fault,
+			      ctx);
 	if (unlikely(rc)) {
 		dev_err(dev, "%s: ocxl_link_add_pe failed rc=%d\n",
 			__func__, rc);
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index e013736e275d..3ed736da02c8 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -447,7 +447,7 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle);
  * defined
  */
 int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
-		u64 amr, struct mm_struct *mm,
+		u64 amr, u16 bdf, struct mm_struct *mm,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data);
 
-- 
2.28.0

