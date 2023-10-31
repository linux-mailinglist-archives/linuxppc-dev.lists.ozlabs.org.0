Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED337DD7CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 22:37:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=liloABuE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKk4p4k1Hz3cZs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 08:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=liloABuE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3z3nbzqykdiq0mivrkowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKk3y2Jjnz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 08:36:44 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc3130ba31so25803035ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698788199; x=1699392999; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwUJsYeIlwqw805rRX9kqL0ratglmWsD95jLONcl2+Q=;
        b=liloABuE5Vl7j0EcEmaJ1nHhMCzK5mvIu9dzMfWuLTyLjYE8QXE0HPa1J+juGjbePY
         k0A/RpeYzAujh3lhTgOaP6h1jAHHgMlOb1NJXtK3Q9DhezkyytA5UIZFw+pVpN4kY6Dj
         JIxQfLW6UTgu9PnNOry6NSM9IyTIn48eeQ8aVvd6duEe4ljthddRCy0XXOverrV0w2Kv
         aU4lgbEXdnVU4ZMPLUTs5ujsDwuFxTlw/A4ouuEU1C4apoKs/53UH/XRJvzKK6vC/vWs
         Tf5mFHDlWw5E3MiyqbM6jGrsqClAHJwUmTQyQ5NMXY0WYSWHYqDIloy1gishwOlX6ePd
         6a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698788199; x=1699392999;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwUJsYeIlwqw805rRX9kqL0ratglmWsD95jLONcl2+Q=;
        b=xA7QOvUDom/ZYmfsVp+nNUzmfK/LOpU6AHFakVGlWbuBaPYrgGhE6Obd1IsC7GdqPO
         Qz8Rn3IUUf3iXfEMSZXDNSpZSTrRxrjpvBsu5J22vUzrPE/DXZ/jxIjlNoFXwBOmQZP+
         HE2JDkY7Pd57GS9nPmlJmvK0WF2yjG6IhmYtzjCpSOlLKdlkyWnvz9dc/OE34Dt2cF2w
         Fr0HzwDX/++IjibaWE0tS5PNOAsKmgtswBr0c21K85fj6SjNtsbajOeq1n2nj1SRQx0P
         By133iKrBqir+9lO0J3IXDm/HEPIePE3BUcQZ/AbFFJ66FE6mpVEV30RWqotkTNPWvf1
         +gxw==
X-Gm-Message-State: AOJu0YwtxhyJlxGNl6q/ZbHd8G75yI6VQwGF20tC+vmqsVoxbjInj3CJ
	fc41uH66TGiqtyi7FJodJsIU0CPdtek=
X-Google-Smtp-Source: AGHT+IErbOn1a7ghsHO7PXtEmrexZ1Aq9PA/AfhJ0FeZy4uT6qmhxk4RVfIH9rjSv+2WH3z2AoAxZzd2jeI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2609:b0:1b8:8c7:31e6 with SMTP id
 jd9-20020a170903260900b001b808c731e6mr249399plb.1.1698788199022; Tue, 31 Oct
 2023 14:36:39 -0700 (PDT)
Date: Tue, 31 Oct 2023 14:36:37 -0700
In-Reply-To: <ZUFGRyQEuWj4RJS0@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com>
Message-ID: <ZUFzZf-YmCRYP6qo@google.com>
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

