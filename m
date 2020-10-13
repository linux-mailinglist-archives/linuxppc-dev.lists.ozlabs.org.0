Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566F28C931
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 09:25:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9RsM4KLjzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 18:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OqDeGs33; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9RqP4JlZzDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 18:23:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09D71fTx169223; Tue, 13 Oct 2020 03:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5UaQZMBySqSsjFYkUYym+oRHH2gxwdOJZpbtpDDfvGU=;
 b=OqDeGs33ftklJ5FxP3UlgyuTJ5t4V3XXlLDguiMXLYiIIfyBAzcJYmfUFucsEK5bdXYk
 1vrICIOJuRAKjFV5b8JG+lPGc1mIDTN0EieeaeI1aWO5rS1yyOthUMthsvueMXoPub4o
 tq5WkFqRy6mrhbT98Dx9HN+Umiv/tYUITy1Fx2ZNSAJkuslx5WfdCZgMgnockOvqjjsQ
 bkqbE/+7nvMGnQ8N/qWeeNFSqZ3LZ45pLBuqUwuLwjk/q6FNluZjpbCJrn9LzLuJmA7r
 bSK7GreeZ2koIt9qm6okZDNvNRwkyXnCZbA5mB7CBftfPe9YBkzCadJf4rnnc+QrV8rG PA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34578y10sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 03:23:24 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09D7McBP019579;
 Tue, 13 Oct 2020 07:23:24 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3434k9dntk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 07:23:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09D7NNjv48824682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Oct 2020 07:23:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18D01136055;
 Tue, 13 Oct 2020 07:23:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C1A413604F;
 Tue, 13 Oct 2020 07:23:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.218.16])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Oct 2020 07:23:19 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
