Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E481C373A40
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 14:08:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZwTM05GSz30HK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 22:08:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lN4ASaFp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lN4ASaFp; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZwSs0G7Yz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 22:07:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZwSk4q3hz9sWH;
 Wed,  5 May 2021 22:07:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620216455;
 bh=9R4AfTV1w8fqv17KSlZPWZ5dWHSDfna2fPHykadizmo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lN4ASaFpXY2unrq6dFjgr9r0cKIghL1d/g9v/jywjOeEpxVULnsbK37cC/3jol4H4
 kpvrMsa4pz+iNvRf3416h0cfMXZg1KVNmF8/Q38zR6bPYcRxJTfJJFlT7CNUALsXEp
 7SMf71rfZFrIcjWzS1YJW036H4ULbnmW0OYQ5dPG5g79RFxeLmBUMHWZx+cnUK5DpQ
 vr15A0fAGFKaCkX1PdzI1XiblrGkwBejYbxRiSytNyy6Zi322YnpxJWBZXKwyoxeUY
 TgVbakcxsOSOgnLhNKFKiryZq/NgoYtTBUvofbpiUCOEkJMWf8UGVKl04dZOiU9e3j
 L0FDKH+B0Zr2w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Andreas Schwab
 <schwab@linux-m68k.org>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELFv2 ABI for big-endian
 kernels
In-Reply-To: <20210503143841.GN6564@kitsune.suse.cz>
References: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
 <87eeeooxnu.fsf@igel.home> <20210503143841.GN6564@kitsune.suse.cz>
Date: Wed, 05 May 2021 22:07:29 +1000
Message-ID: <87tunh8jum.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Mon, May 03, 2021 at 01:37:57PM +0200, Andreas Schwab wrote:
>> Should this add a tag to the module vermagic?
>
> Would the modues link even if the vermagic was not changed?

Most modules will require some symbols from the kernel, and those will
be dot symbols, which won't resolve.

But there are a few small modules that don't rely on any kernel symbols,
which can load.

> I suppose something like this might do it.

It would, but I feel like we should be handling this at the ELF level.
ie. we don't allow loading modules with a different ELF machine type, so
neither should we allow loading a module with the wrong ELF ABI.

And you can build the kernel without MODVERSIONS, so relying on
MODVERSIONS still leaves a small exposure (same kernel version
with/without ELFv2).

I don't see an existing hook that would do what we want. There's
elf_check_arch(), but that also applies to userspace binaries, which is
not what we want.

Maybe something like below.

cheers


diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/m=
odule.h
index 857d9ff24295..d0e9368982d8 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -83,5 +83,28 @@ static inline int module_finalize_ftrace(struct module *=
mod, const Elf_Shdr *sec
 }
 #endif
=20
+#ifdef CONFIG_PPC64
+static inline bool elf_check_module_arch(Elf_Ehdr *hdr)
+{
+	unsigned long flags;
+
+	if (!elf_check_arch(hdr))
+		return false;
+
+	flags =3D hdr->e_flags & 0x3;
+
+#ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
+	if (flags =3D=3D 2)
+		return true;
+#else
+	if (flags < 2)
+		return true;
+#endif
+	return false;
+}
+
+#define elf_check_module_arch elf_check_module_arch
+#endif /* CONFIG_PPC64 */
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_MODULE_H */
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 9e09d11ffe5b..fdc042a84562 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,11 @@
  * must be implemented by each architecture.
  */
=20
+// Allow arch to optionally do additional checking of module ELF header
+#ifndef elf_check_module_arch
+#define elf_check_module_arch elf_check_arch
+#endif
+
 /* Adjust arch-specific sections.  Return 0 on success.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      Elf_Shdr *sechdrs,
diff --git a/kernel/module.c b/kernel/module.c
index b5dd92e35b02..c71889107226 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2941,7 +2941,7 @@ static int elf_validity_check(struct load_info *info)
=20
 	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) !=3D 0
 	    || info->hdr->e_type !=3D ET_REL
-	    || !elf_check_arch(info->hdr)
+	    || !elf_check_module_arch(info->hdr)
 	    || info->hdr->e_shentsize !=3D sizeof(Elf_Shdr))
 		return -ENOEXEC;
=20
