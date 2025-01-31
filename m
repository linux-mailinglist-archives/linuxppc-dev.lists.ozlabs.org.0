Return-Path: <linuxppc-dev+bounces-5742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8899A23D37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 12:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykv775h7Hz30WC;
	Fri, 31 Jan 2025 22:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738323555;
	cv=none; b=ThgUltWDq2IU0MAkr4jgMYkdsPvMwMqc/B5os5owySXrPsxnGaiozBV2ghl81owy8aIhozdZ90VeMPL62AqPhETVBtpyef7cccXRO3zh2XE192nTSkbk9l8ahzBaINLXnxxXD9aj5vPmepHSAldvOwBfC+ZYgSOmgtEka3lA7B2horZqPfk7SjkBUD0x+W03oFA2Ycoaa3AVkfxxENeIZ/KArpCQHPRRFHVONjekcnooOnCb82qB/UCDWUhHZXC2F4ZX/+i+8YnY1O18y9NDOytfV8PwI992croOfy4oRvSQCoJJHRQxQcvk15V6F2j8ji+bBttKgcACybDPbbnPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738323555; c=relaxed/relaxed;
	bh=qAdUnNKmBH1eKv3zgMFklMhoIriu1ZAuWX2RsAtfbDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HY43S8xR2Lfa614z+UYRU68rKg45cvl50S8dvr/bB9Q/C47/YsWo/cxYdXrVueHp4KG0m3YdiRXWW4SVQSRxODrtIm6XrCJpUILWzlI1u82JfRR6u4QSpr8FHOZcLyKlFi4XDN5iG0m+yhUBCyzdhr+6a/OesHFggjxfFhqbb141lx/7tIADghPk3i+VQcbxBLMkqLT0f7ZktuWKM3wctM2W0htpQY19CsTJrmpPFBmUrKjfWeA0EjyRS33cAJF+2w2bTLjsEVndegK0HLnj9uTufOkYPrclOjdd4V3xrfyRf7mMLeKaDMnnfdw4Y+GlPNs/SSlM/Q4t9Wi3cnl4uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HM/35rfq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HM/35rfq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykv76640Qz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:39:14 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2OKQG021890;
	Fri, 31 Jan 2025 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qAdUnNKmBH1eKv3zg
	MFklMhoIriu1ZAuWX2RsAtfbDE=; b=HM/35rfqlHU2vseFhpgc4IVCrAui7Kx3r
	YnJMJKpHHuxgOyVHg1NqRuiku6vzVOO3OeQ94BEFBI9uNcOUxzj58LDoYLyP472r
	ZbTRUm9ArmoRxvlqdWrcf9In6Lzfdo6fHAgpRZwIH2U/q7P5RXlorg2ZDZCNecAV
	/nB78JaZy+BESnIl/MbOPh/4EAKIxCRWSZMHiOL9M80VB7vYgBSzWUanvcO1GHaW
	jfoWWnP/RWPqwTu2gezAnhuSjjgoWnK5wA8YzVKKmCL+rxOFW0rX2XjRRXAIYQEB
	R6PmksqLHc2whXahcsUhkyGv1ywbLTeFiyoe8TkX0DTLPheNp9pQg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gnby9ygm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:39:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V8BIPM017237;
	Fri, 31 Jan 2025 11:39:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gfaybb3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:39:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VBd0jd55116062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:39:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1659D20104;
	Fri, 31 Jan 2025 11:39:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 332AD20101;
	Fri, 31 Jan 2025 11:38:57 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:38:56 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] powerpc/crash: Use generic APIs to locate memory hole for kdump
Date: Fri, 31 Jan 2025 17:08:27 +0530
Message-ID: <20250131113830.925179-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: PMa6BNvwUSUAVmJqHQ-Fr_m_B2jzuPuU
X-Proofpoint-GUID: PMa6BNvwUSUAVmJqHQ-Fr_m_B2jzuPuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On PowerPC, the memory reserved for the crashkernel can contain
components like RTAS, TCE, OPAL, etc., which should be avoided when
loading kexec segments into crashkernel memory. Due to these special
components, PowerPC has its own set of APIs to locate holes in the
crashkernel memory for loading kexec segments for kdump. However, for
loading kexec segments in the kexec case, PowerPC already uses generic
APIs to locate holes.

