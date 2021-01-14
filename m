Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E142F6CD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 22:05:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGxfl3zgyzDsdq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 08:05:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HSd1Ubrq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGww338WhzDrRB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 07:32:03 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10EKKntc186081; Thu, 14 Jan 2021 15:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lqJX5KIw2JgSFcZPOaCXc/4q+kuQCWiYmoDWMGLj0/o=;
 b=HSd1Ubrq2c0VC6chr/TjbKvhLQFk1Tq97BTVKysMkHj9equhYgpUTZrfC9ZWPFza0C2t
 wmarXlO387SmuF4M/ui2diqxvOisVDFIwRiejHFsnqrw945JFTSkIB2CEeJn7040I7bq
 Xayb6mZ0OT/FSYDPLk1vRmZYYrMNJ4lNOOZd5V8YOrMIDEpZ02vkrhrUz3ooFHmcDlRs
 IHQi90s3vGzZ13DedfW7bUaDDi10Z9/aJmWMa8c2wLMOkX3lRWn/7JyVmJfHQXmRiniv
 zfE2uDBqVjiIY/JUmKNHG1HOJTQVMw7SDXB9qtbUTkZQbItf+bX6UGt7EXDmGV1N3iRC gw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362vwr07dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 15:32:00 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10EKHGsK004688;
 Thu, 14 Jan 2021 20:31:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 35y449fryg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 20:31:57 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EKVuDQ38273384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 20:31:56 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FB9E6E050;
 Thu, 14 Jan 2021 20:31:56 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0FAA6E052;
 Thu, 14 Jan 2021 20:31:55 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 20:31:55 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v5 14/21] ibmvfc: set and track hw queue in ibmvfc_event struct
Date: Thu, 14 Jan 2021 14:31:41 -0600
Message-Id: <20210114203148.246656-15-tyreld@linux.ibm.com>
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
 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian King <brking@linux.vnet.ibm.com>, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extract the hwq id from a SCSI command and store it in the ibmvfc_event
structure to identify which Sub-CRQ to send the command down when
channels are being utilized.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 5 +++++
 drivers/scsi/ibmvscsi/ibmvfc.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 0653d52d4ea0..3f3cc37a263f 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1483,6 +1483,7 @@ static void ibmvfc_init_event(struct ibmvfc_event *evt,
 		evt->_done = done;
 		evt->done = ibmvfc_locked_done;
 	}
+	evt->hwq = 0;
 }
 
 /**
@@ -1839,6 +1840,8 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	struct ibmvfc_cmd *vfc_cmd;
 	struct ibmvfc_fcp_cmd_iu *iu;
 	struct ibmvfc_event *evt;
+	u32 tag_and_hwq = blk_mq_unique_tag(cmnd->request);
+	u16 hwq = blk_mq_unique_tag_to_hwq(tag_and_hwq);
 	int rc;
 
 	if (unlikely((rc = fc_remote_port_chkready(rport))) ||
@@ -1865,6 +1868,8 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	}
 
 	vfc_cmd->correlation = cpu_to_be64((u64)evt);
+	if (vhost->using_channels)
+		evt->hwq = hwq % vhost->scsi_scrqs.active_queues;
 
 	if (likely(!(rc = ibmvfc_map_sg_data(cmnd, evt, vfc_cmd, vhost->dev))))
 		return ibmvfc_send_event(evt, vhost, 0);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 3d76cd3c1fd9..2dbce7071409 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -753,6 +753,7 @@ struct ibmvfc_event {
 	struct completion comp;
 	struct completion *eh_comp;
 	struct timer_list timer;
+	u16 hwq;
 };
 
 /* a pool of event structs for use */
-- 
2.27.0

