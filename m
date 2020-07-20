Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8541F2260E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:31:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9N0h04qqzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9MCF3cpDzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9MCD6pX4z9CY7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:55:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9MCD3xtxz9sSn; Mon, 20 Jul 2020 22:55:20 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B9MCB4FGMz9sSd
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Jul 2020 22:55:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KCV7X8137778; Mon, 20 Jul 2020 08:55:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5jyueaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:55:12 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06KCVBeh138245;
 Mon, 20 Jul 2020 08:55:11 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5jyue9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:55:11 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KCsruP030727;
 Mon, 20 Jul 2020 12:55:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn0025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 12:55:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KCt6W161866196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 12:55:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A940E4C04E;
 Mon, 20 Jul 2020 12:55:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AA734C046;
 Mon, 20 Jul 2020 12:55:03 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.85.112.199])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 12:55:03 +0000 (GMT)
Subject: [PATCH v4 12/12] ppc64/kexec_file: fix kexec load failure with lack
 of memory hole
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 20 Jul 2020 18:25:02 +0530
Message-ID: <159524969473.20855.3849168475361726663.stgit@hbathini.in.ibm.com>
In-Reply-To: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_07:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=2 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200084
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
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v3 -> v4:
* Unchanged. Added Reviewed-by tag from Thiago.

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* New patch to fix locating memory hole for kexec_file_load (kexec -s -l)
  when memory is reserved for crashkernel.


 arch/powerpc/kexec/file_load_64.c |   33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 47642d5..694f305 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1374,13 +1374,6 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
@@ -1388,11 +1381,15 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
@@ -1522,15 +1519,13 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
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

