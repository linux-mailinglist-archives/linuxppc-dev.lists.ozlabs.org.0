Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41E63C0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 21:41:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jt4C0Yx4zDqCt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 05:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jt232xkGzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 05:39:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69JdJGl094130
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jul 2019 15:39:50 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tn0k4hg20-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 15:39:50 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <janani@linux.ibm.com>;
 Tue, 9 Jul 2019 20:39:48 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 20:39:45 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69JditA36503966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 19:39:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AEB9AC05B;
 Tue,  9 Jul 2019 19:39:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31575AC059;
 Tue,  9 Jul 2019 19:39:43 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 19:39:43 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Jul 2019 14:42:10 -0500
From: janani <janani@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 3/7] kvmppc: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190709102545.9187-4-bharata@linux.ibm.com>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-4-bharata@linux.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19070919-0052-0000-0000-000003DC5A21
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011401; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229823; UDB=6.00647719; IPR=6.01011082; 
 MB=3.00027657; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-09 19:39:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070919-0053-0000-0000-000061A06A38
Message-Id: <03532ade57f5d556246b1583f6f1d3f7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090232
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
Reply-To: janani@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-09 05:25, Bharata B Rao wrote:
> H_SVM_INIT_START: Initiate securing a VM
> H_SVM_INIT_DONE: Conclude securing a VM
> 
> As part of H_SVM_INIT_START, register all existing memslots with
> the UV. H_SVM_INIT_DONE call by UV informs HV that transition of
> the guest to secure mode is complete.
> 
> These two states (transition to secure mode STARTED and transition
> to secure mode COMPLETED) are recorded in kvm->arch.secure_guest.
> Setting these states will cause the assembly code that enters the
> guest to call the UV_RETURN ucall instead of trying to enter the
> guest directly.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h         |  2 ++
>  arch/powerpc/include/asm/kvm_book3s_hmm.h | 12 ++++++++
>  arch/powerpc/include/asm/kvm_host.h       |  4 +++
>  arch/powerpc/include/asm/ultravisor-api.h |  1 +
>  arch/powerpc/include/asm/ultravisor.h     |  9 ++++++
>  arch/powerpc/kvm/book3s_hv.c              |  7 +++++
>  arch/powerpc/kvm/book3s_hv_hmm.c          | 34 +++++++++++++++++++++++
>  7 files changed, 69 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h
> b/arch/powerpc/include/asm/hvcall.h
> index 05b8536f6653..fa7695928e30 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -343,6 +343,8 @@
>  /* Platform-specific hcalls used by the Ultravisor */
>  #define H_SVM_PAGE_IN		0xEF00
>  #define H_SVM_PAGE_OUT		0xEF04
> +#define H_SVM_INIT_START	0xEF08
> +#define H_SVM_INIT_DONE		0xEF0C
> 
>  /* Values for 2nd argument to H_SET_MODE */
>  #define H_SET_MODE_RESOURCE_SET_CIABR		1
> diff --git a/arch/powerpc/include/asm/kvm_book3s_hmm.h
> b/arch/powerpc/include/asm/kvm_book3s_hmm.h
> index 21f3de5f2acb..8c7aacabb2e0 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_hmm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_hmm.h
> @@ -11,6 +11,8 @@ extern unsigned long kvmppc_h_svm_page_out(struct kvm 
> *kvm,
>  					  unsigned long gra,
>  					  unsigned long flags,
>  					  unsigned long page_shift);
> +extern unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
> +extern unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
>  #else
>  static inline unsigned long
>  kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gra,
> @@ -25,5 +27,15 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long 
> gra,
>  {
>  	return H_UNSUPPORTED;
>  }
> +
> +static inline unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> +{
> +	return H_UNSUPPORTED;
> +}
> +
> +static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
> +{
> +	return H_UNSUPPORTED;
> +}
>  #endif /* CONFIG_PPC_UV */
>  #endif /* __POWERPC_KVM_PPC_HMM_H__ */
> diff --git a/arch/powerpc/include/asm/kvm_host.h
> b/arch/powerpc/include/asm/kvm_host.h
> index ac1a101beb07..0c49c3401c63 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -272,6 +272,10 @@ struct kvm_hpt_info {
> 
>  struct kvm_resize_hpt;
> 
> +/* Flag values for kvm_arch.secure_guest */
> +#define KVMPPC_SECURE_INIT_START	0x1 /* H_SVM_INIT_START has been 
> called */
> +#define KVMPPC_SECURE_INIT_DONE		0x2 /* H_SVM_INIT_DONE completed */
> +
>  struct kvm_arch {
>  	unsigned int lpid;
>  	unsigned int smt_mode;		/* # vcpus per virtual core */
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h
> b/arch/powerpc/include/asm/ultravisor-api.h
> index f1c5800ac705..07b7d638e7af 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -20,6 +20,7 @@
>  /* opcodes */
>  #define UV_WRITE_PATE			0xF104
>  #define UV_RETURN			0xF11C
> +#define UV_REGISTER_MEM_SLOT		0xF120
>  #define UV_PAGE_IN			0xF128
>  #define UV_PAGE_OUT			0xF12C
> 
> diff --git a/arch/powerpc/include/asm/ultravisor.h
> b/arch/powerpc/include/asm/ultravisor.h
> index 16f8e0e8ec3f..b46042f1aa8f 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -61,6 +61,15 @@ static inline int uv_page_out(u64 lpid, u64 dst_ra,
> u64 src_gpa, u64 flags,
>  	return ucall(UV_PAGE_OUT, retbuf, lpid, dst_ra, src_gpa, flags,
>  		     page_shift);
>  }
> +
> +static inline int uv_register_mem_slot(u64 lpid, u64 start_gpa, u64 
> size,
> +				       u64 flags, u64 slotid)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_REGISTER_MEM_SLOT, retbuf, lpid, start_gpa,
> +		     size, flags, slotid);
> +}
>  #endif /* !__ASSEMBLY__ */
> 
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/kvm/book3s_hv.c 
> b/arch/powerpc/kvm/book3s_hv.c
> index 8ee66aa0da58..b8f801d00ad4 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1097,6 +1097,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu 
> *vcpu)
>  					    kvmppc_get_gpr(vcpu, 5),
>  					    kvmppc_get_gpr(vcpu, 6));
>  		break;
> +	case H_SVM_INIT_START:
> +		ret = kvmppc_h_svm_init_start(vcpu->kvm);
> +		break;
> +	case H_SVM_INIT_DONE:
> +		ret = kvmppc_h_svm_init_done(vcpu->kvm);
> +		break;
> +
>  	default:
>  		return RESUME_HOST;
>  	}
> diff --git a/arch/powerpc/kvm/book3s_hv_hmm.c 
> b/arch/powerpc/kvm/book3s_hv_hmm.c
> index 36562b382e70..55bab9c4e60a 100644
> --- a/arch/powerpc/kvm/book3s_hv_hmm.c
> +++ b/arch/powerpc/kvm/book3s_hv_hmm.c
> @@ -62,6 +62,40 @@ struct kvmppc_hmm_migrate_args {
>  	unsigned long page_shift;
>  };
> 
> +unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> +{
> +	struct kvm_memslots *slots;
> +	struct kvm_memory_slot *memslot;
> +	int ret = H_SUCCESS;
> +	int srcu_idx;
> +
> +	srcu_idx = srcu_read_lock(&kvm->srcu);
> +	slots = kvm_memslots(kvm);
> +	kvm_for_each_memslot(memslot, slots) {
> +		ret = uv_register_mem_slot(kvm->arch.lpid,
> +					   memslot->base_gfn << PAGE_SHIFT,
> +					   memslot->npages * PAGE_SIZE,
> +					   0, memslot->id);
> +		if (ret < 0) {
> +			ret = H_PARAMETER;
> +			goto out;
> +		}
> +	}
> +	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_START;
> +out:
> +	srcu_read_unlock(&kvm->srcu, srcu_idx);
> +	return ret;
> +}
> +
> +unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
> +{
> +	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> +		return H_UNSUPPORTED;
> +
> +	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
> +	return H_SUCCESS;
> +}
> +
>  /*
>   * Bits 60:56 in the rmap entry will be used to identify the
>   * different uses/functions of rmap. This definition with move

