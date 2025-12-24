Return-Path: <linuxppc-dev+bounces-15005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61BCDC297
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbr3C6tmSz2yMv;
	Wed, 24 Dec 2025 22:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766577447;
	cv=none; b=I0UNT3BOc09dAVCePrx9rIpK0BRdvLUzl43PKfiWmVjn0bN+rAx5rcIv5z/BWPTFfgVhyuRtqU2BU5vmpeV+Q2Mykl/10iTDyyvER7XlW2NydNFpayBTB1nJh1rBz+2AZR6cNXR1rfgGtfgnFbX0K2jrTflt3xhFVWF91HQ4UHQXHiPzKs2gCuvxCBdwhF2J0jqTwPGePLU4OfMdKvCPcuF/KXrF6OSDCj7GO0T7st6Vm0hr5AEAA4UqzrjisX+Xu3mwCUAReYU18dsOFEFkmS5Utkg4gBUvdtlqU/Eg7OG0SxXFbZ+Z3qXeq6BQ23Nd7DGZY4XydGTC+A8YWc3/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766577447; c=relaxed/relaxed;
	bh=GH//FvUvT9DjuJ5WlysudQDLTqviGbkOp/XERUeAZAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8/tJxHMFfknlC/nj2E7k4wzwWvti2GAs3i9SYgSO6HwJXHUBHdqU9DyPY3yp+yt8ZdtC0XG4WoIuygf5Tk6eeD8fZsAc28Ofcvi0N+hJe+wxOdIbWRx6VdGTFhmqzF6GS6tOGgrsJxtwWnP6yPq8kkcbB6CzCCMGSV/crEB5QGDCPM/zM/ir/QWnKKg877cjPcF7JV4BST6OxPLGJGBx2WvV00rTqHHbMUWkGrNzFOV9SO30uNMaTeGKVaTjPUZhJ8y5oz5oeU/feUo6Tvd+qpsePiJlsDDdwJHt2PEB7KTkLmg45jy2G3bwQVqWilUl67/qPZjNZ3SjnJCJTcLOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fvAG5zOZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fvAG5zOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbr3B60nRz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:57:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BO6jUE4007802;
	Wed, 24 Dec 2025 11:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=GH//FvUvT9DjuJ5WlysudQDLTqviGbkOp/XERUeAZ
	Ak=; b=fvAG5zOZcxGC1lF/pEv6wdznKjxkwp8lHYlBZ5BuKwt3tsTYlNccljICg
	G9yXbB/ElkqoxeuGhBhaQKX+lmCoX6nI7S5A2AQ0rl7sw/YCg1gdIJLnGm5E7NfP
	29nyejkCjHW6XO/sI+4vieGEF/sHryL87M0ofPLxo0WnzsWQ9JSErifSsBIcXM0N
	TRnvHwCVIyTNz9ttmjGDQjdB36+6sTv198dc0k74OcTqXvL/saKZHNyw/k0j1vGh
	z95ypT3PsWzSF4OWgnOJnVLcS60BmYG2g2xVRopuqlAFng3cCyIiAX2+u0ZZXG9N
	+9n0tpumpq1yD98OXXOmeFuOZq9rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5h7j13av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 11:55:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BOBtaoj000913;
	Wed, 24 Dec 2025 11:55:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5h7j13as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 11:55:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BOB0WXd030352;
	Wed, 24 Dec 2025 11:55:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b66gy017j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 11:55:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BOBtVvD24707400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Dec 2025 11:55:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 156E020043;
	Wed, 24 Dec 2025 11:55:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 236C520040;
	Wed, 24 Dec 2025 11:55:27 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.211.66])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Dec 2025 11:55:26 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-riscv@lists.infradead.org,
        "David Hildenbrand (Red Hat)" <david@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
Date: Wed, 24 Dec 2025 17:25:24 +0530
Message-ID: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMiBTYWx0ZWRfX49G/5GzFC2U/
 C+f55vWA8QZ8uaj863eDNaXePjGYiWXDwCH5iY7yWpgjHslmBbSyeAHeTQcfp+KrSv5ZnKLoj/d
 vMhTl0MmZuDR5DNh1wAKqvzc3zj6iueboozycmyXGikd3l1w2WwX42jhm6k6SudFTMiTaOWORqp
 NDTC01xlHbVpKIFjXhj9MvmxxKv3N7bhfcKb0tlV01ArCOJUdV21rZl9sQLoOSqMViR5b6Acmcn
 li12HmGHR3mNMJY99fT4GEKJjkhU7lWX0iI7MAKhBh/ifEPHQgpjLImHh5LnDIXBXHwtbP2/aMO
 jy8FfzVoZNwY2CdeATTsbe9B2fpA238SfkhJurHuSW3yMCP04ybmUCtfDXNAMD/GG9GALRjD8Fj
 7OVsDNpPVUGSf5B7NsjgSWSivaSyzokbe2B26CptiCJhZxsI5hkKvVqv8aVcIADMBec0fy/R8Wc
 9E+66lZ5qfXXGrwquEw==
X-Authority-Analysis: v=2.4 cv=Ba3VE7t2 c=1 sm=1 tr=0 ts=694bd4b8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Z4Rwk6OoAAAA:8 a=1UX6Do5GAAAA:8 a=20KFwNOVAAAA:8 a=37rDS-QxAAAA:8
 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=hZZqHmf6Ppl5AQPYj_cA:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=Et2XPkok5AAZYJIKzHr1:22 a=k1Nq6YrhK2t884LQW06G:22
 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: fc0BAFO5dfQ8F-QvuQiPYBQ1kNVWgziz
