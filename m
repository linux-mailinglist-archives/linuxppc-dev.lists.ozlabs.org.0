Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2E2F230A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:14:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF8fv0vVKzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 10:14:31 +1100 (AEDT)
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
 header.s=pp1 header.b=hbtQbDgS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF8ch3jKqzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:12:36 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BN1QGt093644; Mon, 11 Jan 2021 18:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z0MKHlExerIGTDZ+RFFcZDlZHDy3QWjCBB0jo4OYJqs=;
 b=hbtQbDgSQQWLx1ClzTuhlRiXljh+zs8HLlMOSYCRhXxaUDzHnhmEYg+TbUEUy5+TDePB
 oyes9R291cJfW83uI3/sbd8lRUi4i9ddPO2xNQrX4om5FNueCWpk1KiPms5u/u6x8+7h
 pGFcREhHBGVm/kvTXmmgemChao6ETAtYHgFEbaJS1wXym3XRWJ8qq59uRi1G9crGGbzj
 OfG4aRhn9n5fBkiSW5knsOyxlJZB0TMh2sxBuA9rbsTynVepXxdlxRuqLthwLPckfebW
 6nDGXccGeCyMJ9EMTh+41FQPtd9NRWZ0RgY10FRQZvN0NBa1hJQrM/plvMjObSkKD21T 3Q== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360wgfmeg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:12:31 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BN9uPa009926;
 Mon, 11 Jan 2021 23:12:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 35y448sy9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 23:12:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BNCT4k27263276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 23:12:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EC8A78063;
 Mon, 11 Jan 2021 23:12:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D15507805E;
 Mon, 11 Jan 2021 23:12:28 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 23:12:28 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v4 03/21] ibmvfc: init/free event pool during queue
 allocation/free
Date: Mon, 11 Jan 2021 17:12:07 -0600
Message-Id: <20210111231225.105347-4-tyreld@linux.ibm.com>
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

The event pool and CRQ used to be separate entities of the adapter host
structure and as such were allocated and freed independently of each
other. Recent work as defined a generic queue structure with an event
pool specific to each queue. As such the event pool for each queue
shouldn't be allocated/freed independently, but instead performed as
part of the queue allocation/free routines.

Move the calls to ibmvfc_event_pool_{init|free} into
ibmvfc_{alloc|free}_queue respectively. The only functional change here
is that the CRQ cannot be released in ibmvfc_remove until after the
event pool has been successfully purged since releasing the queue will
also free the event pool.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index cd9273a5fadb..9330f5a65a7e 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -807,6 +807,8 @@ static void ibmvfc_free_queue(struct ibmvfc_host *vhost,
 	dma_unmap_single(dev, queue->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
 	free_page((unsigned long)queue->msgs.handle);
 	queue->msgs.handle = NULL;
+
+	ibmvfc_free_event_pool(vhost, queue);
 }
 
 /**
@@ -5019,6 +5021,10 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
 	switch (fmt) {
 	case IBMVFC_CRQ_FMT:
 		fmt_size = sizeof(*queue->msgs.crq);
+		if (ibmvfc_init_event_pool(vhost, queue)) {
+			dev_err(dev, "Couldn't initialize event pool.\n");
+			return -ENOMEM;
+		}
 		break;
 	case IBMVFC_ASYNC_FMT:
 		fmt_size = sizeof(*queue->msgs.async);
@@ -5333,13 +5339,8 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 		goto kill_kthread;
 	}
 
-	if ((rc = ibmvfc_init_event_pool(vhost, &vhost->crq))) {
-		dev_err(dev, "Couldn't initialize event pool. rc=%d\n", rc);
-		goto release_crq;
-	}
-
 	if ((rc = scsi_add_host(shost, dev)))
-		goto release_event_pool;
+		goto release_crq;
 
 	fc_host_dev_loss_tmo(shost) = IBMVFC_DEV_LOSS_TMO;
 
@@ -5362,8 +5363,6 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 
 remove_shost:
 	scsi_remove_host(shost);
-release_event_pool:
-	ibmvfc_free_event_pool(vhost, &vhost->crq);
 release_crq:
 	ibmvfc_release_crq_queue(vhost);
 kill_kthread:
@@ -5398,7 +5397,6 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
 	ibmvfc_wait_while_resetting(vhost);
-	ibmvfc_release_crq_queue(vhost);
 	kthread_stop(vhost->work_thread);
 	fc_remove_host(vhost->host);
 	scsi_remove_host(vhost->host);
@@ -5408,7 +5406,7 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 	list_splice_init(&vhost->purge, &purge);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
 	ibmvfc_complete_purge(&purge);
-	ibmvfc_free_event_pool(vhost, &vhost->crq);
+	ibmvfc_release_crq_queue(vhost);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
-- 
2.27.0

