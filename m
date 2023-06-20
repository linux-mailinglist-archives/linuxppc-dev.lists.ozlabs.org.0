Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03064736534
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:49:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YRkxkxfr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlf115pxXz30fq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YRkxkxfr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QldzD3BHmz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:48:07 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-39eab4bcee8so2609370b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687247285; x=1689839285;
        h=in-reply-to:references:message-id:to:from:subject:cc:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/UfqACRIbp+KfcxB9xT42vufkCG9I6wiWPxaYnWI9o=;
        b=YRkxkxfrSg9A9g1ooeKb1wazJtUjLoPERxhfKAH2GwD7qw69XbLPN1Ba1FtUAvm8FL
         QdF4uXVuR3ymVv0p1G1ASryHTPSZYRDV2/AzOy1m/umugzTdoMz95o2l4WRUF4Iwghp3
         GPXCl2dLw4v4bhe3AzveZyBYxyqQZ3++OqPtuynx+nNPaBvXUWbtmTiP8XxosVRGw3af
         wiTb2HdEqZxd4zej9B8EQQMu678bU7zyk2fz4wu/zoqSNubkH3xaNhY9KOM9ajlVhA8T
         ELkPzQLgIAx+Z+fAf5N0tP2dDEdJyROExBnsn+lxAbjQYu38/OlA9Py/ox4kdV59okLI
         4Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247285; x=1689839285;
        h=in-reply-to:references:message-id:to:from:subject:cc:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/UfqACRIbp+KfcxB9xT42vufkCG9I6wiWPxaYnWI9o=;
        b=khcRU6ruIWhENyE0s7o0quQuu0mm3lvke/exutcMj4tQgTiC2I2B02D9wdbZ4oTxyQ
         RbmeifkxzH7+3nq+IFaArf/PSEfZCwy4TjaLAxFMnnHxawvpg4WBmU17W+HwZGX2sWnP
         pgkWbFne6DIOrmoxH1OhT3IuOQpN7deClRYuM9hMRzQceKHSw4sAW81rZZgu7Vr3PpAy
         FFwT44uf4sxH9iFkhn1/uIuQjUFJsIg1HYXaw4+cBXpZZi016U5R1ZXUNRCIotCQkxWt
         j1D1+8/ozur6EUYlfNDpPGIN4KSqJmhXi8XqiduGmu3+vuvgRTwE3UX3acWqX9+dcl2z
         xmRg==
X-Gm-Message-State: AC+VfDyzHT8K37D6kgKz86UoCzGTLor90YKerqWGMNDqkEDXReK38RAC
	9MedS8Fo9uHzPdMIwE+4egI=
X-Google-Smtp-Source: ACHHUZ46XxwEUTpJsCjGTBnalzzt+j7MWruxVgUmQbM1nUv/3dXWVSuVX//QnCfJBuhR+6fpBvpozw==
X-Received: by 2002:a05:6808:1a09:b0:39e:cb88:17f8 with SMTP id bk9-20020a0568081a0900b0039ecb8817f8mr9119278oib.7.1687247284740;
        Tue, 20 Jun 2023 00:48:04 -0700 (PDT)
Received: from localhost ([124.170.190.103])
        by smtp.gmail.com with ESMTPSA id nr5-20020a17090b240500b0025dc5749b4csm6789071pjb.21.2023.06.20.00.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:48:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jun 2023 17:47:47 +1000
Subject: Re: [PATCH mm-unstable v2 07/10] kvm/powerpc: add
 kvm_arch_test_clear_young()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Yu Zhao" <yuzhao@google.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Paolo Bonzini" <pbonzini@redhat.com>
Message-Id: <CTHB6A4EL3IH.3UJFAJ4LV85X6@wheely>
X-Mailer: aerc 0.14.0
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-8-yuzhao@google.com>
In-Reply-To: <20230526234435.662652-8-yuzhao@google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc
 Zyngier <maz@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas
 Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver
 Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> Implement kvm_arch_test_clear_young() to support the fast path in
> mmu_notifier_ops->test_clear_young().
>
> It focuses on a simple case, i.e., radix MMU sets the accessed bit in
> KVM PTEs and VMs are not nested, where it can rely on RCU and
> pte_xchg() to safely clear the accessed bit without taking
> kvm->mmu_lock. Complex cases fall back to the existing slow path
> where kvm->mmu_lock is then taken.
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h    |  8 ++++
>  arch/powerpc/include/asm/kvm_ppc.h     |  1 +
>  arch/powerpc/kvm/book3s.c              |  6 +++
>  arch/powerpc/kvm/book3s.h              |  1 +
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 59 ++++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c           |  5 +++
>  6 files changed, 80 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 14ee0dece853..75c260ea8a9e 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -883,4 +883,12 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu=
 *vcpu, int cpu) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> =20
