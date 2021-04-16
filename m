Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73B3627B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 20:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMPqv66Rfz3c56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 04:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RkNkuZzc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RkNkuZzc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMPqT4nCyz30C8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 04:28:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GI3ek7181591; Fri, 16 Apr 2021 14:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=OmiAKZbO1v72aqJKgW+uQkXBCk4mS6b/2u5ysSqXugI=;
 b=RkNkuZzcR60jNcCorWH0XuPfZmbLhHeuDUnF3+v1m7Pnm3zVHD+qigeb03MGwxcPPaXW
 8Lt2aZxYwe3fmFwftTkp4rANSwA8fgl5fqWorEeF0kCPMvBrL/cD/3ALB9nyasumzocY
 MtV38fxvOmjhndMi/zJE0Ni7q6hfT2qkoxAVdPkenwGyb8GkkVx/n76wC9/sQ2EpUTQj
 tndRvJVTm3zpic/4GiSQ3u3FDR/GTEpfJ1tbgv59c0LJsFw3wCGkphOPsnjru0pNR41m
 CuQMJYH4Ld5D+3kc4LEklR3fi1JOwY757JY6dFQOuaLl7Gb9M047MFb260NYtiPR+dnT 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y8rp5h26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 14:28:51 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GI3lOr182202;
 Fri, 16 Apr 2021 14:28:51 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y8rp5h1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 14:28:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GICLMa009319;
 Fri, 16 Apr 2021 18:28:50 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 37xc7411n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 18:28:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GISnsn23790004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 18:28:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 502AAAE066;
 Fri, 16 Apr 2021 18:28:49 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 664EEAE05C;
 Fri, 16 Apr 2021 18:28:48 +0000 (GMT)
Received: from localhost (unknown [9.211.116.137])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Apr 2021 18:28:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v1 4/7] KVM: PPC: Book3S 64: Move hcall early register
 setup to KVM
In-Reply-To: <20210412075103.1533302-5-npiggin@gmail.com>
References: <20210412075103.1533302-1-npiggin@gmail.com>
 <20210412075103.1533302-5-npiggin@gmail.com>
Date: Fri, 16 Apr 2021 15:28:45 -0300
Message-ID: <87blaem6ci.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vYp1hn6SjZGrev8yf-r7yMjp-ivpwvIj
X-Proofpoint-ORIG-GUID: vKjPpvjcRtKeeOaeEzHpTN8N9Ljv4SoH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_09:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160129
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

