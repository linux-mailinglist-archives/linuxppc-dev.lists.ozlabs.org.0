Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7448D601F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 13:00:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Zn0AgiIW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrKs670J4z3cXF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 21:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Zn0AgiIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrKrK57K3z3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 20:59:28 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3527640E0177;
	Fri, 31 May 2024 10:59:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W-c3zNk7YqU9; Fri, 31 May 2024 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1717153149; bh=7FLex5LhVIj9BiTaijdudRX6o1hrMt70/hkVTmdb8Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zn0AgiIWRkxoO/RUtUYVbqMX7ooGQBkzOIgN59QQPz8PMAggO9PVYtwvkCS7d3W0o
	 vpVovhSccTNRqfYrsmvQypdOX6U5pfXGJ5edx3SCiKcS+UakdwTMA4Pmgu/dd8jirn
	 CPSc3oLW8LH6uVtemr7drBpAigIjcP3fXRfk61ViOXLzizYfSCNz865ZDIfe4bTe2J
	 roQV1ljaZoduJKpE5Zx4VSZxDzmE/Ggso5dmNVqWhFgZXuwdv9dQx+DAcUpb9/HFL/
	 cGxNvTSCit6wvyVErJy49ul5XWDYiWxHstSl/aqghIFpdt8cXQXP2JiJariVPKaO2b
	 gM3TTkpQEQ2v9RCXgVJv3uF1CjoeeTYNo5dMhPrFJoBPmCKg36tVx1OSwB8egKMbEM
	 F5D2mF2SrpUQPwWBS0B+k0x61PCu3xvIpdbqq1w3ECKQ01UPOeLMeea7qH0qPIWa9g
	 8cEySG/kfFIzBKIAlYTKtN8IjWTGSu3639u9q/g1dnL28UO/i8cfkWJVeAHPBdFcg9
	 OHUKpenr7RcLnkcLTeklELOXJlnvRJXxS3jFkBkwB506nQZbILPQeoxrFBUDG3PGpf
	 SGV8rCBw+pXrow8f0t+agnSgM3W56MOjlxx02fuO4CKRlJevOeEKk6zgtgTRNIngpg
	 vu+o+UC61KpaYYv+GvSw+Rts=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C1B8A40E01E8;
	Fri, 31 May 2024 10:58:48 +0000 (UTC)
Date: Fri, 31 May 2024 12:58:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240531105843.GBZlmtY7j7p8LJfQOh@fat_crate.local>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
 <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
 <20240523144543.GDZk9WlwKpCKx8I3RE@fat_crate.local>
 <664e101b-3689-4876-825b-a5aa12b7978f@amd.com>
 <20240526090554.GAZlL7cpva88mMUbCK@fat_crate.local>
 <b370276c-cbe7-4583-a906-dd0ef9f5afad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b370276c-cbe7-4583-a906-dd0ef9f5afad@amd.com>
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ok,

I went and worked in tglx's comments. This is what this should look
like.

Only build-tested.

---
From cf23110f5cc24b6072ba7a26f31cff3ed486e6b3 Mon Sep 17 00:00:00 2001
From: Vignesh Balasubramanian <vigbalas@amd.com>
Date: Tue, 7 May 2024 15:23:31 +0530
Subject: [PATCH] x86/elf: Add a new .note section containing xfeatures buffer
 layout info to x86 core files

Add a new .note section containing type, size, offset and flags of every
xfeature that is present.

This information will be used by debuggers to understand the XSAVE
layout of the machine where the core file has been dumped, and to read
XSAVE registers, especially during cross-platform debugging.

The XSAVE layouts of modern AMD and Intel CPUs differ, especially since
Memory Protection Keys and the AVX-512 features have been inculcated into
the AMD CPUs.

Since AMD never adopted (and hence never left room in the XSAVE
layout for) the Intel MPX feature. Tools like GDB had assumed a fixed
XSAVE layout matching that of Intel (based on the XCR0 mask).

Hence, core dumps from AMD CPUs didn't match the known size for the
XCR0 mask. This resulted in GDB and other tools not being able to access
the values of the AVX-512 and PKRU registers on AMD CPUs.

To solve this, an interim solution has been accepted into GDB, and is
already a part of GDB 14, see
https://sourceware.org/pipermail/gdb-patches/2023-March/198081.html.

But it depends on heuristics based on the total XSAVE register set size
and the XCR0 mask to infer the layouts of the various register blocks
for core dumps, and hence, is not a foolproof mechanism to determine the
layout of the XSAVE area.

Therefore, add a new core dump note in order to allow GDB/LLDB and other
relevant tools to determine the layout of the XSAVE area of the machine
where the corefile was dumped.

The new core dump note (which is being proposed as a per-process .note
section), NT_X86_XSAVE_LAYOUT (0x205) contains an array of structures.

Each structure describes an individual extended feature containing
offset, size and flags in this format:

struct xfeat_component {
       u32 type;
       u32 size;
       u32 offset;
       u32 flags;
};

