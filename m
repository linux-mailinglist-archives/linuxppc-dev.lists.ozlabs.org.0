Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324755E5C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXTSl0BSFz3dvf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:45:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BX9mMf3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BX9mMf3S;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXTR12x2Hz3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 01:43:57 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SFhCCs008015;
	Tue, 28 Jun 2022 15:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=eGOAAX/MzK0GnpKpJPxVK06tkihlGybYABV69N5IrRo=;
 b=BX9mMf3S8xiZdVhn7kyjiR0qa2eeBqd6G4jHS/42gavEWaJ63mNDO4tBGK6nwo/jbJpk
 rrF0YBng8C6b5xnjARlonP+gpdGmg3eSSi70ekke2iLgybOZt0D5t2uo8OMlYsxAUKxO
 YQvwcdvuXHMtwj0hlLstVGdA2/Razg8u3qO4HSZg8+ECEIgI2H2vfKoviM7Uspr1cCZc
 w8rZw7GJPsf01GElRpDRhbpcnJOudQXui1KnJPP/PjTfcvgsJkM6pY/GBJQgLCib+zh4
 BFCnPCNH7MPNN0g1eea1K+3xnyTjgo7VjKB21fsNV452c9oMGaoasUfPo2WLhQuKXVHy 9w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h04hh00gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 15:43:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SFaeuV020210;
	Tue, 28 Jun 2022 15:43:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3gwt08w3gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 15:43:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25SFhije23200104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 15:43:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 297995204E;
	Tue, 28 Jun 2022 15:43:44 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.54.243])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EA78752050;
	Tue, 28 Jun 2022 15:43:41 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Greg KH <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
Subject: [PATCH v4.9] kexec_file: drop weak attribute from arch_kexec_apply_relocations[_add]
Date: Tue, 28 Jun 2022 21:12:48 +0530
Message-Id: <20220628154249.204911-3-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nt3itEkV3yye9lE6mGJaPGpcuPKHR-R9
X-Proofpoint-GUID: Nt3itEkV3yye9lE6mGJaPGpcuPKHR-R9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=910 impostorscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280063
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 3e35142ef99fe6b4fe5d834ad43ee13cca10a2dc upstream.

Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [1], binutils (v2.36+) started dropping section symbols that
it thought were unused.  This isn't an issue in general, but with
kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
separate .text.unlikely section and the section symbol ".text.unlikely"
is being dropped. Due to this, recordmcount is unable to find a non-weak
symbol in .text.unlikely to generate a relocation record against.

Address this by dropping the weak attribute from these functions.
Instead, follow the existing pattern of having architectures #define the
name of the function they want to override in their headers.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

[akpm@linux-foundation.org: arch/s390/include/asm/kexec.h needs linux/module.h]
Link: https://lkml.kernel.org/r/20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 arch/x86/include/asm/kexec.h |  7 +++++++
 include/linux/kexec.h        | 26 ++++++++++++++++++++++----
 kernel/kexec_file.c          | 18 ------------------
 3 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 1624a7ffa95d89..3f1f58c1a9ce63 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -20,6 +20,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/string.h>
+#include <linux/module.h>
 
 #include <asm/page.h>
 #include <asm/ptrace.h>
@@ -206,6 +207,12 @@ struct kexec_entry64_regs {
 	uint64_t r15;
 	uint64_t rip;
 };
+
+#ifdef CONFIG_KEXEC_FILE
+int arch_kexec_apply_relocations_add(const Elf_Ehdr *ehdr,
+				     Elf_Shdr *sechdrs, unsigned int relsec);
+#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
+#endif
 #endif
 
 typedef void crash_vmclear_fn(void);
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 406c33dcae137a..565be657098b0b 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -148,6 +148,28 @@ struct kexec_file_ops {
 	kexec_verify_sig_t *verify_sig;
 #endif
 };
+
+#ifndef arch_kexec_apply_relocations_add
+/* Apply relocations of type RELA */
+static inline int
+arch_kexec_apply_relocations_add(const Elf_Ehdr *ehdr,
+				 Elf_Shdr *sechdrs, unsigned int relsec)
+{
+	pr_err("RELA relocation unsupported.\n");
+	return -ENOEXEC;
+}
+#endif
+
+#ifndef arch_kexec_apply_relocations
+/* Apply relocations of type REL */
+static inline int
+arch_kexec_apply_relocations(const Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
+			     unsigned int relsec)
+{
+	pr_err("REL relocation unsupported.\n");
+	return -ENOEXEC;
+}
+#endif
 #endif
 
 struct kimage {
@@ -320,10 +342,6 @@ void * __weak arch_kexec_kernel_image_load(struct kimage *image);
 int __weak arch_kimage_file_post_load_cleanup(struct kimage *image);
 int __weak arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
 					unsigned long buf_len);
-int __weak arch_kexec_apply_relocations_add(const Elf_Ehdr *ehdr,
-					Elf_Shdr *sechdrs, unsigned int relsec);
-int __weak arch_kexec_apply_relocations(const Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
-					unsigned int relsec);
 void arch_kexec_protect_crashkres(void);
 void arch_kexec_unprotect_crashkres(void);
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 2edaed6803ff79..eb775e699836ad 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -59,24 +59,6 @@ int __weak arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
 }
 #endif
 
-/* Apply relocations of type RELA */
-int __weak
-arch_kexec_apply_relocations_add(const Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
-				 unsigned int relsec)
-{
-	pr_err("RELA relocation unsupported.\n");
-	return -ENOEXEC;
-}
-
-/* Apply relocations of type REL */
-int __weak
-arch_kexec_apply_relocations(const Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
-			     unsigned int relsec)
-{
-	pr_err("REL relocation unsupported.\n");
-	return -ENOEXEC;
-}
-
 /*
  * Free up memory used by kernel, initrd, and command line. This is temporary
  * memory allocation which is not needed any more after these buffers have

base-commit: 4ffa4be5a14beeb008bd2b4fbc681222bfec90c7
-- 
2.36.1