> System calls / hcalls have a different calling convention than
> other interrupts, so there is code in the KVMTEST to massage these
> into the same form as other interrupt handlers.
>
> Move this work into the KVM hcall handler. This means teaching KVM
> a little more about the low level interrupt handler setup, PACA save
> areas, etc., although that's not obviously worse than the current
> approach of coming up with an entirely different interrupt register
> / save convention.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/exception-64s.h | 13 ++++++++
>  arch/powerpc/kernel/exceptions-64s.S     | 42 +-----------------------
>  arch/powerpc/kvm/book3s_64_entry.S       | 30 +++++++++++++++++
>  3 files changed, 44 insertions(+), 41 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
> index c1a8aac01cf9..bb6f78fcf981 100644
> --- a/arch/powerpc/include/asm/exception-64s.h
> +++ b/arch/powerpc/include/asm/exception-64s.h
> @@ -35,6 +35,19 @@
>  /* PACA save area size in u64 units (exgen, exmc, etc) */
>  #define EX_SIZE		10
>
> +/* PACA save area offsets */
> +#define EX_R9		0
> +#define EX_R10		8
> +#define EX_R11		16
> +#define EX_R12		24
> +#define EX_R13		32
> +#define EX_DAR		40
> +#define EX_DSISR	48
> +#define EX_CCR		52
> +#define EX_CFAR		56
> +#define EX_PPR		64
> +#define EX_CTR		72
> +
>  /*
>   * maximum recursive depth of MCE exceptions
>   */
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 9467fd1038f9..1bfd0d7af09e 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -21,22 +21,6 @@
>  #include <asm/feature-fixups.h>
>  #include <asm/kup.h>
>
> -/* PACA save area offsets (exgen, exmc, etc) */
> -#define EX_R9		0
> -#define EX_R10		8
> -#define EX_R11		16
> -#define EX_R12		24
> -#define EX_R13		32
> -#define EX_DAR		40
> -#define EX_DSISR	48
> -#define EX_CCR		52
> -#define EX_CFAR		56
> -#define EX_PPR		64
> -#define EX_CTR		72
> -.if EX_SIZE != 10
> -	.error "EX_SIZE is wrong"
> -.endif
> -
>  /*
>   * Following are fixed section helper macros.
>   *
> @@ -1964,29 +1948,8 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
>
>  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>  TRAMP_REAL_BEGIN(system_call_kvm)
> -	/*
> -	 * This is a hcall, so register convention is as above, with these
> -	 * differences:
> -	 * r13 = PACA
> -	 * ctr = orig r13
> -	 * orig r10 saved in PACA
> -	 */
> -	 /*
> -	  * Save the PPR (on systems that support it) before changing to
> -	  * HMT_MEDIUM. That allows the KVM code to save that value into the
> -	  * guest state (it is the guest's PPR value).
> -	  */
> -BEGIN_FTR_SECTION
> -	mfspr	r10,SPRN_PPR
> -	std	r10,HSTATE_PPR(r13)
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -	HMT_MEDIUM
>  	mfctr	r10
> -	SET_SCRATCH0(r10)
> -	mfcr	r10
> -	std	r12,HSTATE_SCRATCH0(r13)
> -	sldi	r12,r10,32
> -	ori	r12,r12,0xc00
> +	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
>  #ifdef CONFIG_RELOCATABLE
>  	/*
>  	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
> @@ -1994,15 +1957,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 */
>  	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
>  	mtctr   r10
> -	ld	r10,PACA_EXGEN+EX_R10(r13)
>  	bctr
>  #else
> -	ld	r10,PACA_EXGEN+EX_R10(r13)
>  	b       kvmppc_hcall
>  #endif
>  #endif
>
> -
>  /**
>   * Interrupt 0xd00 - Trace Interrupt.
>   * This is a synchronous interrupt in response to instruction step or
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index c21fa64059ef..f527e16707db 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -14,6 +14,36 @@
>  .global	kvmppc_hcall
>  .balign IFETCH_ALIGN_BYTES
>  kvmppc_hcall:
> +	/*
> +	 * This is a hcall, so register convention is as
> +	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
> +	 * R13		= PACA
> +	 * guest R13 saved in SPRN_SCRATCH0
> +	 * R10		= free
> +	 * guest r10 saved in PACA_EXGEN
> +	 *
> +	 * This may also be a syscall from PR-KVM userspace that is to be
> +	 * reflected to the PR guest kernel, so registers may be set up for
> +	 * a system call rather than hcall. We don't currently clobber
> +	 * anything here, but the 0xc00 handler has already clobbered CTR
> +	 * and CR0, so PR-KVM can not support a guest kernel that preserves
> +	 * those registers across its system calls.
> +	 */
> +	 /*
> +	  * Save the PPR (on systems that support it) before changing to
> +	  * HMT_MEDIUM. That allows the KVM code to save that value into the
> +	  * guest state (it is the guest's PPR value).
> +	  */
> +BEGIN_FTR_SECTION
> +	mfspr	r10,SPRN_PPR
> +	std	r10,HSTATE_PPR(r13)
> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> +	HMT_MEDIUM
> +	mfcr	r10
> +	std	r12,HSTATE_SCRATCH0(r13)
> +	sldi	r12,r10,32
> +	ori	r12,r12,0xc00
> +	ld	r10,PACA_EXGEN+EX_R10(r13)
>
>  .global	kvmppc_interrupt
>  .balign IFETCH_ALIGN_BYTES
