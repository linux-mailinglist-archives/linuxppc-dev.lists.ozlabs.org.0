Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FE461D1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tJ62fhKz3dfl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P2m5OWPw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P2m5OWPw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tFr0NSlz3dhS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:51:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATGueTx018416; 
 Mon, 29 Nov 2021 17:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=USqCNEE+Ck6vQOsyPiul/+rRZRU4OqKH4VMkqHaSjSA=;
 b=P2m5OWPwI4wn+Bxsnc6p64uUHWR8G86A9McD8O3dr1/PvbOVpZ13jS5oGi1D7df7+Isx
 1ETCi97wMPA+IH+pob0CpIQcJ2yKEZCb2B5lyXwNVnW3PgCLXZEDRDRagvNP/VruyZ4x
 +PvtqhXlLvbZwP9uC3WP+ReMuG6iJztk6JfgEGNtdhMM2N/QWLz7IKNiKcJ0gxui12hA
 sjX4Gx/j5hNtJy61Qc5cYZspbbIY9PSkf3YYSuy5I4u13tIrYWoQxp+VJqPAsvYn2hVt
 UIMAsG0WPOyUEop0DdnQP8PK5qD+MYPXGX22IOFWf57BzAokBc+wRyoo5B2+awQooBK9 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn2u11bx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:51:39 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHauT2009757;
 Mon, 29 Nov 2021 17:51:39 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn2u11bwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:51:39 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhtg3021262;
 Mon, 29 Nov 2021 17:51:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcaa85f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:51:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHpbH928967492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:51:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13A5C136051;
 Mon, 29 Nov 2021 17:51:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C4B136053;
 Mon, 29 Nov 2021 17:51:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:51:35 +0000 (GMT)
Message-ID: <31e19c89ea1a50c8d0d453be93ccebe40f836fc3.camel@linux.ibm.com>
Subject: [PATCH 06/10] powerpc/vas: Map paste address only if window is active
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:51:34 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uiBW3Kc1Yql643WZDU430GFiQyNrcW3T
X-Proofpoint-ORIG-GUID: 5tAHawQtYPE1wHxAkYnAmVvKTBTHPyCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The paste address mapping is done with mmap() after the window is
opened with ioctl. But the window can be closed due to lost credit
due to core removal before mmap(). So if the window is not active,
return mmap() failure with -EACCES and expects the user space reissue
mmap() when the window is active or open new window when the credit
is available.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c
b/arch/powerpc/platforms/book3s/vas-api.c
index a63fd48e34a7..2d06bd1b1935 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -379,10 +379,27 @@ static int coproc_mmap(struct file *fp, struct
vm_area_struct *vma)
 		return -EACCES;
 	}
 
+	/*
+	 * The initial mapping is done after the window is opened
+	 * with ioctl. But this window might have been closed
+	 * due to lost credit (core removal on PowerVM) before mmap().
+	 * So if the window is not active, return mmap() failure
+	 * with -EACCES and expects the user space reconfigure (mmap)
+	 * window when it is active again or open new window when
+	 * the credit is available.
+	 */
+	mutex_lock(&txwin->task_ref.mmap_mutex);
+	if (txwin->status != VAS_WIN_ACTIVE) {
+		pr_err("%s(): Window is not active\n", __func__);
+		rc = -EACCES;
+		goto out;
+	}
+
 	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
 	if (!paste_addr) {
 		pr_err("%s(): Window paste address failed\n",
__func__);
-		return -EINVAL;
+		rc = -EINVAL;
+		goto out;
 	}
 
 	pfn = paste_addr >> PAGE_SHIFT;
@@ -401,6 +418,8 @@ static int coproc_mmap(struct file *fp, struct
vm_area_struct *vma)
 
 	txwin->task_ref.vma = vma;
 
+out:
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.27.0


