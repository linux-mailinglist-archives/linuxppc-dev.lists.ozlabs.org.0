Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDE17B72CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 22:52:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=umbpPuCX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0VQ802f3z3c8r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 07:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=umbpPuCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=36n4czqykdik5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0VPC1qwkz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 07:51:57 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59b5a586da6so1991097b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696366314; x=1696971114; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN51NFJCcwM1r+zCqreeXDah/vTq4bXHZX6Qt4tveaY=;
        b=umbpPuCXaAGA7P920lVc9pT2Ux0v5kzNdpHoWOUJ0LXBPLjzx+ipFTebT2A+i5DQbx
         5s2sLQIWf0+ACwr6FdhSy1BByqn/wgEVxCYeQo9zl6fQ6cEx7QKqlARSFfw1gl4ZMhvw
         DLSc9OqDPYGhF5pHN2on5yZMuATY37puCMJFh5Zq6dXKdg4CTvHXdq5gqGpbuorlCCkr
         KJ67HWNOAUKFDB3GF6cAZGFXCc7nNOTNlMpcK/k3B+xJWGkHQcQsN9WA9SzNFTtLKPfo
         aKw0Ebd47QEqtuEc8dN24W7DXcnIDDJEM+cmAwqW6QTO1a9+GNZHw880F2mvrI1xonW5
         FGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696366314; x=1696971114;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iN51NFJCcwM1r+zCqreeXDah/vTq4bXHZX6Qt4tveaY=;
        b=evKvWGkCT2Rqpx4FVUI27aAY5mwxjv1v3n97ZQ03zyeIJidWK1njMFNVD5ipNoZB9b
         WIl0zpvAnWnaj5mB9sAwpKGm3/txQ6S8Eehg7T3RV/H0UqzbsX/Zescc4ICGDWrk8DDq
         67ZIqBbDJF/OXtljvuB9qLeEFY0xNNkCQ3YYAGMAP7DF6o16KGR+PD11wv/sdEUInDFM
         1lzOEZqK2zAtCx34WPKz0CBfDMAGt499aGxjo8ulBZhsWW2VEvINe4Z/jotbcnpKaND4
         aEPPRM7oJMXCK+uIxsXiiJwT+S7i+5K6c4GqSlc3BjBCiKKL3Pu35udwNFsz79jVEZ60
         wMMg==
X-Gm-Message-State: AOJu0YwYXFuRqjFvGk8KjzKKqS1XUyIWYrzo4PoWAbWUvQazB1WO9rxK
	WN4Epf8qchs/Pma7JFvctMdOUNRAqPA=
X-Google-Smtp-Source: AGHT+IH9SpWB5ZYki6B4kneRjXWww1fW5aqwjgYpBvf3LyPRvX5qN4iOqywaVkHZ9PW5pYyi5WCeWQUyODc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:b83:b0:59b:b0b1:d75a with SMTP id
 ck3-20020a05690c0b8300b0059bb0b1d75amr85511ywb.4.1696366314084; Tue, 03 Oct
 2023 13:51:54 -0700 (PDT)
Date: Tue, 3 Oct 2023 13:51:52 -0700
In-Reply-To: <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
 <ZRw6X2BptZnRPNK7@google.com> <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Message-ID: <ZRx-6F6NSd9QU8QT@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel
 .org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023, Fuad Tabba wrote:
> On Tue, Oct 3, 2023 at 4:59=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > On Tue, Oct 03, 2023, Fuad Tabba wrote:
> > > > +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> > > > +
> > >
> > > In pKVM, we don't want to allow setting (or clearing) of PRIVATE/SHAR=
ED
> > > attributes from userspace.
> >
> > Why not?  The whole thing falls apart if userspace doesn't *know* the s=
tate of a
> > page, and the only way for userspace to know the state of a page at a g=
iven moment
> > in time is if userspace controls the attributes.  E.g. even if KVM were=
 to provide
> > a way for userspace to query attributes, the attributes exposed to usrs=
pace would
> > become stale the instant KVM drops slots_lock (or whatever lock protect=
s the attributes)
> > since userspace couldn't prevent future changes.
>=20
> I think I might not quite understand the purpose of the
> KVM_SET_MEMORY_ATTRIBUTES ABI. In pKVM, all of a protected guest's memory=
 is
> private by default, until the guest shares it with the host (via a
> hypercall), or another guest (future work). When the guest shares it,
> userspace is notified via KVM_EXIT_HYPERCALL. In many use cases, userspac=
e
> doesn't need to keep track directly of all of this, but can reactively un=
/map
> the memory being un/shared.

Yes, and then userspace needs to tell KVM, via KVM_SET_MEMORY_ATTRIBUTES, t=
hat
userspace has agreed to change the state of the page.  Userspace may not ne=
ed/want
to explicitly track the state of pages, but userspace still needs to tell K=
VM what
userspace wants.

KVM is primarily an accelerator, e.g. KVM's role is to make things go fast =
(relative
to doing things in userspace) and provide access to resources/instructions =
that
require elevated privileges.  As a general rule, we try to avoid defining t=
he vCPU
model, security policies, etc. in KVM, because hardcoding policy into KVM (=
and the
kernel as a whole) eventually limits the utility of KVM.

