Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85D5BC62
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 15:08:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cnkH2XMGzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 23:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prudo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cmvW4wmxzDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 22:31:31 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61CIWvi138705
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 08:31:28 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfg9hf7bk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 08:31:27 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <prudo@linux.ibm.com>;
 Mon, 1 Jul 2019 13:31:25 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 13:31:22 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61CVLxF50135068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 12:31:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B93BDA406B;
 Mon,  1 Jul 2019 12:31:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8399BA4040;
 Mon,  1 Jul 2019 12:31:21 +0000 (GMT)
Received: from laptop-ibm (unknown [9.152.212.73])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 12:31:21 +0000 (GMT)
Date: Mon, 1 Jul 2019 14:31:20 +0200
From: Philipp Rudo <prudo@linux.ibm.com>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH RFC] generic ELF support for kexec
In-Reply-To: <20190625185433.GA10934@t470p.stackframe.org>
References: <20190625185433.GA10934@t470p.stackframe.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070112-4275-0000-0000-0000034809C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070112-4276-0000-0000-000038581CE2
Message-Id: <20190701143120.20c71b30@laptop-ibm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010154
X-Mailman-Approved-At: Mon, 01 Jul 2019 23:06:50 +1000
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
Cc: linux-s390@vger.kernel.org, deller@gmx.de, kexec@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sven,

On Tue, 25 Jun 2019 20:54:34 +0200
Sven Schnelle <svens@stackframe.org> wrote:

> Hi List,
> 
> i recently started working on kexec for PA-RISC. While doing so, i figured
> that powerpc already has support for reading ELF images inside of the Kernel.
> My first attempt was to steal the source code and modify it for PA-RISC, but
> it turned out that i didn't had to change much. Only ARM specific stuff like
> fdt blob fetching had to be removed.
> 
> So instead of duplicating the code, i thought about moving the ELF stuff to
> the core kexec code, and exposing several function to use that code from the
> arch specific code.

That's always the right approach. Well done.

> I'm attaching the patch to this Mail. What do you think about that change?
> s390 also uses ELF files, and (maybe?) could also switch to this implementation.
> But i don't know anything about S/390 and don't have one in my basement. So
> i'll leave s390 to the IBM folks.

I'm afraid there isn't much code here s390 can reuse. I see multiple problems
in kexec_elf_load:

* while loading the phdrs we also need to setup some data structures to pass
  to the next kernel
* the s390 kernel needs to be loaded to a fixed address
* there is no support to load a crash kernel

Of course that could all be fixed/worked around by introducing some arch hooks.
But when you take into account that the whole elf loader on s390 is ~100 lines
of code, I don't think it is worth it.

More comments below.
 
[...]

> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index b9b1bc5f9669..49b23b425f84 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -216,6 +216,41 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
>  				       void **addr, unsigned long *sz);
>  #endif /* CONFIG_KEXEC_FILE */
>  
> +#ifdef CONFIG_KEXEC_FILE_ELF
> +
> +struct kexec_elf_info {
> +	/*
> +	 * Where the ELF binary contents are kept.
> +	 * Memory managed by the user of the struct.
> +	 */
> +	const char *buffer;
> +
> +	const struct elfhdr *ehdr;
> +	const struct elf_phdr *proghdrs;
> +	struct elf_shdr *sechdrs;
> +};

Do i understand this right? elf_info->buffer contains the full elf file and
elf_info->ehdr is a (endianness translated) copy of the files ehdr?

If so ...

> +void kexec_free_elf_info(struct kexec_elf_info *elf_info);
> +
> +int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
> +			  struct kexec_elf_info *elf_info);
> +
> +int kexec_elf_kernel_load(struct kimage *image, struct kexec_buf *kbuf,
> +			  char *kernel_buf, unsigned long kernel_len,
> +			  unsigned long *kernel_load_addr);
> +
> +int kexec_elf_probe(const char *buf, unsigned long len);
> +
> +int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> +			 struct kexec_elf_info *elf_info,
> +			 struct kexec_buf *kbuf,
> +			 unsigned long *lowest_load_addr);
> +
> +int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> +			 struct kexec_elf_info *elf_info,
> +			 struct kexec_buf *kbuf,
> +			 unsigned long *lowest_load_addr);

... you could simplify the arguments by dropping the ehdr argument. The
elf_info should contain all the information needed. Furthermore the kexec_buf
also contains a pointer to its kimage. So you can drop that argument as well.

An other thing is that you kzalloc the memory needed for proghdrs and sechdrs
but expect the user of those functions to provide the memory needed for ehdr.
Wouldn't it be more consistent to also kzalloc the ehdr?

