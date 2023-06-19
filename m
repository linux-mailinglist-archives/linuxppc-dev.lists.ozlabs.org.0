Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F09734A8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 05:19:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EmjGstj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qkw3q0p9Kz30Kf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 13:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EmjGstj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qkw2s6Gvpz2xqK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 13:18:45 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J36oU0026618;
	Mon, 19 Jun 2023 03:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=HReniWAH2iwP4oo3WMdwOWfNB4Vu9FHcp9HQYG3jU+U=;
 b=EmjGstj8VMvXASKYtt8yCe/wzlx/+uS0Sm5GjtX+7Na2crhW9ZIOefXtxTshP1MvmGpz
 D77r4r4iZ1axs/Pn7MqzDhytPuHbPuMBqj8/OGoHX5esgjR25gbyK07gTdklWy4baF5V
 49bP6RkC0kLUpYcHC4h1iChopCCQLlrd7sxwxY+JztgCD9uUQszYlkd/r2d5NOMym2iB
 uUGbS3kBicePEDOxwLwVY1OhxILB01j4VIZ0fYk0OZX0NbAIuzDkO1l1Mm5wSmKp2Fcx
 QJHV46/VpYXKvNq962Rrkn3DWy/EBEvHuU6mOCYwdSHkUxgEJI6XjPC7311Spq1WKd5t Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rae5v8x7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:18:39 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35J36ldo026115;
	Mon, 19 Jun 2023 03:18:39 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rae5v8x6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:18:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35J0ldtF028392;
	Mon, 19 Jun 2023 03:18:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r94f58u6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:18:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J3IYRs9568962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 03:18:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F1D320043;
	Mon, 19 Jun 2023 03:18:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B14EE20049;
	Mon, 19 Jun 2023 03:18:31 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 Jun 2023 03:18:31 +0000 (GMT)
Date: Mon, 19 Jun 2023 08:48:28 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>,
        jpn@linux.vnet.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@ozlabs.org>, Thomas Huth <thuth@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] KVM: ppc64: Enable ring-based dirty memory tracking
Message-ID: <ZI/JBOTFGKbg6MX4@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230608123448.71861-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608123448.71861-1-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5256Md3NTWgMLIODM4V6WuWJRcWfL8Qo
X-Proofpoint-ORIG-GUID: 4WXmetJpppGfzyfDrRXdTLXEwjYhXKIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_01,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=737 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190027
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick/Gavin/Everyone,

On 2023-06-08 08:34:48, Kautuk Consul wrote:
> - Enable CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL as ppc64 is weakly
>   ordered.
> - Enable CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP because the
>   kvmppc_xive_native_set_attr is called in the context of an ioctl
>   syscall and will call kvmppc_xive_native_eq_sync for setting the
>   KVM_DEV_XIVE_EQ_SYNC attribute which will call mark_dirty_page()
>   when there isn't a running vcpu. Implemented the
>   kvm_arch_allow_write_without_running_vcpu to always return true
>   to allow mark_page_dirty_in_slot to mark the page dirty in the
>   memslot->dirty_bitmap in this case.
> - Set KVM_DIRTY_LOG_PAGE_OFFSET for the ring buffer's physical page
>   offset.
> - Implement the kvm_arch_mmu_enable_log_dirty_pt_masked function required
>   for the generic KVM code to call.
> - Add a check to kvmppc_vcpu_run_hv for checking whether the dirty
>   ring is soft full.
> - Implement the kvm_arch_flush_remote_tlbs_memslot function to support
>   the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT config option.
> 
> On testing with live migration it was found that there is around
> 150-180 ms improvment in overall migration time with this patch.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst      |  2 +-
>  arch/powerpc/include/uapi/asm/kvm.h |  2 ++
>  arch/powerpc/kvm/Kconfig            |  2 ++
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 42 +++++++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c        |  3 +++
>  include/linux/kvm_dirty_ring.h      |  5 ++++
>  6 files changed, 55 insertions(+), 1 deletion(-)
> 
Any review comments on this ?
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index add067793b90..ce1ebc513bae 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8114,7 +8114,7 @@ regardless of what has actually been exposed through the CPUID leaf.
>  8.29 KVM_CAP_DIRTY_LOG_RING/KVM_CAP_DIRTY_LOG_RING_ACQ_REL
>  ----------------------------------------------------------
> 
> -:Architectures: x86, arm64
> +:Architectures: x86, arm64, ppc64
>  :Parameters: args[0] - size of the dirty log ring
> 
>  KVM is capable of tracking dirty memory using ring buffers that are
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index 9f18fa090f1f..f722309ed7fb 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -33,6 +33,8 @@
>  /* Not always available, but if it is, this is the correct offset.  */
>  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
> 
> +#define KVM_DIRTY_LOG_PAGE_OFFSET 64
> +
>  struct kvm_regs {
>  	__u64 pc;
>  	__u64 cr;
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 902611954200..c93354ec3bd5 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -26,6 +26,8 @@ config KVM
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
>  	select INTERVAL_TREE
> +	select HAVE_KVM_DIRTY_RING_ACQ_REL
> +	select NEED_KVM_DIRTY_RING_WITH_BITMAP
> 
>  config KVM_BOOK3S_HANDLER
>  	bool
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 7f765d5ad436..c92e8022e017 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -2147,3 +2147,45 @@ void kvmppc_mmu_book3s_hv_init(struct kvm_vcpu *vcpu)
> 
>  	vcpu->arch.hflags |= BOOK3S_HFLAG_SLB;
>  }
> +
> +/*
> + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for selected
> + * dirty pages.
> + *
> + * It write protects selected pages to enable dirty logging for them.
> + */
> +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> +					     struct kvm_memory_slot *slot,
> +					     gfn_t gfn_offset,
> +					     unsigned long mask)
> +{
> +	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> +	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> +	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> +
> +	while (start < end) {
> +		pte_t *ptep;
> +		unsigned int shift;
> +
> +		ptep = find_kvm_secondary_pte(kvm, start, &shift);
> +
> +		*ptep = __pte(pte_val(*ptep) & ~(_PAGE_WRITE));
> +
> +		start += PAGE_SIZE;
> +	}
> +}
> +
> +#ifdef CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP
> +bool kvm_arch_allow_write_without_running_vcpu(struct kvm *kvm)
> +{
> +	return true;
> +}
> +#endif
> +
> +#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
> +void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> +					const struct kvm_memory_slot *memslot)
> +{
> +	kvm_flush_remote_tlbs(kvm);
> +}
> +#endif
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 130bafdb1430..1d1264ea72c4 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4804,6 +4804,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  		return -EINTR;
>  	}
> 
> +	if (kvm_dirty_ring_check_request(vcpu))
> +		return 0;
> +
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	/*
>  	 * Don't allow entry with a suspended transaction, because
> diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
> index 4862c98d80d3..a00301059da5 100644
> --- a/include/linux/kvm_dirty_ring.h
> +++ b/include/linux/kvm_dirty_ring.h
> @@ -69,6 +69,11 @@ static inline void kvm_dirty_ring_free(struct kvm_dirty_ring *ring)
>  {
>  }
> 
> +static inline bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
>  #else /* CONFIG_HAVE_KVM_DIRTY_RING */
> 
>  int kvm_cpu_dirty_log_size(void);
> -- 
> 2.39.2
> 
