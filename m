Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A578143A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 09:29:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rf2fVtpl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss2TJ4qxNz3dRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 19:29:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rf2fVtpl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss2SR0q0kz3cSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 19:29:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF8CbSP016048;
	Fri, 15 Dec 2023 08:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7ZjQIIdAs87Dzo74aMYHWLh0Sz8MPEdbPXelvsjjb/w=;
 b=rf2fVtplKFgOWoj8TbxhvEGjKmM4yjGXQCdwh4JjfKWOA3OXF4kxfVmKnN9pjCcSmxBC
 FtpfUu20pnjCFdOFSmfmZIBq2Ls4nycU6Rr6sDkk5u/9gSyWXo8clsGhAJMxVc+zB/h4
 RPegT77b/WTHWIGetwRjBk8TwoOeNLHMLizT7Gcx7+DsTKAc/ldl1nILl+p2fTGawtJ3
 NEDbdLQlHRoVkc0bDoHuvpgDGpRgfldYxBYlDZUPoBwIYYojs5RyBrjkCnlYwKO6s7pd
 0GcSfd44ub5pQzjiWTSx5GkQjg9ax5k9JR3IKGFsM0ulYVZ6NE9olkCtArXsvUXxA+hs Jw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0k32gde6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 08:29:05 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF8CNAk012599;
	Fri, 15 Dec 2023 08:29:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw3jpes2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 08:29:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BF8T0wF43254044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Dec 2023 08:29:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B12020043;
	Fri, 15 Dec 2023 08:29:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07B5B20040;
	Fri, 15 Dec 2023 08:28:59 +0000 (GMT)
