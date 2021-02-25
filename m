Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2423E325902
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmmkC1JHXz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 08:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dEdIKAuS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dEdIKAuS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmmgv0THRz3cZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:51:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PLX3Ol075512; Thu, 25 Feb 2021 16:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UvwvlC54y4paFAvsUh+rgdZ3V7FM+LNSvEGafGNoUvM=;
 b=dEdIKAuS8RSLkUTkGASbZTNS7f2/FTDs+KtPsH81b/a14KgiUJHZ9cz8jb2Fr6grveyY
 hU2QLj7Oa/BGG+88LnQUUxHOVEZX4Ywt2dJeN7Valeh80whVlFP0g3F1aizM+8vrjaKP
 b89DpJtseD2Mm7RYjH0K4IFlRCQNvaAdz9nC+uKFZBkLW0g7Dgw1182x4sa8FaeH5KBe
 Ie18jio6zaD4hSVghAZTOj2syQ5mD8BE9J8bid1XYczxog4JEzNuG4HCUdtQftBsGvsS
 cS9IPWlo9AiY+WJrmjMPc/mzI2n4Mq9Lw/VBIUOLdQGhqXfeVYXGHQatiydfIzAJDToV kw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xh9953x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:51:03 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PLmBX9008671;
 Thu, 25 Feb 2021 21:51:02 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 36tt2a1vn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 21:51:01 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PLp0aV38207892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 21:51:00 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96BD66E052;
 Thu, 25 Feb 2021 21:51:00 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EA496E04E;
 Thu, 25 Feb 2021 21:51:00 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 21:51:00 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 5/5] ibmvfc: reinitialize sub-CRQs and perform channel
 enquiry after LPM
Date: Thu, 25 Feb 2021 15:50:57 -0600
Message-Id: <20210225215057.23020-6-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225215057.23020-1-tyreld@linux.ibm.com>
References: <20210225215057.23020-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_14:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

A live partition migration (LPM) results in a CRQ disconnect similar to
a hard reset. In this LPM case the hypervisor moslty perserves the CRQ
transport such that it simply needs to be reenabled. However, the
capabilities may have changed such as fewer channels, or no channels at
all. Further, its possible that there may be sub-CRQ support, but no
channel support. The CRQ reenable path currently doesn't take any of
this into consideration.

For simpilicty release and reinitialize sub-CRQs during reenable, and
set do_enquiry and using_channels with the appropriate values to trigger
channel renegotiation.

fixes: faacf8c5f1d5 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index ef03fa559433..1e2ea21713ad 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -903,6 +903,9 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
 {
 	int rc = 0;
 	struct vio_dev *vdev = to_vio_dev(vhost->dev);
+	unsigned long flags;
+
+	ibmvfc_release_sub_crqs(vhost);
 
 	/* Re-enable the CRQ */
 	do {
@@ -914,6 +917,15 @@ static int ibmvfc_reenable_crq_queue(struct ibmvfc_host *vhost)
 	if (rc)
 		dev_err(vhost->dev, "Error enabling adapter (rc=%d)\n", rc);
 
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+	spin_lock(vhost->crq.q_lock);
+	vhost->do_enquiry = 1;
+	vhost->using_channels = 0;
+	spin_unlock(vhost->crq.q_lock);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+
+	ibmvfc_init_sub_crqs(vhost);
+
 	return rc;
 }
 
-- 
2.27.0

