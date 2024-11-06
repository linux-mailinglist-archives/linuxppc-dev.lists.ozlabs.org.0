Return-Path: <linuxppc-dev+bounces-2892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D29BDA49
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 01:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjmHT6jJ4z2yRF;
	Wed,  6 Nov 2024 11:27:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730852837;
	cv=none; b=jC1DpVtXJbI4x1HyetiM88pNHfaPZumdes8HxdEZZ8e6yjb23NYtiEsZCc8Swu+cQlPWMrhLX9f9gLanmMN9b0FANgIsiEQY5C3iYfncdV5hLub+wOLbxA32LDb6nBqehgOkHZA9rJw3OEgz3O3LIWI7TAy7zux3WY2Xzyz8LQ6U8Y/ysH2kcZyXOk9eLHz2/1V5JumV64fwxj48pgCZpNfsBnDxE0MtQRPPqEmJDrSf6lLcF9b2LrhXsoJiCy68T75IrOIptGitmjGSLQrikAbNdHKmoYhHHLpRLZW6r+fp4qlDCndUoAigXcEEtdzEhS2gqVY7NZdrSzPwWqnHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730852837; c=relaxed/relaxed;
	bh=pRO9xQlklRvT0E69gUtfh5sNxBrWxd3DuFYUq1k3Ijw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwmwGc8CoicKQiOpzBGRdgtHsh0k/iTmrLPYbKkcGkY7hCMMQR/Fh58SUZvyVoZKszpO2Nz6Hi/Qv4dcOtCjA+vOJxuidwSgsBOwFYB77JXZb4dKL0wilIycUlFres+JJnMo2G2exRARzkopvC3ZTWGm45B+tPdPmIWPRt00z6OuCM+l8zqKHozuasLqt3UygKY+ifAm3bu9IPecw6YulApnTLmU8M5PWUe4lWtfVGqDC6e27rXk/+g4NmeUbE549tVlEE23nHWLKR78KIFCsJtGhrobCNbFKzD7+tYZfc+/GaPKVf3A4iJgZg2Toz52N8n4NXwkNsUsHfIfOy7UQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o3s57fQd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o3s57fQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjmHR51Htz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 11:27:14 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e66ba398so8662e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 16:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730852823; x=1731457623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRO9xQlklRvT0E69gUtfh5sNxBrWxd3DuFYUq1k3Ijw=;
        b=o3s57fQdcfyEAy/URqe2DzGw8QVL2jqnZkRDDJBuBnwsOAJch08tM3HhZcZ67Ciygl
         McZ2XYTeyudUacpVDtl2g9ePqRaQmrPK9PKdMAyZJC/jvxOoi45LdAqOVgQcvIzbXuG3
         q0D65GoExBCZe3xoqHhPrme7prToffnREjTmjbadimB4NqeURFtz9YpgGTQEZxrA1uYL
         XY2XMxBcHbzfVXEKgKGylNQdD0YQz5smbxJgmPg4rMCkIp36KZ1xBRFknUYlS5dOVWUY
         u9rMzJZ4+wlt5mmDT+/UF2EMIBfbtqe0TkfkuVnbkxoSYhbTwBMZ/IJBJpqxr8BGHBen
         PX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730852823; x=1731457623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRO9xQlklRvT0E69gUtfh5sNxBrWxd3DuFYUq1k3Ijw=;
        b=Bwr+uh0+TPEOAgtiJycauRyiyQgbHXVRiCsh/J7t2YVgTEi0VkKY/bKxe11Z1EwAF7
         LEzDxbPsb+4pFw3yMJU6nvTU/EBS176wyweyXb5x7OzgHlP9xDxSJNKz/6pbVmSopWao
         Wy7zObRi/sMjckESnBvXs9XO31QLMzjpPHr0to7N7uW91BSvxJ5tRxhFGGt5tljpbvlm
         7gt7n/buy8I2T1f4do9latz2QKK77FQBMpRfJx3F2dhAWUcwDjYTZBglXYD2zgXA8L+4
         NH3Ad44ZrAPpSmDN4x+A4vPJSanmSZvaRHFiaRJcjagjB8fJDWSnjRtcz7cxb4o3F6ME
         GGKw==
