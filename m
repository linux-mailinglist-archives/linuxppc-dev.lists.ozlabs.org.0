Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF290454F20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvbG969KLz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 08:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=twosheds.20170209 header.b=fInAvRfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=twosheds.srs.infradead.org (client-ip=90.155.92.209;
 helo=twosheds.infradead.org;
 envelope-from=batv+0735d41a693d94fcd523+6660+infradead.org+dwmw2@twosheds.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=twosheds.20170209 header.b=fInAvRfb; 
 dkim-atps=neutral
Received: from twosheds.infradead.org (twosheds.infradead.org [90.155.92.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvbFQ4Q6Kz2xDC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 08:11:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=PY24mY1Y2geRmk7LjuGhOiKBHR3iZW7SC/NuUGtVeMM=; b=fInAvRfbXmsj2mRaAOMhBYLcLy
 rNV3j1Ejy+5tp8+gefj0Ci1K8wUw/TqCwo4phGfDDq1OEX+zE3T5+9J+WUu8XZ68WvfujlJMgRUdq
 fxcgLANbQ0bA5uHCFb8tfnVZy19nrvr3qujLNM1CEy+eRbFuppcsu+2Gu1haaPtMH2OZeBT48dIJ+
 MgZ7cnFoCPvFUVHKjy+wj1KRDU0pwv46XKxGiQF5msM9UIjM+UBm/pQusxMLzB2JKBaHEMNFaf1cY
 EwEp9WOb3Jf2IfUCshGJH9Upz2d6mUreD3M3e/7okHzoEyb/daAOFczuRJZBRtYk6sazwxlVM7FPi
 Qu9mdBIA==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnSBT-00FV0l-BJ; Wed, 17 Nov 2021 21:09:35 +0000
Received: from 2001:8b0:10b:1:d129:67c1:5868:c3aa
 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Wed, 17 Nov 2021 21:09:35 -0000
Message-ID: <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
In-Reply-To: <20211117174003.297096-9-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 21:09:35 -0000
Subject: Re: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
From: "David Woodhouse" <dwmw2@infradead.org>
To: "David Woodhouse" <dwmw2@infradead.org>
User-Agent: SquirrelMail/1.4.23 [SVN]-5.fc33.20190710
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>, kvm <kvm@vger.kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets @ redhat . com" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The kvm_dirty_ring_get() function uses kvm_get_running_vcpu() to work out
> which dirty ring to use, but there are some use cases where that doesn't
> work.
>
> There's one in setting the Xen shared info page, introduced in commit
> 629b5348841a ("KVM: x86/xen: update wallclock region") and reported by
> "butt3rflyh4ck" <butterflyhuangxx@gmail.com> in
> https://lore.kernel.org/kvm/CAFcO6XOmoS7EacN_n6v4Txk7xL7iqRa2gABg3F7E3Naf5uG94g@mail.gmail.com/
>
> There's also about to be another one when the newly-reintroduced
> gfn_to_pfn_cache needs to mark a page as dirty from the MMU notifier
> which invalidates the mapping. In that case, we will *know* the vcpu
> that can be 'blamed' for dirtying the page, and we just need to be
> able to pass it in as an explicit argument when doing so.
>
> This patch preemptively resolves the second issue, and paves the way
> for resolving the first. A complete fix for the first issue will need
> us to switch the Xen shinfo to be owned by a particular vCPU, which
> will happen in a separate patch.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>



> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -36,12 +36,16 @@ static bool kvm_dirty_ring_full(struct kvm_dirty_ring
> *ring)
>  	return kvm_dirty_ring_used(ring) >= ring->size;
>  }
>
> -struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm)
> +struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm, struct
> kvm_vcpu *vcpu)
>  {
> -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> +	struct kvm_vcpu *running_vcpu = kvm_get_running_vcpu();
>
> +	WARN_ON_ONCE(vcpu && vcpu != running_vcpu);
>  	WARN_ON_ONCE(vcpu->kvm != kvm);

Ah, that one needs to be changed to check running_vcpu instead. Or this
needs to go first:

I think I prefer making the vCPU a required argument. If anyone's going to
pull a vCPU pointer out of their posterior, let the caller do it.

> +	if (!vcpu)
> +		vcpu = running_vcpu;
> +
>  	return &vcpu->dirty_ring;
>  }
>

-- 
dwmw2

