Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F26A11C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:13:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN5NF1VBbz3cj3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 08:13:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cstTUl3c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3udb3ywykdgwcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cstTUl3c;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN5MK6qFdz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 08:12:27 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id ep2-20020a17090ae64200b0023699c4353eso195666pjb.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 13:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZqpqHNnDrkVf5YnH4C4p2Du+MWFI+rsSboHjRikfo0=;
        b=cstTUl3cDjETi7Uy5k8lUK4jDXVH5n84ULJ8Qdzf8KUig6GFtpHB7w0eoI8Plhg2NM
         6FWa3l7sXNc+M6YDtvaFjXzlpRtWBMe5SojZXE91tPmgJMlFF/CW1ZZv81jiCr0fXexK
         lScdHryZlveE1J+z0J2TIi81MbXXQWHYdNInuM44+8VugSDN/fGG/tYGrW4Jcvq/Dl9n
         Ek7HnOVQiTB+e4FM6RTzQyIV1EEstxc2pOWecp5NaX9GOemJJxxrazzswOceIxFVcfln
         /s7eha+SalTSQycIbbCTH+sAFv5dgkYSrn8AD1goiYFHWVwKHCsyUeb7nev3pGjb/y5j
         CUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZqpqHNnDrkVf5YnH4C4p2Du+MWFI+rsSboHjRikfo0=;
        b=BTDyK8d04IOSdgH6LAPZxKDwfJREf9sGVAJoaIt21cJPDLSMbIxQafQFSM8R0romNt
         K7cr21NOQDTfYiCwpyxrg/9XiX6S1AfJw6LaplhtCOQRnenLfc8dUh27qReiyJj3wX64
         Lsup/KjxDCrSYf7KTZfAP3aE6Q2YZhgLrN5reCoNP/eM6r/gH5eHQQkpzJnBl4X20zfB
         L2/HZEXWmc6oMp5AfvhbciK4bb2zBRyUNoIctppGyj4b388wfUT6Jm7LeObbdkKGFEBg
         zMoqPwBVPnCJHQZ3kIbvtp+8gs2KE1OKhGreD/02GOsfEYcmd1rcuHTyOZ6Pw4UOx8d4
         Peqw==
X-Gm-Message-State: AO0yUKUSyiA0Ba7n7sWQZdC1RFBdCtUmW1yfn7MHKM2fz/HtD/BJPInr
	3quZPh3ThY9wT0bsYPmorvqGTWiZlno=
X-Google-Smtp-Source: AK7set8UOj7NygywK+cGr/Rmvj7I4XEunDNhPQJfW5dsIVprbIkkXYFIqYFcViXFQ9A3GP588Pa1F52horE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fa4b:b0:237:2106:a861 with SMTP id
 dt11-20020a17090afa4b00b002372106a861mr826705pjb.0.1677186745595; Thu, 23 Feb
 2023 13:12:25 -0800 (PST)
Date: Thu, 23 Feb 2023 13:12:24 -0800
In-Reply-To: <CAOUHufZ0Ep4_Edo4OoeUVpVK4uFJF6_yVL=xSrQM8an_Vw4VKw@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-2-yuzhao@google.com>
 <Y/ee1s3XPGa62SFV@google.com> <CAOUHufZ0Ep4_Edo4OoeUVpVK4uFJF6_yVL=xSrQM8an_Vw4VKw@mail.gmail.com>
Message-ID: <Y/fWuGL5RN8fUIr5@google.com>
Subject: Re: [PATCH mm-unstable v1 1/5] mm/kvm: add mmu_notifier_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023, Yu Zhao wrote:
> On Thu, Feb 23, 2023 at 10:14=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Feb 16, 2023, Yu Zhao wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 9c60384b5ae0..1b465df4a93d 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -875,6 +875,63 @@ static int kvm_mmu_notifier_clear_young(struct m=
mu_notifier *mn,
> > >       return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gf=
n);
> > >  }
> > >
> > > +static bool kvm_test_clear_young(struct kvm *kvm, unsigned long star=
t,
> > > +                              unsigned long end, unsigned long *bitm=
ap)
> > > +{
> > > +     int i;
> > > +     int key;
> > > +     bool success =3D true;
> > > +
> > > +     trace_kvm_age_hva(start, end);
> > > +
> > > +     key =3D srcu_read_lock(&kvm->srcu);
> > > +
> > > +     for (i =3D 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > > +             struct interval_tree_node *node;
> > > +             struct kvm_memslots *slots =3D __kvm_memslots(kvm, i);
> > > +
> > > +             kvm_for_each_memslot_in_hva_range(node, slots, start, e=
nd - 1) {
> > > +                     gfn_t lsb_gfn;
> > > +                     unsigned long hva_start, hva_end;
> > > +                     struct kvm_gfn_range range =3D {
> > > +                             .slot =3D container_of(node, struct kvm=
_memory_slot,
> > > +                                                  hva_node[slots->no=
de_idx]),
> > > +                     };
> > > +
> > > +                     hva_start =3D max(start, range.slot->userspace_=
addr);
> > > +                     hva_end =3D min(end - 1, range.slot->userspace_=
addr +
> > > +                                            range.slot->npages * PAG=
E_SIZE - 1);
> > > +
> > > +                     range.start =3D hva_to_gfn_memslot(hva_start, r=
ange.slot);
> > > +                     range.end =3D hva_to_gfn_memslot(hva_end, range=
.slot) + 1;
> > > +
> > > +                     if (WARN_ON_ONCE(range.end <=3D range.start))
> > > +                             continue;
> >
> > Extend __kvm_handle_hva_range() instead of copy-pasting.  At a very qui=
ck glance,
> > I believe all that is needed is (minus sanity checks):
>=20
> Yes, will do.
>=20
> I do need to add one more parameter to kvm_gfn_range, because that's
> what the current kvm_arch_test_clear_young() needs, assuming that
> function is acceptable.
>=20
> Also, just a side note, from MM's POV, the following in
> __kvm_handle_hva_range() seems to forget to handle end =3D=3D 0, if that'=
s
> possible?

It's handled by the WARN_ON_ONCE() at the very top:

static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
						  const struct kvm_hva_range *range)
{
	if (WARN_ON_ONCE(range->end <=3D range->start))
		return 0;


>=20
>   hva_end =3D min(range->end, slot->userspace_addr + (slot->npages <<
> PAGE_SHIFT));
