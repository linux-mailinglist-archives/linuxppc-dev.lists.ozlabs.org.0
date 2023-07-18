Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7167571C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:31:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KTeDiupj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jcY0Xc2z30dn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KTeDiupj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jbZ66BMz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:18 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2PsEH019814;
	Tue, 18 Jul 2023 02:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gIwGa+3hYJLNa80XYFGwUC4kKd8ZksGVnKEaSGKTCEk=;
 b=KTeDiupjo6svdrQexBBEeIMkmmijOd1Y7csorQfA5wB93s2gQo8YvSPYBK7nBTKEvKyW
 pAoWMIih7n4Omh/XST3LEtS10MqUgXyhYjRswAMzGMgWYA3z0LQ332zpFwGB5bbYVG1u
 Lzn330Q6IBdTB2SImX96rgwxkTDn+ggV5MYDUJSPHRcj9OGKklZrqDEIi8VWrS5c4vmg
 DpnBwZWBKGfbNnC0e84SZO7EQ+gmiePVA7GBIBOGXJUaAwANF2eQw2W7g/xAkGx8U24M
 R9sWl5odFvNigQ2RdqshqPDyKs/mm4FQ/RxjpC9SUaxCpVPz0VhlRY4rbxXHk3Wr6jpn gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhxv02cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:52 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2RMeM024225;
	Tue, 18 Jul 2023 02:29:51 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhxv02cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:51 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HJqUR2030668;
	Tue, 18 Jul 2023 02:29:50 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv79jhgvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:50 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2TnL46423114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:29:49 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4BAF58061;
	Tue, 18 Jul 2023 02:29:49 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C000658058;
	Tue, 18 Jul 2023 02:29:44 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:29:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 01/13] mm/hugepage pud: Allow arch-specific helper function to check huge page pud support
Date: Tue, 18 Jul 2023 07:59:21 +0530
Message-ID: <20230718022934.90447-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7NCCJLDqV5Pd9sh_iqiJdYXLNjlh0FlB
X-Proofpoint-ORIG-GUID: l5VtyCyon77C3CdDkvvprbeJuTvt6gEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like powerpc would like to enable transparent huge page pud
support only with radix translation. To support that add
has_transparent_pud_hugepage() helper that architectures can override.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/nvdimm/pfn_devs.c | 2 +-
 include/linux/pgtable.h   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index af7d9301520c..18ad315581ca 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -100,7 +100,7 @@ static unsigned long *nd_pfn_supported_alignments(unsigned long *alignments)
 
 	if (has_transparent_hugepage()) {
 		alignments[1] = HPAGE_PMD_SIZE;
-		if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD))
+		if (has_transparent_pud_hugepage())
 			alignments[2] = HPAGE_PUD_SIZE;
 	}
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5063b482e34f..cf13f8d938a8 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1499,6 +1499,9 @@ typedef unsigned int pgtbl_mod_mask;
 #define has_transparent_hugepage() IS_BUILTIN(CONFIG_TRANSPARENT_HUGEPAGE)
 #endif
 
+#ifndef has_transparent_pud_hugepage
+#define has_transparent_pud_hugepage() IS_BUILTIN(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
+#endif
 /*
  * On some architectures it depends on the mm if the p4d/pud or pmd
  * layer of the page table hierarchy is folded or not.
-- 
2.41.0

