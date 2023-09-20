Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6960C7A79DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:58:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6tuTE9F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrFrw2WnBz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6tuTE9F;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrFq37433z2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:57:19 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RrFq16Ngwz4xNh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:57:17 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RrFq15zCYz4xDB; Wed, 20 Sep 2023 20:57:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6tuTE9F;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RrFq12xMKz4x5q;
	Wed, 20 Sep 2023 20:57:16 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KAc0gl021624;
	Wed, 20 Sep 2023 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CxWUPlwTvP3coF3/NElydal1RuVXKr14akKdmFreDRc=;
 b=F6tuTE9FwuiR3osFPIS7H9OGC3ovFgOb2uqfe/PmuImnyRhUA77JaZOKgiUWxBqcJ6pF
 tTAFtmwK+0qOoT+46IRnUu4iiiBDJDjL8qqVw02j/ePys8owly1UmCe1hYN3qmMOWY3+
 hKfspcc3S2kC5qQ2+T+Eo9yObXzqJi3kPJcKYE8uU7khlliLAXACCwITLUEP7re2FVBK
 Xx1cw/Vk08EdGLW3s0KR66XTu/hU+/M05h0VNu/2PwJD1boosYvfgRId5TtjoZPv1qW5
 UJpF9Rvc00/UYv96bfVSMwNseNtFDtUYdy4H1CXFDLP9VqJeWXFtdQN8LlPCkYYv07pj EQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t7w50ke8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:57:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38KAUcYC005625;
	Wed, 20 Sep 2023 10:57:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5q2yw9k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:57:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38KAv95m43254302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 10:57:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22B852004B;
	Wed, 20 Sep 2023 10:57:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A61C520043;
	Wed, 20 Sep 2023 10:57:07 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.in.ibm.com (unknown [9.109.199.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Sep 2023 10:57:07 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/2] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Date: Wed, 20 Sep 2023 16:27:05 +0530
Message-ID: <20230920105706.853626-1-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jR8bbBsYvaab8BqYsRaneW3vjVFd8Mbo
X-Proofpoint-ORIG-GUID: jR8bbBsYvaab8BqYsRaneW3vjVFd8Mbo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_05,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200084
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since below commit, address mapping for vmemmap has changed for Radix
MMU, where address mapping is stored in kernel page table itself,
instead of earlier used 'vmemmap_list'.

    commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
    a different vmemmap handling function")

Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
address translation for vmemmap addresses, as it depended on vmemmap_list,
which can now be empty.

While fixing the address translation in makedumpfile, it was identified
that currently makedumpfile cannot distinguish between Hash MMU and
Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
And hence fails to assign offsets and shifts correctly (such as in L4 to
PGDIR offset calculation in makedumpfile).

For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.

Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
`cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
offsets correctly, without needing a VMLINUX.

Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>

---
Corresponding makedumpfile patches to fix address translation, in Radix
MMU case:

Link: https://lore.kernel.org/kexec/B5F0F00E-F2B1-47D7-A143-5683D10DC29A@linux.ibm.com/T/#t
---
---
 arch/powerpc/kexec/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index de64c7962991..369b8334a4f0 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -63,6 +63,8 @@ void arch_crash_save_vmcoreinfo(void)
 #ifndef CONFIG_NUMA
 	VMCOREINFO_SYMBOL(contig_page_data);
 #endif
+	VMCOREINFO_SYMBOL(cur_cpu_spec);
+	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
 #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
 	VMCOREINFO_SYMBOL(vmemmap_list);
 	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
-- 
2.41.0

