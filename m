Return-Path: <linuxppc-dev+bounces-16824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PlGhNf1sjWkH2gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 07:02:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D559C12A873
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 07:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBPpf4JdRz2yLH;
	Thu, 12 Feb 2026 17:02:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770876154;
	cv=none; b=COCuYd31mP1P9eu+Xigj14jsa+CKFkrVj7zPNp2seeaX1semStpteZS1XT79iqLwzKjbEHrr1AosMp0DyAJTorw2ZK3ynsPGrgfA5ems2DAq3VmLpldtbWfd3WBYx6TDh5rFVkb4qg6GdUKbEmKaTni+vM+VRFtztSl1cGsL+y0ulkFbu6S1tnV247nDyZuXJRLqnIGmM+ylYluvKlOlZ/fzIXAs/UdmBq23+GzI7bDuhorTbYTyAVfk950P+wr/siczajtOOTBtFQ2t2vjjbgE0QWZjC4SzO2iJPPQO42pzhzBubp4ykQKdmNx3q1xMFdyTVUTa36t2l+PXIN/rQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770876154; c=relaxed/relaxed;
	bh=Hmvg6P0d+9SZZHeOBqjrXjSt0XSUVnsXbvZhlLYFUA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VrEnh585YU6vevOlkEh3cz1UTOPrhC+UtLw7cUbbr8ini8sqk7KI3hBXDPFl0af7D8aba/YgPebSq1x2Q30wDp7ahWKbrNR/2/wpN3BA6j9EdXs6/z/T3xTfolKhy7rrc22UKe44BZYHnM9Rcp+ANz8z3dukl719Acdm9j9sl356iRsJSPNoVbW/3ZsOdGTmI44i11wicPtY08c2mrMp/f9Wl5mC15LG4Z+CDJCYixIw6Txi+ss8qiS0JmesASeAIsBWJEylq+c0rR1t7bLAHvgjhiTn5MIW0NT53TDUiLvj+CEdzROl36LPDVwJCgE7NH0hHge3KBejy0pPCgKuLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oT+qVrmu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oT+qVrmu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBPpc2tDRz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 17:02:32 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BH3sgT2503229;
	Thu, 12 Feb 2026 06:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Hmvg6P0d+9SZZHeOBqjrXjSt0XSUVnsXbvZhlLYFU
	A8=; b=oT+qVrmu4nhXd0YvMpsMRVnXsBjIMRQYnGSuc1swAPNkdm5Sw5hsDjbcU
	XAiGPxjXw9J8qM1nPo1CLOPIidCsW/0D1Kiqs5B3N+ZG+dS+JTC9aKVYGvdhjkff
	JfoNr23+C2WCQJro0nF3GwGJCxBJneH4I2niFzHzwxMvibiyTZErzUFA97L3TWSs
	NjcUV9lHiLitXjMNIV8ItIj05k9K9fzgSlI0+r99y0xwqJqBw0kW0HhciTdoTUdf
	AyTkwwSZw240ZNzuyq1Fnk7x796j9UqiZVuli7sXnroyeMkedpScG1I3+8hhGbx2
	r/Nj2OmnJxVJdIqFG36czeaiBjVlw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696va110-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:02:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61C4ZFJ2019251;
	Thu, 12 Feb 2026 06:02:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6hxk8x6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:02:11 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61C628YW50921876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 06:02:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3932120040;
	Thu, 12 Feb 2026 06:02:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF7D420043;
	Thu, 12 Feb 2026 06:02:03 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.27.166])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Feb 2026 06:02:03 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
Date: Thu, 12 Feb 2026 11:31:59 +0530
Message-ID: <20260212060159.733023-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: WgP2I7qtboAQMm2_IlCUvLoxp78N--v2
X-Proofpoint-ORIG-GUID: f13Zli5vsJY8EySErt_WPM3yP13ScLLl
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=698d6ce5 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=TNJSkpwCZzExJk-GAwUA:9
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAzOSBTYWx0ZWRfXxUzH8bwc6Vhl
 ICqXAaASdGKselvMaXY9QWTK+cIZZqfB3KUsghes5XCmeYRv11cOCIfCd9Z3Ebow3whS+CT0Q+i
 4J2zk2xILy+AtmRwbowgcnrIrlYhbDcfwmr2/HcNDPJlGspP0Vz644SXL/KJcQGz8dfMzl067st
 wCScmHxX7hXXq/b0nDCxVVyb1BdL+MsaM5WYUW/DyrXzYYOOJD3e26LL0oiSX8RPSKuj++UT9N3
 e5ot/OTOwlO6R0wyM+xZL+I/SNAQpoAPQu9RjWb/RWsEIsBpo4Y6qESYPZLggZ/Yy4T/ACzOKHs
 RF1lqIPth9bMysoxCtGbMzv+dVKUlBI3+IDV7sOTH360lAkiojYegVKkhl+/QCanfB3Z5sQtEgC
 /6ap9ha/OJ9VUKnMo/p7ebY5tk+4SdniUIJ4TfGMygO/13BfoqwAchbe/pTbwAvH4y2Eh6MoFin
 rwJuKncJkSh1ywixcsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,linux-foundation.org,redhat.com,huawei.com,ellerman.id.au,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-16824-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,huawei.com:email,linux-foundation.org:email];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D559C12A873
