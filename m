Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07C8AA370
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 21:54:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ollrJkVr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL7l84tkYz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 05:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ollrJkVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ohohzgykdokdplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL7kN4y2kz3cfx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 05:53:31 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61ab173fe00so24923177b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713470008; x=1714074808; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fwrx9M7PjHp4hPBDgNAvgC8cnKrAzhv9n1yaPxLSA8=;
        b=ollrJkVrRTQ/M1Cj/wYSBLzZ00Gx3ipLEpU9E5pCmoGN77lpiWqUWwSHm7b9cSRRdq
         j7Du0T09RrTFV6lMXCUrUomAvIa1bac2oORUfokQNWHG8eZJjKBfCC4gxsYt14S0r87N
         8T1aIrIhf8bmsHrq+5yNSoJUI/7i41Cr6HknDSjac61vXGoACXajtSFeG4q+GHnSuvjS
         VIi1S2kWHjyH2S81dx3dhA2Qfw0J7sc/GJYqQjBrbcFjboWTYePLunX6alOJ0MPTTW2J
         vBP3qqanypy8xGWvPeO9CX8Rt1QeXao7/cTBnuVlmox9yZMDFYZnSZJNx90BqeA8vQlt
         oCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713470008; x=1714074808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fwrx9M7PjHp4hPBDgNAvgC8cnKrAzhv9n1yaPxLSA8=;
        b=STsWXJrZFnQndpiDLqZdMFCSxyaY3+xfh7ptjZpIJSx968acxOgIfD8weJVCthdViC
         HEqVcv+b0IEwjYMHZHK4sEmGTgPAiD3UayQMY/U6DxIDDGYx0KohFHhhGZSJWWG58H40
         0gFq5/9/cuw6ADTdIm2swfqUSGOemxfebS3vAXR8N0GhLO/0ia40a3UuSvXLAB/myiBG
         85Hd0SvoIMVCKB058x3CdFef9V5APxDzPR3afLG7e1plTnN4+BaPDJQpvVHEajlz51iy
         25cTNykvGXGabZeYDiNkvASWDH7J6jvp4ZFMv5RyVVuDvaVuRI5DdTS5ru4WJYHKalvF
         McOA==
X-Forwarded-Encrypted: i=1; AJvYcCUro4/0EGQSDQIKlrbYU6D+D5SOQhNWxrkX5d9qWh5IaCQE72RzRtgUT/D61Zpan01ey3t9r88h7d//hI2vaXQK2oEKMKYemC02Zzb5IQ==
X-Gm-Message-State: AOJu0YxfKQA2ywpNZBNu45ZQayLCccmDNJs5Oba3qPvivYyQpvSyoggH
	0cOUDbKdQIQqA9IqZGHe04TQpcKkqaw69kCVyh6I5EIYE+C/eBj0mSvVhCxSl7UybR4qAnb35z2
	UTA==
X-Google-Smtp-Source: AGHT+IGGyn2/Eis9yr5uvFbHSsNr+5jpucEC9aioMrlcMqw+x+tJjikMNMKUFalz9faFMmsjcJGmE2MmVtI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d9d3:0:b0:618:9044:4f8b with SMTP id
 b202-20020a0dd9d3000000b0061890444f8bmr785538ywe.7.1713470008510; Thu, 18 Apr
 2024 12:53:28 -0700 (PDT)
Date: Thu, 18 Apr 2024 12:53:26 -0700
In-Reply-To: <20240418141932.GA1855@willie-the-truck>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
Message-ID: <ZiF6NgGYLSsPNEOg@google.com>
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

