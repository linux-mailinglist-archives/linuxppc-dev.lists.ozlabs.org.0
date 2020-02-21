Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FD168116
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 16:05:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PFB065hrzDqrM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 02:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PF8D4R4pzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 02:03:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LEscNa128445; Fri, 21 Feb 2020 10:03:19 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y9sbvkjv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 10:03:18 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LF0bt0002688;
 Fri, 21 Feb 2020 15:03:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2y6897u8rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 15:03:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LF3GOB54067536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 15:03:16 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95F98136066;
 Fri, 21 Feb 2020 15:03:16 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86245136065;
 Fri, 21 Feb 2020 15:03:16 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 15:03:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/5] powerpc: Move idle_loop_prolog()/epilog()
 functions to header file
In-Reply-To: <1582262314-8319-2-git-send-email-ego@linux.vnet.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-2-git-send-email-ego@linux.vnet.ibm.com>
Date: Fri, 21 Feb 2020 09:03:16 -0600
Message-ID: <87lfowt22z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_04:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210115
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

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>
> Currently prior to entering an idle state on a Linux Guest, the
> pseries cpuidle driver implement an idle_loop_prolog() and
> idle_loop_epilog() functions which ensure that idle_purr is correctly
> computed, and the hypervisor is informed that the CPU cycles have been
> donated.
>
> These prolog and epilog functions are also required in the default
> idle call, i.e pseries_lpar_idle(). Hence move these accessor
> functions to a common header file and call them from
> pseries_lpar_idle(). Since the existing header files such as
> asm/processor.h have enough clutter, create a new header file
> asm/idle.h.
>
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/idle.h        | 27 +++++++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/setup.c |  7 +++++--
>  drivers/cpuidle/cpuidle-pseries.c      | 24 +-----------------------
>  3 files changed, 33 insertions(+), 25 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/idle.h
>
> diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
> new file mode 100644
> index 0000000..f32a7d8
> --- /dev/null
> +++ b/arch/powerpc/include/asm/idle.h
> @@ -0,0 +1,27 @@
> +#ifndef _ASM_POWERPC_IDLE_H
> +#define _ASM_POWERPC_IDLE_H
> +#include <asm/runlatch.h>
> +
> +static inline void idle_loop_prolog(unsigned long *in_purr)
> +{
> +	ppc64_runlatch_off();
> +	*in_purr = mfspr(SPRN_PURR);
> +	/*
> +	 * Indicate to the HV that we are idle. Now would be
> +	 * a good time to find other work to dispatch.
> +	 */
> +	get_lppaca()->idle = 1;
> +}
> +
> +static inline void idle_loop_epilog(unsigned long in_purr)
> +{
> +	u64 wait_cycles;
> +
> +	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
> +	wait_cycles += mfspr(SPRN_PURR) - in_purr;
> +	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> +	get_lppaca()->idle = 0;
> +
> +	ppc64_runlatch_on();
> +}
> +#endif

Looks fine and correct as a cleanup, but asm/include/idle.h and
idle_loop_prolog, idle_loop_epilog, strike me as too generic for
pseries-specific code.
