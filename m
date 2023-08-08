Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCF774CAF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 23:14:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EiApR7Lg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL5Y46nDLz30fk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 07:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EiApR7Lg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3-k_szaykdm8dzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL5Wy0M10z2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 07:13:32 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-56463e0340cso6299736a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Aug 2023 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691529208; x=1692134008;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U8op5NWCZxGer1aWuXuZ1d6J73Ge5+Hk7EgkvJJLAs=;
        b=EiApR7LgfgrJOIT4RH8vwTp7YvtN3WX8F65amcCZ5tUQpyv/ZsbnzElbxtLH3YiRAr
         Xco5OB//pxBTUJ1Hz9I9wbK8VFMOtBI25Tou7znxlR4xLwF5hwG16hAzm3VNuOm7qNVv
         RXaphvZexnvsjJwdUedz4miwZlrHjyPKGJ4tg41nXpc1Cr1tDeUR45j+cXRmHY2zeNeJ
         aD2FSNHH9s2X0AH/332mpiw5dSfBYPcqgRab/m5d5fFkQb+ZWPzwvwukMvExFid52TaS
         W3qOIOCRBt/UK+p15DAoWro/GC9Q6ni0EalNj49A0OSEsHwDkeyMMKxa0prAwizF/XXF
         JV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691529208; x=1692134008;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2U8op5NWCZxGer1aWuXuZ1d6J73Ge5+Hk7EgkvJJLAs=;
        b=QV1FY80QY6Vogaluw1cjZfcpDAY1xliwS4WVI+SZQ7fB6xVO1sg/EYpIF2kz+8TH5s
         3y/wfCuozfWLHnbzyQ1PKY7jWWM6YTfYszj6sdFEcx8DSG0rqVJMcPFB8JIb1fB5k0gB
         tUNWbSPB/PkMA45nDIvOGN6lRvOBnYYQXMBpX+3r4rbgm+xUh0DtInZySKsyg/qvNWYm
         peBeG1LrDaTpPLJ1UttrNUS2h8uDH66zvlI5SPXtV8z/8XdbYwAP+1aYRtHgmFPRkJnH
         8YGwa+Ier2GJS5+anro50L5QfjZ2ihsFQlkSFv1wgD1Q8bjIiCs5ZhcJ5rk9ZvFv92UM
         hvIQ==
X-Gm-Message-State: AOJu0YyhATG+VYDdvnj4HVzOqAFFTqo6Anccd84mlbXhJ5aUoPAQ8pPM
	rw+hkwYaJw28+ZjVExrpjdOghAlRquU=
X-Google-Smtp-Source: AGHT+IF3VhVvM3seA6Kd3G1yrwf0aF3MmO0cqr5SVZX1MHXlsabrjEav/SHlO1qK0PHGPVCVUrfGthX1EsA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:b242:0:b0:563:e937:5e87 with SMTP id
 t2-20020a63b242000000b00563e9375e87mr12735pgo.5.1691529208021; Tue, 08 Aug
 2023 14:13:28 -0700 (PDT)
Date: Tue, 8 Aug 2023 14:13:26 -0700
In-Reply-To: <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZNKv9ul2I7A4V7IF@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> I=E2=80=99d like to propose an alternative to the refcounting approach be=
tween
> the gmem file and associated kvm, where we think of KVM=E2=80=99s memslot=
s as
> users of the gmem file.
>=20
> Instead of having the gmem file pin the VM (i.e. take a refcount on
> kvm), we could let memslot take a refcount on the gmem file when the
> memslots are configured.
>=20
> Here=E2=80=99s a POC patch that flips the refcounting (and modified selft=
ests in
> the next commit):
> https://github.com/googleprodkernel/linux-cc/commit/7f487b029b89b9f3e9b09=
4a721bc0772f3c8c797
>=20
> One side effect of having the gmem file pin the VM is that now the gmem
> file becomes sort of a false handle on the VM:
>=20
> + Closing the file destroys the file pointers in the VM and invalidates
>   the pointers

