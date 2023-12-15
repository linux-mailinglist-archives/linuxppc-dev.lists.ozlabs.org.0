Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C08143DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 09:43:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HFpH7CM8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss2nP2pNMz3dL0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 19:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HFpH7CM8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss2mW5WDzz3bYR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 19:43:07 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF8guvV008975;
	Fri, 15 Dec 2023 08:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vHb9UqXQsdIUmbe4LgA6GtT4Thp8u4x0RQT5HQZIeeM=;
 b=HFpH7CM8w8TGQu1xtY84oayzqwGpJBaa1lUTXobcWC7qVJbnlyQXoVN7fxc5QKmQugAP
 +uPaPY9P/6E0N9yuxHfW2euhYfjGuRKktH4GcLoIGT8usXND1qxOXPzw5/XbIiX2Usbc
 ByubXmgHShsecIjOmFZvuhXsqhNsoP0ANwO0ZHuGl+SVdWw7t8Q8OgYJRjBMJZ1ukfN5
 SFUYrEQ4TcvDNIJ+7GE9b1rVWKEWslQoOZeg0vmHc0ESsBhCgbWd3qYlfg5xX788L9JK
 13AJTft4gpxlb4bwQUsfyITM64mLN+S4r04wvqRGJDkOEWV3ymmDR2ltAarxuw9/NZFy oQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0khag05a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 08:43:01 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF5tVX6014813;
	Fri, 15 Dec 2023 08:43:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw42kjy0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 08:43:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BF8gvIR27067028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Dec 2023 08:42:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A57F20043;
	Fri, 15 Dec 2023 08:42:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E3E920040;
	Fri, 15 Dec 2023 08:42:56 +0000 (GMT)
