Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0684838B6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 11:10:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKgk35uQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK2sD25vQz3cSp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 21:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKgk35uQ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK2rP6Rkhz3bmq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 21:09:41 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TK2rP4xXzz4wbr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 21:09:41 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TK2rP4sZjz4wcc; Tue, 23 Jan 2024 21:09:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKgk35uQ;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TK2rP19CSz4wbr
	for <linuxppc-dev@ozlabs.org>; Tue, 23 Jan 2024 21:09:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40NA7r49023132;
	Tue, 23 Jan 2024 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YOBiPflqrbbVS1lyq56FanLMFYu+cLH6RYuA/VYwZrg=;
 b=tKgk35uQs+jqD5xOmg3vBEzwV7ym32BNgF0JIhgAoSoVugJh504DMORBsysTalijciX0
 lZ6+D6mVMnUoDWxQoZMMjKWZFz1K24RiQ0r5zOOtUr7yA2IrlmqPcGkk/1R0rtnckB6R
 7T/oBTTkjcLNDATPpk1aTedKHNW2yvrrM+50rTGgjBtX5Wu+mv5cZKq0mJWMCHX979R8
 FJpkHoHhbY79D3kXqXIVSC3k2v606JYfV+sYnvzzF+b0CF6AADG14Q6Tme8R7uhQZKIw
 W/96jd88QPlSVGWobrEBP2kzZWt4mG26UdKj2U5Xj93X5Rgr5bXF2hl/5iLYB/2OX+mN 0w== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vtbe7g170-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 10:09:29 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40NA09IM025276;
	Tue, 23 Jan 2024 10:09:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqk63w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 10:09:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40NA9PoT24707620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 10:09:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CDDC2004B;
	Tue, 23 Jan 2024 10:09:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC1252004D;
	Tue, 23 Jan 2024 10:09:23 +0000 (GMT)
Received: from [9.203.115.195] (unknown [9.203.115.195])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Jan 2024 10:09:23 +0000 (GMT)
Message-ID: <41a0647e-8a8a-40ca-9a07-3e97f02cc369@linux.ibm.com>
Date: Tue, 23 Jan 2024 15:39:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] powerpc: make fadump resilient with memory
 add/remove events
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20240111140943.297501-1-sourabhjain@linux.ibm.com>
 <20240111140943.297501-2-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240111140943.297501-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ALvsOh3JnAWluSe_vtrIqavV58BKZem6
X-Proofpoint-ORIG-GUID: ALvsOh3JnAWluSe_vtrIqavV58BKZem6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_05,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401230073
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/01/24 7:39 pm, Sourabh Jain wrote:
> Due to changes in memory resources caused by either memory hotplug or
> online/offline events, the elfcorehdr, which describes the CPUs and
> memory of the crashed kernel to the kernel that collects the dump (known
> as second/fadump kernel), becomes outdated. Consequently, attempting
> dump collection with an outdated elfcorehdr can lead to failed or
> inaccurate dump collection.
> 
> Memory hotplug or online/offline events is referred as memory add/remove
> events in reset of the commit message.
> 
> The current solution to address the aforementioned issue is as follows:
> Monitor memory add/remove events in userspace using udev rules, and
> re-register fadump whenever there are changes in memory resources. This
> leads to the creation of a new elfcorehdr with updated system memory
> information.
> 
> There are several notable issues associated with re-registering fadump
> for every memory add/remove events.
> 
> 1. Bulk memory add/remove events with udev-based fadump re-registration
>     can lead to race conditions and, more importantly, it creates a wide
>     window during which fadump is inactive until all memory add/remove
>     events are settled.
> 2. Re-registering fadump for every memory add/remove event is
>     inefficient.
> 3. The memory for elfcorehdr is allocated based on the memblock regions
>     available during early boot and remains fixed thereafter. However, if
>     elfcorehdr is later recreated with additional memblock regions, its
>     size will increase, potentially leading to memory corruption.
> 
> Address the aforementioned challenges by shifting the creation of
> elfcorehdr from the first kernel (also referred as the crashed kernel),
> where it was created and frequently recreated for every memory
> add/remove event, to the fadump kernel. As a result, the elfcorehdr only
> needs to be created once, thus eliminating the necessity to re-register
> fadump during memory add/remove events.
> 
> At present, the first kernel prepares the fadump header and stores it in
> the fadump reserved area. The fadump header contains start address of
> the elfcorehd, crashing CPU details, etc.  In the event of first kernel