Yeah, this is less than ideal.  But, it's also how things operate today.  K=
VM
doesn't hold references to VMAs or files, e.g. if userspace munmap()s memor=
y,
any and all SPTEs pointing at the memory are zapped.  The only difference w=
ith
gmem is that KVM needs to explicitly invalidate file pointers, instead of t=
hat
happening behind the scenes (no more VMAs to find).  Again, I agree the res=
ulting
code is more complex than I would prefer, but from a userspace perspective =
I
don't see this as problematic.

> + Keeping the file open keeps the VM around in the kernel even though
>   the VM fd may already be closed.

That is perfectly ok.  There is plenty of prior art, as well as plenty of w=
ays
for userspace to shoot itself in the foot.  E.g. open a stats fd for a vCPU=
 and
the VM and all its vCPUs will be kept alive.  And conceptually it's sound,
anything created in the scope of a VM _should_ pin the VM.

> I feel that memslots form a natural way of managing usage of the gmem
> file. When a memslot is created, it is using the file; hence we take a
> refcount on the gmem file, and as memslots are removed, we drop
> refcounts on the gmem file.

Yes and no.  It's definitely more natural *if* the goal is to allow guest_m=
emfd
memory to exist without being attached to a VM.  But I'm not at all convinc=
ed
that we want to allow that, or that it has desirable properties.  With TDX =
and
SNP in particuarly, I'm pretty sure that allowing memory to outlive the VM =
is
very underisable (more below).

> The KVM pointer is shared among all the bindings in gmem=E2=80=99s xarray=
, and we can
> enforce that a gmem file is used only with one VM:
>=20
> + When binding a memslot to the file, if a kvm pointer exists, it must
>   be the same kvm as the one in this binding
> + When the binding to the last memslot is removed from a file, NULL the
>   kvm pointer.

Nullifying the KVM pointer isn't sufficient, because without additional act=
ions
userspace could extract data from a VM by deleting its memslots and then bi=
nding
the guest_memfd to an attacker controlled VM.  Or more likely with TDX and =
SNP,
induce badness by coercing KVM into mapping memory into a guest with the wr=
ong
ASID/HKID.

I can think of three ways to handle that:

  (a) prevent a different VM from *ever* binding to the gmem instance
  (b) free/zero physical pages when unbinding
  (c) free/zero when binding to a different VM

Option (a) is easy, but that pretty much defeats the purpose of decopuling
guest_memfd from a VM.

Option (b) isn't hard to implement, but it screws up the lifecycle of the m=
emory,
e.g. would require memory when a memslot is deleted.  That isn't necessaril=
y a
deal-breaker, but it runs counter to how KVM memlots currently operate.  Me=
mslots
are basically just weird page tables, e.g. deleting a memslot doesn't have =
any
impact on the underlying data in memory.  TDX throws a wrench in this as re=
moving
a page from the Secure EPT is effectively destructive to the data (can't be=
 mapped
back in to the VM without zeroing the data), but IMO that's an oddity with =
TDX and
not necessarily something we want to carry over to other VM types.

There would also be performance implications (probably a non-issue in pract=
ice),
and weirdness if/when we get to sharing, linking and/or mmap()ing gmem.  E.=
g. what
should happen if the last memslot (binding) is deleted, but there outstandi=
ng userspace
mappings?

Option (c) is better from a lifecycle perspective, but it adds its own flav=
or of
complexity, e.g. the performant way to reclaim TDX memory requires the TDMR
(effectively the VM pointer), and so a deferred relcaim doesn't really work=
 for
TDX.  And I'm pretty sure it *can't* work for SNP, because RMP entries must=
 not
outlive the VM; KVM can't reuse an ASID if there are pages assigned to that=
 ASID
in the RMP, i.e. until all memory belonging to the VM has been fully freed.

> Could binding gmem files not on creation, but at memslot configuration
> time be sufficient and simpler?

After working through the flows, I think binding on-demand would simplify t=
he
refcounting (stating the obvious), but complicate the lifecycle of the memo=
ry as
well as the contract between KVM and userspace, and would break the separat=
ion of
concerns between the inode (physical memory / data) and file (VM's view / m=
appings).
