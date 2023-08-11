Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A1779667
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 19:45:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=z4avZMYB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMrm03Cfcz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 03:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=z4avZMYB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3bxpwzaykdnooa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMrl80Ftfz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 03:44:18 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c5fc972760eso2331909276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691775853; x=1692380653;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5tf/etP9591sBoXXP0u0lhmE2sGhQYCIj4rXej+PgY=;
        b=z4avZMYBxF/USDP2G14KA+P8N8yreov1u2JOHwfc1TVZdl6Iz+YTKH19wDx7mUMq9M
         o4u6qon1QiMk8DVxh93qeN2Mz6fZGsUFtzOg33bB4Mo7KFsOypRjJRdzz9Y8WFCiY85q
         br+fPgBO/on1YU5soxnymBtm9OPZyICHaFKZfYSg9Ropko2mo0wKLVwIok1lVrWFw51i
         jjhtl/HK+nEz+jNhJe7imTF+VBA6+NGFZjFm7+hHqXCkfP3+rYY1oaYSypJ0v6009kFT
         lq7bEwknPOhWjDhET6YMFrJ/3n1YTZ5hf1bP/IHZB/5/XDyHPzuDGnqfF1kEhe1cc6AD
         1nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691775853; x=1692380653;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5tf/etP9591sBoXXP0u0lhmE2sGhQYCIj4rXej+PgY=;
        b=fPoPA9bv4l1kYcIVrnAWOaTNuduyB+sTosUoJodraP6UeDtll3m12O/XUvGaLs37Ks
         mMnW8T3IYoJNrGjR7VpltH4gYeB+0uBLPpsSve+cWThkvfT7WbNhZAcJrAtuXBtWEh/c
         Z1UQTFsxuveSJIJ8ciA1TycD/2fHcwWv6IEg5rCYVtuZ7gGu2T8MyeCKrbyvZo3TdDMj
         19cn6HpwT+xxpBvRNN/Piwjs+crWuhbTtJAY6SaS0DEeG8LCuugY4uc5V7n5KZu1GwBF
         Qf1My4sFQpGXlCueTYGJlvQavlm3XICrsDtQ/+3hxY7eRa0YdLslKG/F+bos6P8btOCC
         O99w==
X-Gm-Message-State: AOJu0YyBZFQlIoInP1T6S5GPLI+3PNT7slGu1WBkUzbNCQ4OorSyZVBG
	UoNBLMKNvr7Zfr3/PheCiW2/guKhRvU=
X-Google-Smtp-Source: AGHT+IFlh+eXwF8rMcD2luIRCX1nl8Idt0F+6stO6hsWWfidj415wHUgqoJc8kVAwNGB8y2mQW1tGjk2lPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:7443:0:b0:d20:7752:e384 with SMTP id
 p64-20020a257443000000b00d207752e384mr41859ybc.3.1691775853469; Fri, 11 Aug
 2023 10:44:13 -0700 (PDT)
Date: Fri, 11 Aug 2023 10:44:11 -0700
In-Reply-To: <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
 <ZNKv9ul2I7A4V7IF@google.com> <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Message-ID: <ZNZza/emWldkJC6X@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, Ackerley Tng <ackerleytng@google.com>, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 10, 2023, Vishal Annapurve wrote:
> On Tue, Aug 8, 2023 at 2:13=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > ...
>=20
> > > + When binding a memslot to the file, if a kvm pointer exists, it mus=
t
> > >   be the same kvm as the one in this binding
> > > + When the binding to the last memslot is removed from a file, NULL t=
he
> > >   kvm pointer.
> >
> > Nullifying the KVM pointer isn't sufficient, because without additional=
 actions
> > userspace could extract data from a VM by deleting its memslots and the=
n binding
> > the guest_memfd to an attacker controlled VM.  Or more likely with TDX =
and SNP,
> > induce badness by coercing KVM into mapping memory into a guest with th=
e wrong
> > ASID/HKID.
> >
>=20
> TDX/SNP have mechanisms i.e. PAMT/RMP tables to ensure that the same
> memory is not assigned to two different VMs.

One of the main reasons we pivoted away from using a flag in "struct page" =
to
indicate that a page was private was so that KVM could enforce 1:1 VM:page =
ownership
*without* relying on hardware.

And FWIW, the PAMT provides no protection in this specific case because KVM=
 does
TDH.MEM.PAGE.REMOVE when zapping S-EPT entries, and that marks the page cle=
ar in
the PAMT.  The danger there is that physical memory is still encrypted with=
 the
guest's HKID, and so mapping the memory into a different VM, which might no=
t be
a TDX guest!, could lead to corruption and/or poison #MCs.

The HKID issues wouldn't be a problem if v15 is merged as-is, because zappi=
ng
S-EPT entries also fully purges and reclaims the page, but as we discussed =
in
one of the many threads, reclaiming physical memory should be tied to the i=
node,
i.e. to memory truly being freed, and not to S-EPTs being zapped.  And ther=
e is
a very good reason for wanting to do that, as it allows KVM to do the expen=
sive
cache flush + clear outside of mmu_lock.

> Deleting memslots should also clear out the contents of the memory as the=
 EPT
> tables will be zapped in the process

No, deleting a memslot should not clear memory.  As I said in my previous r=
esponse,
the fact that zapping S-EPT entries is destructive is a limitiation of TDX,=
 not a
feature we want to apply to other VM types.  And that's not even a fundamen=
tal
property of TDX, e.g. TDX could remove the limitation, at the cost of consu=
ming
quite a bit more memory, by tracking the exact owner by HKID in the PAMT an=
d
decoupling S-EPT entries from page ownership.

Or in theory, KVM could workaround the limitation by only doing TDH.MEM.RAN=
GE.BLOCK
when zapping S-EPTs.  Hmm, that might actually be worth looking at.

> and the host will reclaim the memory.

There are no guarantees that the host will reclaim the memory.  E.g. QEMU w=
ill
delete and re-create memslots for "regular" VMs when emulating option ROMs.=
  Even
if that use case is nonsensical for confidential VMs (and it probably is no=
nsensical),
I don't want to define KVM's ABI based on what we *think* userspace will do=
.
