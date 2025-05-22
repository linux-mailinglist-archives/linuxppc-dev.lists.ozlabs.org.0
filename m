Return-Path: <linuxppc-dev+bounces-8867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6659AC05BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 09:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b30Kx1BJ2z3c2Z;
	Thu, 22 May 2025 17:29:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747898981;
	cv=none; b=PN87xNzX9PTRTKbE8YY+DwP7Msiyx3OwbvPGPwhGjWHTOrsvtKx8VPVm8Ddy9V+cP2O3190vKKqRovpvSHAbN+bsu9WFhLEehT3Wb6aahrD9V+C0vcvyYX1jQLz3quH8XMdbXvibKsacgrS3ErpOG/FfvrS2zoeSc8NVxZtZvaIPlxlUdhprGsH136/wIXljISjxI9fr9Kco8QeuEughpiet5zGy7HLqWe7RLizQDwR+fHLWXfhZk7JWTJwMcqmDjwv1LczZZbRS14ivAC7gaTmHHO+BkqJnFbfZE/wOGcx8b7dFZ3kmNutjsCJTePSH3PnR1xB/W58H7vNMReEwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747898981; c=relaxed/relaxed;
	bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L528/b4zFa1+aOokr6c6pAdByz/2sZygDzSWgJiaQoyW5ycFUegyQ4qsyzbicHdwNsXFmHG6pX7qm9w/FT9Gl3s8oLX032zdiVFuWB9kQIfRo3HUSBlTvFtUs9pfzdwAsQ4jbp7tNmqPQUbrvQaJ/67jmWtrPFjHPo0ITD+C0HXIZT+BxrpS6fQnz5QFbyXB96mR5PykqEESLm9y7m8+xgxKxkjL2CA2LWTwYbGMZw9JdUiJLkwFP+UCC4FmUB6HNZu969pUega1p7YqFWowsQAgNdz8c22DuDzn6WFf1vG1Z5TNvHWxcIgq6YYhMY0xLeaiXA7C8MDES8S1i2tkMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.54; helo=mail-vs1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.54; helo=mail-vs1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b30Kv4T82z2yfK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 17:29:38 +1000 (AEST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e15f5a86dfso3586702137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 00:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898976; x=1748503776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=;
        b=xLP/IhfvBY55H4Oq7uGc26RTX8Iv0aFkbXix6yNVgf1hHgLpr8uwmMg2yx/SIZ49FG
         XIBYs9AkEPmyYR0pV30u97wWBrypMjmKQJuU3wyDd6FbgFjfhX8Rh9IYoBidgenEscj9
         yB/2Pam8i9EfC0rK3kLBQiFtltJBg62EOO3dQo9WU5HaWqcB326a/tuBF/MMQFA3cJ2p
         82e6BbUlvOTRb424AVJHZorJ0peoKxnjUyfl53fUTL0JzJbZUxWd1bpba9jQLdGCs5Uu
         QAbtqyVc2f7vLVMGnd1MK1Zb6NTppnkhWrSGYOiDALDyzC+b19oUmcxbS3WskPz4bEzX
         Gz9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbBpeh4baQD+zZvM4akmqcn29Z41T/uXid8HQZJXcz8deOGjns1w3qpchSUYDVRAAHG2jISvY6g7Shhd0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz898o5Fg9T6e1k8lZTNfca/BheTdn+L7soPgmOzw2mcY/VrOGS
	ZKgN4hsb85LyePIsnI3uSLWD+aQF4ADWDh/x6uB6NPedE696qaTHOpiyF79/rlDv
X-Gm-Gg: ASbGncsT5LF0MKnIroC103d+ZAd1Qcq5J3iJKWL0O8pvdwDmXh9InxYEVZUUQniZjZd
	C5f4DieHaGWXyTSC0IlJkB+vudIYBnz4JsjGY1Zm56w7B9ZkSicV9kwTHvTZ91MSwuzbQHMCopx
	5HAnCOiGyfOD84i7zGx5gtt4lFllw3IursFxqpp2WtfD5P+auzEkk85wRoIiLKNVgddRsxlaMf4
	GsnSbZEl31/nMNri2EkomC3w21fWGnabwAt6xeSUSAnP1wWRzkIHC8ltRna64QBBTCHOPML1OUx
	ahLFCqXMZXDkbqz7tCtxpODoE53wYhqCIPWWWw17k8gUZ6RqAl0jMThDwg3p3SQmbZK35J26RJs
	+R0J8AhbLulMWBQ==
X-Google-Smtp-Source: AGHT+IHAs1jZmM/KZRthJEfmqepErwAABEmt7pJ0CN65maPwp6JQhldaGmLZ+N3rYTAfx65mg0BxcQ==
X-Received: by 2002:a05:6102:334f:b0:4e2:8b49:9f96 with SMTP id ada2fe7eead31-4e28b49a1acmr12232194137.6.1747898975567;
        Thu, 22 May 2025 00:29:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e12bf147e5sm10179488137.7.2025.05.22.00.29.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:29:35 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4df9961f319so5167139137.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 00:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW63uyNfeKmHRwO8V1Kcp48XbKxVyPISdvaLNC9SwRaBg6o8QLzG4MZKdbLlluwpf1Xdb5A5oYvHQbg4Q=@lists.ozlabs.org
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr25153206137.9.1747898486254; Thu, 22 May 2025
 00:21:26 -0700 (PDT)
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
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 09:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
X-Gm-Features: AX0GCFsqKFm6qJMA3hsMqbJWzZuzklg0ynX2aADj_Q8qeZ9nB2XXIFQN5G6rIkM
Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andy,

Thanks for your patch!

On Wed, 21 May 2025 at 19:42, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.

"CROSS_64KB" (also in the subject; "git grep" found no users at all ;-)

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

