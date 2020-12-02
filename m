Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE3F2CB221
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:13:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm1Dx64DXzDq9L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:13:21 +1100 (AEDT)
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
 header.s=pp1 header.b=EIf38CPN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm0pK1JlmzDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 11:53:44 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B20WsRo021990; Tue, 1 Dec 2020 19:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u2xYXWvqOEeTwsdRseMpEIlPH49x6TjgdRhxhTmGPI4=;
 b=EIf38CPN/Bb1Aj3+hLKEvj+x2jasQ1SXByEfotXjr/edjb6gzFl6TUT7/8aZHps1djBk
 7gqM0Ec5bp1Tpwh3m+VIkf3GfG1cA64SqNLaHFFoRCtkqkfyqC6joWLMjq7euNlPT5WZ
 G7EJo/el3vAPEM6cjXONz+BSxzPvsrT7/PW2T2SBTbuUfy3I/hvF0S/BNvtrlgY738jW
 9CnOCEw2GC4rVkWuiP9xRIcZ9Y7WIdF/Qkb6sl7q9AuVhPlWayUNYJI5RkyB71F8m/LX
 FVuEBQG5CznQIY0O2kLWqvygBCWzfZJNQmvugnbbQLS3ZkzFyXZTHABkG+LQPAEvRaaT 8g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355jjp4c33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 19:53:38 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B20bNRb013472;
 Wed, 2 Dec 2020 00:53:37 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 353e69ume8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:53:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B20rZmS51773940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 00:53:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77AC17805C;
 Wed,  2 Dec 2020 00:53:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 121017805F;
 Wed,  2 Dec 2020 00:53:35 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 00:53:34 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 08/17] ibmvfc: map/request irq and register Sub-CRQ
 interrupt handler
Date: Tue,  1 Dec 2020 18:53:20 -0600
Message-Id: <20201202005329.4538-9-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202005329.4538-1-tyreld@linux.ibm.com>
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=3 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020000
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

Create an irq mapping for the hw_irq number provided from phyp firmware.
Request an irq assigned our Sub-CRQ interrupt handler.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index a3e2d627c1ac..0336833a6950 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -5130,12 +5130,34 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
 		goto reg_failed;
 	}
 
+	scrq->irq = irq_create_mapping(NULL, scrq->hw_irq);
+
+	if (!scrq->irq) {
+		rc = -EINVAL;
+		dev_err(dev, "Error mapping sub-crq[%d] irq\n", index);
+		goto irq_failed;
+	}
+
+	snprintf(scrq->name, sizeof(scrq->name), "ibmvfc-%x-scsi%d",
+		 vdev->unit_address, index);
+	rc = request_irq(scrq->irq, ibmvfc_interrupt_scsi, 0, scrq->name, scrq);
+
+	if (rc) {
+		dev_err(dev, "Couldn't register sub-crq[%d] irq\n", index);
+		irq_dispose_mapping(scrq->irq);
+		goto irq_failed;
+	}
+
 	scrq->hwq_id = index;
 	scrq->vhost = vhost;
 
 	LEAVE;
 	return 0;
 
+irq_failed:
+	do {
+		plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
+	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
 reg_failed:
 	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
 dma_map_failed:
-- 
2.27.0

