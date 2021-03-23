Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5234673C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 19:09:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4fWr1Hw6z3bqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 05:09:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CSTlKnDB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CSTlKnDB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4fWN3MPzz30B7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 05:08:48 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NI5Qx3111558; Tue, 23 Mar 2021 14:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jdgL+G+4MB6jvCoKC0KADf+IXfxrOzSpfuIHEjOqIzg=;
 b=CSTlKnDBx8F6796PiN4VxI9PFZfsdJOfMAeZ7lqQMwC0UTusW+kGIuFFk7OD7QWTyWCA
 HbUnuLVOa2J1VWQ8tTYYBj659ld/a6/gry8WokZV0ZKDwL2nqLkH4zonAnRTYCnbJ/A9
 TBKCw5fbuOqkvIsQcbg7X9ndJU/+9YBoMw3U70hwJxrRKxTOfbt8d84QOAF9J/FpG1/z
 nDt7JuVEg5oqRgf4TZrqNG9UHVt1y0aZ3+0BRpSjtEjvcH1Om53QuK96kGuWdJKzE4MJ
 gpb+aCL/lfUw0Fedatco0KQNkFDqmuXG/AU+JmtWJwtzoUnmBTDYQHarbEROY+Ns5vLd qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fm6utacq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:08:46 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NI6i6n118787;
 Tue, 23 Mar 2021 14:08:45 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fm6utacb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 14:08:45 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NI3LVE022776;
 Tue, 23 Mar 2021 18:08:45 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 37equddqs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 18:08:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NI8hWo27263316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 18:08:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DA17C6059;
 Tue, 23 Mar 2021 18:08:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0311DC605A;
 Tue, 23 Mar 2021 18:08:42 +0000 (GMT)
Received: from localhost (unknown [9.163.8.110])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 18:08:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v4 01/46] KVM: PPC: Book3S HV: Nested move LPCR
 sanitising to sanitise_hv_regs
In-Reply-To: <20210323010305.1045293-2-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-2-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 15:08:41 -0300
Message-ID: <87y2edeo9i.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_09:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230133
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

> This will get a bit more complicated in future patches. Move it
> into the helper function.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 0cd0e7aad588..2fe1fea4c934 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -134,6 +134,16 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>
>  static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  {
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	u64 mask;
> +
> +	/*
> +	 * Don't let L1 change LPCR bits for the L2 except these:
> +	 */
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> +		LPCR_LPES | LPCR_MER;
> +	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
> +
>  	/*
>  	 * Don't let L1 enable features for L2 which we've disabled for L1,
>  	 * but preserve the interrupt cause field.
> @@ -271,8 +281,6 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	u64 hv_ptr, regs_ptr;
>  	u64 hdec_exp;
>  	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
> -	u64 mask;
> -	unsigned long lpcr;
>
>  	if (vcpu->kvm->arch.l1_ptcr == 0)
>  		return H_NOT_AVAILABLE;
> @@ -321,9 +329,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
>  	vcpu->arch.regs = l2_regs;
>  	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> -		LPCR_LPES | LPCR_MER;
> -	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
> +
>  	sanitise_hv_regs(vcpu, &l2_hv);
>  	restore_hv_regs(vcpu, &l2_hv);
>
> @@ -335,7 +341,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  			r = RESUME_HOST;
>  			break;
>  		}
> -		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
> +		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, l2_hv.lpcr);
>  	} while (is_kvmppc_resume_guest(r));
>
>  	/* save L2 state for return */