"elfcorehd" used instead of "elfcorehdr" at a couple of places..

> crash, the second/fadump boots and access the fadump header prepared by
> first kernel and do the following in a platform-specific function
> [rtas|opal]_fadump_process:
> 
> At present, the first kernel is responsible for preparing the fadump
> header and storing it in the fadump reserved area. The fadump header
> includes the start address of the elfcorehd, crashing CPU details, and
> other relevant information. In the event of a crash in the first kernel,
> the second/fadump boots and accesses the fadump header prepared by the
> first kernel. It then performs the following steps in a
> platform-specific function [rtas|opal]_fadump_process:
> 
> 1. Sanity check for fadump header
> 2. Update CPU notes in elfcorehdr
> 3. Set the global variable elfcorehdr_addr to the address of the
>     fadump header's elfcorehdr. For vmcore module to process it later on.
> 
> Along with the above, update the setup_fadump()/fadump.c to create
> elfcorehdr in second/fadump kernel.
> 
> Section below outlines the information required to create the elfcorehdr
> and the changes made to make it available to the fadump kernel if it's
> not already.
> 
> To create elfcorehdr, the following crashed kernel information is
> required: CPU notes, vmcoreinfo, and memory ranges.
> 
> At present, the CPU notes are already prepared in the fadump kernel, so
> no changes are needed in that regard. The fadump kernel has access to
> all crashed kernel memory regions, including boot memory regions that
> are relocated by firmware to fadump reserved areas, so no changes for
> that either. However, it is necessary to add new members to the fadump
> header, i.e., the 'fadump_crash_info_header' structure, in order to pass
> the crashed kernel's vmcoreinfo address and its size to fadump kernel.
> 
> In addition to the vmcoreinfo address and size, there are a few other
> attributes also added to the fadump_crash_info_header structure.
> 
> 1. version:
>     It stores the fadump header version, which is currently set to 1.
>     This provides flexibility to update the fadump crash info header in
>     the future without changing the magic number. For each change in the
>     fadump header, the version will be increased. This will help the
>     updated kernel determine how to handle kernel dumps from older
>     kernels. The magic number remains relevant for checking fadump header
>     corruption.
> 
> 2. elfcorehdr_size:
>     since elfcorehdr is now prepared in the fadump/second kernel and
>     it is not part of the reserved area, this attribute is needed to
>     track the memory allocated for elfcorehdr to do the deallocation
>     properly.
> 
> 3. pt_regs_sz/cpu_mask_sz:
>     Store size of pt_regs and cpu_mask strucutre in first kernel. These
>     attributes are used avoid processing the dump if the sizes of pt_regs
>     and cpu_mask are not the same across the crashed and fadump kernel.
> 
> Note: if either first/crashed kernel or second/fadump kernel do not have
> the changes introduced here then kernel fail to collect the dump and
> prints relevant error message on the console.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Aditya Gupta <adityag@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> ---
>   arch/powerpc/include/asm/fadump-internal.h   |  31 +-
>   arch/powerpc/kernel/fadump.c                 | 355 +++++++++++--------
>   arch/powerpc/platforms/powernv/opal-fadump.c |  18 +-
>   arch/powerpc/platforms/pseries/rtas-fadump.c |  23 +-
>   4 files changed, 242 insertions(+), 185 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index 27f9e11eda28..a632e9708610 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -42,13 +42,40 @@ static inline u64 fadump_str_to_u64(const char *str)
>   
>   #define FADUMP_CPU_UNKNOWN		(~((u32)0))
>   
> -#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
> +/*
> + * The introduction of new fields in the fadump crash info header has
> + * led to a change in the magic key from `FADMPINF` to `FADMPSIG` for
> + * identifying a kernel crash from an old kernel.
> + *
> + * To prevent the need for further changes to the magic number in the
> + * event of future modifications to the fadump crash info header, a
> + * version field has been introduced to track the fadump crash info
> + * header version.
> + *
> + * Consider a few points before adding new members to the fadump crash info
> + * header structure:
> + *
> + *  - Append new members; avoid adding them in between.
> + *  - Non-primitive members should have a size member as well.
> + *  - For every change in the fadump header, increment the
> + *    fadump header version. This helps the updated kernel decide how to
> + *    handle kernel dumps from older kernels.
> + */
> +#define FADUMP_CRASH_INFO_MAGIC_OLD	fadump_str_to_u64("FADMPINF")
> +#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
> +#define FADUMP_HEADER_VERSION		1
>   
>   /* fadump crash info structure */
>   struct fadump_crash_info_header {
>   	u64		magic_number;
> -	u64		elfcorehdr_addr;
> +	u32		version;
>   	u32		crashing_cpu;

> +	u64		elfcorehdr_addr;
> +	u64		elfcorehdr_size;

fadump_crash_info_header structure is to share info across reboots.
Now that elfcorehdr is prepared in second kernel and also dump capture
of older kernel is not supported, get rid of elfcorehdr_addr &
elfcorehdr_size from fadump_crash_info_header structure and put them
in fw_dump structure instead..

> +	u64		vmcoreinfo_raddr;
> +	u64		vmcoreinfo_size;
> +	u32		pt_regs_sz;
> +	u32		cpu_mask_sz;
>   	struct pt_regs	regs;
>   	struct cpumask	cpu_mask;
>   };
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index d14eda1e8589..eb9132538268 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -53,8 +53,6 @@ static struct kobject *fadump_kobj;
>   static atomic_t cpus_in_fadump;
>   static DEFINE_MUTEX(fadump_mutex);
>   
> -static struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
> -
>   #define RESERVED_RNGS_SZ	16384 /* 16K - 128 entries */
>   #define RESERVED_RNGS_CNT	(RESERVED_RNGS_SZ / \
>   				 sizeof(struct fadump_memory_range))
> @@ -373,12 +371,6 @@ static unsigned long __init get_fadump_area_size(void)
>   	size = PAGE_ALIGN(size);
>   	size += fw_dump.boot_memory_size;
>   	size += sizeof(struct fadump_crash_info_header);
> -	size += sizeof(struct elfhdr); /* ELF core header.*/
> -	size += sizeof(struct elf_phdr); /* place holder for cpu notes */
> -	/* Program headers for crash memory regions. */
> -	size += sizeof(struct elf_phdr) * (memblock_num_regions(memory) + 2);
> -
> -	size = PAGE_ALIGN(size);
>   
>   	/* This is to hold kernel metadata on platforms that support it */
>   	size += (fw_dump.ops->fadump_get_metadata_size ?
> @@ -931,36 +923,6 @@ static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
>   	return 0;
>   }
>   
> -static int fadump_exclude_reserved_area(u64 start, u64 end)
> -{
> -	u64 ra_start, ra_end;
> -	int ret = 0;
> -
> -	ra_start = fw_dump.reserve_dump_area_start;
> -	ra_end = ra_start + fw_dump.reserve_dump_area_size;
> -
> -	if ((ra_start < end) && (ra_end > start)) {
> -		if ((start < ra_start) && (end > ra_end)) {
> -			ret = fadump_add_mem_range(&crash_mrange_info,
> -						   start, ra_start);
> -			if (ret)
> -				return ret;
> -
> -			ret = fadump_add_mem_range(&crash_mrange_info,
> -						   ra_end, end);
> -		} else if (start < ra_start) {
> -			ret = fadump_add_mem_range(&crash_mrange_info,
> -						   start, ra_start);
> -		} else if (ra_end < end) {
> -			ret = fadump_add_mem_range(&crash_mrange_info,
> -						   ra_end, end);
> -		}
> -	} else
> -		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
> -
> -	return ret;
> -}
> -
>   static int fadump_init_elfcore_header(char *bufp)
>   {
>   	struct elfhdr *elf;
> @@ -997,52 +959,6 @@ static int fadump_init_elfcore_header(char *bufp)
>   	return 0;
>   }
>   
> -/*
> - * Traverse through memblock structure and setup crash memory ranges. These
> - * ranges will be used create PT_LOAD program headers in elfcore header.
> - */
> -static int fadump_setup_crash_memory_ranges(void)
> -{
> -	u64 i, start, end;
> -	int ret;
> -
> -	pr_debug("Setup crash memory ranges.\n");
> -	crash_mrange_info.mem_range_cnt = 0;
> -
> -	/*
> -	 * Boot memory region(s) registered with firmware are moved to
> -	 * different location at the time of crash. Create separate program
> -	 * header(s) for this memory chunk(s) with the correct offset.
> -	 */
> -	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
> -		start = fw_dump.boot_mem_addr[i];
> -		end = start + fw_dump.boot_mem_sz[i];
> -		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	for_each_mem_range(i, &start, &end) {
> -		/*
> -		 * skip the memory chunk that is already added
> -		 * (0 through boot_memory_top).
> -		 */
> -		if (start < fw_dump.boot_mem_top) {
> -			if (end > fw_dump.boot_mem_top)
> -				start = fw_dump.boot_mem_top;
> -			else
> -				continue;
> -		}
> -
> -		/* add this range excluding the reserved dump area. */
> -		ret = fadump_exclude_reserved_area(start, end);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   /*
>    * If the given physical address falls within the boot memory region then
>    * return the relocated address that points to the dump region reserved
> @@ -1073,13 +989,28 @@ static inline unsigned long fadump_relocate(unsigned long paddr)
>   	return raddr;
>   }
>   
> -static int fadump_create_elfcore_headers(char *bufp)
> +static void populate_elf_pt_load(struct elf_phdr *phdr, u64 start,
> +			     u64 size, unsigned long long offset)
>   {
> -	unsigned long long raddr, offset;
> -	struct elf_phdr *phdr;
> +	phdr->p_align	= 0;
> +	phdr->p_memsz	= size;
> +	phdr->p_filesz	= size;
> +	phdr->p_paddr	= start;
> +	phdr->p_offset	= offset;
> +	phdr->p_type	= PT_LOAD;
> +	phdr->p_flags	= PF_R|PF_W|PF_X;
> +	phdr->p_vaddr	= (unsigned long)__va(start);
> +}
> +
> +static void __init fadump_populate_elfcorehdr(struct fadump_crash_info_header *fdh)
> +{
> +	char *bufp;
>   	struct elfhdr *elf;
> -	int i, j;
> +	struct elf_phdr *phdr;
> +	u64 boot_mem_dest_offset;
> +	unsigned long long i, ra_start, ra_end, ra_size, mstart, mend;
>   
> +	bufp = (char *) __va(fdh->elfcorehdr_addr);
>   	fadump_init_elfcore_header(bufp);
>   	elf = (struct elfhdr *)bufp;
>   	bufp += sizeof(struct elfhdr);
> @@ -1113,54 +1044,68 @@ static int fadump_create_elfcore_headers(char *bufp)
>   	phdr->p_vaddr	= 0;
>   	phdr->p_align	= 0;
>   
> -	phdr->p_paddr	= fadump_relocate(paddr_vmcoreinfo_note());
> -	phdr->p_offset	= phdr->p_paddr;
> -	phdr->p_memsz	= phdr->p_filesz = VMCOREINFO_NOTE_SIZE;
> +	phdr->p_paddr	= phdr->p_offset = fdh->vmcoreinfo_raddr;
> +	phdr->p_memsz	= phdr->p_filesz = fdh->vmcoreinfo_size;
>   
>   	/* Increment number of program headers. */
>   	(elf->e_phnum)++;
>   
> -	/* setup PT_LOAD sections. */
> -	j = 0;
> -	offset = 0;
> -	raddr = fw_dump.boot_mem_addr[0];
> -	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
> -		u64 mbase, msize;
> -
> -		mbase = crash_mrange_info.mem_ranges[i].base;
> -		msize = crash_mrange_info.mem_ranges[i].size;
> -		if (!msize)
> -			continue;
> -
> +	/*
> +	 * setup PT_LOAD sections.
> +	 * first include boot memory regions and then add rest of the memory
> +	 * regions
> +	 */
> +	boot_mem_dest_offset = fw_dump.boot_mem_dest_addr;
> +	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
>   		phdr = (struct elf_phdr *)bufp;
>   		bufp += sizeof(struct elf_phdr);
> -		phdr->p_type	= PT_LOAD;
> -		phdr->p_flags	= PF_R|PF_W|PF_X;
> -		phdr->p_offset	= mbase;
> -
> -		if (mbase == raddr) {
> -			/*
> -			 * The entire real memory region will be moved by
> -			 * firmware to the specified destination_address.
> -			 * Hence set the correct offset.
> -			 */
> -			phdr->p_offset = fw_dump.boot_mem_dest_addr + offset;
> -			if (j < (fw_dump.boot_mem_regs_cnt - 1)) {
> -				offset += fw_dump.boot_mem_sz[j];
> -				raddr = fw_dump.boot_mem_addr[++j];
> -			}
> +		populate_elf_pt_load(phdr, fw_dump.boot_mem_addr[i],
> +				 fw_dump.boot_mem_sz[i],
> +				 boot_mem_dest_offset);
> +		/* Increment number of program headers. */
> +		(elf->e_phnum)++;
> +		boot_mem_dest_offset += fw_dump.boot_mem_sz[i];
> +	}
> +
> +	/* Memory reserved for fadump in first kernel */
> +	ra_start = fw_dump.reserve_dump_area_start;
> +	ra_size = get_fadump_area_size();
> +	ra_end = ra_start + ra_size;
> +
> +	phdr = (struct elf_phdr *)bufp;
> +	for_each_mem_range(i, &mstart, &mend) {
> +		/*
> +		 * Skip the memory regions that already added
> +		 * to elfcorehdr.
> +		 */
> +		if (mstart < fw_dump.boot_mem_top) {
> +			if (mend > fw_dump.boot_mem_top)
> +				mstart = fw_dump.boot_mem_top;
> +			else
> +				continue;
>   		}
>   
> -		phdr->p_paddr = mbase;
> -		phdr->p_vaddr = (unsigned long)__va(mbase);
> -		phdr->p_filesz = msize;
> -		phdr->p_memsz = msize;
> -		phdr->p_align = 0;
> +		/* Handle memblock regions overlaps with reserved area */
> +		if ((ra_start < mend) && (ra_end > mstart)) {
> +			if ((mstart < ra_start) && (mend > ra_end)) {
> +				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
> +				elf->e_phnum++;
> +				bufp += sizeof(struct elf_phdr);
> +				phdr = (struct elf_phdr *)bufp;
> +				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
> +			} else if (mstart < ra_start) {
> +				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
> +			} else if (ra_end < mend) {
> +				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
> +			}
> +		} else {
> +			populate_elf_pt_load(phdr, mstart, mend - mstart, mstart);
> +		}
>   
> -		/* Increment number of program headers. */
> -		(elf->e_phnum)++;
> +		elf->e_phnum++;
> +		bufp += sizeof(struct elf_phdr);
> +		phdr = (struct elf_phdr *) bufp;
>   	}
> -	return 0;
>   }
>   
>   static unsigned long init_fadump_header(unsigned long addr)
> @@ -1175,14 +1120,25 @@ static unsigned long init_fadump_header(unsigned long addr)
>   
>   	memset(fdh, 0, sizeof(struct fadump_crash_info_header));
>   	fdh->magic_number = FADUMP_CRASH_INFO_MAGIC;
> -	fdh->elfcorehdr_addr = addr;
> +	fdh->version = FADUMP_HEADER_VERSION;
> +	/* Elfcorehdr will now be prepared in the second kernel. */
> +	fdh->elfcorehdr_addr = 0;
> +	fdh->elfcorehdr_size = 0;
>   	/* We will set the crashing cpu id in crash_fadump() during crash. */
>   	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
> +
> +	/* Need below vmcoreinfo in second kernel to prepare elfcorehdr. */
> +	fdh->vmcoreinfo_raddr = fadump_relocate(paddr_vmcoreinfo_note());
> +	fdh->vmcoreinfo_size = VMCOREINFO_NOTE_SIZE;
> +
> +
> +	fdh->pt_regs_sz = sizeof(struct pt_regs);
>   	/*
>   	 * When LPAR is terminated by PYHP, ensure all possible CPUs'
>   	 * register data is processed while exporting the vmcore.
>   	 */
>   	fdh->cpu_mask = *cpu_possible_mask;
> +	fdh->cpu_mask_sz = sizeof(struct cpumask);
>   
>   	return addr;
>   }
> @@ -1190,8 +1146,6 @@ static unsigned long init_fadump_header(unsigned long addr)
>   static int register_fadump(void)
>   {
>   	unsigned long addr;
> -	void *vaddr;
> -	int ret;
>   
>   	/*
>   	 * If no memory is reserved then we can not register for firmware-
> @@ -1200,18 +1154,10 @@ static int register_fadump(void)
>   	if (!fw_dump.reserve_dump_area_size)
>   		return -ENODEV;
>   
> -	ret = fadump_setup_crash_memory_ranges();
> -	if (ret)
> -		return ret;
> -
>   	addr = fw_dump.fadumphdr_addr;
>   
>   	/* Initialize fadump crash info header. */
>   	addr = init_fadump_header(addr);
> -	vaddr = __va(addr);
> -
> -	pr_debug("Creating ELF core headers at %#016lx\n", addr);
> -	fadump_create_elfcore_headers(vaddr);
>   
>   	/* register the future kernel dump with firmware. */
>   	pr_debug("Registering for firmware-assisted kernel dump...\n");
> @@ -1230,7 +1176,6 @@ void fadump_cleanup(void)
>   	} else if (fw_dump.dump_registered) {
>   		/* Un-register Firmware-assisted dump if it was registered. */
>   		fw_dump.ops->fadump_unregister(&fw_dump);
> -		fadump_free_mem_ranges(&crash_mrange_info);
>   	}
>   
>   	if (fw_dump.ops->fadump_cleanup)
> @@ -1416,6 +1361,30 @@ static void fadump_release_memory(u64 begin, u64 end)
>   		fadump_release_reserved_area(tstart, end);
>   }
>   
> +static void fadump_free_elfcorehdr_buf(void)
> +{
> +	struct fadump_crash_info_header *fdh;
> +	unsigned long elfcorehdr_vaddr;
> +
> +	if (!fw_dump.fadumphdr_addr)
> +		return;
> +
> +	fdh = (struct fadump_crash_info_header *) __va(fw_dump.fadumphdr_addr);
> +
> +	if (fdh->elfcorehdr_addr == 0 || fdh->elfcorehdr_size == 0)
> +		return;
> +
> +	/*
> +	 * Reset the global `elfcorehdr_addr` before freeing `elfcorehdr`
> +	 * memory so that modules, like `vmcore`, do not access the invalid memory.
> +	 */
> +	elfcorehdr_addr = ELFCORE_ADDR_MAX;
> +	elfcorehdr_vaddr = (unsigned long) __va(fdh->elfcorehdr_addr);
> +	fadump_free_buffer(elfcorehdr_vaddr, fdh->elfcorehdr_size);
> +	fdh->elfcorehdr_addr = 0;
> +	fdh->elfcorehdr_size = 0;
> +}
> +
>   static void fadump_invalidate_release_mem(void)
>   {
>   	mutex_lock(&fadump_mutex);
> @@ -1424,6 +1393,8 @@ static void fadump_invalidate_release_mem(void)
>   		return;
>   	}
>   
> +	/* Free elfcorehdr buf before cleaning up the fadump reserved area. */
> +	fadump_free_elfcorehdr_buf();
>   	fadump_cleanup();
>   	mutex_unlock(&fadump_mutex);
>   
> @@ -1632,6 +1603,107 @@ static void __init fadump_init_files(void)
>   	return;
>   }
>   
> +static int __init fadump_setup_elfcorehdr_buf(struct fadump_crash_info_header *fdh)
> +{
> +	char *bufp;
> +	int elf_phdr_cnt;
> +	unsigned long elfcorehdr_size;
> +
> +	/*
> +	 * Program header for CPU notes comes first, followed by one for
> +	 * vmcoreinfo, and the remaining program headers correspond to
> +	 * memory regions.
> +	 */
> +	elf_phdr_cnt = 2 + fw_dump.boot_mem_regs_cnt + memblock_num_regions(memory);
> +	elfcorehdr_size = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(struct elf_phdr));
> +	elfcorehdr_size = PAGE_ALIGN(elfcorehdr_size);
> +	bufp = (char *)fadump_alloc_buffer(elfcorehdr_size);
> +	if (!bufp) {
> +		pr_err("Failed to allocate %lu bytes for elfcorehdr\n",
> +		       elfcorehdr_size);
> +		return -ENOMEM;
> +	}
> +	fdh->elfcorehdr_addr = virt_to_phys(bufp);
> +	fdh->elfcorehdr_size = elfcorehdr_size;
> +	return 0;
> +}
> +
> +static bool is_fadump_header_compatible(struct fadump_crash_info_header *fdh)
> +{
> +	if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
> +		pr_err("Old magic number, can't process the dump.\n");
> +		return false;
> +	}
> +
> +	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
> +		if (fdh->magic_number == swab64(FADUMP_CRASH_INFO_MAGIC))
> +			pr_err("Endianness mismatch between the crashed and fadump kernels.\n");
> +		else
> +			pr_err("Fadump header is corruped.\n");

s/corruped/corrupted/

Thanks
Hari