X-Rspamd-Action: no action

During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
the removed memory. While updating the crash memory ranges for this
operation, the crash memory ranges array can become unsorted. This
happens because remove_mem_range() may split a memory range into two
parts and append the higher-address part as a separate range at the end
of the array.

So far, no issues have been observed due to the unsorted crash memory
ranges. However, this could lead to problems once crash memory range
removal is handled by generic code, as introduced in the upcoming
patches in this series.

Currently, powerpc uses a platform-specific function,
remove_mem_range(), to exclude hot-removed memory from the crash memory
ranges. This function performs the same task as the generic
crash_exclude_mem_range() in crash_core.c. The generic helper also
ensures that the crash memory ranges remain sorted. So remove the
redundant powerpc-specific implementation and instead call
crash_exclude_mem_range_guarded() (which internally calls
crash_exclude_mem_range()) to exclude the hot-removed memory ranges.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Requesting this patch to part of the below patch series.
https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/

Changelog:
 - Update hot removed memory end address calculation

---
 arch/powerpc/include/asm/kexec_ranges.h |  4 +-
 arch/powerpc/kexec/crash.c              |  5 +-
 arch/powerpc/kexec/ranges.c             | 87 +------------------------
 3 files changed, 7 insertions(+), 89 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index 14055896cbcb..ad95e3792d10 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,7 +7,9 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
-int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+				    unsigned long long mstart,
+				    unsigned long long mend);
 int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
 int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index a325c1c02f96..898742a5205c 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -431,7 +431,7 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 	struct crash_mem *cmem = NULL;
 	struct kexec_segment *ksegment;
 	void *ptr, *mem, *elfbuf = NULL;
-	unsigned long elfsz, memsz, base_addr, size;
+	unsigned long elfsz, memsz, base_addr, size, end;
 
 	ksegment = &image->segment[image->elfcorehdr_index];
 	mem = (void *) ksegment->mem;
@@ -450,7 +450,8 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
 		base_addr = PFN_PHYS(mn->start_pfn);
 		size = mn->nr_pages * PAGE_SIZE;
-		ret = remove_mem_range(&cmem, base_addr, size);
+		end = base_addr + size - 1;
+		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
 		if (ret) {
 			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
 			goto out;
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 867135560e5c..6c58bcc3e130 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -553,7 +553,7 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
 					   unsigned long long mstart,
 					   unsigned long long mend)
 {
@@ -641,89 +641,4 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 		pr_err("Failed to setup crash memory ranges\n");
 	return ret;
 }
-
-/**
- * remove_mem_range - Removes the given memory range from the range list.
- * @mem_ranges:    Range list to remove the memory range to.
- * @base:          Base address of the range to remove.
- * @size:          Size of the memory range to remove.
- *
- * (Re)allocates memory, if needed.
- *
- * Returns 0 on success, negative errno on error.
- */
-int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
-{
-	u64 end;
-	int ret = 0;
-	unsigned int i;
-	u64 mstart, mend;
-	struct crash_mem *mem_rngs = *mem_ranges;
-
-	if (!size)
-		return 0;
-
-	/*
-	 * Memory range are stored as start and end address, use
-	 * the same format to do remove operation.
-	 */
-	end = base + size - 1;
-
-	for (i = 0; i < mem_rngs->nr_ranges; i++) {
-		mstart = mem_rngs->ranges[i].start;
-		mend = mem_rngs->ranges[i].end;
-
-		/*
-		 * Memory range to remove is not part of this range entry
-		 * in the memory range list
-		 */
-		if (!(base >= mstart && end <= mend))
-			continue;
-
-		/*
-		 * Memory range to remove is equivalent to this entry in the
-		 * memory range list. Remove the range entry from the list.
-		 */
-		if (base == mstart && end == mend) {
-			for (; i < mem_rngs->nr_ranges - 1; i++) {
-				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
-				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
-			}
-			mem_rngs->nr_ranges--;
-			goto out;
-		}
-		/*
-		 * Start address of the memory range to remove and the
-		 * current memory range entry in the list is same. Just
-		 * move the start address of the current memory range
-		 * entry in the list to end + 1.
-		 */
-		else if (base == mstart) {
-			mem_rngs->ranges[i].start = end + 1;
-			goto out;
-		}
-		/*
-		 * End address of the memory range to remove and the
-		 * current memory range entry in the list is same.
-		 * Just move the end address of the current memory
-		 * range entry in the list to base - 1.
-		 */
-		else if (end == mend)  {
-			mem_rngs->ranges[i].end = base - 1;
-			goto out;
-		}
-		/*
-		 * Memory range to remove is not at the edge of current
-		 * memory range entry. Split the current memory entry into
-		 * two half.
-		 */
-		else {
-			size = mem_rngs->ranges[i].end - end + 1;
-			mem_rngs->ranges[i].end = base - 1;
-			ret = add_mem_range(mem_ranges, end + 1, size);
-		}
-	}
-out:
-	return ret;
-}
 #endif /* CONFIG_CRASH_DUMP */
-- 
2.52.0


