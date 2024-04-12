Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046028A31A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 16:55:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QgRiuPdT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGKNs5h7wz3vhW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 00:55:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QgRiuPdT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3h0szzgykdficyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGKN604wRz3vbZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 00:54:28 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6ed33476d82so978134b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712933664; x=1713538464; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrmdCrVWtwb7lFW6AyHWbgOgdloa5ymd2fy0iQuLqTo=;
        b=QgRiuPdTb/d17Dd1q+/1zcBuF8dZOzscAsTP/UrqLiqwhM6lr+H22rPiVkyh6tfpHh
         MBdtTljEXsU6+UkGKKaPZI8kIx474iC+n9M2WMhNocmaquNXzQuF4lqUS5MjA08SbvNL
         pf893o/7+E5qUFfxIfCYasJq2QJM4PQZQ42LNsgDgDhRDGHha+n5ElXWLGeKpOJKZoZO
         8R1tAdN3kue8YJFcQrDocUzX0yZdbBeSu6YwdFXHEoF4nCgv42eEVy0O9PX3o51Eccoh
         vyuth75NeS7XGq/MyQNaVKO4ot5U43wuFxdWqt2LLX4QLb53bTcEhkRX5GZz4rm7RZdc
         69xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712933664; x=1713538464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrmdCrVWtwb7lFW6AyHWbgOgdloa5ymd2fy0iQuLqTo=;
        b=ogjaeYoiCCpbTwuITHroNqxzmlFZd0PcPH5krFcjqkVfTg1orXNJeMNpvREiBTnhHD
         7FHu267iaEF+zQ0KKJTTnVzmB9RAaYMjhoDVtPu47tS7RmKUI+x8AaCzj6uMKAIL+l0a
         KksdqUOPtVcc3KIsS5Aas5WTfiVTz+f2rxHTGmFJOKX0MUj8NY6XHZYDU4UBsWlaDL5X
         5++Xl3tpfc/a/9NYkXKkcuO/y5pASX8DGnGP/mnPGhARX9TrbKe80U66U5KrFK7pWcZM
         BS2NKvo4wpyufluR2hqItTyl/a98/X1dpDgOvG3GzZd80mxGN5bxPl62xXt3ONWIQVTo
         e72g==
X-Forwarded-Encrypted: i=1; AJvYcCXq0SdF1vqpzz6YuZeKlNEzv5zs8RFpfkwhyexB7Bw8G+7yV9rp6KU95jdQ386xHHeCEBcpy3id8npcd4Mc2kwh/qGoNbsXUoLKMtgD8g==
X-Gm-Message-State: AOJu0Yy0e87y1zmVJeTnoS/VkpjJIe0yv24RVgmpTLvwe7Zgmuj7ICcc
	ftjgFxQhfP7CxnU81ZjiQ2kSD236GGpvy2g1SW+NJ1+rYEaOc+JqoLnWnoAnMQobo1P3NQc8Jk/
	/lw==
X-Google-Smtp-Source: AGHT+IE8CrGE6yHurBu6oRRUdhNStzcxsQMqGws9O1toyt+VIrjo1lbnGIr3E72VqB9zErBllk+K4v4iLAw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d94:b0:6ed:95ce:3417 with SMTP id
 fb20-20020a056a002d9400b006ed95ce3417mr191844pfb.5.1712933663717; Fri, 12 Apr
 2024 07:54:23 -0700 (PDT)
Date: Fri, 12 Apr 2024 07:54:22 -0700
In-Reply-To: <86jzl2sovz.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
Message-ID: <ZhlLHtfeSHk9gRRO@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024, Marc Zyngier wrote:
> On Fri, 12 Apr 2024 11:44:09 +0100, Will Deacon <will@kernel.org> wrote:
> > On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> > Also, if you're in the business of hacking the MMU notifier code, it
> > would be really great to change the .clear_flush_young() callback so
> > that the architecture could handle the TLB invalidation. At the moment,
> > the core KVM code invalidates the whole VMID courtesy of 'flush_on_ret'
> > being set by kvm_handle_hva_range(), whereas we could do a much
> > lighter-weight and targetted TLBI in the architecture page-table code
> > when we actually update the ptes for small ranges.
> 
> Indeed, and I was looking at this earlier this week as it has a pretty
> devastating effect with NV (it blows the shadow S2 for that VMID, with
> costly consequences).
> 
> In general, it feels like the TLB invalidation should stay with the
> code that deals with the page tables, as it has a pretty good idea of
> what needs to be invalidated and how -- specially on architectures
> that have a HW-broadcast facility like arm64.

Would this be roughly on par with an in-line flush on arm64?  The simpler, more
straightforward solution would be to let architectures override flush_on_ret,
but I would prefer something like the below as x86 can also utilize a range-based
flush when running as a nested hypervisor.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ff0a20565f90..b65116294efe 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -601,6 +601,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
        struct kvm_gfn_range gfn_range;
        struct kvm_memory_slot *slot;
        struct kvm_memslots *slots;
+       bool need_flush = false;
        int i, idx;
 
        if (WARN_ON_ONCE(range->end <= range->start))
@@ -653,10 +654,22 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
                                        break;
                        }
                        r.ret |= range->handler(kvm, &gfn_range);
+
+                       /*
+                        * Use a precise gfn-based TLB flush when possible, as
+                        * most mmu_notifier events affect a small-ish range.
+                        * Fall back to a full TLB flush if the gfn-based flush
+                        * fails, and don't bother trying the gfn-based flush
+                        * if a full flush is already pending.
+                        */
+                       if (range->flush_on_ret && !need_flush && r.ret &&
+                           kvm_arch_flush_remote_tlbs_range(kvm, gfn_range.start
+                                                            gfn_range.end - gfn_range.start + 1))
+                               need_flush = true;
                }
        }
 
-       if (range->flush_on_ret && r.ret)
+       if (need_flush)
                kvm_flush_remote_tlbs(kvm);
 
        if (r.found_memslot)

