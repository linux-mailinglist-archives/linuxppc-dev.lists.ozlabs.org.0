Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAD18CFAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 15:05:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kQWw4b9zzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 01:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.143.68; helo=2.mo7.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2178 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Mar 2020 23:59:33 AEDT
Received: from 2.mo7.mail-out.ovh.net (2.mo7.mail-out.ovh.net [87.98.143.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kP4P25MBzDrf6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 23:59:29 +1100 (AEDT)
Received: from player728.ha.ovh.net (unknown [10.108.54.67])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 02DE515A163
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 13:23:05 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 060EF108AE6BD;
 Fri, 20 Mar 2020 12:22:49 +0000 (UTC)
Date: Fri, 20 Mar 2020 13:22:48 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH 1/2] KVM: PPC: Book3S HV: check caller of H_SVM_* Hcalls
Message-ID: <20200320132248.44b81b3b@bahia.lan>
In-Reply-To: <20200320102643.15516-2-ldufour@linux.ibm.com>
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-2-ldufour@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13089993795129285060
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeguddgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Mar 2020 11:26:42 +0100
Laurent Dufour <ldufour@linux.ibm.com> wrote:

> The Hcall named H_SVM_* are reserved to the Ultravisor. However, nothing
> prevent a malicious VM or SVM to call them. This could lead to weird result
> and should be filtered out.
> 
> Checking the Secure bit of the calling MSR ensure that the call is coming
> from either the Ultravisor or a SVM. But any system call made from a SVM
> are going through the Ultravisor, and the Ultravisor should filter out
> these malicious call. This way, only the Ultravisor is able to make such a
> Hcall.

"Ultravisor should filter" ? And what if it doesn't (eg. because of a bug) ?

Shouldn't we also check the HV bit of the calling MSR as well to
disambiguate SVM and UV ?

> 
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 33be4d93248a..43773182a737 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1074,25 +1074,35 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  					 kvmppc_get_gpr(vcpu, 6));
>  		break;
>  	case H_SVM_PAGE_IN:
> -		ret = kvmppc_h_svm_page_in(vcpu->kvm,
> -					   kvmppc_get_gpr(vcpu, 4),
> -					   kvmppc_get_gpr(vcpu, 5),
> -					   kvmppc_get_gpr(vcpu, 6));
> +		ret = H_UNSUPPORTED;
> +		if (kvmppc_get_srr1(vcpu) & MSR_S)
> +			ret = kvmppc_h_svm_page_in(vcpu->kvm,
> +						   kvmppc_get_gpr(vcpu, 4),
> +						   kvmppc_get_gpr(vcpu, 5),
> +						   kvmppc_get_gpr(vcpu, 6));

If calling kvmppc_h_svm_page_in() produces a "weird result" when
the MSR_S bit isn't set, then I think it should do the checking
itself, ie. pass vcpu.

This would also prevent adding that many lines in kvmppc_pseries_do_hcall()
which is a big enough function already. The checking could be done in a
helper in book3s_hv_uvmem.c and used by all UV specific hcalls.

>  		break;
>  	case H_SVM_PAGE_OUT:
> -		ret = kvmppc_h_svm_page_out(vcpu->kvm,
> -					    kvmppc_get_gpr(vcpu, 4),
> -					    kvmppc_get_gpr(vcpu, 5),
> -					    kvmppc_get_gpr(vcpu, 6));
> +		ret = H_UNSUPPORTED;
> +		if (kvmppc_get_srr1(vcpu) & MSR_S)
> +			ret = kvmppc_h_svm_page_out(vcpu->kvm,
> +						    kvmppc_get_gpr(vcpu, 4),
> +						    kvmppc_get_gpr(vcpu, 5),
> +						    kvmppc_get_gpr(vcpu, 6));
>  		break;
>  	case H_SVM_INIT_START:
> -		ret = kvmppc_h_svm_init_start(vcpu->kvm);
> +		ret = H_UNSUPPORTED;
> +		if (kvmppc_get_srr1(vcpu) & MSR_S)
> +			ret = kvmppc_h_svm_init_start(vcpu->kvm);
>  		break;
>  	case H_SVM_INIT_DONE:
> -		ret = kvmppc_h_svm_init_done(vcpu->kvm);
> +		ret = H_UNSUPPORTED;
> +		if (kvmppc_get_srr1(vcpu) & MSR_S)
> +			ret = kvmppc_h_svm_init_done(vcpu->kvm);
>  		break;
>  	case H_SVM_INIT_ABORT:
> -		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
> +		ret = H_UNSUPPORTED;
> +		if (kvmppc_get_srr1(vcpu) & MSR_S)
> +			ret = kvmppc_h_svm_init_abort(vcpu->kvm);
>  		break;
>  
>  	default:

