Return-Path: <linuxppc-dev+bounces-6480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF00A45490
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:34:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hTG3LG4z30Vm;
	Wed, 26 Feb 2025 15:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740544482;
	cv=none; b=OkzAO8zb7bpy9SN4SwdgM9puGqbg6BxZtGQjyZELOAtQAmO1SDABnepUSO8qPDtZPB0koRZoNvU9699a/LsSmT8gmHHk3KTs9CfnKV9FkACLCg2JFyUVdwiNaDKwfav48/lRtcod0xd4JR6YEm7PMya9GHx+lJa3jNHo+LphP7nA3+CvdB/ENwqAvDi81DbI2lbHHouXaCdNJZOQggug8g1eKdUjx0SmdfPxOu9FV9jphStyMSEIPCm3KcEDUg31x5H1EhIumNm8B6tTgyKw7V/jA1JU9VCk3MYKkx+zOAILhdwQMxmLji/jzRS/+CUkERQWWp2u/UXkL2JF8WPwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740544482; c=relaxed/relaxed;
	bh=7tedU9NDUsqrSOi+PebCz+3rT3C4hD1EkQke716E/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LC+DkBbPVvtMFIV3OPsGcHJ7WiD/bOUjKwUZPTRGnGjxbgWlwT7GEC2K75ZzFAibXHVU33VL7TGRwejs/5dZYCJYUqqJF1e3q2ZUrn8YNgUuYWTBMLj5I6BUWyuwR0rB6anLvOUCuRyta14r5KMWVfK/VseoL1+BU+8azjW8gE1D6rmGxI0EIIl0WyVe4VTWSbXANryw120ScznF1TsvxhT/Aj5bn5eVl2sUY9wxOwCivi+K2DXem8B4XM2JJ7yZ53SbCVNt60d+dQUsRpCqs/AWrmC4osOZdie216Kthzkr2t/+EEwsqIL6HljnoiFW0LaSCJ2wk0qPrH1oClo3ZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSXE/WT9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSXE/WT9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hTF2g5fz30Vg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:34:40 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1nWSN032358;
	Wed, 26 Feb 2025 04:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=7tedU9NDUsqrSOi+PebCz+3rT3C4hD1EkQke716E/
	+w=; b=PSXE/WT9AYaJ6DOQSkTOMKvJyQzw41pVZCXMooSMoXfBQuRlprSFri7bp
	pI3hnW5dRprxnQT1WofTyNUBfGzoNVRUk/e0+UPyIIXGjl6tIHUQ6mXFU+CDF7IR
	ZamTfAIIxX9UxqeTrIOc0/5C8JGsFTs838HrcCPAkMRUBRlsgA8okQtg8biGrWL3
	yOIOlYV2upZuPqopPo6pqjF3sbrzEIdYspb/XtTF6F7wexxpst1EvJnZFy84QhoL
	zFRUo1DdcIuuWTs881dyIzZRKDovzY2au2/FgIl3OOQREZi3eYFq9VwRxTuba2Ih
	lwJxe5Xsi4GfTz0sUYg/raR+8AORA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j93w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:34:36 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4YaNY031773;
	Wed, 26 Feb 2025 04:34:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j93w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:34:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q3ERe8012491;
	Wed, 26 Feb 2025 04:34:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ys9ygys1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:34:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4YUm418284818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:34:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D291F2004B;
	Wed, 26 Feb 2025 04:34:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9C0C20040;
	Wed, 26 Feb 2025 04:34:29 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:34:29 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH] book3s64/radix : Align section vmemmap start address to PAGE_SIZE
Date: Tue, 25 Feb 2025 22:34:26 -0600
Message-ID: <20250226043426.224494-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AxWna98M9pNDc1aVhj0p_dLCna93W769
X-Proofpoint-ORIG-GUID: 38HTTc-eoC5oTg3433LvBSgNuvYEC7lE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A vmemmap altmap is a device-provided region used to provide
backing storage for struct pages. For each namespace, the altmap
should belong to that same namespace. If the namespaces are
created unaligned, there is a chance that the section vmemmap
start address could also be unaligned. If the section vmemmap
start address is unaligned, the altmap page allocated from the
current namespace might be used by the previous namespace also.
During the free operation, since the altmap is shared between two
namespaces, the previous namespace may detect that the page does
not belong to its altmap and incorrectly assume that the page is a
normal page. It then attempts to free the normal page, which leads
to a kernel crash.

In this patch, we are aligning the section vmemmap start address
to PAGE_SIZE. After alignment, the start address will not be
part of the current namespace, and a normal page will be allocated
for the vmemmap mapping of the current section. For the remaining
sections, altmaps will be allocated. During the free operation,
the normal page will be correctly freed.

Without this patch
==================
NS1 start               NS2 start
 _________________________________________________________
|         NS1               |            NS2              |
 ---------------------------------------------------------
| Altmap| Altmap | .....|Altmap| Altmap | ...........
|  NS1  |  NS1   |      | NS2  |  NS2   |

In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
for NS1 comes from Altmap NS1, which belongs to NS1, and the
vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.

The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
by both NS1 and NS2. During the free operation in NS1, Altmap NS2
is not part of NS1's altmap, causing it to attempt to free an
invalid page.

With this patch
===============
NS1 start               NS2 start
 _________________________________________________________
|         NS1               |            NS2              |
 ---------------------------------------------------------
| Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
|  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |

If the vmemmap start for NS2 is not aligned then we are allocating
a normal page. NS1 and NS2 vmemmap will be freed correctly.

Fixes: 368a0590d954("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 311e2112d782..b22d5f6147d2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1120,6 +1120,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pmd_t *pmd;
 	pte_t *pte;
 
+	start = ALIGN_DOWN(start, PAGE_SIZE);
+
 	for (addr = start; addr < end; addr = next) {
 		next = pmd_addr_end(addr, end);
 
-- 
2.43.5


