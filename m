Return-Path: <linuxppc-dev+bounces-4833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8BA057D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkM83gn8z30Sy;
	Wed,  8 Jan 2025 21:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331332;
	cv=none; b=FH8dURrGTcrUooiveBDRjvhK8SgGCkxPQi1/b3B/ifJUUnlEShuDI4uRtvl3IR7N54tQRL/5nai8zwUPplYj+oPbfUjCl5/deIXsv0NZh4sy3qQ/D+TOWqwhS60MyhZmUzWzufz1wN903lel0ZozHl03fXu9RkBmY9nH7shd1pQUFmtwvW3oaCfVZjfHUZyCl/ytUta9i72b9P+0kSeM0gk5ia/1xzZLENTI9joTSbvkI6pIDXe3tdNRNOHRx0AC+v0rSBQ1Nol1eClpq01xFwfrgDVWxrin4eTrJTSK6mJ9Pl3e7KYxbv3C8qpRgvc6nsnqr3u35yBiqsdKLFr/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331332; c=relaxed/relaxed;
	bh=dCDK6BOsU4ZX7A04sKP0HMI7l9HAPh7z4+ZQG7MoYvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0hNJYREboK9RQABeloHu893OKAJ2WcuMv7w6yXP5cxUrqBOBLYFAeJFIHwqMr9b15QRMcLHJ1FbKErkKpFq+0gOq44e15/NaniOuTwkvCuoK1yj3umQgoUhRWLKsgqpyxbLZJaG2z3WB6Jb49fa8o5QhVX8jy/krZQQIVee0zjUwzLQT61UeplSGGjmIkjEWT5iQiugfDK2vDwNfKv1qc/HXUdTkRKY6SrSJ3ml9pc/hyOwfsbbNfkc0V52KW6RMBayeWJZWaZYIGpKYGgRkm0aesC7Gp2lNpWLxIwObrz+NJl0Pajxgh/FHjw5Mpt/KpimKui+HpqZjCHka5xhwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJXB2jJg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qJXB2jJg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSkM733K8z3bP7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:15:31 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50864qHv007032;
	Wed, 8 Jan 2025 10:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dCDK6BOsU4ZX7A04s
	KP0HMI7l9HAPh7z4+ZQG7MoYvY=; b=qJXB2jJgoWyHIlPSIE7mvi7NwXU7AQivN
	GxgK4kkoVurLNpA+8jElojZzrwpaiSwSoDQM+sSNTflkXmcyNos5l5uyRkh0IeV8
	li4FIevEEh+V4my1SANgPohqCt+XKrUiZbTOyZiZ1pTahWbbAhgt82YQRnrDgaqN
	bpwPMNhvdCHVLP3vdfH55VABXyTitvQ5sanN1DNFXPTmwpmXt+mOmMkNhY6FVYtr
	nTo6VX1eTtFQefZXQwALHQB+/Z8iH6AVZTBEghEgCUngyDqoDJmQ1qhOKpRedM9e
	U4IFkRNsRZ1XcvKyPxGJeLS/SbSyBb40ZJrA2tjxLcB9TU57ny7WQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4415r54r53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5086OFF3027963;
	Wed, 8 Jan 2025 10:15:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhk7030-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AFHEY20840730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:15:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DEDD20065;
	Wed,  8 Jan 2025 10:15:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 776752005A;
	Wed,  8 Jan 2025 10:15:15 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:15:15 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 5/5] crash: option to let arch decide mem range is usable
Date: Wed,  8 Jan 2025 15:44:58 +0530
Message-ID: <20250108101458.406806-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: DW3et_kc-6OhuUpJsf0nbcpvoXKOZcCr
X-Proofpoint-GUID: DW3et_kc-6OhuUpJsf0nbcpvoXKOZcCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On PowerPC, the memory reserved for the crashkernel can contain
components like RTAS, TCE, OPAL, etc., which should be avoided when
loading kexec segments into crashkernel memory. Due to these special
components, PowerPC has its own set of functions to locate holes in the
crashkernel memory for loading kexec segments for kdump. However, for
loading kexec segments in the kexec case, PowerPC uses generic functions
to locate holes.

So, let's use generic functions to locate memory holes for kdump on
PowerPC by adding an arch hook to handle such special regions while
loading kexec segments, and remove the PowerPC functions to locate
holes.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |   6 +-
 arch/powerpc/kexec/file_load_64.c | 259 ++----------------------------
 include/linux/kexec.h             |   9 ++
 kernel/kexec_file.c               |  12 ++
 4 files changed, 34 insertions(+), 252 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 64741558071f..5e4680f9ff35 100644
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
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..407f8b0346aa 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -205,6 +205,15 @@ static inline int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 #endif
 
+#ifndef arch_check_excluded_range
+static inline int arch_check_excluded_range(struct kimage *image,
+					    unsigned long start,
+					    unsigned long end)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_KEXEC_SIG
 #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
 int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 3eedb8c226ad..52e1480dbfa1 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -464,6 +464,12 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
 			continue;
 		}
 
+		/* Make sure this does not conflict exclude range */
+		if (arch_check_excluded_range(image, temp_start, temp_end)) {
+			temp_start = temp_start - PAGE_SIZE;
+			continue;
+		}
+
 		/* We found a suitable memory range */
 		break;
 	} while (1);
@@ -498,6 +504,12 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
 			continue;
 		}
 
+		/* Make sure this does not conflict exclude range */
+		if (arch_check_excluded_range(image, temp_start, temp_end)) {
+			temp_start = temp_start + PAGE_SIZE;
+			continue;
+		}
+
 		/* We found a suitable memory range */
 		break;
 	} while (1);
-- 
2.47.1


