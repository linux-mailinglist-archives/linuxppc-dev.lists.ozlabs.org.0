Return-Path: <linuxppc-dev+bounces-13777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81EC33DAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:40:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1WKy3pwxz3bfM;
	Wed,  5 Nov 2025 14:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762314006;
	cv=none; b=NqFZXhI1C2ZzpK6EVL069L5ALF1TRxxL5rGvFqZkkzvT6jF7GDyFblRRkjGkMw1/CmAqU091rmvwcJhNMogP1SwFd/PpTVPZ1yHjHZifDDmiQ3SVJ6CX7mNhLU7jWKr/iEg5diQCt7BOE9MRFgByAaTYjf3nKkO+IOtpP2LzwvlbXqUyTvF/DbzYyRFR1bplAgqFRhhOJ8X6FZsZM5KY3cSsCH1aBEJRFL+q9hLvV+f9bqsC/wlp/wSjdHf1pPFx39djT+qIjoVmYbRbclIfmbwcKz/y6zudDbvknc41i448QGtVltDDVwnZZb/5W3aX8mBur+/o2Oa5NWXy0azk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762314006; c=relaxed/relaxed;
	bh=fSlqS1nRxHXK3gxjj9KX6EdeJZe+nuPjIw65FJRjJYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZCyMpWI3bUd7+Bl+zAB6BZQ6XLjAB4qIInmbQHQyzw/nM34TuMtM6QLIhrnAYHwPptPhyhXLhRH2e9HAHhDsP51TxibMhacX1sx+m2ULlVKgNNXLJ/kVSnGulbI4ELJNzPwmAytsYPZujVan5MzvNoL6AJyX3Vr/yFhbpFA9oGxWoaOhMcX5pvtEDo0WsPw2ORvR9Bq9Z7kaEo81pmTZ5LQHKU8x+Y+sG0uP6QoNZ9KMlZWYm1DsL1CoUKmxPV857x5mDN/HP0M80xSETW0393LWYS0lirhBitcdwgqifOh8kS3wqmC2J6wdFNUzJiW+3cesTIAH50VU9fIlmaI4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TZtWVPaw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TZtWVPaw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1WKx47LFz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:40:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4G2iQX005447;
	Wed, 5 Nov 2025 03:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=fSlqS1nRxHXK3gxjj9KX6EdeJZe+nuPjIw65FJRjJ
	YU=; b=TZtWVPaw8T3NVLbfjPlWyaXbEuRlOTlJG7c0Fto84cRlYofS4a2ERvQJF
	5ThnvSQ3ABXE+tHdETiWVkXxqo/yuOD9Wg590u9CrprOh2YpKZ+XkreXCbRKZ+9E
	TUYYGKjO4i4IilnBl6KsGsl7Wq4z4iPrCl3eXqncHucwulhZvCX6TPsymDwVZ3S/
	bOq/SX0HJ4Kst/KPNwpgSRMaEErZKjcU5zwSGA3XLBpm7v94ymQCa/YDhyYra+Pe
	LNMvw6gPQMwwYI+1ScdWTPHsLUuqPLyqY7uIUGzXOUg7Shs56zxVBvX54T6t3wdF
	XyOrTc/YPrM3DzYj7dS/Wo/kcTfUA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mky429-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:39:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A53dtHh013588;
	Wed, 5 Nov 2025 03:39:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mky427-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:39:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A500o7o012891;
	Wed, 5 Nov 2025 03:39:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y81wyrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 03:39:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A53dpWG31261078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 03:39:51 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3025B20043;
	Wed,  5 Nov 2025 03:39:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FE1F20040;
	Wed,  5 Nov 2025 03:39:49 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 03:39:49 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Shirisha G <shirisha@linux.ibm.com>
Subject: [PATCH] powerpc/kdump: Fix size calculation for hot-removed memory ranges
Date: Wed,  5 Nov 2025 09:09:41 +0530
Message-ID: <20251105033941.1752287-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-ORIG-GUID: Df1ZCqugMr4vAZKfkhMIlc2I0Y10VcSa
X-Proofpoint-GUID: 1MPQfQLOFrVNK7gLF_6Apa5_kD19S3q8
X-Authority-Analysis: v=2.4 cv=SqidKfO0 c=1 sm=1 tr=0 ts=690ac70c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=IcFmaQBwavzz-t_YjPEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwOSBTYWx0ZWRfX0vTuOJohdtOT
 6h0cexg00hcgn+FpIykOU6CjyLbmvMge/i/kg6rV/SxxpOzb3PzQcAOFz35pPrXl4vLtWvudZgI
 qoOARBeKuTtktFxqP6T9nN1BGYBODplcpsYtTQVBAl2jRpsAAW8MM2/m6HaxIiQt7RuXtRl7y7O
 J98ubHttKMEpdw7nAvxbLrOtkfun/XBbFBdTAU2kN/WAroVwPssYZpUnWxgUzzXULdTBjr5l51O
 jByYLx/2YdofSibosLxGtOsT30cHeYc48uBPLyLqFreuJVA5jull3lxKd6UQcX2Sci/svfbbXvQ
 5aTzsEmPLEOtNqmG9yHzwHI+XZ9BpkvPecRq7C95Pjlt5e9zPX7AYWbqe9lxsVv01dDfQoz0X6j
 1JTriRF5EduOVoNoPi62fzNexx62gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The elfcorehdr segment in the kdump image stores information about the
memory regions (called crash memory ranges) that the kdump kernel must
capture.

When a memory hot-remove event occurs, the kernel regenerates the
elfcorehdr for the currently loaded kdump image to remove the
hot-removed memory from the crash memory ranges.

Call chain:
remove_mem_range()
update_crash_elfcorehdr()
arch_crash_handle_hotplug_event()
crash_handle_hotplug_event()

While removing the hot-removed memory from the crash memory ranges in
remove_mem_range(), if the removed memory lies within an existing crash
range, that range is split into two. During this split, the size of the
second range was being calculated incorrectly.

This leads to dump capture failure with makedumpfile with below error:

$ makedumpfile -l -d 31 /proc/vmcore /tmp/vmcore

readpage_elf: Attempt to read non-existent page at 0xbbdab0000.
readmem: type_addr: 0, addr:c000000bbdab7f00, size:16
validate_mem_section: Can't read mem_section array.
readpage_elf: Attempt to read non-existent page at 0xbbdab0000.
readmem: type_addr: 0, addr:c000000bbdab7f00, size:8
get_mm_sparsemem: Can't get the address of mem_section.

The updated crash memory range in PT_LOAD entry is holding incorrect
data (checkout FileSiz and MemSiz):

readelf -a /proc/vmcore
<snip...>
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000b013d0000 0xc000000b80000000 0x0000000b80000000
                 0xffffffffc0000000 0xffffffffc0000000  RWE    0x0
<snip...>

Update the size calculation for the new crash memory range to fix this
issue.

Note: This problem will not occur if the kdump kernel is loaded or
reloaded after a memory hot-remove operation.

Fixes: 849599b702ef ("powerpc/crash: add crash memory hotplug support")
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Reported-by: Shirisha G <shirisha@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/ranges.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 3702b0bdab14..426bdca4667e 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -697,8 +697,8 @@ int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
 		 * two half.
 		 */
 		else {
+			size = mem_rngs->ranges[i].end - end + 1;
 			mem_rngs->ranges[i].end = base - 1;
-			size = mem_rngs->ranges[i].end - end;
 			ret = add_mem_range(mem_ranges, end + 1, size);
 		}
 	}
-- 
2.51.0


