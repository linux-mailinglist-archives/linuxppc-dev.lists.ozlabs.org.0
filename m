Return-Path: <linuxppc-dev+bounces-9024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C896AC8585
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 01:55:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7jsb45cTz2xTh;
	Fri, 30 May 2025 09:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748562899;
	cv=none; b=gEXA92G8dyKkGTwn4Cw9BrRhWmlSyRZtX+wuVTgpLOAo+yuAjl3vZR0dagWTIQDQPJTYVsQd4C/R4Ui3Wi7SR6ZULCRVqf14kjKCqC5BkGb6WYGj4b0jPgZ87XLmBYtWuVhu1ZsR3ZB0qdekANI2xrsRDYcDPyFp1peuf65As2NnyuuUtx+gvMzuhks7jHC3m99s2qNtmo3S2C9kW3emHjYuXpRsX92OQnrGDz0UhH1DUwAA/Pzfh5AJB4qXVMOekIL0q7dJDhIMVKVtVzJBOC5o5+hsopHNRhbu1R0TVITAHivNyuHjYkb6tZSwGrl/AskhXIA39sabb6Ht+Ch03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748562899; c=relaxed/relaxed;
	bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqUQOdbUXh0crYEb+ovvDOHVVA9mXNKi/sxOf0I1cOXY+xBMv+XsYCSOnEV1o4J7wM5In7OYg2aQ2FgY1SnFXTJ7CBsjD/0rKx5e6+6mUuj3hdRc5vFjNrKlyWKmmUvR3iK1EiW4sIzGrd6iXXmKGLmcQMZDRgv9GvfpDoK5yDgl9CswYAXY3WjVa4xG7MqFKhj1Lv0BC1yCntpb0iRTUXrxoXrG1gu4d2kDYE3cLFmitWDLoDYmUrHvSdkqTL3rQMQtvRnczOPrTjIB86BIIzq1a+yvzQL3YZUa1YrJLaq6NNUu/h7K8PZfTj5yKJ2dR+0HTP8vGdJgaW2fjP+D8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IoWc/Tt+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IoWc/Tt+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7jsZ0ZN4z2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 09:54:57 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad8a8da2376so245847066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748562892; x=1749167692; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=IoWc/Tt+nmOXB5AVC+XTLYD8T7HBp47zqrbSOa+jYzshM413nibqMqylDEDevpTWqN
         g6nq9aY+ukeNKWdaT0BzgYZwuV8DUOcZt2mjCl/EkFY7TNg3NmP0gebzf50q8naWYdZ4
         MTVGlV9KXGo/6ri2A1YBvv0z1b+f2WxiSSWW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562892; x=1749167692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=QjYx7+TzasEOS9nR7llYa2a0e3wfv2cgWSuae3TF6IPgmc9qmoj8I5tLuzmwbkgGqX
         WS3f7fBe9TdH8n1+k9077XwmkH2XtCyeop+nn8YHH5N2CgZU2yPtTdriSiSX7TO5WlTJ
         SNOnJj7fitqLcsmktxaJzXXyaCUooezGguRygN2WE4vefUVr5zZCNSh9RFlqdSbyiWsc
         GdNXJKrty+69Ia9pthdhdgauSsMFK1FuSc0bviYJRMH5gah85ZrfrqaK7qA4+/jaoh2z
         is5PQSKfVP6kzAFN6/CPqJuqYNoLnucEbVlsMqM0EYRl7COuVutgBmWx9BBgmrnWdUER
         LZMA==
X-Forwarded-Encrypted: i=1; AJvYcCWQH5gzG6eWSKRZmg85wHwapHxN4L51Prxy2BfJGPX+qaLIBUErnhgF4/1oljjaybtG4AOGmPlNCZQJC/E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6GgLtstHrpYLvTaueASlIR/6I+1p3VF/2t49x0R/NLfoMRLKo
	o2VCfbXpv34AKbK9krlIt7y3HRKN3Zssd9m13cDhxA1Fzns8AI2Kju55Ls889qP/tGSWlsAxN0l
	ExRp9UP0=
X-Gm-Gg: ASbGncs4jYKkrXr8TLJ1j/bs7NdqFFpJhvhhSSciSOTnhE4VP3gWrxWRegxntfbVSph
	dUOxBEKf2Kx4sIVyjcVsKCSjNWRF0L/lFGricKDMOaY6KT22G7SKIfR5dWnjRHgyms7hWusfNQI
	8Ecydrbx7oWr1VADNMluw+OYESfokzQNDYT/opZaAYRYYTyTtu5PCHM4ZtouFlmPldpbpByrB3r
	UFKPY1rywGw9W7dNY6TKAmGnA/TH3wlrBRfW+BOVRyCRtf03yjeD9kCg4EfSjdyrgQXa3fL4sQt
	G1HPZDCDIsW0nD/U6IDp8p9Y9kG3/WAfbp+pNeWQQZHpPl4ygViuTSkgvHUU/Vhj6wu7OGt00PU
	n4dgk/hur9ZvlHChsj1FuCn1Bxg==
X-Google-Smtp-Source: AGHT+IFiUJEG2erbIBCbLE39Y4h59GpYjtFXte1jTaE56x30Sufn89f/07p97V95WRGr/Jry0OhHGQ==
X-Received: by 2002:a17:906:6a21:b0:ad8:9c97:c2e9 with SMTP id a640c23a62f3a-adb3224582dmr137738966b.1.1748562892359;
        Thu, 29 May 2025 16:54:52 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fece0sm225431466b.3.2025.05.29.16.54.51
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 16:54:51 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso2229869a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhxLFgmNOgg7jez93y8J1DJhZZO3ZrfzHdjfJF/0qusOBwUAHMmA3jHfegCWkuFApPct3hlxemamx/uGE=@lists.ozlabs.org
X-Received: by 2002:a05:6402:35c6:b0:5f8:357e:bb1 with SMTP id
 4fb4d7f45d1cf-6056e1597eamr926476a12.22.1748562890813; Thu, 29 May 2025
 16:54:50 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com> <20250529211639.GD23614@sol>
In-Reply-To: <20250529211639.GD23614@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 16:54:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Gm-Features: AX0GCFuuQZJkBnHy-mtAufGSUKbxBrKrMtOhVAT8ZxGCHwWeq3lbFPW0g13cPtE
Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> symbol.

Yes, I think that's a good example.

I think it's an example of something that "works", but it certainly is
a bit hacky.

Wouldn't it be nicer if just plain "crc32c()" did the right thing,
instead of users having to do strange hacks just to get the optimized
version that they are looking for?

> Does any of the infrastructure to handle "this symbol is in multiple modules and
> they must be loaded in this particular order" actually exist, though?

Hmm. I was sure we already did that for other things, but looking
around, I'm not finding any cases.

Or rather, I _am_ finding cases where we export the same symbol from
different code, but all the ones I found were being careful to not be
active at the same time.

I really thought we had cases where depending on which module you
loaded you got different implementations, but it looks like it either
was some historical thing that no longer exists - or that I need to go
take my meds.

> IMO this sounds questionable compared to just using static keys and/or branches,
> which we'd need anyway to support the non-modular case.

I really wish the non-modular case used static calls, not static keys
like it does now.

In fact, that should work even for modular users.

Of course, not all architectures actually do the optimized thing, and
the generic fallback uses indirect calls through a function pointer,
but hey, if an architecture didn't bother with the rewriting code that
is fixable - if the architecture maintainer cares.

(On some architectures, indirect calls are not noticeably slower than
direct calls - because you have to load the address from some global
pointer area anyway - so not having the rewriting can be a "we don't
need it" thing)

               Linus

