Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3527A0726
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 16:20:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w1cB3UVe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmfcc2x1dz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 00:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w1cB3UVe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jxydzqykdpyqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmfbk4ywBz3c2D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 00:20:01 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d8186d705a9so1257619276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694701199; x=1695305999; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OinN3M2z4I/Qg8aCda0iI1MRdyz332KlEPPYu5muKwI=;
        b=w1cB3UVevpj1o+dTt/KT8fCwRQTsIwv4HewO940j2MuwOOY3ptGrdbG7LBQ4aghhKr
         477vi+SqaHFGkfxN23UrtIdwdLQZLcnvy2APdyXRhfVPZHy5c03mWwE1do1VjpYnfhSn
         k2xkSHZdbxpr3pPu7IWCK1HTsIp0XF9Txiv6Vqph6wsBV41oTg8gM0A6nVCO/CyoYUdO
         3n7FNvGI8FN8UQf51cuOjOvSbVf9wvTFyviFoWTe32gYGsQqF/KvJP6dSy73Zl9pVPrc
         1t9VN3s333LUFfbUYQEIW1EgrMeaU8gZx4cBxZ0+F/U5shsToNzv/TUEPnfa/UYP50Mz
         NdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701199; x=1695305999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OinN3M2z4I/Qg8aCda0iI1MRdyz332KlEPPYu5muKwI=;
        b=XPu1SddZKNgALrlah3BgFUHWKXk76lUmeWrK/cnpPsmkTCXCfrz2qUtqg3GolOZfII
         5PXlXJQVitBxvHgdBztjiHvPQgffmhEEWeHg8k59fC7XtvieoT/JsMelV1efATiXPuMq
         OabxmaH65T/lDGtg/BZJhs2JYOoaJrr6C/NyLbaOVTkIJNYY4t2xGZoVJSr+VnO7Unuj
         Iznn5pfIdAADgql4wLeyDAaMJYeWpaL7oVQbj6L5UoIBwXujZXDASixZHzDMxiqVQ0G5
         YN2LalLamZAAD3XOe1wsR3JM7vuP3w6aKltFWfyBGi6sl461icfU2vGc8dRp6gs4QjiO
         klmA==
X-Gm-Message-State: AOJu0YzX20Kr+y7FUIvojjm8xCW7fsegs6SwrNU4AtAukCnK75nYXw/r
	5qn5gRK8jKnvwPpQ4eareYJgGwrAoY0=
X-Google-Smtp-Source: AGHT+IEn69IOl2rxglDVCjXW4KTdScyqCw6tLi48MQpyb+nW1MjRKbjq1lfqPgEextp+IedkDxkiKrdOCXU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e6c4:0:b0:d78:f45:d7bd with SMTP id
 d187-20020a25e6c4000000b00d780f45d7bdmr129688ybh.4.1694701199053; Thu, 14 Sep
 2023 07:19:59 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:19:57 -0700
In-Reply-To: <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <54d3e6bf-d374-caa5-0920-bb2fe3b7595c@linux.intel.com>
Message-ID: <ZQMWjbt/SzKvag2K@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
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

On Thu, Sep 14, 2023, Binbin Wu wrote:
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > +void kvm_mmu_invalidate_end(struct kvm *kvm)
> >   {
> >   	/*
> >   	 * This sequence increase will notify the kvm page fault that
> > @@ -833,6 +848,13 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
> >   	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
> >   	 */
> >   	kvm->mmu_invalidate_in_progress--;
> > +
> > +	/*
> > +	 * Assert that at least one range must be added between start() and
> > +	 * end().  Not adding a range isn't fatal, but it is a KVM bug.
> > +	 */
> > +	WARN_ON_ONCE(kvm->mmu_invalidate_in_progress &&
> > +		     kvm->mmu_invalidate_range_start == INVALID_GPA);
> Should the check happen before the decrease of kvm->mmu_invalidate_in_progress?
> Otherwise, KVM calls kvm_mmu_invalidate_begin(), then kvm_mmu_invalidate_end()
> the check will not take effect.

Indeed.  I'm pretty sure I added this code, not sure what I was thinking.  There's
no reason to check mmu_invalidate_in_progress, it's not like KVM allows
mmu_invalidate_in_progress to go negative.  The comment is also a bit funky.  I'll
post a fixup patch to make it look like this (assuming I'm not forgetting a subtle
reason for guarding the check with the in-progress flag):

	/*
	 * Assert that at least one range was added between start() and end().
	 * Not adding a range isn't fatal, but it is a KVM bug.
	 */
	WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA);

Regarding kvm->mmu_invalidate_in_progress, this would be a good opportunity to
move the BUG_ON() into the common end(), e.g. as is, an end() without a start()
from something other than the generic mmu_notifier would go unnoticed.  And I
_think_ we can replace the BUG_ON() with a KVM_BUG_ON() without putting the
kernel at risk.  E.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dd948276e5d6..54480655bcce 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -870,6 +870,7 @@ void kvm_mmu_invalidate_end(struct kvm *kvm)
         * in conjunction with the smp_rmb in mmu_invalidate_retry().
         */
        kvm->mmu_invalidate_in_progress--;
+       KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
 
        /*
         * Assert that at least one range was added between start() and end().
@@ -905,8 +906,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
         */
        if (wake)
                rcuwait_wake_up(&kvm->mn_memslots_update_rcuwait);
-
-       BUG_ON(kvm->mmu_invalidate_in_progress < 0);
 }
 
 static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,

