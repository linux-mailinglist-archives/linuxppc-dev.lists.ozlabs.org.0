Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980F6A0EB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN0PT1f0Fz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:29:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Sdd7hPKB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Sdd7hPKB;
	dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0NW33jwz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:28:10 +1100 (AEDT)
Received: by mail-vs1-xe32.google.com with SMTP id j14so16742026vse.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31utYDCC/yFLRWwC2RwKHXn6KsflDX7hvn7iHrUw04E=;
        b=Sdd7hPKBaEt1PTDPKGEhKh0cFLRe2Yx/VuUuv6kAhuhnM7to0TDCYi0R2J/otk8Pqf
         WFH1iwbnoqpP/v6V7RkdAn0TCtMw+bMz5fesA/ftTwiR+QHmhj3jPqvv34rbMtH5k4mx
         LVXXTy4uUcoL8wRogYukxUCPXiCr52gBF9hpwOqQXVG//efJB+iA/i1h5bRi46cz85UA
         QDpWpWIYko0qEJvG3g8TiGlELNr7ETuVi9loLgEJ1ij4s7YECfz3SGeC0/wkvXK7pfdA
         6sIAcR+uGf57sDBqQ/Wl/1ZePGl/tOoVcoXWej/gPVtiCBhyJJkY59Si4B+jFdVsUklV
         jhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31utYDCC/yFLRWwC2RwKHXn6KsflDX7hvn7iHrUw04E=;
        b=SLkjkdhWgOaivzTnPa/47dnDfxLQ49xsfdDdxj/sv1tkkWN06uxuCKuvcGbEKUJuKl
         kuq26f4648T07Y5NV8Mi38dGItU/e1NUuIABE+fiwDrY516ifClD8Yijl59DYaqlccFA
         2cAP7HNIIxV+sl5kU634uY5WG6xVXU2PoPDa11nJIks/pO+QP4GB1MiqY9bqf/13n/4g
         0nlWb0aZuVHA8SAMwHRUTn/hJ/Vm2Lnc7f6pcX0RXfVNO83VCSBtC2aXQqWyQi0U6OcN
         vzBJBDa+pjeoprnrvye7GQF7QdxA4RVsEgMamIg3LqV62mbKy4oEJj1fElRkURf5uhD1
         qfgg==
X-Gm-Message-State: AO0yUKXTRjX7/b36DwVug7dAJ7zvsscwFL3M6XyPXv74Y+zxTxaf2dJu
	CqkCOcZ4P758uXETaOhiLLNDpIFsIXji88I7mqvLuw==
X-Google-Smtp-Source: AK7set9ipf4JKgksfIPCGz7YusAkR8fyQ5wmRY52KwjPqGlUX+CfhrQnWSITtgynuYdihY0faOT9Lz6HbOuMIKjb8/I=
X-Received: by 2002:ab0:38d3:0:b0:67a:2833:5ceb with SMTP id
 l19-20020ab038d3000000b0067a28335cebmr3475904uaw.0.1677173287566; Thu, 23 Feb
 2023 09:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com>
In-Reply-To: <Y/ed0XYAPx+7pukA@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 10:27:31 -0700
Message-ID: <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Wed, Feb 22, 2023, Yu Zhao wrote:
> > On Fri, Feb 17, 2023 at 9:27 AM Sean Christopherson <seanjc@google.com>=
 wrote:
