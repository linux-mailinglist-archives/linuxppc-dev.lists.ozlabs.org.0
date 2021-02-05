Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2B31138D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 22:30:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXT9H4DRbzDwnM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 08:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NHMaqD4i; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXT7S4RdrzDwlc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 08:28:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115L2B3R143895; Fri, 5 Feb 2021 16:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KX7k9kLXymzTRaGNadAL0QaapilxXNnCoImncC6ki/o=;
 b=NHMaqD4inPttME3GmMWRIcRRvIvM4ASodI5xtTc3pCLKbPcG8+3LvJobeY8OpxadvzIs
 3dMlCllE2vpF9b3Kj1j1/usxCnuSqukSnfFbzKokE9c6JCU6yBE/PAkUMnW6hjxUwUhK
 b9TJenK+SssV5ah9fJnWDtzUbzI1GD2MMBA95K7jElKj4pUmd9G7MQiHeQT40N68l9xp
 0VSOakoRX4B8w8A0fv31zp7b0SAnR5PWC41iPu7g85SERgzfSxbTwtEh0wm2bsDRxFyz
 pcAj/H5PMIjs7BU/SY4I45lBbSwjiWIZOcRW4IvsjfGwk8RwRF9a4pwILlJV+4RH55Pq +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36hd9tgym0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 16:28:48 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 115L4NO3150898;
 Fri, 5 Feb 2021 16:28:48 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36hd9tgykr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 16:28:48 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115LCbfa029556;
 Fri, 5 Feb 2021 21:28:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 36ex3pp4ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 21:28:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115LSlIi29426060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 21:28:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF117AC05E;
 Fri,  5 Feb 2021 21:28:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B017AC05B;
 Fri,  5 Feb 2021 21:28:46 +0000 (GMT)
Received: from localhost (unknown [9.163.5.169])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Feb 2021 21:28:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] KVM: PPC: Book3S 64: move KVM interrupt entry
 to a common entry point
In-Reply-To: <20210202030313.3509446-2-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-2-npiggin@gmail.com>
Date: Fri, 05 Feb 2021 18:28:43 -0300
Message-ID: <874kiqi4qc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_11:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050128
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Rather than bifurcate the call depending on whether or not HV is
> possible, and have the HV entry test for PR, just make a single
> common point which does the demultiplexing. This makes it simpler
> to add another type of exit handler.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kernel/exceptions-64s.S    |  8 +-----
>  arch/powerpc/kvm/Makefile               |  3 +++
>  arch/powerpc/kvm/book3s_64_entry.S      | 34 +++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++------
>  4 files changed, 40 insertions(+), 16 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index e02ad6fefa46..65659ea3cec4 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -212,7 +212,6 @@ do_define_int n
>  .endm
>
>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> -#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>  /*
>   * All interrupts which set HSRR registers, as well as SRESET and MCE and
>   * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
> @@ -242,13 +241,8 @@ do_define_int n
>
>  /*
>   * If an interrupt is taken while a guest is running, it is immediately routed
> - * to KVM to handle. If both HV and PR KVM arepossible, KVM interrupts go first
> - * to kvmppc_interrupt_hv, which handles the PR guest case.
> + * to KVM to handle.
>   */
> -#define kvmppc_interrupt kvmppc_interrupt_hv
> -#else
> -#define kvmppc_interrupt kvmppc_interrupt_pr
> -#endif
>
>  .macro KVMTEST name
>  	lbz	r10,HSTATE_IN_GUEST(r13)
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 2bfeaa13befb..cdd119028f64 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -59,6 +59,9 @@ kvm-pr-y := \
>  kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>  	tm.o
>
> +kvm-book3s_64-builtin-objs-y += \
> +	book3s_64_entry.o
> +
>  ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>  kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>  	book3s_rmhandlers.o
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> new file mode 100644
> index 000000000000..22e34b95f478
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -0,0 +1,34 @@
> +#include <asm/cache.h>
> +#include <asm/ppc_asm.h>
> +#include <asm/kvm_asm.h>
> +#include <asm/reg.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/kvm_book3s_asm.h>
> +
> +/*
> + * We come here from the first-level interrupt handlers.
> + */
> +.global	kvmppc_interrupt
> +.balign IFETCH_ALIGN_BYTES
> +kvmppc_interrupt:
> +	/*
> +	 * Register contents:
> +	 * R12		= (guest CR << 32) | interrupt vector
> +	 * R13		= PACA
> +	 * guest R12 saved in shadow VCPU SCRATCH0
> +	 * guest R13 saved in SPRN_SCRATCH0
> +	 */
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	std	r9, HSTATE_SCRATCH2(r13)
> +	lbz	r9, HSTATE_IN_GUEST(r13)
> +	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
> +	beq	kvmppc_bad_host_intr
> +#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> +	cmpwi	r9, KVM_GUEST_MODE_GUEST
> +	ld	r9, HSTATE_SCRATCH2(r13)
> +	beq	kvmppc_interrupt_pr
> +#endif
> +	b	kvmppc_interrupt_hv
> +#else
> +	b	kvmppc_interrupt_pr
> +#endif
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 8cf1f69f442e..b9c4acd747f7 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1255,16 +1255,8 @@ kvmppc_interrupt_hv:
>  	 * R13		= PACA
>  	 * guest R12 saved in shadow VCPU SCRATCH0
>  	 * guest R13 saved in SPRN_SCRATCH0
> +	 * guest R9 saved in HSTATE_SCRATCH2
>  	 */
> -	std	r9, HSTATE_SCRATCH2(r13)
> -	lbz	r9, HSTATE_IN_GUEST(r13)
> -	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
> -	beq	kvmppc_bad_host_intr
> -#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	cmpwi	r9, KVM_GUEST_MODE_GUEST
> -	ld	r9, HSTATE_SCRATCH2(r13)
> -	beq	kvmppc_interrupt_pr
> -#endif
>  	/* We're now back in the host but in guest MMU context */
>  	li	r9, KVM_GUEST_MODE_HOST_HV
>  	stb	r9, HSTATE_IN_GUEST(r13)
> @@ -3253,6 +3245,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_P9_TM_HV_ASSIST)
>   * cfar is saved in HSTATE_CFAR(r13)
>   * ppr is saved in HSTATE_PPR(r13)
>   */
> +.global kvmppc_bad_host_intr
>  kvmppc_bad_host_intr:
>  	/*
>  	 * Switch to the emergency stack, but start half-way down in
