Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 668BE1B6321
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 20:17:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497QX2472dzDr3j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 04:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497QTT2XlqzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 04:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 497QTT0vgyz8sny
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 04:15:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 497QTT0TSwz9sSJ; Fri, 24 Apr 2020 04:15:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 497QTS4CpCz9sSG
 for <linuxppc-dev@ozlabs.org>; Fri, 24 Apr 2020 04:15:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NI1wmG118103; Thu, 23 Apr 2020 14:15:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc62mp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 14:15:33 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03NI2cmQ120063;
 Thu, 23 Apr 2020 14:15:33 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc62mna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 14:15:33 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03NIEZKV003340;
 Thu, 23 Apr 2020 18:15:32 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 30fs67ecft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 18:15:32 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NIFUKj59441528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 18:15:30 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B39E13607D;
 Thu, 23 Apr 2020 18:15:30 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACED6136053;
 Thu, 23 Apr 2020 18:15:29 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.36.226])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 18:15:29 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E98C92E3026; Thu, 23 Apr 2020 23:45:23 +0530 (IST)
Date: Thu, 23 Apr 2020 23:45:23 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v8 1/1] powerpc/powernv: Introduce support and parsing
 for self-save API
Message-ID: <20200423181523.GA15514@in.ibm.com>
References: <20200423105557.29108-1-psampat@linux.ibm.com>
 <20200423105557.29108-2-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423105557.29108-2-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_13:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230137
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 23, 2020 at 04:25:57PM +0530, Pratik Rajesh Sampat wrote:
> This commit introduces and leverages the Self save API. The difference
> between self-save and self-restore is that the value to be saved for the
> SPR does not need to be passed to the call.
> 
> Add the new Self Save OPAL API call in the list of OPAL calls.
> 
> The device tree is parsed looking for the property "ibm,opal-self-save"
> If self-save is supported then for all SPRs self-save is invoked for all
> P9 supported registers. In the case self-save fails corresponding
> self-restore call is invoked as a fallback.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>




A suggestion from the bisectability point of view though.

Since in this patch you are also invoking self_save API for a new SPR,
namely PTCR which was previously not present, I would suggest that you
move the PTCR changes to a different patch.

