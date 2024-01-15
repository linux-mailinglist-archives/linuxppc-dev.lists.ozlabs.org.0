Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5482DDE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 17:49:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LjKr+b29;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDJ500z0hz2xdZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 03:49:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LjKr+b29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDJ486pvfz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 03:48:23 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a277339dcf4so1000825966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 08:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705337297; x=1705942097; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceLGL0enl6PfAsopv7AJI+nA+EII0JrlzYSMhyq0em8=;
        b=LjKr+b29uZhit3BfsBxQP4dtfkyhpeHaZY4iEp+EIHp4NH9eTKrSfS35ogXEPho1+P
         /RR4Qz7c+jiLsc+fMEi+fCmdca6qkqVuaguOflMk9y8mkEhcy2a9s2f15QOy13ksL6U6
         uDCdTmskVtFHRUvQg0xqf5jQXk5nyru/ZPao3Gk/D1mmDti8vf0iRNfvFyDemwFSYEAl
         cD3KNda+GuOJ3bIBNUHka7mOFlHdLJwdEdsE/Aqx31bhMdaAv/0Np3tizP4XKCsDNvmF
         Af9z5o/8ibKdbpng+eGD6edoMQ0zPk+sOci78y8b10NsSe0eERK7ApXc+2q4nqqt64w3
         NCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337297; x=1705942097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceLGL0enl6PfAsopv7AJI+nA+EII0JrlzYSMhyq0em8=;
        b=Eb6wSjYLynSvLz6zpDg2klsG9sRmYpyXhBN817GbX+juEQufza7DzghPfJHqyzPhWb
         jK9UqFSmuErlj5t8OlQcBg118fnG35nRRDHJuv1jq6joC9ghZI3o50Dt7DCAHuqU4hba
         7uAZOl8kyYysdUdebtzoqW+mXJfDqfseB9QsxUK4W1t1urxOIRlpA7oAe3UNC0LsLLA3
         yQ6RLiV8eZwCJ/c6Ow1DKH/a1Mt7NQqyClacyDFDWuwKisWPAJqzFmCwhAUdc6iBdDnX
         o9F9J5+u1PrXN9esvDV1EL1DL9Q5X44L0ujWI91fujH7eq3kQDQbOLdqEL3NTpl3y/Lk
         LGMQ==
X-Gm-Message-State: AOJu0Ywy0UsDAnbnOgavHfLzImbicj0ujlBjpFXpZmKJx6QOajE28qKR
	D4WyePnp7pflp1ZhQ5uVXqi8DZgO+IB8IHH7NFitqvRAzNLx
X-Google-Smtp-Source: AGHT+IHNV4MCloqcrGH6S7WU4i7/ZBSuL75kLy09XQg3jP02TmtwtjBL5T0bywpvmu4Eca6GWIIogf7mqkbyC37kOnA=
X-Received: by 2002:a17:907:a08f:b0:a2c:b0a6:8ab with SMTP id
 hu15-20020a170907a08f00b00a2cb0a608abmr3275465ejc.7.1705337297039; Mon, 15
 Jan 2024 08:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 15 Jan 2024 08:47:39 -0800
Message-ID: <CAJD7tka3Ap5G7AKa=AWfTNG8rUi=Z5Fd-JD503NuRk2ycCexiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Vitaly Wool <vitaly.wool@konsulko.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 4:27=E2=80=AFAM Vitaly Wool <vitaly.wool@konsulko.c=
om> wrote:
>
> On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
> >
> > In hopes of having a single compressed pages allocator at some point,
> > and following in the footsteps of SLAB, deprecate z3fold. Rename the
> > user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prom=
pt
> > with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> > defconfigs.
>
> I believe that having a single compressed pages allocator is a false goal=
.

It's not a goal in itself for sure, but when most users use one
allocator that is mostly superior, it makes sense to try to deprecate
others.

>
> > Existing users, if any, should voice their objections. Otherwise, we ca=
n
> > remove z3fold in a few releases.
>
> At this point I NACK this patch. We're about to submit an allocator
> which is clearly better that z3fold and is faster that zsmalloc in
> most cases and that submission will mark z3fold as deprecated. But for
> now this move is premature.

I think unless there are current users of z3fold that cannot use
zsmalloc, the introduction of a new allocator should be irrelevant to
deprecating z3fold. Do you know of such users? Can you explain why
zsmalloc is not usable for them?
