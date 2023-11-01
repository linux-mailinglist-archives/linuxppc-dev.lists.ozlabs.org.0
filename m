Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6A7DE8CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 00:18:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jNjI4wfC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jNjI4wfC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLNGg2zZHz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 10:18:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jNjI4wfC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jNjI4wfC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLNFm0HrXz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 10:17:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698880648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vwHZc+/Gns5rEzdivTNKNr5j0n3GZLH4TX/0o56Y/4=;
	b=jNjI4wfCPmm8ydF7YbLHV7Wy+RVNZ/hUOnV0TjBOg+w0N6TqKMVXA6jiXqMx06O48HI7TD
	vO/RaAhrRo2H/NkhggnYiSd7xG0SjpkekvtSPARaK13yp/fWaHi55aJz/djMZiyfkLb0X3
	bIQ0pSxt4N0/Qc1havOYwNMsenIkHyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698880648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vwHZc+/Gns5rEzdivTNKNr5j0n3GZLH4TX/0o56Y/4=;
	b=jNjI4wfCPmm8ydF7YbLHV7Wy+RVNZ/hUOnV0TjBOg+w0N6TqKMVXA6jiXqMx06O48HI7TD
	vO/RaAhrRo2H/NkhggnYiSd7xG0SjpkekvtSPARaK13yp/fWaHi55aJz/djMZiyfkLb0X3
	bIQ0pSxt4N0/Qc1havOYwNMsenIkHyI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-4MfCu56KPB2DG8kuGmVlEA-1; Wed, 01 Nov 2023 19:17:26 -0400
X-MC-Unique: 4MfCu56KPB2DG8kuGmVlEA-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-457dc2691afso150223137.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 16:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880646; x=1699485446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vwHZc+/Gns5rEzdivTNKNr5j0n3GZLH4TX/0o56Y/4=;
        b=MdTMyUnxpmEqDNkJRZchKmRzO9w3dMnq7xFXtmDJwu5BWkZyMKYDQsclUxnnR0+6yG
         Pum0qMRDCGgXls82+z6dw1AezF/tz9eqMV+Z0BmHF3svnHXidgqZ4gMudgim7PU0eTZg
         1SepPux98vUmp5KCgdx2lkI8urW7SDxUfXEiWmgIOijP4ihSyVMMKJ8jK7dn7XDFYlmd
         P4CkxQlazoQiD+ep60ixkmB6Hl2FD8b1zwE9x0rmv+3y24SOn7KH1ywlvnZBn8qAdtlb
         zRmFgGy3yepAYbh0xMhcpk3RvQe7keIcXiwry6XlXbT4vjNQOsGNsYN8B7GydvN+5wCk
         bdyg==
X-Gm-Message-State: AOJu0YzaV0qUjvk5SJVLd25TNqsx9sg+MGeBiEqyrgeGHqWseSgS9rG2
	DErIFZngMixsk2aoft7CenIEyXuGmGUC5DYhQG64t1pM5wuGD708f221yUyCNpB4Fev+Jt3Nrl5
	37h5lZ8kHMLESS0U9VmlAUWtUEf2+p0uf+hZX4TMpKA==
X-Received: by 2002:a67:b70e:0:b0:450:8e58:2de4 with SMTP id h14-20020a67b70e000000b004508e582de4mr14946776vsf.7.1698880645573;
        Wed, 01 Nov 2023 16:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERW8ZMUKS1oQBttUXGlXfpcF1aXMGz29SltsJOczMO7DdV5tM2YzmJ2Q5mLWwPrzL7OcDPCpWawHIyBUWWBis=
X-Received: by 2002:a67:b70e:0:b0:450:8e58:2de4 with SMTP id
 h14-20020a67b70e000000b004508e582de4mr14946722vsf.7.1698880645133; Wed, 01
 Nov 2023 16:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com>
In-Reply-To: <ZULSkilO-tdgDGyT@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 00:17:13 +0100
Message-ID: <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, A
 nup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 1, 2023 at 11:35=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> > On 11/1/23 17:36, Sean Christopherson wrote:
> > > > > "Allow" isn't perfect, e.g. I would much prefer a straight KVM_GU=
EST_MEMFD_USE_HUGEPAGES
> > > > > or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to conve=
y that KVM doesn't
> > > > > (yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE i=
s stronger than
> > > > > a hint, but weaker than a requirement.  And if/when KVM supports =
a dedicated memory
> > > > > pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPA=
GE.
> > > > I think that the current patch is fine, but I will adjust it to alw=
ays
> > > > allow the flag, and to make the size check even if !CONFIG_TRANSPAR=
ENT_HUGEPAGE.
> > > > If hugepages are not guaranteed, and (theoretically) you could have=
 no
> > > > hugepage at all in the result, it's okay to get this result even if=
 THP is not
> > > > available in the kernel.
> > > Can you post a fixup patch?  It's not clear to me exactly what behavi=
or you intend
> > > to end up with.
> >
> > Sure, just this:
> >
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 7d1a33c2ad42..34fd070e03d9 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_cr=
eate_guest_memfd *args)
> >  {
> >       loff_t size =3D args->size;
> >       u64 flags =3D args->flags;
> > -     u64 valid_flags =3D 0;
> > -
> > -     if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> > -             valid_flags |=3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > +     u64 valid_flags =3D KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> >       if (flags & ~valid_flags)
> >               return -EINVAL;
> > @@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_cr=
eate_guest_memfd *args)
> >       if (size < 0 || !PAGE_ALIGNED(size))
> >               return -EINVAL;
> > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >       if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
> >           !IS_ALIGNED(size, HPAGE_PMD_SIZE))
> >               return -EINVAL;
> > -#endif
>
> That won't work, HPAGE_PMD_SIZE is valid only for CONFIG_TRANSPARENT_HUGE=
PAGE=3Dy.
>
> #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> #define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
> #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })

Would have caught it when actually testing it, I guess. :) It has to
be PMD_SIZE, possibly with

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
BUILD_BUG_ON(HPAGE_PMD_SIZE !=3D PMD_SIZE);
#endif

for extra safety.

Paolo

