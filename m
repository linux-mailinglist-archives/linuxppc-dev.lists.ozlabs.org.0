Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 784FE770BF5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:31:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TFcn4Whu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHgRc2k6Hz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TFcn4Whu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::c4a; helo=mail-oo1-xc4a.google.com; envelope-from=3anznzaykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc4a.google.com (mail-oo1-xc4a.google.com [IPv6:2607:f8b0:4864:20::c4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHgQZ3PJCz2ygV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:30:29 +1000 (AEST)
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-56c9a555c0eso3664505eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691188226; x=1691793026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFzzUD1s8YBHblwI04VOeCdWAbdee3I5YnQWnVOxvpo=;
        b=TFcn4WhuF59CuOFW+nA/rZmm0UJ9lmliU/kzI0ZppRYE7sDBYkerAuHzzRxdX3d7+X
         4kzLTKYNiq3+tnYZLXIkLwujJLcAX9xlXFF7P6HucTbVVv4htw7jc7Fx1odjOorNhcMK
         dodd2vDxN7Iv863IP8Ul0VCeKTSNeqWflaPt3PPJv7+5ayDRQWhkgJ+D3K75dcAoYxtZ
         WPhu6CqDtddYxxH4dTGFYTkyLBsWJw8IjQxufeXxzFdyCgNiKmvISMu1mHITGEKHgkkb
         HhwXF5timTSNjIo6jS4S4vsYjZPe1ZaATLPhRP8kRuAhbSLipOJg1Qe8hXm34hNZJUIk
         0cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691188226; x=1691793026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFzzUD1s8YBHblwI04VOeCdWAbdee3I5YnQWnVOxvpo=;
        b=cQgbMM7/TGCOn0esKmAAzx4rGY3FmaSWp+myRk5mkRCLAOWpshCjO1uXcsg2QJNlTj
         8/vM9sGplqTOLDOItUODjJYt62D9TTmm39vUuDMS6YkONwLs35++AL05af4LART0Gew9
         WhZtQ77wSXCEKG8/TnMkXSAyiMQDk5jQ0Ly+nIc9ieWBOo9RB1IvAdGUS6O9iKU0J81L
         A9shYsxz8vEI7aDmG21qLcm58WdmSEAMMFnmPpkm3o5m206GGhhLFXy/t4yKXfgfebgm
         U8Z+T5qIKBkidbm9JUm+6qZngCJvVdzyr7a+qgR8ETP+0bUko/p6CnOtUpYCZJSA7CQo
         rS2g==
X-Gm-Message-State: AOJu0YzNUfRo9IaETS/Ix3GhRuzhY/GNUOIRgU/ZtOScT98BwunuV0iv
	3dl8TF1ksg/TJcntAVVsHK8TziCa2DI=
X-Google-Smtp-Source: AGHT+IG/f7h4NBFD7Fzz9VqAMwBIHPfIp5Oxxm2+KkdFX36TNY82jUIYr8jbB4mGvNrT4WJJhTCK/9o3DZg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6808:198b:b0:3a7:75cd:df61 with SMTP id
 bj11-20020a056808198b00b003a775cddf61mr4531539oib.5.1691188226241; Fri, 04
 Aug 2023 15:30:26 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:30:24 -0700
In-Reply-To: <20230705080756.xv7fm3jxewipunvn@linux.intel.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-5-stevensd@google.com>
 <20230705080756.xv7fm3jxewipunvn@linux.intel.com>
Message-ID: <ZM18AAFj21Fo36hg@google.com>
Subject: Re: [PATCH v7 4/8] KVM: x86/mmu: Migrate to __kvm_follow_pfn
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhang <yu.c.zhang@linux.intel.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 05, 2023, Yu Zhang wrote:
> On Tue, Jul 04, 2023 at 04:50:49PM +0900, David Stevens wrote:
> > From: David Stevens <stevensd@chromium.org>
> > 
> > Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn.

Please turn up your changelog verbosity from ~2 to ~8.  E.g. explain the transition
from async => FOLL_NOWAIT+KVM_PFN_ERR_NEEDS_IO, there's no reason to force readers
to suss that out on their own.

> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 35 +++++++++++++++++++++++++----------
> >  1 file changed, 25 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index ec169f5c7dce..e44ab512c3a1 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4296,7 +4296,12 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
> >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> >  {
> >  	struct kvm_memory_slot *slot = fault->slot;
> > -	bool async;
> > +	struct kvm_follow_pfn foll = {
> > +		.slot = slot,
> > +		.gfn = fault->gfn,
> > +		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> > +		.allow_write_mapping = true,
> > +	};
> >  
> >  	/*
> >  	 * Retry the page fault if the gfn hit a memslot that is being deleted
> > @@ -4325,12 +4330,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  			return RET_PF_EMULATE;
> >  	}
> >  
> > -	async = false;
> > -	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
> > -					  fault->write, &fault->map_writable,
> > -					  &fault->hva);
> > -	if (!async)
> > -		return RET_PF_CONTINUE; /* *pfn has correct page already */
> > +	foll.flags |= FOLL_NOWAIT;
> > +	fault->pfn = __kvm_follow_pfn(&foll);
> > +
> > +	if (!is_error_noslot_pfn(fault->pfn))
> > +		goto success;
> > +
> > +	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
> > +		return RET_PF_CONTINUE;
> 
> IIUC, FOLL_NOWAIT is set only when we wanna an async fault. So
> KVM_PFN_ERR_NEEDS_IO may not be necessary? 

But FOLL_NOWAIT is set above.  This logic is essentially saying "bail immediately
if __gfn_to_pfn_memslot() returned a fatal error".

A commented would definitely be helpful though.  How about?

	/*
	 * If __kvm_follow_pfn() failed because I/O is needed to fault in the
	 * page, then either set up an asynchronous #PF to do the I/O, or if
	 * doing an async #PF isn't possible, retry __kvm_follow_pfn() with
	  I/O allowed. All other failures are fatal, i.e. retrying won't help.
	 */
	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
		return RET_PF_CONTINUE;
