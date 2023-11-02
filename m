Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968137DF6C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:45:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZRf5aC2i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLpB03xyHz3cTH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 02:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZRf5aC2i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=39cndzqykdlwugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLp976lxzz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 02:44:57 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9ad9341fso15867337b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698939894; x=1699544694; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWop9ChiDn+5U1d7ZFSKgT7XQaKJkOCdphsca+5hdRc=;
        b=ZRf5aC2iWyxO5l7i+A3jzeVIcadB+G7dBv9y9aZWkIguDPiA6AjQ36jwrp+RSTtoRf
         TKs7fV53uJ/VrXc5fYdv2TSkWeYJFJWf60qLhEZM8H+a8RErlB9eNkUGotBXU/wAsygk
         de/702a6Ivd9Jsizqa1z9KrnBKwZC0zyCRGVvKQ6y/T6RmBvB1zWZXxLrZyqg0Om5y5m
         oaG0BXcqF2PX9TscJy4eki4OphuMVMsjbVCdYgLQvdDbwNbs5p9Aq+YTB3tdkydDu9mW
         hp8eZX05LZKlYkgzE6oQ9esXTsJUnAQ5tKqdyO8+oJFsiHq+IZmCGb5AEfXov7z1+BK/
         8ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698939894; x=1699544694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWop9ChiDn+5U1d7ZFSKgT7XQaKJkOCdphsca+5hdRc=;
        b=LZ2WaGYk+FpoVL+wQnB/tFn8Ce2HtMdULwAgF0LCqIjZ5DAlLlXJMDa6tb1K5JLffW
         6U6GwV9tq/rQ8i9aHcptWcw49LA1rufeW/12L7u+YILktESOH3KhWsa/aA3jK9fmIbC/
         5ZHv9Oh8tQJGcuR6aW6tAW7k82o4o6UgnhSMtrJi56RErZSYa4x825BdVR+jEEfH7xse
         eDokj3yN2ygISqIB6YTaG6NGvbeEybFTKXqHJFLjwp+LpmI077nerBKkt4esF4G5lwwt
         n3ENmg9m24nCtYvQDHc2OdQ3Tl9Rhvo3oXD4BfKFXnisgNlzT1dB1rY56EwAnxWbgupl
         zfig==
X-Gm-Message-State: AOJu0YxdOVaf2Uwh2HQnjzgX6h+/d5wo8axErsxnkM8za4sFVrq/yJEw
	yoT7OF5VFfNyMiNuAI+hfLEd8EmC2Ho=
X-Google-Smtp-Source: AGHT+IEDx2fXN1mZpC4wdLenC0gEZqGHeyYGeZi/NHNboFx849UKp0hRFulm5OGynaHR+kwHxlTzuAC9hXU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d785:0:b0:59b:c811:a709 with SMTP id
 z127-20020a0dd785000000b0059bc811a709mr3270ywd.0.1698939893755; Thu, 02 Nov
 2023 08:44:53 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:44:52 -0700
In-Reply-To: <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
 <32cb71700aedcbd1f65276cf44a601760ffc364b.camel@intel.com> <496b78bb-ad12-4eed-a62c-8c2fd725ec61@redhat.com>
Message-ID: <ZUPD9NWF4eOXqeiA@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mic@digikod.net" <mic@digikod.net>, Kai Huang <kai.huang@intel.com>, "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "willy@infradead.org" <willy@infradead.org>, Wei W Wang <wei.w.wang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "michael.roth@amd.com" <michael.roth@amd.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "viro@
 zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tabba@google.com" <tabba@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, "brauner@kernel.org" <brauner@kernel.org>, "qperret@google.com" <qperret@google.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "dmatlack@google.com" <dmatlack@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, "linux
 ppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yilun Xu <yilun.xu@intel.com>, "amoorthy@google.com" <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> On 11/2/23 10:35, Huang, Kai wrote:
> > IIUC KVM can already handle the case of poisoned
> > page by sending signal to user app:
> > 
> > 	static int kvm_handle_error_pfn(struct kvm_vcpu *vcpu, 			struct
> > kvm_page_fault *fault)                                               	{
> > 		...
> > 
> >        		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> >               		kvm_send_hwpoison_signal(fault->slot, fault->gfn);

No, this doesn't work, because that signals the host virtual address

	unsigned long hva = gfn_to_hva_memslot(slot, gfn);

	send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva, PAGE_SHIFT, current);

which is the *shared* page.

> >                 	return RET_PF_RETRY;
> > 	}
> > 	}
> 
> EHWPOISON is not implemented by this series, so it should be left out of the
> documentation.

EHWPOISON *is* implemented.  kvm_gmem_get_pfn() returns -EWPOISON as appropriate,
and kvm_faultin_pfn() returns that directly without going through kvm_handle_error_pfn().

  kvm_faultin_pfn_private()
  |
  |-> kvm_gmem_get_pfn()
      |
      |-> if (folio_test_hwpoison(folio)) {
		r = -EHWPOISON;
		goto out_unlock;
	  }

          |
          |-> 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
			     &max_order);
		if (r) {
			kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
			return r;
		}

		|
		|-> ret = __kvm_faultin_pfn(vcpu, fault);
		    if (ret != RET_PF_CONTINUE)
			    return ret;

		    if (unlikely(is_error_pfn(fault->pfn)))
			    return kvm_handle_error_pfn(vcpu, fault);
