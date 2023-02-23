Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C626A0F8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 19:36:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN1tp4D3wz3cjH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 05:36:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jCj+dZoF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jCj+dZoF;
	dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN1st16nWz3083
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 05:35:12 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id d20so9482533vsf.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 10:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3aoaYb7nna45J2CiXmr0/OoCloNPGdL3kFyB1h4mtg=;
        b=jCj+dZoFxxzUaMPmvj5JpARz5KC7OAzmfEjBubRdgSgpZo0gPgbIIaMDk8TdKd6ac2
         1u/B51AGOkz6IDZyF96vCHj9MWL4W8T8cCEfO1KDEv652fn8V5t294GBY+/Y9lJyetLN
         GAnxFpn2GsWeExejnqMX0i/qSBTWbgzLOY47ucp3r/0Q7IWIyGfs+oyPY6FmIEHthFxp
         x1V6a3CHzQXzc/AiUlVpspoHDTQ52AKGsA7RaEhRwMTWU5QbHFFJAg1qM6/m/E8iGAA4
         zRRqE9AWRBrMW/CVP69peHcgoVq+PjLM4Q2whQa/QhbAIhXI5S9sJDYuZ0HNey8baXK5
         PyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3aoaYb7nna45J2CiXmr0/OoCloNPGdL3kFyB1h4mtg=;
        b=LNb4JSqpe9lW8r/g+ZXHXzJ/PqR4IVo5RTyes5p+pCw50QmaALDORx6BEVw9T1MHgX
         Dc3N98+q3x5elkoVOMO4wI0HWoUnSu7S3R49B4b/8zqrMLTPJeLbHUDP+2eKnO+nlzZ1
         MoqtY5Ma1zvCeoe+uB03S1e0k9xPl8AjkQX0cHN/FnUwgsFL4/AosZGTFySNeJAXLtUD
         +CmiUbcZQMWle8gJkmGlt2ECExnjRVJBt42+iKOl8Rjt0XEGLhq3OQBOTCXdVDiv75OS
         KyAsBdLlSazt8eEHvhLRNgOY6VfBB+EzY31jUIoVsGFVbldq0l5vF/ifGRRBvjDP3yiZ
         mQRw==
X-Gm-Message-State: AO0yUKVjXwDWGe4PhlWDUC7Mw+npKuulMaKYu1qBSr+IAqE+9ayXVLBI
	JZeeTPsfj+bjtGShYeqyPBXJ96m9D8PZzFQdy36Ztw==
X-Google-Smtp-Source: AK7set8MziVNDnEwhirxCtSzQkzlR2xXTlIFkFvt+M2EKaxLcFqsJW8+RDdsr+GQsS2XXD8mHYrFd1HoPptf+lvr4nU=
X-Received: by 2002:a67:fdc8:0:b0:402:9ba2:bc62 with SMTP id
 l8-20020a67fdc8000000b004029ba2bc62mr510076vsq.6.1677177309518; Thu, 23 Feb
 2023 10:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com> <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
 <Y/evPJg9gvXxO1hs@google.com>
In-Reply-To: <Y/evPJg9gvXxO1hs@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 11:34:31 -0700
Message-ID: <CAOUHufYx8JUT0T11jxuqknHzUHOYm7kLm_JfgP3LmRrFe=E20Q@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 11:24=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 23, 2023, Yu Zhao wrote:
> > On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > I'll take a look at that series. clear_bit() probably won't cause a=
ny
> > > > practical damage but is technically wrong because, for example, it =
can
> > > > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will just fai=
l
> > > > in this case, obviously.)
> > >
> > > Eh, not really.  By that argument, clearing an A-bit in a huge PTE is=
 also technically
> > > wrong because the target gfn may or may not have been accessed.
> >
> > Sorry, I don't understand. You mean clear_bit() on a huge PTE is
> > technically wrong? Yes, that's what I mean. (cmpxchg() on a huge PTE
> > is not.)
> >
> > > The only way for
> > > KVM to clear a A-bit in a non-leaf entry is if the entry _was_ a huge=
 PTE, but was
> > > replaced between the "is leaf" and the clear_bit().
> >
> > I think there is a misunderstanding here. Let me be more specific:
> > 1. Clearing the A-bit in a non-leaf entry is technically wrong because
> > that's not our intention.
> > 2. When we try to clear_bit() on a leaf PMD, it can at the same time
> > become a non-leaf PMD, which causes 1) above, and therefore is
> > technically wrong.
> > 3. I don't think 2) could do any real harm, so no practically no proble=
m.
> > 4. cmpxchg() can avoid 2).
> >
> > Does this make sense?
>
> I understand what you're saying, but clearing an A-bit on a non-leaf PMD =
that
> _just_ got converted from a leaf PMD is "wrong" if and only if the intent=
ed
> behavior is nonsensical.

Sorry, let me rephrase:
1. Clearing the A-bit in a non-leaf entry is technically wrong because
we didn't make sure there is the A-bit there --  the bit we are
clearing can be something else. (Yes, we know it's not, but we didn't
define this behavior, e.g., a macro to designate that bit for non-leaf
entries. Also I didn't check the spec -- does EPT actually support the
A-bit in non-leaf entries? My guess is that NPT does.)
