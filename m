Return-Path: <linuxppc-dev+bounces-2943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD79BF927
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 23:20:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKQB6cKPz2y8k;
	Thu,  7 Nov 2024 09:20:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730931602;
	cv=none; b=UBT82PxpKsY3paq7QhN3r3BSISmrk3eQsjjsP4PQnG00ktVJf0KWjfaAkYOF/pJKgJDxB1VeBIZNCAg09ApVL9zrYs7snq3cka7mVqpUydPJT2Fqo7DmBKTCwUuyj3UAcm+ySTtNKYrjHPm18XguPg0hi47daOv5JCuVhL4iczHRiI5ES6dyt/uS6zQnUvilOW8Kard5NHG2wRyvD5UO0DE4h2L2/psp+cfmFC2mAqBNxW/SZ6RGtZuxBPim1bRz3w8oPjSAk4WZWDyRkkFJLNfC3nsDOdTrH9y5gFp3i9vKvd+yLuapXdkcJceuSTC3vc1KTMn/s8KCvJ6vnTAn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730931602; c=relaxed/relaxed;
	bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQOYCsyZTjDqbqlLN/40qhpgZFSTI/XcdnvULfSBr/+Vep7gJgj9cVyz4UPrOuKE6Bx1rZieFM0weZs3ud+zWRlAMpo1Hv0f5wkjVCO9r3U7Eb/fkhupaTpomSQm+dV4wQVVI/Jgcr5pxl+0qm70d0goL6LYXeVXW66wP3vNf17N6qhfZI3JNTMM01sN0sZZ2gRBa6H+zYe0hD0+dtQ9CEB9AAMEYieyyNLkJIET/aP8fQOLSqRW5sCKUS72Rvu728OTPbTp8tCO49kkjwivTvkC9Qaq1cXy8DU29vx9yl0z3hKsNw4URYA+QA6WzfP0Z0n7BgkDDNdpTB9MN9lqww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KlQB6oDy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KlQB6oDy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkKQ85F2hz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 09:19:59 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so7456a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 14:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730931591; x=1731536391; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=KlQB6oDyGcHET3ejXt0jPIEoG2eJSZyqEhLZgjcbRZ94VX/FraYA8qPZdmaHVazKDY
         zokl2FWPOgHBhVSHYyIQYctsmN4pIr5UL3GcVofXQ3KZa1IB9WFNUtyUgJ0ACy1lyaag
         4O0y/HQBKoaHNniaRS0/McOO7GzDy1oiRs7V0E43zXNHmQKx1XCZ7qUtnHJzILRP4Wd5
         xgLvLA+gMtw50hfB71F63nkZ4T4B21muYAKmzmdgTNtPDxvMjZrqVEFkK8WADXhpi0CZ
         hryGauIkre6ZL1eLWN6kFg7uI27E7iJPz+ZT8w2Mow8uG2+uw+x+62tEUl4+uq+3axV4
         b6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931591; x=1731536391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=Bc2SFANNUjFsySTc1elwj+iJBqRJ+DX4lT5ixAwcvWaDRtewkKYgK2Gfxqjhl5lz/c
         vn8jwE+Ce2NYEJcwl2o3+CRrmLuIoHl7pViOGIqcG93wJ/A6zmyZ6QJdFAojOvikgQ9M
         Vev5IHcbJKo2+uWoE7ku/xASkjffrSRzNS45eNzaqr2YyM6JaS5OH0saQ8KtgDEbz5Mj
         RiiZgTdX+VwkLIpXuIpmvronXA9WpIOGz7ow+4GTvJYBCUHex/KfKQbyiFkEQbpEF8Mk
         7oQd2Yx5uc6GE/XO86pzTq47LF7IGLRNsHgE/L6sSnnZybsbcIy2j5bF6aieclSkq0Lc
         p39w==
X-Forwarded-Encrypted: i=1; AJvYcCVlme+VgLg2waCtQTBK8DtRK14QuQGUBEnzlTTE5fQlJi4uhQIQ577IiofAGD//S8IcuCGWBkWpgHvQpro=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yymq0i5aeqn3ktIlWFdQWhJfgK6HIzYNln0Hp8KppVI6zlhBEAd
	TX284/f4w1VG+oLambNAtzGm5iRa+WMDh8NTBZasIfEjxwKA6OezaT9eAj7V4r4ROAfG4Mnz2e6
	T4AvWr9pZ7PsgwTEklPcgIFAW9i509D/z0Dhg
X-Gm-Gg: ASbGncsf1mW3+eGMOFFhLOhw9yaQ3laKZ+Kdh8DaEwVlDnIWXZuc2nwvasrhMrG5ktd
	RCsRG5g4L0BsLU71q5SYETvWdKXBYpxzckaN072Tz0BPueT+lLm+mY682zo2n
X-Google-Smtp-Source: AGHT+IHr43cQPFdqXPCZMuhW0YfDPZKYdGnYJyq09Flo3eqNIAHnldTJTztppmJyfXcIKbSiu12OxTpcgO6RCsjM9mo=
X-Received: by 2002:a50:8d09:0:b0:5cb:6b7e:9634 with SMTP id
 4fb4d7f45d1cf-5cefbc29fcfmr233654a12.2.1730931590492; Wed, 06 Nov 2024
 14:19:50 -0800 (PST)
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
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
In-Reply-To: <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 6 Nov 2024 14:19:38 -0800
Message-ID: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
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
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

>
> > If booted against an old kernel, it will
> > behave as though there is no modversions information.
>
> Huh? This I don't get. If you have the new libkmod and boot
> an old kernel, that should just not break becauase well, long
> symbols were not ever supported properly anyway, so no regression.

Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
then load said module with a kernel *before* EXTENDED_MODVERSIONS
existed, it will see no modversion info on the module to check. This
will be true regardless of symbol length.

>
> I'm not quite sure I understood your last comment here though,
> can you clarify what you meant?
>
> Anyway, so now that this is all cleared up, the next question I have
> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> userspace requirements aren't large at all, what actual benefits does
> using this new extended mod versions have? Why wouldn't a distro end
> up preferring this for say a future release for all modules?

I think a distro will end up preferring using this for all modules,
but was intending to put both in for a transitional period until the
new format was more accepted.

>
>   Luis