> +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> +static inline bool kvm_arch_has_test_clear_young(void)
> +{
> +	return IS_ENABLED(CONFIG_KVM_BOOK3S_HV_POSSIBLE) &&
> +	       cpu_has_feature(CPU_FTR_HVMODE) && cpu_has_feature(CPU_FTR_ARCH_=
300) &&
> +	       radix_enabled();

This could probably be radix_enabled() && !kvmhv_on_pseries(). Although
unclear why not nested hypervisor... I'd have to think about it a bit
more. Do you have any idea what might go wrong, or just didn't have the
time to consider it? (Not just powerpc nested but any others).

> +}
> +
>  #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index 79a9c0bb8bba..ff1af6a7b44f 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -287,6 +287,7 @@ struct kvmppc_ops {
>  	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
>  	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>  	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> +	bool (*test_clear_young)(struct kvm *kvm, struct kvm_gfn_range *range);
>  	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>  	void (*free_memslot)(struct kvm_memory_slot *slot);
>  	int (*init_vm)(struct kvm *kvm);
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 686d8d9eda3e..37bf40b0c4ff 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -899,6 +899,12 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gf=
n_range *range)
>  	return kvm->arch.kvm_ops->test_age_gfn(kvm, range);
>  }
> =20
> +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *ra=
nge)
> +{
> +	return !kvm->arch.kvm_ops->test_clear_young ||
> +	       kvm->arch.kvm_ops->test_clear_young(kvm, range);
> +}
> +
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	return kvm->arch.kvm_ops->set_spte_gfn(kvm, range);
> diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
> index 58391b4b32ed..fa2659e21ccc 100644
> --- a/arch/powerpc/kvm/book3s.h
> +++ b/arch/powerpc/kvm/book3s.h
> @@ -12,6 +12,7 @@ extern void kvmppc_core_flush_memslot_hv(struct kvm *kv=
m,
>  extern bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range=
 *range);
>  extern bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)=
;
>  extern bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *r=
ange);
> +extern bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_rang=
e *range);
>  extern bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *r=
ange);
> =20
>  extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index 3b65b3b11041..0a392e9a100a 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -1088,6 +1088,65 @@ bool kvm_test_age_radix(struct kvm *kvm, struct kv=
m_memory_slot *memslot,
>  	return ref;
>  }
> =20
> +bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_range *rang=
e)
> +{
> +	bool err;
> +	gfn_t gfn =3D range->start;
> +
> +	rcu_read_lock();
> +
> +	err =3D !kvm_is_radix(kvm);
> +	if (err)
> +		goto unlock;
> +
> +	/*
> +	 * Case 1:  This function          kvmppc_switch_mmu_to_hpt()
> +	 *
> +	 *          rcu_read_lock()
> +	 *          Test kvm_is_radix()    kvm->arch.radix =3D 0
> +	 *          Use kvm->arch.pgtable  synchronize_rcu()
> +	 *          rcu_read_unlock()
> +	 *                                 kvmppc_free_radix()
> +	 *
> +	 *
> +	 * Case 2:  This function          kvmppc_switch_mmu_to_radix()
> +	 *
> +	 *                                 kvmppc_init_vm_radix()
> +	 *                                 smp_wmb()
> +	 *          Test kvm_is_radix()    kvm->arch.radix =3D 1
> +	 *          smp_rmb()
> +	 *          Use kvm->arch.pgtable
> +	 */
> +	smp_rmb();

Comment could stand to expand slightly on what you are solving, in
words.

If you use synchronize_rcu() on both sides, you wouldn't need the
barrier, right?

> +	while (gfn < range->end) {
> +		pte_t *ptep;
> +		pte_t old, new;
> +		unsigned int shift;
> +
> +		ptep =3D find_kvm_secondary_pte_unlocked(kvm, gfn * PAGE_SIZE, &shift)=
;
> +		if (!ptep)
> +			goto next;
> +
> +		VM_WARN_ON_ONCE(!page_count(virt_to_page(ptep)));

Not really appropriate at the KVM level. mm enforces this kind of
thing (with notifiers).

> +
> +		old =3D READ_ONCE(*ptep);
> +		if (!pte_present(old) || !pte_young(old))
> +			goto next;
> +
> +		new =3D pte_mkold(old);
> +
> +		if (kvm_should_clear_young(range, gfn))
> +			pte_xchg(ptep, old, new);

*Probably* will work. I can't think of a reason why not at the
moment anyway :)

Thanks,
Nick
> +next:
> +		gfn +=3D shift ? BIT(shift - PAGE_SHIFT) : 1;
> +	}
> +unlock:
> +	rcu_read_unlock();
> +
> +	return err;
> +}
> +
>  /* Returns the number of PAGE_SIZE pages that are dirty */
>  static int kvm_radix_test_clear_dirty(struct kvm *kvm,
>  				struct kvm_memory_slot *memslot, int pagenum)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 130bafdb1430..20a81ec9fde8 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5262,6 +5262,8 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
>  	spin_lock(&kvm->mmu_lock);
>  	kvm->arch.radix =3D 0;
>  	spin_unlock(&kvm->mmu_lock);
> +	/* see the comments in kvm_test_clear_young_hv() */

I'm guilty of such comments at times, but it wouldn't hurt to say
	/* Finish concurrent kvm_test_clear_young_hv access to page tables */

Then you know where to look for more info and you have a vague
idea what it's for.

> +	synchronize_rcu();

>  	kvmppc_free_radix(kvm);
> =20
>  	lpcr =3D LPCR_VPM1;
> @@ -5286,6 +5288,8 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
>  	if (err)
>  		return err;
>  	kvmppc_rmap_reset(kvm);
> +	/* see the comments in kvm_test_clear_young_hv() */
> +	smp_wmb();
>  	/* Mutual exclusion with kvm_unmap_gfn_range etc. */
>  	spin_lock(&kvm->mmu_lock);
>  	kvm->arch.radix =3D 1;
> @@ -6185,6 +6189,7 @@ static struct kvmppc_ops kvm_ops_hv =3D {
>  	.unmap_gfn_range =3D kvm_unmap_gfn_range_hv,
>  	.age_gfn =3D kvm_age_gfn_hv,
>  	.test_age_gfn =3D kvm_test_age_gfn_hv,
> +	.test_clear_young =3D kvm_test_clear_young_hv,
>  	.set_spte_gfn =3D kvm_set_spte_gfn_hv,
>  	.free_memslot =3D kvmppc_core_free_memslot_hv,
>  	.init_vm =3D  kvmppc_core_init_vm_hv,

Thanks for looking at the powerpc conversion!

Thanks,
Nick
