Return-Path: <linuxppc-dev+bounces-6467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B658EA442E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 15:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2KsF5jPSz30CN;
	Wed, 26 Feb 2025 01:35:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740494145;
	cv=none; b=F12P7nT+LcNMQ7JFa7s3eXsQHoxg/u61kddluZI/1tlyOCehn8aFyHnny0ZvSHGBUIK+qbNvLSjXKJ45cCPe8d28ESiGoEYq3u3byQPs6jifyV8B7alFcwlL0wx8KED0UOTFVYrDUl31xZLErO+/gaTgiopCivluAIro8kuNeVefH45TngJqZaiE6wxq2X9B72rO5L0nmhM3ALdcS5j87worCF1+Yph5yQEyok2+/OBxpPp5pmH2+Cvx0Ym6q/ZTrZbUyddreOr4iNa0gUI8cMEfyDrvYo9tgEcTd18kCUC1J2s+9MYldIP61z4YLMN0R5GxooNJAqRXeN3xEpHTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740494145; c=relaxed/relaxed;
	bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RalexKhb9EXrGE6rkYQLPzADgtrWMpVFc2Xcs3C/YjOXdIxXBCyKHxUDsFlj9D7mGMsfR5QeWmzyoc1Fx63Gs1UBtSeEL6EJIwGhGGWNnn1QDepTWMIyV2DM2nmKDiTyKr1m03HnlWh0x+0xEl82YNIbFuwV89+uxSo3fjaYghFeES7nU9CS7JZ6A07+I3HbF0IvrDiZGPKdKBbW5+IvYxixork8lX/LKk3HKA0SrE7B0sMnsjjEw6X/ouOZy0j4tg+xSy5KM10/7pLHSKon75eG78cWxN9gKoCFM5RIldeg3r8PKbBSzYf3eNlISNtPqO3/wqV5k4v4jKiAbk5C7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xg5ElRXP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3pdw9zwykdcqseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xg5ElRXP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3pdw9zwykdcqseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2KsD3YH8z2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 01:35:43 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1a70935fso11879971a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 06:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740494142; x=1741098942; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=Xg5ElRXPaIfi716pPMnL2LytjcOLG6h/dwis8y/7IvQETkItC1pLwdKrdGfEv1nw0+
         bKRqs20yf8fQgH8vSvMu44gGXOv41xWlfw8XFRcJWg6xTEr0VOMIvR0m8UJr3f+lQ5xF
         lUf1rPJbzIvV2eVIc2mZhjCDa954vLqukhFmbxXV4vcZTTvwuSCfQ41l5yiWK2wD9kyt
         14PiRHy8X7puNA0lrkDF6DcBcDtT6NTj9VWgkZVz5Vm54ZIrqjOijqfMuDP6F1ID45Ov
         /sZizDbxtcRSiiE4pZg+E0B2DZgjm/LXGkyt+mZ16K0IAveAW9HnwKETWBZS4eVgpKCM
         enZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494142; x=1741098942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=rIfSiPSGgeNd484QPa5jna7aaF3/PofCCWUFk+UgsJJQFkADHAOBzjZ0Gqa1Gwe/qn
         mbru4LDjj723fuvqzdTKo3kAmGXuxxKd2cxjFe9S+TGsCoieqieM4TqHsDU/TwHuCm6Y
         zuCSWdQtn61qJax0hCaQXz+0B+4gFioAxwCzpkLxovewbLyHb/03go5O+5LFQg/YmOFT
         aPgjdtc02yTFfv0UgACAhn4mZLEgxfs57RlYkFZsfmES1w8aoz+frdZyGMSS4LbXn/F2
         tG8C4ONeD3JxqHHQEECDeU4PUb1KP/t4vhSueY6jbmk1Pv4mghgk/2ggCiXLtGDBqCDL
         GNNA==
X-Forwarded-Encrypted: i=1; AJvYcCXALwUdS8EaPmpg1RGkx/ICyrw17xB8zKMvReqfm07OqnoPzGsPaiC7pkzHmMYCptC02Os3INSgsUXtcfs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyviECyW+/EyN/PJJ3Cp2yWR8itydC8CsvMDv3TNoklV9ZLCW5
	wk2LJjZN/8UyMgIfI4jIO5y69t3uBI/z/Rcb+mW7/jg2Dv+gAbaODcwUGYfZCf6FN4TAN7LQNba
	84w==
X-Google-Smtp-Source: AGHT+IFXh/XOoHWCgjyYmqDQFrw6VQ+lwV1XpaGwsHvB9OE+S78BXcvOxN0p4LNeKFLBgsLwKA4Y+N0kitA=
X-Received: from pjbdj6.prod.google.com ([2002:a17:90a:d2c6:b0:2fa:1fac:269c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8e:b0:2ee:c9b6:c26a
 with SMTP id 98e67ed59e1d1-2fe68ada3bemr5889698a91.11.1740494141828; Tue, 25
 Feb 2025 06:35:41 -0800 (PST)
Date: Tue, 25 Feb 2025 06:35:40 -0800
In-Reply-To: <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-4-seanjc@google.com>
 <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Message-ID: <Z73U38mSuk_tOpqT@google.com>
Subject: Re: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025, Yan Zhao wrote:
> On Mon, Feb 24, 2025 at 03:55:38PM -0800, Sean Christopherson wrote:
> > After freeing a vCPU, assert that it is no longer reachable, and that
> > kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
> > While KVM obviously shouldn't be attempting to access a freed vCPU, it's
> > all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
> > kvm_flush_remote_tlbs().
> > 
> > Alternatively, KVM could short-circuit problematic paths if the VM's
> > refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
> > could try disallow making global requests during teardown.  But given that
> > deleting the vCPU from the array Just Works, adding logic to the requests
> > path is unnecessary, and trying to make requests illegal during teardown
> > would be a fool's errand.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 201c14ff476f..991e8111e88b 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		kvm_vcpu_destroy(vcpu);
> >  		xa_erase(&kvm->vcpu_array, i);
> > +
> > +		/*
> > +		 * Assert that the vCPU isn't visible in any way, to ensure KVM
> > +		 * doesn't trigger a use-after-free if destroying vCPUs results
> > +		 * in VM-wide request, e.g. to flush remote TLBs when tearing
> > +		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
> > +		 */
> > +		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
> As xa_erase() says "After this function returns, loading from @index will return
> %NULL", is this checking of xa_load() necessary?

None of this is "necessary".  My goal with the assert is to (a) document that KVM
relies the vCPU to be NULL/unreachable and (b) to help ensure that doesn't change
in the future.  Checking xa_load() is mostly about (a).

That said, I agree checking xa_load() is more than a bit gratuitous.  I have no
objection to checking only kvm_get_vcpu().