Otherwise, the patchset looks good to me

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/include/asm/opal-api.h        |  3 +-
>  arch/powerpc/include/asm/opal.h            |  1 +
>  arch/powerpc/platforms/powernv/idle.c      | 73 ++++++++++++++++++----
>  arch/powerpc/platforms/powernv/opal-call.c |  1 +
>  4 files changed, 64 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 1dffa3cb16ba..7ba698369083 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -214,7 +214,8 @@
>  #define OPAL_SECVAR_GET				176
>  #define OPAL_SECVAR_GET_NEXT			177
>  #define OPAL_SECVAR_ENQUEUE_UPDATE		178
> -#define OPAL_LAST				178
> +#define OPAL_SLW_SELF_SAVE_REG			181
> +#define OPAL_LAST				181
> 
>  #define QUIESCE_HOLD			1 /* Spin all calls at entry */
>  #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 9986ac34b8e2..a370b0e8d899 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -204,6 +204,7 @@ int64_t opal_handle_hmi2(__be64 *out_flags);
>  int64_t opal_register_dump_region(uint32_t id, uint64_t start, uint64_t end);
>  int64_t opal_unregister_dump_region(uint32_t id);
>  int64_t opal_slw_set_reg(uint64_t cpu_pir, uint64_t sprn, uint64_t val);
> +int64_t opal_slw_self_save_reg(uint64_t cpu_pir, uint64_t sprn);
>  int64_t opal_config_cpu_idle_state(uint64_t state, uint64_t flag);
>  int64_t opal_pci_set_phb_cxl_mode(uint64_t phb_id, uint64_t mode, uint64_t pe_number);
>  int64_t opal_pci_get_pbcq_tunnel_bar(uint64_t phb_id, uint64_t *addr);
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 78599bca66c2..ada7ece24521 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -32,6 +32,11 @@
>  #define P9_STOP_SPR_MSR 2000
>  #define P9_STOP_SPR_PSSCR      855
> 
> +/* Caching the self-save functionality, lpcr, ptcr support */
> +DEFINE_STATIC_KEY_FALSE(self_save_available);
> +DEFINE_STATIC_KEY_FALSE(is_lpcr_self_save);
> +DEFINE_STATIC_KEY_FALSE(is_ptcr_self_save);
> +
>  static u32 supported_cpuidle_states;
>  struct pnv_idle_states_t *pnv_idle_states;
>  int nr_pnv_idle_states;
> @@ -61,6 +66,35 @@ static bool deepest_stop_found;
> 
>  static unsigned long power7_offline_type;
> 
> +/*
> + * Cache support for SPRs that support self-save as well as kernel save restore
> + * so that kernel does not duplicate efforts in saving and restoring SPRs
> + */
> +static void cache_spr_self_save_support(u64 sprn)
> +{
> +	switch (sprn) {
> +	case SPRN_LPCR:
> +		static_branch_enable(&is_lpcr_self_save);
> +		break;
> +	case SPRN_PTCR:
> +		static_branch_enable(&is_ptcr_self_save);
> +		break;
> +	}
> +}
> +
> +static int pnv_save_one_spr(u64 pir, u64 sprn, u64 val)
> +{
> +	if (static_branch_likely(&self_save_available)) {
> +		int rc = opal_slw_self_save_reg(pir, sprn);
> +
> +		if (!rc) {
> +			cache_spr_self_save_support(sprn);
> +			return rc;
> +		}
> +	}
> +	return opal_slw_set_reg(pir, sprn, val);
> +}
> +
>  static int pnv_save_sprs_for_deep_states(void)
>  {
>  	int cpu;
> @@ -72,6 +106,7 @@ static int pnv_save_sprs_for_deep_states(void)
>  	 * same across all cpus.
>  	 */
>  	uint64_t lpcr_val	= mfspr(SPRN_LPCR);
> +	uint64_t ptcr_val	= mfspr(SPRN_PTCR);
>  	uint64_t hid0_val	= mfspr(SPRN_HID0);
>  	uint64_t hid1_val	= mfspr(SPRN_HID1);
>  	uint64_t hid4_val	= mfspr(SPRN_HID4);
> @@ -84,30 +119,34 @@ static int pnv_save_sprs_for_deep_states(void)
>  		uint64_t pir = get_hard_smp_processor_id(cpu);
>  		uint64_t hsprg0_val = (uint64_t)paca_ptrs[cpu];
> 
> -		rc = opal_slw_set_reg(pir, SPRN_HSPRG0, hsprg0_val);
> +		rc = pnv_save_one_spr(pir, SPRN_HSPRG0, hsprg0_val);
>  		if (rc != 0)
>  			return rc;
> 
> -		rc = opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
> +		rc = pnv_save_one_spr(pir, SPRN_LPCR, lpcr_val);
>  		if (rc != 0)
>  			return rc;
> 
> +		/*
> +		 * No need to check for failure, if firmware fails to save then
> +		 * kernel handles save-restore for PTCR
> +		 */
> +		pnv_save_one_spr(pir, SPRN_PTCR, ptcr_val);
> +
>  		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> -			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, msr_val);
> +			rc = pnv_save_one_spr(pir, P9_STOP_SPR_MSR, msr_val);
>  			if (rc)
>  				return rc;
> 
> -			rc = opal_slw_set_reg(pir,
> +			rc = pnv_save_one_spr(pir,
>  					      P9_STOP_SPR_PSSCR, psscr_val);
> -
>  			if (rc)
>  				return rc;
>  		}
> 
>  		/* HIDs are per core registers */
>  		if (cpu_thread_in_core(cpu) == 0) {
> -
> -			rc = opal_slw_set_reg(pir, SPRN_HMEER, hmeer_val);
> +			rc = pnv_save_one_spr(pir, SPRN_HMEER, hmeer_val);
>  			if (rc != 0)
>  				return rc;
> 
> @@ -658,7 +697,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		mmcr0		= mfspr(SPRN_MMCR0);
>  	}
>  	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
> -		sprs.lpcr	= mfspr(SPRN_LPCR);
> +		if (!static_branch_unlikely(&is_lpcr_self_save))
> +			sprs.lpcr	= mfspr(SPRN_LPCR);
>  		sprs.hfscr	= mfspr(SPRN_HFSCR);
>  		sprs.fscr	= mfspr(SPRN_FSCR);
>  		sprs.pid	= mfspr(SPRN_PID);
> @@ -672,7 +712,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		sprs.mmcr1	= mfspr(SPRN_MMCR1);
>  		sprs.mmcr2	= mfspr(SPRN_MMCR2);
> 
> -		sprs.ptcr	= mfspr(SPRN_PTCR);
> +		if (!static_branch_unlikely(&is_ptcr_self_save))
> +			sprs.ptcr	= mfspr(SPRN_PTCR);
>  		sprs.rpr	= mfspr(SPRN_RPR);
>  		sprs.tscr	= mfspr(SPRN_TSCR);
>  		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> @@ -756,7 +797,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		goto core_woken;
> 
>  	/* Per-core SPRs */
> -	mtspr(SPRN_PTCR,	sprs.ptcr);
> +	if (!static_branch_unlikely(&is_ptcr_self_save))
> +		mtspr(SPRN_PTCR,	sprs.ptcr);
>  	mtspr(SPRN_RPR,		sprs.rpr);
>  	mtspr(SPRN_TSCR,	sprs.tscr);
> 
> @@ -777,7 +819,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	atomic_unlock_and_stop_thread_idle();
> 
>  	/* Per-thread SPRs */
> -	mtspr(SPRN_LPCR,	sprs.lpcr);
> +	if (!static_branch_unlikely(&is_lpcr_self_save))
> +		mtspr(SPRN_LPCR,	sprs.lpcr);
>  	mtspr(SPRN_HFSCR,	sprs.hfscr);
>  	mtspr(SPRN_FSCR,	sprs.fscr);
>  	mtspr(SPRN_PID,		sprs.pid);
> @@ -956,8 +999,10 @@ void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
>  	 * Program the LPCR via stop-api only if the deepest stop state
>  	 * can lose hypervisor context.
>  	 */
> -	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT)
> -		opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
> +	if (supported_cpuidle_states & OPAL_PM_LOSE_FULL_CONTEXT) {
> +		if (!static_branch_unlikely(&is_lpcr_self_save))
> +			opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
> +	}
>  }
> 
>  /*
> @@ -1298,6 +1343,8 @@ static int pnv_parse_cpuidle_dt(void)
>  		}
>  		for (i = 0; i < nr_idle_states; i++)
>  			pnv_idle_states[i].psscr_mask = temp_u64[i];
> +		if (of_property_read_bool(np, "ibm,opal-self-save"))
> +			static_branch_enable(&self_save_available);
>  	}
> 
>  	/*
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 5cd0f52d258f..11e0ceb90de0 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -223,6 +223,7 @@ OPAL_CALL(opal_handle_hmi,			OPAL_HANDLE_HMI);
>  OPAL_CALL(opal_handle_hmi2,			OPAL_HANDLE_HMI2);
>  OPAL_CALL(opal_config_cpu_idle_state,		OPAL_CONFIG_CPU_IDLE_STATE);
>  OPAL_CALL(opal_slw_set_reg,			OPAL_SLW_SET_REG);
> +OPAL_CALL(opal_slw_self_save_reg,		OPAL_SLW_SELF_SAVE_REG);
>  OPAL_CALL(opal_register_dump_region,		OPAL_REGISTER_DUMP_REGION);
>  OPAL_CALL(opal_unregister_dump_region,		OPAL_UNREGISTER_DUMP_REGION);
>  OPAL_CALL(opal_pci_set_phb_cxl_mode,		OPAL_PCI_SET_PHB_CAPI_MODE);
> -- 
> 2.17.1
> 
