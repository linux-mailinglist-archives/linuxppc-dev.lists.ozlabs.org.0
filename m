Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E146A107D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN2wW397wz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 06:22:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4d0auWy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3xlz3ywykdemxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4d0auWy;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN2vX2JLqz3cXX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 06:21:42 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536bbaeceeaso144426157b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 11:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZopDWrZnbH+TBZHwFmu9lqsS8DLdv4K+JgWTWbyi1iU=;
        b=H4d0auWygP+hmWPqWDO3qHOcWpnYjVNf506Kv9RG0yijBoQVPVDvpSxMBTdo4uUJGO
         MLoFt/yVDt/rfg/KEjjWlgTsmtn2v/BJ7mcJ0tNJd/5B2yEYthUWMcP49jnHZIFS2xWD
         PYy85xVSu7OInOx0VfGConFKXB/8dzggfBGddjwi36FY4Kr5lsfQrJsHMyzxbXSZ6ul6
         eCrHhGBT4UNlyZ86MP+6pfLoRnP4BLJ+Xa6gqTf/lpjJRMImNB9r2JninNlL079C7W8J
         WgAk4CnNyPXAa81eo8Y6q3j7OEpZehi0vMcVGDQwUdb/BDgWqwnBxKdZk8Lqvnm0cjJZ
         PEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZopDWrZnbH+TBZHwFmu9lqsS8DLdv4K+JgWTWbyi1iU=;
        b=MR5HRNKqaLf6QEYDZJQJnBxvHzq9VY+HZR6kKll7ZPDZynkiLjkVuFcjMn098sHQFh
         aocpQAk2upACEqSV0mnDe0mKVQCc6R89O9dsy39k8gouqDHoV74yDhrrfbFup13zg+8W
         EATTNq3cWoopG0RT3GgJjIqcuy58PbHvcAU5C5vIVaghCyXmF7DulxyKTSv6YZ8jDTTJ
         dqoYpXbqazcDgFzfbncFYdJf8SJv1V0ItcElaDnV1uYVKQaT6TWE3DmkTJ9Nnw55ma3R
         OOvjnAaWJL7dUGZwgmFVWGWKXJkzfzWkuXPZnnocjEA2+zzogP3HhNHO6vT0eL18xRlL
         D6/g==
X-Gm-Message-State: AO0yUKVNAwxgymtGSNBbSlx53r9QG27pMdeyjgAbQnKvgdOu0w5Shz4+
	fRen1Iwu7db7myRTuTq1XCctD9fo/aI=
X-Google-Smtp-Source: AK7set8Y6PDK0RpzEk696ekGVhLGOajZqUcJ01xvSF46QVcIbnp7Dq+AUoIZCvKnF1H54bpA/2pnHYcG804=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11cd:b0:8a3:d147:280b with SMTP id
 n13-20020a05690211cd00b008a3d147280bmr4056323ybu.3.1677180100192; Thu, 23 Feb
 2023 11:21:40 -0800 (PST)
Date: Thu, 23 Feb 2023 11:21:38 -0800
In-Reply-To: <CAOUHufbhKsWzXZP_VgOTVkKgZhU=LaXJBRKcaAk++d6sLk1ktA@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com> <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
 <Y/evPJg9gvXxO1hs@google.com> <CAOUHufYx8JUT0T11jxuqknHzUHOYm7kLm_JfgP3LmRrFe=E20Q@mail.gmail.com>
 <Y/e006bZOYXIFE/j@google.com> <CAOUHufbhKsWzXZP_VgOTVkKgZhU=LaXJBRKcaAk++d6sLk1ktA@mail.gmail.com>
Message-ID: <Y/e8wgqFSr8voAto@google.com>
Subject: Re: [PATCH mm-unstable v1 2/5] kvm/x86: add kvm_arch_test_clear_young()
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
> On Thu, Feb 23, 2023 at 11:47=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > On Thu, Feb 23, 2023 at 11:24=E2=80=AFAM Sean Christopherson <seanjc@=
google.com> wrote:
> > > >
> > > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > > On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <sea=
njc@google.com> wrote:
> > > > > > > I'll take a look at that series. clear_bit() probably won't c=
ause any
> > > > > > > practical damage but is technically wrong because, for exampl=
e, it can
> > > > > > > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will ju=
st fail
> > > > > > > in this case, obviously.)
> > > > > >
> > > > > > Eh, not really.  By that argument, clearing an A-bit in a huge =
PTE is also technically
> > > > > > wrong because the target gfn may or may not have been accessed.
> > > > >
> > > > > Sorry, I don't understand. You mean clear_bit() on a huge PTE is
> > > > > technically wrong? Yes, that's what I mean. (cmpxchg() on a huge =
PTE
> > > > > is not.)
> > > > >
> > > > > > The only way for
> > > > > > KVM to clear a A-bit in a non-leaf entry is if the entry _was_ =
a huge PTE, but was
> > > > > > replaced between the "is leaf" and the clear_bit().
> > > > >
> > > > > I think there is a misunderstanding here. Let me be more specific=
:
> > > > > 1. Clearing the A-bit in a non-leaf entry is technically wrong be=
cause
> > > > > that's not our intention.
> > > > > 2. When we try to clear_bit() on a leaf PMD, it can at the same t=
ime
> > > > > become a non-leaf PMD, which causes 1) above, and therefore is
> > > > > technically wrong.
> > > > > 3. I don't think 2) could do any real harm, so no practically no =
problem.
> > > > > 4. cmpxchg() can avoid 2).
> > > > >
> > > > > Does this make sense?
> > > >
> > > > I understand what you're saying, but clearing an A-bit on a non-lea=
f PMD that
> > > > _just_ got converted from a leaf PMD is "wrong" if and only if the =
intented
> > > > behavior is nonsensical.
> > >
> > > Sorry, let me rephrase:
> > > 1. Clearing the A-bit in a non-leaf entry is technically wrong becaus=
e
> > > we didn't make sure there is the A-bit there --  the bit we are
> > > clearing can be something else. (Yes, we know it's not, but we didn't
> > > define this behavior, e.g., a macro to designate that bit for non-lea=
f
> > > entries.
> >
> > Heh, by that definition, anything and everything is "technically wrong"=
.
>=20
> I really don't see how what I said, in our context,
>=20
>   "Clearing the A-bit in a non-leaf entry is technically wrong because
> we didn't make sure there is the A-bit there"
>=20
> can infer
>=20
>   "anything and everything is "technically wrong"."
>=20
> And how what I said can be an analogy to
>=20
>   "An Intel CPU might support SVM, even though we know no such CPUs
> exist, so requiring AMD or Hygon to enable SVM is technically wrong."
>=20
> BTW, here is a bug caused by clearing the A-bit in non-leaf entries in
> a different scenario:
> https://lore.kernel.org/linux-mm/20221123064510.16225-1-jgross@suse.com/
>=20
> Let's just agree to disagree.

No, because I don't want anyone to leave with the impression that relying o=
n the
Accessed bit to uniformly exist (or not) at all levels in the TDP MMU is so=
mehow
technically wrong.  The link you posted is about running as a Xen guest, an=
d is
in arch-agnostic code.  That is wildly different than what we are talking a=
bout
here, where the targets are strictly limited to x86-64 TDP, and the existen=
ce of
the Accessed bit is architecturally defined.

In this code, there are exactly two flavors of paging that can be in use, a=
nd
using clear_bit() to clear shadow_accessed_mask is safe for both, full stop=
.
