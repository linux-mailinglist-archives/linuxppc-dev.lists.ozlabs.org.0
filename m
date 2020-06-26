Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C969420B944
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 21:20:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmvC0bPkzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 05:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmZ710VNzDqvv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49tmZ66Z1nz8t4p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:06:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49tmZ642LPz9sSS; Sat, 27 Jun 2020 05:06:06 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 49tmZ56ZWzz9sQt
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 05:06:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QJ2nKo129968; Fri, 26 Jun 2020 15:05:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux04uykn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:59 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QJ2xGl130372;
 Fri, 26 Jun 2020 15:05:52 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux04uyht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:52 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QJ1lOg003755;
 Fri, 26 Jun 2020 19:05:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 31uusjk8gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 19:05:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05QJ5jkM61866012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 19:05:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 003DCA4053;
 Fri, 26 Jun 2020 19:05:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD371A4051;
 Fri, 26 Jun 2020 19:05:41 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.159])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 19:05:41 +0000 (GMT)
Subject: [PATCH 07/11] ppc64/kexec_file: add support to relocate purgatory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 27 Jun 2020 00:35:40 +0530
Message-ID: <159319834059.16351.11383518457733304716.stgit@hbathini.in.ibm.com>
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
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 cotscore=-2147483648
 bulkscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260134
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

