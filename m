Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778506A100D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:03:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN2VY0YPNz3cjJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 06:03:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qBTuRujl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qBTuRujl;
	dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN2Tc3y4nz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 06:02:43 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id o6so17487150vsq.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BehNjNr/+dUxmpuFq2DtkAvQP7yK7v98nPDghIFQheY=;
        b=qBTuRujlvCa1VgF13+Ud5voDEv0Q9s+atY0zVj2JYk9FiZWoLxhWXRpAJXyIzrim5w
         f+xS7avGfjvvGDxpRiJfIop5uZFSmQbUhiuEHUwLF8lmT75u4h6jwYfZYix0l5oKm0n8
         01JZrrnbVqjuYQeeGAqe+qGSzs3xRAnVpo0FM0OQEyk76yvi0N68VRkv3yDf6aS8eKYM
         Yz5hQW8ZjbU4RJ+5Rgvt8ZQpO6vql2HM/mJBiV/J+VEhgrmp/S+g+H88b6V/rs8lo71z
         djQQH1BHv98oah+DOIANnbXcpil5WQ0qSt5u+yI6+vaPMHi3OyELJdFhefr6sUFfgv9d
         FCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BehNjNr/+dUxmpuFq2DtkAvQP7yK7v98nPDghIFQheY=;
        b=c2CODyOdP8qqi1SFhbrCl9+D5w/rrkrT3TTd+EFwY3OBCdm7XcUqfoG6zyzAGxCnf2
         Iuo2WX51cCWTu8Rr5C/HWwBEXw+fp/y3IcM5+Ty+lyezEIg4MF04A446Z77tX9K+9ye8
         fvhpFhL98uFUJ04UuAama8Qupj7efuArXoN6rdGo3UIOqrukBjL1CT46tIe9KGh3ncAI
         TTjiyeD1HOkFXp+q9FZOWHICQJ47ehVojT/U9+9EY4rKkk64VFQvjc7kUe/PD2wK+7Gt
         1ARUQpOKa+Ck1u65HFQwnt/s6tlZKKCTjKjC2tHcyX9ytZFX8yuDVt44fkMzcUL7eAbY
         TJCw==
X-Gm-Message-State: AO0yUKVpTmjGySL6w/wAJvDKK4A5DAJnUZPg36U3p1HEYgwr6jjeuvey
	aOfZx0oVuuwsg9BGlk2//5BrQNaigtBWoXNYSR3Pnw==
X-Google-Smtp-Source: AK7set/Hhw/cCSkdxYcIh8mHlA+djGYcnBHqhr6GbdkbHFHfRZfMKdXhnPCa3oQXStWL9Hm3w7gevCyr1XzyoL4fUiY=
X-Received: by 2002:a67:c597:0:b0:402:9b84:1be4 with SMTP id
 h23-20020a67c597000000b004029b841be4mr587075vsk.6.1677178960791; Thu, 23 Feb
 2023 11:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com> <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
 <Y/evPJg9gvXxO1hs@google.com> <CAOUHufYx8JUT0T11jxuqknHzUHOYm7kLm_JfgP3LmRrFe=E20Q@mail.gmail.com>
 <Y/e006bZOYXIFE/j@google.com>
In-Reply-To: <Y/e006bZOYXIFE/j@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 12:02:02 -0700
Message-ID: <CAOUHufbhKsWzXZP_VgOTVkKgZhU=LaXJBRKcaAk++d6sLk1ktA@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 11:47=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 23, 2023, Yu Zhao wrote:
> > On Thu, Feb 23, 2023 at 11:24=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <seanj=
c@google.com> wrote:
> > > > > > I'll take a look at that series. clear_bit() probably won't cau=
se any
> > > > > > practical damage but is technically wrong because, for example,=
 it can
> > > > > > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will just=
 fail
> > > > > > in this case, obviously.)
> > > > >
> > > > > Eh, not really.  By that argument, clearing an A-bit in a huge PT=
E is also technically
> > > > > wrong because the target gfn may or may not have been accessed.
> > > >
> > > > Sorry, I don't understand. You mean clear_bit() on a huge PTE is
> > > > technically wrong? Yes, that's what I mean. (cmpxchg() on a huge PT=
E
> > > > is not.)
> > > >
> > > > > The only way for
> > > > > KVM to clear a A-bit in a non-leaf entry is if the entry _was_ a =
huge PTE, but was
> > > > > replaced between the "is leaf" and the clear_bit().
> > > >
> > > > I think there is a misunderstanding here. Let me be more specific:
> > > > 1. Clearing the A-bit in a non-leaf entry is technically wrong beca=
use
> > > > that's not our intention.
> > > > 2. When we try to clear_bit() on a leaf PMD, it can at the same tim=
e
> > > > become a non-leaf PMD, which causes 1) above, and therefore is
> > > > technically wrong.
> > > > 3. I don't think 2) could do any real harm, so no practically no pr=
oblem.
> > > > 4. cmpxchg() can avoid 2).
> > > >
> > > > Does this make sense?
> > >
> > > I understand what you're saying, but clearing an A-bit on a non-leaf =
PMD that
> > > _just_ got converted from a leaf PMD is "wrong" if and only if the in=
tented
> > > behavior is nonsensical.
> >
> > Sorry, let me rephrase:
> > 1. Clearing the A-bit in a non-leaf entry is technically wrong because
> > we didn't make sure there is the A-bit there --  the bit we are
> > clearing can be something else. (Yes, we know it's not, but we didn't
> > define this behavior, e.g., a macro to designate that bit for non-leaf
> > entries.
>
> Heh, by that definition, anything and everything is "technically wrong".

I really don't see how what I said, in our context,

  "Clearing the A-bit in a non-leaf entry is technically wrong because
we didn't make sure there is the A-bit there"

can infer

  "anything and everything is "technically wrong"."

And how what I said can be an analogy to

  "An Intel CPU might support SVM, even though we know no such CPUs
exist, so requiring AMD or Hygon to enable SVM is technically wrong."

BTW, here is a bug caused by clearing the A-bit in non-leaf entries in
a different scenario:
https://lore.kernel.org/linux-mm/20221123064510.16225-1-jgross@suse.com/

Let's just agree to disagree.
