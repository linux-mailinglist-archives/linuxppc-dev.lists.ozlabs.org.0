Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300654E9DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 21:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPBfQ2svDz3dQc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 05:13:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASmWvp2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASmWvp2W;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPBcG5VX0z2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 05:11:42 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GHIPZ7013013;
	Thu, 16 Jun 2022 19:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7qq35SNtCx6//gOGORfeQ5P725tLQLSMQqiYbs6pQ2s=;
 b=ASmWvp2WNDv1efG4wzAF9eG0nHlKCsfL0wFh1v/R/pkeRnoL5pPywzoWJ5wUL8EGXjxe
 B/K26i+XXZczW+3SSl7TTpbiiM0Jor0YNJb71HpVidYJe+guTI7SrBpSMF3n17W4nzk9
 p3TxXqVd0eSzNnMoBpj94ZnpSyODX+zDWsIiMxOTIGKzjV4oVOnyFJYZ4DKy1BkFTV1/
 KtjhICwAW/xQX3HDRd7lzloRBX8GvMlQIwR+wugcQLDGTk7tXa3bkdogVtChxfPf3gVk
 V35Zm0VOWgVLS6PIGhbYOktwB+SYOt6EbaQzq0zpFm1XLuon/08CVOutzD8cTmp4RBi4 3Q== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqr2purdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 19:11:39 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25GJ6x8w017258;
	Thu, 16 Jun 2022 19:11:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03wdc.us.ibm.com with ESMTP id 3gmjp9uqjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 19:11:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25GJBbmo20971950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 19:11:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FFF713605D;
	Thu, 16 Jun 2022 19:11:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2C2F13604F;
	Thu, 16 Jun 2022 19:11:35 +0000 (GMT)
Received: from li-37e927cc-2b02-11b2-a85c-931637a79255.ibm.com.com (unknown [9.160.59.133])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jun 2022 19:11:35 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvfc: alloc/free queue resource only during probe/remove
Date: Thu, 16 Jun 2022 12:11:26 -0700
Message-Id: <20220616191126.1281259-3-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220616191126.1281259-1-tyreld@linux.ibm.com>
References: <20220616191126.1281259-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cRQmyEpACOF1p-FmQT6G6tJZUAOumVbe
X-Proofpoint-ORIG-GUID: cRQmyEpACOF1p-FmQT6G6tJZUAOumVbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_17,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160077
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, the sub-queues and event pool resources are alloc/free'd
for every CRQ connection event such as reset and LPM. This exposes the driver to
a couple issues. First the inefficiency of freeing and reallocating memory that
can simply be resued after being sanitized. Further, a system under memory
pressue runs the risk of allocation failures that could result in a cripled
driver. Finally, there is a race window where command submission/compeletion can
try to pull/return elements from/to an event pool that is being deleted or
already has been deleted due to the lack of host state around freeing/allocating
resources. The following is an example of list corruption following a live
partition migration (LPM):

Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: vfat fat isofs cdrom ext4 mbcache jbd2 nft_counter nft_compat nf_tables nfnetlink rpadlpar_io rpaphp xsk_diag nfsv3 nfs_acl nfs lockd grace fscache netfs rfkill bonding tls sunrpc pseries_rng drm drm_panel_orientation_quirks xfs libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc scsi_transport_fc ibmveth vmx_crypto dm_multipath dm_mirror dm_region_hash dm_log dm_mod ipmi_devintf ipmi_msghandler fuse
CPU: 0 PID: 2108 Comm: ibmvfc_0 Kdump: loaded Not tainted 5.14.0-70.9.1.el9_0.ppc64le #1
NIP: c0000000007c4bb0 LR: c0000000007c4bac CTR: 00000000005b9a10
REGS: c00000025c10b760 TRAP: 0700  Not tainted (5.14.0-70.9.1.el9_0.ppc64le)
MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 2800028f XER: 0000000f
CFAR: c0000000001f55bc IRQMASK: 0
        GPR00: c0000000007c4bac c00000025c10ba00 c000000002a47c00 000000000000004e
        GPR04: c0000031e3006f88 c0000031e308bd00 c00000025c10b768 0000000000000027
        GPR08: 0000000000000000 c0000031e3009dc0 00000031e0eb0000 0000000000000000
        GPR12: c0000031e2ffffa8 c000000002dd0000 c000000000187108 c00000020fcee2c0
        GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
        GPR20: 0000000000000000 0000000000000000 0000000000000000 c008000002f81300
        GPR24: 5deadbeef0000100 5deadbeef0000122 c000000263ba6910 c00000024cc88000
        GPR28: 000000000000003c c0000002430a0000 c0000002430ac300 000000000000c300
