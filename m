Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447075A9E03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSlx5CQYz2ymS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fb.com (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com; envelope-from=prvs=02432c7d55=songliubraving@fb.com; receiver=<UNKNOWN>)
X-Greylist: delayed 936 seconds by postgrey-1.36 at boromir; Fri, 02 Sep 2022 03:31:48 AEST
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSlS1qqkz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:31:41 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2819eMxZ032650
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 1 Sep 2022 10:16:01 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3ja8n3h6gk-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:16:01 -0700
Received: from twshared5413.23.frc3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 10:15:58 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 447B8C567595; Thu,  1 Sep 2022 10:12:56 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <live-patching@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6] livepatch: Clear relocation targets on a module removal
Date: Thu, 1 Sep 2022 10:12:52 -0700
Message-ID: <20220901171252.2148348-1-song@kernel.org>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: LkOgpwGg9NrN56_aLrnVo0hRFdXxV7tv
X-Proofpoint-ORIG-GUID: LkOgpwGg9NrN56_aLrnVo0hRFdXxV7tv
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
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
Cc: pmladek@suse.com, jikos@kernel.org, x86@kernel.org, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Miroslav Benes <mbenes@suse.cz>

Josh reported a bug:

  When the object to be patched is a module, and that module is
  rmmod'ed and reloaded, it fails to load with:

  module: x86/modules: Skipping invalid relocation target, existing value i=
s nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
  livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' =
(-8)
  livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to l=
oad module 'nfsd'

  The livepatch module has a relocation which references a symbol
  in the _previous_ loading of nfsd. When apply_relocate_add()
  tries to replace the old relocation with a new one, it sees that
  the previous one is nonzero and it errors out.

  On ppc64le, we have a similar issue:

  module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_sho=
w+0x60/0x548 [livepatch_nfsd]
  livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' =
(-8)
  livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to l=
oad module 'nfsd'

He also proposed three different solutions. We could remove the error
check in apply_relocate_add() introduced by commit eda9cec4c9a1
("x86/module: Detect and skip invalid relocations"). However the check
is useful for detecting corrupted modules.

We could also deny the patched modules to be removed. If it proved to be
a major drawback for users, we could still implement a different
approach. The solution would also complicate the existing code a lot.

We thus decided to reverse the relocation patching (clear all relocation
targets on x86_64). The solution is not
universal and is too much arch-specific, but it may prove to be simpler
in the end.

Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Song Liu <song@kernel.org>

---

NOTE: powerpc32 code is only compile tested.

Changes v5 =3D v6:
1. Fix powerpc64.
2. Fix compile for powerpc32.

Changes v4 =3D v5:
1. Fix compile with powerpc.

Changes v3 =3D v4:
1. Reuse __apply_relocate_add to make it more reliable in long term.
   (Josh Poimboeuf)
2. Add back ppc64 logic from v2, with changes to match current code.
   (Josh Poimboeuf)

Changes v2 =3D> v3:
1. Rewrite x86 changes to match current code style.
2. Remove powerpc changes as there is no test coverage in v3.
3. Only keep 1/3 of v2.

v2: https://lore.kernel.org/all/20190905124514.8944-1-mbenes@suse.cz/T/#u
---
 arch/powerpc/kernel/module_32.c |  10 ++++
 arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
 arch/s390/kernel/module.c       |   8 +++
 arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
 include/linux/moduleloader.h    |   7 +++
 kernel/livepatch/core.c         |  41 ++++++++++++-
 6 files changed, 189 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_3=
2.c
index ea6536171778..e3c312770453 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -285,6 +285,16 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	return 0;
 }
=20
+#ifdef CONFIG_LIVEPATCH
+void clear_relocate_add(Elf32_Shdr *sechdrs,
+		   const char *strtab,
+		   unsigned int symindex,
+		   unsigned int relsec,
+		   struct module *me)
+{
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 notrace int module_trampoline_target(struct module *mod, unsigned long add=
r,
 				     unsigned long *target)
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_6=
4.c
index 7e45dc98df8a..514951f97391 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -739,6 +739,55 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	return 0;
 }
