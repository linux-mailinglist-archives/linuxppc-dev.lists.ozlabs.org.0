Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89958766A40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 12:24:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJTfHSLM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC3fS3DVvz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 20:24:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJTfHSLM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC3dX1N76z3cST
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 20:23:59 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SADKrY026312;
	Fri, 28 Jul 2023 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=N8ygypjq2tkjtKRO/9ldUL+Mk0QOx+wqu5nadJ8BFQQ=;
 b=RJTfHSLMuETKqUzK+UhZnP9os9trkzGkWGMBQgVypJgglYPcLNtO6qraQThj3c3wMpoK
 JceWVt7+88xGpiuH5OawqSMFqIQOfTnGydncfI7JxltiHeIKFOEHUDzcfCkfXfD5GP2T
 K1zzlE4vN5KU/vG/R36568vOSyP7JQjPqc6MUrL77VdQ7WYGUjVVfXjdXbRJVR0Eds/x
 alH0SkPXS/EAU1PN+mU3ik69tpUK4Pi14Jl9jM2IgxE9Sz6PzxRxsTazotgeIBG48n1C
 5Ff20KSClEuvpxXkyb82pFM56/EG2ERhhRLZs3CrqOeP+eh1v1fRzMsKwnvNa5smRIgF AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4bqw88bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:23:42 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36SANfnt028218;
	Fri, 28 Jul 2023 10:23:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4bqw88bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:23:41 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36S8SEL6016574;
	Fri, 28 Jul 2023 10:23:40 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v51vmbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:23:40 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36SANdOT6423048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jul 2023 10:23:40 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD4DC5805E;
	Fri, 28 Jul 2023 10:23:39 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B0AB5805D;
	Fri, 28 Jul 2023 10:23:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.12.215])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Jul 2023 10:23:33 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 12/13 -fix] powerpc/book3s64/radix: Remove mmu_vmemmap_psize
In-Reply-To: <20230724190759.483013-13-aneesh.kumar@linux.ibm.com>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
 <20230724190759.483013-13-aneesh.kumar@linux.ibm.com>
Date: Fri, 28 Jul 2023 15:53:31 +0530
Message-ID: <874jlowd0c.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SCQVDXLFiQJenI2q91kGIzagdGrScCmn
X-Proofpoint-ORIG-GUID: 7_mMA98J_lQbs-SbZcGmkjUIFdUNfHxC
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280092
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 2d37f0570983bfa710e73a6485e178658e8f4b38 Mon Sep 17 00:00:00 2001
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 28 Jul 2023 14:47:46 +0530
Subject: [PATCH] powerpc/mm: Fix kernel build error

 arch/powerpc/mm/init_64.c:201:15: error: no previous prototype for function '__vmemmap_populate' [-Werror,-Wmissing-prototypes]
   int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
                 ^
   arch/powerpc/mm/init_64.c:201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307281617.OxcXz84j-lkp@intel.com/
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/init_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 8d184e89e943..e0208cb12058 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -198,8 +198,8 @@ bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
 	return false;
 }
 
-int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
-				 struct vmem_altmap *altmap)
+static int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
+					struct vmem_altmap *altmap)
 {
 	bool altmap_alloc;
 	unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
-- 
2.41.0