On Thu, Apr 18, 2024, Will Deacon wrote:
> On Mon, Apr 15, 2024 at 10:03:51AM -0700, Sean Christopherson wrote:
> > On Sat, Apr 13, 2024, Marc Zyngier wrote:
> > > On Fri, 12 Apr 2024 15:54:22 +0100, Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > On Fri, Apr 12, 2024, Marc Zyngier wrote:
> > > > > On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > > > > > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > > > > > Also, if you're in the business of hacking the MMU notifier code, it
> > > > > > would be really great to change the .clear_flush_young() callback so
> > > > > > that the architecture could handle the TLB invalidation. At the moment,
> > > > > > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > > > > > being set by kvm_handle_hva_range(), whereas we could do a much
> > > > > > lighter-weight and targetted TLBI in the architecture page-table code
> > > > > > when we actually update the ptes for small ranges.
> > > > > 
> > > > > Indeed, and I was looking at this earlier this week as it has a pretty
> > > > > devastating effect with NV (it blows the shadow S2 for that VMID, with
> > > > > costly consequences).
> > > > > 
> > > > > In general, it feels like the TLB invalidation should stay with the
> > > > > code that deals with the page tables, as it has a pretty good idea of
> > > > > what needs to be invalidated and how -- specially on architectures
> > > > > that have a HW-broadcast facility like arm64.
> > > > 
> > > > Would this be roughly on par with an in-line flush on arm64?  The simpler, more
> > > > straightforward solution would be to let architectures override flush_on_ret,
> > > > but I would prefer something like the below as x86 can also utilize a range-based
> > > > flush when running as a nested hypervisor.
> > 
> > ...
> > 
> > > I think this works for us on HW that has range invalidation, which
> > > would already be a positive move.
> > > 
> > > For the lesser HW that isn't range capable, it also gives the
> > > opportunity to perform the iteration ourselves or go for the nuclear
> > > option if the range is larger than some arbitrary constant (though
> > > this is additional work).
> > > 
> > > But this still considers the whole range as being affected by
> > > range->handler(). It'd be interesting to try and see whether more
> > > precise tracking is (or isn't) generally beneficial.
> > 
> > I assume the idea would be to let arch code do single-page invalidations of
> > stage-2 entries for each gfn?
> 
> Right, as it's the only code which knows which ptes actually ended up
> being aged.
> 
> > Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> > doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> > provides an instruction to do broadcast invalidations, but it takes a virtual
> > address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> > a guest virtual address, but it's a moot point because KVM doen't have the guest
> > virtual address, and if it's a host virtual address, there would need to be valid
> > mappings in the host page tables for it to work, which KVM can't guarantee.
> 
> Ah, so it sounds like it would need to be an arch opt-in then.

Even if x86 (or some other arch code) could use the precise tracking, I think it
would make sense to have the behavior be arch specific.  Adding infrastructure
to get information from arch code, only to turn around and give it back to arch
code would be odd.

Unless arm64 can't do the invalidation immediately after aging the stage-2 PTE,
the best/easiest solution would be to let arm64 opt out of the common TLB flush
when a SPTE is made young.

With the range-based flushing bundled in, this?

---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++---------------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index afbc99264ffa..8fe5f5e16919 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2010,6 +2010,8 @@ extern const struct kvm_stats_header kvm_vcpu_stats_header;
 extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
 
 #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
+int kvm_arch_flush_tlb_if_young(void);
+
 static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
 {
 	if (unlikely(kvm->mmu_invalidate_in_progress))
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 38b498669ef9..5ebef8ef239c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -595,6 +595,11 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
+int __weak kvm_arch_flush_tlb_if_young(void)
+{
+	return true;
+}
+
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)	     \
 	for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -611,6 +616,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	struct kvm_gfn_range gfn_range;
 	struct kvm_memory_slot *slot;
 	struct kvm_memslots *slots;
+	bool need_flush = false;
 	int i, idx;
 
 	if (WARN_ON_ONCE(range->end <= range->start))
@@ -663,10 +669,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 					break;
 			}
 			r.ret |= range->handler(kvm, &gfn_range);
+
+		       /*
+			* Use a precise gfn-based TLB flush when possible, as
+			* most mmu_notifier events affect a small-ish range.
+			* Fall back to a full TLB flush if the gfn-based flush
+			* fails, and don't bother trying the gfn-based flush
+			* if a full flush is already pending.
+			*/
+		       if (range->flush_on_ret && !need_flush && r.ret &&
+			   kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start,
+							    gfn_range.end - gfn_range.start + 1))
+			       need_flush = true;
 		}
 	}
 
-	if (range->flush_on_ret && r.ret)
+	if (need_flush)
 		kvm_flush_remote_tlbs(kvm);
 
 	if (r.found_memslot)
@@ -680,7 +698,8 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
-						gfn_handler_t handler)
+						gfn_handler_t handler,
+						bool flush_on_ret)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
 	const struct kvm_mmu_notifier_range range = {
@@ -688,7 +707,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.end		= end,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
-		.flush_on_ret	= true,
+		.flush_on_ret	= flush_on_ret,
 		.may_block	= false,
 	};
 
@@ -700,17 +719,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 							 unsigned long end,
 							 gfn_handler_t handler)
 {
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_mmu_notifier_range range = {
-		.start		= start,
-		.end		= end,
-		.handler	= handler,
-		.on_lock	= (void *)kvm_null_fn,
-		.flush_on_ret	= false,
-		.may_block	= false,
-	};
-
-	return __kvm_handle_hva_range(kvm, &range).ret;
+	return kvm_handle_hva_range(mn, start, end, handler, false);
 }
 
 void kvm_mmu_invalidate_begin(struct kvm *kvm)
@@ -876,7 +885,8 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 {
 	trace_kvm_age_hva(start, end);
 
-	return kvm_handle_hva_range(mn, start, end, kvm_age_gfn);
+	return kvm_handle_hva_range(mn, start, end, kvm_age_gfn,
+				    kvm_arch_flush_tlb_if_young());
 }
 
 static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,

base-commit: eae53272c8ad4e7ed2bbb11bd0456eb5b0484f0c
-- 

