Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64B6A108C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:26:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN31H3qMVz3cct
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 06:26:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EdY0Zf42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EdY0Zf42;
	dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN30L3d52z3bh3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 06:25:54 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id g12so19123725vsf.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 11:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaN2m3eSdvQkZvFXVE5UwMtaHXh9kInOcPsQSxfuApo=;
        b=EdY0Zf42ZDRE5qttzyl6jWrHpR09fR1WYt885kd5Np43hjOjFvTgv/qafLuP2e/iYn
         Q5NiW0sXJQ99vo9CaNQ0NgLbSkRRmaO8aMUbNLNlhu2ZbabhX9zEOX5k/kc2LuYCJFtr
         qQnSvXzZNvaThZ8gqnSKqcakXE3Dm5AGNefE0M3sBomy7U9GtpPIIzmUgxTF3/IyYYmw
         3J4ppBng3VEdZz4yGITOqYKi96kzh8seeVMxnEEhXUZrW50AtA5j0DmRye+ILDXMuKh9
         5yZ+74iJ6VpGIZ9GKicdgFx5BWvLcdUTerJkJh4BQ8UOfIm5uv4FE50NVc66HSEwySfk
         y1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaN2m3eSdvQkZvFXVE5UwMtaHXh9kInOcPsQSxfuApo=;
        b=cCNXue6n1qrZZGZm18NU5Y1B7yk4S10ffC68MYZ+OT3pUFFqeDcLNRthrxKjSKNtg7
         bYe3TTkpp1EB2w92XfxpdAZa5WCVrR7oywZQdsXrSC9KzAkSnrLSvzsC0WfMMhBCazAs
         D8mo29UYDswUXFi0noU6yT3bQQ9RGVUPTfbHrmJzZY/PlOWIozWQDVRhdrP5UKlLviro
         dWiCTNbrONeQ3Gh6Xy7t1+CYvatbL/cGyBqrPbMZUMgYB053UeH6QRv2OtExuSSirb6g
         EcRRtJJ7YN9+RRZCR2IM8ZFh7wFgmwU6eIZZ8m4EmushxMCfyIn0cVpi2IzQTkLRzmTh
         cxag==
X-Gm-Message-State: AO0yUKWBAKZ4kcFfLiFYuEbVrkSPdWRnmQ9kU/Th2eEH+DK0L3qTbLWD
	LReDOMPkee9HDaIFTqhxTcx/jnxtqtgZnomIE8E+7g==
X-Google-Smtp-Source: AK7set+MwFQXgKVqTLbdOfE3WTC6SqYAp6Rxgj82MRbQDTDH/3m6ISbS4ACZu2dBD1p1qYLzl2lVlP0QCPWzHhdfVlA=
X-Received: by 2002:a05:6102:5d9:b0:415:74b4:6067 with SMTP id
 v25-20020a05610205d900b0041574b46067mr633121vsf.6.1677180351265; Thu, 23 Feb
 2023 11:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com> <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
 <Y/evPJg9gvXxO1hs@google.com> <CAOUHufYx8JUT0T11jxuqknHzUHOYm7kLm_JfgP3LmRrFe=E20Q@mail.gmail.com>
 <Y/e006bZOYXIFE/j@google.com> <CAOUHufbhKsWzXZP_VgOTVkKgZhU=LaXJBRKcaAk++d6sLk1ktA@mail.gmail.com>
 <Y/e8wgqFSr8voAto@google.com>
In-Reply-To: <Y/e8wgqFSr8voAto@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 12:25:12 -0700
Message-ID: <CAOUHufbVBVrO=ixNT-5nzQ=kOFDh6CYhdg0VT4c8gDd7rdE6Hg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 2/5] kvm/x86: add kvm_arch_test_clear_young()
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

