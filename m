Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7477DE1B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 14:42:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jRcODWVN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL7VR0SQxz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 00:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jRcODWVN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mlvczqykdh8vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL7TX027xz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 00:41:50 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a8ee6a1801so80240987b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698846107; x=1699450907; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFf6aEaGwk5ej5JezQy0IgMN87WPAcTCXufwbiE3fug=;
        b=jRcODWVNf4HPt/va7ieM1Oezre/1ZPdWH79NhBnmGGB0VJmJ3hpXQvFc6coh8/MsQL
         d2SU7kvYsXJLZag7WMVg1YXuLvXHUtOogOmTMKcwFemUEa3qujknBlcHhgYgExmILi5T
         ce0DaHXHXVME3BI2k7ph5v8wy7Qt/OMS02Tc+BwAihA4v3HkTdOx8x3HXQGzPELXFqo7
         9rOk30vPGydMWBqkK3IrX29JukAqCgKLTATyDYnZnsdSd+dQEbPTxF7LS7jxm7NIriX+
         ETQX5uXCuilPmIUErywWyRr+g1zPYrFAWzHQoa+SyINAHUwePmvk7gv/gU6QQ0sGBpHY
         y7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846107; x=1699450907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFf6aEaGwk5ej5JezQy0IgMN87WPAcTCXufwbiE3fug=;
        b=srG2NrmsOiDtSsWL7VfR+CyCV05eOCmvbDs6G+gOC4LCB1WhrrbnaMXeCMccB37gGT
         GC3LxIwA8EN2rDQXjeyWM4ZNlsi9UaBiAtZ495Eq6yk5X6fpPVp+qOhmfn90wLhfEhqW
         wTEUE9vcVcfmhsloyG5XqvwzUl7RRSR7FLQg9MrHVH/55qhxjVM8ajK/GtLcTtKcscfx
         DBRblF88iBXrTySJdrn5cv/pXgEaEAnxwb1dqhswwKd+JmjsWiiNg0WxLa0TCzsm7bdx
         tKIst8wx33uCSmlar4fxOTVaJXSkwE6QBJ/dWWkUSPqml+H76S2mwyUTa62KVpBRhCYg
         4rww==
X-Gm-Message-State: AOJu0YwUyQTRYOdiahf4hxpkrPH3dnVwRDCfRrBk63dRZL5Cs2C9SrK1
	zCvJ+pgDKZG+EVA0o/du4vd7MbXmj+c=
X-Google-Smtp-Source: AGHT+IEsRM1yQnQClQeVqyoNLxT9cYgRny7PWezkHcY0wXTm/cdeLyJgnrb+5OZENHYJQKvQlFBt8yx8E+I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e689:0:b0:5a7:bfcf:2cb8 with SMTP id
 p131-20020a0de689000000b005a7bfcf2cb8mr314827ywe.1.1698846106686; Wed, 01 Nov
 2023 06:41:46 -0700 (PDT)
Date: Wed, 1 Nov 2023 06:41:45 -0700
In-Reply-To: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
Message-ID: <ZUJVfCkIYYFp5VwG@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.co
 m>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 01, 2023, Xiaoyao Li wrote:
> On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> > On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> > > On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > > > Extended guest_memfd to allow backing guest memory with transparent
> > > > hugepages. Require userspace to opt-in via a flag even though there's no
> > > > known/anticipated use case for forcing small pages as THP is optional,
> > > > i.e. to avoid ending up in a situation where userspace is unaware that
> > > > KVM can't provide hugepages.
> > > 
> > > Personally, it seems not so "transparent" if requiring userspace to opt-in.
> > > 
> > > People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
> > > support, or check is the sysfs of transparent hugepage exists; 2)get the
> > > maximum support hugepage size 3) ensure the size satisfies the alignment;
> > > before opt-in it.
> > > 
> > > Even simpler, userspace can blindly try to create guest memfd with
> > > transparent hugapage flag. If getting error, fallback to create without the
> > > transparent hugepage flag.
> > > 
> > > However, it doesn't look transparent to me.
> > 
> > The "transparent" part is referring to the underlying kernel mechanism, it's not
> > saying anything about the API.  The "transparent" part of THP is that the kernel
> > doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
> > (mostly) transparent to userspace.
> > 
> > Paolo also isn't the biggest fan[*], but there are also downsides to always
> > allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
> > and there's precedent in the form of MADV_HUGEPAGE.
> > 
> > [*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com
> 
> But it's different than MADV_HUGEPAGE, in a way. Per my understanding, the
> failure of MADV_HUGEPAGE is not fatal, user space can ignore it and
> continue.
>
> However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, which leads
> to failure of guest memfd creation.

Failing KVM_CREATE_GUEST_MEMFD isn't truly fatal, it just requires different
action from userspace, i.e. instead of ignoring the error, userspace could redo
KVM_CREATE_GUEST_MEMFD with KVM_GUEST_MEMFD_ALLOW_HUGEPAGE=0.

We could make the behavior more like MADV_HUGEPAGE, e.g. theoretically we could
extend fadvise() with FADV_HUGEPAGE, or add a guest_memfd knob/ioctl() to let
userspace provide advice/hints after creating a guest_memfd.  But I suspect that
guest_memfd would be the only user of FADV_HUGEPAGE, and IMO a post-creation hint
is actually less desirable.

KVM_GUEST_MEMFD_ALLOW_HUGEPAGE will fail only if userspace didn't provide a
compatible size or the kernel doesn't support THP.  An incompatible size is likely
a userspace bug, and for most setups that want to utilize guest_memfd, lack of THP
support is likely a configuration bug.  I.e. many/most uses *want* failures due to
KVM_GUEST_MEMFD_ALLOW_HUGEPAGE to be fatal.

> For current implementation, I think maybe KVM_GUEST_MEMFD_DESIRE_HUGEPAGE
> fits better than KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?

Why?  Verbs like "prefer" and "desire" aren't a good fit IMO because they suggest
the flag is a hint, and hints are usually best effort only, i.e. are ignored if
there is a fundamental incompatibility.

"Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_MEMFD_USE_HUGEPAGES
or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that KVM doesn't
(yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stronger than
a hint, but weaker than a requirement.  And if/when KVM supports a dedicated memory
pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.
