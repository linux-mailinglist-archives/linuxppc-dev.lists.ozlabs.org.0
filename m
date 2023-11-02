Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3697DF715
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 16:52:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BGrsV6xS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLpL86jFfz3clf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 02:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BGrsV6xS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3ncvdzqykdggykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLpKJ5Q1Fz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 02:52:02 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5b62a669d61so879007a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698940317; x=1699545117; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3KS4TORQ08dXaJsqxd4Pb+jR6Q6AdhcH6h0cpJ7xRs=;
        b=BGrsV6xSz2g5MJR86W+mY3NFbEAdDMt6/T+AYpKyff9Pmv8RWBgl8qWFz/sY5ftJJ/
         efNhwCMLm2aoKoGsOj8/SGftQabfCHOrUtCxctNEvswbIXDZddAaGYJWXU3sLamMCDCz
         nDPVYDmR2La906+YkVkTr0ihLt78I+toHAVp08IChxLuNFNi9vjXT0v+uN8gXZ38O2Ha
         kynXu015qMFd/2Vk4vKRtxc3yt0hP56NeAZ5XkC2/lngxltdCBebtrydx42xZyXQtAN6
         o2WZdydsth1ch0+ocNVoBTjpnvQ4wMe39Re0Rfan8mFuDDSMokswsEv4w3OBi22G32bd
         LoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940317; x=1699545117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3KS4TORQ08dXaJsqxd4Pb+jR6Q6AdhcH6h0cpJ7xRs=;
        b=sJ5xJjZmHRYx+MlA+0SyX3s2ncOyjoV92Bo0YXod8xmWQ7Q3pi4HlkElOZvMaZC50b
         MF1dPCU1RXPuRyWwHfiApeDj1tWT5D9fSMb377lG9l6cG/sJg84rAwntaG0Ua8AlBowy
         MgpkUWC6eDQhRfKuvbXDQBaPLic2la+hrACrEpggJf5oySIFRd09q18gBBDxKIXRCS+g
         EArthtl/LCI3Xo4XzqQDe3c8a3b+0SczAjF/w1XcAlLH/5cT1lGun0wgpyFY2t4fynBk
         O8XfpBRDDCG5rQRBLwn+oUWTcmt3cy/J75mdlDeW3IJ9Csx/RgKNbB80bn14vlQm1p3m
         23dw==
X-Gm-Message-State: AOJu0YyL16xLWKGgPmWENA/AS8HeE4ZzPdapH5u+dzxatbRXaAWWmb0j
	eL7/18D1tmwR6jLBC76QMlp/4JVkFzY=
X-Google-Smtp-Source: AGHT+IFDcwl4s8UdqmTM5rWncqnvjP5M1c0a+jaZEj3IxvzEAcY13jClAPWsClQownnFGH/6j2HG46oUm7Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:efd1:b0:1c6:2b9d:570b with SMTP id
 ja17-20020a170902efd100b001c62b9d570bmr344133plb.7.1698940317130; Thu, 02 Nov
 2023 08:51:57 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:51:55 -0700
In-Reply-To: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Message-ID: <ZUPFmwWjPFlXRlPi@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "willy@infradead.org" <willy@infradead.org>, Wei W Wang <wei.w.wang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "michael.roth@amd.com" <michael.roth@amd.com>, "ackerleytng@google.com" <ackerleytng
 @google.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "mic@digikod.net" <mic@digikod.net>, "tabba@google.com" <tabba@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, "brauner@kernel.org" <brauner@kernel.org>, "qperret@google.com" <qperret@google.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "dmatlack@google.com" <dmatlack@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "amoorthy@google.com" <amoorthy@google.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, "linuxppc-dev@lists.
 ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yilun Xu <yilun.xu@intel.com>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Xiaoyao Li wrote:
> On 11/2/2023 1:36 AM, Sean Christopherson wrote:
> > > KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
> > > <asm/kvm_host.h>?
> > I'd prefer to keep it in generic code, as it's highly likely to end up there
> > sooner than later.  There's a known use case for ARM (exit to userspace on missing
> > userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> > 
> > [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com
> 
> I wonder how this CAP is supposed to be checked in userspace, for guest
> memfd case? 

It's basically useless for guest_memfd.

> 	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
> 	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
> 		abort("unexpected KVM_EXIT_MEMORY_FAULT");
> 
> In my implementation of QEMU patches, I find it's unnecessary. When
> userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies
> "KVM_CAP_MEMORY_FAULT_INFO".
> 
> So I don't see how it is necessary in this series. Whether it's necessary or
> not for [*], I don't have the answer but we can leave the discussion to that
> patch series.

It's not strictly necessary there either.

However, Oliver felt (and presumably still feels) quite strongly, and I agree,
that neither reporting extra information shouldn't be tightly coupled to
KVM_CAP_EXIT_ON_MISSING or KVM_CAP_GUEST_MEMFD.

E.g. if userspace develops a "standalone" use case for KVM_CAP_MEMORY_FAULT_INFO,
userspace should be able to check for support without having to take a dependency
on KVM_CAP_GUEST_MEMFD, especially since because KVM_CAP_GUEST_MEMFD may not be
supported, i.e. userspace should be able to do:

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO))
		abort("KVM_CAP_MEMORY_FAULT_INFO required for fancy feature XYZ");


