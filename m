Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 614D01137A0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 23:31:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47StqP66l7zDqMy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 09:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SthF0YTFzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 09:25:00 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4MILax021525; Wed, 4 Dec 2019 17:24:55 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wnsd5sc28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 17:24:54 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB4MOoIm001860;
 Wed, 4 Dec 2019 22:24:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2wkg27bfe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 22:24:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4MOri634865646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 22:24:53 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55ABDBE04F;
 Wed,  4 Dec 2019 22:24:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BE03BE054;
 Wed,  4 Dec 2019 22:24:53 +0000 (GMT)
Received: from localhost (unknown [9.41.179.251])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 22:24:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Account for SPURR ticks on idle CPUs
In-Reply-To: <1574856072-30972-2-git-send-email-ego@linux.vnet.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <1574856072-30972-2-git-send-email-ego@linux.vnet.ibm.com>
Date: Wed, 04 Dec 2019 16:24:52 -0600
Message-ID: <87o8wnu3t7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=1 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912040185
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> index a36fd05..708ec68 100644
> --- a/arch/powerpc/kernel/idle.c
> +++ b/arch/powerpc/kernel/idle.c
> @@ -33,6 +33,8 @@
>  unsigned long cpuidle_disable = IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(cpuidle_disable);
>  
> +DEFINE_PER_CPU(u64, idle_spurr_cycles);
> +

Does idle_spurr_cycles need any special treatment for CPU
online/offline?

>  static int __init powersave_off(char *arg)
>  {
>  	ppc_md.power_save = NULL;
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 74c2479..45e2be4 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -30,11 +30,14 @@ struct cpuidle_driver pseries_idle_driver = {
>  static struct cpuidle_state *cpuidle_state_table __read_mostly;
>  static u64 snooze_timeout __read_mostly;
>  static bool snooze_timeout_en __read_mostly;
> +DECLARE_PER_CPU(u64, idle_spurr_cycles);

This belongs in a header... 


> -static inline void idle_loop_prolog(unsigned long *in_purr)
> +static inline void idle_loop_prolog(unsigned long *in_purr,
> +				    unsigned long *in_spurr)
>  {
>  	ppc64_runlatch_off();
>  	*in_purr = mfspr(SPRN_PURR);
> +	*in_spurr = mfspr(SPRN_SPURR);
>  	/*
>  	 * Indicate to the HV that we are idle. Now would be
>  	 * a good time to find other work to dispatch.
> @@ -42,13 +45,16 @@ static inline void idle_loop_prolog(unsigned long *in_purr)
>  	get_lppaca()->idle = 1;
>  }
>  
> -static inline void idle_loop_epilog(unsigned long in_purr)
> +static inline void idle_loop_epilog(unsigned long in_purr,
> +				    unsigned long in_spurr)
>  {
>  	u64 wait_cycles;
> +	u64 *idle_spurr_cycles_ptr = this_cpu_ptr(&idle_spurr_cycles);
>  
>  	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
>  	wait_cycles += mfspr(SPRN_PURR) - in_purr;
>  	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> +	*idle_spurr_cycles_ptr += mfspr(SPRN_SPURR) - in_spurr;

... and the sampling and increment logic probably should be further
encapsulated in accessor functions that can be used in both the cpuidle
driver and the default/generic idle implementation. Or is there some
reason this is specific to the pseries cpuidle driver?