> > >
> > > On Thu, Feb 16, 2023, Yu Zhao wrote:
> > > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm=
/kvm_host.h
> > > > index 6aaae18f1854..d2995c9e8f07 100644
> > > > --- a/arch/x86/include/asm/kvm_host.h
> > > > +++ b/arch/x86/include/asm/kvm_host.h
> > > > @@ -1367,6 +1367,12 @@ struct kvm_arch {
> > > >        *      the MMU lock in read mode + the tdp_mmu_pages_lock or
> > > >        *      the MMU lock in write mode
> > > >        *
> > > > +      * kvm_arch_test_clear_young() is a special case. It relies o=
n two
> > >
> > > No, it's not.  The TDP MMU already employs on RCU and CMPXCHG.
> >
> > It is -- you read it out of context :)
>
> Ah, the special case is that it's fully lockless.  That's still not all t=
hat
> special, e.g. see kvm_tdp_mmu_walk_lockless_{begin,end}().
>
> >          * For reads, this list is protected by:
> >          *      the MMU lock in read mode + RCU or
> >          *      the MMU lock in write mode
> >          *
> >          * For writes, this list is protected by:
> >          *      the MMU lock in read mode + the tdp_mmu_pages_lock or
> >          *      the MMU lock in write mode
> >          *
> >          * kvm_arch_test_clear_young() is a special case.
> >          ...
> >
> >         struct list_head tdp_mmu_roots;
> >
> > > Just drop the
> > > entire comment.
> >
> > Let me move it into kvm_arch_test_clear_young().
>
> No, I do not want kvm_arch_test_clear_young(), or any other one-off funct=
ion, to
> be "special".  I love the idea of a lockless walk, but I want it to be a =
formal,
> documented way to walk TDP MMU roots.  I.e. add macro to go with for_each=
_tdp_mmu_root()
> and the yield-safe variants.

I see what you mean now. will do.

> /* blah blah blah */
> #define for_each_tdp_mmu_root_lockless(_kvm, _root, _as_id)             \
>         list_for_each_entry_rcu(_root, &kvm->arch.tdp_mmu_roots, link)  \
>                 if (refcount_read(&root->tdp_mmu_root_count) &&         \
>                     kvm_mmu_page_as_id(_root) !=3D _as_id) {             =
 \
>                 } else
>
> > Also I want to be clear:
> > 1. We can't just focus on here and now; we need to consider the distant=
 future.
>
> I 100% agree, but those words need to be backed up by actions.  This seri=
es is
> littered with code that is not maintainable long term, e.g. open coding s=
tuff
> that belongs in helpers and/or for which KVM already provides helpers, co=
py-pasting
> __kvm_handle_hva_range() instead of extending it to have a lockless optio=
n, poking
> directly into KVM from mm/ code, etc.
>
> I apologize for being so blunt.  My intent isn't to be rude/snarky, it's =
to set
> very clear expectations for getting any of these changes merges.

No worries at all. I appreciate you directly telling me how you prefer
it to be done, and that makes the job easier for both of us. Please do
bear with me though, because I'm very unfamiliar with the KVM side of
expectations.

> I asbolutely do
> want to land improvments to KVM's test+clear young flows, but it needs to=
 be done
> in a way that is maintainable and doesn't saddle KVM with more tech debt.

Agreed.

> > 2. From my POV, "see the comments on ..." is like the index of a book.
>
> And my _very_ strong preference is to provide the "index" via code, not c=
omments.

Will do.

> > > Clearing a single bit doesn't need a CMPXCHG.  Please weigh in on a r=
elevant series
> > > that is modifying the aging flows[*], I want to have exactly one help=
er for aging
> > > TDP MMU SPTEs.
> > >
> > > [*] https://lore.kernel.org/all/20230211014626.3659152-5-vipinsh@goog=
le.com
> >
> > I'll take a look at that series. clear_bit() probably won't cause any
> > practical damage but is technically wrong because, for example, it can
> > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will just fail
> > in this case, obviously.)
>
> Eh, not really.  By that argument, clearing an A-bit in a huge PTE is als=
o technically
> wrong because the target gfn may or may not have been accessed.

Sorry, I don't understand. You mean clear_bit() on a huge PTE is
technically wrong? Yes, that's what I mean. (cmpxchg() on a huge PTE
is not.)

> The only way for
> KVM to clear a A-bit in a non-leaf entry is if the entry _was_ a huge PTE=
, but was
> replaced between the "is leaf" and the clear_bit().

I think there is a misunderstanding here. Let me be more specific:
1. Clearing the A-bit in a non-leaf entry is technically wrong because
that's not our intention.
2. When we try to clear_bit() on a leaf PMD, it can at the same time
become a non-leaf PMD, which causes 1) above, and therefore is
technically wrong.
3. I don't think 2) could do any real harm, so no practically no problem.
4. cmpxchg() can avoid 2).

Does this make sense?

Thanks.