As it pertains to PRIVATE vs. SHARED, KVM's role is to define and enforce t=
he basic
rules, but KVM shouldn't do things like define when it is (il)legal to conv=
ert
memory to/from SHARED, what pages can be converted, what happens if the gue=
st and
userspace disagree, etc.

> > Why does pKVM need to prevent userspace from stating *its* view of attr=
ibutes?
> >
> > If the goal is to reduce memory overhead, that can be solved by using a=
n internal,
> > non-ABI attributes flag to track pKVM's view of SHARED vs. PRIVATE.  If=
 the guest
> > attempts to access memory where pKVM and userspace don't agree on the s=
tate,
> > generate an exit to userspace.  Or kill the guest.  Or do something els=
e entirely.
>=20
> For the pKVM hypervisor the guest's view of the attributes doesn't
> matter. The hypervisor at the end of the day is the ultimate arbiter
> for what is shared and with how. For pKVM (at least in my port of
> guestmem), we use the memory attributes from guestmem essentially to
> control which memory can be mapped by the host.

The guest's view absolutely matters.  The guest's view may not be expressed=
 at
access time, e.g. as you note below, pKVM and other software-protected VMs =
don't
have a dedicated shared vs. private bit like TDX and SNP.  But the view is =
still
there, e.g. in the pKVM model, the guest expresses its desire for shared vs=
.
private via hypercall, and IIRC, the guest's view is tracked by the hypervi=
sor
in the stage-2 PTEs.  pKVM itself may track the guest's view on things, but=
 the
view is still the guest's.

E.g. if the guest thinks a page is private, but in reality KVM and host use=
rspace
have it as shared, then the guest may unintentionally leak data to the untr=
usted
world.

IIUC, you have implemented guest_memfd support in pKVM by changing the attr=
ibutes
when the guest makes the hypercall.  This can work, but only so long as the=
 guest
and userspace are well-behaved, and it will likely paint pKVM into a corner=
 in
the long run.

E.g. if the guest makes a hypercall to convert memory to PRIVATE, but there=
 is
no memslot or the memslot doesn't support private memory, then unless there=
 is
policy baked into KVM, or an ABI for the guest<=3D>host hypercall interface=
 that
allows unwinding the program counter, you're stuck.  Returning an error for=
 the
hypercall straight from KVM is undesirable as that would put policy into KV=
M that
doesn't need to be there, e.g. that would prevent userspace from manipulati=
ng
memslots in response to (un)share requests from the guest.  It's a similar =
story
if KVM marks the page as PRIVATE, as that would prevent userspace from retu=
rning
an error for the hypercall, i.e. would prevent usersepace from denying the =
request
to convert to PRIVATE.

> One difference between pKVM and TDX (as I understand it), is that TDX
> uses the msb of the guest's IPA to indicate whether memory is shared
> or private, and that can generate a mismatch on guest memory access
> between what it thinks the state is, and what the sharing state in
> reality is. pKVM doesn't have that. Memory is private by default, and
> can be shared in-place, both in the guest's IPA space as well as the
> underlying physical page.

TDX's shared bit and SNP's encryption bit are just a means of hardware enfo=
rcement.
pKVM does have a hardware bit because hardware doesn't provide any enforcem=
ent.
But as above, pKVM does have an equivalent *somewhere*.

> > > The other thing, which we need for pKVM anyway, is to make
> > > kvm_vm_set_mem_attributes() global, so that it can be called from out=
side of
> > > kvm_main.c (already have a local patch for this that declares it in
> > > kvm_host.h),
> >
> > That's no problem, but I am definitely opposed to KVM modifying attribu=
tes that
> > are owned by userspace.
> >
> > > and not gate this function by KVM_GENERIC_MEMORY_ATTRIBUTES.
> >
> > As above, I am opposed to pKVM having a completely different ABI for ma=
naging
> > PRIVATE vs. SHARED.  I have no objection to pKVM using unclaimed flags =
in the
> > attributes to store extra metadata, but if KVM_SET_MEMORY_ATTRIBUTES do=
esn't work
> > for pKVM, then we've failed miserably and should revist the uAPI.
>=20
> Like I said, pKVM doesn't need a userspace ABI for managing PRIVATE/SHARE=
D,
> just a way of tracking in the host kernel of what is shared (as opposed t=
o
> the hypervisor, which already has the knowledge). The solution could simp=
ly
> be that pKVM does not enable KVM_GENERIC_MEMORY_ATTRIBUTES, has its own
> tracking of the status of the guest pages, and only selects KVM_PRIVATE_M=
EM.

At the risk of overstepping my bounds, I think that effectively giving the =
guest
full control over what is shared vs. private is a mistake.  It more or less=
 locks
pKVM into a single model, and even within that model, dealing with errors a=
nd/or
misbehaving guests becomes unnecessarily problematic.

Using KVM_SET_MEMORY_ATTRIBUTES may not provide value *today*, e.g. the use=
rspace
side of pKVM could simply "reflect" all conversion hypercalls, and terminat=
e the
VM on errors.  But the cost is very minimal, e.g. a single extra ioctl() pe=
r
converion, and the upside is that pKVM won't be stuck if a use case comes a=
long
that wants to go beyond "all conversion requests either immediately succeed=
 or
terminate the guest".
