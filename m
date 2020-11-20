Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5E2BB18B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:38:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3fz5G0TzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 04:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N3hR2ifV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd3Xf0rRHzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:32:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKHVolY008134
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+N+TWZBf/HeBoeaOMG9DFbDH3291FssMjwFq9y7eD0o=;
 b=N3hR2ifVNo5mw/+sRP5XnUqQ3iGdGfjjI/bahRLSnoRD3lEEiP/TfMve6rqruiRMGH9f
 Jv/C38HpVNt5D1s/BXgm4GWJmS6MJ84fxgXLqk5a6IxTZVituxk6BiPW3bzSjNpYhsaZ
 rOnl6yPKPxYu8hRG6b1bmtXxHWNBTB4ORjb3NzafkATX73kHRvRpz+/mN1II66VtcEhb
 0onHECOFcGXZKpqhLLMOer20Q3cwOJy06y36GJ8M9k2WOjAvIgQGxSkuOkVFdg/JtL45
 eNm0r8WVbvUCT9hPeZ47IoMiTDaih8ZSfr0Dsntg14+j2CZhdc1I0a6l0tP8yqdnSU0V Eg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xghf4kn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:47 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKHMc3m010806
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 34v69usyrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHWgxN1049280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:32:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DF06A4059;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53317A404D;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.3.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V2 3/5] ocxl: Update the Process Element Entry
Date: Fri, 20 Nov 2020 18:32:39 +0100
Message-Id: <20201120173241.59229-4-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011200116
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

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/context.c       | 4 +++-
 drivers/misc/ocxl/link.c          | 4 +++-
 drivers/misc/ocxl/ocxl_internal.h | 4 +++-
 drivers/scsi/cxlflash/ocxl_hw.c   | 6 ++++--
 include/misc/ocxl.h               | 2 +-
 5 files changed, 14 insertions(+), 6 deletions(-)

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
index fd73d3bc0eb6..20444db8a2bb 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -494,7 +494,7 @@ static u64 calculate_cfg_state(bool kernel)
 }
 
 int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
-		u64 amr, struct mm_struct *mm,
+		u64 amr, u64 bdf, struct mm_struct *mm,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data)
 {
@@ -529,6 +529,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
+	pe->pasid = cpu_to_be32(pasid << (31 - 19));
+	pe->bdf = cpu_to_be32(bdf << (31 - 15));
 	pe->lpid = cpu_to_be32(mfspr(SPRN_LPID));
 	pe->pid = cpu_to_be32(pidr);
 	pe->tid = cpu_to_be32(tidr);
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 0bad0a123af6..c9ce2af21d6f 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -84,7 +84,9 @@ struct ocxl_context {
 
 struct ocxl_process_element {
 	__be64 config_state;
-	__be32 reserved1[11];
+	__be32 pasid;
+	__be32 bdf;
+	__be32 reserved1[9];
 	__be32 lpid;
 	__be32 tid;
 	__be32 pid;
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
index e013736e275d..d0f101f428dd 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -447,7 +447,7 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle);
  * defined
  */
 int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
-		u64 amr, struct mm_struct *mm,
+		u64 amr, u64 bdf, struct mm_struct *mm,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data);
 
-- 
2.28.0