NIP [c0000000007c4bb0] __list_del_entry_valid+0x90/0x100
LR [c0000000007c4bac] __list_del_entry_valid+0x8c/0x100
Call Trace:
[c00000025c10ba00] [c0000000007c4bac] __list_del_entry_valid+0x8c/0x100 (unreliable)
[c00000025c10ba60] [c008000002f42284] ibmvfc_free_queue+0xec/0x210 [ibmvfc]
[c00000025c10bb10] [c008000002f4246c] ibmvfc_deregister_scsi_channel+0xc4/0x160 [ibmvfc]
[c00000025c10bba0] [c008000002f42580] ibmvfc_release_sub_crqs+0x78/0x130 [ibmvfc]
[c00000025c10bc20] [c008000002f4f6cc] ibmvfc_do_work+0x5c4/0xc70 [ibmvfc]
[c00000025c10bce0] [c008000002f4fdec] ibmvfc_work+0x74/0x1e8 [ibmvfc]
[c00000025c10bda0] [c0000000001872b8] kthread+0x1b8/0x1c0
[c00000025c10be10] [c00000000000cd64] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
40820034 38600001 38210060 4e800020 7c0802a6 7c641b78 3c62fe7a 7d254b78
3863b590 f8010070 4ba309cd 60000000 <0fe00000> 7c0802a6 3c62fe7a 3863b640
---[ end trace 11a2b65a92f8b66c ]---
ibmvfc 30000003: Send warning. Receive queue closed, will retry.

Add registration/deregistartion helpers that are called instead during
connection resets to sanitize and reconfigure the queues.

Fixes: 3034ebe26389 ("scsi: ibmvfc: Add alloc/dealloc routines for SCSI Sub-CRQ Channels")
Cc: stable@vger.kernel.org
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 79 ++++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 9fc0ffda6ae8..00684e11976b 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -160,8 +160,8 @@ static void ibmvfc_npiv_logout(struct ibmvfc_host *);
 static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target *);
 static void ibmvfc_tgt_move_login(struct ibmvfc_target *);
 
-static void ibmvfc_release_sub_crqs(struct ibmvfc_host *);
-static void ibmvfc_init_sub_crqs(struct ibmvfc_host *);
+static void ibmvfc_dereg_sub_crqs(struct ibmvfc_host *);
+static void ibmvfc_reg_sub_crqs(struct ibmvfc_host *);
 
 static const char *unknown_error = "unknown error";
 
@@ -917,7 +917,7 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	unsigned long flags;
 
-	ibmvfc_release_sub_crqs(vhost);
+	ibmvfc_dereg_sub_crqs(vhost);
 
 	/* Re-enable the CRQ */
 	do {
@@ -936,7 +936,7 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
 	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
-	ibmvfc_init_sub_crqs(vhost);
+	ibmvfc_reg_sub_crqs(vhost);
 
 	return rc;
 }
@@ -955,7 +955,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_queue *crq = &vhost->crq;
 
-	ibmvfc_release_sub_crqs(vhost);
+	ibmvfc_dereg_sub_crqs(vhost);
 
 	/* Close the CRQ */
 	do {
@@ -988,7 +988,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
-	ibmvfc_init_sub_crqs(vhost);
+	ibmvfc_reg_sub_crqs(vhost);
 
 	return rc;
 }
