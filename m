Return-Path: <linuxppc-dev+bounces-14862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4815CCBA94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 12:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX81z3h73z2xrM;
	Thu, 18 Dec 2025 22:43:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766058215;
	cv=none; b=A6r6CS7N0jCKo7K8MwCG2gNRVEP36c+EXIcpryFeOQbKk/db+1OHDVNYmLCO/+Ow+8hMHbKfqxYsM37zSJrOI5HtptEUHl3L7urIVlqfakemp5rkIYNBJfVv7OpBvLmplRRxRVKot75dA8TMn6aq6Ymi9C8OjiUJnYD9scDO5yLE6g31COJW46E2oCCh0UmP1Qu8AAIYlBzWEis/ijy8EBL2d8kTfU92dBmz2rPj3GRH3Zuj17OH3xQHUyvNAbcIpIpQpmcngqaQkAAFAJxH/KNxxIO4QijFWuAJlEa3jxSSdZXm392LT+hZlRwLD38+5QLC1DmphwxMCtFfk4QotA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766058215; c=relaxed/relaxed;
	bh=ueBZn+45O9kIeB4OEnwiBfwaPe0oC7Tc2RNIDRGPvmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+QWsYHnOlNCQ4AvchXXfQwMgzEX03ZnZLX9AJeclPAwQMbzS4TuaeWpK7V9XtNU/B/kubfsvarKJQX5lQS/qdr6AJaO21XAPHf7IuP2zPEob5cUF5cfQYqidVUAE1vg+1mWcJon09XSl9v0afBh3JhR0nCtYxX6AAcAE/CvIpgV5AQGfgbpwP+1MaVFIuDzcOBs8Tg8nngY+LgQXsceO59n17VIJaJDsz4qbF9EmKHxb+DLEAMTEBHCIManvtryx0WBsgHPkzM4eBicxXZ+cEhw9+0bhINNjw/iaelkJdMD+rmV6FtCj+wzCMEv4MuOtQh6pQ7ZO7vZqBukF/Q1Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sktPT0k2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sktPT0k2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX81y2gB1z2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 22:43:33 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI9iiAE031618;
	Thu, 18 Dec 2025 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ueBZn+45O9kIeB4OEnwiBfwaPe0oC7Tc2RNIDRGPv
	mM=; b=sktPT0k23Oe0OXh0ci50UBmNSNS/m8VR2vCW3mCRaSU71tS88+onrlb+Y
	UkNdC4MyzFUXshvaN+0gDbHAZuEHcbZ/Hveuem6pqYbM+Il9+OdPdIETab8xA/pl
	zpcCOL/NoGMbmW9qJEH5xKMjW0kYenwfdBJbTLy4ZcqqZvHvA3hYUHnh0Xgc0Ho9
	G3iIM/oZGWlipExwJAgXfJfLQs4jYhWf1I2h7MSX6Bhx9qZsLRvyqsmlVxg3WBwR
	97PAfJuPDEg/Qb5kN7dFYxQtacB1WZm7VQt7TrlpCnE7R/qpqV23TD8abVlcdr3G
	NjiLQGgaCvWpxr20tq2t8xMH6Ioow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjq9pjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:42:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BIBcEub005538;
	Thu, 18 Dec 2025 11:42:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjq9pjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:42:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI992IM026786;
	Thu, 18 Dec 2025 11:42:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfsrc49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 11:42:34 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIBgVRd58393012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 11:42:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1FF72004B;
	Thu, 18 Dec 2025 11:42:30 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A55820040;
	Thu, 18 Dec 2025 11:42:26 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.19.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 11:42:26 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-arm64@lists.infradead.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
Date: Thu, 18 Dec 2025 17:11:54 +0530
Message-ID: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfX2ylNDjE6qF8M
 Wvb71AqPND/tyTSz/4Ytx1TX4ByRQ7QD1mz2iDcyWbhOUHqzd4l3OdtAH4F+ro4vS7LrVHz8eHF
 rZgRlq0mXGrzkikrlT9k5OkiZP/cyjBRDJSmHzwctlb2AXK/3Fsm16RycFVS60CROYA1Q54Vpty
 B1cx033Z3dVKBwBINWYKYurwB8cnJctF8armXqmLaL0jy+V7hiZgT0+I3Zr7mXABvarhVW2KkHX
 IoysNWvoY49vxA/fAMv2W/Z9HskNwvdPlQ9iLQhaqgdZxNIbtQGB3MpDmM/wBfOYjFhIqRa6pb4
 h1Eanrfvb5T8B+x3xEU/1DyIt9IfxNfZDaBdzW9Pv9m725wiy82/fzYIqjwvkpn7QSegbvANnhS
 e+fdzjYGsmf2hjDbJRujqbnmvDQ7lg==
X-Proofpoint-GUID: O0qyFaF33IY24Q_lUnei8zetuKTMIwbv
X-Proofpoint-ORIG-GUID: QflVMWAlGoroFrRjbVQrZbjsNP3JgSGl
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=6943e8ac cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Z4Rwk6OoAAAA:8 a=1UX6Do5GAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
 a=37rDS-QxAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=v1Mu38Z0himUwxGqKPgA:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=Et2XPkok5AAZYJIKzHr1:22 a=k1Nq6YrhK2t884LQW06G:22
 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
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

For example, fadump kernel booting with the kernel arguments
default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
following logs:

HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
HugeTLB support is disabled!
HugeTLB: huge pages not supported, ignoring associated command-line parameters
hugetlbfs: disabling because there are no supported hugepage sizes

Even though the logs say that hugetlb support is disabled, gigantic
hugepages are still getting allocated, which causes the fadump kernel
to run out of memory during boot.

To fix this, the gigantic hugepage allocation should come under
hugepages_supported().

To bring gigantic hugepage allocation under hugepages_supported(), two
approaches were previously proposed:
[1] Check hugepages_supported() in the generic code before allocating
gigantic hugepages.
[2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.

Approach [2] has two minor issues:
1. It prints misleading logs about invalid hugepage sizes
2. The kernel still processes hugepage kernel arguments unnecessarily

To control gigantic hugepage allocation, it is proposed to skip
processing the hugepage kernel arguments (hugepagesz, hugepages, and
default_hugepagesz) when hugepages_support() returns false.

Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: David Hildenbrand <david@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-arm64@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
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
 - Significant change in approach: disable processing of hugepage kernel
   arguments if hugepages_supported() returns false
 - Drop a Reviewed-by tag

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


