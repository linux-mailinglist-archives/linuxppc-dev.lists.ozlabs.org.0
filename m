Return-Path: <linuxppc-dev+bounces-5705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E5A2270A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjzWT6n84z30Ts;
	Thu, 30 Jan 2025 10:53:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738194821;
	cv=none; b=hzgyPTFr4eI5nvqTfvQASdTX8xsTLWnzTFMFN77z7qyetlu8mfljqVwgq/2AEZrcV9idjVnuLxQ3M7KF+rYYQNaRc/fe5/ix3CTnE4YTW/QaWl/SuG5X1g7l25qa2/vexLGPdW7Qr6gx8BZJ7d1XTgoOn0WLfERgn1D1HCEVEpfOYoLvCEjJR5uOTKNwAsYvCA5kShAtm+yj17bL9Bnf7VWsO8Yv3qmIUPLysWlibeXpF3F3eGRbamWZUEY2UH/0+IbVaK8OhDlCTvNq5qQ0NfZZqHXzZFwkR8vY4Qc3pj4XL1Qv85LVn7kKxteGjqmrPtTQ5Plat7nviemSb43dpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738194821; c=relaxed/relaxed;
	bh=nonW2tp2GWRJDQs4Gs0gZRACicvE5XqYe/7Yh9hyNCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7qLIAyKANPqI+BJsgcqdY/kL8K4dvpjkw8lAO/rpyha7LOIx1WQf9pc9TPVWNL+g6M1cHcqXe8nIofnTvqr/BYrtVNeFiJ/PXMOieGjdcDB+RxjzAZPJfsCfuxmsR4sjxmlXMaqwvro11cn1ogQ3MqNRsE87I4pL6Snz5SOlzejzy7v2xUaUlvaB0KM+pkymJ13cef9xH1kUO1H+5d5GhxPnGBjCm5RWCn0RdiTA1hXfx2SFMv5iUymy2CHL6WonGpC+uxgXkQIKljGh8q0XwWDoLicvp2vS0E6PloCVnIdmEqlKDCJwkKwz2UYtHX3zuAhAj5QV5bQbAjw1yPe4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eCjlRBbR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eCjlRBbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjzWS6QJsz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:53:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C456C5C627C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 23:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC12C4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738194817;
	bh=W3PelArJwq1fwjy5hDtUm5rIO2zw2EZOKtjB8JR0kpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCjlRBbRNFq96gsvYzWoVlB8syzuqg8pt0aUWrsOaA54b4Xtzi2gCgfsfrAt3l4F9
	 ma3ImZkPvGZ/O3n+PIpYzBIS5gVM8i3f1x0NFBBRuLhqzJdcqEriCHZ7i77Div2r58
	 3d8n7NdQX6WsLUn/EfC/3A6984zAet0iIYMrivXz2eXkgmvDvPJ1W415z/E3TywZWO
	 alSBgkBk3QryKS7LOULHbSFfzLQfxHvK0qQigAD22ez+wPW+aO6Zq3KW4/n74GENLj
	 wVVkRxdyicsj/1cARcleZHiNQ3pCXE+dCdrnY+4/g0Eh2qBRaz5QnjCQhnooeyhqhK
	 /l969YuCuOJuA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso298314a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 15:53:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb0OalOYSzNHeji6zltHumjpD7SZLxno6E4Tw3nZvPuSdocoESkTcIAc5wvGJBrVqTKL/eBlwl7AkAb44=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdWPpuyTGd/YDPqg6azbrKEiIErxld1tqCA8LKgaRyXHrOsX4v
	ij4BMYvIMOSB/dRWlJWTWjehPS4RNPArfrwzS85nrxumJQabqfJkpRPLciszvRHGHuoPo3f+Oum
	Dyo2XkWsVM54j3lYEG4NAnamhxw4=
X-Google-Smtp-Source: AGHT+IF8sUXurQ+pZxlLY0wRuMVnLPTDljcE9nfm8HYJGANobLvH4QKtgwzK3u/2X4lCO2DT08QK+CXpDDLa0i8iTvE=
X-Received: by 2002:a05:6402:34c2:b0:5d9:f0d8:22d5 with SMTP id
 4fb4d7f45d1cf-5dc6f606260mr1046098a12.13.1738194816283; Wed, 29 Jan 2025
 15:53:36 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com> <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
In-Reply-To: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Jan 2025 08:52:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrCVWSHobzF+FXKuD=fERBG7gmA7MfkRnnuDg55sTY2w@mail.gmail.com>
X-Gm-Features: AWEUYZmSQjKW1lanlKGWxaJ9x16sU2tAtAIHzhvuOM0bwunSKJghx-Ry-EiJGx0
Message-ID: <CAK7LNARrCVWSHobzF+FXKuD=fERBG7gmA7MfkRnnuDg55sTY2w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
To: Kienan Stewart <kstewart@efficios.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Nicolas Schier <nicolas@fjasle.org>, 
	Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 12:53=E2=80=AFAM Kienan Stewart <kstewart@efficios.=
com> wrote:
>
> Hi,
>
> I missed a few CCs, looping them in now. Apologies for the extra noise.
>
> thanks,
> kienan
>
> On 1/27/25 1:47 PM, Kienan Stewart wrote:
> > In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> > ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> > artifacts required for building out-of-tree kernel modules had
> > $(objtree) prepended to them to prepare for building in other
> > directories.
> >
> > When building external modules for powerpc,
> > arch/powerpc/lib/crtsavres.o is required for certain
> > configurations. This artifact is missing the prepended $(objtree).
> >
> > External modules may work around this omission for v6.13 by setting MO=
=3D$KDIR.
> >
> > Signed-off-by: Kienan Stewart <kstewart@efficios.com>

Good catch, this actually got broken by 13b25489b6f8.



Fixes: 13b25489b6f8 ("kbuild: change working directory to external
module directory with M=3D")
Acked-by: Masahiro Yamada <masahiroy@kernel.org>





> > ---
> >   arch/powerpc/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d=
36155cc61ab4460c7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> >   # There is a corresponding test in arch/powerpc/lib/Makefile
> >   KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
> >   else
> > -KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > +KBUILD_LDFLAGS_MODULE +=3D $(objtree)/arch/powerpc/lib/crtsavres.o
> >   endif
> >
> >   ifdef CONFIG_CPU_LITTLE_ENDIAN
> >
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83
> >
> > Best regards,
>
>


--=20
Best Regards
Masahiro Yamada

