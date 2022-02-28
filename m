Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAC4C63E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:43:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6XRV74Nnz3bbs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:43:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LBcIejic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LBcIejic; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XQm5YN9z3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:42:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6hVER002623; 
 Mon, 28 Feb 2022 07:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=DsnIW5tRwmKSBUj4oN+s+m3zlrP96SW0nazUW63YZng=;
 b=LBcIejicWePkSPaY/UoYna7R7YZ7q3DWV+mxZeFPkDZrSxqwSwLEDhbTpDwKEJ0YrbYd
 YQysr7rFMaNdkfD1Qy2xjr79IcC0xJtTd9xphHHZLLaU9xufCUCJyswalXTb6jONBmR3
 PAHml5ANBZoBXGcO7El2DNF63BIhhOZz9OP308svJR0PYxKBXttmdMntucZ3YBUaBR4R
 Wdh+pCPjj28lhVJ+huVqdSl2+xgt+/to/WOkKoY0V35gSpts+1BUIn0v4E15OldZswCm
 /OPo3Za5ipkz49KtmRBwLhIdNbLWYOt2zO1pvsIK9abyeLdFc7arJ+E04FsV3sCk0EYj oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egscm94rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:42:20 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7PNjV024292;
 Mon, 28 Feb 2022 07:42:20 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egscm94ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:42:20 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7bHBI016090;
 Mon, 28 Feb 2022 07:42:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3efbu9sxbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:42:19 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7gHhO14811514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:42:17 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC66611206D;
 Mon, 28 Feb 2022 07:42:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02EB3112061;
 Mon, 28 Feb 2022 07:42:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:42:16 +0000 (GMT)
Message-ID: <c7580b8e04cfed0a19847a4e071109df26cacbfd.camel@linux.ibm.com>
Subject: [PATCH v5 5/9] powerpc/vas: Map paste address only if window is active
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:42:15 -0800
In-Reply-To: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
References: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSN3x9lviQQm-Gx7BMuiwsgXDNPQlO3v
X-Proofpoint-ORIG-GUID: KjP35Y8QYeZMUPlehwFgJfoFUMKNrzmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202280043
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
index f3e421511ea6..5372dbc2e37f 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -496,10 +496,29 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
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
@@ -519,6 +538,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
 
+out:
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
 	return rc;
 }
 
-- 
2.27.0


