Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53728C93B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 09:28:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9RwL1pVFzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 18:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9RtF3xKQzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 18:26:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C9Rt20RnVz9ty2y;
 Tue, 13 Oct 2020 09:26:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q8TQQma3hDCz; Tue, 13 Oct 2020 09:26:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C9Rt167Kgz9ty2x;
 Tue, 13 Oct 2020 09:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 651348B7A2;
 Tue, 13 Oct 2020 09:26:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FSV7VUvim1I2; Tue, 13 Oct 2020 09:26:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BC918B79A;
 Tue, 13 Oct 2020 09:26:01 +0200 (CEST)
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
 <875z7ea8t7.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cb22e9a8-4a8c-38d9-66f1-24af5ebd7520@csgroup.eu>
Date: Tue, 13 Oct 2020 09:25:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <875z7ea8t7.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/10/2020 à 09:23, Aneesh Kumar K.V a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> CPU_FTR_NODSISRALIGN has not been used since
>> commit 31bfdb036f12 ("powerpc: Use instruction emulation
>> infrastructure to handle alignment faults")
>>
>> Remove it.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/cputable.h | 22 ++++++++++------------
>>   arch/powerpc/kernel/dt_cpu_ftrs.c   |  8 --------
>>   arch/powerpc/kernel/prom.c          |  2 +-
>>   3 files changed, 11 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>> index 9780c55f9811..accdc1286f37 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -137,7 +137,6 @@ static inline void cpu_feature_keys_init(void) { }
>>   #define CPU_FTR_DBELL			ASM_CONST(0x00000004)
>>   #define CPU_FTR_CAN_NAP			ASM_CONST(0x00000008)
>>   #define CPU_FTR_DEBUG_LVL_EXC		ASM_CONST(0x00000010)
>> -#define CPU_FTR_NODSISRALIGN		ASM_CONST(0x00000020)
>>   #define CPU_FTR_FPU_UNAVAILABLE		ASM_CONST(0x00000040)
>>   #define CPU_FTR_LWSYNC			ASM_CONST(0x00000080)
>>   #define CPU_FTR_NOEXECUTE		ASM_CONST(0x00000100)
>> @@ -219,7 +218,7 @@ static inline void cpu_feature_keys_init(void) { }
>>   
>>   #ifndef __ASSEMBLY__
>>   
>> -#define CPU_FTR_PPCAS_ARCH_V2	(CPU_FTR_NOEXECUTE | CPU_FTR_NODSISRALIGN)
>> +#define CPU_FTR_PPCAS_ARCH_V2	(CPU_FTR_NOEXECUTE)
>>   
>>   #define MMU_FTR_PPCAS_ARCH_V2 	(MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE)
>>   
>> @@ -378,33 +377,33 @@ static inline void cpu_feature_keys_init(void) { }
>>   	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NOEXECUTE)
>>   #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
>>   #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
>> -#define CPU_FTRS_40X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
>> -#define CPU_FTRS_44X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
>> -#define CPU_FTRS_440x6	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE | \
>> +#define CPU_FTRS_40X	(CPU_FTR_NOEXECUTE)
>> +#define CPU_FTRS_44X	(CPU_FTR_NOEXECUTE)
>> +#define CPU_FTRS_440x6	(CPU_FTR_NOEXECUTE | \
>>   	    CPU_FTR_INDEXED_DCR)
>>   #define CPU_FTRS_47X	(CPU_FTRS_440x6)
>>   #define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
>> -	    CPU_FTR_NODSISRALIGN | CPU_FTR_COHERENT_ICACHE | \
>> +	    CPU_FTR_COHERENT_ICACHE | \
>>   	    CPU_FTR_NOEXECUTE | \
>>   	    CPU_FTR_DEBUG_LVL_EXC)
>>   #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
>> -	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_NODSISRALIGN | \
>> +	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
>>   	    CPU_FTR_NOEXECUTE)
>>   #define CPU_FTRS_E500_2	(CPU_FTR_MAYBE_CAN_DOZE | \
>>   	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
>> -	    CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
>> -#define CPU_FTRS_E500MC	(CPU_FTR_NODSISRALIGN | \
>> +	    CPU_FTR_NOEXECUTE)
>> +#define CPU_FTRS_E500MC	( \
>>   	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>>   	    CPU_FTR_DBELL | CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV)
>>   /*
>>    * e5500/e6500 erratum A-006958 is a timebase bug that can use the
>>    * same workaround as CPU_FTR_CELL_TB_BUG.
>>    */
>> -#define CPU_FTRS_E5500	(CPU_FTR_NODSISRALIGN | \
>> +#define CPU_FTRS_E5500	( \
>>   	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>>   	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
>>   	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_CELL_TB_BUG)
>> -#define CPU_FTRS_E6500	(CPU_FTR_NODSISRALIGN | \
>> +#define CPU_FTRS_E6500	( \
>>   	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>>   	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
>>   	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_ALTIVEC_COMP | \
>> @@ -554,7 +553,6 @@ enum {
>>   #define CPU_FTRS_DT_CPU_BASE			\
>>   	(CPU_FTR_LWSYNC |			\
>>   	 CPU_FTR_FPU_UNAVAILABLE |		\
>> -	 CPU_FTR_NODSISRALIGN |			\
>>   	 CPU_FTR_NOEXECUTE |			\
>>   	 CPU_FTR_COHERENT_ICACHE |		\
>>   	 CPU_FTR_STCX_CHECKS_ADDRESS |		\
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index 1098863e17ee..c598961d9f15 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -273,13 +273,6 @@ static int __init feat_enable_idle_nap(struct dt_cpu_feature *f)
>>   	return 1;
>>   }
>>   
>> -static int __init feat_enable_align_dsisr(struct dt_cpu_feature *f)
>> -{
>> -	cur_cpu_spec->cpu_features &= ~CPU_FTR_NODSISRALIGN;
>> -
>> -	return 1;
>> -}
>> -
>>   static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
>>   {
>>   	u64 lpcr;
>> @@ -641,7 +634,6 @@ static struct dt_cpu_feature_match __initdata
>>   	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIST},
>>   	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
>>   	{"idle-nap", feat_enable_idle_nap, 0},
>> -	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
>>   	{"idle-stop", feat_enable_idle_stop, 0},
>>   	{"machine-check-power8", feat_enable_mce_power8, 0},
>>   	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index c1545f22c077..a5a5acb627fe 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -165,7 +165,7 @@ static struct ibm_pa_feature {
>>   #ifdef CONFIG_PPC_RADIX_MMU
>>   	{ .pabyte = 40, .pabit = 0, .mmu_features  = MMU_FTR_TYPE_RADIX | MMU_FTR_GTSE },
>>   #endif
>> -	{ .pabyte = 1,  .pabit = 1, .invert = 1, .cpu_features = CPU_FTR_NODSISRALIGN },
>> +	{ .pabyte = 1,  .pabit = 1, .invert = 1, },
>>   	{ .pabyte = 5,  .pabit = 0, .cpu_features  = CPU_FTR_REAL_LE,
>>   				    .cpu_user_ftrs = PPC_FEATURE_TRUE_LE },
> 
> I didn't follow this change. Should the line be dropped?
> 

Don't know. I have to look closer, I don't know what it is used for.

Christophe
