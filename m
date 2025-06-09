Return-Path: <linuxppc-dev+bounces-9219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A89AD19A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 10:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG4Vk4984z2y2B;
	Mon,  9 Jun 2025 18:15:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749456942;
	cv=none; b=dOy1rrI1qpxOBzeFSf7EPsHzldR34aV9cPr2F/026aIbr33LnWGlwLVDI3ZOQUmMA+Yko2r5nhjI2cTcd38TkCiwfcFqO3dqGd7HzU21KhsbH9nUvHawnAsqqtgEMK85t1AdMGrMx4a5DX8Z4JuXeQMqEOePfp52QZmXcEolAajHJmH/c2EPoR66SZC96Y0XwEBAvqwv+0dwicQe5ZkIx5Y7fjpXd5vKnc5F9asViF2kgpNo4qIeHYD556E5qAUoHQeN2HH4NWKQDzsQSqeVREo6wTm28pQRYQ0lmQ8f3gs8to2lHIh8EpWIZ/+dyF48tFc3Z4f0KiMlhnjoU8SuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749456942; c=relaxed/relaxed;
	bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=on4ZKuNgaaFALySw1eW/fK3A1fmo+Gx++ujMHLv1eegTK5H0IAIdGjOXa68loH+SlS4icfScnNFGpAQEOrCgoT3QV8zviAy4AFB0sQmRkTz0WhqRp2B7M9NSSYrntTvrI9/193KNLAJsotfVJPidHcy82skuAW5J/kcP/7xo7+vlYRehYh0vmzMzNYH6dW2A64fXcGSFdLU/eRKuZMp6hgdWShs5oJ34WK9sW/T6fTUoseF6w5ZR4jn34oNgoV12H/AibzKRk0SkGa3xMLvx75l5HvXjskfCX+QxdXy3GfxQG4HsSH9FAAcuxHlXBLMrNYExb+mRswti9aZsWvSCzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7kcuAzZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7kcuAzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bG4Vj22Nsz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 18:15:40 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fafaa60889so26718816d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jun 2025 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749456937; x=1750061737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=F7kcuAzZUT9H+MWtTAWkB2kzpUxVqJeKi4JvFoFfMWUkf5uhRj59pz5nAjmQfdgFYk
         MLgTd+TKhk1oKPfem7m9ttV2MrtEW8xNhYvZ+tOrzVW2SsP2sNhCEWDTRuVtLu1bn585
         KwfNDVbD6vWV6espFH+r3zMp3V7YttsIlDrQH9AHVXn3TLY5JRiZCVpF4tKOqrllCYFo
         TlBmxyhypREcFYyUPaEuvpoicqMIfwh5CcNiGjEwF6r0Khu1Sm3PPQbZq/HeWeG3zpir
         b7QxKuOav+JKS/FCy6Y591O6fHR4I0vYb9HnOjiud6E/Er/oukTHgZChG4WKezCqVFc5
         wtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456937; x=1750061737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=gL6r9FOr44GvgpHCUn0D0WVYScTO9+sMJMdIOsF/IL2n90a+W0RxGWNPjxCJs0AJkR
         uU5Iht1wBECQMFk3Ur7rfqPA+ilNbsGnZEwordgGG6YYkstxNIabOLZAWU53IPrJEbnk
         LN0BN8N1WYUvvxQNttVd/P7L/DMcPW84CMlYJfionQgKPUI+byzU8oXPp0Y/w7qSPIkR
         ov5sfc28c3TAcFuZxq9KhM/hxdgzIMnkWZgWr/nxlhcJ0SXfo+rq4wh4az6RUmWXXw3F
         yMA183D9s4FrEvT3wHR22i38JWk7sW1WvJ7SxrcHk9R401YG6dWPBK7wVxUHRNms0X/4
         duSA==
X-Forwarded-Encrypted: i=1; AJvYcCUGRXQSWtHtShKAX64C2w0tcbU7HU9pC69ADX2tTnfKRNFij5QcqxuXAQ8KCun++jUF9IWLC3ihBTnYxNY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwObKFYhyq+ZiGuD3vc+z4HCY8zVyl8nF0v7mOlnMLSZW0yKNQV
	tyeh7gpD1W1MqpNpZ+yQXptiTCc0fJ2bDIAOufDhutiTnJTH2cHNkhprnniyx6C1sVHN/dVw4R7
	lHs8EZZqJOvmWw0fW2IJwRV3o+RvtFoQ=
X-Gm-Gg: ASbGnctIqQ9b7eqwh34dqapHqs/gJgzlWkxtDGZIQ3/+HlzQkkmE++/1karop0Gb1aJ
	5gVaJpIFYJx0ulPo/0acVEZj2n7tyVchoFmS4N4IPEuqFBJYyI7oAPBkl4ulONNSmkhRcgCGkzl
	YyLGDaHDlosZUQ54ddvnSUYMnOlHCbY39X
X-Google-Smtp-Source: AGHT+IH9me4CEdVFtIOCuIg1XAKf5VF3TkyjvnvcV85fkEmF6RBw78F2p/ZOsZjFija3GtR5SXP0ijToaYQxk0VMGhA=
X-Received: by 2002:ad4:5f09:0:b0:6fa:c81a:6204 with SMTP id
 6a1803df08f44-6fb08f50942mr228433326d6.10.1749456937558; Mon, 09 Jun 2025
 01:15:37 -0700 (PDT)
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
References: <20250607200454.73587-1-ebiggers@kernel.org>
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 9 Jun 2025 18:15:24 +1000
X-Gm-Features: AX0GCFtpUUxU8yEaZey6YSh4XuBhQlOITIBZOiB21tfxDGQbnIThjp-0HFxjxHQ
Message-ID: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Eric,

On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/li=
nux.git lib-crc-arch-v2
>
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
>
> As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
>
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
>
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.

Quick question, and apologies if this has been covered elsewhere.

Why not just use choice blocks in Kconfig to choose the compiled-in
crc32 variant instead of this somewhat indirect scheme?

This would keep the dependencies grouped by arch and provide a single
place to choose whether the generic or arch-specific method is used.

It would also allow for alternatives if that ever becomes a thing and
compile testing of the arch-specific variants if that even offers any
actual value.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

