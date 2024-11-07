Return-Path: <linuxppc-dev+bounces-3018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EC9C0F0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:38:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xksn36542z3bqs;
	Fri,  8 Nov 2024 06:38:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731008295;
	cv=none; b=axkfSg0zlKXWj3yDKuNy+1xmdCIKhTrCheq/3ai2vx6Y5mk406Bw0ISZ8qlLggagmyDu3AWozPabfPBpYF7kGeoQHzreQOTcvpgPKHM9j99404zcFjdXv1gSEQWeEWSD2ROY+bqav3IQWKM6FNoHbBhy72V6PgWaNQ0u2QG+VZZ+m8SQApREpc34xqc5kMEpJnfPiuXO9CSJqCuGpqvlPsvbp3yJ5B4DyBwThQ4udOtZQrNV4IfUC/TNTktw3t9JD+Ke7E/XhiZdG163cJT7HDnvePhjM0ItT4Y1+8uBPJvL+BabzROLL2jYjaR2NgXsKbzCjCofergaX9mpOqlWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731008295; c=relaxed/relaxed;
	bh=HOj8LMAazYpTjfu5mrOLk8RCDPLc0j+wCQq6uBtbnSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5ZMmUKgzHzDDvdslocLU40NSTEltnep+xVoHS4BnAZfEcD295u2mMaZ0LQg27V7fJuebYkRknNmYCl74oUnm0wYNibMdobmQ2M26jxlRSU3wAeZ0rdnRJHOS/8ivFYS2U2DC01XMrkOKa9fBcdNRaTDaux5A/BWuMzgiEdql8IGkBZL678M8A4FgvbFj7zL/y5T2lTqnLlatV2h121OcGG+YbA8R6F7nwT7RzjA3YeJdy34p4+v3/hrLhs8ijLgBky529URCegJ2QSCjUOyVfti86088oFGVxHmv2+GYRnecpamszmvXVxQSSModD6Ed4MGxtmwQjd8Ce673PPf4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kauAkUp/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kauAkUp/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xksn2257Mz3bqD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:38:13 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539e19d8c41so4698e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731008281; x=1731613081; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOj8LMAazYpTjfu5mrOLk8RCDPLc0j+wCQq6uBtbnSs=;
        b=kauAkUp/ZJEBFZs2SJBkO7QCabsPII27nX8QhLP3yHlHz3gpl/4w8A5m6URcEau5ys
         uxf4hC035WrYEddW9I/4eSU7VcITDJTLLUUdI9yWkyVz0HEZX/mOfQvbF3mGHVZOdxfF
         jg2N0vmFaLqN1MUN5k2zdWSSQDYza4aNTj41jCmuIK7GdMmZK5n5yXoMFzPj3Ghoc69r
         zmmU2fQWPOO+pOJi889qqELjP1xih9xkhWLQDzk7VbcT8dRjvRWrqEOO+C1QvM77qRPO
         6gImCuBF3JQL/SiplXf8a68/E+3KnQUYmqEp4+t3sjF+59xJeDrcV0Td9a78OxNBct2p
         Qrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731008281; x=1731613081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOj8LMAazYpTjfu5mrOLk8RCDPLc0j+wCQq6uBtbnSs=;
        b=UD760DpmaQXy4CYorU3maZ3hivbldqENJbQUefS0wvHJWMqNNwj5PZV2j5CLQT4c+6
         XAc+JzrmOhN1GewCii2j7V7sjU4EABmGzaKQ1qw5cDnbEOGB3vK65qGXytlFAE7AirCa
         tyf/Fd9f4ja5U133bkaERJJBcGvHQGkvRwaGfWipW0y7rqyARtY45yQUXbUeTI1addUB
         hgyJRT+ViOUeZRjsMqNIV+y8hkRxHEmwh1dIup/wfnLhSRblQDTySb7kuMXxM4gxezyw
         YMByOM0wdqm+F0gdxD++t5feWIsXS41btGUHVduoNjRtQ0x/w7f8Ti3ZQN9SrDe3xVOB
         Etew==