X-Proofpoint-GUID: 4LYmkV6B52ZfJ4_3n5nWsrbPH4bn8tWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512240102
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
default_hugepagesz) when hugepages are not supported by the
architecture.

Some architectures may need to disable hugepages based on conditions
discovered during kernel boot. The hugepages_supported() helper allows
architecture code to advertise whether hugepages are supported.

Currently, normal hugepage allocation is guarded by
hugepages_supported(), but gigantic hugepages are allocated regardless
of this check. This causes problems on powerpc for fadump (firmware-
assisted dump).

In the fadump (firmware-assisted dump) scenario, a production kernel
crash causes the system to boot into a special kernel whose sole
purpose is to collect the memory dump and reboot. Features such as
hugepages are not required in this environment and should be
disabled.

For example, when the fadump kernel boots with the following kernel
arguments:
default_hugepagesz=1GB hugepagesz=1GB hugepages=200

Before this patch, the kernel prints the following logs:

 HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
 HugeTLB support is disabled!
 HugeTLB: huge pages not supported, ignoring associated command-line parameters
 hugetlbfs: disabling because there are no supported hugepage sizes

Even though the logs state that HugeTLB support is disabled, gigantic
hugepages are still allocated. This causes the fadump kernel to run out
of memory during boot.

After this patch is applied, the kernel prints the following logs for
the same command line:

 HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
 HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
 HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
 HugeTLB support is disabled!
 hugetlbfs: disabling because there are no supported hugepage sizes

To fix the issue, gigantic hugepage allocation should be guarded by
hugepages_supported().

Previously, two approaches were proposed to bring gigantic hugepage
allocation under hugepages_supported():

[1] Check hugepages_supported() in the generic code before allocating
gigantic hugepages
[2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes

Approach [2] has two minor issues:
1. It prints misleading logs about invalid hugepage sizes
2. The kernel still processes hugepage kernel arguments unnecessarily

To control gigantic hugepage allocation, skip processing hugepage kernel
arguments (default_hugepagesz, hugepagesz and hugepages) when
hugepages_supported() returns false.

Note for backporting: This fix is a partial retrieval of the commit
mentioned in the Fixes tag and is only valid once the change referenced
by the Depends-on tag is present. When backporting this patch, the
commit mentioned in the Depends-on tag must be included first.

Note for backporting: This fix is a partial retrieval of the commit
mentioned in the Fixes tag. It is only valid once the change referenced
by the Depends-on tag is present. When backporting this patch, the
commit mentioned in the Depends-on tag must be included first.

Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-riscv@lists.infradead.org
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changelog:

v1:
https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/

v2:
https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
 - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()

v3:
https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
 - Do not modify the initialization of the shift variable

v4:
https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/
 - Update commit message to include how hugepages_supported() detects
   hugepages support when fadump is active
 - Add Reviewed-by tag
 - NO functional change

v5:
https://lore.kernel.org/all/20251218114154.228484-1-sourabhjain@linux.ibm.com/
 - Significant change in approach: disable processing of hugepage kernel
   arguments if hugepages_supported() returns false
 - Drop a Reviewed-by tag

v6:
https://lore.kernel.org/all/20251221053611.441251-1-sourabhjain@linux.ibm.com/
 - Updated commit message with additional logs and tags
 - No functional changes

v7:
 - Add a note for backporting this fix in the commit message
 - Add a Depends-on tag referencing the prerequisite commit
 - No functional changes
---
 mm/hugetlb.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 51273baec9e5..e0ab14020513 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4286,6 +4286,11 @@ static int __init hugepages_setup(char *s)
 	unsigned long tmp;
 	char *p = s;
 
+	if (!hugepages_supported()) {
+		pr_warn("HugeTLB: hugepages unsupported, ignoring hugepages=%s cmdline\n", s);
+		return 0;
+	}
+
 	if (!parsed_valid_hugepagesz) {
 		pr_warn("HugeTLB: hugepages=%s does not follow a valid hugepagesz, ignoring\n", s);
 		parsed_valid_hugepagesz = true;
@@ -4366,6 +4371,11 @@ static int __init hugepagesz_setup(char *s)
 	unsigned long size;
 	struct hstate *h;
 
+	if (!hugepages_supported()) {
+		pr_warn("HugeTLB: hugepages unsupported, ignoring hugepagesz=%s cmdline\n", s);
+		return 0;
+	}
+
 	parsed_valid_hugepagesz = false;
 	size = (unsigned long)memparse(s, NULL);
 
@@ -4414,6 +4424,12 @@ static int __init default_hugepagesz_setup(char *s)
 	unsigned long size;
 	int i;
 
+	if (!hugepages_supported()) {
+		pr_warn("HugeTLB: hugepages unsupported, ignoring default_hugepagesz=%s cmdline\n",
+			s);
+		return 0;
+	}
+
 	parsed_valid_hugepagesz = false;
 	if (parsed_default_hugepagesz) {
 		pr_err("HugeTLB: default_hugepagesz previously specified, ignoring %s\n", s);
-- 
2.51.1


