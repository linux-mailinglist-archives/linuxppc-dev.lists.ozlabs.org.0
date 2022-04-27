Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F7511452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 11:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpDDf4B25z3bcn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 19:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdD90UxR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PdD90UxR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpDCv6QCxz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 19:36:43 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R9VF8F005799;
 Wed, 27 Apr 2022 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=lQUmU302y0ZV4pqPfG/ZoKUT7BO6PhToVDMpojVcdFg=;
 b=PdD90UxRQlKrfEvELJlaiSO1dgLRUpdopSj+jpb/3j9vQ4+uHBIZ9fohqv5eGEMPuT0q
 3ckpGO8YCDwpj1/+Di2g2aEZ4dZG7svSnKoRkexD8cfPQj78jKpDf9AU/72TB1gKp1tc
 bYq5Lx+8m713Xqsr3cX28oilH96374ZUJLBQV1WT/OxSL+GYPf0XKPAt4FrC1X/X0Btp
 BwdnkgrbVbfmwZo2uFNDRNSjDB5E6tTqVmmu/xPlcZWYCNHp7klSBVty2HwvuepXQdKD
 uxBWaPISfxec6Pc5g6mey97z3TbotO4iW8sb17ejKMrqTmkgfegHQMVm/0PTqybX7dGa Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fprrpju7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:34 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23R8cLJD003924;
 Wed, 27 Apr 2022 09:36:34 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fprrpju64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:33 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23R9T8io002453;
 Wed, 27 Apr 2022 09:36:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3fm8qhmg3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23R9aS1T7864612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 09:36:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 271F74C040;
 Wed, 27 Apr 2022 09:36:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8070E4C044;
 Wed, 27 Apr 2022 09:36:25 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.116.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Apr 2022 09:36:25 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Date: Wed, 27 Apr 2022 15:01:22 +0530
Message-Id: <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KHAVq4zAWf7_bn3DJWOnC-5y1JfmZRR9
X-Proofpoint-ORIG-GUID: qElIFTVJgarvhMuQW1C1y3As75N8hl1f
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_03,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=944
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270063
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel builds on powerpc are failing with the below error [1]:
      CC      kernel/kexec_file.o
    Cannot find symbol for section 9: .text.unlikely.
    kernel/kexec_file.o: failed

Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [2], binutils started dropping section symbols that it thought
were unused.  This isn't an issue in general, but with kexec_file.c, gcc
is placing kexec_arch_apply_relocations[_add] into a separate
.text.unlikely section and the section symbol ".text.unlikely" is being
dropped. Due to this, recordmcount is unable to find a non-weak symbol
in .text.unlikely to generate a relocation record against.