X-Forwarded-Encrypted: i=1; AJvYcCWAUdp6ZQYb4n1wkbPboAiAgy+nLuR+C2T1SvV8EQsxDQgZ12YQS3WrvKtIC3M4/jZQuF3GngAQ3ntNcXI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwU5PKYUFrQogahJTPq0qXwuMip4asy5LFHlxDZSzo5A975zHOL
	gzDCI02vCMpjJlHXztZF7Npp4fBbn+EKeKZk1KnxcHjBja3ZAdcWv8/A+RMfeUUkFBAZPscXFsx
	jQBlOdnnDyqiA3nEejJkZuZXbhzr1arl3OQ99
X-Gm-Gg: ASbGncsbM8SqWJw0zikOoNp7ASPiYBnVUqIkDLR8N/EDIeb7GLznm9ecUXRUZr/ne+I
	a1RipaKEZK+f1SGEGlUl67shjvwB2dIea2XZgAkT1L8olOraZ1FdUxzprZvrf0g==
X-Google-Smtp-Source: AGHT+IGExvGXqzYeYDQ4rDspkwVFg2PIUqBXwcbJS7a2hiTewgKwW0pQmiUCGPl4ZzxqFZQAq3zzHYeO+DEmkcjl1iI=
X-Received: by 2002:ac2:4e44:0:b0:53c:7652:6c97 with SMTP id
 2adb3069b0e04-53d811f1d2cmr340579e87.2.1731008280784; Thu, 07 Nov 2024
 11:38:00 -0800 (PST)
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
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org> <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <hs5fxluchiconuonhziu3qh2ol5bsdxva3cuny2mit4i3equzt@ieueiius5x4w>
In-Reply-To: <hs5fxluchiconuonhziu3qh2ol5bsdxva3cuny2mit4i3equzt@ieueiius5x4w>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 7 Nov 2024 11:37:49 -0800
Message-ID: <CAGSQo00H+K-Sr1F37N27RutWthYRd0o4QbP_Z-kfWwb65L+Kxw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
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

On Wed, Nov 6, 2024 at 10:27=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> >>
> >> > If booted against an old kernel, it will
> >> > behave as though there is no modversions information.
> >>
> >> Huh? This I don't get. If you have the new libkmod and boot
> >> an old kernel, that should just not break becauase well, long
> >> symbols were not ever supported properly anyway, so no regression.
> >
> >Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
>
> how are you setting NO_BASIC_MODVERSIONS and loading it in a kernel
> that still doesn't have that, i.e. before EXTENDED_MODVERSIONS?

That action would involve e.g. building a module against a 6.13 series
kernel with NO_BASIC_MODVERSIONS and trying insmod it on a 6.12 series
kernel. I know it's not supported, I was just trying to describe the
full matrix of what would happen differently with the proposed
additional config flag.

>
> Please Cc me on the format change and if possible submit the libkmod
> support.

It seems awkward to adjust kmod to support a format that still hasn't
been accepted to the kernel. I can send kmod patches to support it,
but since this patch series hasn't been accepted yet, it seemed a bit
premature.

I'll explicitly add you to the format change (patch before this in the
series) and add you to the whole series in v9

>
> thanks
> Lucas De Marchi
>
> >then load said module with a kernel *before* EXTENDED_MODVERSIONS
> >existed, it will see no modversion info on the module to check. This
> >will be true regardless of symbol length.
> >
> >>
> >> I'm not quite sure I understood your last comment here though,
> >> can you clarify what you meant?
> >>
> >> Anyway, so now that this is all cleared up, the next question I have
> >> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> >> userspace requirements aren't large at all, what actual benefits does
> >> using this new extended mod versions have? Why wouldn't a distro end
> >> up preferring this for say a future release for all modules?
> >
> >I think a distro will end up preferring using this for all modules,
> >but was intending to put both in for a transitional period until the
> >new format was more accepted.
> >
> >>
> >>   Luis