@@ -5759,9 +5759,6 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
 
 	ENTER;
 
-	if (ibmvfc_alloc_queue(vhost, scrq, IBMVFC_SUB_CRQ_FMT))
-		return -ENOMEM;
-
 	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
 			   &scrq->cookie, &scrq->hw_irq);
 
@@ -5801,7 +5798,6 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
 		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
 	} while (rtas_busy_delay(rc));
 reg_failed:
-	ibmvfc_free_queue(vhost, scrq);
 	LEAVE;
 	return rc;
 }
@@ -5827,12 +5823,50 @@ static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
 	if (rc)
 		dev_err(dev, "Failed to free sub-crq[%d]: rc=%ld\n", index, rc);
 
-	ibmvfc_free_queue(vhost, scrq);
+	/* Clean out the queue */
+	memset(scrq->msgs.crq, 0, PAGE_SIZE);
+	scrq->cur = 0;
+
+	LEAVE;
+}
+
+static void ibmvfc_reg_sub_crqs(struct ibmvfc_host *vhost)
+{
+	int i, j;
+
+	ENTER;
+	if (!vhost->mq_enabled || !vhost->scsi_scrqs.scrqs)
+		return;
+
+	for (i = 0; i < nr_scsi_hw_queues; i++) {
+		if (ibmvfc_register_scsi_channel(vhost, i)) {
+			for (j = i; j > 0; j--)
+				ibmvfc_deregister_scsi_channel(vhost, j - 1);
+			vhost->do_enquiry = 0;
+			return;
+		}
+	}
+
+	LEAVE;
+}
+
+static void ibmvfc_dereg_sub_crqs(struct ibmvfc_host *vhost)
+{
+	int i;
+
+	ENTER;
+	if (!vhost->mq_enabled || !vhost->scsi_scrqs.scrqs)
+		return;
+
+	for (i = 0; i < nr_scsi_hw_queues; i++)
+		ibmvfc_deregister_scsi_channel(vhost, i);
+
 	LEAVE;
 }
 
 static void ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 {
+	struct ibmvfc_queue *scrq;
 	int i, j;
 
 	ENTER;
@@ -5848,30 +5882,41 @@ static void ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 	}
 
 	for (i = 0; i < nr_scsi_hw_queues; i++) {
-		if (ibmvfc_register_scsi_channel(vhost, i)) {
-			for (j = i; j > 0; j--)
-				ibmvfc_deregister_scsi_channel(vhost, j - 1);
+		scrq = &vhost->scsi_scrqs.scrqs[i];
+		if (ibmvfc_alloc_queue(vhost, scrq, IBMVFC_SUB_CRQ_FMT)) {
+			for (j = i; j > 0; j--) {
+				scrq = &vhost->scsi_scrqs.scrqs[j - 1];
+				ibmvfc_free_queue(vhost, scrq);
+			}
 			kfree(vhost->scsi_scrqs.scrqs);
 			vhost->scsi_scrqs.scrqs = NULL;
 			vhost->scsi_scrqs.active_queues = 0;
 			vhost->do_enquiry = 0;
-			break;
+			vhost->mq_enabled = 0;
+			return;
 		}
 	}
 
+	ibmvfc_reg_sub_crqs(vhost);
+
 	LEAVE;
 }
 
 static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
 {
+	struct ibmvfc_queue *scrq;
 	int i;
 
 	ENTER;
 	if (!vhost->scsi_scrqs.scrqs)
 		return;
 
-	for (i = 0; i < nr_scsi_hw_queues; i++)
-		ibmvfc_deregister_scsi_channel(vhost, i);
+	ibmvfc_dereg_sub_crqs(vhost);
+
+	for (i = 0; i < nr_scsi_hw_queues; i++) {
+		scrq = &vhost->scsi_scrqs.scrqs[i];
+		ibmvfc_free_queue(vhost, scrq);
+	}
 
 	kfree(vhost->scsi_scrqs.scrqs);
 	vhost->scsi_scrqs.scrqs = NULL;
-- 
2.35.3

