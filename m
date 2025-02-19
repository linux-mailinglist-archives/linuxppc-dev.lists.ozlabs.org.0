Return-Path: <linuxppc-dev+bounces-6357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23613A3CA32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 21:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YypG23WBSz2yvn;
	Thu, 20 Feb 2025 07:41:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739997690;
	cv=none; b=PcvgQpm5cKIzO8oHTFd8N4yrQV1NXUEioB5NZzCFM2Oxx5cwlMxlXu+2qOGWwEee4aiGHinhpff3yrb3al1ZBePXBRcEulVWZpmbs6gtpPQNGSKLH3jDS+mzeGK50oN0FgNClRvS2tur2FUssgob18Ke/q8E0/pKDy62ZbC0evJE9I1ekQfpG6DmxM+7035XUUz5bpV3IXQ5HoNF6t71B8lb0gsh2fxTQom0qLrHDcVYvRM34nse4tH1LX8M+DgFJ3+quGoT9uyg33WYM2dCLRh67SQeScCOMmsyG54f8I9zgtGs2OWPdnBM6rJ0WYFBaRhUokc7xCvOJI+CIYsJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739997690; c=relaxed/relaxed;
	bh=uQWKjia1YEhq+PMd/nXG3fmWx8U4DeTtcDG7C2yzBs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcNZfwaQfAx7Q+aJE4NJqESnZf4BShNm5mOWb2M65uemgkXetB3mMWfPYu3A2jQn98cw8CoJIwR0i4fMfrg1AKlLDzoKZw2N5erXjVAOzBEnRobLSFeWZxHMSCfAC7FE69y0VGH6lPbmpfkYQGXNZEA93UwtyF85bPW4XM8+rg18R2gbrwYRayvR5ZaWxpLdRiTYbcCm75lOnj5vA01CbSDqj8ihpcdY/tLLP7Gk4FAWUqcZWU48GnsgXC5OQtJiLZlGjUv8OWXkvp3T/ub6EJpT8rC9IXKOi6zPI1Hb/3LoZIfQJxJBZgznMx7ZM7QOZPmlloyvxBXHsZJKTeF8Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=ZvuWomky; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=mail@rasmusvillemoes.dk; receiver=lists.ozlabs.org) smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=ZvuWomky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=mail@rasmusvillemoes.dk; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YypG03nYmz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 07:41:27 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5461a485aa2so230292e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 12:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739997683; x=1740602483; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQWKjia1YEhq+PMd/nXG3fmWx8U4DeTtcDG7C2yzBs0=;
        b=ZvuWomky14kmGUzKi9yZVwT6pcnc3i8NdnLhkizfIsw+otKAy5cdQ63aNcQ7tJptrW
         DmF37cUUHCIGW2LPClvcgpMrVjdaYvlh/dOzTggOUQ9D3yeOvWTnTCyKwRLLkPkltVsq
         d8e8FCDMn/MBJrrQ9P3smU5zwXWrUNIE9RpLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739997683; x=1740602483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQWKjia1YEhq+PMd/nXG3fmWx8U4DeTtcDG7C2yzBs0=;
        b=XBda8IzPbeeZdfMBlBZ0ms419IrxOgHdm4+ZqX7gPvFp2z1nTKI28Cwl9B0NuvbG7m
         ltU9Ch1f4gFKmRBreHg+0pEWhHGR7KrBHQvUcvMDbItZg/HMkAZ4gxSvElw94HxWstSi
         UkhlEExosrBLgqdBatIP/1DoYNEzV8tu0S6wktvzjmuX0KaLWiZOyxaFxbtA9oMmNGIl
         sANzjy5N8Xq+oRX/Xvd9H065g55vm/O8eSMlBTSN+oo5C6nQC64XjRDE7mRsfeWGwI+p
         Nd1dZ7Ekv9C9H5ntsXhXQNrB/KKyaAZ18TanLu8KSLF/2FWIQeXew/vpu3dEOio9uICi
         0vZg==
X-Forwarded-Encrypted: i=1; AJvYcCX5i6JJukl2GPqk3VSDilX0+f6akEgn5d587yVRHRmNH3ffCcgPYu9WhY0zgZ/HLWiSvsf8e8MQd4/Ci1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/0kheAlo9d09DtOZOY8rrXo5thDUitxb1rdTf1rBqcxMnrVBx
	uQwvmlLUfOXHm5KSfruNGRUwkfOrzMcUvsOdxrnKsuieN124DQclwGn2TN6RApCYxn7rPScUgD0
	5kr9nflAqCLMk2cHCDjsp0Av5rwnYvKWegBzeTA==
X-Gm-Gg: ASbGncsRWPzFyYEKKIkVemTMD2F015gTjuh6BM98ZIqT8PlyL+KQuRBoPfqTgOVO+X0
	tfVZcL3NBsMDTO8pyET+3NhkCfb6feapPZnyJ27nEKX8rZEsJYYJpbY5P/3q5yeNR/3mCjBAU
X-Google-Smtp-Source: AGHT+IENNNpeaMlkD/fiQQAYZ6iJNFdOYrpRNg7fkEna3OdCDK3VAQtFcLuzSuMXXgumt+4ZaeEHehD2gwq2A0TLKZo=
X-Received: by 2002:a05:6512:2398:b0:545:ee3:f3c7 with SMTP id
 2adb3069b0e04-5462eef4e56mr2154420e87.30.1739997682815; Wed, 19 Feb 2025
 12:41:22 -0800 (PST)
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
References: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com> <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com>
In-Reply-To: <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 19 Feb 2025 21:41:11 +0100
X-Gm-Features: AWEUYZnPvEz-Qu0Q_eOs4K3mND8N5X48foEj8aBLKco5JWWCbd2AeY_UnbAb5oM
Message-ID: <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] printf: implicate test line in failure messages
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 14 Feb 2025 at 22:53, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This improves the failure output by pointing to the failing line at the
> top level of the test, e.g.:
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
>   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
>   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '
>

Actually, I'm not sure that is an improvement as-is, with the two
different line numbers being printed. It takes some thought to
recognize which one is relevant and which one is not.

Can't we have a variant of KUNIT_FAIL that allows one to pass the
file/line info when the caller has better info than the location of
the KUNIT_FAIL itself?

>  static void __printf(5, 0)
> -do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
> -       const char *fmt, va_list ap)
> +do_test(struct kunit *kunittest, const char *file, const int line, int bufsize, const char *expect,
> +       int elen, const char *fmt, va_list ap)

This can't be right, the __printf attribute must be updated accordingly.

Rasmus

