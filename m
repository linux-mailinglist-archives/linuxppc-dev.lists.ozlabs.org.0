Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D152CCCB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:37:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmg3T0ls7zDrh6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:37:25 +1100 (AEDT)
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
 header.s=pp1 header.b=kkMLOCFl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmfQ14xqKzDrCC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:08:25 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3250jC128371; Wed, 2 Dec 2020 21:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DPj0YSggplOvuiVrgSY90VVLutSqNS/gveNO1fE1x98=;
 b=kkMLOCFlfmRoZSr/XiD8jrSYWGvp4iZTimyP4pRnl5fJkOi8+4gLNDB4qgYMkT9e7Zcr
 WWgPVoOzOFB3yHNJZL9rj2ko4Uk25Nf+0P6hMWREVYDy7baknJ0jrTzMsCX0ujWso/1r
 nedsRBY/ItEOUWwgqgetvznjKV7im8IZjy2sI3C1k3q7YIDHV/r/F909a+A/EzakK+Sq
 0RSvYa9/+yQqZAZqOGDFzsEB828dyRpyJ5Mb6tKcdRZJslmHEwd+DFlKsolyq/tNOOoh
 w4Y55SWR9pUPgWQkzgNjrUvS4nKW0yCgO6Y+Ho0XqsroDTmul+gzHgsza9/uVl3SDcTa Cw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356p2kh3nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 21:08:23 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B327Wmk010529;
 Thu, 3 Dec 2020 02:08:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 355rf7pxbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 02:08:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B328Eet22807166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 02:08:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 031207805F;
 Thu,  3 Dec 2020 02:08:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7910D78068;
 Thu,  3 Dec 2020 02:08:20 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 02:08:20 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 17/18] ibmvfc: provide modules parameters for MQ settings
Date: Wed,  2 Dec 2020 20:08:05 -0600
Message-Id: <20201203020806.14747-18-tyreld@linux.ibm.com>
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
 suspectscore=1
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add the various module parameter toggles for adjusting the MQ
characteristics at boot/load time as well as a device attribute for
changing the client scsi channel request amount.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 76 +++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index e353b9e88104..e499599662ec 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -40,6 +40,12 @@ static unsigned int disc_threads = IBMVFC_MAX_DISC_THREADS;
 static unsigned int ibmvfc_debug = IBMVFC_DEBUG;
 static unsigned int log_level = IBMVFC_DEFAULT_LOG_LEVEL;
 static unsigned int cls3_error = IBMVFC_CLS3_ERROR;
+static unsigned int mq_enabled = IBMVFC_MQ;
+static unsigned int nr_scsi_hw_queues = IBMVFC_SCSI_HW_QUEUES;
+static unsigned int nr_scsi_channels = IBMVFC_SCSI_CHANNELS;
+static unsigned int mig_channels_only = IBMVFC_MIG_NO_SUB_TO_CRQ;
+static unsigned int mig_no_less_channels = IBMVFC_MIG_NO_N_TO_M;
+
 static LIST_HEAD(ibmvfc_head);
 static DEFINE_SPINLOCK(ibmvfc_driver_lock);
 static struct scsi_transport_template *ibmvfc_transport_template;
@@ -49,6 +55,22 @@ MODULE_AUTHOR("Brian King <brking@linux.vnet.ibm.com>");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(IBMVFC_DRIVER_VERSION);
 