The previous patch in this series, titled "crash: Let arch decide usable
memory range in reserved area," introduced arch-specific hook to handle
such special regions in the crashkernel area. So, switch PowerPC to use
the generic APIs to locate memory holes for kdump and remove the
redundant PowerPC-specific APIs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |   6 +-
 arch/powerpc/kexec/file_load_64.c | 259 ++----------------------------
 2 files changed, 13 insertions(+), 252 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 270ee93a0f7d..8d9d20e0b02b 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -95,8 +95,10 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf, unsigned long
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
 
-int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
-#define arch_kexec_locate_mem_hole arch_kexec_locate_mem_hole
+int arch_check_excluded_range(struct kimage *image, unsigned long start,
+			      unsigned long end);
+#define arch_check_excluded_range  arch_check_excluded_range
+
 
 int load_crashdump_segments_ppc64(struct kimage *image,
 				  struct kexec_buf *kbuf);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index dc65c1391157..e7ef8b2a2554 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -49,201 +49,18 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 	NULL
 };
 
-/**
- * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
- *                              in the memory regions between buf_min & buf_max
- *                              for the buffer. If found, sets kbuf->mem.
- * @kbuf:                       Buffer contents and memory parameters.
- * @buf_min:                    Minimum address for the buffer.
- * @buf_max:                    Maximum address for the buffer.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
-				      u64 buf_min, u64 buf_max)
-{
-	int ret = -EADDRNOTAVAIL;
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range_rev(i, &start, &end) {
-		/*
-		 * memblock uses [start, end) convention while it is
-		 * [start, end] here. Fix the off-by-one to have the
-		 * same convention.
-		 */
-		end -= 1;
-
-		if (start > buf_max)
-			continue;
-
-		/* Memory hole not found */
-		if (end < buf_min)
-			break;
-
-		/* Adjust memory region based on the given range */
-		if (start < buf_min)
-			start = buf_min;
-		if (end > buf_max)
-			end = buf_max;
-
-		start = ALIGN(start, kbuf->buf_align);
-		if (start < end && (end - start + 1) >= kbuf->memsz) {
-			/* Suitable memory range found. Set kbuf->mem */
-			kbuf->mem = ALIGN_DOWN(end - kbuf->memsz + 1,
-					       kbuf->buf_align);
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
-}
-
-/**
- * locate_mem_hole_top_down_ppc64 - Skip special memory regions to find a
- *                                  suitable buffer with top down approach.
- * @kbuf:                           Buffer contents and memory parameters.
- * @buf_min:                        Minimum address for the buffer.
- * @buf_max:                        Maximum address for the buffer.
- * @emem:                           Exclude memory ranges.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
-					  u64 buf_min, u64 buf_max,
-					  const struct crash_mem *emem)
+int arch_check_excluded_range(struct kimage *image, unsigned long start,
+			      unsigned long end)
 {
-	int i, ret = 0, err = -EADDRNOTAVAIL;
-	u64 start, end, tmin, tmax;
-
-	tmax = buf_max;
-	for (i = (emem->nr_ranges - 1); i >= 0; i--) {
-		start = emem->ranges[i].start;
-		end = emem->ranges[i].end;
-
-		if (start > tmax)
-			continue;
-
-		if (end < tmax) {
-			tmin = (end < buf_min ? buf_min : end + 1);
-			ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
-			if (!ret)
-				return 0;
-		}
-
-		tmax = start - 1;
-
-		if (tmax < buf_min) {
-			ret = err;
-			break;
-		}
-		ret = 0;
-	}
-
-	if (!ret) {
-		tmin = buf_min;
-		ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
-	}
-	return ret;
-}
-
-/**
- * __locate_mem_hole_bottom_up - Looks bottom up for a large enough memory hole
- *                               in the memory regions between buf_min & buf_max
- *                               for the buffer. If found, sets kbuf->mem.
- * @kbuf:                        Buffer contents and memory parameters.
- * @buf_min:                     Minimum address for the buffer.
- * @buf_max:                     Maximum address for the buffer.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
-				       u64 buf_min, u64 buf_max)
-{
-	int ret = -EADDRNOTAVAIL;
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		/*
-		 * memblock uses [start, end) convention while it is
-		 * [start, end] here. Fix the off-by-one to have the
-		 * same convention.
-		 */
-		end -= 1;
-
-		if (end < buf_min)
-			continue;
-
-		/* Memory hole not found */
-		if (start > buf_max)
-			break;
-
-		/* Adjust memory region based on the given range */
-		if (start < buf_min)
-			start = buf_min;
-		if (end > buf_max)
-			end = buf_max;
-
-		start = ALIGN(start, kbuf->buf_align);
-		if (start < end && (end - start + 1) >= kbuf->memsz) {
-			/* Suitable memory range found. Set kbuf->mem */
-			kbuf->mem = start;
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
-}
-
-/**
- * locate_mem_hole_bottom_up_ppc64 - Skip special memory regions to find a
- *                                   suitable buffer with bottom up approach.
- * @kbuf:                            Buffer contents and memory parameters.
- * @buf_min:                         Minimum address for the buffer.
- * @buf_max:                         Maximum address for the buffer.
- * @emem:                            Exclude memory ranges.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
-					   u64 buf_min, u64 buf_max,
-					   const struct crash_mem *emem)
-{
-	int i, ret = 0, err = -EADDRNOTAVAIL;
-	u64 start, end, tmin, tmax;
-
-	tmin = buf_min;
-	for (i = 0; i < emem->nr_ranges; i++) {
-		start = emem->ranges[i].start;
-		end = emem->ranges[i].end;
-
-		if (end < tmin)
-			continue;
-
-		if (start > tmin) {
-			tmax = (start > buf_max ? buf_max : start - 1);
-			ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
-			if (!ret)
-				return 0;
-		}
-
-		tmin = end + 1;
+	struct crash_mem *emem;
+	int i;
 
-		if (tmin > buf_max) {
-			ret = err;
-			break;
-		}
-		ret = 0;
-	}
+	emem = image->arch.exclude_ranges;
+	for (i = 0; i < emem->nr_ranges; i++)
+		if (start < emem->ranges[i].end && end > emem->ranges[i].start)
+			return 1;
 
-	if (!ret) {
-		tmax = buf_max;
-		ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
-	}
-	return ret;
+	return 0;
 }
 
 #ifdef CONFIG_CRASH_DUMP
@@ -1004,64 +821,6 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
 	return ret;
 }
 
-/**
- * arch_kexec_locate_mem_hole - Skip special memory regions like rtas, opal,
- *                              tce-table, reserved-ranges & such (exclude
- *                              memory ranges) as they can't be used for kexec
- *                              segment buffer. Sets kbuf->mem when a suitable
- *                              memory hole is found.
- * @kbuf:                       Buffer contents and memory parameters.
- *
- * Assumes minimum of PAGE_SIZE alignment for kbuf->memsz & kbuf->buf_align.
- *
- * Returns 0 on success, negative errno on error.
- */
-int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
-{
-	struct crash_mem **emem;
-	u64 buf_min, buf_max;
-	int ret;
-
-	/* Look up the exclude ranges list while locating the memory hole */
-	emem = &(kbuf->image->arch.exclude_ranges);
-	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
-		pr_warn("No exclude range list. Using the default locate mem hole method\n");
-		return kexec_locate_mem_hole(kbuf);
-	}
-
-	buf_min = kbuf->buf_min;
-	buf_max = kbuf->buf_max;
-	/* Segments for kdump kernel should be within crashkernel region */
-	if (IS_ENABLED(CONFIG_CRASH_DUMP) && kbuf->image->type == KEXEC_TYPE_CRASH) {
-		buf_min = (buf_min < crashk_res.start ?
-			   crashk_res.start : buf_min);
-		buf_max = (buf_max > crashk_res.end ?
-			   crashk_res.end : buf_max);
-	}
-
-	if (buf_min > buf_max) {
-		pr_err("Invalid buffer min and/or max values\n");
-		return -EINVAL;
-	}
-
-	if (kbuf->top_down)
-		ret = locate_mem_hole_top_down_ppc64(kbuf, buf_min, buf_max,
-						     *emem);
-	else
-		ret = locate_mem_hole_bottom_up_ppc64(kbuf, buf_min, buf_max,
-						      *emem);
-
-	/* Add the buffer allocated to the exclude list for the next lookup */
-	if (!ret) {
-		add_mem_range(emem, kbuf->mem, kbuf->memsz);
-		sort_memory_ranges(*emem, true);
-	} else {
-		pr_err("Failed to locate memory buffer of size %lu\n",
-		       kbuf->memsz);
-	}
-	return ret;
-}
-
 /**
  * arch_kexec_kernel_image_probe - Does additional handling needed to setup
  *                                 kexec segments.
-- 
2.48.1


