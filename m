Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B96A113E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:29:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN4QD1S75z3cj0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Oj0JNHRf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3jmz3ywykdcszlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Oj0JNHRf;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN4PF0V91z3cBy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:29:03 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id ep2-20020a17090ae64200b0023699c4353eso153982pjb.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 12:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMpgRmyVDog12gGF5u00S3GFVvfa3RjsGhYYuIghQuw=;
        b=Oj0JNHRfBF0003MFOrybvJRxKWvg4a//DfyLNclUK+7N5/s7VjeN2Ybz0ne96gQ+y/
         Kce+Q0ZXdzbS+HItx2LVYs6XbJeGYav5T0kxtg6oSGyyAnYLkgfUmKMvnWrz/RJr2iGt
         BiNuY4XQIP71ObixRoPGWBrf5q6zjI9OvmSI5XqGwGSoaN4Qo8PjJcVdjNQWqFmCbaNT
         fDylmTkY2OnILfYvuCp/0wvlS/vK3WqeY+Vs8jpgS0bDY+Fzi+bVe+j3RecifYahcIhh
         j4oJs7UNz2z7WtDg2Ub7n9qah3g+mR+nVEw9Z6a8GUszbe4QIdPOG3iK1M22brh9bkyW
         z3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iMpgRmyVDog12gGF5u00S3GFVvfa3RjsGhYYuIghQuw=;
        b=8RvWfPW/GrMvOkPDVtYMriJ3jNvg0VGy9uHq/M8/7wm0zd+vKIH8VgkAYWaEFjj0Ok
         9JtQycOLSrPw54gi6Qzj3Dy1jARtQ28yxjVC2XR4RUfwPTw3APSByiXiUXB/uLwlqz6g
         S5EM/aYxPNNkTPd/QuCm9cREiuFxsObNip4Ja5GTlBCHUROe43qiEQ+174bLE7Sq+CDL
         IuasCcTMxFLMlZMjrEh4wgN05lkF8IKurxThR5oWLMavb/0xwydZ50dt+7Ac8vBnqJqs
         5L/LXcxg1fZFRfs7BDL+RqBRgkpTV6R1+8udYCPITh5GJWA3JBG9Mv4aUncO/Cn4txY3
         Ldzw==
X-Gm-Message-State: AO0yUKXSoYMMZmlYhpyBWZcLdc2+irCSxgTb19RyEiEOQr2dCMnlmCfc
	NkwbWkhVKcK5YW/Dwd24zBOkgkWEeHA=
X-Google-Smtp-Source: AK7set/XyWT2OAnpm11r3FBKVIDwL0kXrUZRkKccpnOexZiyXc1HvjHh6IvJEeYAirA5lDcDXm4Ck4IuD34=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1955:b0:593:f5e4:8d87 with SMTP id
 s21-20020a056a00195500b00593f5e48d87mr2471665pfk.6.1677184140109; Thu, 23 Feb
 2023 12:29:00 -0800 (PST)
Date: Thu, 23 Feb 2023 12:28:58 -0800
In-Reply-To: <CAOUHufYWktz4SNjL_o_2oZNcJLXserwCot-Prv4UEG9uzn57rg@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com> <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
 <Y/e6Z+KIl6sYJoRg@google.com> <CAOUHufbwcqx21T=zmvYpnX_Mnd2A0KkPORbtxnJEwKuUKVSPzA@mail.gmail.com>
 <Y/fFWyYPu5Jf0de1@google.com> <CAOUHufYWktz4SNjL_o_2oZNcJLXserwCot-Prv4UEG9uzn57rg@mail.gmail.com>
Message-ID: <Y/fMimvChfhhbCid@google.com>
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
> On Thu, Feb 23, 2023 at 12:58=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > On Thu, Feb 23, 2023 at 12:11=E2=80=AFPM Sean Christopherson <seanjc@=
google.com> wrote:
> > > >
> > > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > > > As alluded to in patch 1, unless batching the walks even if KVM=
 does _not_ support
> > > > > > a lockless walk is somehow _worse_ than using the existing mmu_=
notifier_clear_flush_young(),
> > > > > > I think batching the calls should be conditional only on LRU_GE=
N_SPTE_WALK.  Or
> > > > > > if we want to avoid batching when there are no mmu_notifier lis=
teners, probe
> > > > > > mmu_notifiers.  But don't call into KVM directly.
> > > > >
> > > > > I'm not sure I fully understand. Let's present the problem on the=
 MM
> > > > > side: assuming KVM supports lockless walks, batching can still be
> > > > > worse (very unlikely), because GFNs can exhibit no memory localit=
y at
> > > > > all. So this option allows userspace to disable batching.
> > > >
> > > > I'm asking the opposite.  Is there a scenario where batching+lock i=
s worse than
> > > > !batching+lock?  If not, then don't make batching depend on lockles=
s walks.
> > >
> > > Yes, absolutely. batching+lock means we take/release mmu_lock for
> > > every single PTE in the entire VA space -- each small batch contains
> > > 64 PTEs but the entire batch is the whole KVM.
> >
> > Who is "we"?
>=20
> Oops -- shouldn't have used "we".
>=20
> > I don't see anything in the kernel that triggers walking the whole
> > VMA, e.g. lru_gen_look_around() limits the walk to a single PMD.  I fee=
l like I'm
> > missing something...
>=20
> walk_mm() -> walk_pud_range() -> walk_pmd_range() -> walk_pte_range()
> -> test_spte_young() -> mmu_notifier_test_clear_young().
>=20
> MGLRU takes two passes: during the first pass, it sweeps entire VA
> space on each MM (per MM/KVM); during the second pass, it uses the rmap o=
n each
> folio (per folio).

Ah.  IIUC, userspace can use LRU_GEN_SPTE_WALK to control whether or not to=
 walk
secondary MMUs, and the kernel further restricts LRU_GEN_SPTE_WALK to secon=
dary
MMUs that implement a lockless walk.  And if the answer is "no", secondary =
MMUs
are simply not consulted.

If that's correct, then the proper way to handle this is by extending mmu_n=
otifier_ops
to query (a) if there's at least one register listeners that implements
test_clear_young() and (b) if all registered listeners that implement test_=
clear_young()
support lockless walks.  That avoids direct dependencies on KVM, and avoids=
 making
assumptions that may not always hold true, e.g. that KVM is the only mmu_no=
tifier
user that supports the young APIs.

P.S. all of this info absolutely belongs in documentation and/or changelogs=
.
