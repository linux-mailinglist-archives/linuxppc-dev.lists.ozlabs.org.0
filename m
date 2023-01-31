Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A268330D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:53:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rhc62Lsz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 03:53:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfW6NYee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfW6NYee;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rgj0q11z3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:52:16 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VGFp0a017743;
	Tue, 31 Jan 2023 16:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4n8MyIdQwf8lXurw4fkxxKv88LvIqCvjwDBXGT/lB9w=;
 b=kfW6NYeej77Jq5gyPi4MP7IPvPsyLeaRkqCjURH0oEGlxCPH7UESjDsHPfLFLOjnzDyo
 02iT7wxkdckF1oNHdUXaz4hMs0Fau5k+R9Gyt7jInKvfpbWMu1gu5+0SqeI5FJFyKAsc
 Ii/34T8IKq4uzGJh8/RgRhyn8l2eA+iE3vGfW5Qo/eKM9hqSPMsoJVMDk43UdhJ69H51
 mVZhf2HLVyDrxT+wqfybvS6BQaX+U5GKsKWmpJ0jEHlDRw3biLt/wEdxC4cKFt52RZLF
 2x/YViAPavtlKyIIZzdm8RhXEDTHcb97j6L8JbtC5M8hKesGjdXR7oSyv/eUV67SoMR5 GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf6bvs2a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 16:52:10 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VGS2cQ007836;
	Tue, 31 Jan 2023 16:52:09 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf6bvs29n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 16:52:09 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VGe7jc008920;
	Tue, 31 Jan 2023 16:52:09 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ncvw2n8yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 16:52:09 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30VGq7Rb24379716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 16:52:07 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70BC05805A;
	Tue, 31 Jan 2023 16:52:07 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A6625803F;
	Tue, 31 Jan 2023 16:52:05 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 16:52:05 +0000 (GMT)
Message-ID: <6a56a427-1f38-d3d8-63e2-7ed67198c31d@linux.ibm.com>
Date: Tue, 31 Jan 2023 11:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 22/25] powerpc/pseries: Pass PLPKS password on kexec
Content-Language: en-US
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
References: <20230131063928.388035-1-ajd@linux.ibm.com>
 <20230131063928.388035-23-ajd@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230131063928.388035-23-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: asXG1Ov5dGaD8y8gvQ7DQB0bEurHFuEn