Received: from [9.79.186.169] (unknown [9.79.186.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Dec 2023 08:28:58 +0000 (GMT)
Message-ID: <e65fd7f1-05b5-47e5-aeeb-12636218565c@linux.ibm.com>
Date: Fri, 15 Dec 2023 13:58:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/fadump: add support for multiple
 boot memory regions
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20231205201835.388030-1-hbathini@linux.ibm.com>
 <20231205201835.388030-2-hbathini@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20231205201835.388030-2-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2WTZepE1tknJgeffi7M-S5zMWEKMX-Jn
X-Proofpoint-ORIG-GUID: 2WTZepE1tknJgeffi7M-S5zMWEKMX-Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_04,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312150054
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Hari,

On 06/12/23 01:48, Hari Bathini wrote:
> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> Currently, fadump on pseries assumes a single boot memory region even
> though f/w supports more than one boot memory region. Add support for
> more boot memory regions to make the implementation flexible for any
> enhancements that introduce other region types. For this, rtas memory
> structure for fadump is updated to have multiple boot memory regions
> instead of just one. Additionally, methods responsible for creating
> the fadump memory structure during both the first and second kernel
> boot have been modified to take these multiple boot memory regions
> into account. Also, a new callback has been added to the fadump_ops
> structure to get the maximum boot memory regions supported by the
> platform.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/fadump-internal.h   |   2 +-
>   arch/powerpc/kernel/fadump.c                 |  27 +-
>   arch/powerpc/platforms/powernv/opal-fadump.c |   8 +
>   arch/powerpc/platforms/pseries/rtas-fadump.c | 258 ++++++++++++-------
>   arch/powerpc/platforms/pseries/rtas-fadump.h |  26 +-
>   5 files changed, 199 insertions(+), 122 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index 27f9e11eda28..b3956c400519 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -129,6 +129,7 @@ struct fadump_ops {
>   				      struct seq_file *m);
>   	void	(*fadump_trigger)(struct fadump_crash_info_header *fdh,
>   				  const char *msg);
> +	int	(*fadump_max_boot_mem_rgns)(void);
>   };
>   
>   /* Helper functions */
> @@ -136,7 +137,6 @@ s32 __init fadump_setup_cpu_notes_buf(u32 num_cpus);
>   void fadump_free_cpu_notes_buf(void);
>   u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
>   void __init fadump_update_elfcore_header(char *bufp);
> -bool is_fadump_boot_mem_contiguous(void);
>   bool is_fadump_reserved_mem_contiguous(void);
>   
>   #else /* !CONFIG_PRESERVE_FA_DUMP */
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index d14eda1e8589..757681658dda 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -222,28 +222,6 @@ static bool is_fadump_mem_area_contiguous(u64 d_start, u64 d_end)
>   	return ret;
>   }
>   
> -/*
> - * Returns true, if there are no holes in boot memory area,
> - * false otherwise.
> - */
> -bool is_fadump_boot_mem_contiguous(void)
> -{
> -	unsigned long d_start, d_end;
> -	bool ret = false;
> -	int i;
> -
> -	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
> -		d_start = fw_dump.boot_mem_addr[i];
> -		d_end   = d_start + fw_dump.boot_mem_sz[i];
> -
> -		ret = is_fadump_mem_area_contiguous(d_start, d_end);
> -		if (!ret)
> -			break;
> -	}
> -
> -	return ret;
> -}
> -
>   /*
>    * Returns true, if there are no holes in reserved memory area,
>    * false otherwise.
> @@ -389,10 +367,11 @@ static unsigned long __init get_fadump_area_size(void)
>   static int __init add_boot_mem_region(unsigned long rstart,
>   				      unsigned long rsize)
>   {
> +	int max_boot_mem_rgns = fw_dump.ops->fadump_max_boot_mem_rgns();
>   	int i = fw_dump.boot_mem_regs_cnt++;
>   
> -	if (fw_dump.boot_mem_regs_cnt > FADUMP_MAX_MEM_REGS) {
> -		fw_dump.boot_mem_regs_cnt = FADUMP_MAX_MEM_REGS;
> +	if (fw_dump.boot_mem_regs_cnt > max_boot_mem_rgns) {
> +		fw_dump.boot_mem_regs_cnt = max_boot_mem_rgns;
>   		return 0;
>   	}
>   
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index 964f464b1b0e..fa26c21a08d9 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -615,6 +615,13 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
>   		pr_emerg("No backend support for MPIPL!\n");
>   }
>   
> +/* FADUMP_MAX_MEM_REGS or lower */
> +static int opal_fadump_max_boot_mem_rgns(void)
> +{
> +	return FADUMP_MAX_MEM_REGS;
> +

Nitpick: we can get rid of the above blank line.

- Sourabh

> +}
> +
>   static struct fadump_ops opal_fadump_ops = {
>   	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
>   	.fadump_get_metadata_size	= opal_fadump_get_metadata_size,
> @@ -627,6 +634,7 @@ static struct fadump_ops opal_fadump_ops = {
>   	.fadump_process			= opal_fadump_process,
>   	.fadump_region_show		= opal_fadump_region_show,
>   	.fadump_trigger			= opal_fadump_trigger,
> +	.fadump_max_boot_mem_rgns	= opal_fadump_max_boot_mem_rgns,
>   };
>   
>   void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index b5853e9fcc3c..1b05b4cefdfd 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -29,9 +29,6 @@ static const struct rtas_fadump_mem_struct *fdm_active;
>   static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
>   				      const struct rtas_fadump_mem_struct *fdm)
>   {
> -	fadump_conf->boot_mem_dest_addr =
> -		be64_to_cpu(fdm->rmr_region.destination_address);
> -
>   	fadump_conf->fadumphdr_addr = (fadump_conf->boot_mem_dest_addr +
>   				       fadump_conf->boot_memory_size);
>   }
> @@ -43,20 +40,52 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
>   static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
>   				   const struct rtas_fadump_mem_struct *fdm)
>   {
> -	fadump_conf->boot_mem_addr[0] =
> -		be64_to_cpu(fdm->rmr_region.source_address);
> -	fadump_conf->boot_mem_sz[0] = be64_to_cpu(fdm->rmr_region.source_len);
> -	fadump_conf->boot_memory_size = fadump_conf->boot_mem_sz[0];
> +	unsigned long base, size, last_end, hole_size;
>   
> -	fadump_conf->boot_mem_top = fadump_conf->boot_memory_size;
> -	fadump_conf->boot_mem_regs_cnt = 1;
> +	last_end = 0;
> +	hole_size = 0;
> +	fadump_conf->boot_memory_size = 0;
> +	fadump_conf->boot_mem_regs_cnt = 0;
> +	pr_debug("Boot memory regions:\n");
> +	for (int i = 0; i < be16_to_cpu(fdm->header.dump_num_sections); i++) {
> +		int type = be16_to_cpu(fdm->rgn[i].source_data_type);
>   
> -	/*
> -	 * Start address of reserve dump area (permanent reservation) for
> -	 * re-registering FADump after dump capture.
> -	 */
> -	fadump_conf->reserve_dump_area_start =
> -		be64_to_cpu(fdm->cpu_state_data.destination_address);
> +		switch (type) {
> +		case RTAS_FADUMP_CPU_STATE_DATA:
> +			u64 addr = be64_to_cpu(fdm->rgn[i].destination_address);
> +
> +			fadump_conf->cpu_state_dest_vaddr = (u64)__va(addr);
> +			/*
> +			 * Start address of reserve dump area (permanent reservation) for
> +			 * re-registering FADump after dump capture.
> +			 */
> +			fadump_conf->reserve_dump_area_start = addr;
> +			break;
> +		case RTAS_FADUMP_HPTE_REGION:
> +			/* Not processed currently. */
> +			break;
> +		case RTAS_FADUMP_REAL_MODE_REGION:
> +			base = be64_to_cpu(fdm->rgn[i].source_address);
> +			size = be64_to_cpu(fdm->rgn[i].source_len);
> +			pr_debug("\t[%03d] base: 0x%lx, size: 0x%lx\n", i, base, size);
> +			if (!base) {
> +				fadump_conf->boot_mem_dest_addr =
> +					be64_to_cpu(fdm->rgn[i].destination_address);
> +			}
> +
> +			fadump_conf->boot_mem_addr[fadump_conf->boot_mem_regs_cnt] = base;
> +			fadump_conf->boot_mem_sz[fadump_conf->boot_mem_regs_cnt] = size;
> +			fadump_conf->boot_memory_size += size;
> +			hole_size += (base - last_end);
> +			last_end = base + size;
> +			fadump_conf->boot_mem_regs_cnt++;
> +			break;
> +		default:
> +			pr_warn("Section type %d unsupported on this kernel. Ignoring!\n", type);
> +			break;
> +		}
> +	}
> +	fadump_conf->boot_mem_top = fadump_conf->boot_memory_size + hole_size;
>   
>   	rtas_fadump_update_config(fadump_conf, fdm);
>   }
> @@ -64,16 +93,15 @@ static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
>   static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>   {
>   	u64 addr = fadump_conf->reserve_dump_area_start;
> +	u16 sec_cnt = 0;
>   
>   	memset(&fdm, 0, sizeof(struct rtas_fadump_mem_struct));
>   	addr = addr & PAGE_MASK;
>   
>   	fdm.header.dump_format_version = cpu_to_be32(0x00000001);
> -	fdm.header.dump_num_sections = cpu_to_be16(3);
>   	fdm.header.dump_status_flag = 0;
>   	fdm.header.offset_first_dump_section =
> -		cpu_to_be32((u32)offsetof(struct rtas_fadump_mem_struct,
> -					  cpu_state_data));
> +		cpu_to_be32((u32)offsetof(struct rtas_fadump_mem_struct, rgn));
>   
>   	/*
>   	 * Fields for disk dump option.
> @@ -89,25 +117,22 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>   
>   	/* Kernel dump sections */
>   	/* cpu state data section. */
> -	fdm.cpu_state_data.request_flag =
> -		cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> -	fdm.cpu_state_data.source_data_type =
> -		cpu_to_be16(RTAS_FADUMP_CPU_STATE_DATA);
> -	fdm.cpu_state_data.source_address = 0;
> -	fdm.cpu_state_data.source_len =
> -		cpu_to_be64(fadump_conf->cpu_state_data_size);
> -	fdm.cpu_state_data.destination_address = cpu_to_be64(addr);
> +	fdm.rgn[sec_cnt].request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> +	fdm.rgn[sec_cnt].source_data_type = cpu_to_be16(RTAS_FADUMP_CPU_STATE_DATA);
> +	fdm.rgn[sec_cnt].source_address = 0;
> +	fdm.rgn[sec_cnt].source_len = cpu_to_be64(fadump_conf->cpu_state_data_size);
> +	fdm.rgn[sec_cnt].destination_address = cpu_to_be64(addr);
>   	addr += fadump_conf->cpu_state_data_size;
> +	sec_cnt++;
>   
>   	/* hpte region section */
> -	fdm.hpte_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> -	fdm.hpte_region.source_data_type =
> -		cpu_to_be16(RTAS_FADUMP_HPTE_REGION);
> -	fdm.hpte_region.source_address = 0;
> -	fdm.hpte_region.source_len =
> -		cpu_to_be64(fadump_conf->hpte_region_size);
> -	fdm.hpte_region.destination_address = cpu_to_be64(addr);
> +	fdm.rgn[sec_cnt].request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> +	fdm.rgn[sec_cnt].source_data_type = cpu_to_be16(RTAS_FADUMP_HPTE_REGION);
> +	fdm.rgn[sec_cnt].source_address = 0;
> +	fdm.rgn[sec_cnt].source_len = cpu_to_be64(fadump_conf->hpte_region_size);
> +	fdm.rgn[sec_cnt].destination_address = cpu_to_be64(addr);
>   	addr += fadump_conf->hpte_region_size;
> +	sec_cnt++;
>   
>   	/*
>   	 * Align boot memory area destination address to page boundary to
> @@ -115,15 +140,20 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>   	 */
>   	addr = PAGE_ALIGN(addr);
>   
> -	/* RMA region section */
> -	fdm.rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> -	fdm.rmr_region.source_data_type =
> -		cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
> -	fdm.rmr_region.source_address = cpu_to_be64(0);
> -	fdm.rmr_region.source_len = cpu_to_be64(fadump_conf->boot_memory_size);
> -	fdm.rmr_region.destination_address = cpu_to_be64(addr);
> -	addr += fadump_conf->boot_memory_size;
> +	/* First boot memory region destination address */
> +	fadump_conf->boot_mem_dest_addr = addr;
> +	for (int i = 0; i < fadump_conf->boot_mem_regs_cnt; i++) {
> +		/* Boot memory regions */
> +		fdm.rgn[sec_cnt].request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> +		fdm.rgn[sec_cnt].source_data_type = cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
> +		fdm.rgn[sec_cnt].source_address = cpu_to_be64(fadump_conf->boot_mem_addr[i]);
> +		fdm.rgn[sec_cnt].source_len = cpu_to_be64(fadump_conf->boot_mem_sz[i]);
> +		fdm.rgn[sec_cnt].destination_address = cpu_to_be64(addr);
> +		addr += fadump_conf->boot_mem_sz[i];
> +		sec_cnt++;
> +	}
>   
> +	fdm.header.dump_num_sections = cpu_to_be16(sec_cnt);
>   	rtas_fadump_update_config(fadump_conf, &fdm);
>   
>   	return addr;
> @@ -136,14 +166,21 @@ static u64 rtas_fadump_get_bootmem_min(void)
>   
>   static int rtas_fadump_register(struct fw_dump *fadump_conf)
>   {
> -	unsigned int wait_time;
> +	unsigned int wait_time, fdm_size;
>   	int rc, err = -EIO;
>   
> +	/*
> +	 * Platform requires the exact size of the Dump Memory Structure.
> +	 * Avoid including any unused rgns in the calculation, as this
> +	 * could result in a parameter error (-3) from the platform.
> +	 */
> +	fdm_size = sizeof(struct rtas_fadump_section_header);
> +	fdm_size += be16_to_cpu(fdm.header.dump_num_sections) * sizeof(struct rtas_fadump_section);
> +
>   	/* TODO: Add upper time limit for the delay */
>   	do {
>   		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
> -				NULL, FADUMP_REGISTER, &fdm,
> -				sizeof(struct rtas_fadump_mem_struct));
> +				NULL, FADUMP_REGISTER, &fdm, fdm_size);
>   
>   		wait_time = rtas_busy_delay_time(rc);
>   		if (wait_time)
> @@ -161,9 +198,7 @@ static int rtas_fadump_register(struct fw_dump *fadump_conf)
>   		pr_err("Failed to register. Hardware Error(%d).\n", rc);
>   		break;
>   	case -3:
> -		if (!is_fadump_boot_mem_contiguous())
> -			pr_err("Can't have holes in boot memory area.\n");
> -		else if (!is_fadump_reserved_mem_contiguous())
> +		if (!is_fadump_reserved_mem_contiguous())
>   			pr_err("Can't have holes in reserved memory area.\n");
>   
>   		pr_err("Failed to register. Parameter Error(%d).\n", rc);
> @@ -316,11 +351,9 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
>   	u32 num_cpus, *note_buf;
>   	int i, rc = 0, cpu = 0;
>   	struct pt_regs regs;
> -	unsigned long addr;
>   	void *vaddr;
>   
> -	addr = be64_to_cpu(fdm_active->cpu_state_data.destination_address);
> -	vaddr = __va(addr);
> +	vaddr = (void *)fadump_conf->cpu_state_dest_vaddr;
>   
>   	reg_header = vaddr;
>   	if (be64_to_cpu(reg_header->magic_number) !=
> @@ -395,24 +428,48 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
>   static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   {
>   	struct fadump_crash_info_header *fdh;
> -	int rc = 0;
> +	int i, rc = 0;
>   
>   	if (!fdm_active || !fadump_conf->fadumphdr_addr)
>   		return -EINVAL;
>   
> -	/* Check if the dump data is valid. */
> -	if ((be16_to_cpu(fdm_active->header.dump_status_flag) ==
> -			RTAS_FADUMP_ERROR_FLAG) ||
> -			(fdm_active->cpu_state_data.error_flags != 0) ||
> -			(fdm_active->rmr_region.error_flags != 0)) {
> -		pr_err("Dump taken by platform is not valid\n");
> -		return -EINVAL;
> -	}
> -	if ((fdm_active->rmr_region.bytes_dumped !=
> -			fdm_active->rmr_region.source_len) ||
> -			!fdm_active->cpu_state_data.bytes_dumped) {
> -		pr_err("Dump taken by platform is incomplete\n");
> -		return -EINVAL;
> +	/* Check all regions. */
> +	for (i = 0; i < be16_to_cpu(fdm_active->header.dump_num_sections); i++) {
> +		int type = be16_to_cpu(fdm_active->rgn[i].source_data_type);
> +
> +		switch (type) {
> +		case RTAS_FADUMP_CPU_STATE_DATA:
> +		case RTAS_FADUMP_HPTE_REGION:
> +		case RTAS_FADUMP_REAL_MODE_REGION:
> +			if (fdm_active->rgn[i].error_flags != 0) {
> +				pr_err("Dump taken by platform is not valid (%d)\n", i);
> +				rc = -EINVAL;
> +			}
> +			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len) {
> +				pr_err("Dump taken by platform is incomplete (%d)\n", i);
> +				rc = -EINVAL;
> +			}
> +			if (rc) {
> +				pr_warn("Region type: %u src addr: 0x%llx dest addr: 0x%llx\n",
> +					be16_to_cpu(fdm_active->rgn[i].source_data_type),
> +					be64_to_cpu(fdm_active->rgn[i].source_address),
> +					be64_to_cpu(fdm_active->rgn[i].destination_address));
> +				return rc;
> +			}
> +			break;
> +		default:
> +			/*
> +			 * If the first/crashed kernel added a new region type that the
> +			 * second/fadump kernel doesn't recognize, skip it and process
> +			 * assuming backward compatibility.
> +			 */
> +			pr_warn("Unknown region found: type: %u src addr: 0x%llx dest addr: 0x%llx\n",
> +				be16_to_cpu(fdm_active->rgn[i].source_data_type),
> +				be64_to_cpu(fdm_active->rgn[i].source_address),
> +				be64_to_cpu(fdm_active->rgn[i].destination_address));
> +			break;
> +		}
> +
>   	}
>   
>   	/* Validate the fadump crash info header */
> @@ -439,7 +496,6 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
>   				    struct seq_file *m)
>   {
> -	const struct rtas_fadump_section *cpu_data_section;
>   	const struct rtas_fadump_mem_struct *fdm_ptr;
>   
>   	if (fdm_active)
> @@ -447,27 +503,42 @@ static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
>   	else
>   		fdm_ptr = &fdm;
>   
> -	cpu_data_section = &(fdm_ptr->cpu_state_data);
> -	seq_printf(m, "CPU :[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
> -		   be64_to_cpu(cpu_data_section->destination_address),
> -		   be64_to_cpu(cpu_data_section->destination_address) +
> -		   be64_to_cpu(cpu_data_section->source_len) - 1,
> -		   be64_to_cpu(cpu_data_section->source_len),
> -		   be64_to_cpu(cpu_data_section->bytes_dumped));
> -
> -	seq_printf(m, "HPTE:[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
> -		   be64_to_cpu(fdm_ptr->hpte_region.destination_address),
> -		   be64_to_cpu(fdm_ptr->hpte_region.destination_address) +
> -		   be64_to_cpu(fdm_ptr->hpte_region.source_len) - 1,
> -		   be64_to_cpu(fdm_ptr->hpte_region.source_len),
> -		   be64_to_cpu(fdm_ptr->hpte_region.bytes_dumped));
> -
> -	seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
> -		   be64_to_cpu(fdm_ptr->rmr_region.source_address),
> -		   be64_to_cpu(fdm_ptr->rmr_region.destination_address));
> -	seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
> -		   be64_to_cpu(fdm_ptr->rmr_region.source_len),
> -		   be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
> +
> +	for (int i = 0; i < be16_to_cpu(fdm_ptr->header.dump_num_sections); i++) {
> +		int type = be16_to_cpu(fdm_ptr->rgn[i].source_data_type);
> +
> +		switch (type) {
> +		case RTAS_FADUMP_CPU_STATE_DATA:
> +			seq_printf(m, "CPU :[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address),
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address) +
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len) - 1,
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len),
> +				   be64_to_cpu(fdm_ptr->rgn[i].bytes_dumped));
> +			break;
> +		case RTAS_FADUMP_HPTE_REGION:
> +			seq_printf(m, "HPTE:[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address),
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address) +
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len) - 1,
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len),
> +				   be64_to_cpu(fdm_ptr->rgn[i].bytes_dumped));
> +			break;
> +		case RTAS_FADUMP_REAL_MODE_REGION:
> +			seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_address),
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address));
> +			seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len),
> +				   be64_to_cpu(fdm_ptr->rgn[i].bytes_dumped));
> +			break;
> +		default:
> +			seq_printf(m, "Unknown region type %d : Src: %#016llx, Dest: %#016llx, ",
> +				   type, be64_to_cpu(fdm_ptr->rgn[i].source_address),
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address));
> +			break;
> +		}
> +	}
>   
>   	/* Dump is active. Show preserved area start address. */
>   	if (fdm_active) {
> @@ -483,6 +554,20 @@ static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
>   	rtas_os_term((char *)msg);
>   }
>   
> +/* FADUMP_MAX_MEM_REGS or lower */
> +static int rtas_fadump_max_boot_mem_rgns(void)
> +{
> +	/*
> +	 * Version 1 of Kernel Assisted Dump Memory Structure (PAPR) supports 10 sections.
> +	 * With one each section taken for CPU state data & HPTE respectively, 8 sections
> +	 * can be used for boot memory regions.
> +	 *
> +	 * If new region(s) is(are) defined, maximum boot memory regions will decrease
> +	 * proportionally.
> +	 */
> +	return RTAS_FADUMP_MAX_BOOT_MEM_REGS;
> +}
> +
>   static struct fadump_ops rtas_fadump_ops = {
>   	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
>   	.fadump_get_bootmem_min		= rtas_fadump_get_bootmem_min,
> @@ -492,6 +577,7 @@ static struct fadump_ops rtas_fadump_ops = {
>   	.fadump_process			= rtas_fadump_process,
>   	.fadump_region_show		= rtas_fadump_region_show,
>   	.fadump_trigger			= rtas_fadump_trigger,
> +	.fadump_max_boot_mem_rgns	= rtas_fadump_max_boot_mem_rgns,
>   };
>   
>   void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
> index fd59bd7ca9c3..6740f4981bb8 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.h
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
> @@ -29,6 +29,15 @@
>   /* Dump status flag */
>   #define RTAS_FADUMP_ERROR_FLAG		0x2000
>   
> +/*
> + * The Firmware Assisted Dump Memory structure supports a maximum of 10 sections
> + * in the dump memory structure. Presently, first two sections are used for
> + * CPU and HPTE data, while the remaining eight sections can be used for
> + * boot memory regions.
> + */
> +#define MAX_SECTIONS				10
> +#define RTAS_FADUMP_MAX_BOOT_MEM_REGS		8
> +
>   /* Kernel Dump section info */
>   struct rtas_fadump_section {
>   	__be32	request_flag;
> @@ -61,20 +70,15 @@ struct rtas_fadump_section_header {
>    * Firmware Assisted dump memory structure. This structure is required for
>    * registering future kernel dump with power firmware through rtas call.
>    *
> - * No disk dump option. Hence disk dump path string section is not included.
> + * In version 1, the platform permits one section header, dump-disk path
> + * and ten sections.
> + *
> + * Note: No disk dump option. Hence disk dump path string section is not
> + * included.
>    */
>   struct rtas_fadump_mem_struct {
>   	struct rtas_fadump_section_header	header;
> -
> -	/* Kernel dump sections */
> -	struct rtas_fadump_section		cpu_state_data;
> -	struct rtas_fadump_section		hpte_region;
> -
> -	/*
> -	 * TODO: Extend multiple boot memory regions support in the kernel
> -	 *       for this platform.
> -	 */
> -	struct rtas_fadump_section		rmr_region;
> +	struct rtas_fadump_section		rgn[MAX_SECTIONS];
>   };
>   
>   /*

