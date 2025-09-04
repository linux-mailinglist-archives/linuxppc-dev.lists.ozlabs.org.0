Return-Path: <linuxppc-dev+bounces-11705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F2B43503
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 10:10:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHXGz5WcLz2ywR;
	Thu,  4 Sep 2025 18:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756973451;
	cv=none; b=QHFAc4zWkPiXpi4tKim7C+l220YjF27nYm2YqHE6NsNHuOM5WcoD22rBM+xhhN8rHPORHgivopJOM122BllQXAB3US4e+EYnrYcZjsLMBkB2NHRxN31n1bjQTWSZg/1IQK47cK/isBaXSh5fI0ARnLHG7GyiflG8KGgkG4WpE6Cl/a47xCmaGrw7lSX/Xwf4bOXy6pr0ii743hPHr+EYHd8W9YgnpKsl3/0YPSdztp8/pxSTEEgnfW9Le/2CxNfc+gP42l5nidh2cRhLhX+Xprb1gnAyMfjsq4URMCZVrNMnOwkpj7kdMUEzZBK9NWXPqUKrcaSH6+A1WGmLYzUUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756973451; c=relaxed/relaxed;
	bh=HoP5rZhN/wcN0s5V5G96zFIhY9AxyhN0FPTyV5jomNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEkcNJzd4gDn3Ekc9ytPuJFYXCZvQ/jEcAd9xZPZz0hjuFebQrObViCgTXdjDE7RgDt51Qx+wNk4tf0bQvdO8RIseUgi7jA0gHx6ZQYW1INUMNuAflJcOwfg+gHvT71efUb7p+Opl080Eoh+oZf9zanrrluEnmmxxtlh62DnvraiclhqlhrB9192+4knVs62wjbpcINYaDWKqb4DHGHoBOk03dc3XLXqOc3IuD+JzJLQ4XyqDALBvarziHUeNw95fuQ6r9z+Kfi1c0OA2KIpUlzUUreesRhd164T7m2/cGdgSjVytkhbUW+YuCRRnrJe1eZVpwjkiWDVVxcIMjxWsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHXGy2DJ1z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 18:10:49 +1000 (AEST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-544bd485420so329558e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 01:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756973446; x=1757578246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoP5rZhN/wcN0s5V5G96zFIhY9AxyhN0FPTyV5jomNA=;
        b=FLTm3EIDMLNscWsQ4nu26BEGfvkgBHR3Aiu0XgpvwyYmEIAdKoD4DStMpD+vRtP5+F
         D4XVlFRYX3veL/XbQvL7+yFAHH1ff9JB7f/h5gssOvBarB7+Mryq/e1xqaenH2uwgtS4
         rBDbVubVBf4z0LQrPj3rAYWD45OqQYxZ7Oq70MR6fmHdNf1T5gRFDreiscMmrQbWF4yX
         o4UcYCK5orcsuKrWmYzP08Fa+LDclxK6alq9oDSKjLpBB7Hhusmj5OPNJ//wi5Za3LUe
         mgTK/rKCZhS8n1zSTMLtEBlMnSRnjDGg4OGd8XB8Cp6baGyZYt9dreBwGzhvfHMEyF/j
         JbYw==
X-Forwarded-Encrypted: i=1; AJvYcCWNCndStwUu+Vk5pK+h3Eh3NIZJaJ3FV1Ia1IZ6VlhRuSH5PGMd8ebASxSP9mG3SsmqEO2Ubtv7zFfJL5A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCkok3sVC3HMeecyTOHAtxG7Tf9Ne8MDXtOWc8C8ZJ1E733OrI
	oZoxOo4L/R5gOKL0MBpGWPiNBcRZGah0D0uF4YO56iWTP9cW+kZdKRvVsdH3D4wA
X-Gm-Gg: ASbGncsfS6bORNwc7rj+6OKBTEfSgis7QFy8SqSJ4NEADgcLa6u9wmHyeo5f/R4WusT
	VyN0l+ncrPdgjwWiAfvVyHULJonURZYX+TeI0k8Q7LgTAJd9GmjywINTPFLz93GbMcONunadNEd
	Er39RIYlluBewT+jm6yiZKotX7euzK9xakDcuT1gP/BNXf2iS5vtFLNgjSh7NntiELR8LziNi4d
	wy08ZJuwc3ongV/o2YhAhlTMOfIaW07HcyQKfgqtTlrVbT42dqP9VWXvP68U0x4x8JQpg3EniZq
	zahNqnea4rMQKHqLo7U2eBYsLs4ApQGI3DWwlWBEpB4Tf4mTzcQJ4OfaDh/ioRvNsNZq8qTpWji
	lURc/2tFy7kjNXvWDf5VR0ikEVz2rCCY419Mh42F5qaxfobTHPh3PE4pjwfwgP/l4eHYMLlM=
X-Google-Smtp-Source: AGHT+IE3UXQqMMJMeRuAlHDSM12Bt5J/ZfC/KaxJNvrobrhRQoSu3DPitDsJhlMJhN0NfM7HIe/6og==
X-Received: by 2002:a05:6122:2087:b0:539:1154:d149 with SMTP id 71dfb90a1353d-544a028dcebmr5636565e0c.9.1756973446070;
        Thu, 04 Sep 2025 01:10:46 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-545e874c737sm332872e0c.7.2025.09.04.01.10.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:10:45 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52eb6872bd2so319267137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 01:10:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlHA7pG6BEet8F4SxPqMakW/Qb4z2M+cyfx68Dt4ihgEZudIfLGI48d9wn+/wTQCeDCgz6DfkjkwdLU8o=@lists.ozlabs.org
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr2551182137.20.1756973445172; Thu, 04 Sep 2025
 01:10:45 -0700 (PDT)
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
References: <20250901201815.594177-1-ebiggers@kernel.org> <20250901201815.594177-2-ebiggers@kernel.org>
In-Reply-To: <20250901201815.594177-2-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 10:10:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrJmj9jHJp5CEtzBJk6jiN81ZwmTAogc07U_P9KgyEjA@mail.gmail.com>
X-Gm-Features: Ac12FXxrq9L6kDoaKUhsApHE-2MwPE4zmKHFkt6Jn14vX0EwMHLrIbnzAnxY_AA
Message-ID: <CAMuHMdWrJmj9jHJp5CEtzBJk6jiN81ZwmTAogc07U_P9KgyEjA@mail.gmail.com>
Subject: Re: [PATCH 1/6] crypto: curve25519 - Remove kpp support
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 1 Sept 2025 at 22:29, Eric Biggers <ebiggers@kernel.org> wrote:
> Currently, Curve25519 has both a library API and a crypto_kpp API.
> However, the crypto_kpp API to Curve25519 has no users outside
> crypto/testmgr.c.  I.e., no non-test code ever passes "curve25519" to
> crypto_alloc_kpp().  And the crypto/testmgr.c test coverage for
> Curve25519 isn't particularly useful either, since it just runs the same
> list of test vectors that curve25519-selftest uses.
>
> Therefore, all the crypto_kpp support for Curve25519 is unnecessary.
>
> Remove it.  We'll instead focus on the Curve25519 library API, which is
> the API that is actually being used.  Curve25519 remains fully supported
> for in-kernel users via the library API (crypto/curve25519.h).
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

>  arch/m68k/configs/amiga_defconfig             |    1 -
>  arch/m68k/configs/apollo_defconfig            |    1 -
>  arch/m68k/configs/atari_defconfig             |    1 -
>  arch/m68k/configs/bvme6000_defconfig          |    1 -
>  arch/m68k/configs/hp300_defconfig             |    1 -
>  arch/m68k/configs/mac_defconfig               |    1 -
>  arch/m68k/configs/multi_defconfig             |    1 -
>  arch/m68k/configs/mvme147_defconfig           |    1 -
>  arch/m68k/configs/mvme16x_defconfig           |    1 -
>  arch/m68k/configs/q40_defconfig               |    1 -
>  arch/m68k/configs/sun3_defconfig              |    1 -
>  arch/m68k/configs/sun3x_defconfig             |    1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
(although this would be handled during the regular defconfig refresh anyway)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

