Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC53373EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 17:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb1LT0tf7z30Mp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 01:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PaKNEdAu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PaKNEdAu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb1Ky0jTcz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 01:47:01 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145FY2kh037672; Wed, 5 May 2021 11:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=joxChxNlw+5/0b+xEPI3Quj2Ds3vAM58vkmFghLJ1D8=;
 b=PaKNEdAujmkd6EAQ4Yvmois0pflJeSvj/SOGxPulMpP9gAN7HlhVzn51IlYFTqQXy9lV
 wrc9qNv83KCjRmJ8HtDeiPDXM/IvS1H3iNEaffqQv9//E0HF75qYjJBneRSGaASs6VLz
 Ca6Na2n+m3V5lmMYzTOYidNqrM1pcomga5e+fdInkVAdHMYGgC1CZMBVjGYUzWnGD/9I
 E84d7zqU0eAlbdWoaiUOCMczAmEthdB6/OttT/Yv/XOTWPfP2UsUpgP/42u5yG9AD5SC
 89remkRIDiI+BeUfGRx3KUXHlswnRT/kCLZvr+4CZ96SBJP61zkW8RbyjK/55mbclB/1 eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bum4wn78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:46:56 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145FYGWk040013;
 Wed, 5 May 2021 11:46:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bum4wn6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 11:46:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145FdZN4008362;
 Wed, 5 May 2021 15:46:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38beeegd2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:46:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 145FkoYB27460062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 15:46:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C506BAE055;
 Wed,  5 May 2021 15:46:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DE80AE04D;
 Wed,  5 May 2021 15:46:49 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.85.70])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 15:46:48 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 1/6] KVM: PPC: Book3S HV: Fix comments of H_RPT_INVALIDATE
 arguments
Date: Wed,  5 May 2021 21:16:37 +0530
Message-Id: <20210505154642.178702-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505154642.178702-1-bharata@linux.ibm.com>
References: <20210505154642.178702-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h3mXXrOkuPQ46z8zBBw1nOkDh3V6LhZU
X-Proofpoint-GUID: EHWfJzrr17BjJqlvEShiTi_5dlwH4v5x
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050112
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

The type values H_RPTI_TYPE_PRT and H_RPTI_TYPE_PAT indicate
invalidating the caching of process and partition scoped entries
respectively.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 arch/powerpc/include/asm/hvcall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 443050906018..f9927a1545ea 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -413,9 +413,9 @@
 #define H_RPTI_TYPE_NESTED	0x0001	/* Invalidate nested guest partition-scope */
 #define H_RPTI_TYPE_TLB		0x0002	/* Invalidate TLB */
 #define H_RPTI_TYPE_PWC		0x0004	/* Invalidate Page Walk Cache */
-/* Invalidate Process Table Entries if H_RPTI_TYPE_NESTED is clear */
+/* Invalidate caching of Process Table Entries if H_RPTI_TYPE_NESTED is clear */
 #define H_RPTI_TYPE_PRT		0x0008
-/* Invalidate Partition Table Entries if H_RPTI_TYPE_NESTED is set */
+/* Invalidate caching of Partition Table Entries if H_RPTI_TYPE_NESTED is set */
 #define H_RPTI_TYPE_PAT		0x0008
 #define H_RPTI_TYPE_ALL		(H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC | \
 				 H_RPTI_TYPE_PRT)
-- 
2.26.2

