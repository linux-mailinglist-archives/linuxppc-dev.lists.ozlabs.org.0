Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263D7A567E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 02:09:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PQV0vXOf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqMV86Npdz3cjx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 10:09:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PQV0vXOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3iuyizqykdkkbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqMTB50nnz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 10:08:45 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58f9db8bc1dso58674887b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695082122; x=1695686922; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dInZugQi4I3jT3AsjQuL7R2MGGG9K+dIBnr86/ph3q8=;
        b=PQV0vXOfgEzAmPHDw6YhuysKnA8wHakbDzDUHvnNM0sXufKo/TXEyyn9MD2sMtMGmJ
         WFUJGng5k8UpiRx1qM63DBLFFhitSKsOrjlYSVdhFLe9yUBRbh9gH7temRahnNzbuIex
         OojLIxIGPradsgsVU5RAOeVgajw+WGFsLL+KIvzW/1L8MKAObGI7BW46lNmmcGvQaDQw
         9Hrt/Djeg1HijpyRr/DaZ4DQC+nCKGbB7gDy+0LVvyJpV9Ni1W/huDL7znfFUxhAtqSG
         63BylD2JTqkQrdKvPC2itVloOhk2jDEzdP3xfG8w02QL8GbzwN6yDsZufLRCdzoWmMXQ
         CU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695082122; x=1695686922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dInZugQi4I3jT3AsjQuL7R2MGGG9K+dIBnr86/ph3q8=;
        b=SeqFbIaSpMEPyHKAr+PIyRul6iudD3jV8PeX1K2efaAex2APCFWtV/9L5h5gdrI0Tn
         xmYMR4xNWPAAqclYUGvEHUronU0FCLu7IMrmDMXd4hGOS6EaHpy7/vWyK6GClLNLyMRg
         L2ZUDWCFldsNSzNzWjyKdpwx2JFBtJi3lZCLtd1Z5WXI7A7k/7ASYIWvznzciAT3faiC
         MABsSWh9tste9eaY9bFjhon5qppu5RzIc70Xwo082XD+P7M0U+FALnpilS8wC3Cgqrbo
         McyCKI9qyRpMkn3KKMeVTeKqzdfDm2K7xOeO66NhYglXo7xn+85KPefRwyYvPJrBq4LO
         PQBg==
X-Gm-Message-State: AOJu0Yw2M/6Qp3JYaapqo8kGitSdl5bh7B0cXMlfaa2QUyArCphad/yW
	ll8PLsH5rQeIZU9nXqQeB2nd1MZsqAY=
X-Google-Smtp-Source: AGHT+IHHNvt5OesaYTZ4SrOkO6G/E0GpOB67x3jgD/5Z7IEbZFEyHH5t/MUiil/50JGkevI3xvv2hT/ge04=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11cf:b0:d80:23ff:ae7f with SMTP id
 n15-20020a05690211cf00b00d8023ffae7fmr237508ybu.4.1695082122578; Mon, 18 Sep
 2023 17:08:42 -0700 (PDT)
Date: Mon, 18 Sep 2023 17:08:40 -0700
In-Reply-To: <20230918180754.iomoaqnw75j3rrxb@amd.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-11-seanjc@google.com>
 <20230918180754.iomoaqnw75j3rrxb@amd.com>
Message-ID: <ZQjmiE7cQ/4UynNz@google.com>
Subject: Re: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Ashish Kalra <Ashish.Kalra@amd.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023, Michael Roth wrote:
> On Wed, Sep 13, 2023 at 06:55:08PM -0700, Sean Christopherson wrote:
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifier
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> > 
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> > 
> > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 ++
> >  virt/kvm/kvm_main.c      | 7 +++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index d8c6ce6c8211..b5373cee2b08 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> >  	gfn_t start;
> >  	gfn_t end;
> >  	union kvm_mmu_notifier_arg arg;
> > +	bool only_private;
> > +	bool only_shared;
> >  	bool may_block;
> >  };
> >  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 174de2789657..a41f8658dfe0 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  			 * the second or later invocation of the handler).
> >  			 */
> >  			gfn_range.arg = range->arg;
> > +
> > +			/*
> > +			 * HVA-based notifications aren't relevant to private
> > +			 * mappings as they don't have a userspace mapping.
> > +			 */
> > +			gfn_range.only_private = false;
> > +			gfn_range.only_shared = true;
> >  			gfn_range.may_block = range->may_block;
> 
> Who is supposed to read only_private/only_shared? Is it supposed to be
> plumbed onto arch code and handled specially there?

Yeah, that's the idea.  Though I don't know that it's worth using for SNP, the
cost of checking the RMP may be higher than just eating the extra faults.

> I ask because I see elsewhere you have:
> 
>     /*
>      * If one or more memslots were found and thus zapped, notify arch code
>      * that guest memory has been reclaimed.  This needs to be done *after*
>      * dropping mmu_lock, as x86's reclaim path is slooooow.
>      */
>     if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
>             kvm_arch_guest_memory_reclaimed(kvm);
> 
> and if there are any MMU notifier events that touch HVAs, then
> kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() will get called,
> which causes the performance issues for SEV and SNP that Ashish had brought
> up. Technically that would only need to happen if there are GPAs in that
> memslot that aren't currently backed by gmem pages (and then gmem could handle
> its own wbinvd_on_all_cpus() (or maybe clflush per-page)). 
> 
> Actually, even if there are shared pages in the GPA range, the
> kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() can be skipped for
> guests that only use gmem pages for private memory. Is that acceptable?

Yes, that was my original plan.  I may have forgotten that exact plan at one point
or another and not communicated it well.  But the idea is definitely that if a VM
type, a.k.a. SNP guests, is required to use gmem for private memory, then there's
no need to blast WBINVD because barring a KVM bug, the mmu_notifier event can't
have freed private memory, even if it *did* zap SPTEs.

For gmem, if KVM doesn't precisely zap only shared SPTEs for SNP (is that even
possible to do race-free?), then KVM needs to blast WBINVD when freeing memory
from gmem even if there are no SPTEs.  But that seems like a non-issue for a
well-behaved setup because the odds of there being *zero* SPTEs should be nil.

> Just trying to figure out where this only_private/only_shared handling ties
> into that (or if it's a separate thing entirely).

It's mostly a TDX thing.  I threw it in this series mostly to "formally" document
that the mmu_notifier path only affects shared mappings.  If the code causes
confusion without the TDX context, and won't be used by SNP, we can and should
drop it from the initial merge and have it go along with the TDX series.
