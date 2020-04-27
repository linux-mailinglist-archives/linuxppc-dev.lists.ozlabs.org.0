Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62A1BA577
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 15:54:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499mVf1MR3zDqBK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 23:54:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499mLB58DHzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:47:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 499mL84ncPz8sny
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:47:28 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 499mL80BZhz9sSk; Mon, 27 Apr 2020 23:47:28 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 499mL66kKTz9sSb;
 Mon, 27 Apr 2020 23:47:25 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RDZxur141196; Mon, 27 Apr 2020 09:47:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguuv4y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 09:47:21 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03RDaXtf142469;
 Mon, 27 Apr 2020 09:47:21 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguuv4xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 09:47:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RDjpWQ002474;
 Mon, 27 Apr 2020 13:47:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 30mcu70fcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 13:47:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RDlJm817170854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 13:47:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44BEDC6055;
 Mon, 27 Apr 2020 13:47:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95815C6057;
 Mon, 27 Apr 2020 13:47:18 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.94.115])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 13:47:18 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id CC98F2E2E25; Mon, 27 Apr 2020 19:17:11 +0530 (IST)
Date: Mon, 27 Apr 2020 19:17:11 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Abhishek Goel <huntbag@linux.vnet.ibm.com>
Subject: Re: [RFC 2/3] powernv/cpuidle : Interface for an idle-stop
 dependency structure
Message-ID: <20200427134711.GD29708@in.ibm.com>
References: <20200427021027.114582-1-huntbag@linux.vnet.ibm.com>
 <20200427021027.114582-2-huntbag@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427021027.114582-2-huntbag@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_10:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270116
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 psampat@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 26, 2020 at 09:10:26PM -0500, Abhishek Goel wrote:
> This patch introduces the idea of having a dependency structure for
> idle-stop. The structure encapsulates the following:
> 1. Bitmask for version of idle-stop
> 2. Bitmask for propterties like ENABLE/DISABLE
> 3. Function pointer which helps handle how the stop must be invoked
> 
> This patch lays a foundation for other idle-stop versions to be added
> and handled cleanly based on their specified requirments.
> Currently it handles the existing "idle-stop" version by setting the
> discovery bits and the function pointer.
> 
> Earlier this patch was posted as part of this series :
> https://lkml.org/lkml/2020/3/4/589


Please see the review comments to the earlier version:
https://lkml.org/lkml/2020/4/8/245

I still feel that we don't need cpuidle_prop and stop_version to be
separate fields.


> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
> ---
> 
>  v1->v2: This patch is newly added in this series.
> 
>  arch/powerpc/include/asm/processor.h  | 17 +++++++++++++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c     |  5 +++++
>  arch/powerpc/platforms/powernv/idle.c | 18 ++++++++++++++----
>  drivers/cpuidle/cpuidle-powernv.c     |  3 ++-
>  4 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index eedcbfb9a6ff..66fa20476d0e 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -429,6 +429,23 @@ extern void power4_idle_nap(void);
>  extern unsigned long cpuidle_disable;
>  enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
> 
> +#define STOP_ENABLE		0x00000001
> +
> +#define STOP_VERSION_P9       0x1
> +
> +/*
> + * Classify the dependencies of the stop states
> + * @idle_stop: function handler to handle the quirk stop version
> + * @cpuidle_prop: Signify support for stop states through kernel and/or firmware
> + * @stop_version: Classify quirk versions for stop states
> + */
> +typedef struct {
> +	unsigned long (*idle_stop)(unsigned long psscr, bool mmu_on);
> +	uint8_t cpuidle_prop;
> +	uint8_t stop_version;
> +} stop_deps_t;
> +extern stop_deps_t stop_dep;
> +
>  extern int powersave_nap;	/* set if nap mode can be used in idle loop */
> 
>  extern void power7_idle_type(unsigned long type);
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 182b4047c1ef..db1a525e090d 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -292,6 +292,8 @@ static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
>  	lpcr |=  LPCR_PECE1;
>  	lpcr |=  LPCR_PECE2;
>  	mtspr(SPRN_LPCR, lpcr);
> +	stop_dep.cpuidle_prop |= STOP_ENABLE;
> +	stop_dep.stop_version = STOP_VERSION_P9;
> 
>  	return 1;
>  }
> @@ -657,6 +659,9 @@ static void __init cpufeatures_setup_start(u32 isa)
>  	}
>  }
> 
> +stop_deps_t stop_dep = {NULL, 0x0, 0x0};
> +EXPORT_SYMBOL(stop_dep);
> +
>  static bool __init cpufeatures_process_feature(struct dt_cpu_feature *f)
>  {
>  	const struct dt_cpu_feature_match *m;
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 1841027b25c5..538f0842ac3f 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -842,7 +842,7 @@ static unsigned long power9_offline_stop(unsigned long psscr)
> 
>  #ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>  	__ppc64_runlatch_off();
> -	srr1 = power9_idle_stop(psscr, true);
> +	srr1 = stop_dep.idle_stop(psscr, true);
>  	__ppc64_runlatch_on();
>  #else
>  	/*
> @@ -858,7 +858,7 @@ static unsigned long power9_offline_stop(unsigned long psscr)
>  	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
> 
>  	__ppc64_runlatch_off();
> -	srr1 = power9_idle_stop(psscr, false);
> +	srr1 = stop_dep.idle_stop(psscr, true);
>  	__ppc64_runlatch_on();
> 
>  	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
> @@ -886,7 +886,7 @@ void power9_idle_type(unsigned long stop_psscr_val,
>  	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
> 
>  	__ppc64_runlatch_off();
> -	srr1 = power9_idle_stop(psscr, true);
> +	srr1 = stop_dep.idle_stop(psscr, true);
>  	__ppc64_runlatch_on();
> 
>  	fini_irq_for_idle_irqsoff();
> @@ -1390,8 +1390,18 @@ static int __init pnv_init_idle_states(void)
>  	nr_pnv_idle_states = 0;
>  	supported_cpuidle_states = 0;
> 
> -	if (cpuidle_disable != IDLE_NO_OVERRIDE)
> +	if (cpuidle_disable != IDLE_NO_OVERRIDE ||
> +	    !(stop_dep.cpuidle_prop & STOP_ENABLE))
>  		goto out;
> +
> +	/* Check for supported version in kernel */
> +	if (stop_dep.stop_version & STOP_VERSION_P9) {
> +		stop_dep.idle_stop = power9_idle_stop;
> +	} else {
> +		stop_dep.idle_stop = NULL;
> +		goto out;
> +	}
> +
>  	rc = pnv_parse_cpuidle_dt();
>  	if (rc)
>  		return rc;
> diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
> index 1b299e801f74..7430a8edf5c9 100644
> --- a/drivers/cpuidle/cpuidle-powernv.c
> +++ b/drivers/cpuidle/cpuidle-powernv.c
> @@ -371,7 +371,8 @@ static int powernv_add_idle_states(void)
>   */
>  static int powernv_idle_probe(void)
>  {
> -	if (cpuidle_disable != IDLE_NO_OVERRIDE)
> +	if (cpuidle_disable != IDLE_NO_OVERRIDE ||
> +	    !(stop_dep.cpuidle_prop & STOP_ENABLE))
>  		return -ENODEV;
> 
>  	if (firmware_has_feature(FW_FEATURE_OPAL)) {
> -- 
> 2.17.1
> 
