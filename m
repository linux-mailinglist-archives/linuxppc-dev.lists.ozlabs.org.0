Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C39485DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 01:23:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OHpY7EZT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdCDS1r47z3cTF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 09:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OHpY7EZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=30f6xzgykdi8bxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdCCm6Rqhz3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 09:22:59 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5651e888so2608005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2024 16:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722900177; x=1723504977; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqhT0BfYtdHqe5JEJY1dxcglZN0X6+UEhtDWxpbx9R0=;
        b=OHpY7EZT3XGPAALuw+2YKkkyuOkscZPQNhqfVPUzw9ascmeFgwlhFdguuFGlfbN7t/
         7eGhxCSCaX7x6hCyXl4xmKLZbds6y2rR/10qzeLqRi0VagoHXqo9rHswrGKxKNqXr7wP
         2jtxW0Gjte1UuzIMFM5fA+pimDPTWqoUKmZUuEt/TKcEjVm8MytzwAnsQi0jk6lY9DRY
         TPoL4hqbbcaW117H19H8W8PvX7pwdLZb2GA8olSLWM1J/OJZEmPlcY9eNPn+DT2rxUsW
         tEKUZnuz+KHfCBXPRT/TqHC76F20QOuPBq5gKkiwPFWtfVFzLFhwAwQduynVXxBj9Wqz
         zlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722900177; x=1723504977;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqhT0BfYtdHqe5JEJY1dxcglZN0X6+UEhtDWxpbx9R0=;
        b=JXgSLInKtZe60EJY8tRoi7yWWlQ0hBaLvH1vPkxR4KqS6uPebS8Zkx7cz6/eEjcIQg
         mr4G1sxGOtmrnh3PnTgEtAbuEKQOkrNnkfPNi27ZGd0bSAeqWSoYfVlGBQl/0t58L1o5
         2/hkZvoLChy9jVTOmFJYnWpcOQWaZJA/cl40mmva4DG47hLGgCns8tQzMPflc7mWbNn0
         r2y9FtxtvIXxXRQ/kfpBaoEhj+wcDf8AH5lrH7lo29CbZDBYuAsDrA/keSILKYC+aUIL
         5ePttMqUmP2G4Nf8QpSV19zXXnvmYVjitxV4sPusr72Gv74Q0DUTLgU6AgBaWtnK5RsX
         yEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuWUQD/iOjYhLk1BgSbrqIoJq96FSE6Ee9L72XlPngYWhLvLpH4rfK0G0ksKa6vrwf9SZh1a+LsQy2ffXBLMbZyxWHrKYh47Kxu2A6Pg==
X-Gm-Message-State: AOJu0YxMIbE+k59XvN93du6Y5lNyZrMjPD9IfZK0kycQPqgrPn9fMw7Y
	R8GhXFeW32VRB6Tr+2pPMjqomx7CNlu9DtPtrN6LmGD/dNEJPWDOSY1y1FAAjLMaTGKkAYNFRSJ
	v5A==
X-Google-Smtp-Source: AGHT+IFnC2s9xgJUYrQamoHpNNjMdfjnR6jKC7U3Po3pJ/hHYZ7yn8m2xqR/ZVZ53CGLeUu13/uKbBw5g2Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dacd:b0:1fb:325d:2b62 with SMTP id
 d9443c01a7336-1ff57464ba5mr9382545ad.10.1722900176428; Mon, 05 Aug 2024
 16:22:56 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:22:54 -0700
