Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB521DF1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:47:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5B1m1CvPzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:47:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59VV1yx0zDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:24:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59VT1bY5z8vnS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:24:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59VT0DmTz9sTC; Tue, 14 Jul 2020 03:24:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B59VS3Jfsz9sSt
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:24:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH22SH145124; Mon, 13 Jul 2020 13:23:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279dtb9km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:54 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DHJVXs195425;
 Mon, 13 Jul 2020 13:23:54 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279dtb9ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:54 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DHLOZ5032539;
 Mon, 13 Jul 2020 17:23:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 327527h7tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:23:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DHNn6055836730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:23:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85332AE055;
 Mon, 13 Jul 2020 17:23:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43759AE053;
 Mon, 13 Jul 2020 17:23:46 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:23:46 +0000 (GMT)
Subject: [PATCH v3 12/12] ppc64/kexec_file: fix kexec load failure with lack
 of memory hole
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:53:45 +0530
Message-ID: <159466101903.24747.7234708045729315954.stgit@hbathini.in.ibm.com>
In-Reply-To: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=2
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130120
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec purgatory has to run in real mode. Only the first memory
block maybe accessible in real mode. And, unlike the case with panic
kernel, no memory is set aside for regular kexec load. Another thing
to note is, the memory for crashkernel is reserved at an offset of
128MB. So, when crashkernel memory is reserved, the memory ranges to
load kexec segments shrink further as the generic code only looks for
memblock free memory ranges and in all likelihood only a tiny bit of
memory from 0 to 128MB would be available to load kexec segments.

With kdump being used by default in general, kexec file load is likely
to fail almost always. This can be fixed by changing the memory hole
lookup logic for regular kexec to use the same method as kdump. This
would mean that most kexec segments will overlap with crashkernel
memory region. That should still be ok as the pages, whose destination
address isn't available while loading, are placed in an intermediate
location till a flush to the actual destination address happens during
kexec boot sequence.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
---

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* New patch to fix locating memory hole for kexec_file_load (kexec -s -l)
  when memory is reserved for crashkernel.


 arch/powerpc/kexec/file_load_64.c |   33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 29e5d11..b79d62bc 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1328,13 +1328,6 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	u64 buf_min, buf_max;
 	int ret;
 
-	/*
-	 * Use the generic kexec_locate_mem_hole for regular
-	 * kexec_file_load syscall
-	 */
-	if (kbuf->image->type != KEXEC_TYPE_CRASH)
-		return kexec_locate_mem_hole(kbuf);
-
 	/* Look up the exclude ranges list while locating the memory hole */
 	emem = &(kbuf->image->arch.exclude_ranges);
 	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
@@ -1342,11 +1335,15 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
 		return kexec_locate_mem_hole(kbuf);
 	}
 
+	buf_min = kbuf->buf_min;
+	buf_max = kbuf->buf_max;
 	/* Segments for kdump kernel should be within crashkernel region */
-	buf_min = (kbuf->buf_min < crashk_res.start ?
-		   crashk_res.start : kbuf->buf_min);
-	buf_max = (kbuf->buf_max > crashk_res.end ?
-		   crashk_res.end : kbuf->buf_max);
+	if (kbuf->image->type == KEXEC_TYPE_CRASH) {
+		buf_min = (buf_min < crashk_res.start ?
+			   crashk_res.start : buf_min);
+		buf_max = (buf_max > crashk_res.end ?
+			   crashk_res.end : buf_max);
+	}
 
 	if (buf_min > buf_max) {
 		pr_err("Invalid buffer min and/or max values\n");
@@ -1476,15 +1473,13 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 				  unsigned long buf_len)
 {
-	if (image->type == KEXEC_TYPE_CRASH) {
-		int ret;
+	int ret;
 
-		/* Get exclude memory ranges needed for setting up kdump segments */
-		ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
-		if (ret) {
-			pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
-			return ret;
-		}
+	/* Get exclude memory ranges needed for setting up kexec segments */
+	ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
+	if (ret) {
+		pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
+		return ret;
 	}
 
 	return kexec_image_probe_default(image, buf, buf_len);

