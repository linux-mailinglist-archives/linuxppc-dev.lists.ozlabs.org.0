Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF97FAA4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 20:28:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Nj2ogzcC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfFxl64Pnz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 06:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Nj2ogzcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfFwM2Qhnz3cbB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 06:27:30 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-548c6efc020so47418a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701113240; x=1701718040; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XzTuOpSVbJlV6jvvk+X3oPv5/iVM0u3vN6xCSt+v7i8=;
        b=Nj2ogzcCsCkAPoT3sq6Pal2W8UaqUctCFLjPbeYh93ZcNdFixIdMaqGm0aZUBgnUhL
         aPOSytf18oxe3XZyMz+PbagQtYGGb1xsEA8lx3qoO/MSZPCOGYLPOCR9SquxyizsBD2O
         pn0y8lCHzbehJspGNrX5J4FfEwm1nIm4lXwtQhsRf/+9MyeLp8lVrU3fpXOrrMPxJt13
         ZOXmBoBLgylClecvalW1Clk88LYJR1hYI51w1v/5GGSH61Q/DMRB4DxsWnuwQvvYqZPh
         1Ll1uZQoc514CcVUb4VaVKGHMD+Af7m1S1Pv4G0B2hs3G0EvpmHpWRQSThNlFqqtAnUm
         txPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113240; x=1701718040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzTuOpSVbJlV6jvvk+X3oPv5/iVM0u3vN6xCSt+v7i8=;
        b=balso8z1eVM/t+aEave2RzKQ+5bykmV8S+nuBhXwzb7x/Nyv1TptuyMWiwykVPl3yI
         FIZpuGs2VjZPx8EMyV19xeePHYnqJHbrrY+YNpVwTweBZmW7TrDKLip+DwK3CBtt8wgY
         ToMGF8qeXkY6kxzNBJGL3m37PMZ4SL5Es6hh6MugpjDPTQUB7aToOfwLcK+EYY8TXVxU
         EcrYBEVT2bkOfzd4Z9yJkYSDexb/q9kaKB+5g/STqE5c7ada5hVz9P0z3SLOobdsn/ad
         6n3piRyCyfhxPBWECfmvQOdPkI/DBBFCgvBfiA3xYbaNsb618qVs1hi2dbDhjT9gVXpD
         ixVQ==
X-Gm-Message-State: AOJu0YzkJfw0tNgy4xOAlnkCtfFvXBLJHgr2wZmc2ELaBMac39X/933J
	kyIMH0qFDF1FbzqtcYqhTgYFxnrxIT0aP9zDEVd6PQ==
X-Google-Smtp-Source: AGHT+IGKwdo1ZSkcsOIcurvO0mHUiByb1C1j8DM9pzIpG8I41SgplF7gVh3OmwIEABFLg5jVukQI20YeFDGoZpg1adk=
X-Received: by 2002:a05:6402:5515:b0:543:fb17:1a8 with SMTP id
 fi21-20020a056402551500b00543fb1701a8mr690841edb.3.1701113239428; Mon, 27 Nov
 2023 11:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com> <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
 <2023112314-tubby-eligibly-007a@gregkh> <CAK7LNAT-OcaCi6tqPRgZxPXOV6u+YbaO_0RxtfmrVXPzdrio0Q@mail.gmail.com>
 <2023112312-certified-substance-007c@gregkh>
In-Reply-To: <2023112312-certified-substance-007c@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 27 Nov 2023 11:27:07 -0800
Message-ID: <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > >
> > > > With regards to future directions that likely won't work for loosening it:
> > > > Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> > > > teach genksyms to open it up and split out the pieces for specific functions.
> > > > Extending genksyms to parse Rust would also not solve the situation -
> > > > layouts are allowed to differ across compiler versions or even (in rare
> > > > cases) seemingly unrelated code changes.
> > >
> > > What do you mean by "layout" here?  Yes, the crcs can be different
> > > across compiler versions and seemingly unrelated code changes (genksyms
> > > is VERY fragile) but that's ok, that's not what you are checking here.
> > > You want to know if the rust function signature changes or not from the
> > > last time you built the code, with the same compiler and options, that's
> > > all you are verifying.
What I mean by layout here is that if you write in Rust:
struct Foo {
  x: i32,
  y: i32,
}
it is not guaranteed to have the same layout across different compilations, even
within the same compiler. See
https://doc.rust-lang.org/reference/type-layout.html#the-rust-representation
Specifically, the compiler is allowed to arbitrarily insert padding,
reorder fields, etc.
on the same code as long as the overall alignment of the struct and individual
alignment of the fields remains correct and non-overlapping.

This means the compiler is *explicitly* allowed to, for example, permute x and y
as an optimization. In the above example this is unlikely, but if you
instead consider
struct Bar {
  x: i8,
  y: i64,
  z: i8,
}
It's easy to see why the compiler might decide to structure this as
y,x,z to reduce the
size of the struct. Those optimization decisions may be affected by
any other part of
the code, PGO, etc.
> > >
> > > > Future directions that might work for loosening it:
> > > > * Generating crcs from debuginfo + compiler + flags
> > > > * Adding a feature to the rust compiler to dump this information. This
> > > > is likely to
> > > >   get pushback because Rust's current stance is that there is no ability to load
> > > >   object code built against a different library.
> > >
> > > Why not parse the function signature like we do for C?
Because the function signature is insufficient to check the ABI, see above.
> > >
> > > > Would setting up Rust symbols so that they have a crc built out of .rmeta be
> > > > sufficient for you to consider this useful? If not, can you help me understand
> > > > what level of precision would be required?
> > >
> > > What exactly does .rmeta have to do with the function signature?  That's
> > > all you care about here.
The .rmeta file contains the decisions the compiler made about layout
in the crate
you're interfacing with. For example, the choice to encode Bar
with a yxz field order would be written into the .rmeta file.
> >
> >
> >
> >
> > rmeta is generated per crate.
> >
> > CRC is computed per symbol.
> >
> > They have different granularity.
> > It is weird to refuse a module for incompatibility
> > of a symbol that it is not using at all.
>
> I agree, this should be on a per-symbol basis, so the Rust
> infrastructure in the kernel needs to be fixed up to support this
> properly, not just ignored like this patchset does.
I agree there is a divergence here, I tried to point it out so that it
wouldn't be
a surprise later. The .rmeta file itself (which is the only way we
could know that
the ABI actually matches, because layout decisions are in there) is an unstable
format, which is why I would be reluctant to try to parse it and find only the
relevant portions to hash. This isn't just a "technically unstable"
format, but one
in which the compiler essentially just serializes out relevant internal data
structures, so any parser for it will involve significant alterations
on compiler
updates, which doesn't seem like a good plan.
>
> thanks,
>
> greg k-h
Given the above additional information, would you be interested in a patchset
which either:

A. Computes the CRC off the Rust type signature, knowing the compiler is
allowed to change the ABI based on information not contained in the CRC.
B. Uses the CRC of the .rmeta file, knowing, as was pointed out, that this
effectively contains the ABI of every symbol in the compilation unit, as well
as inline functions and polymorphic functions.

If neither of these works, we likely can't turn on MODVERSIONS+RUST until
further work is done upstream in the compiler to export some of this data in
an at least semi-stable fashion.
