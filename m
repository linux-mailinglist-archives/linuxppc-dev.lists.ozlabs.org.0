Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98E490336
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jckhy0hGWz2xBL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X3j4UiAU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X3j4UiAU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jckfn1MGnz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:53:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H64Mei027263; 
 Mon, 17 Jan 2022 07:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zNmX1gF0jBLeOiEY0ju1uQtyZ3N1PSulnCuQStyZniA=;
 b=X3j4UiAU4vH3Noper9RL6gXTWITogeawb0yUgHN+r9iQ5e8C4gv60Zh2ZCeCFzdrAt9L
 0BPSzdSrVBPhuOex4TSih7Nt99yvrqONpXEPoEesXf5A3bc1eRW0HDPLr3TcwedtyrdY
 fRxJSY1V0kQdw4MnO0sBGZshjeew6UfWVA4smQxJ3RG43ASC10YktkQRc3224wo4pSu0
 Ddl4x2oDF9fw90nvMyWxCJ8mdG2GXYgzE7fx9yIkjSe/AwPFYXTfrC3WKCXaz3yGyAm1
 djIU4/0n3xXUIavMW/YRl+xwDcpTqOo/umtnqm2oLCegamgjaf5Dt18IM/paQ/HxE8O/ oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dmxthwhk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H7gpHE013234;
 Mon, 17 Jan 2022 07:53:13 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dmxthwhjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:13 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H7qNEx020307;
 Mon, 17 Jan 2022 07:53:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3dknw90kvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 07:53:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H7r8aC41091414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 07:53:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32D42A4055;
 Mon, 17 Jan 2022 07:53:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91417A4051;
 Mon, 17 Jan 2022 07:53:03 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.1.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 07:53:03 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] powerpc/fadump: opt out from freeing pages on cma
 activation failure
Date: Mon, 17 Jan 2022 13:22:46 +0530
Message-Id: <20220117075246.36072-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117075246.36072-1-hbathini@linux.ibm.com>
References: <20220117075246.36072-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o0HkRLJEbUl-aA4UB82pl3cnu0DKXEGc
X-Proofpoint-ORIG-GUID: hDrnqErmdNkx69irsm-KH2tbzU2yIzpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170048
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
assisted dump"), Linux kernel's Contiguous Memory Allocator (CMA)
based reservation was introduced in fadump. That change was aimed at
using CMA to let applications utilize the memory reserved for fadump
while blocking it from being used for kernel pages. The assumption
was, even if CMA activation fails for whatever reason, the memory
still remains reserved to avoid it from being used for kernel pages.
But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
activation of an area fails") breaks this assumption as it started
exposing all pages to buddy allocator on CMA activation failure.
It led to warning messages like below while running crash-utility
on vmcore of a kernel having above two commits:

  crash: seek error: kernel virtual address: <from reserved region>

To fix this problem, opt out from exposing pages to buddy allocator
on CMA activation failure for fadump reserved memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Acked-by: David Hildenbrand <david@redhat.com>
---

Changes in v3:
* Added Acked-by tag from David.


 arch/powerpc/kernel/fadump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d03e488cfe9c..d0ad86b67e66 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -112,6 +112,12 @@ static int __init fadump_cma_init(void)
 		return 1;
 	}
 
+	/*
+	 *  If CMA activation fails, keep the pages reserved, instead of
+	 *  exposing them to buddy allocator. Same as 'fadump=nocma' case.
+	 */
+	cma_reserve_pages_on_error(fadump_cma);
+
 	/*
 	 * So we now have successfully initialized cma area for fadump.
 	 */
-- 
2.34.1

