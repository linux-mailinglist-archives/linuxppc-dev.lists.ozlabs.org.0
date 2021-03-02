Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52932AC8D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 00:07:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqt8F2h47z3cYs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 10:07:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C8zO0n28;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C8zO0n28; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqt7H5Rdqz3d8M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 10:07:07 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122N3Q5X085158; Tue, 2 Mar 2021 18:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nILnawZBkXgE9K7dLnpbGy1lY+tttA4o0oEurj3Me0Q=;
 b=C8zO0n286I4dez3QcnSfpwEjHaCOWP/B7772qTqDYaEkgKZuE0an13qLRAeAwZ3HVnwB
 gdb0QH32r0JBHo9TBbUet4qpfaCrEmsxyo6yG1BKe/Y+0iPqp5VX81U+L1HO7n424n+n
 mwCU6yPxYRbbyYpYwg23xuW2L67y8Xj7+LPY9hCm0pLLz7OCV6J3+PKUjci9mLGUnDSR
 oU7aQdGXy7Ks40dQt2CQhiXTRUWEIf/E/TjZEY7F6tM5mbOkLezLI4pykkpPffM3WgU0
 SQLalwVfcS7NpvO4WqSWoz2co6MI2DwzvFYNkG+aIK/EdWrikXGQx9/E/Vhc1OPNocp/ Jw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371xmwrfx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 18:07:03 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122N2YWe031580;
 Tue, 2 Mar 2021 23:05:46 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 37128gatfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 23:05:46 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122N5jd726738946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 23:05:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 754FA6E050;
 Tue,  2 Mar 2021 23:05:45 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3BF86E04C;
 Tue,  2 Mar 2021 23:05:44 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 23:05:44 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 1/5] ibmvfc: simplify handling of sub-CRQ initialization
Date: Tue,  2 Mar 2021 17:05:39 -0600
Message-Id: <20210302230543.9905-2-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302230543.9905-1-tyreld@linux.ibm.com>
References: <20210302230543.9905-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020170
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

If ibmvfc_init_sub_crqs() fails ibmvfc_probe() simply parrots
registration failure reported elsewhere, and futher
vhost->scsi_scrq.scrq == NULL is indication enough to the driver that it
has no sub-CRQs available. The mq_enabled check can also be moved into
ibmvfc_init_sub_crqs() such that each caller doesn't have to gate the
call with a mq_enabled check. Finally, in the case of sub-CRQ setup
failure setting do_enquiry can be turned off to putting the driver into
single queue fallback mode.

The aforementioned changes also simplify the next patch in the series
that fixes a hard reset issue, by tying a sub-CRQ setup failure and
do_enquiry logic into ibmvfc_init_sub_crqs().

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 7097028d4cb6..384960036f8b 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -5705,17 +5705,21 @@ static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
 	LEAVE;
 }
 
-static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
+static void ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 {
 	int i, j;
 
 	ENTER;
+	if (!vhost->mq_enabled)
+		return;
 
 	vhost->scsi_scrqs.scrqs = kcalloc(nr_scsi_hw_queues,
 					  sizeof(*vhost->scsi_scrqs.scrqs),
 					  GFP_KERNEL);
-	if (!vhost->scsi_scrqs.scrqs)
-		return -1;
+	if (!vhost->scsi_scrqs.scrqs) {
+		vhost->do_enquiry = 0;
+		return;
+	}
 
 	for (i = 0; i < nr_scsi_hw_queues; i++) {
 		if (ibmvfc_register_scsi_channel(vhost, i)) {
@@ -5724,13 +5728,12 @@ static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 			kfree(vhost->scsi_scrqs.scrqs);
 			vhost->scsi_scrqs.scrqs = NULL;
 			vhost->scsi_scrqs.active_queues = 0;
-			LEAVE;
-			return -1;
+			vhost->do_enquiry = 0;
+			break;
 		}
 	}
 
 	LEAVE;
-	return 0;
 }
 
 static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
@@ -5997,11 +6000,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		goto remove_shost;
 	}
 
-	if (vhost->mq_enabled) {
-		rc = ibmvfc_init_sub_crqs(vhost);
-		if (rc)
-			dev_warn(dev, "Failed to allocate Sub-CRQs. rc=%d\n", rc);
-	}
+	ibmvfc_init_sub_crqs(vhost);
 
 	if (shost_to_fc_host(shost)->rqst_q)
 		blk_queue_max_segments(shost_to_fc_host(shost)->rqst_q, 1);
-- 
2.27.0

