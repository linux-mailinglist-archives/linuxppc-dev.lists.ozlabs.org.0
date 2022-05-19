Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601C52CB8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 07:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3dz95Dzzz3c1X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 15:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=El/8FD4s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3dyX5Qd3z2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 15:41:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=El/8FD4s; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3dyX2T4Jz4xD1;
 Thu, 19 May 2022 15:41:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652938900;
 bh=u4WYQ8CLjhh5TCtN+4GxOyinCwBGkUDiWv+9kOIQ2Aw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=El/8FD4sKhUNUJK/ztIhCR4s+G553J0gGwkMOD2jplBk9XzsGORDHXxOIJhHV37r2
 yfYv6RMpGwebQu+dtSp3my8M1rZWHHFPiIG4/LeXT9q3U2+uOvZxY+eIzu6wkBn+5x
 rRCl4wmAGx7LmeDlBMPJcSGzOnj0YqK1psC26Jj9iJJHwKH6zHCcUTGghPQZXQFysP
 mZ7yuKp6REsmelQ2STkkfe3tnpTYUSrJ2U+3CGaHtZhTfzJDDUqpzUYu67sxRe66xD
 Z9gHAWSSgjrHWS4+4hAXl7GyMJhoODY3j+txgVTjiMQSgb9s9k7gk8t5QqVGKUU5LS
 N9D4BUJpat9Xw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Eric Biederman
 <ebiederm@xmission.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
In-Reply-To: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
Date: Thu, 19 May 2022 15:41:39 +1000
Message-ID: <874k1mnkoc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> symbols") [1], binutils (v2.36+) started dropping section symbols that
> it thought were unused.  This isn't an issue in general, but with
> kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
> separate .text.unlikely section and the section symbol ".text.unlikely"
> is being dropped. Due to this, recordmcount is unable to find a non-weak
> symbol in .text.unlikely to generate a relocation record against.
>
> Address this by dropping the weak attribute from these functions:
> - arch_kexec_apply_relocations() is not overridden by any architecture
>   today, so just drop the weak attribute.
> - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
>   Retain the function prototype for those and move the weak
>   implementation into the header as a static inline for other
>   architectures.
>
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  include/linux/kexec.h | 28 ++++++++++++++++++++++++----
>  kernel/kexec_file.c   | 19 +------------------
>  2 files changed, 25 insertions(+), 22 deletions(-)

I think it could be cleaner done with the #define foo foo style, see
patch below. It does have its downsides, but for a simple hook like this
I think it's not too bad.

cheers


(only build tested)

diff --git a/arch/s390/include/asm/kexec.h b/arch/s390/include/asm/kexec.h
index 7f3c9ac34bd8..e818b58ccc43 100644
--- a/arch/s390/include/asm/kexec.h
+++ b/arch/s390/include/asm/kexec.h
@@ -74,6 +74,8 @@ void *kexec_file_add_components(struct kimage *image,
 int arch_kexec_do_relocs(int r_type, void *loc, unsigned long val,
 			 unsigned long addr);
 
+#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
+
 #define ARCH_HAS_KIMAGE_ARCH
 
 struct kimage_arch {
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 11b7c06e2828..58e3939a350a 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -186,6 +186,8 @@ extern int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages,
 extern void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages);
 #define arch_kexec_pre_free_pages arch_kexec_pre_free_pages
 
+#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
+
 #endif
 
 typedef void crash_vmclear_fn(void);
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 8347fc158d2b..6f07acb59f29 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -108,6 +108,7 @@ int __weak arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
 }
 #endif
 
+#ifndef arch_kexec_apply_relocations_add
 /*
  * arch_kexec_apply_relocations_add - apply relocations of type RELA
  * @pi:		Purgatory to be relocated.
@@ -117,14 +118,16 @@ int __weak arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
  *
  * Return: 0 on success, negative errno on error.
  */
-int __weak
+int
 arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
 				 const Elf_Shdr *relsec, const Elf_Shdr *symtab)
 {
 	pr_err("RELA relocation unsupported.\n");
 	return -ENOEXEC;
 }
+#endif
 
+#ifndef arch_kexec_apply_relocations
 /*
  * arch_kexec_apply_relocations - apply relocations of type REL
  * @pi:		Purgatory to be relocated.
@@ -134,13 +137,14 @@ arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
  *
  * Return: 0 on success, negative errno on error.
  */
-int __weak
+int
 arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
 			     const Elf_Shdr *relsec, const Elf_Shdr *symtab)
 {
 	pr_err("REL relocation unsupported.\n");
 	return -ENOEXEC;
 }
+#endif
 
 /*
  * Free up memory used by kernel, initrd, and command line. This is temporary

