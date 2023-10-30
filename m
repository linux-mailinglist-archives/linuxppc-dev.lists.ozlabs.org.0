Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4187DC259
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 23:13:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bvATlgQ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK6wD62hLz3cTH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 09:13:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bvATlgQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3pcpazqykdmezlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK6vP0nrTz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 09:12:15 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6b9af7d4168so5053828b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703932; x=1699308732; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8DEvtikhnQyn+T5K55cZjm1cs6/IKtx/WCyiBBil5U=;
        b=bvATlgQ1kJTnF3vtIECyuyLvWf4w3Fw8KD3DzjmokIn/KQuXNkRtFxs5YSBT7R25nb
         cY/Fn5iyHwQY9lMaXtjkL6jI5q09nOXIcJJIura9mu8M27NgL/5nrn7X9pzFKfm2mKKD
         jwVZlG4SJETzxLszhUNT9XZgsjfySiMuQHLB5wWaM5Jei7cgVML/IiGUbgCJ+ZNZUVzS
         BvlTHkyXAJ30acxGXWND/nrFddFfHsKG1vp212J39fL12HsFmIvBqVFlYj7olepMYO1R
         pIOJN8rIaI8bG6ONja7A7QAhfeY1eqVGxTgZXPMDicmpC4BfpE/Al6ZzjgV3vG85A0UI
         +CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703932; x=1699308732;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8DEvtikhnQyn+T5K55cZjm1cs6/IKtx/WCyiBBil5U=;
        b=s608pc0vtzW0RlsERuHozvrLreixulh5SFJudzH222ISkEpwW4JBRT7+AoOD04LRHZ
         3jlbREuiY5Hdyt9q/fXLFMSktuYRHVzcmNUhyjP0aUjFTWu9sCGj4AJk2bxRZVpCtfOh
         DhuIaGhC3Y8EBVNwFplwFEnb7jn95XieppBm7k+uzM4+TRCMiDFzrF6XU5GCNVYawt6v
         G4maRRiVQjUjbIlQdmGg9OOhxQfLBz2dcYpp9FLMewJUxJRj2mWneetTsNTbWpAu98S6
         68L7vsTDBnK0D5LIHy+ajAmqlNm0xfQ/1FHKxb8XsPay+FY5CpqgT3TKfukrgiQccyAN
         dRcA==
X-Gm-Message-State: AOJu0YxmOOU+ouOyNHoolMg1XRckP2U3NM8PnONI0j04jGmaepWX7grl
	nT8GP9FM43E3TIaCKU2uTd8hLbtMjKI=
X-Google-Smtp-Source: AGHT+IGGcxVYGAYGv3uCrE8wHX1TR4p8IURd9gUNgfJNwa+fo9vdIR8HGGPD/6eLST5HVrX+Zf4WM1nECms=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1755:b0:68e:24fe:d9a with SMTP id
 j21-20020a056a00175500b0068e24fe0d9amr205380pfc.2.1698703932137; Mon, 30 Oct
 2023 15:12:12 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:12:10 -0700
In-Reply-To: <ZUARTvhpChFSGF9s@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
Message-ID: <ZUAqOn_zjvM4hukK@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, Sean Christopherson wrote:
> On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> > On 10/27/23 20:21, Sean Christopherson wrote:
> > > 
> > > +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> > > +			size = sizeof(struct kvm_userspace_memory_region);
> > 
> > This also needs a memset(&mem, 0, sizeof(mem)), otherwise the out-of-bounds
> > access of the commit message becomes a kernel stack read.
> 
> Ouch.  There's some irony.  Might be worth doing memset(&mem, -1, sizeof(mem))
> though as '0' is a valid file descriptor and a valid file offset.
> 
> > Probably worth adding a check on valid flags here.
> 
> Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> what if we:
> 
>   1. Acquire/release slots_lock in __kvm_set_memory_region()

Gah, this won't work with x86's usage, which acquire slots_lock quite far away
from __kvm_set_memory_region() in several places.  The rest of the idea still
works, kvm_vm_ioctl_set_memory_region() will just need to take slots_lock manually.

>   2. Call kvm_set_memory_region() from x86 code for the internal memslots
>   3. Disallow *any* flags for internal memslots
>   4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
>   5. Pass @ioctl to kvm_vm_ioctl_set_memory_region() and allow KVM_MEM_PRIVATE
>      only for KVM_SET_USER_MEMORY_REGION2