Received: from [9.79.186.169] (unknown [9.79.186.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Dec 2023 08:42:55 +0000 (GMT)
Message-ID: <1de00a5a-afa0-4c75-9f29-4b5e091d8321@linux.ibm.com>
Date: Fri, 15 Dec 2023 14:12:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] powerpc/fadump: pass additional parameters to
 dump capture kernel
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20231205201835.388030-1-hbathini@linux.ibm.com>
 <20231205201835.388030-3-hbathini@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20231205201835.388030-3-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W7Ftf3OEE9ClbgBVocoDzVx9VS-nyfmi
X-Proofpoint-ORIG-GUID: W7Ftf3OEE9ClbgBVocoDzVx9VS-nyfmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_04,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312150056
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
> For fadump case, passing additional parameters to dump capture kernel
> helps in minimizing the memory footprint for it and also provides the
> flexibility to disable components/modules, like hugepages, that are
> hindering the boot process of the special dump capture environment.
>
> Set up a dedicated parameter area to be passed to the capture kernel.
> This area type is defined as RTAS_FADUMP_PARAM_AREA. Sysfs attribute
> '/sys/kernel/fadump/bootargs_append' is exported to the userspace to
> specify the additional parameters to be passed to the capture kernel
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/fadump-internal.h   |  3 +
>   arch/powerpc/kernel/fadump.c                 | 80 ++++++++++++++++++++
>   arch/powerpc/platforms/powernv/opal-fadump.c |  6 +-
>   arch/powerpc/platforms/pseries/rtas-fadump.c | 35 ++++++++-
>   arch/powerpc/platforms/pseries/rtas-fadump.h | 11 ++-
>   5 files changed, 126 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index b3956c400519..81629226b15f 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -97,6 +97,8 @@ struct fw_dump {
>   	unsigned long	cpu_notes_buf_vaddr;
>   	unsigned long	cpu_notes_buf_size;
>   
> +	unsigned long	param_area;
> +
>   	/*
>   	 * Maximum size supported by firmware to copy from source to
>   	 * destination address per entry.
> @@ -111,6 +113,7 @@ struct fw_dump {
>   	unsigned long	dump_active:1;
>   	unsigned long	dump_registered:1;
>   	unsigned long	nocma:1;
> +	unsigned long	param_area_supported:1;
>   
>   	struct fadump_ops	*ops;
>   };
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 757681658dda..98f089747ac9 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1470,6 +1470,7 @@ static ssize_t mem_reserved_show(struct kobject *kobj,
>   	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
>   }
>   
> +
>   static ssize_t registered_show(struct kobject *kobj,
>   			       struct kobj_attribute *attr,
>   			       char *buf)
> @@ -1477,6 +1478,43 @@ static ssize_t registered_show(struct kobject *kobj,
>   	return sprintf(buf, "%d\n", fw_dump.dump_registered);
>   }
>   
> +static ssize_t bootargs_append_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sprintf(buf, "%s\n", (char *)__va(fw_dump.param_area));
> +}
> +
> +static ssize_t bootargs_append_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	char *params;
> +
> +	if (!fw_dump.fadump_enabled || fw_dump.dump_active)
> +		return -EPERM;
> +
> +	if (count >= COMMAND_LINE_SIZE)
> +		return -EINVAL;
> +
> +	/*
> +	 * Fail here instead of handling this scenario with
> +	 * some silly workaround in capture kernel.
> +	 */
> +	if (saved_command_line_len + count >= COMMAND_LINE_SIZE) {
> +		pr_err("Appending parameters exceeds cmdline size!\n");
> +		return -ENOSPC;
> +	}
> +
> +	params = __va(fw_dump.param_area);
> +	strscpy_pad(params, buf, COMMAND_LINE_SIZE);
> +	/* Remove newline character at the end. */
> +	if (params[count-1] == '\n')
> +		params[count-1] = '\0';
> +
> +	return count;
> +}
> +
>   static ssize_t registered_store(struct kobject *kobj,
>   				struct kobj_attribute *attr,
>   				const char *buf, size_t count)
> @@ -1535,6 +1573,7 @@ static struct kobj_attribute release_attr = __ATTR_WO(release_mem);
>   static struct kobj_attribute enable_attr = __ATTR_RO(enabled);
>   static struct kobj_attribute register_attr = __ATTR_RW(registered);
>   static struct kobj_attribute mem_reserved_attr = __ATTR_RO(mem_reserved);
> +static struct kobj_attribute bootargs_append_attr = __ATTR_RW(bootargs_append);
>   
>   static struct attribute *fadump_attrs[] = {
>   	&enable_attr.attr,
> @@ -1611,6 +1650,46 @@ static void __init fadump_init_files(void)
>   	return;
>   }
>   
> +/*
> + * Reserve memory to store additional parameters to be passed
> + * for fadump/capture kernel.
> + */
> +static void fadump_setup_param_area(void)
> +{
> +	phys_addr_t range_start, range_end;
> +
> +	if (!fw_dump.param_area_supported || fw_dump.dump_active)
> +		return;
> +
> +	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
> +	if (radix_enabled()) {
> +		/*
> +		 * Anywhere in the upper half should be good enough as all memory
> +		 * is accessible in real mode.
> +		 */
> +		range_start = memblock_end_of_DRAM() / 2;
> +		range_end = memblock_end_of_DRAM();
> +	} else {
> +		/*
> +		 * Passing additional parameters is supported for hash MMU only
> +		 * if the first memory block size is 768MB or higher.
> +		 */
> +		if (ppc64_rma_size < 0x30000000)
> +			return;
> +
> +		/* 640 MB to 768 MB is not used by bootloader */
> +		range_start = 0x28000000;
> +		range_end = range_start + 0x4000000;
> +	}
> +
> +	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,
> +						       COMMAND_LINE_SIZE,
> +						       range_start,
> +						       range_end);

Should we initialize the `param_area` to avoid garbage values, or retrieve
command-line arguments from the previous boot?

I observed that cat /sys/kernel/fadump/bootargs_append prints the same
value which I set before reboot. Is this expected?

Thanks,
Sourabh

> +	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr))
> +		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
> +}
> +
>   /*
>    * Prepare for firmware-assisted dump.
>    */
> @@ -1639,6 +1718,7 @@ int __init setup_fadump(void)
>   	}
>   	/* Initialize the kernel dump memory structure and register with f/w */
>   	else if (fw_dump.reserve_dump_area_size) {
> +		fadump_setup_param_area();
>   		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>   		register_fadump();
>   	}
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index fa26c21a08d9..13370f5cd5ac 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -682,8 +682,10 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
>   		}
>   	}
>   
> -	fadump_conf->ops		= &opal_fadump_ops;
> -	fadump_conf->fadump_supported	= 1;
> +	fadump_conf->ops			= &opal_fadump_ops;
> +	fadump_conf->fadump_supported		= 1;
> +	/* TODO: Add support to pass additional parameters */
> +	fadump_conf->param_area_supported	= 0;
>   
>   	/*
>   	 * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 1b05b4cefdfd..18838ae90688 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -18,6 +18,7 @@
>   
>   #include <asm/page.h>
>   #include <asm/rtas.h>
> +#include <asm/setup.h>
>   #include <asm/fadump.h>
>   #include <asm/fadump-internal.h>
>   
> @@ -80,6 +81,9 @@ static void __init rtas_fadump_get_config(struct fw_dump *fadump_conf,
>   			last_end = base + size;
>   			fadump_conf->boot_mem_regs_cnt++;
>   			break;
> +		case RTAS_FADUMP_PARAM_AREA:
> +			fadump_conf->param_area = be64_to_cpu(fdm->rgn[i].destination_address);
> +			break;
>   		default:
>   			pr_warn("Section type %d unsupported on this kernel. Ignoring!\n", type);
>   			break;
> @@ -153,7 +157,17 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>   		sec_cnt++;
>   	}
>   
> +	/* Parameters area */
> +	if (fadump_conf->param_area) {
> +		fdm.rgn[sec_cnt].request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
> +		fdm.rgn[sec_cnt].source_data_type = cpu_to_be16(RTAS_FADUMP_PARAM_AREA);
> +		fdm.rgn[sec_cnt].source_address = cpu_to_be64(fadump_conf->param_area);
> +		fdm.rgn[sec_cnt].source_len = cpu_to_be64(COMMAND_LINE_SIZE);
> +		fdm.rgn[sec_cnt].destination_address = cpu_to_be64(fadump_conf->param_area);
> +		sec_cnt++;
> +	}
>   	fdm.header.dump_num_sections = cpu_to_be16(sec_cnt);
> +
>   	rtas_fadump_update_config(fadump_conf, &fdm);
>   
>   	return addr;
> @@ -457,6 +471,13 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   				return rc;
>   			}
>   			break;
> +		case RTAS_FADUMP_PARAM_AREA:
> +			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len ||
> +			    fdm_active->rgn[i].error_flags != 0) {
> +				pr_warn("Failed to process additional parameters! Proceeding anyway..\n");
> +				fadump_conf->param_area = 0;
> +			}
> +			break;
>   		default:
>   			/*
>   			 * If the first/crashed kernel added a new region type that the
> @@ -532,6 +553,13 @@ static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
>   				   be64_to_cpu(fdm_ptr->rgn[i].source_len),
>   				   be64_to_cpu(fdm_ptr->rgn[i].bytes_dumped));
>   			break;
> +		case RTAS_FADUMP_PARAM_AREA:
> +			seq_printf(m, "\n[%#016llx-%#016llx]: cmdline append: '%s'\n",
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address),
> +				   be64_to_cpu(fdm_ptr->rgn[i].destination_address) +
> +				   be64_to_cpu(fdm_ptr->rgn[i].source_len) - 1,
> +				   (char *)__va(be64_to_cpu(fdm_ptr->rgn[i].destination_address)));
> +			break;
>   		default:
>   			seq_printf(m, "Unknown region type %d : Src: %#016llx, Dest: %#016llx, ",
>   				   type, be64_to_cpu(fdm_ptr->rgn[i].source_address),
> @@ -594,9 +622,10 @@ void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
>   	if (!token)
>   		return;
>   
> -	fadump_conf->ibm_configure_kernel_dump = be32_to_cpu(*token);
> -	fadump_conf->ops		= &rtas_fadump_ops;
> -	fadump_conf->fadump_supported	= 1;
> +	fadump_conf->ibm_configure_kernel_dump	= be32_to_cpu(*token);
> +	fadump_conf->ops			= &rtas_fadump_ops;
> +	fadump_conf->fadump_supported		= 1;
> +	fadump_conf->param_area_supported	= 1;
>   
>   	/* Firmware supports 64-bit value for size, align it to pagesize. */
>   	fadump_conf->max_copy_size = ALIGN_DOWN(U64_MAX, PAGE_SIZE);
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
> index 6740f4981bb8..c109abf6befd 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.h
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
> @@ -23,6 +23,9 @@
>   #define RTAS_FADUMP_HPTE_REGION		0x0002
>   #define RTAS_FADUMP_REAL_MODE_REGION	0x0011
>   
> +/* OS defined sections */
> +#define RTAS_FADUMP_PARAM_AREA		0x0100
> +
>   /* Dump request flag */
>   #define RTAS_FADUMP_REQUEST_FLAG	0x00000001
>   
> @@ -31,12 +34,12 @@
>   
>   /*
>    * The Firmware Assisted Dump Memory structure supports a maximum of 10 sections
> - * in the dump memory structure. Presently, first two sections are used for
> - * CPU and HPTE data, while the remaining eight sections can be used for
> - * boot memory regions.
> + * in the dump memory structure. Presently, three sections are used for
> + * CPU state data, HPTE & Parameters area, while the remaining seven sections
> + * can be used for boot memory regions.
>    */
>   #define MAX_SECTIONS				10
> -#define RTAS_FADUMP_MAX_BOOT_MEM_REGS		8
> +#define RTAS_FADUMP_MAX_BOOT_MEM_REGS		7
>   
>   /* Kernel Dump section info */
>   struct rtas_fadump_section {

