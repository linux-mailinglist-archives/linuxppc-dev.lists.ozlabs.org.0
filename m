Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0A47DC03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:30:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKB0k1q0yz3cnW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:29:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Exkp95qM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Exkp95qM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKB0035VTz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:29:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMNb87Q024791; 
 Thu, 23 Dec 2021 00:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=XQrDlqCMWcpNHfclxISiM7vVD+IKo/gqLHYqy/AZGw8=;
 b=Exkp95qM1yRaxKNiy50wKVWc43BgJ7SCfDERdisBkWJgOFiLqu37hrgB5Dg9YNm0U/aT
 diseKmz5FfEOE9fElsM6uWqWPztyjFAOrZgA1ou5H7xKiHN8xw0GAGKcqoQ1K5CWHTbr
 vCZnKwUu2+NhLtgMVeWBCjVBClWbyTitTYGEBJpIoXMYUffLZ1k6nYCMgL9Of8XS27hs
 xGXi1ulDXvSx0gfFGyjo83LQbcMoWFvYotGDQ4V0nGX/0NTkYTHcsZ2YP0LF2ILW9Hvb
 lYBzqDcTTFmUlfgib3LscdJY0FXoeFDbbZmBlhj1huVrRkmCBz8VkYQ6GFAn3UEv5lAj hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4add43q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:29:14 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0QQYY025727;
 Thu, 23 Dec 2021 00:29:13 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4add43pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:29:13 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0DXHG007561;
 Thu, 23 Dec 2021 00:29:13 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3d416tsesh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:29:13 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0TBvu13763098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:29:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA0C6C6062;
 Thu, 23 Dec 2021 00:29:11 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 080ADC605D;
 Thu, 23 Dec 2021 00:29:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:29:10 +0000 (GMT)
Message-ID: <b1c16c06d276ac06dcc4bcb4f4ba9713d234fb3e.camel@linux.ibm.com>
Subject: [PATCH v2 06/10] powerpc/vas: Map paste address only if window is
 active
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:29:08 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1SQnwXzhUg2YdsJsDwO3l1mOKR4fNSKt
X-Proofpoint-ORIG-GUID: 0lVVnNKWy8o3N2L03fCUj3_DvGVWqjoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220124
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

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index a63fd48e34a7..2d06bd1b1935 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -379,10 +379,27 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
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
 		pr_err("%s(): Window paste address failed\n", __func__);
-		return -EINVAL;
+		rc = -EINVAL;
+		goto out;
 	}
 
 	pfn = paste_addr >> PAGE_SHIFT;
@@ -401,6 +418,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 
 	txwin->task_ref.vma = vma;
 
+out:
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.27.0


