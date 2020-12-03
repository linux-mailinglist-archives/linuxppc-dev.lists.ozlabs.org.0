Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF62CCC58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:17:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmfch3bV4zDrN8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X8eBvpAM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmfPt1shfzDr9W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:08:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B322lUd096065; Wed, 2 Dec 2020 21:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1RKZ2SdB/Y/n99fWxar2L0vt9zLjUEVpvzulfL68jLk=;
 b=X8eBvpAMBlm7CO9WCuVmUDgROjQwUUUgsRmPPL1WdxmHBlwJ1VqBgrfAUayXDjA663KJ
 cC0MlfNlAW33VsnNG7+pk3M599PxUcoI/oVZzwqhEWAS2Fy02Y03y0GMH1N3DEV7HFAR
 G96lM0y5zyesH1Wn7w7WSc/1Eniq4MYdH7KSLTk1i1Tuo+JadX5Lf3ZY+kBIuhvIAhdP
 TsTkC9aIK97W7J2gSDFQeox2kkVSlmpaXrGb8WQ5jNKizluALqW1P+KpfuetW19cAOPe
 TtjBl9EiYdMqxHwQWwZCKnZ+gEyk1Z6fSQ7zpCM21GGep0PggbSfsmkxLottBQMu/phg iQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jfcxxdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 21:08:16 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B327SU9013205;
 Thu, 3 Dec 2020 02:08:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 353e69df1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 02:08:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B328Dv820447530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 02:08:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 654C07805E;
 Thu,  3 Dec 2020 02:08:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35CE78068;
 Thu,  3 Dec 2020 02:08:12 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 02:08:12 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 06/18] ibmvfc: add handlers to drain and complete Sub-CRQ
 responses
Date: Wed,  2 Dec 2020 20:07:54 -0600
Message-Id: <20201203020806.14747-7-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203020806.14747-1-tyreld@linux.ibm.com>
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_14:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=3
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030009
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

The logic for iterating over the Sub-CRQ responses is similiar to that
of the primary CRQ. Add the necessary handlers for processing those
responses.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 80 ++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index e082935f56cf..b61ae1df21e5 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3381,6 +3381,86 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_sub_queue *scrq, int enable)
 	return rc;
 }
 
+static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
+{
+	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
+	unsigned long flags;
+
+	switch (crq->valid) {
+	case IBMVFC_CRQ_CMD_RSP:
+		break;
+	case IBMVFC_CRQ_XPORT_EVENT:
+		return;
+	default:
+		dev_err(vhost->dev, "Got and invalid message type 0x%02x\n", crq->valid);
+		return;
+	}
+
+	/* The only kind of payload CRQs we should get are responses to
+	 * things we send. Make sure this response is to something we
+	 * actually sent
+	 */
+	if (unlikely(!ibmvfc_valid_event(&vhost->pool, evt))) {
+		dev_err(vhost->dev, "Returned correlation_token 0x%08llx is invalid!\n",
+			crq->ioba);
+		return;
+	}
+
+	if (unlikely(atomic_read(&evt->free))) {
+		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
+			crq->ioba);
+		return;
+	}
+
+	del_timer(&evt->timer);
+	list_del(&evt->queue);
+	ibmvfc_trc_end(evt);
+	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	evt->done(evt);
+	spin_lock_irqsave(vhost->host->host_lock, flags);
+}
+
+static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_sub_queue *scrq)
+{
+	struct ibmvfc_crq *crq;
+
+	crq = &scrq->msgs[scrq->cur].crq;
+	if (crq->valid & 0x80) {
+		if (++scrq->cur == scrq->size)
+			scrq->cur = 0;
+		rmb();
+	} else
+		crq = NULL;
+
+	return crq;
+}
+
+static void ibmvfc_drain_sub_crq(struct ibmvfc_sub_queue *scrq)
+{
+	struct ibmvfc_crq *crq;
+	unsigned long flags;
+	int done = 0;
+
+	spin_lock_irqsave(scrq->vhost->host->host_lock, flags);
+	while (!done) {
+		while ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
+			ibmvfc_handle_scrq(crq, scrq->vhost);
+			crq->valid = 0;
+			wmb();
+		}
+
+		ibmvfc_toggle_scrq_irq(scrq, 1);
+		if ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
+			ibmvfc_toggle_scrq_irq(scrq, 0);
+			ibmvfc_handle_scrq(crq, scrq->vhost);
+			crq->valid = 0;
+			wmb();
+		} else
+			done = 1;
+	}
+	spin_unlock_irqrestore(scrq->vhost->host->host_lock, flags);
+}
+
 /**
  * ibmvfc_init_tgt - Set the next init job step for the target
  * @tgt:		ibmvfc target struct
-- 
2.27.0

