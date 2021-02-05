Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BE310BA0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 14:14:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXG94355tzDvVw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 00:14:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RMIoz47Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXG4H3yfdzDwfk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 00:10:22 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115D2YZF148771; Fri, 5 Feb 2021 08:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FuHd5B8vQDs909fxLg4Hf92nFou7E5WKngwdbrDJ29E=;
 b=RMIoz47Q2nEx3A/aPzFKD18YZZ2fj1G/XzwH4yY8CD1bsH/eD31n7bn21sCh7PvQarOr
 3WnOXR5MsT6Gww3zalOwjhGk181MV/Lf4zVutTrCEFSM+BZJNisjmcueSW9kTrVhz7hN
 3Akfbgiuf+JDPdM4XX2IuoaXhRwq+FfPPsAxfYgFAzNc/MLINQv3eXt2lbjCcO1WL8Ge
 HF/MxQgVBXs4hYdmVeXqVn9FXLzpOqnZ7U+M4vWCnJApOEKU9yErmaigE0PxzixZRkdK
 7JulrxlzftKECYQ32iJng3Ujnh/rCYwdSiCp1R8+X62jvpL3OBnt1xvoVGlUVN41e8gd zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36h5pktfaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 08:09:52 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 115D3fgo155574;
 Fri, 5 Feb 2021 08:09:52 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36h5pktf9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 08:09:52 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115D8PtF019834;
 Fri, 5 Feb 2021 13:09:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 36eu8rbpju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:09:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115D9onk25821548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 13:09:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE3E5112066;
 Fri,  5 Feb 2021 13:09:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E0AF112063;
 Fri,  5 Feb 2021 13:09:49 +0000 (GMT)
Received: from localhost (unknown [9.163.5.169])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Feb 2021 13:09:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leonardo Bras <leobras.c@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>, Jordan
 Niethe <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Frederic
 Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
In-Reply-To: <20210205060643.233481-1-leobras.c@gmail.com>
References: <20210205060643.233481-1-leobras.c@gmail.com>
Date: Fri, 05 Feb 2021 10:09:46 -0300
Message-ID: <874kiqy82t.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050083
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras <leobras.c@gmail.com> writes:

> Before guest entry, TBU40 register is changed to reflect guest timebase.
> After exitting guest, the register is reverted to it's original value.
>
> If one tries to get the timestamp from host between those changes, it
> will present an incorrect value.
>
> An example would be trying to add a tracepoint in
> kvmppc_guest_entry_inject_int(), which depending on last tracepoint
> acquired could actually cause the host to crash.
>
> Save the Timebase Offset to PACA and use it on sched_clock() to always
> get the correct timestamp.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Suggested-by: Paul Mackerras <paulus@ozlabs.org>
> ---
> Changes since v1:
> - Subtracts offset only when CONFIG_KVM_BOOK3S_HANDLER and
>   CONFIG_PPC_BOOK3S_64 are defined.
> ---
>  arch/powerpc/include/asm/kvm_book3s_asm.h | 1 +
>  arch/powerpc/kernel/asm-offsets.c         | 1 +
>  arch/powerpc/kernel/time.c                | 8 +++++++-
>  arch/powerpc/kvm/book3s_hv.c              | 2 ++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
>  5 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
> index 078f4648ea27..e2c12a10eed2 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> @@ -131,6 +131,7 @@ struct kvmppc_host_state {
>  	u64 cfar;
>  	u64 ppr;
>  	u64 host_fscr;
> +	u64 tb_offset;		/* Timebase offset: keeps correct
> timebase while on guest */

Couldn't you use the vc->tb_offset_applied for this? We have a reference
for the vcore in the hstate already.

>  #endif
>  };
>
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index b12d7c049bfe..0beb8fdc6352 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -706,6 +706,7 @@ int main(void)
>  	HSTATE_FIELD(HSTATE_CFAR, cfar);
>  	HSTATE_FIELD(HSTATE_PPR, ppr);
>  	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
> +	HSTATE_FIELD(HSTATE_TB_OFFSET, tb_offset);
>  #endif /* CONFIG_PPC_BOOK3S_64 */
>
>  #else /* CONFIG_PPC_BOOK3S */
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 67feb3524460..f27f0163792b 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -699,7 +699,13 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
>   */
>  notrace unsigned long long sched_clock(void)
>  {
> -	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
> +	u64 tb = get_tb() - boot_tb;
> +
> +#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_HANDLER)
> +	tb -= local_paca->kvm_hstate.tb_offset;
> +#endif
> +
> +	return mulhdu(tb, tb_to_ns_scale) << tb_to_ns_shift;
>  }
>
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index b3731572295e..c08593c63353 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3491,6 +3491,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
>  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
>  		vc->tb_offset_applied = vc->tb_offset;
> +		local_paca->kvm_hstate.tb_offset = vc->tb_offset;
>  	}
>
>  	if (vc->pcr)
> @@ -3594,6 +3595,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
>  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
>  		vc->tb_offset_applied = 0;
> +		local_paca->kvm_hstate.tb_offset = 0;
>  	}
>
>  	mtspr(SPRN_HDEC, 0x7fffffff);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index b73140607875..8f7a9f7f4ee6 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -632,6 +632,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
>  	cmpdi	r8,0
>  	beq	37f
>  	std	r8, VCORE_TB_OFFSET_APPL(r5)
> +	std	r8, HSTATE_TB_OFFSET(r13)
>  	mftb	r6		/* current host timebase */
>  	add	r8,r8,r6
>  	mtspr	SPRN_TBU40,r8	/* update upper 40 bits */
> @@ -1907,6 +1908,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>  	beq	17f
>  	li	r0, 0
>  	std	r0, VCORE_TB_OFFSET_APPL(r5)
> +	std	r0, HSTATE_TB_OFFSET(r13)
>  	mftb	r6			/* current guest timebase */
>  	subf	r8,r8,r6
>  	mtspr	SPRN_TBU40,r8		/* update upper 40 bits */