Handle this by falling back to a weak symbol, similar to what objtool
does in commit 44f6a7c0755d8d ("objtool: Fix seg fault with Clang
non-section symbols"). Note that this approach can result in duplicate
addresses in the final vmlinux mcount location table. A previous commit
updated ftrace to skip such duplicate entries.

After this commit, relocation records for __mcount_loc for kexec_file.o
now include two entries with the weak functions
arch_kexec_apply_relocations() and arch_kexec_apply_relocation_add() as
the relocation bases:

  ...
  0000000000000080 R_PPC64_ADDR64    .text+0x0000000000001d34
  0000000000000088 R_PPC64_ADDR64    .text+0x0000000000001fec
  0000000000000090 R_PPC64_ADDR64    arch_kexec_apply_relocations_add+0x000000000000000c
  0000000000000098 R_PPC64_ADDR64    arch_kexec_apply_relocations+0x000000000000000c

Powerpc does not override these functions today, so these get converted
to correct offsets in the mcount location table in vmlinux.

If one or both of these weak functions are overridden in future, in the
final vmlinux mcount table, references to these will change over to the
non-weak variant which has its own mcount location entry. As such, there
will now be two entries for these functions, both pointing to the same
non-weak location. We don't need the non-weak locations since they will
never be executed. Ftrace skips the duplicate entries due to a previous
commit.

[1] https://github.com/linuxppc/issues/issues/388
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 scripts/recordmcount.h | 86 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index 1e9baa5c4fc6ef..0c79a2d2b47493 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -25,6 +25,7 @@
 #undef sift_rel_mcount
 #undef nop_mcount
 #undef find_secsym_ndx
+#undef find_sym_ndx
 #undef __has_rel_mcount
 #undef has_rel_mcount
 #undef tot_relsize
@@ -60,6 +61,7 @@
 # define sift_rel_mcount	sift64_rel_mcount
 # define nop_mcount		nop_mcount_64
 # define find_secsym_ndx	find64_secsym_ndx
+# define find_sym_ndx		find64_sym_ndx
 # define __has_rel_mcount	__has64_rel_mcount
 # define has_rel_mcount		has64_rel_mcount
 # define tot_relsize		tot64_relsize
@@ -98,6 +100,7 @@
 # define sift_rel_mcount	sift32_rel_mcount
 # define nop_mcount		nop_mcount_32
 # define find_secsym_ndx	find32_secsym_ndx
+# define find_sym_ndx		find32_sym_ndx
 # define __has_rel_mcount	__has32_rel_mcount
 # define has_rel_mcount		has32_rel_mcount
 # define tot_relsize		tot32_relsize
@@ -392,6 +395,51 @@ static void get_sym_str_and_relp(Elf_Shdr const *const relhdr,
 	*relp = rel0;
 }
 
+/*
+ * Find a symbol in the given section containing the instruction offset passed
+ * in r_offset, to be used in generating the relocation record for the mcount
+ * location. This is used if there were no local/global symbols in the given
+ * section to be used as the base. Weak symbols are ok, and are expected to
+ * result in duplicate mcount locations which get dropped by ftrace.
+ */
+static int find_sym_ndx(unsigned const txtndx,
+			 char const *const txtname,
+			 uint_t *const recvalp,
+			 unsigned int *sym_index,
+			 Elf_Shdr const *const symhdr,
+			 Elf32_Word const *symtab,
+			 Elf32_Word const *symtab_shndx,
+			 unsigned const r_offset,
+			 Elf_Ehdr const *const ehdr)
+{
+	Elf_Sym const *const sym0 = (Elf_Sym const *)(_w(symhdr->sh_offset)
+		+ (void *)ehdr);
+	unsigned const nsym = _w(symhdr->sh_size) / _w(symhdr->sh_entsize);
+	Elf_Sym const *symp;
+	unsigned t;
+
+	for (symp = sym0, t = nsym; t; --t, ++symp) {
+		if (txtndx == get_symindex(symp, symtab, symtab_shndx)) {
+			/* function symbols on ARM have quirks, avoid them */
+			if (w2(ehdr->e_machine) == EM_ARM &&
+			    ELF_ST_TYPE(symp->st_info) == STT_FUNC)
+				continue;
+
+			if (r_offset >= _w(symp->st_value) &&
+			    r_offset < _w(symp->st_value) + _w(symp->st_size)) {
+				*recvalp = _w(symp->st_value);
+				*sym_index = symp - sym0;
+				return 0;
+			}
+		}
+	}
+
+	fprintf(stderr, "Cannot find symbol containing offset %u for section %u: %s.\n",
+		r_offset, txtndx, txtname);
+
+	return -1;
+}
+
 /*
  * Look at the relocations in order to find the calls to mcount.
  * Accumulate the section offsets that are found, and their relocation info,
@@ -402,9 +450,14 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 			       Elf_Rel **const mrelpp,
 			       Elf_Shdr const *const relhdr,
 			       Elf_Ehdr const *const ehdr,
-			       unsigned const recsym,
-			       uint_t const recval,
-			       unsigned const reltype)
+			       unsigned recsym,
+			       uint_t recval,
+			       unsigned const reltype,
+			       unsigned int no_secsym,
+			       char const *const txtname,
+			       Elf_Shdr const *const shdr0,
+			       Elf32_Word const *symtab,
+			       Elf32_Word const *symtab_shndx)
 {
 	uint_t *const mloc0 = mlocp;
 	Elf_Rel *mrelp = *mrelpp;
@@ -415,6 +468,7 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 	unsigned const nrel = _w(relhdr->sh_size) / rel_entsize;
 	unsigned mcountsym = 0;
 	unsigned t;
+	uint_t addend;
 
 	get_sym_str_and_relp(relhdr, ehdr, &sym0, &str0, &relp);
 
@@ -424,8 +478,13 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 
 		if (mcountsym && mcountsym == Elf_r_sym(relp) &&
 				!is_fake_mcount(relp)) {
-			uint_t const addend =
-				_w(_w(relp->r_offset) - recval + mcount_adjust);
+			if (no_secsym && find_sym_ndx(w(relhdr->sh_info),
+						      txtname, &recval, &recsym,
+						      &shdr0[w(relhdr->sh_link)],
+						      symtab, symtab_shndx,
+						      _w(relp->r_offset), ehdr))
+				return 0;
+			addend = _w(_w(relp->r_offset) - recval + mcount_adjust);
 			mrelp->r_offset = _w(offbase
 				+ ((void *)mlocp - (void *)mloc0));
 			Elf_r_info(mrelp, recsym, reltype);
@@ -544,8 +603,6 @@ static int find_secsym_ndx(unsigned const txtndx,
 			return 0;
 		}
 	}
-	fprintf(stderr, "Cannot find symbol for section %u: %s.\n",
-		txtndx, txtname);
 	return -1;
 }
 
@@ -660,22 +717,25 @@ static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
 			goto out; /* Nothing to be done; don't append! */
 		}
 		if (txtname && is_mcounted_section_name(txtname)) {
-			unsigned int recsym;
+			unsigned int recsym = 0, no_secsym = 0;
 			uint_t recval = 0;
 
 			symsec_sh_link = w(relhdr->sh_link);
-			result = find_secsym_ndx(w(relhdr->sh_info), txtname,
+			if (find_secsym_ndx(w(relhdr->sh_info), txtname,
 						&recval, &recsym,
 						&shdr0[symsec_sh_link],
 						symtab, symtab_shndx,
-						ehdr);
-			if (result)
-				goto out;
+						ehdr))
+				no_secsym = 1;
 
 			rel_entsize = _w(relhdr->sh_entsize);
 			mlocp = sift_rel_mcount(mlocp,
 				(void *)mlocp - (void *)mloc0, &mrelp,
-				relhdr, ehdr, recsym, recval, reltype);
+				relhdr, ehdr, recsym, recval, reltype,
+				no_secsym, txtname, shdr0, symtab,
+				symtab_shndx);
+			if (!mlocp)
+				goto out;
 		} else if (txtname && (warn_on_notrace_sect || make_nop)) {
 			/*
 			 * This section is ignored by ftrace, but still
-- 
2.35.1

