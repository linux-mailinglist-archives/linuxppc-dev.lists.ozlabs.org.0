Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A433BF515
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 07:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL4d96kZdz3bWY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 15:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oasDoopG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oasDoopG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL4cf512Xz2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 15:30:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16852km1188722; Thu, 8 Jul 2021 01:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6XWe7eWZX7n/OD7rd071XuDRE7H0a3x3VaFrrvk80MI=;
 b=oasDoopGSOW7IktBFoFVbFp/zPE5cXVV0KI8hzCYWdzqdkFUBqMQUQbvv+Cact01xjpG
 wereGUe1+N76TSxZUIx85Exv85suO3rhGHnHXHquvW0k8RPzjU5f45/zVq5hWDXdbGw4
 l/Q9u5R8v++kNQeZNZpq2m74M39TamY4zgmeU/KGj3XDbypK3kcvid99TN1w5lDIsQtc
 1qnzob8LfAVKxGljIlTDjyNyhaCYLYchb+LDilLqg8NS03o+Rga+4b2ot61EI7gDzhMA
 ndiY03Reksz5/h1xrtvXf30OyVlEMNFRinZQ+79vmj0Xt1MOCcL19s8HI7LymoVlrf7H 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mbkfs0tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 01:30:00 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16852wsk189397;
 Thu, 8 Jul 2021 01:30:00 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mbkfs0t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 01:29:59 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1685NJ48006205;
 Thu, 8 Jul 2021 05:29:58 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 39jfh8t1bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 05:29:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1685Tt1u20054426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 05:29:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0E1F5204F;
 Thu,  8 Jul 2021 05:29:54 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.82.66])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DD87D52054;
 Thu,  8 Jul 2021 05:29:53 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 1/1] powerpc/percpu: Use 2MB atom_size in percpu
 allocator on radix
Date: Thu,  8 Jul 2021 10:59:46 +0530
Message-Id: <20210708052946.1497495-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2YEN2dKRcnpmugEHBG9oO6qYBIKX7R2s
X-Proofpoint-ORIG-GUID: IpW6jqcPM2-VL-aQtrIZXJW71Whr1jWb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_01:2021-07-06,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080025
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The atom_size used by percpu allocator on powerpc is currently
determined by mmu_linear_psize which is initialized to 4K and
mmu_linear_psize is modified only by hash. Till now for radix
the atom_size was defaulting to PAGE_SIZE(64K). Go for 2MB
atom_size on radix if support for 2MB pages exist.

2MB atom_size on radix will allow using PMD mappings in the
vmalloc area if and when support for higher sized vmalloc
mappings is enabled for the pecpu allocator. However right now
this change will result in more number of units to be allocated
within one allocation due to increased upa(units per allocation).

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kernel/setup_64.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 1ff258f6c76c..45ce2d6e8112 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -871,6 +871,30 @@ static void __init pcpu_populate_pte(unsigned long addr)
 	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
 }
 
+static size_t pcpu_atom_size(void)
+{
+	size_t atom_size = PAGE_SIZE;
+
+	/*
+	 * Radix: Use PAGE_SIZE by default or 2M if available.
+	 */
+	if (radix_enabled()) {
+		if (mmu_psize_defs[MMU_PAGE_2M].shift)
+			atom_size = 1 << mmu_psize_defs[MMU_PAGE_2M].shift;
+		goto out;
+	}
+
+	/*
+	 * Hash: Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
+	 * to group units.  For larger mappings, use 1M atom which
+	 * should be large enough to contain a number of units.
+	 */
+	if (mmu_linear_psize != MMU_PAGE_4K)
+		atom_size = 1 << 20;
+
+out:
+	return atom_size;
+}
 
 void __init setup_per_cpu_areas(void)
 {
@@ -880,15 +904,7 @@ void __init setup_per_cpu_areas(void)
 	unsigned int cpu;
 	int rc = -EINVAL;
 
-	/*
-	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
-	 * to group units.  For larger mappings, use 1M atom which
-	 * should be large enough to contain a number of units.
-	 */
-	if (mmu_linear_psize == MMU_PAGE_4K)
-		atom_size = PAGE_SIZE;
-	else
-		atom_size = 1 << 20;
+	atom_size = pcpu_atom_size();
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-- 
2.31.1

