Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9B22E268
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:59:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFDLB24ClzF12M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCwM1c8FzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCwM0BNZz8vG4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:40:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCwL6KCqz9sRR; Mon, 27 Jul 2020 05:40:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFCwL2ZWBz9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:40:50 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJWur7016931; Sun, 26 Jul 2020 15:40:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gg1sfwqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:40:38 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJYAqh018463;
 Sun, 26 Jul 2020 15:40:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gg1sfwpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:40:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJZq39028242;
 Sun, 26 Jul 2020 19:40:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4heut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:40:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06QJd8RW60424566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:39:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 164B7A4053;
 Sun, 26 Jul 2020 19:40:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9787A4057;
 Sun, 26 Jul 2020 19:40:29 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 19:40:29 +0000 (GMT)
Subject: [RESEND PATCH v5 11/11] ppc64/kexec_file: fix kexec load failure with
 lack of memory hole
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:10:28 +0530
Message-ID: <159579242226.5790.13933486642004084417.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_12:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007260154
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
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
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

v4 -> v5:
* Unchanged.

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
index 296be7fc6440..7933b8990714 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1122,13 +1122,6 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
@@ -1136,11 +1129,15 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
@@ -1177,15 +1174,13 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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


