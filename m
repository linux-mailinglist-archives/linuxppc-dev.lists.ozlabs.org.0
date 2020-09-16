Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245026D01B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 02:44:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJBW5W14zDr6Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 10:44:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fk0tpQDS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHvX41ZZzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 10:31:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GK1h3P078967; Wed, 16 Sep 2020 16:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Hx1VXKQgy3Nm6HDgt3hWtGCgJ6pw/owXli8uNzyQmSE=;
 b=Fk0tpQDS1r+wOAQH4julULdyVJFO2tWqJABO3WPhIh+QcIxhElWcpgrrN+vbPVUy1P+H
 AK7993/b8CVrT+VwAbZkR+cF1+g5CVl0ETqIPMsYmTRquK1Mkxg+ml9oIxJmhtCPnYWR
 BIwxtuAX0nsoJTT0nHqrVeN0nYMMiddUk6h4+AzQQgtHETcaupMzK234cVFT7tQkqKWR
 A3gioaBjWEfwpxCZl8JaNCE4s4rQ99x4IKwkNbKP4L/+05y2W4GHKsNvkQXMptfLaRj/
 WLuCW8AiFg9M3pPFX21gLqm6jxaA3yUPberE0oAIZ+oY8nTrT0FGvK3+xwBWmO5mr/WP fg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kqb93jse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 16:10:06 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GK6hW2022173;
 Wed, 16 Sep 2020 20:10:05 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 33k5v992cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 20:10:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GKA4IB983758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 20:10:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C8236A04F;
 Wed, 16 Sep 2020 20:10:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54BC76A051;
 Wed, 16 Sep 2020 20:10:03 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.160.112.131])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 20:10:03 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linux-scsi@vger.kernel.org
Subject: [PATCH] ibmvfc: Protect vhost->task_set increment by the host lock
Date: Wed, 16 Sep 2020 15:09:59 -0500
Message-Id: <1600286999-22059-1-git-send-email-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_12:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=1 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160138
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
Cc: Brian King <brking@linux.vnet.ibm.com>, tyreld@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, martin.petersen@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the discovery thread, ibmvfc does a vhost->task_set++ without
any lock held. This could result in two targets getting the same
cancel key, which could have strange effects in error recovery.
The actual probability of this occurring should be extremely
small, since this should all be done in a single threaded loop
from the discovery thread, but let's fix it up anyway to be safe.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 322bb30..b393587 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4169,11 +4169,11 @@ static int ibmvfc_alloc_target(struct ibmvfc_host *vhost,struct ibmvfc_discover_
 	tgt->wwpn = wwpn;
 	tgt->vhost = vhost;
 	tgt->need_login = 1;
-	tgt->cancel_key = vhost->task_set++;
 	timer_setup(&tgt->timer, ibmvfc_adisc_timeout, 0);
 	kref_init(&tgt->kref);
 	ibmvfc_init_tgt(tgt, ibmvfc_tgt_implicit_logout);
 	spin_lock_irqsave(vhost->host->host_lock, flags);
+	tgt->cancel_key = vhost->task_set++;
 	list_add_tail(&tgt->queue, &vhost->targets);
 
 unlock_out:
-- 
1.8.3.1