X-Proofpoint-ORIG-GUID: LFp8T5_Fs6meJ_TmUGtyJWc9aDrf6mZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310146
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/31/23 01:39, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> Before interacting with the PLPKS, we ask the hypervisor to generate a
> password for the current boot, which is then required for most further
> PLPKS operations.
> 
> If we kexec into a new kernel, the new kernel will try and fail to
> generate a new password, as the password has already been set.
> 
> Pass the password through to the new kernel via the device tree, in
> /chosen/ibm,plpks-pw. Check for the presence of this property before
> trying to generate a new password - if it exists, use the existing
> password and remove it from the device tree.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> ---
> 
> v3: New patch
> 
> v4: Fix compile when CONFIG_PSERIES_PLPKS=n (snowpatch)
> 
>      Fix error handling on fdt_path_offset() call (ruscur)
> 
> v5: Fix DT property name in commit message (npiggin)
> 
>      Clear prop in FDT during init to prevent password exposure (mpe)
> 
>      Rework to remove ifdefs from C code (npiggin)
> ---
>   arch/powerpc/include/asm/plpks.h       | 14 ++++++
>   arch/powerpc/kernel/prom.c             |  4 ++
>   arch/powerpc/kexec/file_load_64.c      | 15 +++++--
>   arch/powerpc/platforms/pseries/plpks.c | 60 ++++++++++++++++++++++++++
>   4 files changed, 90 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
> index 757313e00521..23b77027c916 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -176,6 +176,20 @@ u64 plpks_get_signedupdatealgorithms(void);
>    */
>   u16 plpks_get_passwordlen(void);
>   
> +/**
> + * Called in early init to retrieve and clear the PLPKS password from the DT.
> + */
> +void plpks_early_init_devtree(void);
> +
> +/**
> + * Populates the FDT with the PLPKS password to prepare for kexec.
> + */
> +int plpks_populate_fdt(void *fdt);
> +#else // CONFIG_PSERIES_PLPKS
> +static inline bool plpks_is_available(void) { return false; }
> +static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
> +static inline void plpks_early_init_devtree(void) { }
> +static inline int plpks_populate_fdt(void *fdt) { BUILD_BUG(); }
>   #endif // CONFIG_PSERIES_PLPKS
>   
>   #endif // _ASM_POWERPC_PLPKS_H
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 4f1c920aa13e..8a13b378770f 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -56,6 +56,7 @@
>   #include <asm/drmem.h>
>   #include <asm/ultravisor.h>
>   #include <asm/prom.h>
> +#include <asm/plpks.h>
>   
>   #include <mm/mmu_decl.h>
>   
> @@ -893,6 +894,9 @@ void __init early_init_devtree(void *params)
>   		powerpc_firmware_features |= FW_FEATURE_PS3_POSSIBLE;
>   #endif
>   
> +	/* If kexec left a PLPKS password in the DT, get it and clear it */
> +	plpks_early_init_devtree();
> +
>   	tm_init();
>   
>   	DBG(" <- early_init_devtree()\n");
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index af8854f9eae3..3f5740fb01a4 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -27,6 +27,7 @@
>   #include <asm/kexec_ranges.h>
>   #include <asm/crashdump-ppc64.h>
>   #include <asm/prom.h>
> +#include <asm/plpks.h>
>   
>   struct umem_info {
>   	u64 *buf;		/* data buffer for usable-memory property */
> @@ -977,12 +978,16 @@ static unsigned int cpu_node_size(void)
>    */
>   unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   {
> -	unsigned int cpu_nodes, extra_size;
> +	unsigned int cpu_nodes, extra_size = 0;
>   	struct device_node *dn;
>   	u64 usm_entries;
>   
> +	// Make room for the PLPKS password, plus node overhead for ibm,plpks-pw.
> +	if (plpks_is_available())
> +		extra_size += (unsigned int)plpks_get_passwordlen() + 32;

Is there nothing better than a '32'?
  
> +
>   	if (image->type != KEXEC_TYPE_CRASH)
> -		return 0;
> +		return extra_size;
>   
>   	/*
>   	 * For kdump kernel, account for linux,usable-memory and
> @@ -992,7 +997,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
>   		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>   
> -	extra_size = (unsigned int)(usm_entries * sizeof(u64));
> +	extra_size += (unsigned int)(usm_entries * sizeof(u64));
>   
>   	/*
>   	 * Get the number of CPU nodes in the current DT. This allows to
> @@ -1230,6 +1235,10 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>   		}
>   	}
>   
> +	// If we have PLPKS active, we need to provide the password to the new kernel
> +	if (plpks_is_available())
> +		ret = plpks_populate_fdt(fdt);
> +
>   out:
>   	kfree(rmem);
>   	kfree(umem);
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
> index 6940280ae94a..481a669845c5 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -16,6 +16,9 @@
>   #include <linux/slab.h>
>   #include <linux/string.h>
>   #include <linux/types.h>
> +#include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
> +#include <linux/memblock.h>
>   #include <asm/hvcall.h>
>   #include <asm/machdep.h>
>   #include <asm/plpks.h>
> @@ -128,6 +131,12 @@ static int plpks_gen_password(void)
>   	u8 *password, consumer = PLPKS_OS_OWNER;
>   	int rc;
>   
> +	// If we booted from kexec, we could be reusing an existing password already
> +	if (ospassword) {
> +		pr_debug("Password of length %u already in use\n", ospasswordlength);
> +		return 0;
> +	}
> +
>   	// The password must not cross a page boundary, so we align to the next power of 2
>   	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
>   	if (!password)
> @@ -621,6 +630,57 @@ int plpks_read_bootloader_var(struct plpks_var *var)
>   	return plpks_read_var(PLPKS_BOOTLOADER_OWNER, var);
>   }
>   
> +int plpks_populate_fdt(void *fdt)
> +{
> +	int chosen_offset = fdt_path_offset(fdt, "/chosen");

Newline here?
> +	if (chosen_offset < 0) {
> +		pr_err("Can't find chosen node: %s\n",
> +		       fdt_strerror(chosen_offset));
> +		return chosen_offset;
> +	}
> +
> +	return fdt_setprop(fdt, chosen_offset, "ibm,plpks-pw", ospassword, ospasswordlength);
> +}
> +
> +// Once a password is registered with the hypervisor it cannot be cleared without
> +// rebooting the LPAR, so to keep using the PLPKS across kexec boots we need to
> +// recover the previous password from the FDT.
> +//
> +// There are a few challenges here.  We don't want the password to be visible to
> +// users, so we need to clear it from the FDT.  This has to be done in early boot.
> +// Clearing it from the FDT would make the FDT's checksum invalid, so we have to
> +// manually cause the checksum to be recalculated.
> +void __init plpks_early_init_devtree(void)
> +{
> +	void *fdt = initial_boot_params;
> +	int chosen_node = fdt_path_offset(fdt, "/chosen");
> +	u8 *password;

const u8 *password ?

> +	int len;
> +
> +	if (chosen_node < 0)
> +		return;
> +
> +	password = (u8 *)fdt_getprop(fdt, chosen_node, "ibm,plpks-pw", &len);
> +	if (len <= 0) {
> +		pr_debug("Couldn't find ibm,plpks-pw node.\n");
> +		return;
> +	}
> +
> +	ospassword = memblock_alloc_raw(len, SMP_CACHE_BYTES);
> +	if (!ospassword) {
> +		pr_err("Error allocating memory for password.\n");

Also display 'len' here?

> +		goto out;
> +	}
> +
> +	memcpy(ospassword, password, len);
> +	ospasswordlength = (u16)len;
> +
> +out:
> +	fdt_nop_property(fdt, chosen_node, "ibm,plpks-pw");
> +	// Since we've cleared the password, we must update the FDT checksum
> +	early_init_dt_verify(fdt);
> +}
> +
>   static __init int pseries_plpks_init(void)
>   {
>   	int rc;
