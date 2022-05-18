Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3552C203
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3LrD74YYz3cHw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 04:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M/+uNR8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M/+uNR8W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3LqX11w0z3c7k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 04:19:35 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IIHYLO019334;
 Wed, 18 May 2022 18:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=BIZAjSskEX4ZGsdDdyHF4V6S1IvnQosszACzcUTuvvw=;
 b=M/+uNR8WKwNu7M/JW2Pzi3TO/M0oRujQrYJ5g/izFNcOqG+O0AOT8aeX7buNbbyPlb8t
 S/YXv75ZZqS5xtiP8D4yUVyabftWddM39a+CnoJdh96n+fAMrUJ9w0mt+n/CPpVZBGQM
 6SwZ2cPsZXUQ7TmVBWqYzBmMyfRRLuO6jJeP9I7zr/frclNpGjmYYOWGw62BXgfAAdxr
 M+SiYLAQqsHwp6bD9IMex/flLT83efWBxOVK7RiZbdlBpkRU8V/fVj6EcoyGrt142Byp
 yhRkzoqn+yXNApSoGXXhyLBILuaYR61wmYuHEF3HwIHmTfaVCKP9spNGh9JnD1YjKhuV kA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g55xxg151-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 18:19:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24II8XKa011871;
 Wed, 18 May 2022 18:19:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3g2429e34f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 18:19:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24IIJAao52232462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 18:19:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB51C4C046;
 Wed, 18 May 2022 18:19:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 118784C040;
 Wed, 18 May 2022 18:19:09 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.19.36])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 18:19:08 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Date: Wed, 18 May 2022 23:48:28 +0530
Message-Id: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uPzPQywlzQTS2FrupWy_fWcu16Q8beLq
X-Proofpoint-ORIG-GUID: uPzPQywlzQTS2FrupWy_fWcu16Q8beLq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=689 bulkscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180106
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
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [1], binutils (v2.36+) started dropping section symbols that
it thought were unused.  This isn't an issue in general, but with
kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
separate .text.unlikely section and the section symbol ".text.unlikely"
is being dropped. Due to this, recordmcount is unable to find a non-weak
symbol in .text.unlikely to generate a relocation record against.

Address this by dropping the weak attribute from these functions:
- arch_kexec_apply_relocations() is not overridden by any architecture
  today, so just drop the weak attribute.
- arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
  Retain the function prototype for those and move the weak
  implementation into the header as a static inline for other
  architectures.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 include/linux/kexec.h | 28 ++++++++++++++++++++++++----
 kernel/kexec_file.c   | 19 +------------------
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 58d1b58a971e34..e656f981f43a73 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -193,10 +193,6 @@ void *kexec_purgatory_get_symbol_addr(struct kimage *image, const char *name);
 int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 				  unsigned long buf_len);
 void *arch_kexec_kernel_image_load(struct kimage *image);
-int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
-				     Elf_Shdr *section,
-				     const Elf_Shdr *relsec,
-				     const Elf_Shdr *symtab);
 int arch_kexec_apply_relocations(struct purgatory_info *pi,
 				 Elf_Shdr *section,
 				 const Elf_Shdr *relsec,
@@ -229,6 +225,30 @@ extern int crash_exclude_mem_range(struct crash_mem *mem,
 				   unsigned long long mend);
 extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
 				       void **addr, unsigned long *sz);
+
+#if defined(CONFIG_X86_64) || defined(CONFIG_S390)
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+				     Elf_Shdr *section,
+				     const Elf_Shdr *relsec,
+				     const Elf_Shdr *symtab);
+#else
+/*
+ * arch_kexec_apply_relocations_add - apply relocations of type RELA
+ * @pi:		Purgatory to be relocated.
+ * @section:	Section relocations applying to.
+ * @relsec:	Section containing RELAs.
+ * @symtab:	Corresponding symtab.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+static inline int
+arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
+				 const Elf_Shdr *relsec, const Elf_Shdr *symtab)
+{
+	pr_err("RELA relocation unsupported.\n");
+	return -ENOEXEC;
+}
+#endif /* CONFIG_X86_64 || CONFIG_S390 */
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_KEXEC_ELF
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 8347fc158d2b96..6bae253b4d315e 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -108,23 +108,6 @@ int __weak arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
 }
 #endif
 
-/*
- * arch_kexec_apply_relocations_add - apply relocations of type RELA
- * @pi:		Purgatory to be relocated.
- * @section:	Section relocations applying to.
- * @relsec:	Section containing RELAs.
- * @symtab:	Corresponding symtab.
- *
- * Return: 0 on success, negative errno on error.
- */
-int __weak
-arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
-				 const Elf_Shdr *relsec, const Elf_Shdr *symtab)
-{
-	pr_err("RELA relocation unsupported.\n");
-	return -ENOEXEC;
-}
-
 /*
  * arch_kexec_apply_relocations - apply relocations of type REL
  * @pi:		Purgatory to be relocated.
@@ -134,7 +117,7 @@ arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
  *
  * Return: 0 on success, negative errno on error.
  */
-int __weak
+int
 arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
 			     const Elf_Shdr *relsec, const Elf_Shdr *symtab)
 {

base-commit: ef1302160bfb19f804451d0e919266703501c875
-- 
2.36.1

