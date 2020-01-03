Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480E12F214
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 01:20:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47plsX17fwzDqCt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 11:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47plqm2JgQzDqBL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 11:18:27 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0030HP7T084664
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Jan 2020 19:18:24 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x9dr5pu81-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2020 19:18:24 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 3 Jan 2020 00:18:22 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Jan 2020 00:18:20 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0030IJCK58720442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jan 2020 00:18:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55188AE04D;
 Fri,  3 Jan 2020 00:18:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E2B8AE051;
 Fri,  3 Jan 2020 00:18:17 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.213.131])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Jan 2020 00:18:17 +0000 (GMT)
Date: Thu, 2 Jan 2020 16:18:14 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 2/2] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
References: <20191215021104.GA27378@us.ibm.com>
 <20191215021208.GB27378@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215021208.GB27378@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20010300-0012-0000-0000-0000037A099D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010300-0013-0000-0000-000021B61BA0
Message-Id: <20200103001814.GD5556@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-02_08:2020-01-02,2020-01-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=2
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001030001
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
Cc: kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 14, 2019 at 06:12:08PM -0800, Sukadev Bhattiprolu wrote:
> 
> Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
> abort an SVM after it has issued the H_SVM_INIT_START and before the
> H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
> encounters security violations or other errors when starting an SVM.
> 
> Note that this hcall is different from UV_SVM_TERMINATE ucall which
> is used by HV to terminate/cleanup an VM that has becore secure.
> 
> The H_SVM_INIT_ABORT should basically undo operations that were done
> since the H_SVM_INIT_START hcall - i.e page-out all the VM pages back
> to normal memory, and terminate the SVM.
> 
> (If we do not bring the pages back to normal memory, the text/data
> of the VM would be stuck in secure memory and since the SVM did not
> go secure, its MSR_S bit will be clear and the VM wont be able to
> access its pages even to do a clean exit).
> 
> Based on patches and discussion with Paul Mackerras, Ram Pai and
> Bharata Rao.
> 
> Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
> Changelog[v3]:
> 	- Rather than pass the NIP/MSR as parameters, load them into
> 	  SRR0/SRR1 (like we do with other registers) and terminate
> 	  the VM after paging out pages
> 	- Move the code to add a skip_page_out parameter into a
> 	  separate patch.
> 
> Changelog[v2]:
> 	[Paul Mackerras] avoid returning to UV "one last time" after
> 	the state is cleaned up.  So, we now have H_SVM_INIT_ABORT:
> 	- take the VM's NIP/MSR register states as parameters
> 	- inherit the state of other registers as at UV_ESM call.
> 	After cleaning up the partial state, HV uses these to return
> 	directly to the VM with a failed UV_ESM call.
> ---
>  Documentation/powerpc/ultravisor.rst        | 57 +++++++++++++++++++++
>  arch/powerpc/include/asm/hvcall.h           |  1 +
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h |  6 +++
>  arch/powerpc/include/asm/kvm_host.h         |  1 +
>  arch/powerpc/kvm/book3s_hv.c                |  3 ++
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 24 +++++++++
>  6 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
> index 730854f73830..8c114c071bfa 100644
> --- a/Documentation/powerpc/ultravisor.rst
> +++ b/Documentation/powerpc/ultravisor.rst
> @@ -948,6 +948,63 @@ Use cases
>      up its internal state for this virtual machine.
> 
> 
> +H_SVM_INIT_ABORT
> +----------------
> +
> +    Abort the process of securing an SVM.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t hypercall(const uint64_t H_SVM_INIT_ABORT)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* H_PARAMETER 		on successfully cleaning up the state,
> +				Hypervisor will return this value to the
> +				**guest**, to indicate that the underlying
> +				UV_ESM ultracall failed.
> +
> +	* H_UNSUPPORTED		if called from the wrong context (e.g. from
> +				an SVM or before an H_SVM_INIT_START hypercall).
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Abort the process of securing a virtual machine. This call must
> +    be made after a prior call to ``H_SVM_INIT_START`` hypercall and
> +    before a call to ``H_SVM_INIT_DONE``.
> +
> +    On entry into this hypercall the non-volatile GPRs and FPRs are
> +    expected to contain the values they had at the time the VM issued
> +    the UV_ESM ultracall. Further ``SRR0`` is expected to contain the
> +    address of the instruction after the ``UV_ESM`` ultracall and ``SRR1``
> +    the MSR value with which to return to the VM.
> +
> +    This hypercall will cleanup any partial state that was established for
> +    the VM since the prior ``H_SVM_INIT_START`` hypercall, including paging
> +    out pages that were paged-into secure memory, and issue the
> +    ``UV_SVM_TERMINATE`` ultracall to terminate the VM.
> +
> +    After the partial state is cleaned up, control returns to the VM
> +    (**not Ultravisor**), at the address specified in ``SRR0`` with the
> +    MSR values set to the value in ``SRR1``.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    If after a successful call to ``H_SVM_INIT_START``, the Ultravisor
> +    encounters an error while securing a virtual machine, either due
> +    to lack of resources or because the VM's security information could
> +    not be validated, Ultravisor informs the Hypervisor about it.
> +    Hypervisor should use this call to clean up any internal state for
> +    this virtual machine and return to the VM.
> +
>  H_SVM_PAGE_IN
>  -------------
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 13bd870609c3..e90c073e437e 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -350,6 +350,7 @@
>  #define H_SVM_PAGE_OUT		0xEF04
>  #define H_SVM_INIT_START	0xEF08
>  #define H_SVM_INIT_DONE		0xEF0C
> +#define H_SVM_INIT_ABORT	0xEF14
> 
>  /* Values for 2nd argument to H_SET_MODE */
>  #define H_SET_MODE_RESOURCE_SET_CIABR		1
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index 3cf8425b9838..5a9834e0e2d1 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -19,6 +19,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
>  unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
>  unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
>  int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
> +unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
>  void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
>  #else
> @@ -62,6 +63,11 @@ static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
>  	return H_UNSUPPORTED;
>  }
> 
> +static inline unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
> +{
> +	return H_UNSUPPORTED;
> +}
> +
>  static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
>  {
>  	return -EFAULT;
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 577ca95fac7c..8310c0407383 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -278,6 +278,7 @@ struct kvm_resize_hpt;
>  /* Flag values for kvm_arch.secure_guest */
>  #define KVMPPC_SECURE_INIT_START 0x1 /* H_SVM_INIT_START has been called */
>  #define KVMPPC_SECURE_INIT_DONE  0x2 /* H_SVM_INIT_DONE completed */
> +#define KVMPPC_SECURE_INIT_ABORT 0x4 /* H_SVM_INIT_ABORT issued */
> 
>  struct kvm_arch {
>  	unsigned int lpid;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 66d5312be16b..1b22f2c7ad1b 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1099,6 +1099,9 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  	case H_SVM_INIT_DONE:
>  		ret = kvmppc_h_svm_init_done(vcpu->kvm);
>  		break;
> +	case H_SVM_INIT_ABORT:
> +		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
> +		break;
> 
>  	default:
>  		return RESUME_HOST;
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 9a5bbad7d87e..f7df8c327468 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -287,6 +287,30 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  	}
>  }
> 
> +unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
> +{
> +	int i;
> +
> +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> +		return H_UNSUPPORTED;

It should also return H_UNSUPPORTED when 
(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE) is true.

RP

