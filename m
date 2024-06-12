Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E59059F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 19:32:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VWQtyiqO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzszx0222z3cYV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 03:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VWQtyiqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3cdtpzgykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzsz96fhlz3cRY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 03:31:32 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6e73d656bd0so53631a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718213490; x=1718818290; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZttrWbEybPZrU6j9LIdJZge1/Pd2kmv/UPX9FdzbJ4o=;
        b=VWQtyiqOtoP7BUQxG/zaxSCHZB8IKGUWnZiYnRL7b+s+tiin6qmVKHTz6cXurWssxd
         rl4aVgGbXxjOXvH6VgIWRJ+UcStBb+rqfyFxQItaesUWkcBsZZxmgRBAZWqLbTOrokY0
         hsIgW6B3bKM40oc2qEC5WeyrEDGfETZbc6jD8oQ85PAW0OV+W+na/juMbZ9oMeYbOdoD
         HQdhQonQxjESEefj08z5m5DWS/O+z86URCknjlw6WC1UVY33f7lN+/PBRPv/KhTEIYw8
         Vtl4qgF48evTNWJiP9gU/k5w5z/FFo1dqqkN+IbPbZhSqb1Z2i+0cIgimYP1CGPzvnSN
         1PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718213490; x=1718818290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZttrWbEybPZrU6j9LIdJZge1/Pd2kmv/UPX9FdzbJ4o=;
        b=WbPu56E3JTBEP2oFL3fOJj7PpzCVZ94aVPDMtW/BeWLu4XDSUJIErGjdcEbwiOd1Hg
         QWoSJIbWixHsf+V5ahaLvzApKuXl9VLPQMSNpkhSgdlEqpnhlCFOQydf0bMxJf0bJL7Y
         SeCTrix4xPIiIPz/MJCps9S4hj3pHQtMMZh9RswIT/1QKwhbxXt09n4pdyT8Jw/QW+Tf
         mbeovUwuh5LooMMYqJjybcGIuU4BRYxLx7Ju6gvMBxtyUVViw1Q0G1PCgVDJcJ4+xOLt
         RooxIsgEfGmG/VW8yhwIUDwIqYfFs0xtVkfal5l820dUlWr2WO6Dj8uQNx2Go28LARBF
         onSg==
X-Forwarded-Encrypted: i=1; AJvYcCUsWDzV8RaBecMMWlv+BqbQEUJjMqKCvCZOzQL8KYsUXhXBtYRhi1LDTcbPiuVjU6kHiIaBY0ZmtXlyJXfl4FxqAHeBUgScwr9Tx2noEg==
X-Gm-Message-State: AOJu0Yy3YVLQHBbsdYaJ8KqxW/wpjG2c98Fk3AI88Cau8GOno2K+9EtG
	5C0vXOC410/a49uzpmB4Hy4i5JGSMEmfFeW49IN7OdwS3ETbtZn8qyvZpBTyHCBbHPW0hvpgyaj
	M3g==
X-Google-Smtp-Source: AGHT+IEfEUqjAJd5HwtcI3SellD9wJyKICC45AOG2hDSPfUBXvAeRlQriWUGwdY0fjJOl8E1dOYOBVVBc8s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:182:b0:1f3:4b2a:1acb with SMTP id
 d9443c01a7336-1f83b23ddb1mr79315ad.0.1718213489334; Wed, 12 Jun 2024 10:31:29
 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:31:27 -0700
In-Reply-To: <Zmm9SdVfg18RECT5@google.com>
Mime-Version: 1.0
References: <20240405115815.3226315-2-pbonzini@redhat.com> <20240412104408.GA27645@willie-the-truck>
 <86jzl2sovz.wl-maz@kernel.org> <ZhlLHtfeSHk9gRRO@google.com>
 <86h6g5si0m.wl-maz@kernel.org> <Zh1d94Pl6gneVoDd@google.com>
 <20240418141932.GA1855@willie-the-truck> <ZiF6NgGYLSsPNEOg@google.com>
 <20240419112432.GB2972@willie-the-truck> <Zmm9SdVfg18RECT5@google.com>
Message-ID: <Zmnbb-Xlyz4VXNHI@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Marc Zyngier <maz@kernel.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2024, Sean Christopherson wrote:
> On Fri, Apr 19, 2024, Will Deacon wrote:
> > On Thu, Apr 18, 2024 at 12:53:26PM -0700, Sean Christopherson wrote:
> > > On Thu, Apr 18, 2024, Will Deacon wrote:
> > > > > I assume the idea would be to let arch code do single-page invalidations of
> > > > > stage-2 entries for each gfn?
> > > > 
> > > > Right, as it's the only code which knows which ptes actually ended up
> > > > being aged.
> > > > 
> > > > > Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> > > > > doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> > > > > provides an instruction to do broadcast invalidations, but it takes a virtual
> > > > > address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> > > > > a guest virtual address, but it's a moot point because KVM doen't have the guest
> > > > > virtual address, and if it's a host virtual address, there would need to be valid
> > > > > mappings in the host page tables for it to work, which KVM can't guarantee.
> > > > 
> > > > Ah, so it sounds like it would need to be an arch opt-in then.
> > > 
> > > Even if x86 (or some other arch code) could use the precise tracking, I think it
> > > would make sense to have the behavior be arch specific.  Adding infrastructure
> > > to get information from arch code, only to turn around and give it back to arch
> > > code would be odd.
> > 
> > Sorry, yes, that's what I had in mind. Basically, a way for the arch code
> > to say "I've handled the TLBI, don't worry about it."
> > 
> > > Unless arm64 can't do the invalidation immediately after aging the stage-2 PTE,
> > > the best/easiest solution would be to let arm64 opt out of the common TLB flush
> > > when a SPTE is made young.
> > > 
> > > With the range-based flushing bundled in, this?
> > > 
> > > ---
> > >  include/linux/kvm_host.h |  2 ++
> > >  virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++---------------
> > >  2 files changed, 27 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index afbc99264ffa..8fe5f5e16919 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -2010,6 +2010,8 @@ extern const struct kvm_stats_header kvm_vcpu_stats_header;
> > >  extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
> > >  
> > >  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> > > +int kvm_arch_flush_tlb_if_young(void);
> > > +
> > >  static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
> > >  {
> > >  	if (unlikely(kvm->mmu_invalidate_in_progress))
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 38b498669ef9..5ebef8ef239c 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -595,6 +595,11 @@ static void kvm_null_fn(void)
> > >  }
> > >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> > >  
> > > +int __weak kvm_arch_flush_tlb_if_young(void)
> > > +{
> > > +	return true;
> > > +}
> > 
> > I tend to find __weak functions a little ugly, but I think the gist of the
> > diff looks good to me. Thanks for putting it together!
> 
> Circling back to this, I don't think we should pursue this specific tweak, at
> least not without hard data for a concrete use case.

Ha, I spoke too soon.  Based on the learning from the KVM+MGLRU thread[*], it
looks like KVM should omit the TLB flush when aging pages whenever possible.  If
that's not doable on all architectures for whatever reason, then something like
this is probably the way to go.

[*] https://lore.kernel.org/all/CAOUHufYCmYNngmS=rOSAQRB0N9ai+mA0aDrB9RopBvPHEK42Ng@mail.gmail.com
