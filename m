Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A2228F81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:04:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNgW2PPbzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:04:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBNQx4GyBzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:54:01 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M4ZESW115676; Wed, 22 Jul 2020 00:53:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vrm7h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 00:53:51 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M4bH8E127245;
 Wed, 22 Jul 2020 00:53:50 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vrm7gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 00:53:50 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M4jAhq016647;
 Wed, 22 Jul 2020 04:53:50 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 32brq9956e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:53:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M4rnrs36569406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 04:53:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786B0BE051;
 Wed, 22 Jul 2020 04:53:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB87BE058;
 Wed, 22 Jul 2020 04:53:48 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.82.72])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 04:53:48 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 307DA2E48A9; Wed, 22 Jul 2020 10:23:44 +0530 (IST)
Date: Wed, 22 Jul 2020 10:23:44 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] powerpc/powernv/idle: Rename
 pnv_first_spr_loss_level variable
Message-ID: <20200722045344.GA30454@in.ibm.com>
References: <20200721153708.89057-1-psampat@linux.ibm.com>
 <20200721153708.89057-3-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721153708.89057-3-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-21,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220031
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, pratik.r.sampat@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 09:07:07PM +0530, Pratik Rajesh Sampat wrote:
> Replace the variable name from using "pnv_first_spr_loss_level" to
> "deep_spr_loss_state".
> 
> pnv_first_spr_loss_level is supposed to be the earliest state that
> has OPAL_PM_LOSE_FULL_CONTEXT set, in other places the kernel uses the
> "deep" states as terminology. Hence renaming the variable to be coherent
> to its semantics.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

Acked-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/platforms/powernv/idle.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 642abf0b8329..28462d59a8e1 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -48,7 +48,7 @@ static bool default_stop_found;
>   * First stop state levels when SPR and TB loss can occur.
>   */
>  static u64 pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
> -static u64 pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
> +static u64 deep_spr_loss_state = MAX_STOP_STATE + 1;
> 
>  /*
>   * psscr value and mask of the deepest stop idle state.
> @@ -657,7 +657,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		  */
>  		mmcr0		= mfspr(SPRN_MMCR0);
>  	}
> -	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
> +	if ((psscr & PSSCR_RL_MASK) >= deep_spr_loss_state) {
>  		sprs.lpcr	= mfspr(SPRN_LPCR);
>  		sprs.hfscr	= mfspr(SPRN_HFSCR);
>  		sprs.fscr	= mfspr(SPRN_FSCR);
> @@ -741,7 +741,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	 * just always test PSSCR for SPR/TB state loss.
>  	 */
>  	pls = (psscr & PSSCR_PLS) >> PSSCR_PLS_SHIFT;
> -	if (likely(pls < pnv_first_spr_loss_level)) {
> +	if (likely(pls < deep_spr_loss_state)) {
>  		if (sprs_saved)
>  			atomic_stop_thread_idle();
>  		goto out;
> @@ -1088,7 +1088,7 @@ static void __init pnv_power9_idle_init(void)
>  	 * the deepest loss-less (OPAL_PM_STOP_INST_FAST) stop state.
>  	 */
>  	pnv_first_tb_loss_level = MAX_STOP_STATE + 1;
> -	pnv_first_spr_loss_level = MAX_STOP_STATE + 1;
> +	deep_spr_loss_state = MAX_STOP_STATE + 1;
>  	for (i = 0; i < nr_pnv_idle_states; i++) {
>  		int err;
>  		struct pnv_idle_states_t *state = &pnv_idle_states[i];
> @@ -1099,8 +1099,8 @@ static void __init pnv_power9_idle_init(void)
>  			pnv_first_tb_loss_level = psscr_rl;
> 
>  		if ((state->flags & OPAL_PM_LOSE_FULL_CONTEXT) &&
> -		     (pnv_first_spr_loss_level > psscr_rl))
> -			pnv_first_spr_loss_level = psscr_rl;
> +		     (deep_spr_loss_state > psscr_rl))
> +			deep_spr_loss_state = psscr_rl;
> 
>  		/*
>  		 * The idle code does not deal with TB loss occurring
> @@ -1111,8 +1111,8 @@ static void __init pnv_power9_idle_init(void)
>  		 * compatibility.
>  		 */
>  		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
> -		     (pnv_first_spr_loss_level > psscr_rl))
> -			pnv_first_spr_loss_level = psscr_rl;
> +		     (deep_spr_loss_state > psscr_rl))
> +			deep_spr_loss_state = psscr_rl;
> 
>  		err = validate_psscr_val_mask(&state->psscr_val,
>  					      &state->psscr_mask,
> @@ -1158,7 +1158,7 @@ static void __init pnv_power9_idle_init(void)
>  	}
> 
>  	pr_info("cpuidle-powernv: First stop level that may lose SPRs = 0x%llx\n",
> -		pnv_first_spr_loss_level);
> +		deep_spr_loss_state);
> 
>  	pr_info("cpuidle-powernv: First stop level that may lose timebase = 0x%llx\n",
>  		pnv_first_tb_loss_level);
> -- 
> 2.25.4
> 
