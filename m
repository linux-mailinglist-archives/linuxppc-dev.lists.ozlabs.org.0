Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08127207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 00:05:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458RWg3hbbzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458RVJ27p4zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 08:03:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4MLvagF028081
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 18:03:49 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sndwet7dw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 18:03:48 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Wed, 22 May 2019 23:03:48 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 23:03:46 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4MM3inC33423744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 22:03:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA690BE079;
 Wed, 22 May 2019 22:03:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3D59BE07A;
 Wed, 22 May 2019 22:03:42 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.80.216.227])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 May 2019 22:03:42 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix loading of kernel + initramfs with
 kexec_file_load()
Date: Wed, 22 May 2019 19:01:58 -0300
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052222-8235-0000-0000-00000E9CE3BB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011145; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01207156; UDB=6.00633942; IPR=6.00988131; 
 MB=3.00027009; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-22 22:03:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052222-8236-0000-0000-000045ADF716
Message-Id: <20190522220158.18479-1-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220152
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit b6664ba42f14 ("s390, kexec_file: drop arch_kexec_mem_walk()")
changed kexec_add_buffer() to skip searching for a memory location if
kexec_buf.mem is already set, and use the address that is there.

In powerpc code we reuse a kexec_buf variable for loading both the kernel
and the initramfs by resetting some of the fields between those uses, but
not mem. This causes kexec_add_buffer() to try to load the kernel at the
same address where initramfs will be loaded, which is naturally rejected:

  # kexec -s -l --initrd initramfs vmlinuz
  kexec_file_load failed: Invalid argument

Setting the mem field before every call to kexec_add_buffer() fixes this
regression.

Fixes: b6664ba42f14 ("s390, kexec_file: drop arch_kexec_mem_walk()")
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/kernel/kexec_elf_64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
index ba4f18a43ee8..52a29fc73730 100644
--- a/arch/powerpc/kernel/kexec_elf_64.c
+++ b/arch/powerpc/kernel/kexec_elf_64.c
@@ -547,6 +547,7 @@ static int elf_exec_load(struct kimage *image, struct elfhdr *ehdr,
 		kbuf.memsz = phdr->p_memsz;
 		kbuf.buf_align = phdr->p_align;
 		kbuf.buf_min = phdr->p_paddr + base;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 		ret = kexec_add_buffer(&kbuf);
 		if (ret)
 			goto out;
@@ -581,7 +582,8 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size };
 	struct kexec_buf pbuf = { .image = image, .buf_min = 0,
-				  .buf_max = ppc64_rma_size, .top_down = true };
+				  .buf_max = ppc64_rma_size, .top_down = true,
+				  .mem = KEXEC_BUF_MEM_UNKNOWN };
 
 	ret = build_elf_exec_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
@@ -606,6 +608,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		kbuf.bufsz = kbuf.memsz = initrd_len;
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.top_down = false;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 		ret = kexec_add_buffer(&kbuf);
 		if (ret)
 			goto out;
@@ -638,6 +641,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.bufsz = kbuf.memsz = fdt_size;
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out;