[...]

> diff --git a/kernel/kexec_file_elf.c b/kernel/kexec_file_elf.c
> new file mode 100644
> index 000000000000..bb966c93492c
> --- /dev/null
> +++ b/kernel/kexec_file_elf.c
> @@ -0,0 +1,574 @@

[...]

> +static uint64_t elf64_to_cpu(const struct elfhdr *ehdr, uint64_t value)
> +{
> +	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
> +		value = le64_to_cpu(value);
> +	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
> +		value = be64_to_cpu(value);
> +
> +	return value;
> +}
> +
> +static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
> +{
> +	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
> +		value = le16_to_cpu(value);
> +	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
> +		value = be16_to_cpu(value);
> +
> +	return value;
> +}
> +
> +static uint32_t elf32_to_cpu(const struct elfhdr *ehdr, uint32_t value)
> +{
> +	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB)
> +		value = le32_to_cpu(value);
> +	else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB)
> +		value = be32_to_cpu(value);
> +
> +	return value;
> +}

What are the elf*_to_cpu good for? In general I'd assume that kexec loads a
kernel for the same architecture it is running on. So the new kernel should
also have the same endianness like the one which loads it. Is this a
ppcle/ppcbe issue?

Furthermore the current order is 64->16->32, which my OCPD absolutely hates :)

[...]