On Tue, Oct 31, 2023, David Matlack wrote:
> On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-ba=
sed
> > memory that is tied to a specific KVM virtual machine and whose primary
> > purpose is to serve guest memory.
> >=20
> > A guest-first memory subsystem allows for optimizations and enhancement=
s
> > that are kludgy or outright infeasible to implement/support in a generi=
c
> > memory subsystem.  With guest_memfd, guest protections and mapping size=
s
> > are fully decoupled from host userspace mappings.   E.g. KVM currently
> > doesn't support mapping memory as writable in the guest without it also
> > being writable in host userspace, as KVM's ABI uses VMA protections to
> > define the allow guest protection.  Userspace can fudge this by
> > establishing two mappings, a writable mapping for the guest and readabl=
e
> > one for itself, but that=E2=80=99s suboptimal on multiple fronts.
> >=20
> > Similarly, KVM currently requires the guest mapping size to be a strict
> > subset of the host userspace mapping size, e.g. KVM doesn=E2=80=99t sup=
port
> > creating a 1GiB guest mapping unless userspace also has a 1GiB guest
> > mapping.  Decoupling the mappings sizes would allow userspace to precis=
ely
> > map only what is needed without impacting guest performance, e.g. to
> > harden against unintentional accesses to guest memory.
> >=20
> > Decoupling guest and userspace mappings may also allow for a cleaner
> > alternative to high-granularity mappings for HugeTLB, which has reached=
 a
> > bit of an impasse and is unlikely to ever be merged.
> >=20
> > A guest-first memory subsystem also provides clearer line of sight to
> > things like a dedicated memory pool (for slice-of-hardware VMs) and
> > elimination of "struct page" (for offload setups where userspace _never=
_
> > needs to mmap() guest memory).
>=20
> All of these use-cases involve using guest_memfd for shared pages, but
> this entire series sets up KVM to only use guest_memfd for private
> pages.
>=20
> For example, the per-page attributes are a property of a KVM VM, not the
> underlying guest_memfd. So that implies we will need separate
> guest_memfds for private and shared pages. But a given memslot can have
> a mix of private and shared pages. So that implies a memslot will need
> to support 2 guest_memfds?

Yes, someday this may be true.  Allowing guest_memfd (it was probably calle=
d
something else at that point) for "regular" memory was discussed in I think=
 v10?
We made a concious decision to defer supporting 2 guest_memfds because it i=
sn't strictly
necessary to support the TDX/SNP use cases for which all of this was initia=
lly
designed, and adding a second guest_memfd and the infrastructure needed to =
let
userspace map a guest_memfd can be done on top with minimal overhead.

> But the UAPI only allows 1 and uses the HVA for shared mappings.
>=20
> My initial reaction after reading through this series is that the
> per-page private/shared should be a property of the guest_memfd, not the
> VM. Maybe it would even be cleaner in the long-run to make all memory
> attributes a property of the guest_memfd. That way we can scope the
> support to only guest_memfds and not have to worry about making per-page
> attributes work with "legacy" HVA-based memslots.

Making the private vs. shared state a property of the guest_memfd doesn't w=
ork
for TDX and SNP.  We (upstream x86 and KVM maintainers) have taken a hard s=
tance
that in-place conversion will not be allowed for TDX/SNP due to the ease wi=
th
which a misbehaving userspace and/or guest can crash the host.

We'd also be betting that there would *never* be a use case for per-gfn att=
ributes
for non-standard memory, e.g. virtio-gpu buffers, any kind of device memory=
, etc.

We'd also effectively be signing up to either support swap and page migrati=
on in
guest_memfd, or make those mutually exclusive with per-gfn attributes too.

guest_memfd is only intended for guest DRAM, and if I get my way, will neve=
r support
swap (page migration is less scary).  I.e. guest_memfd isn't intended to be=
 a
one-size-fits-all solution, nor is it intended to wholesale replace memslot=
s,
which is effectively what we'd be doing by deprecating hva-based guest memo=
ry.

And ignoring all that, the ABI would end up being rather bizarre due to way=
 guest_memfd
interacts with memslots.  guest_memfd itself has no real notion of gfns, i.=
e. the
shared vs. private state would be tied to a file offset, not a gfn.  That's=
 a solvable
problem, e.g. we could make a gfn:offset binding "sticky", but that would e=
dd extra
complexity to the ABI, and AFAICT wouldn't buy us that much, if anything.

> Maybe can you sketch out how you see this proposal being extensible to
> using guest_memfd for shared mappings?

For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.  =
What's
missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM needs=
 to
ensure there are no outstanding references when converting back to private.

For TDX/SNP, assuming we don't find a performant and robust way to do in-pl=
ace
conversions, a second fd+offset pair would be needed.
