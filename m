Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C784AE39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 06:55:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvXGsM/z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTXXp5tmwz3cN9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 16:55:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvXGsM/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTXX03hMvz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 16:54:56 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4164mG62032726;
	Tue, 6 Feb 2024 05:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=K/rE5GczZn35+EI1Ig5WvAKiv6r+8shRKoDp1po9RBs=;
 b=VvXGsM/zQPt/x7B7jHzDBEg4HAeDFR5hk9O+bjPbJbhmnTrgfLQR5c4n13/twqsCJ0xT
 bygUE+6UcTVbCnPKVqQDzl1N2PfrOQd26rYgwYY+lRcwtP8hxWyVaYUce094CFP5rFyT
 4R8eMsLPAaeuIZ7GQvih/1vFpO4m4SC9JH+3CwDrsTScFKUPP2c/HG8JAs1dxnCkVwWj
 dSKo+pHxynfxuLUgBdVMlEMdAvSSEEFt13bUXPUASckBhkpMjRkeExtLsn+pRgnHj34D
 5xIC2ocyIJG+waVJyd4FlLgDVAqrSva6BBdPiI5+Ok4EU4TRcnHvkpsdpI7ClAwHR6UC cQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w3e2c970n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:54:46 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41636n3e005756;
	Tue, 6 Feb 2024 05:54:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w21akd0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:54:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4165shVW655930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Feb 2024 05:54:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A700620043;
	Tue,  6 Feb 2024 05:54:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0FD620040;
	Tue,  6 Feb 2024 05:54:42 +0000 (GMT)
Received: from [9.179.0.168] (unknown [9.179.0.168])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Feb 2024 05:54:42 +0000 (GMT)
Message-ID: <5306f4b2-5f94-4253-95b2-9da6d01be59d@linux.ibm.com>
Date: Tue, 6 Feb 2024 11:24:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc: Add Power11 architected and raw mode
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, mpe@ellerman.id.au
References: <20240205075808.174477-1-maddy@linux.ibm.com>
 <8734u7b8td.fsf@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <8734u7b8td.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GPpPaHT-glOVMFlEofaed9Ml1begZlHB
X-Proofpoint-ORIG-GUID: GPpPaHT-glOVMFlEofaed9Ml1begZlHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402060039
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/5/24 2:13 PM, Aneesh Kumar K.V wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>
>> reg.h is updated with Power11 pvr. pvr_mask value of 0x0F000007
>> means we are arch v3.1 compliant.
>>
> If it is called arch v3.1, it will conflict with.
>
>
> #define PVR_ARCH_31	0x0f000006

Nice catch. My bad, missed to include a macro for new logical PVR in the 
patch. Will fix it

>
>> This is used by phyp and
>> kvm when booting as a pseries guest to detect and enable
>> the appropriate hwcap, facility bits and PMU related fields.
>> Copied most of fields from Power10 table entry and added relevant
>> Power11 setup/restore and device tree routines.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Changelog v1:
>> - no change in this patch.
>>
>>   arch/powerpc/include/asm/cpu_setup.h      |  2 ++
>>   arch/powerpc/include/asm/cputable.h       |  3 ++
>>   arch/powerpc/include/asm/mce.h            |  1 +
>>   arch/powerpc/include/asm/mmu.h            |  1 +
>>   arch/powerpc/include/asm/reg.h            |  1 +
>>   arch/powerpc/kernel/cpu_setup_power.c     | 10 +++++++
>>   arch/powerpc/kernel/cpu_specs_book3s_64.h | 34 +++++++++++++++++++++++
>>   arch/powerpc/kernel/dt_cpu_ftrs.c         | 15 ++++++++++
>>   arch/powerpc/kernel/mce_power.c           |  5 ++++
>>   arch/powerpc/kernel/prom_init.c           | 10 ++++++-
>>   10 files changed, 81 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/cpu_setup.h b/arch/powerpc/include/asm/cpu_setup.h
>> index 30e2fe389502..ce800650bb8b 100644
>> --- a/arch/powerpc/include/asm/cpu_setup.h
>> +++ b/arch/powerpc/include/asm/cpu_setup.h
>> @@ -9,10 +9,12 @@ void __setup_cpu_power7(unsigned long offset, struct cpu_spec *spec);
>>   void __setup_cpu_power8(unsigned long offset, struct cpu_spec *spec);
>>   void __setup_cpu_power9(unsigned long offset, struct cpu_spec *spec);
>>   void __setup_cpu_power10(unsigned long offset, struct cpu_spec *spec);
>> +void __setup_cpu_power11(unsigned long offset, struct cpu_spec *spec);
>>   void __restore_cpu_power7(void);
>>   void __restore_cpu_power8(void);
>>   void __restore_cpu_power9(void);
>>   void __restore_cpu_power10(void);
>> +void __restore_cpu_power11(void);
>>   
>>   void __setup_cpu_e500v1(unsigned long offset, struct cpu_spec *spec);
>>   void __setup_cpu_e500v2(unsigned long offset, struct cpu_spec *spec);
>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>> index 8765d5158324..3bd6e6e0224c 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -454,6 +454,9 @@ static inline void cpu_feature_keys_init(void) { }
>>   	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
>>   	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
>>   	    CPU_FTR_DEXCR_NPHIE)
>> +
>> +#define CPU_FTRS_POWER11	CPU_FTRS_POWER10
>>
> One of the problem with that is we have code that does the below in kvm.
>
> 	if (cpu_has_feature(CPU_FTR_ARCH_31))
> 		host_pcr_bit = PCR_ARCH_31;
>
>
> How should we handle that?

