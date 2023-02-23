Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068236A10EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:59:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN3km69Bvz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 06:59:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WjkAmKeE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3xmx3ywykdosfrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WjkAmKeE;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN3js0QFpz3cct
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 06:58:23 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id gg5-20020a17090b0a0500b00237659a783eso122942pjb.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lATDuswOZbF3zLZuGn25g5w5EeOK39dFmfATzQI6x48=;
        b=WjkAmKeEgiP2hEXlbY746mkX3ZhOMGDC4P9c79ltVgkK2cIemHwqXcH6WrYyLHRdQF
         TPDAxjgYxRcgOZ9Cw42YNQatNy0fLX/b4SjlpRmVjocgTwZ+/NHLb7um96NikQlj0ehi
         z61VCGlKVn6yqKg+7X6pk7a0r38wnJVjrHrAZelDuyus9u6bCJc1ucQYnC0gwEUNfBwL
         13s742XTOtNhDMUSovA7LDI9gfjrAbYLiDVYULHMN2GVGPzYnZOpwz34E6zS9Nxlczcd
         dm/+tCl7gL4ogIAyiGwzVItI4JYWQw4a5Yck0h70zIDUUba1T72R6HIZu+LfmJQ/sl0T
         Hf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lATDuswOZbF3zLZuGn25g5w5EeOK39dFmfATzQI6x48=;
        b=JpADD3/BYdNjEseedq/Wj7LypY4F1mf8hsYlOtiFwhlUXwwDnjImuBNQisBRo75g2b
         dN+mIm5n16f81Qy9qNtRxcaXjBQcj0iPhzmnRxYHKbZ8TiLeEXstaaA8ulDP8b7x3ZlR
         NlDYh6Z6Hh6acLfLCtx6DU/VsB07C/YRalmbW+6n155MSUNA+ODtON1IMbae83Ff1aUN
         jwNWlJnLFSZPaKoP9Mu40SHSnHA0mhpM4ONdqpl0ostvmYdYCv15O1cvpGH1x8KfgUil
         HfgxZSipTU5z6PBi7PEX1ajite1DHR7Nqq0+7QNJZD3zzDiKx+Fu/GiQPHzPiErQ0Yig
         VYSQ==
X-Gm-Message-State: AO0yUKUD/X+qb/8Yz6jRUtRCQFpASQx3FUrdrErPaHKcIdQZstgeddC6
	sqnJtYPkEOfnkGB+wJ/s0L2J5yXFdqc=
X-Google-Smtp-Source: AK7set/ODb8D8144x2HqvMvJqO9rb7VbrC4eAbsdwQguwGwUJ87CVxuU31/KcwKltggxqLDvzZUouJLJe5k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:1993:0:b0:5a8:bdd2:f99c with SMTP id
 141-20020a621993000000b005a8bdd2f99cmr1974028pfz.1.1677182300738; Thu, 23 Feb
 2023 11:58:20 -0800 (PST)
Date: Thu, 23 Feb 2023 11:58:19 -0800
In-Reply-To: <CAOUHufbwcqx21T=zmvYpnX_Mnd2A0KkPORbtxnJEwKuUKVSPzA@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com> <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
 <Y/e6Z+KIl6sYJoRg@google.com> <CAOUHufbwcqx21T=zmvYpnX_Mnd2A0KkPORbtxnJEwKuUKVSPzA@mail.gmail.com>
Message-ID: <Y/fFWyYPu5Jf0de1@google.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023, Yu Zhao wrote:
> On Thu, Feb 23, 2023 at 12:11=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > As alluded to in patch 1, unless batching the walks even if KVM doe=
s _not_ support
> > > > a lockless walk is somehow _worse_ than using the existing mmu_noti=
fier_clear_flush_young(),
> > > > I think batching the calls should be conditional only on LRU_GEN_SP=
TE_WALK.  Or
> > > > if we want to avoid batching when there are no mmu_notifier listene=
rs, probe
> > > > mmu_notifiers.  But don't call into KVM directly.
> > >
> > > I'm not sure I fully understand. Let's present the problem on the MM
> > > side: assuming KVM supports lockless walks, batching can still be
> > > worse (very unlikely), because GFNs can exhibit no memory locality at
> > > all. So this option allows userspace to disable batching.
> >
> > I'm asking the opposite.  Is there a scenario where batching+lock is wo=
rse than
> > !batching+lock?  If not, then don't make batching depend on lockless wa=
lks.
>=20
> Yes, absolutely. batching+lock means we take/release mmu_lock for
> every single PTE in the entire VA space -- each small batch contains
> 64 PTEs but the entire batch is the whole KVM.

Who is "we"?  I don't see anything in the kernel that triggers walking the =
whole
VMA, e.g. lru_gen_look_around() limits the walk to a single PMD.  I feel li=
ke I'm
missing something...
