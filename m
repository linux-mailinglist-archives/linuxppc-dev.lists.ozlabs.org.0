Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1E3258DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmmW973HGz3d9M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 08:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GeLh6sQ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GeLh6sQ3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmmVF3PBGz30RV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:42:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PLWcVu042234; Thu, 25 Feb 2021 16:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nILnawZBkXgE9K7dLnpbGy1lY+tttA4o0oEurj3Me0Q=;
 b=GeLh6sQ3uRhx6ZO4ArSj98AWQSseVLjkGxFG7zq5Qubp4GJlHkG6+PED31UwllbtAOZ3
 XrajU4SM7QbV8IsaferHEase1wPhrpVF089bbBY0QZMWTe3RkXW/xKy0VwA6AF5HBHA1
 eDwIuEOv0wkO6Y/kRV1B0U6E6gHbqXVHipXLT1kAVn8uBUZMmhmcptAyWMpNFg+0prfv
 kEH2B23z1TC7PlXqYwjXUgeMG30onF2tr857DqFQIYDQIr1uF3QVbKqPDzqiXc5Oh+tn
 zKBYF1mvopm9e+Np5y7riYJWMWuOe0drM5Jvg0Cz7Mplq3TcaBVP3z1Tjk6+QNnX5G6E bQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36xh8t4x8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:42:42 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PLS69A017296;
 Thu, 25 Feb 2021 21:42:41 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 36tt2a9rrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 21:42:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PLgeA529819298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 21:42:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EFCF78063;
 Thu, 25 Feb 2021 21:42:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9532678060;
 Thu, 25 Feb 2021 21:42:39 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 21:42:39 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 1/5] ibmvfc: simplify handling of sub-CRQ initialization
Date: Thu, 25 Feb 2021 15:42:33 -0600
Message-Id: <20210225214237.22400-2-tyreld@linux.ibm.com>
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

