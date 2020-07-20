Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E222609E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:19:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9MkW0nBLzDqg6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9M9h2ZBBzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9M9h0V3xz8tqK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:54:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9M9g5hknz9sRk; Mon, 20 Jul 2020 22:53:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B9M9f09xbz9sRW
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Jul 2020 22:53:57 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KC4Y8C165505; Mon, 20 Jul 2020 08:53:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5p8ttvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:53:52 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06KCETVf009776;
 Mon, 20 Jul 2020 08:53:51 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5p8ttud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:53:51 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KCntiD004377;
 Mon, 20 Jul 2020 12:53:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 32brq81bq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 12:53:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KCrjif56230138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 12:53:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 435E211C054;
 Mon, 20 Jul 2020 12:53:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F58811C04A;
 Mon, 20 Jul 2020 12:53:41 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.85.112.199])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 12:53:41 +0000 (GMT)
Subject: [PATCH v4 07/12] ppc64/kexec_file: add support to relocate purgatory
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 20 Jul 2020 18:23:40 +0530
Message-ID: <159524956457.20855.12480643681198700190.stgit@hbathini.in.ibm.com>
In-Reply-To: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_07:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200084
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Kexec-ml <kexec@lists.infradead.org>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Right now purgatory implementation is only minimal. But if purgatory
code is to be enhanced to copy memory to the backup region and verify
sha256 digest, relocations may have to be applied to the purgatory.
So, add support to relocate purgatory in kexec_file_load system call
by setting up TOC pointer and applying RELA relocations as needed.

Reported-by: kernel test robot <lkp@intel.com>
[lkp: In v1, 'struct mem_sym' was declared in parameter list]
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* Michael, can you share your opinion on the below:
    - https://lore.kernel.org/patchwork/patch/1272027/
    - My intention in cover note.

v3 -> v4:
* Updated error log message in get_toc_section() function.

v2 -> v3:
* Fixed get_toc_section() to return the section info that had relocations
  applied, to calculate the correct toc pointer.
* Fixed how relocation value is converted to relative while applying
  R_PPC64_REL64 & R_PPC64_REL32 relocations.

