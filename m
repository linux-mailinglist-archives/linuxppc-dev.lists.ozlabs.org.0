Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970E7DE4AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 17:37:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z/yAGuKn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLCMZ3y04z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 03:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z/yAGuKn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3cn5czqykdkkbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLCLf5d6Bz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 03:36:08 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9cb4de3bf0so7625703276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698856562; x=1699461362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azJu2Dh8gujl5qnxyYwo1n6krfiG0RwudOI1y5vnuB4=;
        b=z/yAGuKnqcViV8avRK1U3o0lvPkEgDxvLzNg9S2gZ/vtTUMh8Vp9ZCQm5pagew/hJX
         2C29yM5odElorh3x8b/6bB0ncbh9ex+WsjUMfrdMrQkiUZl4MqYVEIOuCAnkyPswRloB
         4uLXaxlyfVHzsZB7DAvLeOWHStudgvIAohhKPYw/vRcTiPQBoMXVMsvO0TtAiVYs2Xv4
         Wfrc+oildBXbzXr4kdn8wiwzU94eVO6lfrCUIFdHQswSpfX7V2NKaKw+ruJw9JGoNZp+
         Q3pXLg51EbtcCo/pA5kwAPC7x7clBoLsmKwI6z2XMnM9FGiDZNZ+b0RYB28gscCvpUrJ
         PUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698856562; x=1699461362;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azJu2Dh8gujl5qnxyYwo1n6krfiG0RwudOI1y5vnuB4=;
        b=fiQdqVijSxee8yD6xNbXe6L/0AQoQUB3fwv8upFj9PXmOmx6645aDxWbe8D/meAaVq
         NFKWV3JSfnjNQxp/K9GT4trM8nFBHJm8LHmoABH22Fl7cbwqsin1qyP/ngQMdQf/SEMJ
         CZtVNYdO8eSi5AY+nVX2jGi4iBo3zBiTq4yEfaWYg7wdWjt3zsAyKnKdvUQw8sV9FFkW
         ohLW5DffvXF/41nmy61DsODsT8WQ+UE9IcnzVXgKdhuiWiq3JbSARaPLEf+vdDUkmPGf
         sk4km++AlHNoutVx+z7tzq2NKW5xYB5Lq3KTe6OGvte+8OWgGix789uP/cxdbaFG6uUo
         bgbg==
X-Gm-Message-State: AOJu0YytvG+7hngT/mJv0wATVi+Flx3eH7OHUn8F52U9atVtiEzUKKoy
	ZkvHKD3NO6fG4awUm9rv1cHPybY917o=
X-Google-Smtp-Source: AGHT+IFqCABorYKmfCmJZy/oBSeOXTtnBU+krovHVjWnvhFIdm8AwbTMBJoMdfZ9FR5pLbycY5bTrtHt4Z4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:770f:0:b0:da0:73c2:db78 with SMTP id
 s15-20020a25770f000000b00da073c2db78mr326876ybc.9.1698856562473; Wed, 01 Nov
 2023 09:36:02 -0700 (PDT)
Date: Wed, 1 Nov 2023 09:36:00 -0700
In-Reply-To: <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
Message-ID: <ZUJ-cJfofk2d_I0B@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> On Wed, Nov 1, 2023 at 2:41=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Wed, Nov 01, 2023, Xiaoyao Li wrote:
> > > On 10/31/2023 10:16 PM, Sean Christopherson wrote:
> > > > On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> > > > > On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > > But it's different than MADV_HUGEPAGE, in a way. Per my understanding=
, the
> > > failure of MADV_HUGEPAGE is not fatal, user space can ignore it and
> > > continue.
> > >
> > > However, the failure of KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is fatal, whic=
h leads
> > > to failure of guest memfd creation.
> >
> > Failing KVM_CREATE_GUEST_MEMFD isn't truly fatal, it just requires diff=
erent
> > action from userspace, i.e. instead of ignoring the error, userspace co=
uld redo
> > KVM_CREATE_GUEST_MEMFD with KVM_GUEST_MEMFD_ALLOW_HUGEPAGE=3D0.
> >
> > We could make the behavior more like MADV_HUGEPAGE, e.g. theoretically =
we could
> > extend fadvise() with FADV_HUGEPAGE, or add a guest_memfd knob/ioctl() =
to let
> > userspace provide advice/hints after creating a guest_memfd.  But I sus=
pect that
> > guest_memfd would be the only user of FADV_HUGEPAGE, and IMO a post-cre=
ation hint
> > is actually less desirable.
> >
> > KVM_GUEST_MEMFD_ALLOW_HUGEPAGE will fail only if userspace didn't provi=
de a
> > compatible size or the kernel doesn't support THP.  An incompatible siz=
e is likely
> > a userspace bug, and for most setups that want to utilize guest_memfd, =
lack of THP
> > support is likely a configuration bug.  I.e. many/most uses *want* fail=
ures due to
> > KVM_GUEST_MEMFD_ALLOW_HUGEPAGE to be fatal.
> >
> > > For current implementation, I think maybe KVM_GUEST_MEMFD_DESIRE_HUGE=
PAGE
> > > fits better than KVM_GUEST_MEMFD_ALLOW_HUGEPAGE? or maybe *PREFER*?
> >
> > Why?  Verbs like "prefer" and "desire" aren't a good fit IMO because th=
ey suggest
> > the flag is a hint, and hints are usually best effort only, i.e. are ig=
nored if
> > there is a fundamental incompatibility.
> >
> > "Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_ME=
MFD_USE_HUGEPAGES
> > or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that=
 KVM doesn't
> > (yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stro=
nger than
> > a hint, but weaker than a requirement.  And if/when KVM supports a dedi=
cated memory
> > pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.
>=20
> I think that the current patch is fine, but I will adjust it to always
> allow the flag, and to make the size check even if !CONFIG_TRANSPARENT_HU=
GEPAGE.
> If hugepages are not guaranteed, and (theoretically) you could have no
> hugepage at all in the result, it's okay to get this result even if THP i=
s not
> available in the kernel.

Can you post a fixup patch?  It's not clear to me exactly what behavior you=
 intend
to end up with.