Right now purgatory implementation is only minimal. But if purgatory
code is to be enhanced to copy memory to the backup region and verify
sha256 digest, relocations may have to be applied to the purgatory.
So, add support to relocate purgatory in kexec_file_load system call
by setting up TOC pointer and applying RELA relocations as needed.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kexec/file_load_64.c      |  338 ++++++++++++++++++++++++++++++++
 arch/powerpc/purgatory/trampoline_64.S |    8 +
 2 files changed, 346 insertions(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index d85cba4d..4430336 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -19,6 +19,7 @@
 #include <linux/libfdt.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
+#include <asm/types.h>
 #include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
@@ -626,6 +627,242 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 }
 
 /**
+ * get_toc_section - Look for ".toc" symbol and return the corresponding section
+ * @ehdr:            ELF header.
+ *
+ * Returns TOC section on success, NULL otherwise.
+ */
+static const Elf_Shdr *get_toc_section(const Elf_Ehdr *ehdr)
+{
+	const Elf_Shdr *sechdrs;
+	const char *secstrings;
+	int i;
+
+	if (!ehdr) {
+		pr_err("Purgatory elf load info missing?\n");
+		return NULL;
+	}
+
+	sechdrs = (void *)ehdr + ehdr->e_shoff;
+	secstrings = (void *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+	for (i = 0; i < ehdr->e_shnum; i++) {
+		if ((sechdrs[i].sh_size != 0) &&
+		    (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0)) {
+			/* Return the ".toc" section */
+			pr_debug("TOC section number is %d\n", i);
+			return &sechdrs[i];
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * get_toc_ptr - r2 is the TOC pointer: it points 0x8000 into the TOC
+ * @ehdr:        ELF header.
+ *
+ * Returns r2 on success, 0 otherwise.
+ */
+static unsigned long get_toc_ptr(const Elf_Ehdr *ehdr)
+{
+	const Elf_Shdr *sechdr;
+
+	sechdr = get_toc_section(ehdr);
+	if (!sechdr) {
+		pr_err("Could not get the TOC section!\n");
+		return 0;
+	}
+
+	return sechdr->sh_addr + 0x8000;
+}
+
+/* Helper functions to apply relocations */
+static int do_relative_toc(unsigned long val, uint16_t *loc,
+			   unsigned long mask, int complain_signed)
+{
+	if (complain_signed && (val + 0x8000 > 0xffff)) {
+		pr_err("TOC16 relocation overflows (%lu)\n", val);
+		return -ENOEXEC;
+	}
+
+	if ((~mask & 0xffff) & val) {
+		pr_err("Bad TOC16 relocation (%lu)\n", val);
+		return -ENOEXEC;
+	}
+
+	*loc = (*loc & ~mask) | (val & mask);
+	return 0;
+}
+#ifdef PPC64_ELF_ABI_v2
+/* PowerPC64 specific values for the Elf64_Sym st_other field.  */
+#define STO_PPC64_LOCAL_BIT	5
+#define STO_PPC64_LOCAL_MASK	(7 << STO_PPC64_LOCAL_BIT)
+#define PPC64_LOCAL_ENTRY_OFFSET(other)					\
+	(((1 << (((other) & STO_PPC64_LOCAL_MASK) >> STO_PPC64_LOCAL_BIT)) \
+	 >> 2) << 2)
+
+static unsigned int local_entry_offset(const Elf64_Sym *sym)
+{
+	/* If this symbol has a local entry point, use it. */
+	return PPC64_LOCAL_ENTRY_OFFSET(sym->st_other);
+}
+#else
+static unsigned int local_entry_offset(struct mem_sym *UNUSED(sym))
+{
+	return 0;
+}
+#endif
+
+/**
+ * kexec_do_relocs_ppc64 - Apply relocations based on relocation type.
+ * @my_r2:                 TOC pointer.
+ * @sym:                   Symbol to relocate.
+ * @r_type:                Relocation type.
+ * @loc:                   Location to modify.
+ * @val:                   Relocated symbol value.
+ * @addr:                  Final location after relocation.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int kexec_do_relocs_ppc64(unsigned long my_r2, const Elf_Sym *sym,
+				 int r_type, void *loc, unsigned long val,
+				 unsigned long addr)
+{
+	int ret = 0;
+
+	switch (r_type) {
+	case R_PPC64_ADDR32:
+		/* Simply set it */
+		*(uint32_t *)loc = val;
+		break;
+
+	case R_PPC64_ADDR64:
+		/* Simply set it */
+		*(uint64_t *)loc = val;
+		break;
+
+	case R_PPC64_REL64:
+		*(uint64_t *)loc = val - (uint64_t)loc;
+		break;
+
+	case R_PPC64_REL32:
+		/* Convert value to relative */
+		val -= (unsigned long)loc;
+		if (val + 0x80000000 > 0xffffffff) {
+			pr_err("REL32 %li out of range!\n", val);
+			return -ENOEXEC;
+		}
+
+		*(uint32_t *)loc = val;
+		break;
+
+	case R_PPC64_TOC:
+		*(uint64_t *)loc = my_r2;
+		break;
+
+	case R_PPC64_TOC16:
+		ret = do_relative_toc(val - my_r2, loc, 0xffff, 1);
+		break;
+
+	case R_PPC64_TOC16_DS:
+		ret = do_relative_toc(val - my_r2, loc, 0xfffc, 1);
+		break;
+
+	case R_PPC64_TOC16_LO:
+		ret = do_relative_toc(val - my_r2, loc, 0xffff, 0);
+		break;
+
+	case R_PPC64_TOC16_LO_DS:
+		ret = do_relative_toc(val - my_r2, loc, 0xfffc, 0);
+		break;
+
+	case R_PPC64_TOC16_HI:
+		ret = do_relative_toc((val - my_r2) >> 16, loc,
+				      0xffff, 0);
+		break;
+
+	case R_PPC64_TOC16_HA:
+		ret = do_relative_toc((val - my_r2 + 0x8000) >> 16, loc,
+				      0xffff, 0);
+		break;
+
+	case R_PPC64_REL24:
+		val += local_entry_offset(sym);
+		/* Convert value to relative */
+		val -= addr;
+		if (val + 0x2000000 > 0x3ffffff || (val & 3) != 0) {
+			pr_err("REL24 %li out of range!\n", val);
+			return -ENOEXEC;
+		}
+
+		/* Only replace bits 2 through 26 */
+		*(uint32_t *)loc = ((*(uint32_t *)loc & ~0x03fffffc) |
+				    (val & 0x03fffffc));
+		break;
+
+	case R_PPC64_ADDR16_LO:
+		*(uint16_t *)loc = val & 0xffff;
+		break;
+
+	case R_PPC64_ADDR16_HI:
+		*(uint16_t *)loc = (val >> 16) & 0xffff;
+		break;
+
+	case R_PPC64_ADDR16_HA:
+		*(uint16_t *)loc = (((val + 0x8000) >> 16) & 0xffff);
+		break;
+
+	case R_PPC64_ADDR16_HIGHER:
+		*(uint16_t *)loc = (((uint64_t)val >> 32) & 0xffff);
+		break;
+
+	case R_PPC64_ADDR16_HIGHEST:
+		*(uint16_t *)loc = (((uint64_t)val >> 48) & 0xffff);
+		break;
+
+		/* R_PPC64_REL16_HA and R_PPC64_REL16_LO are handled to support
+		 * ABIv2 r2 assignment based on r12 for PIC executable.
+		 * Here address is known, so replace
+		 *	0:	addis 2,12,.TOC.-0b@ha
+		 *		addi 2,2,.TOC.-0b@l
+		 * by
+		 *		lis 2,.TOC.@ha
+		 *		addi 2,2,.TOC.@l
+		 */
+	case R_PPC64_REL16_HA:
+		/* check that we are dealing with the addis 2,12 instruction */
+		if (((*(uint32_t *)loc) & 0xffff0000) != 0x3c4c0000) {
+			pr_err("Unexpected instruction for  R_PPC64_REL16_HA");
+			return -ENOEXEC;
+		}
+
+		val += my_r2;
+		/* replacing by lis 2 */
+		*(uint32_t *)loc = 0x3c400000 + ((val >> 16) & 0xffff);
+		break;
+
+	case R_PPC64_REL16_LO:
+		/* check that we are dealing with the addi 2,2 instruction */
+		if (((*(uint32_t *)loc) & 0xffff0000) != 0x38420000) {
+			pr_err("Unexpected instruction for R_PPC64_REL16_LO");
+			return -ENOEXEC;
+		}
+
+		val += my_r2 - 4;
+		*(uint16_t *)loc = val & 0xffff;
+		break;
+
+	default:
+		pr_err("Unknown rela relocation: %d\n", r_type);
+		ret = -ENOEXEC;
+		break;
+	}
+
+	return ret;
+}
+
+/**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
  *                         common global variable.
@@ -641,6 +878,7 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	uint64_t toc_ptr;
 	int ret;
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
@@ -663,6 +901,10 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			goto out;
 	}
 
+	/* Setup the TOC pointer */
+	toc_ptr = get_toc_ptr(image->purgatory_info.ehdr);
+	ret = kexec_purgatory_get_set_symbol(image, "my_toc", &toc_ptr,
+					     sizeof(toc_ptr), false);
 out:
 	if (ret)
 		pr_err("Failed to setup purgatory symbols");
@@ -751,6 +993,102 @@ int arch_kexec_add_buffer(struct kexec_buf *kbuf)
 }
 
 /**
+ * arch_kexec_apply_relocations_add - Apply relocations of type RELA
+ * @pi:                               Purgatory Info.
+ * @section:                          Section relocations applying to.
+ * @relsec:                           Section containing RELAs.
+ * @symtab:                           Corresponding symtab.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+				     Elf_Shdr *section,
+				     const Elf_Shdr *relsec,
+				     const Elf_Shdr *symtab)
+{
+	const char *strtab, *name, *shstrtab;
+	const Elf_Shdr *sechdrs;
+	int i, r_type, ret = 0;
+	const Elf_Ehdr *ehdr;
+	unsigned long my_r2;
+	Elf_Rela *relas;
+
+	ehdr = pi->ehdr;
+
+	/* String & section header string table */
+	sechdrs = (void *)ehdr + ehdr->e_shoff;
+	strtab = (char *)ehdr + sechdrs[symtab->sh_link].sh_offset;
+	shstrtab = (char *)ehdr + sechdrs[ehdr->e_shstrndx].sh_offset;
+
+	relas = (void *)ehdr + relsec->sh_offset;
+
+	pr_debug("Applying relocate section %s to %u\n",
+		 shstrtab + relsec->sh_name, relsec->sh_info);
+
+	/* Get the TOC pointer (r2) */
+	my_r2 = get_toc_ptr(ehdr);
+	if (!my_r2)
+		return -ENOEXEC;
+
+	for (i = 0; i < relsec->sh_size / sizeof(*relas); i++) {
+		const Elf_Sym *sym;	/* symbol to relocate */
+		unsigned long addr;	/* final location after relocation */
+		unsigned long val;	/* relocated symbol value */
+		void *loc;		/* tmp location to modify */
+
+		sym = (void *)ehdr + symtab->sh_offset;
+		sym += ELF64_R_SYM(relas[i].r_info);
+
+		if (sym->st_name)
+			name = strtab + sym->st_name;
+		else
+			name = shstrtab + sechdrs[sym->st_shndx].sh_name;
+
+		pr_debug("Symbol: %s info: %x shndx: %x value=%llx size: %llx\n",
+			 name, sym->st_info, sym->st_shndx, sym->st_value,
+			 sym->st_size);
+
+		if ((sym->st_shndx == SHN_UNDEF) &&
+		    (ELF_ST_TYPE(sym->st_info) != STT_NOTYPE)) {
+			pr_err("Undefined symbol: %s\n", name);
+			return -ENOEXEC;
+		}
+
+		if (sym->st_shndx == SHN_COMMON) {
+			pr_err("symbol '%s' in common section\n", name);
+			return -ENOEXEC;
+		}
+
+		if ((sym->st_shndx >= ehdr->e_shnum) &&
+		    (sym->st_shndx != SHN_ABS)) {
+			pr_err("Invalid section %d for symbol %s\n",
+			       sym->st_shndx, name);
+			return -ENOEXEC;
+		}
+
+		loc = pi->purgatory_buf;
+		loc += section->sh_offset;
+		loc += relas[i].r_offset;
+
+		val = sym->st_value;
+		if (sym->st_shndx != SHN_ABS)
+			val += pi->sechdrs[sym->st_shndx].sh_addr;
+		val += relas[i].r_addend;
+
+		addr = section->sh_addr + relas[i].r_offset;
+
+		pr_debug("Symbol: %s value=%lx address=%lx\n", name, val, addr);
+
+		r_type = ELF64_R_TYPE(relas[i].r_info);
+		ret = kexec_do_relocs_ppc64(my_r2, sym, r_type, loc, val, addr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
  * arch_kexec_kernel_image_probe - Does additional handling needed to setup
  *                                 kexec segments.
  * @image:                         kexec image being loaded.
diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
index a5a83c3..7b4a5f7 100644
--- a/arch/powerpc/purgatory/trampoline_64.S
+++ b/arch/powerpc/purgatory/trampoline_64.S
@@ -51,6 +51,8 @@ master:
 	bl	0f		/* Work out where we're running */
 0:	mflr	%r18
 
+	ld	%r2,(my_toc - 0b)(%r18)		/* setup toc */
+
 	/* load device-tree address */
 	ld	%r3, (dt_offset - 0b)(%r18)
 	mr	%r16,%r3	/* save dt address in reg16 */
@@ -103,6 +105,12 @@ dt_offset:
 	.size dt_offset, . - dt_offset
 
 
+	.balign 8
+	.globl my_toc
+my_toc:
+	.8byte  0x0
+	.size my_toc, . - my_toc
+
 	.data
 	.balign 8
 .globl purgatory_sha256_digest