v1 -> v2:
* Fixed wrong use of 'struct mem_sym' in local_entry_offset() as
  reported by lkp. lkp report for reference:
    - https://lore.kernel.org/patchwork/patch/1264421/


 arch/powerpc/kexec/file_load_64.c      |  337 ++++++++++++++++++++++++++++++++
 arch/powerpc/purgatory/trampoline_64.S |    7 +
 2 files changed, 344 insertions(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 71c1ba7..20e638d 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -20,6 +20,7 @@
 #include <linux/of_device.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <asm/types.h>
 #include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 
@@ -692,6 +693,244 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
 }
 
 /**
+ * get_toc_section - Look for ".toc" symbol and return the corresponding section
+ *                   in the purgatory.
+ * @pi:              Purgatory Info.
+ *
+ * Returns TOC section on success, NULL otherwise.
+ */
+static const Elf_Shdr *get_toc_section(const struct purgatory_info *pi)
+{
+	const Elf_Shdr *sechdrs;
+	const char *secstrings;
+	int i;
+
+	if (!pi->ehdr) {
+		pr_err("Purgatory's elf info not found!\n");
+		return NULL;
+	}
+
+	sechdrs = (void *)pi->ehdr + pi->ehdr->e_shoff;
+	secstrings = (void *)pi->ehdr + sechdrs[pi->ehdr->e_shstrndx].sh_offset;
+
+	for (i = 0; i < pi->ehdr->e_shnum; i++) {
+		if ((sechdrs[i].sh_size != 0) &&
+		    (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0)) {
+			/* Return the relocated ".toc" section */
+			return &(pi->sechdrs[i]);
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * get_toc_ptr - Get the TOC pointer (r2) of purgatory.
+ * @pi:          Purgatory Info.
+ *
+ * Returns r2 on success, 0 otherwise.
+ */
+static unsigned long get_toc_ptr(const struct purgatory_info *pi)
+{
+	unsigned long toc_ptr = 0;
+	const Elf_Shdr *sechdr;
+
+	sechdr = get_toc_section(pi);
+	if (!sechdr)
+		pr_err("Could not get the TOC section!\n");
+	else
+		toc_ptr = sechdr->sh_addr + 0x8000;	/* 0x8000 into TOC */
+
+	pr_debug("TOC pointer (r2) is 0x%lx\n", toc_ptr);
+	return toc_ptr;
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
+static unsigned int local_entry_offset(const Elf64_Sym *sym)
+{
+	return 0;
+}
+#endif
+
+/**
+ * __kexec_do_relocs - Apply relocations based on relocation type.
+ * @my_r2:             TOC pointer.
+ * @sym:               Symbol to relocate.
+ * @r_type:            Relocation type.
+ * @loc:               Location to modify.
+ * @val:               Relocated symbol value.
+ * @addr:              Final location after relocation.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __kexec_do_relocs(unsigned long my_r2, const Elf_Sym *sym,
+			     int r_type, void *loc, unsigned long val,
+			     unsigned long addr)
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
+		*(uint64_t *)loc = val - (uint64_t)addr;
+		break;
+
+	case R_PPC64_REL32:
+		/* Convert value to relative */
+		val -= addr;
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
@@ -707,6 +946,7 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			  const void *fdt, unsigned long kernel_load_addr,
 			  unsigned long fdt_load_addr)
 {
+	uint64_t val;
 	int ret;
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
@@ -729,6 +969,10 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 			goto out;
 	}
 
+	/* Setup the TOC pointer */
+	val = get_toc_ptr(&(image->purgatory_info));
+	ret = kexec_purgatory_get_set_symbol(image, "my_toc", &val, sizeof(val),
+					     false);
 out:
 	if (ret)
 		pr_err("Failed to setup purgatory symbols");
@@ -849,6 +1093,99 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
+	int i, r_type, ret, err = -ENOEXEC;
+	const Elf_Shdr *sechdrs;
+	unsigned long my_r2;
+	Elf_Rela *relas;
+
+	/* String & section header string table */
+	sechdrs = (void *)pi->ehdr + pi->ehdr->e_shoff;
+	strtab = (char *)pi->ehdr + sechdrs[symtab->sh_link].sh_offset;
+	shstrtab = (char *)pi->ehdr + sechdrs[pi->ehdr->e_shstrndx].sh_offset;
+
+	relas = (void *)pi->ehdr + relsec->sh_offset;
+
+	pr_debug("Applying relocate section %s to %u\n",
+		 shstrtab + relsec->sh_name, relsec->sh_info);
+
+	/* Get the TOC pointer (r2) */
+	my_r2 = get_toc_ptr(pi);
+	if (!my_r2)
+		return err;
+
+	for (i = 0; i < relsec->sh_size / sizeof(*relas); i++) {
+		const Elf_Sym *sym;	/* symbol to relocate */
+		unsigned long addr;	/* final location after relocation */
+		unsigned long val;	/* relocated symbol value */
+		void *loc;		/* tmp location to modify */
+
+		sym = (void *)pi->ehdr + symtab->sh_offset;
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
+			return err;
+		}
+
+		if (sym->st_shndx == SHN_COMMON) {
+			pr_err("symbol '%s' in common section\n", name);
+			return err;
+		}
+
+		if ((sym->st_shndx >= pi->ehdr->e_shnum) &&
+		    (sym->st_shndx != SHN_ABS)) {
+			pr_err("Invalid section %d for symbol %s\n",
+			       sym->st_shndx, name);
+			return err;
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
+		ret = __kexec_do_relocs(my_r2, sym, r_type, loc, val, addr);
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
index a5a83c3..b375843 100644
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
@@ -102,6 +104,11 @@ dt_offset:
 	.8byte  0x0
 	.size dt_offset, . - dt_offset
 
+	.balign 8
+	.globl my_toc
+my_toc:
+	.8byte  0x0
+	.size my_toc, . - my_toc
 
 	.data
 	.balign 8

