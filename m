Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCA9463F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 21:32:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WBeUDsaA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbGFb3xkqz3fSm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 05:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WBeUDsaA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ojstzgykdjmf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbGDv1krLz3dVR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 05:32:13 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb685d5987so10521513a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722627131; x=1723231931; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=WBeUDsaA7pazQTXyYic+rUpptuN268E3T97BUZsJ2qKITmPWfJEBnwZpvcn/0w+tOJ
         zvbUT+e1VNgGCrXYQD3YFEwE4AY/mESZkubAVjqJgk6m5MHIlwKxLabYZNPJdzZIw9DX
         uLn31/966dzOruhYPTwKMcyNS4CVrGmTwz/bfLCzddB8cONkAwjdGmgUzLctqeY1Sk5b
         1/qYUMXyC7rD7myyjy1gF1U9vXTeMFsAfwRkbF72jimP/M5qU29k+/42AM1zoN3SEFUt
         ReQ12snfK4hzbC3jC61H8mFeKuUo78otFZXKcz5Vc/yIHndB73HopiLQ/m4cTZPVzMJW
         K3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722627131; x=1723231931;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=sO85BcCrDpnzvHYxU2N+IYiR0yLCsuTtfZcycOzgNxZLUc+QkL/XNrP5+HaaCSCmkT
         rjO19WRXCGaCXcuCQZIWHvP07Uw9fMxfgNoPgXS8ZkwbqoC9IwsZvx9EB4T1ELszUMiP
         0kv3KzyW/j5gkJ3HfyojdP/CoPt5DJY3CLGLyGOYrA/Catw6CPMXfRY6hW76hx1hrX89
         mMDmzv65S2UUTye8TnwrJPsvcs76YZWhZuXk07GYkCP/jHJU6rvZlQvwezXuGrCX0s3+
         UuFIGxtfJI4S71ciufoJLezvTiDxw28xKqST3xXn+hPliu3zTW8fjT0PEueifdVuurNf
         HyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3MzNhSQemfxjO4YBignMJqLKqtB3OtY4EkcD20uJ8Qw4uE9YNWxdsu0qcCeBS0F2uk1NYa43tv2obvrd4mbJK2zEyB2VuMwXXR5B+hw==
X-Gm-Message-State: AOJu0Yy+F6WAZfph9nT39lv0JYiuuOjHWmCoQd7HVsDylMl8JLWrH6ce
	QX2i3MlMV1Cb17P4Hy/qAJJGWlrXRq7Go+fx6erGyQzgXOIzlFZGgTzeZZIYv8WDxBzfC4/k+mW
	WeA==
X-Google-Smtp-Source: AGHT+IHxpD4UvI3cH5YcMAfSn5X/q5FbzhvcZwiTnoiXfWEKupcq/mKgFqqrl+E4nqq+ftOi/sOAAYuzYXs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:50cf:b0:2c9:61f9:9b27 with SMTP id
 98e67ed59e1d1-2cff9526286mr68117a91.5.1722627130434; Fri, 02 Aug 2024
 12:32:10 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:32:09 -0700
In-Reply-To: <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Message-ID: <Zq00OYowF5kc9QFE@google.com>
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

On Fri, Aug 02, 2024, maobibo wrote:
> On 2024/7/27 =E4=B8=8A=E5=8D=887:52, Sean Christopherson wrote:
> > Mark pages/folios dirty only the slow page fault path, i.e. only when
> > mmu_lock is held and the operation is mmu_notifier-protected, as markin=
g a
> > page/folio dirty after it has been written back can make some filesyste=
ms
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > the race is minuscule, hence the lack of complaints).
> >=20
> > See the link below for details.
> >=20
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.c=
om
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> > index 2634a9e8d82c..364dd35e0557 100644
> > --- a/arch/loongarch/kvm/mmu.c
> > +++ b/arch/loongarch/kvm/mmu.c
> > @@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcp=
u, unsigned long gpa, bool writ
> >   		if (kvm_pte_young(changed))
> >   			kvm_set_pfn_accessed(pfn);
> > -		if (kvm_pte_dirty(changed)) {
> > -			mark_page_dirty(kvm, gfn);
> > -			kvm_set_pfn_dirty(pfn);
> > -		}
> >   		if (page)
> >   			put_page(page);
> >   	}
> > +
> > +	if (kvm_pte_dirty(changed))
> > +		mark_page_dirty(kvm, gfn);
> > +
> >   	return ret;
> >   out:
> >   	spin_unlock(&kvm->mmu_lock);
> > @@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, un=
signed long gpa, bool write)
> >   	else
> >   		++kvm->stat.pages;
> >   	kvm_set_pte(ptep, new_pte);
> > -	spin_unlock(&kvm->mmu_lock);
> > -	if (prot_bits & _PAGE_DIRTY) {
> > -		mark_page_dirty_in_slot(kvm, memslot, gfn);
> > +	if (writeable)
> Is it better to use write or (prot_bits & _PAGE_DIRTY) here?  writable is
> pte permission from function hva_to_pfn_slow(), write is fault action.

Marking folios dirty in the slow/full path basically necessitates marking t=
he
folio dirty if KVM creates a writable SPTE, as KVM won't mark the folio dir=
ty
if/when _PAGE_DIRTY is set.

Practically speaking, I'm 99.9% certain it doesn't matter.  The folio is ma=
rked
dirty by core MM when the folio is made writable, and cleaning the folio tr=
iggers
an mmu_notifier invalidation.  I.e. if the page is mapped writable in KVM's
stage-2 PTEs, then its folio has already been marked dirty.
