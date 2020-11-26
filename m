Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3892C4D25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:12:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChLr62cl5zDqwh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:12:38 +1100 (AEDT)
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
 header.s=pp1 header.b=hOrrh5Sd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChLJS3Mf6zDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 12:48:40 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ1X1Ac049785; Wed, 25 Nov 2020 20:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o/pGIYtwE4Sm4u8753zKSwRGWf78EVCdMHIKOHqbh/g=;
 b=hOrrh5SdM2Nm/+cWmJvmK+f9HTR93HwBKcT9jAf1ezjn221+ysO9t2NQ/IqaAxSk1Q+c
 idyqcLQ0Jd+yu/lZ566SE6f4OuZyky3B3Ae30mkvr9JbmTmFdq0hvU0GbVoq23j/Oaas
 TQPjskSL2VXumzOqtPrdSyC4v6W/om2BNHPs37+5VVRif/q8ywE2LHihdwKG+1Wo3NZr
 h8yZ+bJQD5504+unQSIJcVB4cyRcGik7UXUirlk/I/IuiwrjPEA5VEl9ig1GoGFv6/rV
 t740hJtvyz7KaD0mBoc/tAtADldvshSOtyeZZbz2tJjnGthdP1fv06vAIdl0Z6QqqYWa 4g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3520xstewm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 20:48:36 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ1mRcO028986;
 Thu, 26 Nov 2020 01:48:35 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 34xth9vrqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 01:48:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ1mX3r65929524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 01:48:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE826E054;
 Thu, 26 Nov 2020 01:48:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80B366E052;
 Thu, 26 Nov 2020 01:48:33 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 01:48:33 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 11/13] ibmvfc: set and track hw queue in ibmvfc_event struct
Date: Wed, 25 Nov 2020 19:48:22 -0600
Message-Id: <20201126014824.123831-12-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126014824.123831-1-tyreld@linux.ibm.com>
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_14:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=1
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260005
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

Extract the hwq id from a SCSI command and store it in the ibmvfc_event
structure to identify which Sub-CRQ to send the command down when
channels are being utilized.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 5 +++++
 drivers/scsi/ibmvscsi/ibmvfc.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 55893d09f883..f686c2cb0de2 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1387,6 +1387,7 @@ static void ibmvfc_init_event(struct ibmvfc_event *evt,
 	evt->crq.format = format;
 	evt->done = done;
 	evt->eh_comp = NULL;
+	evt->hwq = 0;
 }
 
 /**
@@ -1738,6 +1739,8 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	struct ibmvfc_cmd *vfc_cmd;
 	struct ibmvfc_fcp_cmd_iu *iu;
 	struct ibmvfc_event *evt;
+	u32 tag_and_hwq = blk_mq_unique_tag(cmnd->request);
+	u16 hwq = blk_mq_unique_tag_to_hwq(tag_and_hwq);
 	int rc;
 
 	if (unlikely((rc = fc_remote_port_chkready(rport))) ||
@@ -1765,6 +1768,8 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
 	}
 
 	vfc_cmd->correlation = cpu_to_be64(evt);
+	if (vhost->using_channels)
+		evt->hwq = hwq % vhost->scsi_scrqs.active_queues;
 
 	if (likely(!(rc = ibmvfc_map_sg_data(cmnd, evt, vfc_cmd, vhost->dev))))
 		return ibmvfc_send_event(evt, vhost, 0);
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 04086ffbfca7..abda910ae33d 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -781,6 +781,7 @@ struct ibmvfc_event {
 	struct completion comp;
 	struct completion *eh_comp;
 	struct timer_list timer;
+	u16 hwq;
 };
 
 /* a pool of event structs for use */
-- 
2.27.0

