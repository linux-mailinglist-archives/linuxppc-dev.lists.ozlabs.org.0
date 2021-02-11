Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C833192CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 20:06:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc5gw5rN0zDwwg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 06:06:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=srD9dPBA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dc5VV72llzDwp2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 05:57:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11BIhAO0078117; Thu, 11 Feb 2021 13:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8kTbrLGlf8MA3D7L6G0QxsDD//LZvEzGEWGY/qYcNIM=;
 b=srD9dPBAIrm4jLM8WP2mO9eDRUXm8KGH06Oy+4iHcoBK9ZAUbS4++xNBHP05x/0MSXCH
 GRToiPAxngepQ2+WfEel9BP987nrvb2IZCD+HujY1g+0FO/cKCtpLKvNw6LJfe0x+B1d
 6/wbf0qxh7NuhoQBbDn41vpTtF6MaUx5LFay8TbFvzl1pFM/W+f+pS9zIozy0CP755an
 ybfWD2QvN6LK1nsY3wlDFfUHgKki1cNqI9IvcRzJvzIZRsYi9JvxYM8AC1HYo7Ajy3l2
 a/E3fM7dPjTZsENGrelGkFnG3iAi8zLHLQ9PkSayJpYxy7ZGTFH1Auht3K7j8DlTis72 pg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36na3wgak3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 13:57:53 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BIvpCi014204;
 Thu, 11 Feb 2021 18:57:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 36hjr9qskp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 18:57:49 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11BIvktX22348076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 18:57:46 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34330136055;
 Thu, 11 Feb 2021 18:57:46 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC72C136053;
 Thu, 11 Feb 2021 18:57:45 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Feb 2021 18:57:45 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH 3/4] ibmvfc: treat H_CLOSED as success during sub-CRQ
 registration
Date: Thu, 11 Feb 2021 12:57:41 -0600
Message-Id: <20210211185742.50143-4-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211185742.50143-1-tyreld@linux.ibm.com>
References: <20210211185742.50143-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102110146
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

A non-zero return code for H_REG_SUB_CRQ is currently treated as a
failure resulting in failing sub-CRQ setup. The case of H_CLOSED should
not be treated as a failure. This return code translates to a successful
sub-CRQ registration by the hypervisor, and is meant to communicate back
that there is currently no partner VIOS CRQ connection established as of
yet. This is a common occurrence during a disconnect where the client
adapter can possibly come back up prior to the partner adapter.

For non-zero return code from H_REG_SUB_CRQ treat a H_CLOSED as success
so that sub-CRQs are successfully setup.

Fixes: faacf8c5f1d5 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels")
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 3dd20f383453..ba6fcf9cbc57 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -5636,7 +5636,8 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
 	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
 			   &scrq->cookie, &scrq->hw_irq);
 
-	if (rc) {
+	/* H_CLOSED indicates successful register, but no CRQ partner */
+	if (rc && rc != H_CLOSED) {
 		dev_warn(dev, "Error registering sub-crq: %d\n", rc);
 		if (rc == H_PARAMETER)
 			dev_warn_once(dev, "Firmware may not support MQ\n");
-- 
2.27.0

