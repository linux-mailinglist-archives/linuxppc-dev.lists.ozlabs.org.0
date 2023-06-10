Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A256672A7E3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 03:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdLb032YKz3f8n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:53:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=o5IEWExG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=o5IEWExG;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdLZ86Rbyz3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 11:53:02 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2566ed9328eso1173945a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 18:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686361981; x=1688953981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5H8c5fhNOiP2kPeNPmLWxBJaGebVzwRYAH/KEzsb/o=;
        b=o5IEWExG1NARMaNk6he7idt3DYkmEZ8IETKouydJDY8E7MmeCE4saF+xhrTmtOxQS4
         hAHfQjbQtmaBrhHZ8cK9pMVranzL/IIPEUUIrQndDDVimK3FhSb9ntBEcoPwwahSAh3m
         hACnZD+emSlWfcH4An7rojRacRraYcHJkQUJMp1e1GLNFu9ZWoE6CMlKyJlivAw3nBCc
         TqHVjw4vMBtro52n1QyhjrkckDUaROeEp4Qrh1jq2p2qYenbvREA7yoRr5TF8zsOumlC
         sBKPnMdbX4PJeW0R5ZLlpCJblJMpkhOHf4Wh60F3mDWMIemBsQu8F4Dp4PtPe7YSufb9
         e3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686361981; x=1688953981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5H8c5fhNOiP2kPeNPmLWxBJaGebVzwRYAH/KEzsb/o=;
        b=SVCt38OkyS7DakVDEm1hse/sNL1GVeRwUExFcD4HJ29gY9K6d22IGJsFjXRVCcSYdv
         JXUdDlQ770Z2E+N0dzHOP5ed6neHB8WHjNLqxha30HyTQDBueng0qNforWHiHTx4mgZq
         O7Fw65ZYKr6+3tMA8oLimort4scUhGdunnawxH9MCGg8gIWIgeXBPsHjS6ZzFxG/eNJN
         WWq2NSjjkbbBO0BGIiPO6S+K8Juw1TEtfNudKSgLyVAY+gQ5mWsrMmNKP8n2rUxGhXpW
         /wol+vuSrYNHRV4zAg7RhrVEHFdqaPNNCnQG0bkoO09ya70P4Zk7IgAmuBsE41BURLCz
         pmdw==
X-Gm-Message-State: AC+VfDw+IvQ53iGHLln0hogqpSHx+ZFHq/aCLBPgCx1gSpxgDOLRFp0P
	fat/Iy2qI8gAc9uM8B9U46422IY8UGxwxxxe+LA=
X-Google-Smtp-Source: ACHHUZ4PfyrbrrByZ6aHkSTloCbBQDhXuHuMhFFM7m5jFoKSg1VwDMV6miDRrHtzgh4dJ1ddJOWEE8Uh/c7gcgtb1Uo=
X-Received: by 2002:a17:90a:cf12:b0:25b:b0d1:b602 with SMTP id
 h18-20020a17090acf1200b0025bb0d1b602mr143927pju.10.1686361980872; Fri, 09 Jun
 2023 18:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-2-jpn@linux.vnet.ibm.com> <CT696R4C69N1.1OZKTR1A9D3X1@wheely>
In-Reply-To: <CT696R4C69N1.1OZKTR1A9D3X1@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 10 Jun 2023 11:52:49 +1000
Message-ID: <CACzsE9r3s9taz4uvjzqnnc6RG3t4AgeRVZdwpyyNRkvRUFANwg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] KVM: PPC: Use getters and setters for vcpu
 register state
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, sbhat@linux.ibm.com, kvm-ppc@vger.kernel.org, Jordan Niethe <jpn@linux.vnet.ibm.com>, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 7, 2023 at 5:53=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
[snip]
>
> The general idea is fine, some of the names could use a bit of
> improvement. What's a BOOK3S_WRAPPER for example, is it not a
> VCPU_WRAPPER, or alternatively why isn't a VCORE_WRAPPER Book3S
> as well?

Yeah the names are not great.
I didn't call it VCPU_WRAPPER because I wanted to keep separate
BOOK3S_WRAPPER for book3s registers
HV_WRAPPER for hv specific registers
I will change it to something like you suggested.

[snip]
>
> Stray hunk I think.

Yep.

>
> > @@ -957,10 +957,32 @@ static inline void kvmppc_set_##reg(struct kvm_vc=
pu *vcpu, u##size val) \
> >              vcpu->arch.shared->reg =3D cpu_to_le##size(val);          =
 \
> >  }                                                                    \
> >
> > +#define SHARED_CACHE_WRAPPER_GET(reg, size)                          \
> > +static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)         =
       \
> > +{                                                                    \
> > +     if (kvmppc_shared_big_endian(vcpu))                             \
> > +            return be##size##_to_cpu(vcpu->arch.shared->reg);        \
> > +     else                                                            \
> > +            return le##size##_to_cpu(vcpu->arch.shared->reg);        \
> > +}                                                                    \
> > +
> > +#define SHARED_CACHE_WRAPPER_SET(reg, size)                          \
> > +static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val=
)      \
> > +{                                                                    \
> > +     if (kvmppc_shared_big_endian(vcpu))                             \
> > +            vcpu->arch.shared->reg =3D cpu_to_be##size(val);          =
 \
> > +     else                                                            \
> > +            vcpu->arch.shared->reg =3D cpu_to_le##size(val);          =
 \
> > +}                                                                    \
> > +
> >  #define SHARED_WRAPPER(reg, size)                                    \
> >       SHARED_WRAPPER_GET(reg, size)                                   \
> >       SHARED_WRAPPER_SET(reg, size)                                   \
> >
> > +#define SHARED_CACHE_WRAPPER(reg, size)                               =
       \
> > +     SHARED_CACHE_WRAPPER_GET(reg, size)                             \
> > +     SHARED_CACHE_WRAPPER_SET(reg, size)                             \
>
> SHARED_CACHE_WRAPPER that does the same thing as SHARED_WRAPPER.

That changes once the guest state buffer IDs are included in a later
patch.

>
> I know some of the names are a but crufty but it's probably a good time
> to rethink them a bit.
>
> KVMPPC_VCPU_SHARED_REG_ACCESSOR or something like that. A few
> more keystrokes could help imensely.

Yes, I will do something like that, for the BOOK3S_WRAPPER and
HV_WRAPPER
too.

>
> > diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/b=
ook3s_hv_p9_entry.c
> > index 34f1db212824..34bc0a8a1288 100644
> > --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> > +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> > @@ -305,7 +305,7 @@ static void switch_mmu_to_guest_radix(struct kvm *k=
vm, struct kvm_vcpu *vcpu, u6
> >       u32 pid;
> >
> >       lpid =3D nested ? nested->shadow_lpid : kvm->arch.lpid;
> > -     pid =3D vcpu->arch.pid;
> > +     pid =3D kvmppc_get_pid(vcpu);
> >
> >       /*
> >        * Prior memory accesses to host PID Q3 must be completed before =
we
>
> Could add some accessors for get_lpid / get_guest_id which check for the
> correct KVM mode maybe.

True.

Thanks,
Jordan

>
> Thanks,
> Nick
>