=20
+#ifdef CONFIG_LIVEPATCH
+void clear_relocate_add(Elf64_Shdr *sechdrs,
+		       const char *strtab,
+		       unsigned int symindex,
+		       unsigned int relsec,
+		       struct module *me)
+{
+	unsigned int i;
+	Elf64_Rela *rela =3D (void *)sechdrs[relsec].sh_addr;
+	Elf64_Sym *sym;
+	unsigned long *location;
+	const char *symname;
+	u32 *instruction;
+
+	pr_debug("Clearing ADD relocate section %u to %u\n", relsec,
+		 sechdrs[relsec].sh_info);
+
+	for (i =3D 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
+		location =3D (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rela[i].r_offset;
+		sym =3D (Elf64_Sym *)sechdrs[symindex].sh_addr
+			+ ELF64_R_SYM(rela[i].r_info);
+		symname =3D me->core_kallsyms.strtab
+			+ sym->st_name;
+
+		if (ELF64_R_TYPE(rela[i].r_info) !=3D R_PPC_REL24)
+			continue;
+		/*
+		 * reverse the operations in apply_relocate_add() for case
+		 * R_PPC_REL24.
+		 */
+		if (sym->st_shndx !=3D SHN_UNDEF &&
+		    sym->st_shndx !=3D SHN_LIVEPATCH)
+			continue;
+
+		instruction =3D (u32 *)location;
+		if (is_mprofile_ftrace_call(symname))
+			continue;
+
+		if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
+			continue;
+
+		instruction +=3D 1;
+		patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
+	}
+
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 int module_trampoline_target(struct module *mod, unsigned long addr,
 			     unsigned long *target)
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index 2d159b32885b..cc6784fbc1ac 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -500,6 +500,14 @@ static int module_alloc_ftrace_hotpatch_trampolines(st=
ruct module *me,
 }
 #endif /* CONFIG_FUNCTION_TRACER */
=20
+#ifdef CONFIG_LIVEPATCH
+void clear_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
+			unsigned int symindex, unsigned int relsec,
+			struct module *me)
+{
+}
+#endif
+
 int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index b1abf663417c..f9632afbb84c 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -128,18 +128,20 @@ int apply_relocate(Elf32_Shdr *sechdrs,
 	return 0;
 }
 #else /*X86_64*/
-static int __apply_relocate_add(Elf64_Shdr *sechdrs,
+static int __apply_clear_relocate_add(Elf64_Shdr *sechdrs,
 		   const char *strtab,
 		   unsigned int symindex,
 		   unsigned int relsec,
 		   struct module *me,
-		   void *(*write)(void *dest, const void *src, size_t len))
+		   void *(*write)(void *dest, const void *src, size_t len),
+		   bool clear)
 {
 	unsigned int i;
 	Elf64_Rela *rel =3D (void *)sechdrs[relsec].sh_addr;
 	Elf64_Sym *sym;
 	void *loc;
 	u64 val;
+	u64 zero =3D 0ULL;
=20
 	DEBUGP("Applying relocate section %u to %u\n",
 	       relsec, sechdrs[relsec].sh_info);
@@ -163,40 +165,60 @@ static int __apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_X86_64_NONE:
 			break;
 		case R_X86_64_64:
-			if (*(u64 *)loc !=3D 0)
-				goto invalid_relocation;
-			write(loc, &val, 8);
+			if (!clear) {
+				if (*(u64 *)loc !=3D 0)
+					goto invalid_relocation;
+				write(loc, &val, 8);
+			} else {
+				write(loc, &zero, 8);
+			}
 			break;
 		case R_X86_64_32:
-			if (*(u32 *)loc !=3D 0)
-				goto invalid_relocation;
-			write(loc, &val, 4);
-			if (val !=3D *(u32 *)loc)
-				goto overflow;
+			if (!clear) {
+				if (*(u32 *)loc !=3D 0)
+					goto invalid_relocation;
+				write(loc, &val, 4);
+				if (val !=3D *(u32 *)loc)
+					goto overflow;
+			} else {
+				write(loc, &zero, 4);
+			}
 			break;
 		case R_X86_64_32S:
-			if (*(s32 *)loc !=3D 0)
-				goto invalid_relocation;
-			write(loc, &val, 4);
-			if ((s64)val !=3D *(s32 *)loc)
-				goto overflow;
+			if (!clear) {
+				if (*(s32 *)loc !=3D 0)
+					goto invalid_relocation;
+				write(loc, &val, 4);
+				if ((s64)val !=3D *(s32 *)loc)
+					goto overflow;
+			} else {
+				write(loc, &zero, 4);
+			}
 			break;
 		case R_X86_64_PC32:
 		case R_X86_64_PLT32:
-			if (*(u32 *)loc !=3D 0)
-				goto invalid_relocation;
-			val -=3D (u64)loc;
-			write(loc, &val, 4);
+			if (!clear) {
+				if (*(u32 *)loc !=3D 0)
+					goto invalid_relocation;
+				val -=3D (u64)loc;
+				write(loc, &val, 4);
 #if 0
-			if ((s64)val !=3D *(s32 *)loc)
-				goto overflow;
+				if ((s64)val !=3D *(s32 *)loc)
+					goto overflow;
 #endif
+			} else {
+				write(loc, &zero, 4);
+			}
 			break;
 		case R_X86_64_PC64:
-			if (*(u64 *)loc !=3D 0)
-				goto invalid_relocation;
-			val -=3D (u64)loc;
-			write(loc, &val, 8);
+			if (!clear) {
+				if (*(u64 *)loc !=3D 0)
+					goto invalid_relocation;
+				val -=3D (u64)loc;
+				write(loc, &val, 8);
+			} else {
+				write(loc, &zero, 8);
+			}
 			break;
 		default:
 			pr_err("%s: Unknown rela relocation: %llu\n",
@@ -234,8 +256,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		mutex_lock(&text_mutex);
 	}
=20
-	ret =3D __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
-				   write);
+	ret =3D __apply_clear_relocate_add(sechdrs, strtab, symindex, relsec, me,
+					 write, false /* clear */);
=20
 	if (!early) {
 		text_poke_sync();
@@ -245,6 +267,32 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	return ret;
 }
=20
+#ifdef CONFIG_LIVEPATCH
+
+void clear_relocate_add(Elf64_Shdr *sechdrs,
+			const char *strtab,
+			unsigned int symindex,
+			unsigned int relsec,
+			struct module *me)
+{
+	bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
+	void *(*write)(void *, const void *, size_t) =3D memcpy;
+
+	if (!early) {
+		write =3D text_poke;
+		mutex_lock(&text_mutex);
+	}
+
+	__apply_clear_relocate_add(sechdrs, strtab, symindex, relsec, me,
+				   write, true /* clear */);
+
+	if (!early) {
+		text_poke_sync();
+		mutex_unlock(&text_mutex);
+	}
+}
+#endif
+
 #endif
=20
 int module_finalize(const Elf_Ehdr *hdr,
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 9e09d11ffe5b..958e6da7f475 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -72,6 +72,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 		       unsigned int symindex,
 		       unsigned int relsec,
 		       struct module *mod);
+#ifdef CONFIG_LIVEPATCH
+void clear_relocate_add(Elf_Shdr *sechdrs,
+		   const char *strtab,
+		   unsigned int symindex,
+		   unsigned int relsec,
+		   struct module *me);
+#endif
 #else
 static inline int apply_relocate_add(Elf_Shdr *sechdrs,
 				     const char *strtab,
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index bc475e62279d..5c0d8a4eba13 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -316,6 +316,45 @@ int klp_apply_section_relocs(struct module *pmod, Elf_=
Shdr *sechdrs,
 	return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
 }
=20
+static void klp_clear_object_relocations(struct module *pmod,
+					struct klp_object *obj)
+{
+	int i, cnt;
+	const char *objname, *secname;
+	char sec_objname[MODULE_NAME_LEN];
+	Elf_Shdr *sec;
+
+	objname =3D klp_is_module(obj) ? obj->name : "vmlinux";
+
+	/* For each klp relocation section */
+	for (i =3D 1; i < pmod->klp_info->hdr.e_shnum; i++) {
+		sec =3D pmod->klp_info->sechdrs + i;
+		secname =3D pmod->klp_info->secstrings + sec->sh_name;
+		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
+			continue;
+
+		/*
+		 * Format: .klp.rela.sec_objname.section_name
+		 * See comment in klp_resolve_symbols() for an explanation
+		 * of the selected field width value.
+		 */
+		secname =3D pmod->klp_info->secstrings + sec->sh_name;
+		cnt =3D sscanf(secname, ".klp.rela.%55[^.]", sec_objname);
+		if (cnt !=3D 1) {
+			pr_err("section %s has an incorrectly formatted name\n",
+			       secname);
+			continue;
+		}
+
+		if (strcmp(objname, sec_objname))
+			continue;
+
+		clear_relocate_add(pmod->klp_info->sechdrs,
+				   pmod->core_kallsyms.strtab,
+				   pmod->klp_info->symndx, i, pmod);
+	}
+}
+
 /*
  * Sysfs Interface
  *
@@ -1154,7 +1193,7 @@ static void klp_cleanup_module_patches_limited(struct=
 module *mod,
 			klp_unpatch_object(obj);
=20
 			klp_post_unpatch_callback(obj);
-
+			klp_clear_object_relocations(patch->mod, obj);
 			klp_free_object_loaded(obj);
 			break;
 		}
--=20
2.30.2

