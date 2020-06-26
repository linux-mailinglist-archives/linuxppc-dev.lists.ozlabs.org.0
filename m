Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D6220B915
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 21:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmdr61wMzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 05:09:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmXp1VKlzDqwC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:04:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49tmXp0W0Hz8t5m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:04:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49tmXn6YMDz9sQt; Sat, 27 Jun 2020 05:04:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49tmXn3sBrz9sPF
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 05:04:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QJ38ok104341; Fri, 26 Jun 2020 15:04:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31wn6x2ae6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:04:53 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QJ3aB3106655;
 Fri, 26 Jun 2020 15:04:52 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31wn6x2ad3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:04:52 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QIxQT8020289;
 Fri, 26 Jun 2020 19:04:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 31uusg1m7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 19:04:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05QJ4lTM8323454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 19:04:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25AC55204E;
 Fri, 26 Jun 2020 19:04:47 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.159])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2ADCC52057;
 Fri, 26 Jun 2020 19:04:43 +0000 (GMT)
Subject: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 27 Jun 2020 00:34:43 +0530
Message-ID: <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
In-Reply-To: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_10:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 cotscore=-2147483648 malwarescore=0 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260134
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some archs can have special memory regions, within the given memory
range, which can't be used for the buffer in a kexec segment. As
kexec_add_buffer() function is being called from generic code as well,
add weak arch_kexec_add_buffer definition for archs to override & take
care of special regions before trying to locate a memory hole.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 include/linux/kexec.h |    5 +++++
 kernel/kexec_file.c   |   37 +++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 1776eb2..1237682 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -195,6 +195,11 @@ int __weak arch_kexec_apply_relocations(struct purgatory_info *pi,
 					const Elf_Shdr *relsec,
 					const Elf_Shdr *symtab);
 
+extern int arch_kexec_add_buffer(struct kexec_buf *kbuf);
+
+/* arch_kexec_add_buffer calls this when it is ready */
+extern int __kexec_add_buffer(struct kexec_buf *kbuf);
+
 extern int kexec_add_buffer(struct kexec_buf *kbuf);
 int kexec_locate_mem_hole(struct kexec_buf *kbuf);
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index bb05fd5..a0b4f7f 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -669,10 +669,6 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
  */
 int kexec_add_buffer(struct kexec_buf *kbuf)
 {
-
-	struct kexec_segment *ksegment;
-	int ret;
-
 	/* Currently adding segment this way is allowed only in file mode */
 	if (!kbuf->image->file_mode)
 		return -EINVAL;
@@ -696,6 +692,25 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
 	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
 
+	return arch_kexec_add_buffer(kbuf);
+}
+
+/**
+ * __kexec_add_buffer - arch_kexec_add_buffer would call this function after
+ *                      updating kbuf, to place a buffer in a kexec segment.
+ * @kbuf:               Buffer contents and memory parameters.
+ *
+ * This function assumes that kexec_mutex is held.
+ * On successful return, @kbuf->mem will have the physical address of
+ * the buffer in memory.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int __kexec_add_buffer(struct kexec_buf *kbuf)
+{
+	struct kexec_segment *ksegment;
+	int ret;
+
 	/* Walk the RAM ranges and allocate a suitable range for the buffer */
 	ret = kexec_locate_mem_hole(kbuf);
 	if (ret)
@@ -711,6 +726,20 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 	return 0;
 }
 
+/**
+ * arch_kexec_add_buffer - Some archs have memory regions within the given
+ *                         range that can't be used to place a kexec segment.
+ *                         Such archs can override this function to take care
+ *                         of them before trying to locate the memory hole.
+ * @kbuf:                  Buffer contents and memory parameters.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int __weak arch_kexec_add_buffer(struct kexec_buf *kbuf)
+{
+	return __kexec_add_buffer(kbuf);
+}
+
 /* Calculate and store the digest of segments */
 static int kexec_calculate_store_digests(struct kimage *image)
 {

