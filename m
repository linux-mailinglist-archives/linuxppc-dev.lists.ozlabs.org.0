Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9175B54CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 08:51:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQy1P52wkz3bc3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 16:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwYIZeJe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwYIZeJe;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQy0l66GTz2ywr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 16:50:47 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6hJnF019678;
	Mon, 12 Sep 2022 06:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+ATg7LH4SSkWmcRPuFP89mY42NBxvn8ZTaGzf88kaqQ=;
 b=gwYIZeJeV0TAJ6+gW+KQGuz3uSlYDbWK0rBccaCNbgLvkChItr1YVp6yfOhLvHDydLu8
 RFn0ySSMk/HOtnba9ZfYlS6aTU/FWXKuFwlsh1G+dNgKSo95mGyGvjOdYA5iCgZuotqn
 H+tycFoop6PnCD//e6+Wq8TtSTHdjqUly7O9A5H3j2WVPgWP4F27XXZVHB3fUcUNCyI9
 qJ6rsEYAHevAvB4jWk2+Es9YD605vgz1w88SM1Cnu2AnUFbeg0JYAFVZGW+8o4eUCwTe
 mFMkY1+pzk08kyFe9h4vwENxBy36EUeKJyuVfNO6Tn9sQK1S7Si8oxzwGQwOwK0SiyHg RA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhyre065j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 06:50:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C6aVlG027583;
	Mon, 12 Sep 2022 06:50:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3jghuj9ypg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 06:50:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C6ovAE20382202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 06:50:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8FAFA4057;
	Mon, 12 Sep 2022 06:50:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80A2BA4040;
	Mon, 12 Sep 2022 06:50:32 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.190])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 06:50:32 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] ppc64/kdump: Limit kdump base to 512MB
Date: Mon, 12 Sep 2022 12:20:31 +0530
Message-Id: <20220912065031.57416-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BrSBS1Tm8dJ8XiiqdpxX6optsVQpkBlr
X-Proofpoint-GUID: BrSBS1Tm8dJ8XiiqdpxX6optsVQpkBlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120020
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit e641eb03ab2b0 ("powerpc: Fix up the kdump base cap to
128M") memory for kdump kernel has been reserved at an offset of
128MB. This held up well for a long time before running into boot
failure on LPARs having a lot of cores. Commit 7c5ed82b800d8
("powerpc: Set crashkernel offset to mid of RMA region") fixed this
boot failure by moving the offset to mid of RMA region. This change
meant the offset is either 256MB or 512MB on LPARs as ppc64_rma_size
was 512MB or 1024MB owing to commit 103a8542cb35b ("powerpc/book3s64/
radix: Fix boot failure with large amount of guest memory")

But ppc64_rma_size can be larger as well with newer f/w. So, limit
crashkernel reservation offset to 512MB to avoid running into boot
failures during kdump kernel boot, due to RTAS or other allocation
restrictions.

Also, while here, use SZ_128M instead of opening coding it.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in V2:
* Updated the changelog for clarity.
* Used SZ_512M instead of open coding as suggested by Christophe.
* Used SZ_128M instead of open coding 128MB.

 arch/powerpc/kexec/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index cf84bfe9e27e..de64c7962991 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -136,7 +136,7 @@ void __init reserve_crashkernel(void)
 #ifdef CONFIG_PPC64
 		/*
 		 * On the LPAR platform place the crash kernel to mid of
-		 * RMA size (512MB or more) to ensure the crash kernel
+		 * RMA size (max. of 512MB) to ensure the crash kernel
 		 * gets enough space to place itself and some stack to be
 		 * in the first segment. At the same time normal kernel
 		 * also get enough space to allocate memory for essential
@@ -144,9 +144,9 @@ void __init reserve_crashkernel(void)
 		 * kernel starts at 128MB offset on other platforms.
 		 */
 		if (firmware_has_feature(FW_FEATURE_LPAR))
-			crashk_res.start = ppc64_rma_size / 2;
+			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_512M);
 		else
-			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
+			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_128M);
 #else
 		crashk_res.start = KDUMP_KERNELBASE;
 #endif
-- 
2.37.3

