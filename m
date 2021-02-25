Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF093258DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:43:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmmVj3Rtqz3d5Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 08:43:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W+VOgw0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W+VOgw0w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmmVF5PnPz3cKP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:42:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PLWbF8042111; Thu, 25 Feb 2021 16:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zdptHZfiTZ1N/0vthNnhC7Y1j816nZgXv1gSX6ZvJ8c=;
 b=W+VOgw0wvL8XLvXaIfIzEyLivKzm3R1HSfx7YZ+nZnAWkoVyhQYjZEv2WWpEmvh1GQdT
 raE5vrFiCgiyQLOhy+/HC+XZ1R+DGP0MHD6xcnxVyWv1AHluwEXid025/1SuyFiizaHY
 nswx5296/Z3rKuPoZwD/XdjrUU5t8Y/tS99gTdw5/c3WfqX3GdbWehgVk0eJ3q7WCQFY
 hkQCw/OVEjSMlyXNvUqz2mU4Nsg+RIrwy5dV2NjeM76KxEzqZ8H9JC3yE0Brv6VzkFYg
 vf00kHcMIIU48l+8kmLCJvwwHOp7Z4M4csduW7lfmd47hAXYNB4Srzrlzydu6AqIA3/m QQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36xh8t4x8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:42:42 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PLUVUl029606;
 Thu, 25 Feb 2021 21:42:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 36tt29hub7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 21:42:42 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PLgemb20644174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 21:42:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD43278069;
 Thu, 25 Feb 2021 21:42:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 390307805C;
 Thu, 25 Feb 2021 21:42:40 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 21:42:40 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 2/5] ibmvfc: fix invalid sub-CRQ handles after hard reset
Date: Thu, 25 Feb 2021 15:42:34 -0600
Message-Id: <20210225214237.22400-3-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225214237.22400-1-tyreld@linux.ibm.com>
References: <20210225214237.22400-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_14:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250163
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A hard reset results in a complete transport disconnect such that the
CRQ connection with the partner VIOS is broken. This has the side effect
of also invalidating the associated sub-CRQs. The current code assumes
that the sub-CRQs are perserved resulting in a protocol violation after
trying to reconnect them with the VIOS. This introduces an infinite loop
such that the VIOS forces a disconnect after each subsequent attempt to
re-register with invalid handles.

Avoid the aforementioned issue by releasing the sub-CRQs prior to CRQ
disconnect, and driving a reinitialization of the sub-CRQs once a new
CRQ is registered with the hypervisor.

fixes: faacf8c5f1d5 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 384960036f8b..2cca55f2e464 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -158,6 +158,9 @@ static void ibmvfc_npiv_logout(struct ibmvfc_host *);
 static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target *);
 static void ibmvfc_tgt_move_login(struct ibmvfc_target *);
 
+static void ibmvfc_release_sub_crqs(struct ibmvfc_host *);
+static void ibmvfc_init_sub_crqs(struct ibmvfc_host *);
+
 static const char *unknown_error = "unknown error";
 
 static long h_reg_sub_crq(unsigned long unit_address, unsigned long ioba,
@@ -926,8 +929,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	unsigned long flags;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
 	struct ibmvfc_queue *crq = &vhost->crq;
-	struct ibmvfc_queue *scrq;
-	int i;
+
+	ibmvfc_release_sub_crqs(vhost);
 
 	/* Close the CRQ */
 	do {
@@ -936,6 +939,8 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
 
+	ibmvfc_init_sub_crqs(vhost);
+
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	spin_lock(vhost->crq.q_lock);
 	vhost->state = IBMVFC_NO_CRQ;
@@ -947,16 +952,6 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	memset(crq->msgs.crq, 0, PAGE_SIZE);
 	crq->cur = 0;
 
-	if (vhost->scsi_scrqs.scrqs) {
-		for (i = 0; i < nr_scsi_hw_queues; i++) {
-			scrq = &vhost->scsi_scrqs.scrqs[i];
-			spin_lock(scrq->q_lock);
-			memset(scrq->msgs.scrq, 0, PAGE_SIZE);
-			scrq->cur = 0;
-			spin_unlock(scrq->q_lock);
-		}
-	}
-
 	/* And re-open it again */
 	rc = plpar_hcall_norets(H_REG_CRQ, vdev->unit_address,
 				crq->msg_token, PAGE_SIZE);
@@ -966,6 +961,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 		dev_warn(vhost->dev, "Partner adapter not ready\n");
 	else if (rc != 0)
 		dev_warn(vhost->dev, "Couldn't register crq (rc=%d)\n", rc);
+
 	spin_unlock(vhost->crq.q_lock);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
@@ -5692,6 +5688,7 @@ static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
 
 	free_irq(scrq->irq, scrq);
 	irq_dispose_mapping(scrq->irq);
+	scrq->irq = 0;
 
 	do {
 		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address,
-- 
2.27.0

