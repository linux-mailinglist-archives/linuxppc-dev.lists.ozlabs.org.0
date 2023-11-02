Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6987DF755
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 17:04:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aU1idF4w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLpbm4hm3z3cY5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 03:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aU1idF4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3ymhdzqykddefrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLpZs4gfXz2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 03:03:47 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc391ca417so9335295ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698941024; x=1699545824; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iqXbuRKMyvTfyAi0R6oHncN26PfYTo3tctDI41vJWU=;
        b=aU1idF4wvXgG9iFT3OhIKiYQd5c3QGnxWiuQq/Wl/VHcyEJfgLIorrp/hlbZC3XymU
         YdIBoEPnFgseCsz4URfsLUMbuXuFWv/uhNBKVqdlDt3272VchtazG8yk0KCvvhLVka1d
         ONy7lQE+rJaZegekNU0+qy/TfctpuLH9MO5Sg+DJdbsv76W3pjp1z0Gt7MYmOF/5W3Gj
         waFU/GJ7YtX7KZIY6p+Q3my7KHhN+PrPXsQ+EEA+4HpPSdgzxELo/ZexgmL143pGkLq0
         mp8JAqHurianr/Mpa0QGPmmLkdeoXVnP11K3cl+UOkHOUXd62fxbbGHZc1W2jzlvRyoH
         zzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698941024; x=1699545824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iqXbuRKMyvTfyAi0R6oHncN26PfYTo3tctDI41vJWU=;
        b=XnccxSXRXeyQrbPtdh3iXAkV6v128p8ncImEAzK597tY0BFQ49ynT8AMfjo8ZFG7ca
         HuIA5BDgAX0LmvodlXaj23nix8ZUHW1MRuGxx+d5yV2qMK2sUwWp/r9guyaaIT1rFZ2O
         3dEtppae8gGWFsFX9srYoqKvidnGU4Y1hNVYMbj544IMoRzuLx6wRk7W60SvpznMQj4l
         ev1M4vvoIM5wMlQ5PTJ+t7cStFjjLHb5K8w/APxJbLsuKgdKzZdaAb4MRorhxJHDA1l1
         JbeWhPuacJD/Ri2a4uZcwvF2vlhvn3jN6noxMxrL6EwOj6Ndhdf6X8cPQM4a7BxhNUml
         ensQ==
X-Gm-Message-State: AOJu0YwcELuI1Cut9pPG+M5QK2kbIZfqn5zTGGP7r+6b8rzbEFOuKzMr
	ua0acQz/hBbGvV1Fddr+/O6aewNyWro=
X-Google-Smtp-Source: AGHT+IFM1Nz2eAP9Xmws9JoQjAGGS19Q55KF/ifRxAflcrAzQHFBFIOS8V+26ERzfv1Lm5CG2bErCCPJO0Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1304:b0:1cc:2ffe:5a33 with SMTP id
 iy4-20020a170903130400b001cc2ffe5a33mr266680plb.8.1698941024519; Thu, 02 Nov
 2023 09:03:44 -0700 (PDT)
Date: Thu, 2 Nov 2023 09:03:42 -0700
In-Reply-To: <6642c379-1023-4716-904f-4bbf076744c2@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com> <6642c379-1023-4716-904f-4bbf076744c2@redhat.com>
Message-ID: <ZUPIXt1XzZrriswG@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, A
 nup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> On 10/31/23 23:39, David Matlack wrote:
> > > > Maybe can you sketch out how you see this proposal being extensible to
> > > > using guest_memfd for shared mappings?
> > > For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.  What's
> > > missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM needs to
> > > ensure there are no outstanding references when converting back to private.
> > > 
> > > For TDX/SNP, assuming we don't find a performant and robust way to do in-place
> > > conversions, a second fd+offset pair would be needed.
> > Is there a way to support non-in-place conversions within a single guest_memfd?
> 
> For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to guest
> memory.  The hook would invalidate now-private parts if they have a VMA,
> causing a SIGSEGV/EFAULT if the host touches them.
> 
> It would forbid mappings from multiple gfns to a single offset of the
> guest_memfd, because then the shared vs. private attribute would be tied to
> the offset.  This should not be a problem; for example, in the case of SNP,
> the RMP already requires a single mapping from host physical address to
> guest physical address.

I don't see how this can work.  It's not a M:1 scenario (where M is multiple gfns),
it's a 1:N scenario (wheren N is multiple offsets).  The *gfn* doesn't change on
a conversion, what needs to change to do non-in-place conversion is the pfn, which
is effectively the guest_memfd+offset pair.

So yes, we *could* support non-in-place conversions within a single guest_memfd,
but it would require a second offset, at which point it makes sense to add a
second file descriptor as well.  Userspace could still use a single guest_memfd
instance, i.e. pass in the same file descriptor but different offsets.