This is my understanding and kindly advice if this assumption is wrong.
IIUC, we dont see different host_pcr_bit values for Power10 and Power11 
at this point,
but that said, if we see a change, we could add additional check with 
base pvr value to
differentiate the value to set right?

>
>> +
>>   #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
>>   	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>>   	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index c9f0936bd3c9..241eee743fc5 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -257,6 +257,7 @@ long __machine_check_early_realmode_p7(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p8(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p9(struct pt_regs *regs);
>>   long __machine_check_early_realmode_p10(struct pt_regs *regs);
>> +long __machine_check_early_realmode_p11(struct pt_regs *regs);
>>   #endif /* CONFIG_PPC_BOOK3S_64 */
>>   
>>   #ifdef CONFIG_PPC_BOOK3S_64
>> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
>> index d8b7e246a32f..61ebe5eff2c9 100644
>> --- a/arch/powerpc/include/asm/mmu.h
>> +++ b/arch/powerpc/include/asm/mmu.h
>> @@ -133,6 +133,7 @@
>>   #define MMU_FTRS_POWER8		MMU_FTRS_POWER6
>>   #define MMU_FTRS_POWER9		MMU_FTRS_POWER6
>>   #define MMU_FTRS_POWER10	MMU_FTRS_POWER6
>> +#define MMU_FTRS_POWER11	MMU_FTRS_POWER6
>>   #define MMU_FTRS_CELL		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
>>   				MMU_FTR_CI_LARGE_PAGE
>>   #define MMU_FTRS_PA6T		MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
>> index 7fd09f25452d..7a7aa24bf57a 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1364,6 +1364,7 @@
>>   #define PVR_HX_C2000	0x0066
>>   #define PVR_POWER9	0x004E
>>   #define PVR_POWER10	0x0080
>> +#define PVR_POWER11	0x0082
>>   #define PVR_BE		0x0070
>>   #define PVR_PA6T	0x0090
>>   
>> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
>> index 98bd4e6c1770..8c24fc67d90f 100644
>> --- a/arch/powerpc/kernel/cpu_setup_power.c
>> +++ b/arch/powerpc/kernel/cpu_setup_power.c
>> @@ -286,3 +286,13 @@ void __restore_cpu_power10(void)
>>   	init_HFSCR();
>>   	init_PMU_HV();
>>   }
>> +
>> +void __setup_cpu_power11(unsigned long offset, struct cpu_spec *t)
>> +{
>> +	return __setup_cpu_power10(offset, t);
>> +}
>> +
>> +void __restore_cpu_power11(void)
>> +{
>> +	return __restore_cpu_power10();
>> +}
>>
> Do we need to duplicate these functions if they don't add anything
> extra?

What will be the preference in case of macros? Should we re-use
power10 macros in the table instead of defining new macros.

Maddy

>
>> diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> index 3ff9757df4c0..886fdfc7d05f 100644
>> --- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> +++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> @@ -60,6 +60,9 @@
>>   				 PPC_FEATURE2_ISEL | PPC_FEATURE2_TAR | \
>>   				 PPC_FEATURE2_VEC_CRYPTO)
>>   
>> +#define COMMON_USER_POWER11	COMMON_USER_POWER10
>> +#define COMMON_USER2_POWER11	COMMON_USER2_POWER10
>> +
>>   static struct cpu_spec cpu_specs[] __initdata = {
>>   	{	/* PPC970 */
>>   		.pvr_mask		= 0xffff0000,
>> @@ -281,6 +284,20 @@ static struct cpu_spec cpu_specs[] __initdata = {
>>   		.cpu_restore		= __restore_cpu_power10,
>>   		.platform		= "power10",
>>   	},
>> +	{	/* 3.1-compliant processor, i.e. Power11 "architected" mode */
>> +		.pvr_mask		= 0xffffffff,
>> +		.pvr_value		= 0x0f000007,
>> +		.cpu_name		= "Power11 (architected)",
>> +		.cpu_features		= CPU_FTRS_POWER11,
>> +		.cpu_user_features	= COMMON_USER_POWER11,
>> +		.cpu_user_features2	= COMMON_USER2_POWER11,
>> +		.mmu_features		= MMU_FTRS_POWER11,
>> +		.icache_bsize		= 128,
>> +		.dcache_bsize		= 128,
>> +		.cpu_setup		= __setup_cpu_power11,
>> +		.cpu_restore		= __restore_cpu_power11,
>> +		.platform		= "power11",
>> +	},
>>   	{	/* Power7 */
>>   		.pvr_mask		= 0xffff0000,
>>   		.pvr_value		= 0x003f0000,
>> @@ -451,6 +468,23 @@ static struct cpu_spec cpu_specs[] __initdata = {
>>   		.machine_check_early	= __machine_check_early_realmode_p10,
>>   		.platform		= "power10",
>>   	},
>> +	{	/* Power11 */
>> +		.pvr_mask		= 0xffff0000,
>> +		.pvr_value		= 0x00820000,
>> +		.cpu_name		= "Power11 (raw)",
>> +		.cpu_features		= CPU_FTRS_POWER11,
>> +		.cpu_user_features	= COMMON_USER_POWER11,
>> +		.cpu_user_features2	= COMMON_USER2_POWER11,
>> +		.mmu_features		= MMU_FTRS_POWER11,
>> +		.icache_bsize		= 128,
>> +		.dcache_bsize		= 128,
>> +		.num_pmcs		= 6,
>> +		.pmc_type		= PPC_PMC_IBM,
>> +		.cpu_setup		= __setup_cpu_power11,
>> +		.cpu_restore		= __restore_cpu_power11,
>> +		.machine_check_early	= __machine_check_early_realmode_p11,
>> +		.platform		= "power11",
>> +	},
>>   	{	/* Cell Broadband Engine */
>>   		.pvr_mask		= 0xffff0000,
>>   		.pvr_value		= 0x00700000,
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index c3fb9fdf5bd7..2b64dafa268f 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -450,6 +450,11 @@ static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
>>   	return 1;
>>   }
>>   
>> +static int __init feat_enable_pmu_power11(struct dt_cpu_feature *f)
>> +{
>> +	return feat_enable_pmu_power10(f);
>> +}
>> +
>>   static int __init feat_enable_mce_power10(struct dt_cpu_feature *f)
>>   {
>>   	cur_cpu_spec->platform = "power10";
>> @@ -458,6 +463,14 @@ static int __init feat_enable_mce_power10(struct dt_cpu_feature *f)
>>   	return 1;
>>   }
>>   
>> +static int __init feat_enable_mce_power11(struct dt_cpu_feature *f)
>> +{
>> +	cur_cpu_spec->platform = "power11";
>> +	cur_cpu_spec->machine_check_early = __machine_check_early_realmode_p11;
>> +
>> +	return 1;
>> +}
>> +
>>   static int __init feat_enable_tm(struct dt_cpu_feature *f)
>>   {
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> @@ -648,8 +661,10 @@ static struct dt_cpu_feature_match __initdata
>>   	{"pc-relative-addressing", feat_enable, 0},
>>   	{"machine-check-power9", feat_enable_mce_power9, 0},
>>   	{"machine-check-power10", feat_enable_mce_power10, 0},
>> +	{"machine-check-power11", feat_enable_mce_power11, 0},
>>   	{"performance-monitor-power9", feat_enable_pmu_power9, 0},
>>   	{"performance-monitor-power10", feat_enable_pmu_power10, 0},
>> +	{"performance-monitor-power11", feat_enable_pmu_power11, 0},
>>   	{"event-based-branch-v3", feat_enable, 0},
>>   	{"random-number-generator", feat_enable, 0},
>>   	{"system-call-vectored", feat_disable, 0},
>> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
>> index 71e8f2a92e36..11f69bb402e7 100644
>> --- a/arch/powerpc/kernel/mce_power.c
>> +++ b/arch/powerpc/kernel/mce_power.c
>> @@ -789,3 +789,8 @@ long __machine_check_early_realmode_p10(struct pt_regs *regs)
>>   	return mce_handle_error(regs, srr1,
>>   			mce_p10_derror_table, mce_p10_ierror_table);
>>   }
>> +
>> +long __machine_check_early_realmode_p11(struct pt_regs *regs)
>> +{
>> +	return __machine_check_early_realmode_p10(regs);
>> +}
>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>> index e67effdba85c..895a3441223b 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -947,7 +947,7 @@ struct option_vector7 {
>>   } __packed;
>>   
>>   struct ibm_arch_vec {
>> -	struct { __be32 mask, val; } pvrs[14];
>> +	struct { __be32 mask, val; } pvrs[16];
>>   
>>   	u8 num_vectors;
>>   
>> @@ -1007,6 +1007,14 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
>>   			.mask = cpu_to_be32(0xffff0000), /* POWER10 */
>>   			.val  = cpu_to_be32(0x00800000),
>>   		},
>> +		{
>> +			.mask = cpu_to_be32(0xffff0000), /* POWER11 */
>> +			.val  = cpu_to_be32(0x00820000),
>> +		},
>> +		{
>> +			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
>> +			.val  = cpu_to_be32(0x0f000007),
>> +		},
>>   		{
>>   			.mask = cpu_to_be32(0xffffffff), /* all 3.1-compliant */
>>   			.val  = cpu_to_be32(0x0f000006),
>> -- 
>> 2.43.0
