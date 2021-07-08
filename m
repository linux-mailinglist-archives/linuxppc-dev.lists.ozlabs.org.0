Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF53C18BA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 19:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLPBl71Cvz3bVr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 03:57:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZeQ0tiu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aZeQ0tiu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLPBG1Tstz2xfL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 03:56:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168HYRTL071910; Thu, 8 Jul 2021 13:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=IcXhJ2bC0L959rJe4wUD/jaNBEfSotz/cU6M37PLavA=;
 b=aZeQ0tiuiSCgaEZ25GHNUbhQ6X3luA5zDPtMO5h0vDQSswj/vh+E5D9MFd+LXtyooMRR
 i5bce2fICKQnzPy1UN348opMC4hjzNCzKVITa6/tzYI7SdZR8bd8+A/qItt+4w44crty
 SeLIuBrVx05mp5rKEveipaG8/bckEOfQ3O5/8nMRo4rIoK5XP65EUW52uyEnBovwCOex
 zGpQSO2PDLkTUBUk6EiQsuoFcdsj802WX5yeRM+LLn0bxjpH/dDYMlrE8CbHeYa6DtN7
 7WJRZpWQ+QyFSoklrncn4clHoffbANTbJZ2JhdEeHxpX+BoTLz44MXA8mbLqGvPOkBbJ 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39n287mjxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:56:51 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168HYThX072054;
 Thu, 8 Jul 2021 13:56:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39n287mjx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 13:56:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168HXrY0023374;
 Thu, 8 Jul 2021 17:56:50 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 39jhq1fehy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 17:56:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168Hunb111731306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 17:56:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 639BFAE060;
 Thu,  8 Jul 2021 17:56:49 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9981EAE01E;
 Thu,  8 Jul 2021 17:56:48 +0000 (GMT)
Received: from localhost (unknown [9.211.64.106])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 17:56:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 12/43] KVM: PPC: Book3S HV P9: Factor out
 yield_count increment
In-Reply-To: <20210622105736.633352-13-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-13-npiggin@gmail.com>
Date: Thu, 08 Jul 2021 14:56:45 -0300
Message-ID: <87pmvsofj6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: weSfOTeI_pC2JJ_1f2pV_oyeNC14KiTl
X-Proofpoint-ORIG-GUID: dpJyGwdN7RX28dciiyO4_n0gTKi1M_BJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_10:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107080093
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

> Factor duplicated code into a helper function.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index b1b94b3563b7..38d8afa16839 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3896,6 +3896,16 @@ static inline bool hcall_is_xics(unsigned long req)
>  		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X;
>  }
>
> +static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
> +	if (lp) {
> +		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
> +		lp->yield_count = cpu_to_be32(yield_count);
> +		vcpu->arch.vpa.dirty = 1;
> +	}
> +}
> +
>  /*
>   * Guest entry for POWER9 and later CPUs.
>   */
> @@ -3926,12 +3936,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	vc->entry_exit_map = 1;
>  	vc->in_guest = 1;
>
> -	if (vcpu->arch.vpa.pinned_addr) {
> -		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
> -		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
> -		lp->yield_count = cpu_to_be32(yield_count);
> -		vcpu->arch.vpa.dirty = 1;
> -	}
> +	vcpu_vpa_increment_dispatch(vcpu);
>
>  	if (cpu_has_feature(CPU_FTR_TM) ||
>  	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
> @@ -4069,12 +4074,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
>  		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
>
> -	if (vcpu->arch.vpa.pinned_addr) {
> -		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
> -		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
> -		lp->yield_count = cpu_to_be32(yield_count);
> -		vcpu->arch.vpa.dirty = 1;
> -	}
> +	vcpu_vpa_increment_dispatch(vcpu);
>
>  	save_p9_guest_pmu(vcpu);
>  #ifdef CONFIG_PPC_PSERIES
