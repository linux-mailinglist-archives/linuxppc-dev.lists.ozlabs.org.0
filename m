Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F07494A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 06:16:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=biJNVE7T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxNWG4GSzz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 14:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=biJNVE7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxNVP2j5mz304b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 14:15:23 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-66869feb7d1so212723b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688616921; x=1691208921;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIs1Ic3kA6qxFm0PBui1PCyprdvyTG+DQnNhEQH+f60=;
        b=biJNVE7TnITK7Jn8jArQ6ai5UK/8sHSUU4C04rH/HSb//GFyfN+0zV2uGYAM1mNIpR
         NqYQCMoo0xsYDswOeUa4TTHku6lXSv2DJ8It9gug6NNyUNBFO2pnC8qnxhn/AyaaG4bS
         9QAeStpV+Q60mDniYwHKKEKqgfkJJ7jnTwQY9qqOCQQReHyd5jrRmS51Qb9KmpZ9Iuom
         Uiy8GvWaf1S9BVQbctQuSJGW2q03mLaD49oST4zr31vnM6aeG4UoUsiJ/gbskg8eagI2
         +/KAQr7Vpc3YP5irCnnwpFOZJthlJFKN7MB98giNzyC//vubSnXOw+0ZU17rTbqahvse
         M2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688616921; x=1691208921;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIs1Ic3kA6qxFm0PBui1PCyprdvyTG+DQnNhEQH+f60=;
        b=cWznAgmbzXYxRn5AiplTHuvo9FZK4QUWJ1CT3k+xYOVdwE/zfwcTiV2bKeDsYDH+5A
         Jm5oBVslk59QAYEcNOHAyasKorCCmlz8X/Z0C9nr6CZfgkWzTGtgWJBTSTkuobCvO5/c
         xnx99z1HrmPvVvnh/dOU2yqZyTu5OY82ytXQa/bJB7mSA7H/Tk4HzhiZLjwdJeS1He0e
         GeajfcO45wvQTAdeLQtjajENBrdphHpgofVYW9jhQA0HWD7zAy34r75J4KUm4zwWVITz
         RmWlehvXaocD9NmCGk+2ynddPFImWqWehlW1GThXyQeABxeazzHI7OKKLFddocBC+9Qx
         lhaQ==
X-Gm-Message-State: ABy/qLYRUOIfAtkdL9zZ8h4DhZ5gm/TZXhXUs7SSfMUhUbLQWdCVlXbA
	kuxj5DRbLZrNAjOYzSQKxRo=
X-Google-Smtp-Source: APBJJlGLdBFHS/nuBRHjP4lzjj/zANJe18hspko8zTFNvPvy0FVqup/zYik1d/W12JUvN8zTeOnP/A==
X-Received: by 2002:a05:6a00:1acb:b0:66a:5466:25c6 with SMTP id f11-20020a056a001acb00b0066a546625c6mr543165pfv.18.1688616920834;
        Wed, 05 Jul 2023 21:15:20 -0700 (PDT)
