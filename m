Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4418F7363A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 08:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RYErAH+m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlcKl14fgz30h9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RYErAH+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlcJq36bQz3038
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 16:33:14 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76243a787a7so336590385a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687242791; x=1689834791;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5+evG04UMHwwjirukN0kb+RSrnzU5xpsvDPn540ciQ=;
        b=RYErAH+mi2zc86r5KWWfsFA8LP9PiwTUwejliV9x5CX3ukRT4UyxAdu8oUINH7+o71
         BABXTb+Al0ui9J0tqzVpEDRuSZr7tolLidH0mp1NHU5h6r01OFWQA5apd8IF14gcAjCV
         ZRWOtKnC/zvWenVhjSYiKmkcKYt4CTOYw+0eRsHFKMmo9NQRqlAgaYQ2+wCBJ5fPad2y
         deRzUvOljVXlVzy6NidHkJvcZ2hSlA4NU0ZEdVHUogrHjN1a2N62u1KbIFT0+ns5rGr1
         FqDT8PFagV1HC5m3wV6nfyjNesWAJV5ePIm4nguSY52ho/FLBHehJd28qB1ZFHtWJmFE
         tW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687242791; x=1689834791;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5+evG04UMHwwjirukN0kb+RSrnzU5xpsvDPn540ciQ=;
        b=lUtm/X3s8lg1kDQZBgeamXlAOoiLyL3nTRxd+nqSmAfg6KrDrr57Q0x0gK6pSZp3rx
         vd/VCYY1lz4DEpvkZA+NxcV2fk7r02ZHggHm65HoMrnoiJhZjefmCcrEmacRGAUN5wad
         6Tw9fZiRUP378aAGC4psLmtWVy5ZmGJF/zGXjdUT/LWRIG8DqMOu+Hm3FwpEcKdxX9nB
         +3RVyJlQyIUmgZF7Ne9AeHaekfD6ri14xIomRUg9jniBEvMg99c15UIoxKxTas5INbLV
         +RpdhuNqxfDgw8hglYPJbPUI1fISgv5kqf8JTh14Yu/SakNg3umyEoCPiih+bm77lVPV
         /S1Q==
X-Gm-Message-State: AC+VfDw3RLZ7wwifXxkY7omXMNA+7h44cqKvwQiyzy9KjkxdimlcL/FE
	b95WjzOKgqsWb8uZgEOyQ+4=
X-Google-Smtp-Source: ACHHUZ5n5K5aPC9bYUBHTpIjgZaXZzWq6qemowxSHihC3bO7xjOaMj7H/aLUT30sH+RFyR4rpOLqsQ==
X-Received: by 2002:a05:620a:3c90:b0:763:a610:bb64 with SMTP id tp16-20020a05620a3c9000b00763a610bb64mr2766292qkn.25.1687242790830;
        Mon, 19 Jun 2023 23:33:10 -0700 (PDT)
Received: from localhost (193-116-195-252.tpgi.com.au. [193.116.195.252])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78d8e000000b0064f708ca12asm622133pfr.70.2023.06.19.23.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 23:33:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jun 2023 16:32:47 +1000
Message-Id: <CTH9N6UYDUM2.1974CRL32YFQC@wheely>
Subject: Re: [PATCH mm-unstable v2 06/10] kvm/powerpc: make radix page
 tables RCU safe
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Yu Zhao" <yuzhao@google.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Paolo Bonzini" <pbonzini@redhat.com>
X-Mailer: aerc 0.14.0
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-7-yuzhao@google.com>
In-Reply-To: <20230526234435.662652-7-yuzhao@google.com>
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
> KVM page tables are currently not RCU safe against remapping, i.e.,
> kvmppc_unmap_free_pmd_entry_table() et al. The previous

Minor nit but the "page table" is not RCU-safe against something. It
is RCU-freed, and therefore some algorithm that accesses it can have
the existence guarantee provided by RCU (usually there still needs
to be more to it).

> mmu_notifier_ops members rely on kvm->mmu_lock to synchronize with
> that operation.
>
> However, the new mmu_notifier_ops member test_clear_young() provides
> a fast path that does not take kvm->mmu_lock. To implement
> kvm_arch_test_clear_young() for that path, orphan page tables need to
> be freed by RCU.

Short version: clear the referenced bit using RCU instead of MMU lock
to protect against page table freeing, and there is no problem with
clearing the bit in a table that has been freed.

Seems reasonable.

>
> Unmapping, specifically kvm_unmap_radix(), does not free page tables,
> hence not a concern.

Not sure if you really need to make the distinction about why the page
table is freed, we might free them via unmapping. The point is just
anything that frees them while there can be concurrent access, right?

>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index 461307b89c3a..3b65b3b11041 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -1469,13 +1469,15 @@ int kvmppc_radix_init(void)
>  {
>  	unsigned long size =3D sizeof(void *) << RADIX_PTE_INDEX_SIZE;
> =20
> -	kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size, 0, pte_ctor)=
;
> +	kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size,
> +					  SLAB_TYPESAFE_BY_RCU, pte_ctor);
>  	if (!kvm_pte_cache)
>  		return -ENOMEM;
> =20
>  	size =3D sizeof(void *) << RADIX_PMD_INDEX_SIZE;
> =20
> -	kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size, 0, pmd_ctor)=
;
> +	kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size,
> +					  SLAB_TYPESAFE_BY_RCU, pmd_ctor);
>  	if (!kvm_pmd_cache) {
>  		kmem_cache_destroy(kvm_pte_cache);
>  		return -ENOMEM;

KVM PPC HV radix PUD level page tables use the arch/powerpc allocators
(for some reason), which are not RCU freed. I think you need them too?
I wouldn't mind if the kvm pud table slab was moved in here instead of
shared.

Thanks,
Nick