On Thu, Feb 23, 2023 at 12:21=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 23, 2023, Yu Zhao wrote:
> > On Thu, Feb 23, 2023 at 11:47=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > On Thu, Feb 23, 2023 at 11:24=E2=80=AFAM Sean Christopherson <seanj=
c@google.com> wrote:
> > > > >
> > > > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > > > On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <s=
eanjc@google.com> wrote:
> > > > > > > > I'll take a look at that series. clear_bit() probably won't=
 cause any
> > > > > > > > practical damage but is technically wrong because, for exam=
ple, it can
> > > > > > > > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will =
just fail
> > > > > > > > in this case, obviously.)
> > > > > > >
> > > > > > > Eh, not really.  By that argument, clearing an A-bit in a hug=
e PTE is also technically
> > > > > > > wrong because the target gfn may or may not have been accesse=
d.
> > > > > >
> > > > > > Sorry, I don't understand. You mean clear_bit() on a huge PTE i=
s
> > > > > > technically wrong? Yes, that's what I mean. (cmpxchg() on a hug=
e PTE
> > > > > > is not.)
> > > > > >
> > > > > > > The only way for
> > > > > > > KVM to clear a A-bit in a non-leaf entry is if the entry _was=
_ a huge PTE, but was
> > > > > > > replaced between the "is leaf" and the clear_bit().
> > > > > >
> > > > > > I think there is a misunderstanding here. Let me be more specif=
ic:
> > > > > > 1. Clearing the A-bit in a non-leaf entry is technically wrong =
because
> > > > > > that's not our intention.
> > > > > > 2. When we try to clear_bit() on a leaf PMD, it can at the same=
 time
> > > > > > become a non-leaf PMD, which causes 1) above, and therefore is
> > > > > > technically wrong.
> > > > > > 3. I don't think 2) could do any real harm, so no practically n=
o problem.
> > > > > > 4. cmpxchg() can avoid 2).
> > > > > >
> > > > > > Does this make sense?
> > > > >
> > > > > I understand what you're saying, but clearing an A-bit on a non-l=
eaf PMD that
> > > > > _just_ got converted from a leaf PMD is "wrong" if and only if th=
e intented
> > > > > behavior is nonsensical.
> > > >
> > > > Sorry, let me rephrase:
> > > > 1. Clearing the A-bit in a non-leaf entry is technically wrong beca=
use
> > > > we didn't make sure there is the A-bit there --  the bit we are
> > > > clearing can be something else. (Yes, we know it's not, but we didn=
't
> > > > define this behavior, e.g., a macro to designate that bit for non-l=
eaf
> > > > entries.
> > >
> > > Heh, by that definition, anything and everything is "technically wron=
g".
> >
> > I really don't see how what I said, in our context,
> >
> >   "Clearing the A-bit in a non-leaf entry is technically wrong because
> > we didn't make sure there is the A-bit there"
> >
> > can infer
> >
> >   "anything and everything is "technically wrong"."
> >
> > And how what I said can be an analogy to
> >
> >   "An Intel CPU might support SVM, even though we know no such CPUs
> > exist, so requiring AMD or Hygon to enable SVM is technically wrong."
> >
> > BTW, here is a bug caused by clearing the A-bit in non-leaf entries in
> > a different scenario:
> > https://lore.kernel.org/linux-mm/20221123064510.16225-1-jgross@suse.com=
/
> >
> > Let's just agree to disagree.
>
> No, because I don't want anyone to leave with the impression that relying=
 on the
> Accessed bit to uniformly exist (or not) at all levels in the TDP MMU is =
somehow
> technically wrong.  The link you posted is about running as a Xen guest, =
and is
> in arch-agnostic code.  That is wildly different than what we are talking=
 about
> here, where the targets are strictly limited to x86-64 TDP, and the exist=
ence of
> the Accessed bit is architecturally defined.

Yes, I see now.

Sorry to say this, but this is all I needed to hear: "the existence of
the Accessed bit is architecturally defined". (I didn't know and see
this is what you meant.)

> In this code, there are exactly two flavors of paging that can be in use,=
 and
> using clear_bit() to clear shadow_accessed_mask is safe for both, full st=
op.
