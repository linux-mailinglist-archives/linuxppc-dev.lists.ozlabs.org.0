Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A57C8B93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 18:47:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4i41Nkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6XVD0bHkz3vYH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 03:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4i41Nkv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6XTJ3TV0z3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 03:46:28 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4S6XTD4Pjwz4xPY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 03:46:24 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4S6XTD4LQTz4xVb; Sat, 14 Oct 2023 03:46:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4i41Nkv;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4S6XTD1NDLz4xPY
	for <linuxppc-dev@ozlabs.org>; Sat, 14 Oct 2023 03:46:23 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGZQds000884;
	Fri, 13 Oct 2023 16:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UVwTBnE0hv0Xyxv8GV2ZZ3977whpTZ5bVjZAsJt/mkw=;
 b=k4i41Nkv+CEzfCXqq4X9ULnfslah/ZwbqOnHYLZ/gsc822SwA6UeUnig036qQiY/Mdb6
 IbwnrCv+/L8qmAsVgBxvQ5w5rng4WDxu+M4mQCzalSLtc2ykcoHhra+Y/k+rCPeONKnW
 b+c2z4822WK+kOmz9iiLu4w6VuKh396Rtg5UBRw0WgSZqA5Giwp/JbNuqY0/swJudmF1
 w6edaLT3kT8p778qnu46ttYRoKaiGlJUKzKjjy6K+o+QmGV+dpNAdq4PyyiTpJnLDC+w
 a2IifnPvDsoHn/aIZ9+A/dOp0e1c/haSYgYWle9FYm43svhu4LXDEuSzjhNywpUCZ5mI HA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tq9ht8b20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 16:46:09 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGgXa8009030;
	Fri, 13 Oct 2023 16:46:08 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tpt57n9bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 16:46:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39DGk5P344958300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 16:46:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71EF120043;
	Fri, 13 Oct 2023 16:46:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED46F20040;
	Fri, 13 Oct 2023 16:46:02 +0000 (GMT)
Received: from [9.43.43.225] (unknown [9.43.43.225])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Oct 2023 16:46:02 +0000 (GMT)
Message-ID: <991aba16-fee6-ee78-4d80-f5c58fca801f@linux.ibm.com>
Date: Fri, 13 Oct 2023 22:16:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v11 1/4] powerpc/kexec: turn some static helper functions
 public
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20230619024934.567046-1-sourabhjain@linux.ibm.com>
 <20230619024934.567046-2-sourabhjain@linux.ibm.com>
 <11f50c2e-a9b7-c5b5-d2b1-d52d3b3b73dc@csgroup.eu>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <11f50c2e-a9b7-c5b5-d2b1-d52d3b3b73dc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nn4ldwinsp9V0DNo3e0cvOrgoJl4InPO
X-Proofpoint-ORIG-GUID: nn4ldwinsp9V0DNo3e0cvOrgoJl4InPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_07,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130141
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
Cc: "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, "mahesh@linux.vnet.ibm.com" <mahesh@linux.vnet.ibm.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, "eric.devolder@oracle.com" <eric.devolder@oracle.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe,

On 13/10/23 18:59, Christophe Leroy wrote:
>
> Le 19/06/2023 à 04:49, Sourabh Jain a écrit :
>> Move update_cpus_node and get_crash_memory_ranges functions from
>> kexec/file_load_64.c to kexec/core_64.c to make these functions usable
>> by other kexec components.
>>
>> Later in the series, these functions are utilized to do in-kernel update
>> to kexec segments on CPU/Memory hot plug/unplug or online/offline events
>> for both kexec_load and kexec_file_load syscalls.
>>
>> No functional change intended.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
> This patch doesn't apply, if still applicable can you rebase and resubmit ?

I will be sending next version soon.

