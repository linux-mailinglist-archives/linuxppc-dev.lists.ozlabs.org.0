Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18757945E7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 00:04:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=InaBS0MY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgxH450gVz3cCH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 08:04:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=InaBS0MY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3lff4zaykdc4cokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgxGB6nC1z2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 08:03:30 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7ec9300c51so328357276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Sep 2023 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694037805; x=1694642605; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGjz0wwIvGFqvXEmPizGTlbv+e1jyl/6EbitI2f252Y=;
        b=InaBS0MYeCDvBqMnUAYSgjZcM5mmZC6LrQ2CH3NI9tDDJ6DTGcyVY2K+VUbJSPe3iw
         3S+1nS84SYfHa9thq8ZAZkwcxJ1H7ZNnBvtVsz1jLaLEymgoo/mVY6yyB8GL2T38hHsU
         HN6A2UAm88My4B3snPzkGxl7MxMvxoM54m7CzOfsqdWlAiFlNAolDCO1KCVkUgQfKyVC
         fG/sp8AJSaNDifxzeI/ub391LONL+ZrBlsYmxidU1x1jAkfLsV9zOIWd4FIJ1HznloZ0
         Ulj7BjFdw0dBEleSIgHvZlq6NZYXWNJOo3fqrXRV6Kdul2MEtpZLd0zjkcqtwKr5Pwf5
         orSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037805; x=1694642605;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGjz0wwIvGFqvXEmPizGTlbv+e1jyl/6EbitI2f252Y=;
        b=BuRcZH0Ki2OZq4UOK38yaHgR2GBk9JrLMpFSAxZc1xpxEvQ68vt91lRqfRrV8ljeFA
         G6KeJMcD7XKwDzIm/PO72TupGIfWYx2lB9UmJFROSkbiuIcXF5/dDALG+BgolzJ56u/6
         h2E9ohliGQk3WoAxBEyfQgI6kKAy+zWzvbp3RtjeiuCCPqqJyqXATaubqDY3Uw9XeVZF
         8gNdlYjmboXKamhP0gO9u3bIu2NDPBFxPju04tOgpFBR9f2KQDhMninbSm7lFG44/zeT
         PZc22OSpMZkcByuGmfFgj4Ig4Yyh/U88z/tLj59dcgQMvw0QOyZviaS/bRmPWdYkUb2e
         JOog==
X-Gm-Message-State: AOJu0YylGONSzsMHjwn2MjfnBgg+z0qIvoAgHq8FGZ5gkrdK7l8N6lwm
	/a7t+bWDUgAwb42MLPBZDWK9zE6kCdc=
X-Google-Smtp-Source: AGHT+IGOMcVTpbC+lxuJRrEEC94mRP+gmjhMRarxpVWopTpRuNtLEn0yjfIpL45dRKz4q3Wh4Fcwje8c9EI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:40d0:0:b0:d7b:9902:fb3d with SMTP id
 n199-20020a2540d0000000b00d7b9902fb3dmr421967yba.0.1694037805327; Wed, 06 Sep
 2023 15:03:25 -0700 (PDT)
Date: Wed, 6 Sep 2023 15:03:23 -0700
In-Reply-To: <CAD=HUj4W4PF3O9oLZx-3Rd_W51x1z30hQ36m_fcWUpw=mxUpSA@mail.gmail.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-4-stevensd@google.com>
 <20230705161914.00004070.zhi.wang.linux@gmail.com> <CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
 <20230711203348.00000fb8.zhi.wang.linux@gmail.com> <ZK3Q34WNLjGVQQw+@google.com>
 <CAD=HUj6SoKHhA02oNpCt--ofE_n1wjdY1ddBURXDiS5Rwu=Q-g@mail.gmail.com>
 <ZPfLjnG8b9LJV4p7@google.com> <CAD=HUj4W4PF3O9oLZx-3Rd_W51x1z30hQ36m_fcWUpw=mxUpSA@mail.gmail.com>
