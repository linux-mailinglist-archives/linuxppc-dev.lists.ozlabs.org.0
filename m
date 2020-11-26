Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F82C4D0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:02:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChLcs3HnwzDr1S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:02:53 +1100 (AEDT)
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
 header.s=pp1 header.b=NeQWGP5M; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChLJP3mmhzDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 12:48:37 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ1VdpW145970; Wed, 25 Nov 2020 20:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eQLPrpmDLn0mKDW30XVCZe15M7EbeGguUVmQUeWFaO0=;
 b=NeQWGP5MRi87wpW9xwgZyxokbB2RmPgoSugTI1TFvmQJ1CCxbtHB2I4CKHP7nRSoh6Ph
 dNaCrZjUl2J4+MJaj8Cl988bJtGpu0vbdP34ukxq6OPbM803/t7F+20r+CmwFKm5APOQ
 nbM5X9jdCxRcrp1j9z7FVHz/HcIWFYiAjxoVEgNgf47IBnCTbxjZzIoLyaeTYobp+3fX
 kdlfuTaQa9VsYvWmSIRopxtUJXsYWxMwSkkiU0sE3lmkY5/uu6aMw/696WDg1V41ayUo
 MsLalqwnMsZ4cAeWEyBIYO+wyV43j/33RxJq2GFb1Gy02j7zu0jRt1YqVUTciwMt7N8B pA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351wndpsvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 20:48:32 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ1m8dN028849;
 Thu, 26 Nov 2020 01:48:32 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34xth9vrqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 01:48:32 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ1mUeV18088382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 01:48:31 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8BCC6E053;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E4FC6E052;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 01:48:30 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 03/13] ibmvfc: add Subordinate CRQ definitions
Date: Wed, 25 Nov 2020 19:48:14 -0600
Message-Id: <20201126014824.123831-4-tyreld@linux.ibm.com>
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
 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260001
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

Subordinate Command Response Queues (Sub CRQ) are used in conjunction
with the primary CRQ when more than one queue is needed by the virtual
IO adapter. Recent phyp firmware versions support Sub CRQ's with ibmvfc
adapters. This feature is a prerequisite for supporting multiple
hardware backed submission queues in the vfc adapter.

The Sub CRQ command element differs from the standard CRQ in that it is
32bytes long as opposed to 16bytes for the latter. Despite this extra
16bytes the ibmvfc protocol will use the original CRQ command element
mapped to the first 16bytes of the Sub CRQ element initially.

Add definitions for the Sub CRQ command element and queue.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
index 8225bdbb127e..084ecdfe51ea 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.h
+++ b/drivers/scsi/ibmvscsi/ibmvfc.h
@@ -656,6 +656,29 @@ struct ibmvfc_crq_queue {
 	dma_addr_t msg_token;
 };
 
+struct ibmvfc_sub_crq {
+	struct ibmvfc_crq crq;
+	__be64 reserved[2];
+} __packed __aligned(8);
+
+struct ibmvfc_sub_queue {
+	struct ibmvfc_sub_crq *msgs;
+	dma_addr_t msg_token;
+	int size, cur;
+	struct ibmvfc_host *vhost;
+	unsigned long cookie;
+	unsigned long vios_cookie;
+	unsigned long hw_irq;
+	unsigned long irq;
+	unsigned long hwq_id;
+	char name[32];
+};
+
+struct ibmvfc_scsi_channels {
+	struct ibmvfc_sub_queue *scrqs;
+	unsigned int active_queues;
+};
+
 enum ibmvfc_ae_link_state {
 	IBMVFC_AE_LS_LINK_UP		= 0x01,
 	IBMVFC_AE_LS_LINK_BOUNCED	= 0x02,
-- 
2.27.0

