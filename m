Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95D7FE360
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 23:41:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4eeTdnVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgZ6t1Wm6z3clL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 09:41:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4eeTdnVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=31b1nzqykdciqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgZ610lCvz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 09:40:23 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d1b431fa7bso5921187b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701297621; x=1701902421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDVeTl61QPCCxPz+sfODK89nbVJMVG6TQMGABDOMFAw=;
        b=4eeTdnVbJQWqSfXha8XOZCXNpbaSq0P4S3MSa1lh6zhIv7IoFWtxDfs5Q0P+oAy/qX
         y2mXqcVPvgoJZObsRRx+hbLxohIz5/v5hqy0nG58UtuXMn3S/5Y7i1/BKLMiQDiAZ1hA
         EHW105aHEd2Q8d01MUFIwiAsv8AMXQ25uEa7HARHGkOSzHuf3ni4knJsm7Jf7eU7BPVX
         yJCHiRNni8dX2e82gI2z9ZPo8L4pi6xp+VaCqdAK3lptfF+oO7sfxBhzr0bBxTNNUihu
         R4nPByCfHpBpcTGO/2JUyI3S/YzLkHJNecdH9Jky7dcHLX6U2Q0dvkG6toeH/NElx8DW
         AvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297621; x=1701902421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDVeTl61QPCCxPz+sfODK89nbVJMVG6TQMGABDOMFAw=;
        b=X6SftPNCkH0BdDmTQdX2DBxZHeC/4OPxDtb0MUkjD9pMRTOLOtCq+vJiq/5oKo+f+I
         P9u3VycqAHnocnad+yp4J6EJUMx3IbHtGNDMYCs7zzmcX+uCO8DTT/geZV55huSIiUYt
         K0s0ILh2vQB+ut7uuKn9Vk//EWcee8rbFhh2K1evf+bWTBxKRV0+KQd+gnTUVOD7ycc0
         nyrQ1VFIIGLOqkDN2+87aSTEPVFdP7XhX5THylWq9AcMM+itas9VU8N62PYXG1+hah/7
         /1fiV3M4bZyBKuofV97wATAbZqlBhyz3blZ8QYaEv2YSLxv8XEF1QiwOBoYIeAQ8Xv8v
         HJ5Q==
X-Gm-Message-State: AOJu0YypDjLcSzMydi6fiVRSL5tf7u67BJkhg/nCCyxL6Bq0C+xuD/XJ
	KsTYDYbTR/z6ZFCzfxTNuGNhydVAfWI=
X-Google-Smtp-Source: AGHT+IH9RxzmajTLifcNJivXHXF15GYt6RNI6hyz68HWdvvEFKxSVfujRMym9vZDynLvRqNw698SRRht3dY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:842:b0:5cc:cd5e:8f0e with SMTP id
 bz2-20020a05690c084200b005cccd5e8f0emr592433ywb.0.1701297621195; Wed, 29 Nov
 2023 14:40:21 -0800 (PST)
Date: Wed, 29 Nov 2023 14:40:19 -0800
In-Reply-To: <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Mime-Version: 1.0
References: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com> <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
 <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Message-ID: <ZWe90784ek9VvHa5@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.c
 om>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 27, 2023, Vlastimil Babka wrote:
> On 11/2/23 16:46, Paolo Bonzini wrote:
> > On Thu, Nov 2, 2023 at 4:38=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >> Actually, looking that this again, there's not actually a hard depende=
ncy on THP.
> >> A THP-enabled kernel _probably_  gives a higher probability of using h=
ugepages,
> >> but mostly because THP selects COMPACTION, and I suppose because using=
 THP for
> >> other allocations reduces overall fragmentation.
> >=20
> > Yes, that's why I didn't even bother enabling it unless THP is
> > enabled, but it makes even more sense to just try.
> >=20
> >> So rather than honor KVM_GUEST_MEMFD_ALLOW_HUGEPAGE iff THP is enabled=
, I think
> >> we should do the below (I verified KVM can create hugepages with THP=
=3Dn).  We'll
> >> need another capability, but (a) we probably should have that anyways =
and (b) it
> >> provides a cleaner path to adding PUD-sized hugepage support in the fu=
ture.
> >=20
> > I wonder if we need KVM_CAP_GUEST_MEMFD_HUGEPAGE_PMD_SIZE though. This
> > should be a generic kernel API and in fact the sizes are available in
> > a not-so-friendly format in /sys/kernel/mm/hugepages.
> >=20
> > We should just add /sys/kernel/mm/hugepages/sizes that contains
> > "2097152 1073741824" on x86 (only the former if 1G pages are not
> > supported).
> >=20
> > Plus: is this the best API if we need something else for 1G pages?
> >=20
> > Let's drop *this* patch and proceed incrementally. (Again, this is
> > what I want to do with this final review: identify places that are
> > stil sticky, and don't let them block the rest).
> >=20
> > Coincidentially we have an open spot next week at plumbers. Let's
> > extend Fuad's section to cover more guestmem work.
>=20
> Hi,
>=20
> was there any outcome wrt this one?

No, we punted on hugepage support for the initial guest_memfd merge.  We de=
finitely
plan on adding hugeapge support sooner than later, but we haven't yet agree=
d on
exactly what that will look like.

> Based on my experience with THP's it would be best if userspace didn't ha=
ve
> to opt-in, nor care about the supported size. If the given size is unalig=
ned,
> provide a mix of large pages up to an aligned size, and for the rest fall=
back
> to base pages, which should be better than -EINVAL on creation (is it
> possible with the current implementation? I'd hope so so?).

guest_memfd serves a different use case than THP.  For modern VMs, and espe=
cially
for slice-of-hardware VMs that are one of the main targets for guest_memfd,=
 if not
_the_ main target, guest memory should _always_ be backed by hugepages in t=
he
physical domain.  The actual guest mappings might not be huge, e.g. x86 nee=
ds to
do partial mappings to skip over (legacy) memory holes, but KVM already gra=
cefully
handles that.

In other words, for most guest_memfd use cases, if userspace wants hugepage=
s but
KVM can't provide hugepages, then it is much more desirable to return an er=
ror
than to silently fall back to small pages.

I 100% agree that having to opt-in is suboptimal, but IMO providing "error =
on an
incompatible configuration" semantics without requiring userspace to opt-in=
 is an
even worse experience for userspace.

> A way to opt-out from huge pages could be useful although there's always =
the
> risk of some initial troubles resulting in various online sources cargo-c=
ult
> recommending to opt-out forever.