Message-ID: <ZPj3KyvCa4GM0RJ2@google.com>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 06, 2023, David Stevens wrote:
> On Wed, Sep 6, 2023 at 9:45=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Tue, Sep 05, 2023, David Stevens wrote:
> > > For property 2, FOLL_GET is also important. If guarded_by_mmu_notifie=
r
> > > is set, then we're all good here. If guarded_by_mmu_notifier is not
> > > set, then the check in __kvm_follow_pfn guarantees that FOLL_GET is
> > > set. For struct page memory, we're safe because KVM will hold a
> > > reference as long as it's still using the page. For non struct page
> > > memory, we're not safe - this is where the breaking change of
> > > allow_unsafe_mappings would go. Note that for non-refcounted struct
> > > page, we can't use the allow_unsafe_mappings escape hatch. Since
> > > FOLL_GET was requested, if we returned such a page, then the caller
> > > would eventually corrupt the page refcount via kvm_release_pfn.
> >
> > Yes we can.  The caller simply needs to be made aware of is_refcounted_=
page.   I
> > didn't include that in the snippet below because I didn't want to write=
 the entire
> > patch.  The whole point of adding is_refcounted_page is so that callers=
 can
> > identify exactly what type of page was at the end of the trail that was=
 followed.
>=20
> Are you asking me to completely migrate every caller of any gfn_to_pfn
> variant to __kvm_follow_pfn, so that they can respect
> is_refcounted_page? That's the only way to make it safe for
> allow_unsafe_mappings to apply to non-refcounted pages. That is
> decidedly not simple. Or is kvm_vcpu_map the specific call site you
> care about? At best, I can try to migrate x86, and then just add some
> sort of compatibility shim for other architectures that rejects
> non-refcounted pages.

Ah, I see your conundrum.  No, I don't think it's reasonable to require you=
 to
convert all users in every architecture.  I'll still ask, just in case you'=
re
feeling generous, but it's not a requirement :-)

The easiest way forward I can think of is to add yet another flag to kvm_fo=
llow_pfn,
e.g. allow_non_refcounted_struct_page, to communicate whether or not the ca=
ller
has been enlightened to play nice with non-refcounted struct page memory.  =
We'll
need that flag no matter what, otherwise we'd have to convert all users in =
a single
patch (LOL).  Then your series can simply stop at a reasonable point, e.g. =
convert
all x86 usage (including kvm_vcpu_map(), and leave converting everything el=
se to
future work.

E.g. I think this would be the outro of hva_to_pfn_remapped():

        if (!page)
                goto out;

        if (get_page_unless_zero(page))
                WARN_ON_ONCE(kvm_follow_refcounted_pfn(foll, page) !=3D pfn=
);
 out:
        pte_unmap_unlock(ptep, ptl);

	/*
	 * TODO: Drop allow_non_refcounted_struct_page once all callers have
	 * been taught to play nice with non-refcounted tail pages.
	 */
	if (page && !foll->is_refcounted_page &&
	    !foll->allow_non_refcounted_struct_page)
		r =3D -EFAULT
        else if (!foll->is_refcounted_page && !foll->guarded_by_mmu_notifie=
r &&
        	 !allow_unsafe_mappings)
        	r =3D -EFAULT;
        else
               *p_pfn =3D pfn;

        return r;

> > > Property 3 would be nice, but we've already concluded that guarding
> > > all translations with mmu notifiers is infeasible. So maintaining
> > > property 2 is the best we can hope for.
> >
> > No, #3 is just a variant of #2.  Unless you're talking about not making=
 guarantees
> > about guest accesses being ordered with respect to VMA/memslot updates,=
 but I
> > don't think that's the case.
>=20
> I'm talking about the fact that kvm_vcpu_map is busted with respect to
> updates to VMA updates. It won't corrupt host memory because the
> mapping keeps a reference to the page, but it will continue to use
> stale translations.

True.  But barring some crazy paravirt use case, userspace modifying a mapp=
ing
that is in active use is inherently broken, the guest will have no idea tha=
t memory
just got yanked away.

Hmm, though I suppose userspace could theoretically mprotect() a mapping to=
 be
read-only, which would "work" for mmu_notifier paths but not kvm_vcpu_map()=
.  But
KVM doesn't provide enough information on -EFAULT for userspace to do anyth=
ing in
response to a write to read-only memory, so in practice that's likely inher=
ently
broken too.

> From [1], it sounds like you've granted that fixing that is not feasible,=
 so
> I just wanted to make sure that this isn't the "unsafe" referred to by
> allow_unsafe_mappings.

Right, this is not the "unsafe" I'm referring to.

> [1] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/
