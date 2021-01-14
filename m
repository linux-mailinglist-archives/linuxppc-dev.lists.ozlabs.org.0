Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFA2F6CC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 21:59:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxX84kYtzDqM9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 07:59:52 +1100 (AEDT)
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
 header.s=pp1 header.b=S9ZbKLoy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGww31qN4zDrR5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:32:03 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EK2riw051326; Thu, 14 Jan 2021 15:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KJuvTZ9SlAAfX4HEuXhK5kdGQ8DRK12f0BqL9jyuIlo=;
 b=S9ZbKLoy8dGOXJVHzQ9RcaQlRWloyxj9+ckDIIIYeRuVXqFXWN1HjmLKX3bO6nYU13l2
 LeyzeetHTI91IrKpsYkQ+cztm68/332PJF9UKBmQX2N77lCUYeaCkSG/V668LslUcX9V
 4eIC0iA2IJ4Uf9mgg6Sf6Yk+OVD5fDbbAolCu/9hcL4zEAjrRdoZET0Nn9xJDYPbO7VV
 hqyP9FS1HL9c/4+J2JDodZZTtiL3G2+q84kvLeFdmxtsLIPD0gDvpEVtioCzCfBEkpeu
 CUQTQBy2jWtSXCLeALUwi250H5VG273H4qqNW36C9BLgY0KLoAcZsT/0lRAw5av39ifH 2w== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362v29sgje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:32:01 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKS7RL026094;
 Thu, 14 Jan 2021 20:32:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 35y449snet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:32:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVxbi26083768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:59 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E78F46E052;
 Thu, 14 Jan 2021 20:31:58 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 929B16E04E;
 Thu, 14 Jan 2021 20:31:58 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:58 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 21/21] ibmvfc: provide modules parameters for MQ settings
Date: Thu, 14 Jan 2021 14:31:48 -0600
Message-Id: <20210114203148.246656-22-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210114203148.246656-1-tyreld@linux.ibm.com>
References: <20210114203148.246656-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_07:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140115
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
 drivers/scsi/ibmvscsi/ibmvfc.c | 75 ++++++++++++++++++++++++++++++----
 drivers/scsi/ibmvscsi/ibmvfc.h |  1 +
 2 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d314dffaafc4..7097028d4cb6 100644
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
@@ -926,7 +948,7 @@ static int ibmvfc_reset_crq(struct ibmvfc_host *vhost)
 	crq->cur = 0;
 
 	if (vhost->scsi_scrqs.scrqs) {
-		for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
+		for (i = 0; i < nr_scsi_hw_queues; i++) {
 			scrq = &vhost->scsi_scrqs.scrqs[i];
 			spin_lock(scrq->q_lock);
 			memset(scrq->msgs.scrq, 0, PAGE_SIZE);
@@ -3397,6 +3419,37 @@ static ssize_t ibmvfc_store_log_level(struct device *dev,
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
@@ -3405,6 +3458,8 @@ static DEVICE_ATTR(npiv_version, S_IRUGO, ibmvfc_show_host_npiv_version, NULL);
 static DEVICE_ATTR(capabilities, S_IRUGO, ibmvfc_show_host_capabilities, NULL);
 static DEVICE_ATTR(log_level, S_IRUGO | S_IWUSR,
 		   ibmvfc_show_log_level, ibmvfc_store_log_level);
+static DEVICE_ATTR(nr_scsi_channels, S_IRUGO | S_IWUSR,
+		   ibmvfc_show_scsi_channels, ibmvfc_store_scsi_channels);
 
 #ifdef CONFIG_SCSI_IBMVFC_TRACE
 /**
@@ -3461,6 +3516,7 @@ static struct device_attribute *ibmvfc_attrs[] = {
 	&dev_attr_npiv_version,
 	&dev_attr_capabilities,
 	&dev_attr_log_level,
+	&dev_attr_nr_scsi_channels,
 	NULL
 };
 
@@ -4866,9 +4922,9 @@ static void ibmvfc_channel_enquiry(struct ibmvfc_host *vhost)
 	mad->common.opcode = cpu_to_be32(IBMVFC_CHANNEL_ENQUIRY);
 	mad->common.length = cpu_to_be16(sizeof(*mad));
 
-	if (IBMVFC_MIG_NO_SUB_TO_CRQ)
+	if (mig_channels_only)
 		mad->flags |= cpu_to_be32(IBMVFC_NO_CHANNELS_TO_CRQ_SUPPORT);
-	if (IBMVFC_MIG_NO_N_TO_M)
+	if (mig_no_less_channels)
 		mad->flags |= cpu_to_be32(IBMVFC_NO_N_TO_M_CHANNELS_SUPPORT);
 
 	ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_INIT_WAIT);
@@ -5655,13 +5711,13 @@ static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
 
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
@@ -5685,7 +5741,7 @@ static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
 	if (!vhost->scsi_scrqs.scrqs)
 		return;
 
-	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++)
+	for (i = 0; i < nr_scsi_hw_queues; i++)
 		ibmvfc_deregister_scsi_channel(vhost, i);
 
 	kfree(vhost->scsi_scrqs.scrqs);
@@ -5873,6 +5929,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	struct Scsi_Host *shost;
 	struct device *dev = &vdev->dev;
 	int rc = -ENOMEM;
+	unsigned int max_scsi_queues = IBMVFC_MAX_SCSI_QUEUES;
 
 	ENTER;
 	shost = scsi_host_alloc(&driver_template, sizeof(*vhost));
@@ -5888,7 +5945,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	shost->max_sectors = IBMVFC_MAX_SECTORS;
 	shost->max_cmd_len = IBMVFC_MAX_CDB_LEN;
 	shost->unique_id = shost->host_no;
-	shost->nr_hw_queues = IBMVFC_MQ ? IBMVFC_SCSI_HW_QUEUES : 1;
+	shost->nr_hw_queues = mq_enabled ? min(max_scsi_queues, nr_scsi_hw_queues) : 1;
 
 	vhost = shost_priv(shost);
 	INIT_LIST_HEAD(&vhost->targets);
@@ -5900,8 +5957,8 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	vhost->log_level = log_level;
 	vhost->task_set = 1;
 
-	vhost->mq_enabled = IBMVFC_MQ;
-	vhost->client_scsi_channels = IBMVFC_SCSI_CHANNELS;
+	vhost->mq_enabled = mq_enabled;
+	vhost->client_scsi_channels = min(shost->nr_hw_queues, nr_scsi_channels);
 	vhost->using_channels = 0;
 	vhost->do_enquiry = 1;
 
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 0391cb746d0b..19dcec3ae9ba 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -43,6 +43,7 @@
 #define IBMVFC_CLS3_ERROR		0
 #define IBMVFC_MQ			1
 #define IBMVFC_SCSI_CHANNELS		8
+#define IBMVFC_MAX_SCSI_QUEUES		16
 #define IBMVFC_SCSI_HW_QUEUES		8
 #define IBMVFC_MIG_NO_SUB_TO_CRQ	0
 #define IBMVFC_MIG_NO_N_TO_M		0
-- 
2.27.0

