Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CA2F232D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:49:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF9RQ5mbkzDr49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:49:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wf4VU+0r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8cr07SbzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:43 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN1Q9l093675; Mon, 11 Jan 2021 18:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OCeqXqTg76Y0WcH/KI/byd9/8vHZqFTCU6yOhsYJqt8=;
 b=Wf4VU+0rh3h1LzOaPCugHkxlezrad9NmmDbC+er4jDxv5GhnAsiqIdxL0wczk+0Gj1gL
 uVKiavzYHTqIr7lrQ5hXxLQOUFXNQ49ye3uebPe0RDzOk/9otJbodgQQaigmiK9GlP3a
 Gd3xdgKJcGYSi3Vd1affXtQRJKUetb2Ful9GnlauOr8pTkkE6iFIWcPDEb6cLlN+nLYN
 hvcxLYdj+WGXM9P6JVkLHCCsBQ2mT1oty+Aon07LRuazVOlKt83ysWpKiESfuwDcCzXi
 lLIM8t0w/GO9EBm4FJxIC7vAmNJtRCiL0qVD9rb6ogZEvv6tbQaBBKTOzujfGgfvJj0P 4g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360wgfmekf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:41 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN7Q1I010322;
 Mon, 11 Jan 2021 23:12:40 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 35y448sysj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCbfl27656688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B84C7805C;
 Mon, 11 Jan 2021 23:12:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E71678060;
 Mon, 11 Jan 2021 23:12:36 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:36 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 19/21] ibmvfc: purge scsi channels after transport
 loss/reset
Date: Mon, 11 Jan 2021 17:12:23 -0600
Message-Id: <20210111231225.105347-20-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210111231225.105347-1-tyreld@linux.ibm.com>
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_32:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110126
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

Grab the queue and list lock for each Sub-CRQ and add any uncompleted
events to the host purge list.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 24e1278acfeb..b413f5da71ce 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1056,7 +1056,13 @@ static void ibmvfc_fail_request(struct ibmvfc_event *evt, int error_code)
 static void ibmvfc_purge_requests(struct ibmvfc_host *vhost, int error_code)
 {
 	struct ibmvfc_event *evt, *pos;
+	struct ibmvfc_queue *queues = vhost->scsi_scrqs.scrqs;
 	unsigned long flags;
+	int hwqs = 0;
+	int i;
+
+	if (vhost->using_channels)
+		hwqs = vhost->scsi_scrqs.active_queues;
 
 	ibmvfc_dbg(vhost, "Purging all requests\n");
 	spin_lock_irqsave(&vhost->crq.l_lock, flags);
@@ -1064,6 +1070,16 @@ static void ibmvfc_purge_requests(struct ibmvfc_host *vhost, int error_code)
 		ibmvfc_fail_request(evt, error_code);
 	list_splice_init(&vhost->crq.sent, &vhost->purge);
 	spin_unlock_irqrestore(&vhost->crq.l_lock, flags);
+
+	for (i = 0; i < hwqs; i++) {
+		spin_lock_irqsave(queues[i].q_lock, flags);
+		spin_lock(&queues[i].l_lock);
+		list_for_each_entry_safe(evt, pos, &queues[i].sent, queue_list)
+			ibmvfc_fail_request(evt, error_code);
+		list_splice_init(&queues[i].sent, &vhost->purge);
+		spin_unlock(&queues[i].l_lock);
+		spin_unlock_irqrestore(queues[i].q_lock, flags);
+	}
 }
 
 /**
-- 
2.27.0