and in an independent manner, allowing for future extensions without
depending on hw arch specifics like CPUID etc.

  [ bp: Work in tglx' comments from
  https://lore.kernel.org/r/87wmo4o3r4.ffs@tglx, massage. ]

Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/Kconfig             |  1 +
 arch/x86/include/asm/elf.h   |  9 ++++
 arch/x86/kernel/fpu/xstate.c | 84 ++++++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c              |  4 +-
 include/uapi/linux/elf.h     |  1 +
 5 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e30ea4129d2c..46e44b087c94 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -107,6 +107,7 @@ config X86
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HAVE_EXTRA_ELF_NOTES
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 1fb83d47711f..cad37090bbd3 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -13,6 +13,15 @@
 #include <asm/auxvec.h>
 #include <asm/fsgsbase.h>
 
+struct xfeat_component {
+	u32 type;
+	u32 size;
+	u32 offset;
+	u32 flags;
+} __packed;
+
+_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");
+
 typedef unsigned long elf_greg_t;
 
 #define ELF_NGREG (sizeof(struct user_regs_struct) / sizeof(elf_greg_t))
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index c5a026fee5e0..4c26f119c0d6 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/proc_fs.h>
 #include <linux/vmalloc.h>
+#include <linux/coredump.h>
 
 #include <asm/fpu/api.h>
 #include <asm/fpu/regset.h>
@@ -1838,3 +1839,86 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
 	return 0;
 }
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */
+
+#ifdef CONFIG_COREDUMP
+static const char owner_name[] = "LINUX";
+
+/*
+ * Dump type, size, offset and flag values for every xfeature that is present.
+ */
+static int dump_xsave_layout_desc(struct coredump_params *cprm)
+{
+	int num_records = 0;
+	int i;
+
+	for_each_extended_xfeature(i, fpu_kernel_cfg.max_features) {
+		struct xfeat_component xc = {
+			.type   = i,
+			.size   = xstate_sizes[i],
+			.offset = xstate_offsets[i],
+			/* reserved for future use */
+			.flags  = 0,
+		};
+
+		if (!dump_emit(cprm, &xc, sizeof(xc)))
+			return 0;
+
+		num_records++;
+	}
+	return num_records;
+}
+
+static int get_xsave_desc_size(void)
+{
+	int cnt = 0;
+	int i;
+
+	for_each_extended_xfeature(i, fpu_kernel_cfg.max_features)
+		cnt++;
+
+	return cnt * (sizeof(struct xfeat_component));
+}
+
+int elf_coredump_extra_notes_write(struct coredump_params *cprm)
+{
+	int num_records = 0;
+	struct elf_note en;
+
+	if (!fpu_kernel_cfg.max_features)
+		return 0;
+
+	en.n_namesz = sizeof(owner_name);
+	en.n_descsz = get_xsave_desc_size();
+	en.n_type = NT_X86_XSAVE_LAYOUT;
+
+	if (!dump_emit(cprm, &en, sizeof(en)))
+		return 1;
+	if (!dump_emit(cprm, owner_name, en.n_namesz))
+		return 1;
+	if (!dump_align(cprm, 4))
+		return 1;
+
+	num_records = dump_xsave_layout_desc(cprm);
+	if (!num_records)
+		return 1;
+
+	/* Total size should be equal to the number of records */
+	if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz)
+		return 1;
+
+	return 0;
+}
+
+int elf_coredump_extra_notes_size(void)
+{
+	int size;
+
+	/* .note header */
+	size  = sizeof(struct elf_note);
+	/* name + align */
+	size += roundup(sizeof(owner_name), 4);
+	size += get_xsave_desc_size();
+
+	return size;
+}
+#endif
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43897b03ce9..3d15c7369b29 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2006,7 +2006,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	{
 		size_t sz = info.size;
 
-		/* For cell spufs */
+		/* For cell spufs and x86 xstate */
 		sz += elf_coredump_extra_notes_size();
 
 		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
@@ -2070,7 +2070,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 	if (!write_note_info(&info, cprm))
 		goto end_coredump;
 
-	/* For cell spufs */
+	/* For cell spufs and x86 xstate */
 	if (elf_coredump_extra_notes_write(cprm))
 		goto end_coredump;
 
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b54b313bcf07..e30a9b47dc87 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -411,6 +411,7 @@ typedef struct elf64_shdr {
 #define NT_X86_XSTATE	0x202		/* x86 extended state using xsave */
 /* Old binutils treats 0x203 as a CET state */
 #define NT_X86_SHSTK	0x204		/* x86 SHSTK state */
+#define NT_X86_XSAVE_LAYOUT	0x205	/* XSAVE layout description */
 #define NT_S390_HIGH_GPRS	0x300	/* s390 upper register halves */
 #define NT_S390_TIMER	0x301		/* s390 timer register */
 #define NT_S390_TODCMP	0x302		/* s390 TOD clock comparator register */
-- 
2.43.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