X-Forwarded-Encrypted: i=1; AJvYcCUmsbg+JxavvvFAshzW0dYrcTfCDoUpRTik9IlG7nVDdG9fhO9E7OB6nKOi6uuifFejfRTjlJqAIB4fD08=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOe968Pjzp3Nla/rXV7T08b4j7eVkXmkI4/aDQ613IWmD1dZrb
	n1nG/CcK8y4WD02j4oqday9Kp5YoQHp8adk+TrfuI0oiCFvXHbhGnLHEyhd+Qe2ANmhuM6JD1X7
	hoxFBaKRVrdlaemz6NLTIne+Jh9GB9PxAjv4/
X-Gm-Gg: ASbGncuZ5ntn4nOe3uMsQVXPzewOVG62XYw6V5NclQqn//hLFFTI1+MRhTCJnOYPSZO
	uUsq+0BvptCeeF+Axt81ECyKh1+NWBKVLua1DGfJBFeP0Etq79gZKHR2HlgOn7w==
X-Google-Smtp-Source: AGHT+IE+Ve5zkLIG/2ctO+hgokTHSdkzeAFtePIoGq4t8jD3ad7SdLQ0XlUXXaSH2Lu/eahr3Xg9xbPc7h0Nl+t5HbI=
X-Received: by 2002:a05:6512:4ca:b0:533:49ab:780e with SMTP id
 2adb3069b0e04-53d7cc42facmr199195e87.2.1730852823031; Tue, 05 Nov 2024
 16:27:03 -0800 (PST)
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
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
In-Reply-To: <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 5 Nov 2024 16:26:51 -0800
Message-ID: <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
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

On Fri, Nov 1, 2024 at 2:10=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Thu, Oct 31, 2024 at 01:00:28PM -0700, Matthew Maurer wrote:
> > > The question is, if only extended moversions are used, what new tooli=
ng
> > > requirements are there? Can you test using only extended modversions?
> > >
> > >   Luis
> >
> > I'm not sure precisely what you're asking for. Do you want:
> > 1. A kconfig that suppresses the emission of today's MODVERSIONS
> > format?
>
> Yes that's right, a brave new world, and with the warning of that.

OK, I can send another revision with a suppression config, perhaps
CONFIG_NO_BASIC_MODVERSIONS

>
>
> > This would be fairly easy to do, but I was leaving it enabled
> > for compatibility's sake, at least until extended modversions become
> > more common. This way existing `kmod` tools and kernels would continue
> > to be able to load new-style modules.
>
> Sure, understood why we'd have both.
>
> > 2. libkmod support for parsing the new format? I can do that fairly
> > easily too, but wanted the format actually decided on and accepted
> > before I started modifying things that read modversions.
>
> This is implied, what I'd like is for an A vs B comparison to be able to
> be done on even without rust modules, so that we can see if really
> libkmod changes are all that's needed. Does boot fail without a new
> libkmod for this? If so the Kconfig should specificy that for this new
> brave new world.

libkmod changes are not needed for boot - the userspace tools do not
examine this data for anything inline with boot at the moment, libkmod
only looks at it for kmod_module_get_versions, and modprobe only looks
at that with --show-modversions or --dump-modversions, which are not
normally part of boot.

With the code as is, the only change will be that if a module with
EXTENDED_MODVERSIONS set contains an over-length symbol (which
wouldn't have been possible before), the overlong symbol's modversion
data will not appear in --show-modversions. After patching `libkmod`
in a follow-up patch, long symbols would appear as well. If booted
against an old kernel, long symbols will not have their CRCs in the
list to be checked. However, the old kernel could not export these
symbols, so it will fail to resolve the symbol and fail the load
regardless.

If we add and enable NO_BASIC_MODVERSIONS like you suggested above,
today's --show-modversions will claim there is no modversions data.
Applying a libkmod patch will result in modversions info being
displayed by that command again. If booted against a new kernel,
everything will be fine. If booted against an old kernel, it will
behave as though there is no modversions information.

>
>
> If a distribution can leverage just one format, why would they not
> consider it if they can ensure the proper tooling is in place. We
> haven't itemized the differences in practice and this could help
> with this. One clear difference so far is the kabi stuff, but that's

The kabi stuff is at least partially decoupled - you can (and it
sounds like from the responses to Sami's change, occasionally might
want to) enable debug symbol based modversions even without extended
modversions. You can also enable extended modversions without the
debug symbol based modversions, though there are less clear use-cases
for that.

> just evaluating one way of doing things so far, I suspect we'll get
> more review on that from Petr soon.
>
>   Luis