In-Reply-To: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
References: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
Date: Tue, 13 Oct 2020 12:53:16 +0530
Message-ID: <875z7ea8t7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_02:2020-10-13,
 2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010130053
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> CPU_FTR_NODSISRALIGN has not been used since
> commit 31bfdb036f12 ("powerpc: Use instruction emulation
> infrastructure to handle alignment faults")
>
> Remove it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/cputable.h | 22 ++++++++++------------
>  arch/powerpc/kernel/dt_cpu_ftrs.c   |  8 --------
>  arch/powerpc/kernel/prom.c          |  2 +-
>  3 files changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index 9780c55f9811..accdc1286f37 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -137,7 +137,6 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_DBELL			ASM_CONST(0x00000004)
>  #define CPU_FTR_CAN_NAP			ASM_CONST(0x00000008)
>  #define CPU_FTR_DEBUG_LVL_EXC		ASM_CONST(0x00000010)
> -#define CPU_FTR_NODSISRALIGN		ASM_CONST(0x00000020)
>  #define CPU_FTR_FPU_UNAVAILABLE		ASM_CONST(0x00000040)
>  #define CPU_FTR_LWSYNC			ASM_CONST(0x00000080)
>  #define CPU_FTR_NOEXECUTE		ASM_CONST(0x00000100)
> @@ -219,7 +218,7 @@ static inline void cpu_feature_keys_init(void) { }
>  
>  #ifndef __ASSEMBLY__
>  
> -#define CPU_FTR_PPCAS_ARCH_V2	(CPU_FTR_NOEXECUTE | CPU_FTR_NODSISRALIGN)
> +#define CPU_FTR_PPCAS_ARCH_V2	(CPU_FTR_NOEXECUTE)
>  
>  #define MMU_FTR_PPCAS_ARCH_V2 	(MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE)
>  
> @@ -378,33 +377,33 @@ static inline void cpu_feature_keys_init(void) { }
>  	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NOEXECUTE)
>  #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
>  #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
> -#define CPU_FTRS_40X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
> -#define CPU_FTRS_44X	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
> -#define CPU_FTRS_440x6	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE | \
> +#define CPU_FTRS_40X	(CPU_FTR_NOEXECUTE)
> +#define CPU_FTRS_44X	(CPU_FTR_NOEXECUTE)
> +#define CPU_FTRS_440x6	(CPU_FTR_NOEXECUTE | \
>  	    CPU_FTR_INDEXED_DCR)
>  #define CPU_FTRS_47X	(CPU_FTRS_440x6)
>  #define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
> -	    CPU_FTR_NODSISRALIGN | CPU_FTR_COHERENT_ICACHE | \
> +	    CPU_FTR_COHERENT_ICACHE | \
>  	    CPU_FTR_NOEXECUTE | \
>  	    CPU_FTR_DEBUG_LVL_EXC)
>  #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
> -	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_NODSISRALIGN | \
> +	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
>  	    CPU_FTR_NOEXECUTE)
>  #define CPU_FTRS_E500_2	(CPU_FTR_MAYBE_CAN_DOZE | \
>  	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
> -	    CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE)
> -#define CPU_FTRS_E500MC	(CPU_FTR_NODSISRALIGN | \
> +	    CPU_FTR_NOEXECUTE)
> +#define CPU_FTRS_E500MC	( \
>  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>  	    CPU_FTR_DBELL | CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV)
>  /*
>   * e5500/e6500 erratum A-006958 is a timebase bug that can use the
>   * same workaround as CPU_FTR_CELL_TB_BUG.
>   */
> -#define CPU_FTRS_E5500	(CPU_FTR_NODSISRALIGN | \
> +#define CPU_FTRS_E5500	( \
>  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
>  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_CELL_TB_BUG)
> -#define CPU_FTRS_E6500	(CPU_FTR_NODSISRALIGN | \
> +#define CPU_FTRS_E6500	( \
>  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
>  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
>  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_ALTIVEC_COMP | \
> @@ -554,7 +553,6 @@ enum {
>  #define CPU_FTRS_DT_CPU_BASE			\
>  	(CPU_FTR_LWSYNC |			\
>  	 CPU_FTR_FPU_UNAVAILABLE |		\
> -	 CPU_FTR_NODSISRALIGN |			\
>  	 CPU_FTR_NOEXECUTE |			\
>  	 CPU_FTR_COHERENT_ICACHE |		\
>  	 CPU_FTR_STCX_CHECKS_ADDRESS |		\
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 1098863e17ee..c598961d9f15 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -273,13 +273,6 @@ static int __init feat_enable_idle_nap(struct dt_cpu_feature *f)
>  	return 1;
>  }
>  
> -static int __init feat_enable_align_dsisr(struct dt_cpu_feature *f)
> -{
> -	cur_cpu_spec->cpu_features &= ~CPU_FTR_NODSISRALIGN;
> -
> -	return 1;
> -}
> -
>  static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
>  {
>  	u64 lpcr;
> @@ -641,7 +634,6 @@ static struct dt_cpu_feature_match __initdata
>  	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIST},
>  	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
>  	{"idle-nap", feat_enable_idle_nap, 0},
> -	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
>  	{"idle-stop", feat_enable_idle_stop, 0},
>  	{"machine-check-power8", feat_enable_mce_power8, 0},
>  	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index c1545f22c077..a5a5acb627fe 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -165,7 +165,7 @@ static struct ibm_pa_feature {
>  #ifdef CONFIG_PPC_RADIX_MMU
>  	{ .pabyte = 40, .pabit = 0, .mmu_features  = MMU_FTR_TYPE_RADIX | MMU_FTR_GTSE },
>  #endif
> -	{ .pabyte = 1,  .pabit = 1, .invert = 1, .cpu_features = CPU_FTR_NODSISRALIGN },
> +	{ .pabyte = 1,  .pabit = 1, .invert = 1, },
>  	{ .pabyte = 5,  .pabit = 0, .cpu_features  = CPU_FTR_REAL_LE,
>  				    .cpu_user_ftrs = PPC_FEATURE_TRUE_LE },

I didn't follow this change. Should the line be dropped?

-aneesh
