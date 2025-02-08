Return-Path: <linuxppc-dev+bounces-5991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74BA2D7D9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 18:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqz3M0nk8z2yF1;
	Sun,  9 Feb 2025 04:53:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739037215;
	cv=none; b=OyTGdngzBApFJpjwymTPCAIWrP+dXLZFOZvk6JV+CAOOLNaZ4kJHlLnU67wgBa7h+gjyUoHm7jQ6NW/sEb/r1gu1rHD7oRp+406o9SWLf/eORzJZeaDuuNhMhuMcAi+A5FOaKfj+ZcMHhKTcCvdrgWEsDj7soYrIrjTI68dhywvBacj1gFDe5Ico0jMahbfc6xol/Xq4D6ANOuu48J/7cU44hX8hfVuKKquEl3CMeo4ZPDHEBpzIHtEZAZHS0CrPPhOz+8okx4xNhp2wMxo3BHcjA7FWNyh/hllFKj/41FzEe5PbnBeGGpK37bsERGzTxa6yLboRcbgzlxQniNXPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739037215; c=relaxed/relaxed;
	bh=GWCLWUGpRzNN38qDSRAHapFkwtjzVMbT+fgTsmO02GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBLDe80FQoqhzg8hxel16OtDEjz+g6iPU/nSk5H449TZHvGe2U843JEL5ax2Is8IEyYeFn2eHF2mj1BsaozXKPkuWHBOAz6WcUQezLJQ38yiKy2MfPflMXgNG77rQVjTueFmxdgC+G4kR2TOvhSOSxRwOo7pEi+RIcooObkv5riUo9KfBdUMDr4A8f6dGSSIfF7vEruEo9HlwuCTysgfwUZ/hzavZX084PNnMS+XFDg5O0u6C0g4mjhIdUtTP0ztsIiYv/tadtUXrRUR9HzbwktGzs3yg6rfS5AR7YZKq/OBRcO3cLx+GONucgGliZtV/IcIB+shJMLWDYJiRV7Pgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eGjfA/n1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eGjfA/n1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yqz3K21q2z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 04:53:31 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6f9cc6fefa8so4599677b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739037209; x=1739642009; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWCLWUGpRzNN38qDSRAHapFkwtjzVMbT+fgTsmO02GE=;
        b=eGjfA/n17ky/nBzdyxOdBFsxpXd3rv6WQkosJKXVu5966oHRf3j1nOe0/Z7TJhm+Ae
         n+yhMvZDsCQehazfZPflGVbKMFkRJTyh0y9HFQ5gAfLlqqbprEBXH2DD6ylPcNPODg7C
         4amJckss+cNQe1sZa6B9/RcXc845bzpBdKDYmNMFsn8dOdY+FfSoM6fqHE0mXKnr15ac
         WiaUME4ZnYfkXH+FCL1C4+QOnO7KKv0c5lniDvBQvWUARidQ+EHwRNmgAEN8A8E4AXnS
         suYJ1RF1kItRW1TQpoXv0Wce7M/eaeNYU88SE83ZunKZzUvSbpiJHLMiNFg82vvxarP/
         ZuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739037209; x=1739642009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWCLWUGpRzNN38qDSRAHapFkwtjzVMbT+fgTsmO02GE=;
        b=k4Pi37oQk2bF0La0vk6cXh1lwC+5NID0KSAMHEJzIkilMDZ2lv78pA7KbUstdkImNZ
         Bks42LpJQQDy5riDv/hgalGZdbXhI93lNE93+aJ0BplGeCkggysoIS7f3WCLxQoBSsKc
         0xJ/PidNAekieoPnlvU370Z0UJJK5hLOwjiq/gTE62+lZhlYw5mEGEDJ6LiWGwzQP2k+
         nSG5Sawe8lVmkRdUpIYk/ywZZd8bhr3jk3MlX7updLzIK1GUPhIuqitru1zeoMT9q+2h
         uqGpo7gyhGjvjOUaFaqxnc7MpL9HwkPqe8q//oHs3CxhE0el0nldD8Tqz5GrakX768ND
         tsLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiuXC8J6PGacdN4n8xp5g39ge4MgYwXFWYb6wbG4nZXq9J+hkCo27PLB5/Fu9VmuMCKx+Y8mPyXok3qPI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUF3O6rLLLmxfp1B7nt3U5/C711OL83aVsYcAFak9Y+Kr17f0k
	U31IVHA1uNpsS+B++R3wS/iy3SWDAVeN20I9E3qT5hxxJ6qzhtnk
