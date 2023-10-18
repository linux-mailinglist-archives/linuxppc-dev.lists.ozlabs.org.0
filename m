Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60757CD335
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RLRVMs/c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9JCc5HSSz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 15:44:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RLRVMs/c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9JBg5FGnz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 15:43:23 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I4fQPI013554;
	Wed, 18 Oct 2023 04:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L8mx8fqsmqLsBOOZ9hOe7LvtcZhrvFuOD+pw6Fy0r6c=;
 b=RLRVMs/cHOymcWEJwYkrJIZ9cCrOYMfGk4MsE5b+B4vaamDFy4fA9vYEwZnsaMjdbvsF
 iZmBFJ6PqQnGbq3IxI5WdYHlO4cbG8K2RQIBDX5G8v5YKgrXI+ZfmCRRQCYDqRlnRMsg
 VBGmyX9WMDOofjL8RAzsxYqWAhdoShgZmC10Svjsm3F070q3Ps+fMpXyzKmxBPo9qKcq
 rfI2QT6v2K9AisJC98qIcijg+5WD+gvN1I0Rm3qwl0dpzI+MEI7dywAQnahtN42TiOz0
 rB1TbXcOlS3RtnWMG+UPwjmHX9Y8nqsWvNBQEHX9N/XRYxOS6BM7lBnPlvC3b299DTH+ gA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt8e2g6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:43:17 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39I4gB1I019563;
	Wed, 18 Oct 2023 04:43:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt8e2g6cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:43:16 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39I39I0G019881;
	Wed, 18 Oct 2023 04:43:15 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811nbas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:43:15 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39I4hE5Z50397672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 04:43:14 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F18958059;
	Wed, 18 Oct 2023 04:43:14 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 826D95805B;
	Wed, 18 Oct 2023 04:43:12 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.91.245])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 04:43:12 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vas: Limit open window failure messages in log bufffer
Date: Tue, 17 Oct 2023 21:43:08 -0700
Message-Id: <20231018044308.880705-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OZGc8cKRJlkYzDNI4xDAAVZbcf6w3KlX
X-Proofpoint-ORIG-GUID: a0ObncSKL5ophU4eU867MAGcnrr9UPSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_02,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=821
 mlxscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180039
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VAS open window call prints error message and returns -EBUSY
after the migration suspend event initiated and until the resume
event completed on the destination system. It can cause the log
buffer filled with these error messages if the user space issues
continuous open window calls.  Similar case even for DLPAR CPU
remove event when no credits are available until the credits are
freed or with the other DLPAR CPU add event.

So changes in the patch to use pr_err_ratelimited() instead of
pr_err() to display open window failure and not-available credits
error messages.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 4 ++--
 arch/powerpc/platforms/pseries/vas.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 77ea9335fd04..203cfc2fb8ff 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -311,8 +311,8 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 	txwin = cp_inst->coproc->vops->open_win(uattr.vas_id, uattr.flags,
 						cp_inst->coproc->cop_type);
 	if (IS_ERR(txwin)) {
-		pr_err("%s() VAS window open failed, %ld\n", __func__,
-				PTR_ERR(txwin));
+		pr_err_ratelimited("%s() VAS window open failed, %ld\n",
+				__func__, PTR_ERR(txwin));
 		return PTR_ERR(txwin);
 	}
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b86f0db08e98..7259e6676503 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -341,7 +341,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	if (atomic_inc_return(&cop_feat_caps->nr_used_credits) >
 			atomic_read(&cop_feat_caps->nr_total_credits)) {
-		pr_err("Credits are not available to allocate window\n");
+		pr_err_ratelimited("Credits are not available to allocate window\n");
 		rc = -EINVAL;
 		goto out;
 	}
@@ -439,7 +439,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	put_vas_user_win_ref(&txwin->vas_win.task_ref);
 	rc = -EBUSY;
-	pr_err("No credit is available to allocate window\n");
+	pr_err_ratelimited("No credit is available to allocate window\n");
 
 out_free:
 	/*
-- 
2.26.3

