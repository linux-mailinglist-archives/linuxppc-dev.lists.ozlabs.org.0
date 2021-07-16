Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689633CBE10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 22:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRNjl1BqKz3bk5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 06:52:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLllTL+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kLllTL+/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRNjB0Zqjz309X
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 06:52:29 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GKYI1D143184; Fri, 16 Jul 2021 16:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=b+jUyZpXkbPxHX+FcKkiHQHFGel43oMdtxDCCp0cFjU=;
 b=kLllTL+/hh0JP/3FKmbpmfu4SJYWv60jWjPuiP+yrqadvMegD48HFrrKsGcZDhs/5+/0
 osqpODZHY73JFBKn9s3QYNiiTVuY8W0H2D58UlCgxX9i3HcTTjc24loHb+7Ym2xl7pik
 BpMIWNPTG4FUHX9Sl6upJZh4NwfQXtzPaNuftpxt1SVGzhbTlE4onHtlVK65xl5K2asg
 +gLsbjf+JEA2mJLlUsM1uL/E/PwPcAK8Cu8lpCXosjsq9hPCwK+dt6n6pc6gvIi2ySgR
 HtgXRJnpYWM+3yrXGz/e0wUGsrqWRilP3Doo1Nox7NZrRDBGVseyniFt0ia6AtSKOebu BQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ugn6he9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 16:52:25 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GKmGXJ021484;
 Fri, 16 Jul 2021 20:52:25 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgyaun5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 20:52:24 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GKqNEj13173176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 20:52:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 596E96A061;
 Fri, 16 Jul 2021 20:52:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC7526A058;
 Fri, 16 Jul 2021 20:52:22 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 20:52:22 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvfc: fix command state accounting and stale response
 detection
Date: Fri, 16 Jul 2021 14:52:20 -0600
Message-Id: <20210716205220.1101150-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kgFMg1E-lAw2OAwCgTeTzaPXW6JJgyAP
X-Proofpoint-ORIG-GUID: kgFMg1E-lAw2OAwCgTeTzaPXW6JJgyAP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_09:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160130
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
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior to commit 1f4a4a19508d ("scsi: ibmvfc: Complete commands outside
the host/queue lock") responses to commands were completed sequentially
with the host lock held such that a command had a basic binary state of
active or free. It was therefore a simple affair of ensuring the
assocaiated ibmvfc_event to a VIOS response was valid by testing that it
was not already free. The lock relexation work to complete commands
outside the lock inadverdently made it a trinary command state such that
a command is either in flight, received and being completed, or
completed and now free. This breaks the stale command detection logic as
a command may be still marked active and been placed on the delayed
completion list when a second stale response for the same command
arrives. This can lead to double completions and list corruption. This
issue was exposed by a recent VIOS regression were a missing memory
barrier could occasionally result in the ibmvfc client receiveing a
duplicate response for the same command.

Fix the issue by introducing the atomic ibmvfc_event.active to track the
trinary state of a command. The state is explicitly set to 1 when a
command is successfully sent. The CRQ response handlers use
atomic_dec_if_positive() to test for stale responses and correctly
transition to the completion state when a active command is received.
Finally, atomic_dec_and_test() is used to sanity check transistions
when commands are freed as a result of a completion, or moved to the
purge list as a result of error handling or adapter reset.

Cc: stable@vger.kernel.org
Fixes: 1f4a4a19508d ("scsi: ibmvfc: Complete commands outside the host/queue lock")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 19 +++++++++++++++++--
 drivers/scsi/ibmvscsi/ibmvfc.h |  1 +
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index bee1bec49c09..935b01ee44b7 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -807,6 +807,13 @@ static int ibmvfc_init_event_pool(struct ibmvfc_host *vhost,
 	for (i = 0; i < size; ++i) {
 		struct ibmvfc_event *evt = &pool->events[i];
 
+		/*
+		 * evt->active states
+		 *  1 = in flight
+		 *  0 = being completed
+		 * -1 = free/freed
+		 */
+		atomic_set(&evt->active, -1);
 		atomic_set(&evt->free, 1);
 		evt->crq.valid = 0x80;
 		evt->crq.ioba = cpu_to_be64(pool->iu_token + (sizeof(*evt->xfer_iu) * i));
@@ -1017,6 +1024,7 @@ static void ibmvfc_free_event(struct ibmvfc_event *evt)
 
 	BUG_ON(!ibmvfc_valid_event(pool, evt));
 	BUG_ON(atomic_inc_return(&evt->free) != 1);
+	BUG_ON(atomic_dec_and_test(&evt->active));
 
 	spin_lock_irqsave(&evt->queue->l_lock, flags);
 	list_add_tail(&evt->queue_list, &evt->queue->free);
@@ -1072,6 +1080,12 @@ static void ibmvfc_complete_purge(struct list_head *purge_list)
  **/
 static void ibmvfc_fail_request(struct ibmvfc_event *evt, int error_code)
 {
+	/*
+	 * Anything we are failing should still be active. Otherwise, it
+	 * implies we already got a response for the command and are doing
+	 * something bad like double completing it.
+	 */
+	BUG_ON(!atomic_dec_and_test(&evt->active));
 	if (evt->cmnd) {
 		evt->cmnd->result = (error_code << 16);
 		evt->done = ibmvfc_scsi_eh_done;
@@ -1723,6 +1737,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 
 		evt->done(evt);
 	} else {
+		atomic_set(&evt->active, 1);
 		spin_unlock_irqrestore(&evt->queue->l_lock, flags);
 		ibmvfc_trc_start(evt);
 	}
@@ -3251,7 +3266,7 @@ static void ibmvfc_handle_crq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost,
 		return;
 	}
 
-	if (unlikely(atomic_read(&evt->free))) {
+	if (unlikely(atomic_dec_if_positive(&evt->active))) {
 		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
 			crq->ioba);
 		return;
@@ -3778,7 +3793,7 @@ static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost
 		return;
 	}
 
-	if (unlikely(atomic_read(&evt->free))) {
+	if (unlikely(atomic_dec_if_positive(&evt->active))) {
 		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
 			crq->ioba);
 		return;
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 4f0f3baefae4..92fb889d7eb0 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -745,6 +745,7 @@ struct ibmvfc_event {
 	struct ibmvfc_target *tgt;
 	struct scsi_cmnd *cmnd;
 	atomic_t free;
+	atomic_t active;
 	union ibmvfc_iu *xfer_iu;
 	void (*done)(struct ibmvfc_event *evt);
 	void (*_done)(struct ibmvfc_event *evt);
-- 
2.27.0

