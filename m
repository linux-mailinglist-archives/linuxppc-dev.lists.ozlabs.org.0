Return-Path: <linuxppc-dev+bounces-3020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE79C0F1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XksqV0FtLz3brM;
	Fri,  8 Nov 2024 06:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731008421;
	cv=none; b=E1JdUaALKhdZUq5RXVDxpnRo6degIItgBCnEySpawDLcGNXqcVUley8V8oI1vUZ7fHRexQ4YHiKKP70uaJxRXQZXKEXCHhidA3fExZ93oP+6oMKOFjlGLTib8H730T7X8XgfkwQHBv5Z0XrftDCn143a+8LClHIlpsIWXFgnnTv3FCHeLZIzPxtL+nTDDN68amVT5FtVsKAKQWWriI9cA3mB2Uff7ZTmB25Bp7h5SiuhmxHijfMdOsfFF/bqsSV1aiQTnfx/i1iSu6Fq9Yb58z9ZXJ49ohjj/hfoG7zyp8c2nL4w7LuILGl9vvG9RKWwynKdZt/zprnGlIeixWAjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731008421; c=relaxed/relaxed;
	bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UI4qvYttUHLFB0XuwcrMe3bxSR+ddKxIeuvb7SnjLOknPI1OAycGRgp1MxXQpfm6jWqcT79aQtEeSkAyHBLmHLSlVEDkeRrwPq4oRW0ScvslQIdr1Oj3R2nIoaHxKBx1XIGcHyX0Kiiu9c659QNBgLAvawuc6zZJVOlNhL/sRjaYH54WpXdsadVerO7IMJxjZS0LFVRUHxOZeOAcIs0MebyhxO4h5Jyg/t/SSehQz9Yjx1MJF6xAto8jkgmeWPZvlL3//YflD5c5hMh/xTjMoSM7rx5YsKsev3qiAJqxCUO0SG8dXbDbN2P9mm/4smxasQeGjaFPc0PMovuv8JRxfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tRj3uUBc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tRj3uUBc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XksqS6Vcwz3brL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:40:20 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so3760a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731008417; x=1731613217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=tRj3uUBcvOuyvCFjWiJA0OuaD6n6U0OtrIl8kmBVmN5C7G1p84QyFA/V+/5QW9+9D8
         gqVSpku3ZBT8KWPGH3eiND9ja5vN46ZhAZKPk6qQcxB12qIqzK0jIuiI4A77yDjj1Bs/
         l1WQGlZKwhs8VmNiiaxCAQSjyDeNLqGr13wcNx+tGJXsgUw+LtbSyxfvWuRSaqZsjm3G
         MW9YryuV2+vR7gp2/XXFH8go7wcrg15fW/FsrTOiQ68gtWEhY4hB7ojg5QVZ9dh4YZJi
         3TxICcX0z84qj9KlS12Yt8jUsdrYdjJS66KGmoWpmZy5FZF88wsqUa7AH7vzaGTLxoxv
         DhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731008417; x=1731613217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd/75cbpPjgH2M9LbK7DZEh2TDCTCcgqhG32wv/Y+KM=;
        b=cwAbZ47+9KhTqLTeOH/1nuZzs0q2Tj1bfFQ2UrA/xhntxBOLTFiBiGGkfEa+jwhsnB
         NAkEzr5Wx+T8v0yK90KQ6XLG7jFbu2PRP+24wlonFwcRPw9KVDcjGEpYwqlXgYKwXQat
         jWXjQW5NIy9vGrRHC6OLgE25z1gIEqMknBL2m6Z7edk9nrrQvRuD66hZH9vamRfK99kA
         m6FWtLB5QWHSM3HsqfNRvU5Flszdhs7gg0qkA/iU1z9DZLomqk8CvQ7GZeiT0fP7ECzO
         S57yAb7kFeB8N7LBljZvrPmEA0TLrZgj37T9iNC6AD3AFSFrIkEC/KhNFGsWphSGu4uV
         WAjw==
X-Forwarded-Encrypted: i=1; AJvYcCUYvEAxG/1Nfc8YJiZozubXOlmKst08IK7JUlQenqtkUtalFNyFxc2i1jfRbIjbHdEH34KYmEWCXic1Ztw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxChwDjZj4B8r5jFLJMg91IO5Tni3objvXRrJqLftKIqtU1TNMy
	aJvYd5cli0rFuBYjSCaKMiSpl24eOLZzJRnngivvo1JvZnkYfo1oJqBkI/2nA8JEWpAiTPP1LFY
	dkUBPGooy+v69wst6kk2FWTxFwc/m7yZN+wbl
X-Gm-Gg: ASbGncuqJpvXOSr3zRc/QeYAF1fxRUkfyE5DCVptdbI9H+StnsCXwu4JibvCpLRFrC7
	sErT5RLSNZyWxQVjct8D9gX5uiaxo17cgnkkcUpA7rNcwWgrjQOtTzRkPSJd8pA==
X-Google-Smtp-Source: AGHT+IEBiwFNQfuoAxFiltxJ2hrjOfio8RnmCYl6hN2gWLInsahzd3pu0ISjskuePHQ29yF2SOFAso1eK087KsDFWnI=
X-Received: by 2002:aa7:c846:0:b0:5ce:b7c5:4b3c with SMTP id
 4fb4d7f45d1cf-5cefbcb8d85mr748450a12.5.1731008416865; Thu, 07 Nov 2024
 11:40:16 -0800 (PST)
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
 <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com> <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
In-Reply-To: <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 7 Nov 2024 11:40:05 -0800
Message-ID: <CAGSQo00=H8iUAP9FwSxgT3kdBmBrzsdWqA0kh5f_5FsBLxyBUQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Lucas De Marchi <lucas.de.marchi@gmail.com>
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

Adding Lucas DeMarchi to the thread after voicing an interest in the
modpost patch.

On Thu, Oct 31, 2024 at 12:49=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
>
> On Wed, Oct 30, 2024 at 10:06:12PM -0700, Matthew Maurer wrote:
> > On Wed, Oct 30, 2024 at 9:37=E2=80=AFPM Luis Chamberlain <mcgrof@kernel=
.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > > > Matthew Maurer <mmaurer@google.com> writes:
> > > > > Adds a new format for MODVERSIONS which stores each field in a se=
parate
> > > > > ELF section. This initially adds support for variable length name=
s, but
> > > > > could later be used to add additional fields to MODVERSIONS in a
> > > > > backwards compatible way if needed. Any new fields will be ignore=
d by
> > > > > old user tooling, unlike the current format where user tooling ca=
nnot
> > > > > tolerate adjustments to the format (for example making the name f=
ield
> > > > > longer).
> > > > >
> > > > > Since PPC munges its version records to strip leading dots, we re=
produce
> > > > > the munging for the new format. Other architectures do not appear=
 to
> > > > > have architecture-specific usage of this information.
> > > > >
> > > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > > ---
> > > > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> > > >
> > > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > >
> > > Michael, Matthew, why make everyone deal with this instead of just
> > > making this an arch thing and ppc would be the only one doing it?
> > >
> > >   Luis
> > >
> >
> > I'm not sure I understand - the PPC changes are in an arch-specific
> > directory, and triggered through the arch-implemented callback
> > mod_frob_arch_sections. What would you like done to make it more of an
> > arch-thing?
>
> Sorry, yes, I see that now, that's what I get for late night patch
> review. Nevermidn, this all looks good to me now.
>
>   Luis

