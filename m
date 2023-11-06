Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 695247E292E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 16:56:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pOqN6VSU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPGF32GGhz3bvB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 02:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pOqN6VSU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3lqxjzqykdaqwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPGDB4sMTz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 02:56:08 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da033914f7cso5367554276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 07:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699286165; x=1699890965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2j2Mtk4lW9HEtWavGEnwteIJF5J/7dhiq9rSq3IBx+E=;
        b=pOqN6VSUX09VIQ5IUUaiz2qmR7DTB5m4CJIhTpFsNHd2zQmJSRbu8UTqfgSw6Y6VPM
         eJylUDpkR8ERTrZKzWfACNCpqhFA0TVEOlwTmsweA+64BF7xsAMoUL1/quRcmqKm2EGi
         mwLZZ+pLHL8+zggHQLuHGPz26ItUNfn74+ZhPZ4lN5Mmb4CA0HSFnUEpBYVOlJIYi+JZ
         Zj0A7AMKUTnScMFzzrGVWULOuXc7YfZ9CJE7Lf0xX1f5Tvc/bcebyeLi+RMND458WXzp
         dacHuWL4ufN9dr4TyBqTL0jGmzYOgRqisnXH2gupbGROeRIqguseLyVQA3/wstN8wm/v
         xMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286165; x=1699890965;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2j2Mtk4lW9HEtWavGEnwteIJF5J/7dhiq9rSq3IBx+E=;
        b=DPiMmcl/3NYRSJsm2pRb2GZkBhuFd0ht6plPnljjOSSefTn42xFGJpE+pr2dfIg5EQ
         Dw2PX1lh18wfkgvhSgaDlGVQXHunfTJWtyCf3EcRO8P0AxGryPrw71WYZlYeLCqDYUTy
         HY0RKmts/VFzaOWmqQWHyhlSF8kNMaToesG3JYu5VAfQ2UP4bgcrrRTKNURPF/adbgBe
         M42HoTPN3b8ypnxlkcugRQBvPjT8TJuTo9lJnNCSCBXg9mXOrHtuPVgao6hGxeDTf1Hb
         /qQo5Hbvb62HbZ6sS5LMj3hBy/ei9OewuWN990ejMg6l4IlZ+RrMjlhKJ6q0BR9lYurm
         XdHg==
X-Gm-Message-State: AOJu0YyC1LoxjWp+grR9zH1U4FweYloV5+sIwZuxKvAMm3jJk/jcIluy
	eohCTYahsH7iX5nxho454Jhl1C7fp7E=
X-Google-Smtp-Source: AGHT+IERk2b/M7d3G4J3vDGzrJ+T8jAsirv4bBIzvQT8OzuTMUe5AwPvC/SZu8YyGY6aMLoBT08jDOLmS/Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr683795ybu.7.1699286165114; Mon, 06 Nov
 2023 07:56:05 -0800 (PST)
Date: Mon, 6 Nov 2023 07:56:03 -0800
In-Reply-To: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050> <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
 <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
Message-ID: <ZUkMk6b6vZe2ANkK@google.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
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
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 06, 2023, Xu Yilun wrote:
> On Sun, Nov 05, 2023 at 05:19:36PM +0100, Paolo Bonzini wrote:
> > On Sun, Nov 5, 2023 at 2:04=E2=80=AFPM Xu Yilun <yilun.xu@linux.intel.c=
om> wrote:
> > >
> > > > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcp=
u,
> > > > +                                           struct kvm_page_fault *=
fault)
> > > > +{
> > > > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > > > +                                   PAGE_SIZE, fault->write, fault-=
>exec,
> > > > +                                   fault->is_private);
> > > > +}
> > > > +
> > > > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > > +                                struct kvm_page_fault *fault)
> > > > +{
> > > > +     int max_order, r;
> > > > +
> > > > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > > +             return -EFAULT;
> > > > +     }
> > > > +
> > > > +     r =3D kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &f=
ault->pfn,
> > > > +                          &max_order);
> > > > +     if (r) {
> > > > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > > > +             return r;
> > >
> > > Why report KVM_EXIT_MEMORY_FAULT here? even with a ret !=3D -EFAULT?
> >=20
> > The cases are EFAULT, EHWPOISON (which can report
> > KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
> > that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
> > and it doesn't violate the documentation.  The docs tell you "what
> > can you do if error if EFAULT or EHWPOISON?"; they don't
> > exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
> > it's just that you're not supposed to look at it
>=20
> Thanks, it's OK for ENOMEM + KVM_EXIT_MEMORY_FAULT.
>=20
> Another concern is, now 3 places to report EFAULT + KVM_EXIT_MEMORY_FAULT=
:
>=20
>   if (!kvm_slot_can_be_private(fault->slot)) {
> 	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> 	return -EFAULT;
>   }
>=20
>   file =3D kvm_gmem_get_file(slot);
>   if (!file)
> 	return -EFAULT;
>=20
>   if (fault->is_private !=3D kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> 	kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> 	return -EFAULT;
>   }
>=20
> They are different cases, and seems userspace should handle them
> differently, but not enough information to distinguish them.

For the first, the memory_fault exit will inform userspace that the guest w=
ants
to map memory as private, and userspace will see that the memslot isn't con=
figured
to support private mappings.  Userspace may not even need to query memslots=
, e.g.
if the gfn in question has been enumerated to the guest as something that c=
an only
be mapped shared.

For the second (no valid guest_memfd file), userspace put the last referenc=
e to
the guest_memfd file without informing the guest or creating a memslot.  Th=
at's
firmly a userspace bug.

For the third and last, userspace will see that the guest is requesting a p=
rivate
mapping but the gfn is configured for shared mappings.

In all cases, userspace has the necessary information to resolve the issue,=
 where
"resolving the issue" may mean terminating the guest.  If userspace isn't t=
racking
memslots or the private attribute, then userspace has far bigger problems.