Thanks
Sourabh
>
>> ---
>>    arch/powerpc/include/asm/kexec.h  |   6 ++
>>    arch/powerpc/kexec/core_64.c      | 166 ++++++++++++++++++++++++++++++
>>    arch/powerpc/kexec/file_load_64.c | 162 -----------------------------
>>    3 files changed, 172 insertions(+), 162 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index a1ddba01e7d1..8090ad7d97d9 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -99,6 +99,12 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>>    
>>    void kexec_copy_flush(struct kimage *image);
>>    
>> +#ifdef CONFIG_PPC64
>> +struct crash_mem;
>> +int update_cpus_node(void *fdt);
>> +int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>> +#endif
>> +
>>    #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
>>    void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
>>    #define crash_free_reserved_phys_range crash_free_reserved_phys_range
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index a79e28c91e2b..0b292f93a74c 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -17,6 +17,8 @@
>>    #include <linux/cpu.h>
>>    #include <linux/hardirq.h>
>>    #include <linux/of.h>
>> +#include <linux/libfdt.h>
>> +#include <linux/memblock.h>
>>    
>>    #include <asm/page.h>
>>    #include <asm/current.h>
>> @@ -30,6 +32,8 @@
>>    #include <asm/hw_breakpoint.h>
>>    #include <asm/svm.h>
>>    #include <asm/ultravisor.h>
>> +#include <asm/kexec_ranges.h>
>> +#include <asm/crashdump-ppc64.h>
>>    
>>    int machine_kexec_prepare(struct kimage *image)
>>    {
>> @@ -377,6 +381,168 @@ void default_machine_kexec(struct kimage *image)
>>    	/* NOTREACHED */
>>    }
>>    
>> +/**
>> + * get_crash_memory_ranges - Get crash memory ranges. This list includes
>> + *                           first/crashing kernel's memory regions that
>> + *                           would be exported via an elfcore.
>> + * @mem_ranges:              Range list to add the memory ranges to.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>> +{
>> +	phys_addr_t base, end;
>> +	struct crash_mem *tmem;
>> +	u64 i;
>> +	int ret;
>> +
>> +	for_each_mem_range(i, &base, &end) {
>> +		u64 size = end - base;
>> +
>> +		/* Skip backup memory region, which needs a separate entry */
>> +		if (base == BACKUP_SRC_START) {
>> +			if (size > BACKUP_SRC_SIZE) {
>> +				base = BACKUP_SRC_END + 1;
>> +				size -= BACKUP_SRC_SIZE;
>> +			} else
>> +				continue;
>> +		}
>> +
>> +		ret = add_mem_range(mem_ranges, base, size);
>> +		if (ret)
>> +			goto out;
>> +
>> +		/* Try merging adjacent ranges before reallocation attempt */
>> +		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
>> +			sort_memory_ranges(*mem_ranges, true);
>> +	}
>> +
>> +	/* Reallocate memory ranges if there is no space to split ranges */
>> +	tmem = *mem_ranges;
>> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> +		tmem = realloc_mem_ranges(mem_ranges);
>> +		if (!tmem)
>> +			goto out;
>> +	}
>> +
>> +	/* Exclude crashkernel region */
>> +	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/*
>> +	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>> +	 *        regions are exported to save their context at the time of
>> +	 *        crash, they should actually be backed up just like the
>> +	 *        first 64K bytes of memory.
>> +	 */
>> +	ret = add_rtas_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_opal_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* create a separate program header for the backup region */
>> +	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
>> +	if (ret)
>> +		goto out;
>> +
>> +	sort_memory_ranges(*mem_ranges, false);
>> +out:
>> +	if (ret)
>> +		pr_err("Failed to setup crash memory ranges\n");
>> +	return ret;
>> +}
>> +
>> +/**
>> + * add_node_props - Reads node properties from device node structure and add
>> + *                  them to fdt.
>> + * @fdt:            Flattened device tree of the kernel
>> + * @node_offset:    offset of the node to add a property at
>> + * @dn:             device node pointer
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
>> +{
>> +	int ret = 0;
>> +	struct property *pp;
>> +
>> +	if (!dn)
>> +		return -EINVAL;
>> +
>> +	for_each_property_of_node(dn, pp) {
>> +		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
>> +		if (ret < 0) {
>> +			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
>> +			return ret;
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>> +/**
>> + * update_cpus_node - Update cpus node of flattened device tree using of_root
>> + *                    device node.
>> + * @fdt:              Flattened device tree of the kernel.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int update_cpus_node(void *fdt)
>> +{
>> +	struct device_node *cpus_node, *dn;
>> +	int cpus_offset, cpus_subnode_offset, ret = 0;
>> +
>> +	cpus_offset = fdt_path_offset(fdt, "/cpus");
>> +	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
>> +		pr_err("Malformed device tree: error reading /cpus node: %s\n",
>> +		       fdt_strerror(cpus_offset));
>> +		return cpus_offset;
>> +	}
>> +
>> +	if (cpus_offset > 0) {
>> +		ret = fdt_del_node(fdt, cpus_offset);
>> +		if (ret < 0) {
>> +			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	/* Add cpus node to fdt */
>> +	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
>> +	if (cpus_offset < 0) {
>> +		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Add cpus node properties */
>> +	cpus_node = of_find_node_by_path("/cpus");
>> +	ret = add_node_props(fdt, cpus_offset, cpus_node);
>> +	of_node_put(cpus_node);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Loop through all subnodes of cpus and add them to fdt */
>> +	for_each_node_by_type(dn, "cpu") {
>> +		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
>> +		if (cpus_subnode_offset < 0) {
>> +			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
>> +			       fdt_strerror(cpus_subnode_offset));
>> +			ret = cpus_subnode_offset;
>> +			goto out;
>> +		}
>> +
>> +		ret = add_node_props(fdt, cpus_subnode_offset, dn);
>> +		if (ret < 0)
>> +			goto out;
>> +	}
>> +out:
>> +	of_node_put(dn);
>> +	return ret;
>> +}
>> +
>>    #ifdef CONFIG_PPC_64S_HASH_MMU
>>    /* Values we need to export to the second kernel via the device tree. */
>>    static unsigned long htab_base;
>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>> index 110d28bede2a..5b0b3f61e0e7 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -133,81 +133,6 @@ static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>>    	return ret;
>>    }
>>    
>> -/**
>> - * get_crash_memory_ranges - Get crash memory ranges. This list includes
>> - *                           first/crashing kernel's memory regions that
>> - *                           would be exported via an elfcore.
>> - * @mem_ranges:              Range list to add the memory ranges to.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>> -{
>> -	phys_addr_t base, end;
>> -	struct crash_mem *tmem;
>> -	u64 i;
>> -	int ret;
>> -
>> -	for_each_mem_range(i, &base, &end) {
>> -		u64 size = end - base;
>> -
>> -		/* Skip backup memory region, which needs a separate entry */
>> -		if (base == BACKUP_SRC_START) {
>> -			if (size > BACKUP_SRC_SIZE) {
>> -				base = BACKUP_SRC_END + 1;
>> -				size -= BACKUP_SRC_SIZE;
>> -			} else
>> -				continue;
>> -		}
>> -
>> -		ret = add_mem_range(mem_ranges, base, size);
>> -		if (ret)
>> -			goto out;
>> -
>> -		/* Try merging adjacent ranges before reallocation attempt */
>> -		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
>> -			sort_memory_ranges(*mem_ranges, true);
>> -	}
>> -
>> -	/* Reallocate memory ranges if there is no space to split ranges */
>> -	tmem = *mem_ranges;
>> -	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> -		tmem = realloc_mem_ranges(mem_ranges);
>> -		if (!tmem)
>> -			goto out;
>> -	}
>> -
>> -	/* Exclude crashkernel region */
>> -	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>> -	if (ret)
>> -		goto out;
>> -
>> -	/*
>> -	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>> -	 *        regions are exported to save their context at the time of
>> -	 *        crash, they should actually be backed up just like the
>> -	 *        first 64K bytes of memory.
>> -	 */
>> -	ret = add_rtas_mem_range(mem_ranges);
>> -	if (ret)
>> -		goto out;
>> -
>> -	ret = add_opal_mem_range(mem_ranges);
>> -	if (ret)
>> -		goto out;
>> -
>> -	/* create a separate program header for the backup region */
>> -	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
>> -	if (ret)
>> -		goto out;
>> -
>> -	sort_memory_ranges(*mem_ranges, false);
>> -out:
>> -	if (ret)
>> -		pr_err("Failed to setup crash memory ranges\n");
>> -	return ret;
>> -}
>> -
>>    /**
>>     * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
>>     *                              memory regions that should be added to the
>> @@ -1018,93 +943,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>>    	return extra_size;
>>    }
>>    
>> -/**
>> - * add_node_props - Reads node properties from device node structure and add
>> - *                  them to fdt.
>> - * @fdt:            Flattened device tree of the kernel
>> - * @node_offset:    offset of the node to add a property at
>> - * @dn:             device node pointer
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
>> -{
>> -	int ret = 0;
>> -	struct property *pp;
>> -
>> -	if (!dn)
>> -		return -EINVAL;
>> -
>> -	for_each_property_of_node(dn, pp) {
>> -		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
>> -		if (ret < 0) {
>> -			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
>> -			return ret;
>> -		}
>> -	}
>> -	return ret;
>> -}
>> -
>> -/**
>> - * update_cpus_node - Update cpus node of flattened device tree using of_root
>> - *                    device node.
>> - * @fdt:              Flattened device tree of the kernel.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int update_cpus_node(void *fdt)
>> -{
>> -	struct device_node *cpus_node, *dn;
>> -	int cpus_offset, cpus_subnode_offset, ret = 0;
>> -
>> -	cpus_offset = fdt_path_offset(fdt, "/cpus");
>> -	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
>> -		pr_err("Malformed device tree: error reading /cpus node: %s\n",
>> -		       fdt_strerror(cpus_offset));
>> -		return cpus_offset;
>> -	}
>> -
>> -	if (cpus_offset > 0) {
>> -		ret = fdt_del_node(fdt, cpus_offset);
>> -		if (ret < 0) {
>> -			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
>> -			return -EINVAL;
>> -		}
>> -	}
>> -
>> -	/* Add cpus node to fdt */
>> -	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
>> -	if (cpus_offset < 0) {
>> -		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
>> -		return -EINVAL;
>> -	}
>> -
>> -	/* Add cpus node properties */
>> -	cpus_node = of_find_node_by_path("/cpus");
>> -	ret = add_node_props(fdt, cpus_offset, cpus_node);
>> -	of_node_put(cpus_node);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	/* Loop through all subnodes of cpus and add them to fdt */
>> -	for_each_node_by_type(dn, "cpu") {
>> -		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
>> -		if (cpus_subnode_offset < 0) {
>> -			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
>> -			       fdt_strerror(cpus_subnode_offset));
>> -			ret = cpus_subnode_offset;
>> -			goto out;
>> -		}
>> -
>> -		ret = add_node_props(fdt, cpus_subnode_offset, dn);
>> -		if (ret < 0)
>> -			goto out;
>> -	}
>> -out:
>> -	of_node_put(dn);
>> -	return ret;
>> -}
>> -
>>    static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
>>    			 const char *propname)
>>    {

