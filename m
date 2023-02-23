Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0E6A025C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 06:27:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMhNc3NwDz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:27:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ebfMrTiO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ebfMrTiO;
	dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMhMf6FVFz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 16:26:21 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id d7so7556153vsj.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 21:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXEnUJIuw3DsBBpeEas97UQaCI4+fKGVwu8RQPcIlxs=;
        b=ebfMrTiO8jVZApxkACFGkW19OKcseaGjzh5HjIfu8MAU62l8YkK9wYnBFkU6I+6zuE
         AUDCEHsZSZ9mbCKKWNPTplXuqS87aYdUMgEd5/HJTFPzZF9uHLGfh+f//SGkFgG2WUUC
         VMrPZXwgvdZQ0a9Rdfoin9rPnC9lwtXHaGCdiIAVtUZ+zDzePE60bEA2n80H6qz2mPub
         YZRSOEb//hMVhNQrFI5fjyJOTZ5EPIveLNi+6mlZv8sUqb9Y6C+ziwSJjuW7/BuocHT5
         ypJ99wrjoFqAACPuG1lbl4B3N9wqDvRcpL/jBCfwY1kMxbLPNuarGmvnmO4vjdaXxv4a
         SkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXEnUJIuw3DsBBpeEas97UQaCI4+fKGVwu8RQPcIlxs=;
        b=zA2uDTGs4gQFDCXD73E5un3/DTwrzZ8/0xCMuTVyqD7Zv2i6kqobZziVsUD1Sg2j/H
         Tf0JJp507JRXmMSBUISMMZxwVs1w9cHiu1j0dW+4GS3T3GiqH8P73bB4PaG1vos64YYh
         CbVV6nKJYAGZqz3pmKrGFHRyebAhgcvDazitB/YCYIcIFo9FAHxSnCiDtLqhZBHfO9QJ
         jtpFQwhd05bUQmEjvrU3S3JdSSN4Wu+Zbpc4ETY7WVV5R/wD3f6VwGqxhaRbuymYAWAi
         o2qtMouRJ4nTjfrzg7hfG4jdR3HwG5e2v2ffy7MJpk557Zcb0zrzvgUFlk0Qy7NFVf/t
         1LrA==
X-Gm-Message-State: AO0yUKXCY5MlBY8O8zx49qJtP/H4aESVFQxXfM75chLXvbqy+23tikIB
	BMhd2/bzCQ2lHOCLzB+9mGFgng1QkGlFhsS5c+fFtg==
X-Google-Smtp-Source: AK7set/r/f8pGhkIjYGiLVLtcsnWRFxpAmGZdfZxTguMU1aVP5zVqu1WLV5ZRnN+vLq9szVFT6NHenS4YuDGWsM46AY=
X-Received: by 2002:a05:6102:108f:b0:41e:d8b5:ee40 with SMTP id
 s15-20020a056102108f00b0041ed8b5ee40mr553492vsr.26.1677129977589; Wed, 22 Feb
 2023 21:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
 <Y+9EUeUIS/ZUe2vw@linux.dev> <Y++kiJwUIh55jkvl@google.com>
In-Reply-To: <Y++kiJwUIh55jkvl@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 22 Feb 2023 22:25:41 -0700
Message-ID: <CAOUHufYVWvEG=EMBEffnurQhJSb5WN75NVVXPhWghWFR9Aa94A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 9:00=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Feb 17, 2023, Oliver Upton wrote:
> > Hi Yu,
> >
> > scripts/get_maintainers.pl is your friend for getting the right set of
> > emails for a series :) Don't know about others, but generally I would
> > prefer to be Cc'ed on an entire series (to gather context) than just an
> > individual patch.
>
> +1
>
> >
> > On Thu, Feb 16, 2023 at 09:12:28PM -0700, Yu Zhao wrote:
> > > This patch adds kvm_arch_test_clear_young() for the vast majority of
> > > VMs that are not pKVM and run on hardware that sets the accessed bit
> > > in KVM page tables.
>
> At least for the x86 changes, please read Documentation/process/maintaine=
r-tip.rst
> and rewrite the changelogs.

I see -- will remove "this patch".

> > > It relies on two techniques, RCU and cmpxchg, to safely test and clea=
r
> > > the accessed bit without taking the MMU lock. The former protects KVM
> > > page tables from being freed while the latter clears the accessed bit
> > > atomically against both the hardware and other software page table
> > > walkers.
> > >
> > > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_host.h       |  7 +++
> > >  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
> > >  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
> > >  arch/arm64/kvm/arm.c                    |  1 +
> > >  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
> > >  arch/arm64/kvm/mmu.c                    | 77 +++++++++++++++++++++++=
+-
> > >  6 files changed, 141 insertions(+), 46 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/a=
sm/kvm_host.h
> > > index 35a159d131b5..572bcd321586 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -1031,4 +1031,11 @@ static inline void kvm_hyp_reserve(void) { }
> > >  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
> > >  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
> > >
> > > +/* see the comments on the generic kvm_arch_has_test_clear_young() *=
/
>
> Please eliminate all of these "see the comments on blah", in every case t=
hey do
> nothing more than redirect the reader to something they're likely already=
 aware of.
>
> > > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > > +static inline bool kvm_arch_has_test_clear_young(void)
> > > +{
> > > +   return IS_ENABLED(CONFIG_KVM) && cpu_has_hw_af() && !is_protected=
_kvm_enabled();
> > > +}
>
> ...
>
> > Also, I'm at a loss for why we'd need to test if CONFIG_KVM is enabled.
> > My expectation is that we should provide an implementation that returns
> > false if !CONFIG_KVM, avoiding the need to repeat that bit in every
> > single implementation of the function.
>
> mm/vmscan.c uses kvm_arch_has_test_clear_young().  I have opinions on tha=
t, but
> I'll hold off on expressing them until there's actual justification prese=
nted
> somewhere.
>
> Yu, this series and each patch needs a big pile of "why".  I get that the=
 goal
> is to optimize memory oversubscribe, but there needs to be justification =
for
> why this is KVM only, why nested VMs and !A/D hardware are out of scope, =
why yet
> another mmu_notifier hook is being added, etc.

I totally agree.

This is an optimization, not a bug fix. It can't be justified without
performance numbers from some common use cases. That burden of proof
clearly rests on me -- I will follow up on that.

For now, I want to make sure the methodical part is clear:
1. We only have limited resources and we need to prioritize major use cases=
.
2. We can only improve one thing at a time and we can't cover
everything at the same time.
3. We need to focus on the return on investment and the future.

I hope everyone by now agrees with my "the vast majority of VMs ..."
assertion. If not, I'm happy to revisit that [1]. If so, the next step
would be whether we want to focus on the vast majority first. I think
this naturally answers why the nested VMs and !AD h/w are out of
scope, at the moment (I didn't spell this out; probably I should in
v2). After we have taken the first step, we probably can decide
whether there is enough resource and demand to cover the low return on
investment part (but complexity but less common use cases).

[1] https://lore.kernel.org/linux-mm/20230217041230.2417228-1-yuzhao@google=
.com/