In-Reply-To: <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn> <Zq00OYowF5kc9QFE@google.com>
 <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Message-ID: <ZrFezgVbCI3DRQH3@google.com>
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
From: Sean Christopherson <seanjc@google.com>
To: maobibo <maobibo@loongson.cn>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 03, 2024, maobibo wrote:
> On 2024/8/3 =E4=B8=8A=E5=8D=883:32, Sean Christopherson wrote:
> > On Fri, Aug 02, 2024, maobibo wrote:
> > > On 2024/7/27 =E4=B8=8A=E5=8D=887:52, Sean Christopherson wrote:
> > > > Mark pages/folios dirty only the slow page fault path, i.e. only wh=
en
> > > > mmu_lock is held and the operation is mmu_notifier-protected, as ma=
rking a
> > > > page/folio dirty after it has been written back can make some files=
ystems
> > > > unhappy (backing KVM guests will such filesystem files is uncommon,=
 and
> > > > the race is minuscule, hence the lack of complaints).
> > > >=20
> > > > See the link below for details.
> > > >=20
> > > > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gma=
il.com
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > > ---
> > > >    arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
> > > >    1 file changed, 10 insertions(+), 8 deletions(-)
> > > >=20
> > > > diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> > > > index 2634a9e8d82c..364dd35e0557 100644
> > > > --- a/arch/loongarch/kvm/mmu.c
> > > > +++ b/arch/loongarch/kvm/mmu.c
> > > > @@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu =
*vcpu, unsigned long gpa, bool writ
> > > >    		if (kvm_pte_young(changed))
> > > >    			kvm_set_pfn_accessed(pfn);
> > > > -		if (kvm_pte_dirty(changed)) {
> > > > -			mark_page_dirty(kvm, gfn);
> > > > -			kvm_set_pfn_dirty(pfn);
> > > > -		}
> > > >    		if (page)
> > > >    			put_page(page);
> > > >    	}
> > > > +
> > > > +	if (kvm_pte_dirty(changed))
> > > > +		mark_page_dirty(kvm, gfn);
> > > > +
> > > >    	return ret;
> > > >    out:
> > > >    	spin_unlock(&kvm->mmu_lock);
> > > > @@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu=
, unsigned long gpa, bool write)
> > > >    	else
> > > >    		++kvm->stat.pages;
> > > >    	kvm_set_pte(ptep, new_pte);
> > > > -	spin_unlock(&kvm->mmu_lock);
> > > > -	if (prot_bits & _PAGE_DIRTY) {
> > > > -		mark_page_dirty_in_slot(kvm, memslot, gfn);
> > > > +	if (writeable)
> > > Is it better to use write or (prot_bits & _PAGE_DIRTY) here?  writabl=
e is
> > > pte permission from function hva_to_pfn_slow(), write is fault action=
.
> >=20
> > Marking folios dirty in the slow/full path basically necessitates marki=
ng the
> > folio dirty if KVM creates a writable SPTE, as KVM won't mark the folio=
 dirty
> > if/when _PAGE_DIRTY is set.
> >=20
> > Practically speaking, I'm 99.9% certain it doesn't matter.  The folio i=
s marked
> > dirty by core MM when the folio is made writable, and cleaning the foli=
o triggers
> > an mmu_notifier invalidation.  I.e. if the page is mapped writable in K=
VM's
> yes, it is. Thanks for the explanation. kvm_set_pfn_dirty() can be put on=
ly
> in slow page fault path. I only concern with fault type, read fault type =
can
> set pte entry writable however not _PAGE_DIRTY at stage-2 mmu table.
>=20
> > stage-2 PTEs, then its folio has already been marked dirty.
> Considering one condition although I do not know whether it exists actual=
ly.
> user mode VMM writes the folio with hva address firstly, then VCPU thread
> *reads* the folio. With primary mmu table, pte entry is writable and
> _PAGE_DIRTY is set, with secondary mmu table(state-2 PTE table), it is
> pte_none since the filio is accessed at first time, so there will be slow
> page fault path for stage-2 mmu page table filling.
>=20
> Since it is read fault, stage-2 PTE will be created with _PAGE_WRITE(comi=
ng
> from function hva_to_pfn_slow()), however _PAGE_DIRTY is not set. Do we n=
eed
> call kvm_set_pfn_dirty() at this situation?

If KVM doesn't mark the folio dirty when the stage-2 _PAGE_DIRTY flag is se=
t,
i.e. as proposed in this series, then yes, KVM needs to call kvm_set_pfn_di=
rty()
even though the VM hasn't (yet) written to the memory.  In practice, KVM ca=
lling
kvm_set_pfn_dirty() is redundant the majority of the time, as the stage-1 P=
TE
will have _PAGE_DIRTY set, and that will get propagated to the folio when t=
he
primary MMU does anything relevant with the PTE.  And for file systems that=
 care
about writeback, odds are very good that the folio was marked dirty even ea=
rlier,
when MM invoked vm_operations_struct.page_mkwrite().

The reason I am pushing to have all architectures mark pages/folios dirty i=
n the
slow page fault path is that a false positive (marking a folio dirty withou=
t the
folio ever being written in _any_ context since the last pte_mkclean()) is =
rare,
and at worst results an unnecessary writeback.  On the other hand, marking =
folios
dirty in fast page fault handlers (or anywhere else that isn't protected by
mmu_notifiers) is technically unsafe.

In other words, the intent is to sacrifice accuracy to improve stability/ro=
bustness,
because the vast majority of time the loss in accuracy has no effect, and t=
he worst
case scenario is that the kernel does I/O that wasn't necessary.
