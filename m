Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496769B019
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:01:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJGkl349Wz3fJK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sUkblHuJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3iatvywykdlyoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sUkblHuJ;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJGjp6c09z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:00:13 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id w18-20020a634912000000b004fb4f0424f3so780110pga.14
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ASrBAOfhB8V2b1UWnVkBSljvQtym3PPwSnuFL8RngU=;
        b=sUkblHuJ9dulsxh4CZcm+FIp/qRpAAcmRtfvp6ULnSXppIvCitchjm1OUit+QXJRWj
         fwJ7Xd7LeD3Frj7FzM+U/mMAyXTZ8R5RK0CcMGNMR8PLROcI0/4xgADL5vqH5U+/VYgG
         dkLQqFX5fKeKJhpV5Gz8z+39KNbu/jjFTFfYD8mmFsM5kC/nK+Gp9BDhC26xn+icV0pC
         bHQSk7Mqvc6fB6p4dz8MrdQupt1NEggpWvfcZBir6hbXow/Kay6VqXDNaQVda+8NmyZ/
         DJpPCojT4dj2fTwoDxf+msJ00C5RYvwVAx1bbgonDLlmp6LfYVABRQ30VMxJGXDgaHEA
         nfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ASrBAOfhB8V2b1UWnVkBSljvQtym3PPwSnuFL8RngU=;
        b=JCLwjrA67syY2dmIuxf73wVSAszLEr8g2WErAW6KSKiOcdulTv/Amh63jtdjWaul/Z
         5VBzywzqj0V2JU/akimRQ5KD4rCBFNjFYX2CDcbKSBBOFIWwQCRBx5vgZQZAwiyjmZ+y
         uktx0N6ECwiIi4tZPpS2CN9lDLiR8REzJEEbAfAtnFsF9EU65UgxrIIklmbGx52LIb6G
         m04/ciKzDoLrtcWYg1IgrPQSTjo+5nx6ANwerTl5jG0onThcyLjkXwUN01F6nbT+bqZs
         ANgF7DDRVz+DgiKd6PST1QIwp/gsp1vJQzCZnL0xgCRYLCCaHui/Oenuh4mCzTpZhg/r
         eRyA==
X-Gm-Message-State: AO0yUKXgwbpXYkO43cGx/yRsZYLn2CmoXV/9uiI8d/5oV4ZJh3G6yy8x
	S9B/04GJWF7u5vIuIuBAMtEIe7UWoOA=
X-Google-Smtp-Source: AK7set/TQ5moWaaNQcL8V8kGjN9B7zl+2zJIJ8kumCX3x4I/RGgInnGSIHRIAYNv9fJ3WTWtfSDyzLo0yfI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:43:b0:4fd:72f3:5859 with SMTP id
 az3-20020a056a02004300b004fd72f35859mr296462pgb.2.1676649609963; Fri, 17 Feb
 2023 08:00:09 -0800 (PST)
Date: Fri, 17 Feb 2023 08:00:08 -0800
In-Reply-To: <Y+9EUeUIS/ZUe2vw@linux.dev>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
 <Y+9EUeUIS/ZUe2vw@linux.dev>
Message-ID: <Y++kiJwUIh55jkvl@google.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
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
Cc: linux-mm@google.com, Yu Zhao <yuzhao@google.com>, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023, Oliver Upton wrote:
> Hi Yu,
> 
> scripts/get_maintainers.pl is your friend for getting the right set of
> emails for a series :) Don't know about others, but generally I would
> prefer to be Cc'ed on an entire series (to gather context) than just an
> individual patch.

+1

> 
> On Thu, Feb 16, 2023 at 09:12:28PM -0700, Yu Zhao wrote:
> > This patch adds kvm_arch_test_clear_young() for the vast majority of
> > VMs that are not pKVM and run on hardware that sets the accessed bit
> > in KVM page tables.

At least for the x86 changes, please read Documentation/process/maintainer-tip.rst
and rewrite the changelogs.

> > It relies on two techniques, RCU and cmpxchg, to safely test and clear
> > the accessed bit without taking the MMU lock. The former protects KVM
> > page tables from being freed while the latter clears the accessed bit
> > atomically against both the hardware and other software page table
> > walkers.
> > 
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h       |  7 +++
> >  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
> >  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
> >  arch/arm64/kvm/arm.c                    |  1 +
> >  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
> >  arch/arm64/kvm/mmu.c                    | 77 ++++++++++++++++++++++++-
> >  6 files changed, 141 insertions(+), 46 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 35a159d131b5..572bcd321586 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1031,4 +1031,11 @@ static inline void kvm_hyp_reserve(void) { }
> >  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
> >  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
> >  
> > +/* see the comments on the generic kvm_arch_has_test_clear_young() */

Please eliminate all of these "see the comments on blah", in every case they do
nothing more than redirect the reader to something they're likely already aware of.

> > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > +static inline bool kvm_arch_has_test_clear_young(void)
> > +{
> > +	return IS_ENABLED(CONFIG_KVM) && cpu_has_hw_af() && !is_protected_kvm_enabled();
> > +}

...

> Also, I'm at a loss for why we'd need to test if CONFIG_KVM is enabled.
> My expectation is that we should provide an implementation that returns
> false if !CONFIG_KVM, avoiding the need to repeat that bit in every
> single implementation of the function.

mm/vmscan.c uses kvm_arch_has_test_clear_young().  I have opinions on that, but
I'll hold off on expressing them until there's actual justification presented
somewhere.

Yu, this series and each patch needs a big pile of "why".  I get that the goal
is to optimize memory oversubscribe, but there needs to be justification for
why this is KVM only, why nested VMs and !A/D hardware are out of scope, why yet
another mmu_notifier hook is being added, etc.
