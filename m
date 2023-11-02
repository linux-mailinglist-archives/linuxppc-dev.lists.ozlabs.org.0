Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A972C7DF8D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 18:38:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zp4Asiq4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLrh04D4zz3cnK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 04:38:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zp4Asiq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3wt5dzqykdfch3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLrg31Fl2z3cR9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 04:37:33 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc335bcb47so8956095ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698946651; x=1699551451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=Zp4Asiq4gqFaX0TPqe4sSp23wUCVeGs50Ej9CrsnRGIT0DovJVP8dBJIYz3fLmVlsx
         X7kfwSIEnZC81y/HSn859+hQd8zwCt6PgN12PzUIDomRPGo3K6HFKgQH/dI2zraIt1Pe
         NsTguNhLvTdSxyNVDUts5dNpi7vjmPjYYEEHxy+JmVOdGCXuUoB+ycFFkTxmtaqrdLON
         bTUPZnyV2IO/pqNMgPZ2p68txqFwPN7gpS3oROpMTo5D6lfBaUvsKpb0pT3A7jU5kYp9
         JTwUh9UfJSo9JMbo82tguxiNhqLHUgOr/ibnM5pHDMKSQWYvTjyMRGqtD4Kqsktp6eAE
         NoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946651; x=1699551451;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uN1ssLkZHjDTrGZRWby6miGmTEsoKqfVN3YbqYw1LLA=;
        b=FOQIqi0lPfmz8JCP5RVLuAiswxoCYqX4O0z/3tO04m9Qf9TUxSH+S2HM9IU8em7SD/
         VYSczTfS5Qwj4ZUSDVIM8Zjmz8DMyEgX4JeO9pG9v0WQDrVnUzUCjWTwLbpnd3+vvqJK
         rFow+T+01AdKJ34TpA7OdJsh5Hhk0LipKOb4922aP95Bl12sMJ3U3z6QXAMJFYSeJjR1
         ELEsB3AVpdgU+oJWFKjkcdKo7vAyQ8o8YuEkP5aE1qfxt/d3E/zbEjofanDOpBRyxmeF
         LvbLhgfDLPf/lCkJLl5U7Sfz/O/eGh2YkLGiXLGfjWFmvNFDcELOc0pmYPQYgBrm6T0G
         Lsiw==
X-Gm-Message-State: AOJu0YxKU2ogGRYywZPO5ZXrTSAuj1w+rEfn6dY+CK9+ox9EUz8X5sM2
	dJ/AmHvNFSgEM+lgMWRT1UY9wpbtBNg=
X-Google-Smtp-Source: AGHT+IHO2BmoMwEG0Z4p7dUErvps7DbkHqeEBbdPqNa8vmvQCAafmC1+rihoFOkAVlqXxxzUlxPm8WkwUZU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:25d2:b0:1cc:2ffe:5a27 with SMTP id
 jc18-20020a17090325d200b001cc2ffe5a27mr287356plb.9.1698946650780; Thu, 02 Nov
 2023 10:37:30 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:37:29 -0700
In-Reply-To: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
 <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Message-ID: <ZUPeWTdbMhvMO4QL@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023, David Matlack wrote:
> On Thu, Nov 2, 2023 at 9:03=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> > > On 10/31/23 23:39, David Matlack wrote:
> > > > > > Maybe can you sketch out how you see this proposal being extens=
ible to
> > > > > > using guest_memfd for shared mappings?
> > > > > For in-place conversions, e.g. pKVM, no additional guest_memfd is=
 needed.  What's
> > > > > missing there is the ability to (safely) mmap() guest_memfd, e.g.=
 KVM needs to
> > > > > ensure there are no outstanding references when converting back t=
o private.
> > > > >
> > > > > For TDX/SNP, assuming we don't find a performant and robust way t=
o do in-place
> > > > > conversions, a second fd+offset pair would be needed.
> > > > Is there a way to support non-in-place conversions within a single =
guest_memfd?
> > >
> > > For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to =
guest
> > > memory.  The hook would invalidate now-private parts if they have a V=
MA,
> > > causing a SIGSEGV/EFAULT if the host touches them.
> > >
> > > It would forbid mappings from multiple gfns to a single offset of the
> > > guest_memfd, because then the shared vs. private attribute would be t=
ied to
> > > the offset.  This should not be a problem; for example, in the case o=
f SNP,
> > > the RMP already requires a single mapping from host physical address =
to
> > > guest physical address.
> >
> > I don't see how this can work.  It's not a M:1 scenario (where M is mul=
tiple gfns),
> > it's a 1:N scenario (wheren N is multiple offsets).  The *gfn* doesn't =
change on
> > a conversion, what needs to change to do non-in-place conversion is the=
 pfn, which
> > is effectively the guest_memfd+offset pair.
> >
> > So yes, we *could* support non-in-place conversions within a single gue=
st_memfd,
> > but it would require a second offset,
>=20
> Why can't KVM free the existing page at guest_memfd+offset and
> allocate a new one when doing non-in-place conversions?

Oh, I see what you're suggesting.  Eww.

It's certainly possible, but it would largely defeat the purpose of why we =
are
adding guest_memfd in the first place.

For TDX and SNP, the goal is to provide a simple, robust mechanism for isol=
ating
guest private memory so that it's all but impossible for the host to access=
 private
memory.  As things stand, memory for a given guest_memfd is either private =
or shared
(assuming we support a second guest_memfd per memslot).  I.e. there's no ne=
ed to
track whether a given page/folio in the guest_memfd is private vs. shared.

We could use memory attributes, but that further complicates things when in=
trahost
migration (and potentially other multi-user scenarios) comes along, i.e. wh=
en KVM
supports linking multiple guest_memfd files to a single inode.  We'd have t=
o ensure
that all "struct kvm" instances have identical PRIVATE attributes for a giv=
en
*offset* in the inode.  I'm not even sure how feasible that is for intrahos=
t
migration, and that's the *easy* case, because IIRC it's already a hard req=
uirement
that the source and destination have identical gnf=3D>guest_memfd bindings,=
 i.e. KVM
can somewhat easily reason about gfn attributes.

But even then, that only helps with the actual migration of the VM, e.g. we=
'd still
have to figure out how to deal with .mmap() and other shared vs. private ac=
tions
when linking a new guest_memfd file against an existing inode.

I haven't seen the pKVM patches for supporting .mmap(), so maybe this is al=
ready
a solved problem, but I'd honestly be quite surprised if it all works corre=
ctly
if/when KVM supports multiple files per inode.

And I don't see what value non-in-place conversions would add.  The value a=
dded
by in-place conversions, aside from the obvious preservation of data, which=
 isn't
relevant to TDX/SNP, is that it doesn't require freeing and reallocating me=
mory
to avoid double-allocating for private vs. shared.  That's especialy quite =
nice
when hugepages are being used because reconstituing a hugepage "only" requi=
res
zapping SPTEs.

But if KVM is freeing the private page, it's the same as punching a hole, p=
robably
quite literally, when mapping the gfn as shared.  In every way I can think =
of, it's
worse.  E.g. it's more complex for KVM, and the PUNCH_HOLE =3D> allocation =
operations
must be serialized.

Regarding double-allocating, I really, really think we should solve that in=
 the
guest.  I.e. teach Linux-as-a-guest to aggressively convert at 2MiB granula=
rity
and avoid 4KiB conversions.  4KiB conversions aren't just a memory utilizat=
ion
problem, they're also a performance problem, e.g. shatters hugepages (which=
 KVM
doesn't yet support recovering) and increases TLB pressure for both stage-1=
 and
stage-2 mappings.
