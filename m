Return-Path: <linuxppc-dev+bounces-2742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B309B7401
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 06:06:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfBmY3X9Rz2yPG;
	Thu, 31 Oct 2024 16:06:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730351197;
	cv=none; b=nciCfGoPlo+6nQn9lkGV9HEHtDMZ92llhB4hENPEs98nBbvVZrrQcxva2yshsQTnNpwhMrKRMdNKkoI9Un0GtfEp0GwpBM1ZQKFgNy/yWWpje/p4GCLy9LbwAY0wswTtoc5ksvyZCFoKj/72kLxQfLKJCKxb3nQZOdTbeuCwsLRT5Ze96efetKPXB0Ir8bdXRDdf+qb6LuS+1MjBgEi92J6dMCC5hNbg5z/GgKhCgAHM8NMB3F5SpAboQXPNgE4a4cjA/IjBnXL7qZcsqjXVlblMPc6Z+qQKyHiOMPzuuLNkgLQ8d/bjRNx+vAJBueevVTE88SESn2eSQpdy7HYp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730351197; c=relaxed/relaxed;
	bh=0i2Hp+Jo553Bp7SVYgd1y/RHX4+QcCFvIVpGPREXUzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBlXGbmBYLbRLYdPdnNHgCl4L56/CoEm+dgyRlZm8rIaDynWVXIGBOC8XKVjVeixXJ+1eH/apNS0OLDuaeVL4kSwNroKQkJ0FCBIGD/6RazDejCllN352bPchOA95CQJFg6g2kTgy9iKCaQMuG6vW6UgSjaPbCfUWayrLX8P5sqMvRHIKBUY9FR2khQDKohU6hA+BTgGcjSKze8s0vayvhk2wI3TjFjCvO+DXknMUcj8qNFHZxQWcjlT/PcSRPqxeD9gzVv/kVbVQRZlzFXOLVldLm6KjxrTQz+uXnCzVhVwz/qyEqkuQ+WHwpCJ/P3cW9d1d4u2/tarYN74zoUgow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tiSD/gjE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tiSD/gjE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfBmW4X4gz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 16:06:34 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so322a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 22:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730351185; x=1730955985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i2Hp+Jo553Bp7SVYgd1y/RHX4+QcCFvIVpGPREXUzM=;
        b=tiSD/gjEpQ3zXHsP6WYHGwO/IulDWLXfLsaLxwXRUuzntrmiOzQPVjlOjqcUVAYPuV
         a8ba1JLnpuCEUv8YGGiE7U0G4xshrqkII2ozZy8qQpKBgwNYObndmTFTVHMyg0Jx6P3W
         CAuH4jtbEAf1cIQ0NLbNkRRrqUwySgiiPT76aCqESHXirycQNGxTfPcry8JYQoTdZD6m
         H9y4EAi/F7/loQ8dUWNYJl751CTqCVMCiFds/nJ2GcdnYyFpp1ZsZldgHkDd61FCf8mK
         1mCYb4Vtm90cZJxcFL66VYXGJ+zZaRCtdG3ryXhaWqzoYfATI5UNL0kw+pOUgGU/X5X1
         U97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730351185; x=1730955985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0i2Hp+Jo553Bp7SVYgd1y/RHX4+QcCFvIVpGPREXUzM=;
        b=YhXTFGK1Jn6EOZjl6SX7dud2SeObXSzSonnrAlymCW+zZahYKq04SFj2zxNrOJHvvJ
         4VsYVtdEiMdxmTi+Sj5lml/ULXtBbFiE+VPT07p4vjd49ec0t996Z5eao4s+O2G0ZWgM
         s3UUmL+btXtwnHC8iC7GQKLWTLYA81N0aptzZjF78UqVsdEzecMlibPMfEZTW3Nw46zY
         gKOc9H7nVF3GbaZTpDVWJWlc6XBGKVMZo6opcCIx4P4aV7yRZunjVQcR0oMmLyvN42ZC
         QDgmtmoE+3/poUl3o6+GsPKk7WM6EhPgZKF3WsBvWuNJ3+s7Js2H4wAP9W+njv16wwEk
         kM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYBHaRPeDKkPsMUA0H97PdLnE4uhQesJTaMvp5ybQs0aPUtHc0lFK0XBnW3vNeiPReajvxhDOIFhlWCLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQxI7M66WhXiaLO6DmQFndQKc6f3JT6frzU2A9poVBMfYOqpBo
	7kFnSD/TzQ1PVsTpf40VO1q3KrvtUIlBaGI8BwFxyg5Qo6ruQWDvNXBDa3zp3s9Icwbp9CcZPYI
	FCU+pMcleIpyfmV/sCkpunHcx80FqpyXss7HX
X-Gm-Gg: ASbGncswT7vH2ZnHychBwWwC/6RlC1mmCsplBlrtCRw0dgptBQgEsF8NFXlEy7t2GH6
	l0EH6xZ1lAoe7Z3BDkzJKWsgST/cm8+35xPA1M95PLKy52RMl6yMZlIhDoA2biicf
X-Google-Smtp-Source: AGHT+IEa2MH5wcVvPPE8kavAhbMUGA/AKUSL18Rtzs97BVFow1m5e63bvnyqTFocsSVTt92eT3Zz91fTBE0w+m9p+IY=
X-Received: by 2002:aa7:d6c7:0:b0:5c4:2e9f:4cfc with SMTP id
 4fb4d7f45d1cf-5ceaa4c1727mr5520a12.6.1730351185225; Wed, 30 Oct 2024 22:06:25
 -0700 (PDT)
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
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au> <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
In-Reply-To: <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Oct 2024 22:06:12 -0700
Message-ID: <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 9:37=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > Matthew Maurer <mmaurer@google.com> writes:
> > > Adds a new format for MODVERSIONS which stores each field in a separa=
te
> > > ELF section. This initially adds support for variable length names, b=
ut
> > > could later be used to add additional fields to MODVERSIONS in a
> > > backwards compatible way if needed. Any new fields will be ignored by
> > > old user tooling, unlike the current format where user tooling cannot
> > > tolerate adjustments to the format (for example making the name field
> > > longer).
> > >
> > > Since PPC munges its version records to strip leading dots, we reprod=
uce
> > > the munging for the new format. Other architectures do not appear to
> > > have architecture-specific usage of this information.
> > >
> > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Michael, Matthew, why make everyone deal with this instead of just
> making this an arch thing and ppc would be the only one doing it?
>
>   Luis
>

I'm not sure I understand - the PPC changes are in an arch-specific
directory, and triggered through the arch-implemented callback
mod_frob_arch_sections. What would you like done to make it more of an
arch-thing?

