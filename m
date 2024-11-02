Return-Path: <linuxppc-dev+bounces-2768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968D9B9E82
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 10:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgY9Q0d96z2xy6;
	Sat,  2 Nov 2024 20:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730541562;
	cv=none; b=CNcRAuAPoSioBfBwGDaG7q56yLp3VtKQfhVn2Nztai8iqP74W0TREj5Be7jworHF/uQDpXiznjbXCTztgPeoXqx+UTEAIifjlbs9zJ4i1psShnjcLOWz2e/ie1fxnEZjfzngO7b6sJacJU0pKo2xLZJFEmSoYA2XmalqaQYribtUlHadqiDdP6dBLehVHHlm4/vjYB8VqpM0GoFYYQv3aMCCKQwrZ72Jlzg2dtP1eYrhVLH4nRAAnPMoAdrxwZHOrdGyWBP0zQsy9isHcMvJNH4GcSpmFItRJhNLJCpbziCwWIR6dUkz043rt7lkexHIfEJvQdYuZs72SbYdKqnOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730541562; c=relaxed/relaxed;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQryKNgvXa4Pvwlkl/c3vq1lcfh60z7KcAe07lm7ceGdLKX3lF7vhYXVsgDME0KL4UhzXAC15U0lj0MzUriBwQKyIa8GMMWwq8SK2PkrksT0lmiWqrlqw7gVVL8Qz51Ayvv58wdPXGH+zWj0yA0TGSrg6jKZD2w6JvzqANh6QMozY3tQLn3/JQx6wT4KfC54HLcGkSXwim9XUdeWccd1tqSQwJl/q4qdU363f1BtkCP5BGjNrP5Up40Mm93fmCbj1fCSE8TYnryGBZ2uhgq4mui6ZFIxOEn6rA7MkzfoFYwzHX2fwGnLVLClR6xg7bgLfoYIYoMCw6z1SJ3W4c5aVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pTAZ258u; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pTAZ258u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgY9N30F7z2xJV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 20:59:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 812DA5C275D
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 09:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182DCC4CED3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730541554;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pTAZ258u/Bm55mgKfduPxcJ4+l7utIbI96FN3uHiYroZBZHAbnvfCZty3m5Rr2XH+
	 F9H9kpY23mllFcm03reDqSDwYlj6z0PqW6iPcayBoJoKDOej6utxzDbE1LxiDgLJej
	 urb0cE+UNWmcsBfRHpQmITbawEzxNGoWVLCC3Y8Sm8pFGBsK9d4GCjck+Inw9773Iv
	 K9VihTfRaPahcmoyEauQixFxZyTUMGJWDTOfYvXPoPOgSsyaIxQpyV/cg9HQXOUiLk
	 wu2j/IQnCytheMbmA1fvWXZkbzI7ui/5dw0pO/X8IJ8Hh4LoxB9jvG2GJ0onELclPL
	 6WJfZCxg2RXng==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso43205231fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Nov 2024 02:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX63UZmtmCczKviYI7xvH1rO4yiAn/dtvBxf+zkG0CqkhS1FmCjz3j6wnoHUdEs65NrkAdzZjrYYBeuolA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEUizjeP6YcMaa8twrbKHycn5uA2lM8pgrBoZgYJCQQcJbijxU
	4cEmzOdXQBSsThpzPA99eGxsTO9Z/rr3nXT7MZYcWlBq90sIgSFxOZEpjQjY69UfdF/HBjnVWXl
	obpFVHHpc0UEPwejgFP/+XMF+58Y=
X-Google-Smtp-Source: AGHT+IEqeG8VCff0uhjP4V5ORLaNGD6KRrpJIJXC1kxDqwtW+gAEc3mfRLYGB8V+37TlYDdzVpYd4mw53pqQuHqGPG8=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr47293611fa.19.1730541552417; Sat, 02 Nov 2024
 02:59:12 -0700 (PDT)
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
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
In-Reply-To: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 10:58:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 2 Nov 2024 at 10:45, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > While testing this patchset I notice that none of the crypto API drivers for
> > crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> > system that uses those algorithms (such as ext4) just uses the library APIs now.
> > That makes the "check /proc/crypto" trick stop working anyway.
>
> What's stopping us from removing them altogether?
>

At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
sha) via the shash API.

There are some other remaining uses of crc32c using shash or sync
ahash where the algo is hardcoded (NVMe, infiniband) so I imagine
those might be candidates for conversion as well.

