Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA84BCA87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KDX75hYz3cc2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yd1KkZLC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yd1KkZLC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KCp3xYKz30NP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 06:59:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JIF6qe028166; 
 Sat, 19 Feb 2022 19:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=sYW1K8dCfdXHlND+vEK43WwtEfu1IR8RRa+poEGx4mc=;
 b=Yd1KkZLCUT3tEUkMqepzxvsPfTtMjK+vv9x49V5R+D25jWqO4JU+17WLAwG8oznazahE
 3Bl7zDob8v6F9WQhLXVGT9ouNc4kLyz4Epd/V5GrMkSuS1VAK6He/tQrSTg5RD72XJz1
 kM9/5PuTlkwZu8shJ3EZdt+YTykOFgIIny2E5LGo7CJmxoNgW0GIXXQqqdVG/5CbpkBM
 Hw2c+5bXgqu8nLM8EVg18fNzVfDRyE8qNxdP8BeSO24iJK2cK4r94b10XRkP5ihnYHrn
 TiWZsbclTOUsVyz5fH04F+5PvRcO6rojMpnpUmDNYezxVc+tisXhj2WVSlL2gcNRKV4B 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb32f31qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:59:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJs2x5007475;
 Sat, 19 Feb 2022 19:59:46 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb32f31qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:59:46 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJwAkQ002686;
 Sat, 19 Feb 2022 19:59:46 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3ear697kk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:59:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JJxhAq40567058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 19:59:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9C88AC059;
 Sat, 19 Feb 2022 19:59:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB8D1AC065;
 Sat, 19 Feb 2022 19:59:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 19:59:42 +0000 (GMT)
Message-ID: <2a2cac9d210f5a79b3db0adfb92a92525c6287b6.camel@linux.ibm.com>
Subject: [PATCH v4 5/9] powerpc/vas: Map paste address only if window is active
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 11:59:41 -0800
In-Reply-To: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZVbnTJH2ANcICiU_cjAsTADvlgvrMUyM
X-Proofpoint-GUID: pSUNexsMAIUcl0OJenXyNyqVWGNsa1Ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxlogscore=864 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190126
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
opened with ioctl. If the window is closed by OS in the hypervisor
due to DLPAR after this mmap(), the paste instruction returns
failure until the OS reopens this window again. But before mmap(),
DLPAR core removal can happen which causes the corresponding
window in-active. So if the window is not active, return mmap()
failure with -EACCES and expects the user space reissue mmap()
when the window is active or open a new window when the credit
is available.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index f3e421511ea6..eb4489b2b46b 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -496,10 +496,26 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 		return -EACCES;
 	}
 
+	/*
+	 * The initial mmap is done after the window is opened
+	 * with ioctl. But before mmap(), this window can be closed in
+	 * the hypervisor due to lost credit (core removal on pseries).
+	 * So if the window is not active, return mmap() failure with
+	 * -EACCES and expects the user space reissue mmap() when it
+	 * is active again or open new window when the credit is available.
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
@@ -519,6 +535,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
 
+out:
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.27.0


