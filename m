Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF4391A93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 16:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqtyZ1nCNz3077
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 00:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ln0VQA7E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ln0VQA7E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqty70qmvz2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 00:44:30 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QEWeiG109986; Wed, 26 May 2021 10:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=iDIxWl2OhQS0i/6AVwFIYe/IdmJkd7umGIm30dp71e0=;
 b=Ln0VQA7EQK0c6dw3QNRQRO1WLUwDpOrqaKMAaNTu43Ffgwc+g2kMjQQwFyLclmLJzmU7
 g1RyGZzPV5+Jc3z5XILxMr+LusvOHjOS1slHcDtJBxEJnWpxiDpvNCPKqIj3+ZhIgL8v
 4Bb//atSioifE2lrFgk79tRyxcM+6DiNf7MKtdaXPuTAEHnlAGnJMirbGwJxQ+lQU2Q6
 Gff+8e4eedPY7g5zMWEOIJWxBvmxzHGLmIwlyNyeX2sGwIW4IO+Anfuv/S+bCLczH1Zi
 O5pYz4xvMwKHGlmQDL7F+8yOUlZUeni62jAqzOK8s6TwuhhJwtYZ2GtFLuudeZzCC1Id JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38sq2maup2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 10:44:27 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14QEXbtn113463;
 Wed, 26 May 2021 10:44:27 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38sq2maunf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 10:44:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14QEh5VO023758;
 Wed, 26 May 2021 14:44:26 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 38s1gw9abe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 14:44:26 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14QEiP6e38404430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 14:44:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD62B112065;
 Wed, 26 May 2021 14:44:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B45112064;
 Wed, 26 May 2021 14:44:24 +0000 (GMT)
Received: from localhost (unknown [9.211.90.78])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 26 May 2021 14:44:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Save host FSCR in the P7/8 path
In-Reply-To: <20210526125851.3436735-1-npiggin@gmail.com>
References: <20210526125851.3436735-1-npiggin@gmail.com>
Date: Wed, 26 May 2021 11:44:22 -0300
Message-ID: <87cztd1rnd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gy7hPny9etTTDrSNe8UpIJo82WaZ1xQP
X-Proofpoint-ORIG-GUID: vH0lZVLjnqf_FPkFhgLEGYhL1RSBNLo3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_09:2021-05-26,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxlogscore=861 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260098
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

> Similar to commit 25edcc50d76c ("KVM: PPC: Book3S HV: Save and restore
> FSCR in the P9 path"), ensure the P7/8 path saves and restores the host
> FSCR. The logic explained in that patch actually applies there to the
> old path well: a context switch can be made before kvmppc_vcpu_run_hv
> restores the host FSCR and returns.
>
> Now both the p9 and the p7/8 paths now save and restore their FSCR, it
> no longer needs to be restored at the end of kvmppc_vcpu_run_hv
>
> Fixes: b005255e12a3 ("KVM: PPC: Book3S HV: Context-switch new POWER8 SPRs")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
> Since v1:
> - Remove the now unnecessary FSCR restore at vcpu_run exit [Fabiano]
>  arch/powerpc/kvm/book3s_hv.c            | 1 -
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 28a80d240b76..13728495ac66 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4455,7 +4455,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		mtspr(SPRN_EBBRR, ebb_regs[1]);
>  		mtspr(SPRN_BESCR, ebb_regs[2]);
>  		mtspr(SPRN_TAR, user_tar);
> -		mtspr(SPRN_FSCR, current->thread.fscr);
>  	}
>  	mtspr(SPRN_VRSAVE, user_vrsave);
>  
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 5e634db4809b..004f0d4e665f 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -59,6 +59,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
>  #define STACK_SLOT_UAMOR	(SFS-88)
>  #define STACK_SLOT_DAWR1	(SFS-96)
>  #define STACK_SLOT_DAWRX1	(SFS-104)
> +#define STACK_SLOT_FSCR		(SFS-112)
>  /* the following is used by the P9 short path */
>  #define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
>  
> @@ -686,6 +687,8 @@ BEGIN_FTR_SECTION
>  	std	r6, STACK_SLOT_DAWR0(r1)
>  	std	r7, STACK_SLOT_DAWRX0(r1)
>  	std	r8, STACK_SLOT_IAMR(r1)
> +	mfspr	r5, SPRN_FSCR
> +	std	r5, STACK_SLOT_FSCR(r1)
>  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>  BEGIN_FTR_SECTION
>  	mfspr	r6, SPRN_DAWR1
> @@ -1663,6 +1666,10 @@ FTR_SECTION_ELSE
>  	ld	r7, STACK_SLOT_HFSCR(r1)
>  	mtspr	SPRN_HFSCR, r7
>  ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
> +BEGIN_FTR_SECTION
> +	ld	r5, STACK_SLOT_FSCR(r1)
> +	mtspr	SPRN_FSCR, r5
> +END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>  	/*
>  	 * Restore various registers to 0, where non-zero values
>  	 * set by the guest could disrupt the host.