Received: from localhost-live.default (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id g18-20020aa78752000000b0064d681c753csm302246pfo.40.2023.07.05.21.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 21:15:20 -0700 (PDT)
Subject: Re: [PATCH] KVM: ppc64: Enable ring-based dirty memory tracking
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 jpn@linux.vnet.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@ozlabs.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230608123448.71861-1-kconsul@linux.vnet.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Message-ID: <266701ad-90df-e4c8-bbf7-c6411b759c5f@gmail.com>
Date: Thu, 6 Jul 2023 14:15:13 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230608123448.71861-1-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 8/6/23 10:34 pm, Kautuk Consul wrote:

Need at least a little context in the commit message itself:

"Enable ring-based dirty memory tracking on ppc64:"

> - Enable CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL as ppc64 is weakly
>    ordered.
> - Enable CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP because the
>    kvmppc_xive_native_set_attr is called in the context of an ioctl
>    syscall and will call kvmppc_xive_native_eq_sync for setting the
>    KVM_DEV_XIVE_EQ_SYNC attribute which will call mark_dirty_page()
>    when there isn't a running vcpu. Implemented the
>    kvm_arch_allow_write_without_running_vcpu to always return true
>    to allow mark_page_dirty_in_slot to mark the page dirty in the
>    memslot->dirty_bitmap in this case.

Should kvm_arch_allow_write_without_running_vcpu() only return true in 
the context of kvmppc_xive_native_eq_sync()?

> - Set KVM_DIRTY_LOG_PAGE_OFFSET for the ring buffer's physical page
>    offset.
> - Implement the kvm_arch_mmu_enable_log_dirty_pt_masked function required
>    for the generic KVM code to call.
> - Add a check to kvmppc_vcpu_run_hv for checking whether the dirty
>    ring is soft full.
> - Implement the kvm_arch_flush_remote_tlbs_memslot function to support
>    the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT config option.
> 
> On testing with live migration it was found that there is around
> 150-180 ms improvment in overall migration time with this
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>   Documentation/virt/kvm/api.rst      |  2 +-
>   arch/powerpc/include/uapi/asm/kvm.h |  2 ++
>   arch/powerpc/kvm/Kconfig            |  2 ++
>   arch/powerpc/kvm/book3s_64_mmu_hv.c | 42 +++++++++++++++++++++++++++++
>   arch/powerpc/kvm/book3s_hv.c        |  3 +++
>   include/linux/kvm_dirty_ring.h      |  5 ++++
>   6 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index add067793b90..ce1ebc513bae 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8114,7 +8114,7 @@ regardless of what has actually been exposed through the CPUID leaf.
>   8.29 KVM_CAP_DIRTY_LOG_RING/KVM_CAP_DIRTY_LOG_RING_ACQ_REL
>   ----------------------------------------------------------
>   
> -:Architectures: x86, arm64
> +:Architectures: x86, arm64, ppc64
>   :Parameters: args[0] - size of the dirty log ring
>   
>   KVM is capable of tracking dirty memory using ring buffers that are
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index 9f18fa090f1f..f722309ed7fb 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -33,6 +33,8 @@
>   /* Not always available, but if it is, this is the correct offset.  */
>   #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
>   
> +#define KVM_DIRTY_LOG_PAGE_OFFSET 64
> +
>   struct kvm_regs {
>   	__u64 pc;
>   	__u64 cr;
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 902611954200..c93354ec3bd5 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -26,6 +26,8 @@ config KVM
>   	select IRQ_BYPASS_MANAGER
>   	select HAVE_KVM_IRQ_BYPASS
>   	select INTERVAL_TREE
> +	select HAVE_KVM_DIRTY_RING_ACQ_REL
> +	select NEED_KVM_DIRTY_RING_WITH_BITMAP
>   
>   config KVM_BOOK3S_HANDLER
>   	bool
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 7f765d5ad436..c92e8022e017 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -2147,3 +2147,45 @@ void kvmppc_mmu_book3s_hv_init(struct kvm_vcpu *vcpu)
>   
>   	vcpu->arch.hflags |= BOOK3S_HFLAG_SLB;
>   }
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
On rpt I think you'd need to use kvmppc_radix_update_pte()?

> +
> +		start += PAGE_SIZE > +	}
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
>   		return -EINTR;
>   	}
>   
> +	if (kvm_dirty_ring_check_request(vcpu))
> +		return 0;
> +
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	/*
>   	 * Don't allow entry with a suspended transaction, because
> diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
> index 4862c98d80d3..a00301059da5 100644
> --- a/include/linux/kvm_dirty_ring.h
> +++ b/include/linux/kvm_dirty_ring.h
> @@ -69,6 +69,11 @@ static inline void kvm_dirty_ring_free(struct kvm_dirty_ring *ring)
>   {
>   }
>   
> +static inline bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> + >   #else /* CONFIG_HAVE_KVM_DIRTY_RING */
>   
>   int kvm_cpu_dirty_log_size(void);
> 
