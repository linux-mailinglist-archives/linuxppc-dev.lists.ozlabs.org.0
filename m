Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C79056B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:23:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=inU7cJVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzq7T159Mz3fmR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 01:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=inU7cJVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3s71pzgykdkyykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzq6l2GL7z3cyg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 01:22:54 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62834d556feso132643807b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718205771; x=1718810571; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BqD6y0/VOUpbW8YRHgmGoMOpV6WFqVjQFCsKaKlao=;
        b=inU7cJVWX/AB74sp57yc4GPCTopqq89u3IBTi180aMKYHcKTyvasgGQfXtXeM8fgAB
         LcsnhG93+KfwVsqCwf9dYz8r4iqy//9HpC/l0Dc1Ry8FVgzOFOvAIrrnPEN+XxmphhyC
         8SRhrtnt5ek86/yx259o4QYNFEdWNKtIxnhbW9XqH6p6BJh+/YGHn8QfRdo/ZpZpK+Bi
         XVpt3mYdurkBL23c1EV8oAn3jBKM9fcndsQMNBrxEuxtehZ9T+5lvRW/IZG+9knJMxn5
         p7wY2aZ7fQIGji6ATSQlgQoDThYpXlG+EA87q6AiQo8xhoXh5AHO6NvS7E04fHZOzGG0
         IAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205771; x=1718810571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BqD6y0/VOUpbW8YRHgmGoMOpV6WFqVjQFCsKaKlao=;
        b=tdXt3WSzG0cGE3w8llCl8uzQD8tRPiuL+AY8mKr/ghWxlC6iNKMcVuDviA7cirz0+C
         WLDwz1OLXgKaBsrFwY8gXABHW29nRwXae+/VZCJHNh8okagwGf6I+XZGHHNjcs7qGLl5
         S0lTZXtwiWgns7GlUJCqwSp7YsHzKgInq4jwMNH9GQyJn6UBnlVeXtFepX60U+K+lW9W
         p938SL2k68ZwwMx+l4wbRiS8GDQI8LUmj8tVFjRQwcAiKxuZSUKqTtsMG2F7e1sAZemH
         7wkbR9V8m9UMVxyBe4eymlQIoluhbe5etZtXop4ypJyCCepGdSgk2FcNgIqKQ5lv/mgr
         cFJg==
X-Forwarded-Encrypted: i=1; AJvYcCXgsGNcwGtQTx2QDHXn0SqJqYQb4k8nZZyEs7zkN42ahCIZ4g8m70KwWdpeLgH/dXvrS5VScWdyQZTwLMOuxa6JQUlVWbvlavmUTmYcqg==
X-Gm-Message-State: AOJu0YwbNljEtT7GTTleTeauQGqCWbv/Q3Owh+HOoHiOxgbG0dmMYqOK
	aifz6AgUTzCBPiAllw2CnSIWxryxo/s4Nn4d2DOp3TCWYUQj0SicBUtZxtcpVMPpXiLC1OPT7MV
	6CQ==
X-Google-Smtp-Source: AGHT+IGTqFQO1W9uWgNfx86uFJoJR25380gE+MX0EH8aoPTaRHgwGtgxURTOkAOuuR3wa2vaOk4BcpKiUBQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:660c:b0:62f:f535:f2c with SMTP id
 00721157ae682-62ff53512f5mr5078687b3.2.1718205771477; Wed, 12 Jun 2024
 08:22:51 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:22:49 -0700
In-Reply-To: <20240419112432.GB2972@willie-the-truck>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
 <ZiF6NgGYLSsPNEOg@google.com> <20240419112432.GB2972@willie-the-truck>
Message-ID: <Zmm9SdVfg18RECT5@google.com>
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

On Fri, Apr 19, 2024, Will Deacon wrote:
> On Thu, Apr 18, 2024 at 12:53:26PM -0700, Sean Christopherson wrote:
> > On Thu, Apr 18, 2024, Will Deacon wrote:
> > > > I assume the idea would be to let arch code do single-page invalidations of
> > > > stage-2 entries for each gfn?
> > > 
> > > Right, as it's the only code which knows which ptes actually ended up
> > > being aged.
> > > 
> > > > Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> > > > doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> > > > provides an instruction to do broadcast invalidations, but it takes a virtual
> > > > address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> > > > a guest virtual address, but it's a moot point because KVM doen't have the guest
> > > > virtual address, and if it's a host virtual address, there would need to be valid
> > > > mappings in the host page tables for it to work, which KVM can't guarantee.
> > > 
> > > Ah, so it sounds like it would need to be an arch opt-in then.
> > 
> > Even if x86 (or some other arch code) could use the precise tracking, I think it
> > would make sense to have the behavior be arch specific.  Adding infrastructure
> > to get information from arch code, only to turn around and give it back to arch
> > code would be odd.
> 
> Sorry, yes, that's what I had in mind. Basically, a way for the arch code
> to say "I've handled the TLBI, don't worry about it."
> 
> > Unless arm64 can't do the invalidation immediately after aging the stage-2 PTE,
> > the best/easiest solution would be to let arm64 opt out of the common TLB flush
> > when a SPTE is made young.
> > 
> > With the range-based flushing bundled in, this?
> > 
> > ---
> >  include/linux/kvm_host.h |  2 ++
> >  virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++---------------
> >  2 files changed, 27 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index afbc99264ffa..8fe5f5e16919 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2010,6 +2010,8 @@ extern const struct kvm_stats_header kvm_vcpu_stats_header;
> >  extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
> >  
> >  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> > +int kvm_arch_flush_tlb_if_young(void);
> > +
> >  static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
> >  {
> >  	if (unlikely(kvm->mmu_invalidate_in_progress))
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 38b498669ef9..5ebef8ef239c 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -595,6 +595,11 @@ static void kvm_null_fn(void)
> >  }
> >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> >  
> > +int __weak kvm_arch_flush_tlb_if_young(void)
> > +{
> > +	return true;
> > +}
> 
> I tend to find __weak functions a little ugly, but I think the gist of the
> diff looks good to me. Thanks for putting it together!

Circling back to this, I don't think we should pursue this specific tweak, at
least not without hard data for a concrete use case.

The clear_flush_young() hook is the only callback that overloads the return value,
e.g. for invalidate_range_start(), arch code can simply return false if the flush
has already been performed.

And clear_flush_young() _always_ operates on a single page, i.e. the range will
only ever cover a single page in the primary MMU.  It's obviously possible that
KVM's MMU has mapped a transparent hugepage using multiple smaller pages, but
that should be relatively uncommon, and probably not worth optimizing for.
