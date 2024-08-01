Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44907944586
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 09:35:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hm6lqGrn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZLNR1Q0gz3cND
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 17:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hm6lqGrn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZLMn0tL6z30T1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 17:35:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8D90CE11E0;
	Thu,  1 Aug 2024 07:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C540CC4AF0A;
	Thu,  1 Aug 2024 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722497697;
	bh=4fAL4cODCnjl0NV8qGw/Qqudnit/5hoHCsZrciMhbUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hm6lqGrnGLdGUt29ZxrQ9cGwGC5e/My8adr9xG8pGwOWvxzaIy2wVVZecHcsaS7MD
	 2vhxDp5qw6P6jWSVDdYpSlndt26lYMY/9L3hrdQVP6XL1jiOwA3de3PchwMF07I1N4
	 2YEHskiwTzLI1+iwXeDgxTjbuc9HN0GjQyrYNiG+t6NhVrrxrlXYCf8VJMbSS/9yNs
	 oHiP/3JEHHEyg0SbxiUkt+heXZ9wY3Uvo6jOHCc4TGv31tTJIER/7SKgCRJbrwGHtk
	 ninurOs1MqcQM+fogPcJEhZWkju/RfarTKElxrf4Eq/YQ9RcoW3WZjBJcrAerVNRjv
	 rukvhfzurLf/A==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <20240726235234.228822-3-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com>
Date: Thu, 01 Aug 2024 13:04:43 +0530
Message-ID: <yq5aikwku25o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> writing guest memory without marking the gfn as dirty in the memslot could
> result in userspace failing to migrate the updated page.  Ideally (maybe?),
> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> and presumably the only use case for copy MTE tags _to_ the guest is when
> restoring state on the target.
>
> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/guest.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index e1f0ff08836a..962f985977c2 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  
>  	mutex_lock(&kvm->slots_lock);
>  
> +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
>

is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ? Should all
those pin request fail if kvm->nr_memslots_dirty_logging != 0? 


>  	while (length > 0) {
>  		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
>  		void *maddr;
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