> +/**
> + * elf_is_shdr_sane - check that it is safe to use the section header
> + * @buf_len:	size of the buffer in which the ELF file is loaded.
> + */
> +static bool elf_is_shdr_sane(const struct elf_shdr *shdr, size_t buf_len)
> +{
> +	bool size_ok;
> +
> +	/* SHT_NULL headers have undefined values, so we can't check them. */
> +	if (shdr->sh_type == SHT_NULL)
> +		return true;
> +
> +	/* Now verify sh_entsize */
> +	switch (shdr->sh_type) {
> +	case SHT_SYMTAB:
> +		size_ok = shdr->sh_entsize == sizeof(Elf_Sym);
> +		break;
> +	case SHT_RELA:
> +		size_ok = shdr->sh_entsize == sizeof(Elf_Rela);
> +		break;
> +	case SHT_DYNAMIC:
> +		size_ok = shdr->sh_entsize == sizeof(Elf_Dyn);
> +		break;
> +	case SHT_REL:
> +		size_ok = shdr->sh_entsize == sizeof(Elf_Rel);
> +		break;
> +	case SHT_NOTE:
> +	case SHT_PROGBITS:
> +	case SHT_HASH:
> +	case SHT_NOBITS:
> +	default:
> +		/*
> +		 * This is a section whose entsize requirements
> +		 * I don't care about.  If I don't know about
> +		 * the section I can't care about it's entsize
> +		 * requirements.
> +		 */
> +		size_ok = true;
> +		break;
> +	}
> +
> +	if (!size_ok) {
> +		pr_debug("ELF section with wrong entry size.\n");
> +		return false;
> +	} else if (shdr->sh_addr + shdr->sh_size < shdr->sh_addr) {
> +		pr_debug("ELF section address wraps around.\n");
> +		return false;
> +	}
> +
> +	if (shdr->sh_type != SHT_NOBITS) {
> +		if (shdr->sh_offset + shdr->sh_size < shdr->sh_offset) {
> +			pr_debug("ELF section location wraps around.\n");
> +			return false;
> +		} else if (shdr->sh_offset + shdr->sh_size > buf_len) {
> +			pr_debug("ELF section not in file.\n");
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +static int elf_read_shdr(const char *buf, size_t len, struct kexec_elf_info *elf_info,
> +			 int idx)
> +{
> +	struct elf_shdr *shdr = &elf_info->sechdrs[idx];
> +	const struct elfhdr *ehdr = elf_info->ehdr;
> +	const char *sbuf;
> +	struct elf_shdr *buf_shdr;
> +
> +	sbuf = buf + ehdr->e_shoff + idx * sizeof(*buf_shdr);
> +	buf_shdr = (struct elf_shdr *) sbuf;
> +
> +	shdr->sh_name      = elf32_to_cpu(ehdr, buf_shdr->sh_name);
> +	shdr->sh_type      = elf32_to_cpu(ehdr, buf_shdr->sh_type);
> +	shdr->sh_addr      = elf_addr_to_cpu(ehdr, buf_shdr->sh_addr);
> +	shdr->sh_offset    = elf_addr_to_cpu(ehdr, buf_shdr->sh_offset);
> +	shdr->sh_link      = elf32_to_cpu(ehdr, buf_shdr->sh_link);
> +	shdr->sh_info      = elf32_to_cpu(ehdr, buf_shdr->sh_info);
> +
> +	/*
> +	 * The following fields have a type equivalent to Elf_Addr
> +	 * both in 32 bit and 64 bit ELF.
> +	 */
> +	shdr->sh_flags     = elf_addr_to_cpu(ehdr, buf_shdr->sh_flags);
> +	shdr->sh_size      = elf_addr_to_cpu(ehdr, buf_shdr->sh_size);
> +	shdr->sh_addralign = elf_addr_to_cpu(ehdr, buf_shdr->sh_addralign);
> +	shdr->sh_entsize   = elf_addr_to_cpu(ehdr, buf_shdr->sh_entsize);
> +
> +	return elf_is_shdr_sane(shdr, len) ? 0 : -ENOEXEC;
> +}
> +
> +/**
> + * elf_read_shdrs - read the section headers from the buffer
> + *
> + * This function assumes that the section header table was checked for sanity.
> + * Use elf_is_ehdr_sane() if it wasn't.
> + */
> +static int elf_read_shdrs(const char *buf, size_t len,
> +			  struct kexec_elf_info *elf_info)
> +{
> +	size_t shdr_size, i;
> +
> +	/*
> +	 * e_shnum is at most 65536 so calculating
> +	 * the size of the section header cannot overflow.
> +	 */
> +	shdr_size = sizeof(struct elf_shdr) * elf_info->ehdr->e_shnum;
> +
> +	elf_info->sechdrs = kzalloc(shdr_size, GFP_KERNEL);
> +	if (!elf_info->sechdrs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < elf_info->ehdr->e_shnum; i++) {
> +		int ret;
> +
> +		ret = elf_read_shdr(buf, len, elf_info, i);
> +		if (ret) {
> +			kfree(elf_info->sechdrs);
> +			elf_info->sechdrs = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

In the end you only use the phdrs. So in theory you can drop everything shdr
related. Although keeping it would be 'formally more correct'.

[...]

> +/**
> + * kexec_free_elf_info - free memory allocated by elf_read_from_buffer
> + */
> +void kexec_free_elf_info(struct kexec_elf_info *elf_info)
> +{
> +	kfree(elf_info->proghdrs);
> +	kfree(elf_info->sechdrs);
> +	memset(elf_info, 0, sizeof(*elf_info));
> +}
> +EXPORT_SYMBOL(kexec_free_elf_info);

Why are you exporting these functions? Is there any kexec implementation out
there which is put into a module? Do you even want that to be possible?

> +/**
> + * kexec_build_elf_info - read ELF executable and check that we can use it
> + */
> +int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
> +			  struct kexec_elf_info *elf_info)
> +{
> +	int i;
> +	int ret;
> +
> +	ret = elf_read_from_buffer(buf, len, ehdr, elf_info);
> +	if (ret)
> +		return ret;
> +
> +	/* Big endian vmlinux has type ET_DYN. */
> +	if (ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN) {

s390 is big endian and it's vmlinux has type ET_EXEC. So I assume that this is
a ppc issue?

> +		pr_err("Not an ELF executable.\n");
> +		goto error;
> +	} else if (!elf_info->proghdrs) {
> +		pr_err("No ELF program header.\n");
> +		goto error;
> +	}
> +
> +	for (i = 0; i < ehdr->e_phnum; i++) {
> +		/*
> +		 * Kexec does not support loading interpreters.
> +		 * In addition this check keeps us from attempting
> +		 * to kexec ordinay executables.
> +		 */
> +		if (elf_info->proghdrs[i].p_type == PT_INTERP) {
> +			pr_err("Requires an ELF interpreter.\n");
> +			goto error;
> +		}
> +	}
> +
> +	return 0;
> +error:
> +	kexec_free_elf_info(elf_info);
> +	return -ENOEXEC;
> +}
> +EXPORT_SYMBOL(kexec_build_elf_info);

[...]

> +int kexec_elf_probe(const char *buf, unsigned long len)
> +{
> +	struct elfhdr ehdr;
> +	struct kexec_elf_info elf_info;
> +	int ret;
> +
> +	ret = kexec_build_elf_info(buf, len, &ehdr, &elf_info);

On s390 I only check the elf magic when probing. That's because the image
loader cannot reliably check the image and thus accepts everything that is
given to it. That also means that any elf file the elf probe rejects (e.g.
because it has a phdr with type PT_INTERP) is passed on to the image loader,
which happily takes it.

If you plan to also add an image loader you should keep that in mind.

Thanks
Philipp