+module_param_named(mq, mq_enabled, uint, S_IRUGO);
+MODULE_PARM_DESC(mq, "Enable multiqueue support. "
+		 "[Default=" __stringify(IBMVFC_MQ) "]");
+module_param_named(scsi_host_queues, nr_scsi_hw_queues, uint, S_IRUGO);
+MODULE_PARM_DESC(scsi_host_queues, "Number of SCSI Host submission queues. "
+		 "[Default=" __stringify(IBMVFC_SCSI_HW_QUEUES) "]");
+module_param_named(scsi_hw_channels, nr_scsi_channels, uint, S_IRUGO);
+MODULE_PARM_DESC(scsi_hw_channels, "Number of hw scsi channels to request. "
+		 "[Default=" __stringify(IBMVFC_SCSI_CHANNELS) "]");
+module_param_named(mig_channels_only, mig_channels_only, uint, S_IRUGO);
+MODULE_PARM_DESC(mig_channels_only, "Prevent migration to non-channelized system. "
+		 "[Default=" __stringify(IBMVFC_MIG_NO_SUB_TO_CRQ) "]");
+module_param_named(mig_no_less_channels, mig_no_less_channels, uint, S_IRUGO);
+MODULE_PARM_DESC(mig_no_less_channels, "Prevent migration to system with less channels. "
+		 "[Default=" __stringify(IBMVFC_MIG_NO_N_TO_M) "]");
+
 module_param_named(init_timeout, init_timeout, uint, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(init_timeout, "Initialization timeout in seconds. "
 		 "[Default=" __stringify(IBMVFC_INIT_TIMEOUT) "]");
@@ -823,7 +845,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	crq->cur = 0;
 
 	if (vhost->scsi_scrqs.scrqs) {
-		for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+		for (i = 0; i < nr_scsi_hw_queues; i++) {
 			scrq = &vhost->scsi_scrqs.scrqs[i];
 			memset(scrq->msgs, 0, PAGE_SIZE);
 			scrq->cur = 0;
@@ -3234,6 +3256,37 @@ static ssize_t ibmvfc_store_log_level(struct device *dev,
 	return strlen(buf);
 }
 
+static ssize_t ibmvfc_show_scsi_channels(struct device *dev,
+					 struct device_attribute *attr, char *buf)
+{
+	struct Scsi_Host *shost = class_to_shost(dev);
+	struct ibmvfc_host *vhost = shost_priv(shost);
+	unsigned long flags = 0;
+	int len;
+
+	spin_lock_irqsave(shost->host_lock, flags);
+	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->client_scsi_channels);
+	spin_unlock_irqrestore(shost->host_lock, flags);
+	return len;
+}
+
+static ssize_t ibmvfc_store_scsi_channels(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct Scsi_Host *shost = class_to_shost(dev);
+	struct ibmvfc_host *vhost = shost_priv(shost);
+	unsigned long flags = 0;
+	unsigned int channels;
+
+	spin_lock_irqsave(shost->host_lock, flags);
+	channels = simple_strtoul(buf, NULL, 10);
+	vhost->client_scsi_channels = min(channels, nr_scsi_hw_queues);
+	ibmvfc_hard_reset_host(vhost);
+	spin_unlock_irqrestore(shost->host_lock, flags);
+	return strlen(buf);
+}
+
 static DEVICE_ATTR(partition_name, S_IRUGO, ibmvfc_show_host_partition_name, NULL);
 static DEVICE_ATTR(device_name, S_IRUGO, ibmvfc_show_host_device_name, NULL);
 static DEVICE_ATTR(port_loc_code, S_IRUGO, ibmvfc_show_host_loc_code, NULL);
@@ -3242,6 +3295,8 @@ static DEVICE_ATTR(npiv_version, S_IRUGO, ibmvfc_show_host_npiv_version, NULL);
 static DEVICE_ATTR(capabilities, S_IRUGO, ibmvfc_show_host_capabilities, NULL);
 static DEVICE_ATTR(log_level, S_IRUGO | S_IWUSR,
 		   ibmvfc_show_log_level, ibmvfc_store_log_level);
+static DEVICE_ATTR(nr_scsi_channels, S_IRUGO | S_IWUSR,
+		   ibmvfc_show_scsi_channels, ibmvfc_store_scsi_channels);
 
 #ifdef CONFIG_SCSI_IBMVFC_TRACE
 /**
@@ -3298,6 +3353,7 @@ static struct device_attribute *ibmvfc_attrs[] = {
 	&dev_attr_npiv_version,
 	&dev_attr_capabilities,
 	&dev_attr_log_level,
+	&dev_attr_nr_scsi_channels,
 	NULL
 };
 
@@ -4685,9 +4741,9 @@ static void ibmvfc_channel_enquiry(struct ibmvfc_host *vhost)
 	mad->common.opcode = cpu_to_be32(IBMVFC_CHANNEL_ENQUIRY);
 	mad->common.length = cpu_to_be16(sizeof(*mad));
 
-	if (IBMVFC_MIG_NO_SUB_TO_CRQ)
+	if (mig_channels_only)
 		mad->flags |= cpu_to_be32(IBMVFC_NO_CHANNELS_TO_CRQ_SUPPORT);
-	if (IBMVFC_MIG_NO_N_TO_M)
+	if (mig_no_less_channels)
 		mad->flags |= cpu_to_be32(IBMVFC_NO_N_TO_M_CHANNELS_SUPPORT);
 
 	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT_WAIT);
@@ -5426,13 +5482,13 @@ static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 
 	ENTER;
 
-	vhost->scsi_scrqs.scrqs = kcalloc(IBMVFC_SCSI_HW_QUEUES,
+	vhost->scsi_scrqs.scrqs = kcalloc(nr_scsi_hw_queues,
 					  sizeof(*vhost->scsi_scrqs.scrqs),
 					  GFP_KERNEL);
 	if (!vhost->scsi_scrqs.scrqs)
 		return -1;
 
-	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+	for (i = 0; i < nr_scsi_hw_queues; i++) {
 		if (ibmvfc_register_scsi_channel(vhost, i)) {
 			for (j = i; j > 0; j--)
 				ibmvfc_deregister_scsi_channel(vhost, j - 1);
@@ -5456,7 +5512,7 @@ static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
 	if (!vhost->scsi_scrqs.scrqs)
 		return;
 
-	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++)
+	for (i = 0; i < nr_scsi_hw_queues; i++)
 		ibmvfc_deregister_scsi_channel(vhost, i);
 
 	kfree(vhost->scsi_scrqs.scrqs);
@@ -5668,13 +5724,13 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	}
 
 	shost->transportt = ibmvfc_transport_template;
-	shost->can_queue = (max_requests / IBMVFC_SCSI_HW_QUEUES);
+	shost->can_queue = (max_requests / nr_scsi_hw_queues);
 	shost->max_lun = max_lun;
 	shost->max_id = max_targets;
 	shost->max_sectors = IBMVFC_MAX_SECTORS;
 	shost->max_cmd_len = IBMVFC_MAX_CDB_LEN;
 	shost->unique_id = shost->host_no;
-	shost->nr_hw_queues = IBMVFC_SCSI_HW_QUEUES;
+	shost->nr_hw_queues = nr_scsi_hw_queues;
 
 	vhost = shost_priv(shost);
 	INIT_LIST_HEAD(&vhost->sent);
@@ -5687,8 +5743,8 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	vhost->log_level = log_level;
 	vhost->task_set = 1;
 
-	vhost->mq_enabled = IBMVFC_MQ;
-	vhost->client_scsi_channels = IBMVFC_SCSI_CHANNELS;
+	vhost->mq_enabled = mq_enabled;
+	vhost->client_scsi_channels = min(nr_scsi_hw_queues, nr_scsi_channels);
 	vhost->using_channels = 0;
 	vhost->do_enquiry = 1;
 
-- 
2.27.0

