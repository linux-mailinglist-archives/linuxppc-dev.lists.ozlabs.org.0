Return-Path: <linuxppc-dev+bounces-6022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7FA2E5A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 08:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrxQB3bsJz2yNs;
	Mon, 10 Feb 2025 18:43:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739173394;
	cv=none; b=ZZqNkE7Ic11qK4GFXEyc7qPtr7ND3tDQklOA8K/2jGLE1fosaJcfYgfDjnvmPNC9FyodAojECZsZfYEkuvOArOdY8G8+tyN+1eeXw+LO3AvxNhCaf8b4VaMAylQUA72QOEoA6PeTbhCZy1csDT5lABOmMU3IwYq6nc7LXpq4n/kt52HP9wlgKmf5TXCiSXOjPTQgc99eWEMa2xluuz0vDfL/blroU+Wjn/l/2Ud7ezAUi6cF98ZxSiO4wu/X+NIdb23it3PAeMiSjSEzhoA6P6L2ETnuKUA49GX70nbwDzOCQimKQotNa20nV2jvTAJKhT3othUR3336CFKB0OBW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739173394; c=relaxed/relaxed;
	bh=l1HAXrO7siUncPkj5ofDqgDnxHSc+KQ8zsK7WabjOVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhNCLKyhvhbGFdDL1jsaY4nBqYn11mma4oRwCjj8cxu3NVAsuL3633NiD5O29y0UPlQ2EvQZGA9qaQDZjQYLPXtW50mOQ7yhyUcltEP2ulZDaLN6dGo4WrUSwlQ4jGDcZvXqiV3Pea5+oka6+K8cODKUJ15KzOEutTls7IVHJCI5Lw5udssf5jGtTt16QcuuTxsx14pEj5MLOcularK70sKUoNPq3pYScrTLrmuROejIn59f8ziSXs4a/q/U32DFCHh4/13yxhHdlGnXWcV5OQz6QhoFqyrasOh6umQcE+6AkyFFzkx+1EderTuP1VwdD8g44MWaZD5s/26deqIyEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.51; helo=mail-vs1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.51; helo=mail-vs1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrxQ90pTpz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 18:43:12 +1100 (AEDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bbc406499fso217218137.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 23:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173389; x=1739778189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1HAXrO7siUncPkj5ofDqgDnxHSc+KQ8zsK7WabjOVA=;
        b=JPoyBsm9qBpqQUq6XA3IRNlOP2ngX1RiElPDcD6xzZfL2WZvaXNfGTaL6BA6aesOXP
         LIwb55pgCun7qV8Fnud74FgxjOytoYfCq8xCjS3sRmAL2K88CTq2TB5JwczG/jjVpdrI
         PSStp47jwiCat89241UlepjsNzbnMfjLMkEf7a6bLhCs6nZzHx1WHF7Suf/he4TXxSzv
         5q3GkQpH01qUUSPiMn3+Cl8BfjLxiw6mVTYpQJ6oUu5bb5RiJLDgTm3xNWr6BAMzhxh1
         KhIBw3GOKMX1PO4vgloSqtY/954wkkcLHyrcZyD5neffy9VpymdmU9+j1Tiu/tCmWyk8
         zsfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+B3EEocxkoL96WQ+WmZFAOoWDKrgb3vd4nxHifOpl9SeMU7r4Y4QdMBTUtC3Fuo4OmBhbOZFUfbuW9c0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwcJGX/0+127NXh73SmPtGIWEDdGutamf/MrHbjz7RH5m6kXzoS
	AxFROVrVjdp4NkyLlikpaVWXv4oS30quCNUdchf4FHpqwjHGBQy1Bmq4S24a
X-Gm-Gg: ASbGncsEr+8r6HHkGROBW21Wd40xDd0Dp1PUCHLZkPUnrQx2Cz8ikUPmWnduDmiLnz6
	Wd6vKkHfebxavaUJ6gvh0uHP69zSTvJ/ONZBKJuf7y1cQQzzj60uPJ9F9K0I/LrYN5rpErfCTzt
	nI5YQR5HlWYjiJnSSQ139F95lZnjYTzeL9DB2vHHNMuMit2OzTSyLHKWSUTMVyR6y6l6jomOoN1
	rMkiHshPW0ZbfwLVl0cFMBfZu+nPOVGb+AAHgGzR2W0i4gT/fdBDKbssF5yNDAk6AX0MQerk1B5
	pQ2I82lmyooN4UxIN+qSB/GxInGaMKUqRGL0wh+rnlV2g/p3NDtpRg==
X-Google-Smtp-Source: AGHT+IGkHNMz7q56DE12b2GGGBdqOrKIAoJMKKAjDncGh8g5UUayM0AWrcYrqgpJtKot3mVQ+rrloA==
X-Received: by 2002:a05:6102:161f:b0:4ba:eb24:fb0a with SMTP id ada2fe7eead31-4baeb2503e2mr3203510137.5.1739173389247;
        Sun, 09 Feb 2025 23:43:09 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d794dsm1563334241.25.2025.02.09.23.43.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:43:09 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbbab48111so336961137.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 23:43:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjT1SSfa3PoktVAarUy9hSavKsk3RfFaC7duKUvTAPVswLXQO0djpfWZL/BqFDPs3yd+XT+1q0vVkzYng=@lists.ozlabs.org
X-Received: by 2002:a05:6102:c54:b0:4bb:c24b:b623 with SMTP id
 ada2fe7eead31-4bbc24bc2e1mr2033659137.19.1739173388892; Sun, 09 Feb 2025
 23:43:08 -0800 (PST)
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
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <20250207-bitmap-kunit-convert-v1-2-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-2-c520675343b6@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 08:42:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ5vbhWsJgsGUny=9b4p0cvML+GkLJ=BmWnG9Q6FE78A@mail.gmail.com>
X-Gm-Features: AWEUYZkkTrEuq6WMVMpODBTYSjpUaxRBgiMamGpu9Ed_-WnWv5jDfkFeFpfmlCY
Message-ID: <CAMuHMdXQ5vbhWsJgsGUny=9b4p0cvML+GkLJ=BmWnG9Q6FE78A@mail.gmail.com>
Subject: Re: [PATCH 2/3] bitmap: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 7 Feb 2025 at 21:14, Tamir Duberstein <tamird@gmail.com> wrote:
> Convert the bitmap() self-test to a KUnit test.
>
> In the interest of keeping the patch reasonably-sized this doesn't
> refactor the tests into proper parameterized tests - it's all one big
> test case.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

>  arch/m68k/configs/amiga_defconfig     |   1 -
>  arch/m68k/configs/apollo_defconfig    |   1 -
>  arch/m68k/configs/atari_defconfig     |   1 -
>  arch/m68k/configs/bvme6000_defconfig  |   1 -
>  arch/m68k/configs/hp300_defconfig     |   1 -
>  arch/m68k/configs/mac_defconfig       |   1 -
>  arch/m68k/configs/multi_defconfig     |   1 -
>  arch/m68k/configs/mvme147_defconfig   |   1 -
>  arch/m68k/configs/mvme16x_defconfig   |   1 -
>  arch/m68k/configs/q40_defconfig       |   1 -
>  arch/m68k/configs/sun3_defconfig      |   1 -
>  arch/m68k/configs/sun3x_defconfig     |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

