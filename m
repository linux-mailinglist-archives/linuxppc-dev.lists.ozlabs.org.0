Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3964C803A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:15:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6znJ0ZG9z3chX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:15:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hcm8p5lL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hcm8p5lL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zmD2SC0z3cZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:14:04 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2210gYAu019498; 
 Tue, 1 Mar 2022 01:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=GWOhlF3oQI2bc/nWnco51deZ8h38onISpZiftQsVNRg=;
 b=Hcm8p5lLzu6PmsYcO594cxV4PJ9Y1UpDRbJG1I26jdC/WdOSw3vllLJtiPx0LKhHOoyK
 iUyoUKqsxvk+/Opqx8C+2cJ0UCvWgQgIxiOOLhjmBKL7lnhcma9X0NByko6WHHvSVuDK
 OiBtVimm+IK1ghNOQZnfS5dZABvluUzLJlTQLniwXic3bO+Ddg/EoLsvcAdQK+pskdWu
 97kIhjIK6B3dntkETpWLOXKqrt2JKm/t9jMC2rjcWg09vvypyXlqVvmgc/IOqii6bHXw
 /fm8k15GzuUdWGbdTFQ+PFk3xdWV4K6MI/4Gvpck8Q/PZGFqooW4U0KP5ugr75eTq/6Y nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh96brh4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:14:01 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2211CcW2016495;
 Tue, 1 Mar 2022 01:14:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh96brh4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:14:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vgrw032745;
 Tue, 1 Mar 2022 01:13:59 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3efbua6t3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:13:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211DuaJ11862340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:13:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1EFF7806A;
 Tue,  1 Mar 2022 01:13:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AE7678069;
 Tue,  1 Mar 2022 01:13:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:13:55 +0000 (GMT)
Message-ID: <bbb203c26b324534e25658cb1dbbcb5160a2f93a.camel@linux.ibm.com>
Subject: [PATCH v6 5/9] powerpc/vas: Map paste address only if window is active
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:13:54 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3MjXCgCUTt-DHOYkgNxX7SIEeAkGZXZp
X-Proofpoint-ORIG-GUID: DwaqRdo-Gj8gPC6BLY1q2drB5-1c68Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010004
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
opened with ioctl. The partition has to close VAS windows in the
hypervisor if it lost credits due to DLPAR core removal. But the
kernel marks these windows inactive until the previously lost
credits are available later. If the window is inactive due to
DLPAR after this mmap(), the paste instruction returns failure
until the the OS reopens this window again.

Before the user space issuing mmap(), there is a possibility of
happening DLPAR core removal event which causes the corresponding
window inactive. So if the window is not active, return mmap()
failure with -EACCES and expects the user space reissue mmap()
when the window is active or open a new window when the credit
is available.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 82f32781c5d2..f9a1615b74da 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -497,10 +497,29 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 		return -EACCES;
 	}
 
+	/*
+	 * The initial mmap is done after the window is opened
+	 * with ioctl. But before mmap(), this window can be closed in
+	 * the hypervisor due to lost credit (core removal on pseries).
+	 * So if the window is not active, return mmap() failure with
+	 * -EACCES and expects the user space reissue mmap() when it
+	 * is active again or open new window when the credit is available.
+	 * mmap_mutex protects the paste address mmap() with DLPAR
+	 * close/open event and allows mmap() only when the window is
+	 * active.
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
@@ -520,6 +539,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
 
+out:
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.27.0


