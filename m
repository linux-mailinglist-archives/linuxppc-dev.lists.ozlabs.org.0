Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDAD7494F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 07:19:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZboYtsko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxPvv1Lk6z3bx3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZboYtsko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxPv331bbz3Wtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 15:18:22 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b698937f85so3239961fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688620698; x=1691212698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pyew4brPaMX67Blh5xxcFOiu+e7xaU8tvYkzN+gBE8=;
        b=ZboYtskoEVGQ3PAqWlv+EBZjzbuk1OtrqlZtJIldGS6YDLutnht+md5ynH3JRJ8reP
         O9sA9xzXz5EHSG2POC0lUxSiVgvc7g7xpfmgJTsbBuVsmqpgLvDG6AOnubNdoIhOMyYk
         j58tsmmg6qUEhR8g9N0K5S6HWrxFegfdCvcp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688620698; x=1691212698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Pyew4brPaMX67Blh5xxcFOiu+e7xaU8tvYkzN+gBE8=;
        b=KSsKV7Nvt3x8NDYTgrGlOZfIMmHgDP4LUy7JaIIdrDu27sASiiF7hT0HhZbu/Pa+lT
         DddT3i/hzAMHrTzAEGuGypgFgNG9TdrRjXfurZ+//+gyn9raUxBJEBbdZ7ATiDvzDjYP
         8VWzg07jTt0i54rOp5BBslmUB3blt4I0apkul5h7k07Hgqv8Br64cL71SB7uFEOBuwqD
         1VXOlsCcPlk/SUlEViVAgnq0YCO6gdqg6tFw6cGAq14XDprS4L3d0ifBYg/h5xs23lUQ
         AbHG3HU8PViDSw4PZoB1BisPazMz9HjCv+MpDWzpNmVPyxncilzudAOdiJVi4Hgx/i60
         fUAg==
X-Gm-Message-State: ABy/qLbxN21e5hZ6whdWaEUB9h1oLp/h1cWWZtjiE5GBgnPTC4Nh9TDi
	CPbt/jByUmHW2lb/7cxTpiCSFOEbeNWqVeKqAqlciA==
X-Google-Smtp-Source: APBJJlFiaE5Rjy8N1mpXTKWuoY2gflHQlG7Qa0YN0CEaaUlIylK7sjjnfKxe8x2S2ynq0UzPO6qqGQ3z9DYXcAHxgSU=
X-Received: by 2002:a2e:8902:0:b0:2b6:de6d:8148 with SMTP id
 d2-20020a2e8902000000b002b6de6d8148mr499717lji.31.1688620697982; Wed, 05 Jul
 2023 22:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230706021016.GC3894444@ls.amr.corp.intel.com>
In-Reply-To: <20230706021016.GC3894444@ls.amr.corp.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 14:18:06 +0900
Message-ID: <CAD=HUj5ermRAjxVYhERDA7fE0cZ5TAGunP6j7zM5YC6PyiZh-g@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 11:10=E2=80=AFAM Isaku Yamahata <isaku.yamahata@gmai=
l.com> wrote:
>
> On Tue, Jul 04, 2023 at 04:50:50PM +0900,
> David Stevens <stevensd@chromium.org> wrote:
>
> > diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
> > index cf2c6426a6fc..46c681dc45e6 100644
> > --- a/arch/x86/kvm/mmu/spte.c
> > +++ b/arch/x86/kvm/mmu/spte.c
> > @@ -138,7 +138,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mm=
u_page *sp,
> >              const struct kvm_memory_slot *slot,
> >              unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
> >              u64 old_spte, bool prefetch, bool can_unsync,
> > -            bool host_writable, u64 *new_spte)
> > +            bool host_writable, bool is_refcounted, u64 *new_spte)
> >  {
> >       int level =3D sp->role.level;
> >       u64 spte =3D SPTE_MMU_PRESENT_MASK;
> > @@ -188,6 +188,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mm=
u_page *sp,
> >
> >       if (level > PG_LEVEL_4K)
> >               spte |=3D PT_PAGE_SIZE_MASK;
> > +     else if (is_refcounted)
> > +             spte |=3D SPTE_MMU_PAGE_REFCOUNTED;
>
> Is REFCOUNTED for 4K page only?  What guarantees that large page doesn't =
have
> FOLL_GET? or can we set the bit for large page?

Oh, you're right, it should apply to >4K pages as well. This was based
on stale thinking from earlier versions of this series.

-David
