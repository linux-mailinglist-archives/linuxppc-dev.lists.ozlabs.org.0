Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 422AE225C6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9HV13jMHzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 20:07:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9HS6459RzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 20:06:14 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KA3Esu152502; Mon, 20 Jul 2020 06:06:07 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwk6xjgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:06:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KA5VfI022330;
 Mon, 20 Jul 2020 10:06:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 32brq8g56g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 10:06:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KA65X837880178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 10:06:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7246328059;
 Mon, 20 Jul 2020 10:06:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 821E928058;
 Mon, 20 Jul 2020 10:06:04 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.72.83])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 10:06:04 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E70162E48BA; Mon, 20 Jul 2020 15:35:57 +0530 (IST)
Date: Mon, 20 Jul 2020 15:35:57 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [v3 11/15] powerpc/perf: BHRB control to disable BHRB logic when
 not used
Message-ID: <20200720100557.GA9055@in.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-12-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594996707-3727-12-git-send-email-atrajeev@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_05:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200074
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 10:38:23AM -0400, Athira Rajeev wrote:
> PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).
> 
> BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
> bit, namely "BHRB Recording Disable (BHRBRD)". This field controls
> whether BHRB entries are written when BHRB recording is enabled by other
> bits. This patch implements support for this BHRB disable bit.
> 
> By setting 0b1 to this bit will disable the BHRB and by setting 0b0
> to this bit will have BHRB enabled. This addresses backward
> compatibility (for older OS), since this bit will be cleared and
> hardware will be writing to BHRB by default.
> 
> This patch addresses changes to set MMCRA (BHRBRD) at boot for power10
> ( there by the core will run faster) and enable this feature only on
> runtime ie, on explicit need from user. Also save/restore MMCRA in the
> restore path of state-loss idle state to make sure we keep BHRB disabled
> if it was not enabled on request at runtime.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

For arch/powerpc/platforms/powernv/idle.c
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>


> ---
>  arch/powerpc/perf/core-book3s.c       | 20 ++++++++++++++++----
>  arch/powerpc/perf/isa207-common.c     | 12 ++++++++++++
>  arch/powerpc/platforms/powernv/idle.c | 22 ++++++++++++++++++++--
>  3 files changed, 48 insertions(+), 6 deletions(-)

[..snip..]

> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 2dd4673..1c9d0a9 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	unsigned long srr1;
>  	unsigned long pls;
>  	unsigned long mmcr0 = 0;
> +	unsigned long mmcra = 0;
>  	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
>  	bool sprs_saved = false;
> 
> @@ -657,6 +658,21 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		  */
>  		mmcr0		= mfspr(SPRN_MMCR0);
>  	}
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		/*
> +		 * POWER10 uses MMCRA (BHRBRD) as BHRB disable bit.
> +		 * If the user hasn't asked for the BHRB to be
> +		 * written, the value of MMCRA[BHRBRD] is 1.
> +		 * On wakeup from stop, MMCRA[BHRBD] will be 0,
> +		 * since it is previleged resource and will be lost.
> +		 * Thus, if we do not save and restore the MMCRA[BHRBD],
> +		 * hardware will be needlessly writing to the BHRB
> +		 * in problem mode.
> +		 */
> +		mmcra		= mfspr(SPRN_MMCRA);
> +	}
> +
>  	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
>  		sprs.lpcr	= mfspr(SPRN_LPCR);
>  		sprs.hfscr	= mfspr(SPRN_HFSCR);
> @@ -700,8 +716,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
> 
>  	if ((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS) {
> -		unsigned long mmcra;
> -
>  		/*
>  		 * We don't need an isync after the mtsprs here because the
>  		 * upcoming mtmsrd is execution synchronizing.
> @@ -721,6 +735,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  			mtspr(SPRN_MMCR0, mmcr0);
>  		}
> 
> +		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
> +		if (cpu_has_feature(CPU_FTR_ARCH_31))
> +			mtspr(SPRN_MMCRA, mmcra);
> +
>  		/*
>  		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
>  		 * to ensure the PMU starts running.
> -- 
> 1.8.3.1
> 
