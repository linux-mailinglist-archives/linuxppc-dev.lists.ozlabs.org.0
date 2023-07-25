Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAAC7620FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:06:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7nXQcBRp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Q2V41wcz3cXV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 04:06:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7nXQcBRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=36w7azaykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Q1X75grz3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 04:05:34 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583da2ac09fso35150867b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690308331; x=1690913131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo8qHauKdQX+T8FT8wbaojm6/JdQZAwM03PT/kIykI=;
        b=7nXQcBRpxoTRBB3DVtfi1G3SLzO+8rbX0pZK3GqB/ZiRovVnhgEY5C+Gs70dPcpJKC
         v8EbJPLKK/PtzLxWiGJ5qeO4LJqB7HN3pWAhYbANBnQSVYoMTUMzCaeCD3zEfSqoM+r2
         fDpLY03C1R0xadVk8zh9oHGZMZqSmWV+dliNXRuRczTowFXc/oEsFJjHeqmHR0h/7zjV
         1SaakHlCZawqmTagIefeOP2xnfIobskVh1rmXibU4Cwg3i96EQeqcAc0By/i+P6tJXi9
         1AMdfmti0ZHyvBS0qJY6Ig052U8rUWQC7aHvZS0sxZXtvMY234BUecIw+5qK/UmUColq
         VbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690308331; x=1690913131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo8qHauKdQX+T8FT8wbaojm6/JdQZAwM03PT/kIykI=;
        b=bhDaHCT8DFAlY13BkwDe7Ju/kZaKFvnOdlXbMRxI691p2w5t0uwuZdAcTBS1S1ooIv
         m6LMJ6EVAAA1AKqQ/X8T1W/Teum3pjruRr+aOgHeavmJfCSew4bokVkbHJtsekBs2dXj
         UOm+/esKZMaItQYTqbZ50fHSHOdv/Ft3wbLZZEOjvNLyNx0YaIgeuQNO72BTialDlHaR
         1FstS01yUdDJI302CplcfJNeQurXTEM6HW1rrIBFC2txgeoD0LWWJ+eg8HHQuXzS53es
         75tyyg7sUITk+sugXo20nWCtviP5HcPvjr1TGzfkZRDf6+b+rCrsbRkl06cEZf5rXB8S
         zYoQ==
X-Gm-Message-State: ABy/qLahC0rdkKi9WyjsLCZLeUyBCnsoTCtGAvRbKf8+LrPSR2DthtMG
	m2deC4wTSxmVSGDfKqARPKqBNhl3rLc=
X-Google-Smtp-Source: APBJJlG+f5K6Guu8BWDh2M0jvEhmql8458IaH+LCw2ABsy+ZDoDj1Vv7TcavygUx+nDEGvPQs1RCmsWjSr8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4509:0:b0:573:5797:4b9e with SMTP id
 s9-20020a814509000000b0057357974b9emr213ywa.1.1690308331572; Tue, 25 Jul 2023
 11:05:31 -0700 (PDT)
Date: Tue, 25 Jul 2023 11:05:29 -0700
In-Reply-To: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com> <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
Message-ID: <ZMAO6bhan9l6ybQM@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Paul Moore <paul@paul-moore.com>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Yan Zhao <yan.y.zhao@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023, Xu Yilun wrote:
> On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> > On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> > 
> > May I know why KVM now needs to register to callback .change_pte()?
> 
> I can see the original purpose is to "setting a pte in the shadow page
> table directly, instead of flushing the shadow page table entry and then
> getting vmexit to set it"[1].
> 
> IIUC, KVM is expected to directly make the new pte present for new
> pages in this callback, like for COW.

Yes.

> > As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> > surrounded by .invalidate_range_{start,end}().
> > 
> > While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> > to zap all leaf SPTEs, and page fault path will not install new SPTEs
> > successfully before kvm_mmu_notifier_invalidate_range_end(),
> > kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> > update PFN.
> 
> I also failed to figure out how the kvm_set_spte_gfn() could pass
> several !is_shadow_present_pte(iter.old_spte) check then write the new
> pte.

It can't.  .change_pte() has been dead code on x86 for 10+ years at this point,
and if my assessment from a few years back still holds true, it's dead code on
all architectures.

The only reason I haven't formally proposed dropping the hook is that I don't want
to risk the patch backfiring, i.e. I don't want to prompt someone to care enough
to try and fix it.

commit c13fda237f08a388ba8a0849785045944bf39834
Author: Sean Christopherson <seanjc@google.com>
Date:   Fri Apr 2 02:56:49 2021 +0200

    KVM: Assert that notifier count is elevated in .change_pte()
    
    In KVM's .change_pte() notification callback, replace the notifier
    sequence bump with a WARN_ON assertion that the notifier count is
    elevated.  An elevated count provides stricter protections than bumping
    the sequence, and the sequence is guarnateed to be bumped before the
    count hits zero.
    
    When .change_pte() was added by commit 828502d30073 ("ksm: add
    mmu_notifier set_pte_at_notify()"), bumping the sequence was necessary
    as .change_pte() would be invoked without any surrounding notifications.
    
    However, since commit 6bdb913f0a70 ("mm: wrap calls to set_pte_at_notify
    with invalidate_range_start and invalidate_range_end"), all calls to
    .change_pte() are guaranteed to be surrounded by start() and end(), and
    so are guaranteed to run with an elevated notifier count.
    
    Note, wrapping .change_pte() with .invalidate_range_{start,end}() is a
    bug of sorts, as invalidating the secondary MMU's (KVM's) PTE defeats
    the purpose of .change_pte().  Every arch's kvm_set_spte_hva() assumes
    .change_pte() is called when the relevant SPTE is present in KVM's MMU,
    as the original goal was to accelerate Kernel Samepage Merging (KSM) by
    updating KVM's SPTEs without requiring a VM-Exit (due to invalidating
    the SPTE).  I.e. it means that .change_pte() is effectively dead code
    on _all_ architectures.
    
    x86 and MIPS are clearcut nops if the old SPTE is not-present, and that
    is guaranteed due to the prior invalidation.  PPC simply unmaps the SPTE,
    which again should be a nop due to the invalidation.  arm64 is a bit
    murky, but it's also likely a nop because kvm_pgtable_stage2_map() is
    called without a cache pointer, which means it will map an entry if and
    only if an existing PTE was found.
    
    For now, take advantage of the bug to simplify future consolidation of
    KVMs's MMU notifier code.   Doing so will not greatly complicate fixing
    .change_pte(), assuming it's even worth fixing.  .change_pte() has been
    broken for 8+ years and no one has complained.  Even if there are
    KSM+KVM users that care deeply about its performance, the benefits of
    avoiding VM-Exits via .change_pte() need to be reevaluated to justify
    the added complexity and testing burden.  Ripping out .change_pte()
    entirely would be a lot easier.