X-Gm-Gg: ASbGnctjp+WFEUufmQboY9Uj/pckcHbjCQQ4hCxXojRz+vZ5QSKi7rgigSidzayTe7w
	HZyWOMgfjbYNjOpKkWvS8+VQ1eyTQBTKSLtZkkgvLMw3cce66JV/g7qC1LZ1rrUwIhV2mxQTBME
	hLf2jlOedCwmsxCkQ5LY3rbSar1pv+9LhminzqlGxa7HxfCWTs57RCB/QsfvkPaWodomeq0Rcpk
	fzC4gzg+6WvvG1azwg0T6CjCvc8F282tvmvuo9dcBPgMbF753NkxG4idmsMIMupgtUdYu+6upet
	D7p1DZbzaRyq/9I7Tx1ZJY9ZWP+xu5thHlrnWJqPmEs9bT48kyw=
X-Google-Smtp-Source: AGHT+IGharplEze0gu0SCa8jNPf4PFwFx7r6QQdncnkwjNrUp7r48urY21da4KyUfmTiooRho9XVbw==
X-Received: by 2002:a05:690c:74c3:b0:6f6:cd43:5468 with SMTP id 00721157ae682-6f9b2a2165amr71225727b3.33.1739037208799;
        Sat, 08 Feb 2025 09:53:28 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fceff39sm9570747b3.19.2025.02.08.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:53:28 -0800 (PST)
Date: Sat, 8 Feb 2025 12:53:27 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
Message-ID: <Z6eaDuXnT_rjVSNS@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being printf and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 bitmap.
> 
> I've already sent out a conversion series for each of printf[0] and scanf[1].
> 
> There was a previous attempt[2] to do this in July 2024. Please bear
> with me as I try to understand and address the objections from that
> time. I've spoken with Muhammad Usama Anjum, the author of that series,
> and received their approval to "take over" this work. Here we go...

Take over means that you'd at least add the Co-developed-by tag.

> 
> On 7/26/24 11:45 PM, John Hubbard wrote:
> > 
> > This changes the situation from "works for Linus' tab completion
> > case", to "causes a tab completion problem"! :)
> > 
> > I think a tests/ subdir is how we eventually decided to do this [1],
> > right?
> > 
> > So:
> > 
> >     lib/tests/bitmap_kunit.c
> > 
> > [1] https://lore.kernel.org/20240724201354.make.730-kees@kernel.org
> 
> This is true and unfortunate, but not trivial to fix because new
> kallsyms tests were placed in lib/tests in commit 84b4a51fce4c
> ("selftests: add new kallsyms selftests")  *after* the KUnit filename
> best practices were adopted.
> 
> I propose that the KUnit maintainers blaze this trail using
> `string_kunit.c` which currently still lives in lib/ despite the KUnit
> docs giving it as an example at lib/tests/.
> 
> On 7/27/24 12:24 AM, Shuah Khan wrote:
> > 
> > This change will take away the ability to run bitmap tests during
> > boot on a non-kunit kernel.
> > 
> > Nack on this change. I wan to see all tests that are being removed
> > from lib because they have been converted - also it doesn't make
> > sense to convert some tests like this one that add the ability test
> > during boot.
> 
> This point was also discussed in another thread[3] in which:
> 
> On 7/27/24 12:35 AM, Shuah Khan wrote:
> > 
> > Please make sure you aren't taking away the ability to run these tests during
> > boot. 
> >
> > It doesn't make sense to convert every single test especially when it
> > is intended to be run during boot without dependencies - not as a kunit test
> > but a regression test during boot.
> > 
> > bitmap is one example - pay attention to the config help test - bitmap
> > one clearly states it runs regression testing during boot. Any test that
> > says that isn't a candidate for conversion.
> > 
> > I am going to nack any such conversions.
> 
> The crux of the argument seems to be that the config help text is taken
> to describe the author's intent with the fragment "at boot". I think
 
KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
boot-test bitmaps. Even worse, I'll be unable to build the standalone
test from sources as a module and load it later.

Or I misunderstand it, and there's a way to build some particular KUNIT
test without enabling KUNIT in config and/or re-compiling the whole kernel?
Please teach me, if so

Unless you give me a way to build and run the test in true
production environment, I'm not going with KUNITs. Sorry.

> this may be a case of confirmation bias: I see at least the following
> KUnit tests with "at boot" in their help text:
> - CPUMASK_KUNIT_TEST

This one doesn't count because the test was not converted, it's
originally written as a KUNIT test. I am happy when people bring new
tests in the most comfortable way for them, and I don't want to push
them to use this framework or another. So I didn't object, and I'm
thankful for this contribution to Sander.

> - BITFIELD_KUNIT

Same here. Plus, it was written long before I took over bitfields.

> - CHECKSUM_KUNIT
> - UTIL_MACROS_KUNIT

> It seems to me that the inference being made is that any test that runs
> "at boot" is intended to be run by both developers and users, but I find
> no evidence that bitmap in particular would ever provide additional
> value when run by users.

This is my evidence: sometimes people report performance or whatever
issues on their systems, suspecting bitmaps guilty. I ask them to run
the bitmap or find_bit test to narrow the problem. Sometimes I need to
test a hardware I have no access to, and I have to (kindly!) ask people
to build a small test and run it. I don't want to ask them to rebuild
the whole kernel, or even to build something else.

https://lore.kernel.org/all/YuWk3titnOiQACzC@yury-laptop/

> There's further discussion about KUnit not being "ideal for cases where
> people would want to check a subsystem on a running kernel", but I find
> no evidence that bitmap in particular is actually testing the running
> kernel; it is a unit test of the bitmap functions, which is also stated
> in the config help text.
> 
> David Gow made many of the same points in his final reply[4], which was
> never replied to.

Nice summary for the discussion. Unfortunately you missed my concerns.
Which are:

Pros:
 - Now we switch to KUNITs because KUNITs are so good

Cons:
 - Wipes git history;
 - Bloats the test's source code;
 - Adds dependencies;
 - Doesn't run on most popular distros and defconfig;

So, no.

Thanks,
Yury

> Link: https://lore.kernel.org/all/20250207-printf-kunit-convert-v2-0-057b23860823@gmail.com/T/#u [0]
> Link: https://lore.kernel.org/all/20250207-scanf-kunit-convert-v4-0-a23e2afaede8@gmail.com/T/#u [1]
> Link: https://lore.kernel.org/all/20240726110658.2281070-1-usama.anjum@collabora.com/T/#u [2]
> Link: https://lore.kernel.org/all/327831fb-47ab-4555-8f0b-19a8dbcaacd7@collabora.com/T/#u [3]
> Link: https://lore.kernel.org/all/CABVgOSmMoPD3JfzVd4VTkzGL2fZCo8LfwzaVSzeFimPrhgLa5w@mail.gmail.com/ [4]
> 
> Thanks for your attention.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (3):
>       bitmap: remove _check_eq_u32_array
>       bitmap: convert self-test to KUnit
>       bitmap: break kunit into test cases
> 
>  MAINTAINERS                           |   2 +-
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
>  arch/powerpc/configs/ppc64_defconfig  |   1 -
>  lib/Kconfig.debug                     |  24 +-
>  lib/Makefile                          |   2 +-
>  lib/{test_bitmap.c => bitmap_kunit.c} | 454 +++++++++++++---------------------
>  tools/testing/selftests/lib/bitmap.sh |   3 -
>  tools/testing/selftests/lib/config    |   1 -
>  19 files changed, 195 insertions(+), 304 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-bitmap-kunit-convert-92d3147b2eee
> 
> Best regards,
> -- 
> Tamir Duberstein <tamird@gmail.com>

