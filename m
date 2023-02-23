Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767E6A0ED6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:41:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN0hB20fTz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:41:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GBvZr3FR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GBvZr3FR;
	dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0gH6KhSz3bjx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:40:58 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id f23so16468640vsa.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo7AgQ2bct21yLgbxRinWk51c7Sq7xFh6y+K3L6/tTM=;
        b=GBvZr3FRKM3NOesy8gVSZUY02Sq7aNLAUfDffqGDvKf740Ehqv8nBE7Oi8FsVIN6J1
         JkZFMoh+qCPEAzymwVHG0z1bBMx/KYg6SymF2QTZuOLraOywk3TLiLhpYUErfPSbomdU
         FdELqyo5w45/teVQSzUk24vH1+jYHCr88FiP2s8cZmTnhZ/p9c9I1VeiW+nF0kurnbWN
         zU2trwEFNYfVM5n6sxlFHrJwWriTlH1Yux1MJGSccWSU+BwuGOcqC/WBw7sP08hDnexG
         HURlUENH3H2vj5o3TSRbImMuccAeHy0C5gzNj/u3KE2SP/RtkjYxI2vBWBhCxO8K3UcO
         df/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo7AgQ2bct21yLgbxRinWk51c7Sq7xFh6y+K3L6/tTM=;
        b=kszEGB+kTS/kYrVov4hm/MpzQZrPtCU7xzSIzeSB3w6B/AaBv8c7jN+9mORr/Ugr5r
         T3VJHSrXXDsgwKplSGLKwDxjpK3XPlaO8+yWpb0uoO7dWOJaRoaRN1YS/c7ebN91n/9a
         33ynvJJYnqhAz6Tvwj/d1HOgSEaPiNzamUGJ5Uy55DuL6SSvFVtZ9VDniYlnkPv189n2
         hApmIKVp7YtbRNdfV19Ie3WCjlLXmw0Jgut2If/Uo3HFQiAzDTFIx1etKYP9Kbfp1yjz
         e7T2Zm0byQw5uKSmGx3qX7fntFmZZVcMzITdx/0GJ4SDY1NgdOrzK9tH28ER1ENUtIZE
         pRZg==
X-Gm-Message-State: AO0yUKUzQCuwsTsFa6+FMOetdfRewyWsl0mNbqhBLz6Sv4CF+CTF3JC1
	6Uw3Q/IIDTryBSDEjcS8OpBG1GxVwHV+yuFwwXhaNg==
X-Google-Smtp-Source: AK7set9wJbC1t128b6r/YElZqMz+AmeZGkkjsbu1lRieG6NYjdy/fQfX1OM7M72E6+9T9qCprQHwdxazlikgHRzNMDs=
X-Received: by 2002:a05:6102:108f:b0:41e:d8b5:ee40 with SMTP id
 s15-20020a056102108f00b0041ed8b5ee40mr899877vsr.26.1677174055279; Thu, 23 Feb
 2023 09:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-2-yuzhao@google.com>
 <Y/ee1s3XPGa62SFV@google.com>
In-Reply-To: <Y/ee1s3XPGa62SFV@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 10:40:19 -0700
Message-ID: <CAOUHufZ0Ep4_Edo4OoeUVpVK4uFJF6_yVL=xSrQM8an_Vw4VKw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 1/5] mm/kvm: add mmu_notifier_test_clear_young()
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Feb 23, 2023 at 10:14=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 16, 2023, Yu Zhao wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 9c60384b5ae0..1b465df4a93d 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -875,6 +875,63 @@ static int kvm_mmu_notifier_clear_young(struct mmu=
_notifier *mn,
> >       return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn)=
;
> >  }
> >
> > +static bool kvm_test_clear_young(struct kvm *kvm, unsigned long start,
> > +                              unsigned long end, unsigned long *bitmap=
)
> > +{
> > +     int i;
> > +     int key;
> > +     bool success =3D true;
> > +
> > +     trace_kvm_age_hva(start, end);
> > +
> > +     key =3D srcu_read_lock(&kvm->srcu);
> > +
> > +     for (i =3D 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> > +             struct interval_tree_node *node;
> > +             struct kvm_memslots *slots =3D __kvm_memslots(kvm, i);
> > +
> > +             kvm_for_each_memslot_in_hva_range(node, slots, start, end=
 - 1) {
> > +                     gfn_t lsb_gfn;
> > +                     unsigned long hva_start, hva_end;
> > +                     struct kvm_gfn_range range =3D {
> > +                             .slot =3D container_of(node, struct kvm_m=
emory_slot,
> > +                                                  hva_node[slots->node=
_idx]),
> > +                     };
> > +
> > +                     hva_start =3D max(start, range.slot->userspace_ad=
dr);
> > +                     hva_end =3D min(end - 1, range.slot->userspace_ad=
dr +
> > +                                            range.slot->npages * PAGE_=
SIZE - 1);
> > +
> > +                     range.start =3D hva_to_gfn_memslot(hva_start, ran=
ge.slot);
> > +                     range.end =3D hva_to_gfn_memslot(hva_end, range.s=
lot) + 1;
> > +
> > +                     if (WARN_ON_ONCE(range.end <=3D range.start))
> > +                             continue;
>
> Extend __kvm_handle_hva_range() instead of copy-pasting.  At a very quick=
 glance,
> I believe all that is needed is (minus sanity checks):

Yes, will do.

I do need to add one more parameter to kvm_gfn_range, because that's
what the current kvm_arch_test_clear_young() needs, assuming that
function is acceptable.

Also, just a side note, from MM's POV, the following in
__kvm_handle_hva_range() seems to forget to handle end =3D=3D 0, if that's
possible?

  hva_end =3D min(range->end, slot->userspace_addr + (slot->npages <<
PAGE_SHIFT));

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d255964ec331..3296ae2cf6fa 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -544,6 +544,7 @@ struct kvm_hva_range {
>         hva_handler_t handler;
>         on_lock_fn_t on_lock;
>         on_unlock_fn_t on_unlock;
> +       bool lockless;
>         bool flush_on_ret;
>         bool may_block;
>  };
> @@ -616,7 +617,7 @@ static __always_inline int __kvm_handle_hva_range(str=
uct kvm *kvm,
>                         gfn_range.end =3D hva_to_gfn_memslot(hva_end + PA=
GE_SIZE - 1, slot);
>                         gfn_range.slot =3D slot;
>
> -                       if (!locked) {
> +                       if (!range->lockless && !locked) {
>                                 locked =3D true;
>                                 KVM_MMU_LOCK(kvm);
>                                 if (!IS_KVM_NULL_FN(range->on_lock))
>
> > +
> > +                     /* see the comments on the generic kvm_arch_has_t=
est_clear_young() */
> > +                     lsb_gfn =3D hva_to_gfn_memslot(end - 1, range.slo=
t);
> > +
> > +                     success =3D kvm_arch_test_clear_young(kvm, &range=
, lsb_gfn, bitmap);
> > +                     if (!success)
> > +                             break;
> > +             }
> > +     }
> > +
> > +     srcu_read_unlock(&kvm->srcu, key);
> > +
> > +     return success;
> > +}
