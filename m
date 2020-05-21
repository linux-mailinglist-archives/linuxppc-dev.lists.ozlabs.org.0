Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543E1DC6E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 08:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SK4Q08TszDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 16:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SK2P4Jm7zDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 16:09:17 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04L61u0k066289; Thu, 21 May 2020 02:09:08 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cb2g25y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 02:09:08 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04L652BX008237;
 Thu, 21 May 2020 06:09:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 313xcd233h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 06:09:05 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04L693Gu53543062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 06:09:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A3A0AE045;
 Thu, 21 May 2020 06:09:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5975DAE055;
 Thu, 21 May 2020 06:09:01 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.45.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 21 May 2020 06:09:01 +0000 (GMT)
Date: Wed, 20 May 2020 23:08:58 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: relax check on H_SVM_INIT_ABORT
Message-ID: <20200521060858.GA5278@oc0525413822.ibm.com>
References: <20200520193259.0b66db32@bahia.lan>
 <20200520174308.77820-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520174308.77820-1-ldufour@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_02:2020-05-20,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210035
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, groug@kaod.org,
 paulus@samba.org, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 07:43:08PM +0200, Laurent Dufour wrote:
> The commit 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_*
> Hcalls") added checks of secure bit of SRR1 to filter out the Hcall
> reserved to the Ultravisor.
> 
> However, the Hcall H_SVM_INIT_ABORT is made by the Ultravisor passing the
> context of the VM calling UV_ESM. This allows the Hypervisor to return to
> the guest without going through the Ultravisor. Thus the Secure bit of SRR1
> is not set in that particular case.
> 
> In the case a regular VM is calling H_SVM_INIT_ABORT, this hcall will be
> filtered out in kvmppc_h_svm_init_abort() because kvm->arch.secure_guest is
> not set in that case.
> 
> Fixes: 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_* Hcalls")
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>


Reviewed-by: Ram Pai <linuxram@us.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 93493f0cbfe8..6ad1a3b14300 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1099,9 +1099,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  			ret = kvmppc_h_svm_init_done(vcpu->kvm);
>  		break;
>  	case H_SVM_INIT_ABORT:
> -		ret = H_UNSUPPORTED;
> -		if (kvmppc_get_srr1(vcpu) & MSR_S)
> -			ret = kvmppc_h_svm_init_abort(vcpu->kvm);
> +		/*
> +		 * Even if that call is made by the Ultravisor, the SSR1 value
> +		 * is the guest context one, with the secure bit clear as it has
> +		 * not yet been secured. So we can't check it here.
> +		 */

Frankly speaking, the comment above when read in isolation; i.e without
the delete code above, feels out of place.  The reasoning for change is
anyway captured in the changelog.  So, I think, we should delete this
comment.

Also the comment above assumes the Ultravisor will call H_SVM_INIT_ABORT
with SRR1(S) bit not set; which may or may not be true.  Regardless of
who and how H_SVM_INIT_ABORT is called, we should just call
kvmppc_h_svm_init_abort() and let it deal with the complexities.


RP
