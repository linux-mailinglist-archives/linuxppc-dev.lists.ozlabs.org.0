Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5867A867A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 16:25:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rPpPY2C7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrLQs5Ky9z3cTt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 00:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rPpPY2C7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3igalzqykdouzlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrLPp4kLmz3cDn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 00:24:13 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-27472e97c0bso4647046a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695219850; x=1695824650; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DOI6e5Fz0eSccYOGv0a2XgOrMIQyrqURVkPdu4XpUSk=;
        b=rPpPY2C7WjkCYrjLAHWzEyz84Tru2xXqHy0qi+eQ7xxWqi1Ty3Qa6njB1x1y7PurM4
         CTfrcTrrgxOvxokXTsHqOs5yKcTuawp2CXD6cE940xAE5g2+TWy+sp952K+pbop8sqFq
         RtJt55xwZTFT9v6iqXYJ4Q/P8COVjObzqwqPE5abBCAOgnznwibULllfbuRf41mP/kQX
         YETQJL9tCUSva6ozspCy5ZPEKkhqZ84si9sPwPWv05Rlcp1qjJ0j6cg/CJff4H+7Tpkg
         Tz1rQ5aELNJ7teylqCSgj7BfK/zd+WiORVy1RcOs9Awkqzfym5tWhdOWUjlSEUWpeVQ+
         uyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219850; x=1695824650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOI6e5Fz0eSccYOGv0a2XgOrMIQyrqURVkPdu4XpUSk=;
        b=QHmqUhjioh3WWQphfE8Qv2KW9remNFtlMXhbfWcEzVfZuiMtqq++jsszw3ulHcOonR
         3v3z6nhrW/8z18HU3BNC/LN8wTwq1x9e66jItK/NYl4UtBxmTyjS9leMEAQe1FYTgAMd
         Y+FAodQsuxJDzW6fMglSZxIEtkfoHF/RAnzFMIEpketr/EGmYPaRaGyQNJBtx0WfM0Di
         fuBDTml7Mq1C3hlAZdnP1/iAZpMFZAwJ+c3PCRfuqsKEplF4iVQj+lDsWRE5wJe8QZ6V
         dkAISmSGwvGs0jLrO+Fq+3b/J9PnVGoclR2hUtdqUDiu9i5XnThc+gbtrcEWO9NVFlXC
         mMEw==
X-Gm-Message-State: AOJu0YwiU5PKlJxE/K5MP5ZyR0cks6nxX9DG0QOO/4yTCdIhTx6pFaJr
	0Alo+O9igCnf+YYgO5+L5G+3cyM4VSI=
X-Google-Smtp-Source: AGHT+IG+7+KaIB01fLVIPGeb7tjb/zu/hrsNFs+xXo/mmyM/aDSVQYbb0kWI4ACm+gkgu18FM/xCEI0V+P0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f203:b0:1c0:ac09:4032 with SMTP id
 m3-20020a170902f20300b001c0ac094032mr25326plc.9.1695219850013; Wed, 20 Sep
 2023 07:24:10 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:24:08 -0700
In-Reply-To: <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-15-seanjc@google.com>
 <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
Message-ID: <ZQsAiGuw/38jIOV7@google.com>
Subject: Re: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 19, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> [...]
> > +
> > +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> > +				      pgoff_t end)
> > +{
> > +	struct kvm_memory_slot *slot;
> > +	struct kvm *kvm = gmem->kvm;
> > +	unsigned long index;
> > +	bool flush = false;
> > +
> > +	KVM_MMU_LOCK(kvm);
> > +
> > +	kvm_mmu_invalidate_begin(kvm);
> > +
> > +	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > +		pgoff_t pgoff = slot->gmem.pgoff;
> > +
> > +		struct kvm_gfn_range gfn_range = {
> > +			.start = slot->base_gfn + max(pgoff, start) - pgoff,
> > +			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
> > +			.slot = slot,
> > +			.may_block = true,
> > +		};
> > +
> > +		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> > +	}
> > +
> > +	if (flush)
> > +		kvm_flush_remote_tlbs(kvm);
> > +
> > +	KVM_MMU_UNLOCK(kvm);
> > +}
> > +
> > +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> > +				    pgoff_t end)
> > +{
> > +	struct kvm *kvm = gmem->kvm;
> > +
> > +	KVM_MMU_LOCK(kvm);
> > +	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT))
> > +		kvm_mmu_invalidate_end(kvm);
> kvm_mmu_invalidate_begin() is called unconditionally in
> kvm_gmem_invalidate_begin(),
> but kvm_mmu_invalidate_end() is not here.
> This makes the kvm_gmem_invalidate_{begin, end}() calls asymmetric.

Another ouch :-(

And there should be no need to acquire mmu_lock() unconditionally, the inode's
mutex protects the bindings, not mmu_lock.

I'll get a fix posted today.  I think KVM can also add a sanity check to detect
unresolved invalidations, e.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7ba1ab1832a9..2a2d18070856 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1381,8 +1381,13 @@ static void kvm_destroy_vm(struct kvm *kvm)
         * No threads can be waiting in kvm_swap_active_memslots() as the
         * last reference on KVM has been dropped, but freeing
         * memslots would deadlock without this manual intervention.
+        *
+        * If the count isn't unbalanced, i.e. KVM did NOT unregister between
+        * a start() and end(), then there shouldn't be any in-progress
+        * invalidations.
         */
        WARN_ON(rcuwait_active(&kvm->mn_memslots_update_rcuwait));
+       WARN_ON(!kvm->mn_active_invalidate_count && kvm->mmu_invalidate_in_progress);
        kvm->mn_active_invalidate_count = 0;
 #else
        kvm_flush_shadow_all(kvm);


or an alternative style

	if (kvm->mn_active_invalidate_count)
		kvm->mn_active_invalidate_count = 0;
	else
		WARN_ON(kvm->mmu_invalidate_in_progress)

> > +	KVM_MMU_UNLOCK(kvm);
> > +}
> > +
> > +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> > +{
> > +	struct list_head *gmem_list = &inode->i_mapping->private_list;
> > +	pgoff_t start = offset >> PAGE_SHIFT;
> > +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> > +	struct kvm_gmem *gmem;
> > +
> > +	/*
> > +	 * Bindings must stable across invalidation to ensure the start+end
> > +	 * are balanced.
> > +	 */
> > +	filemap_invalidate_lock(inode->i_mapping);
> > +
> > +	list_for_each_entry(gmem, gmem_list, entry) {
> > +		kvm_gmem_invalidate_begin(gmem, start, end);
> > +		kvm_gmem_invalidate_end(gmem, start, end);
> > +	}
> Why to loop for each gmem in gmem_list here?
> 
> IIUIC, offset is the offset according to the inode, it is only meaningful to
> the inode passed in, i.e, it is only meaningful to the gmem binding with the
> inode, not others.

The code is structured to allow for multiple gmem instances per inode.  This isn't
actually possible in the initial code base, but it's on the horizon[*].  I included
the list-based infrastructure in this initial series to ensure that guest_memfd
can actually support multiple files per inode, and to minimize the churn when the
"link" support comes along.

[*] https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com

