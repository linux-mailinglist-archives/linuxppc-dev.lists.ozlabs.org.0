Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0FE8326
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 09:23:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472Pjs6BTvzDrYf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 19:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=ard.biesheuvel@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="i6xKbxwS"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472PgQ59XMzDr9j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 19:21:19 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id t16so12590190wrr.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbGqWabkO+qsmDE6Dovu8KQsQ8ImSSqPf6QwQRVth5s=;
 b=i6xKbxwS8JScMMcfWs747aiWLNwFekNIEHU/F7et809rV0fTf2Z1etP2smdRIclPMa
 lhDElPf8v5ti/cVsD+at74gPj+57ePpHY3fNLUN0gidqm1w/D5T8/11fD7aJaNSIRMGI
 oVZhfCiO0XfG6E8Ht8f7ScI6dapi7d+rOzFagYFrDCEcdijn99gGrGp8bZGVf1UL0JUB
 TqBWqpQkCwC1zPXC6yj50TRQeTxTLqGspPZJeaI8A7ZkyROqnqwLoKnAVEIHL2stqE3B
 o6xh9qilu4XKU/bF8Fj7I36FoMpYauUPR8LgHu7wjhJoe4VGr7qwDm/0wrvw5VhuFFmR
 K/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbGqWabkO+qsmDE6Dovu8KQsQ8ImSSqPf6QwQRVth5s=;
 b=n7vB2j5Sh5/E36P3TB9bXkOy4Ur9acpb7X43ZpgEOcQKPyWX6+q4epESOar9Ln8XxD
 7ICscbbbf2+3QQCKrcGNtUxE/oF7aFcRo8A/tCNDMdHTbQ6XMM6ew1lVsuzvn0hfcKiw
 nJV8MZ19R8RkJgLKsrckA7YK5NCvfZlKPQu7aGH6bOPHSWw5yJEHEsPQ7j7E0sFp3EW+
 Y0/2fClOtYVKrGWZDDiCjmeEV7j9xNljY+RDeQnGTAIWF+GLi6IL2ZWlAB0cJkOvurBP
 Bzha+HYlaKFVtZ4EnCGgJmie0eI0e10HuiDZ/rMK5t1fLJORb34H9u5/cRisg0pU6KpS
 fT5A==
X-Gm-Message-State: APjAAAXXG8hPlWY3tcOgTryrfElrdMWwliyydrPDiDr8kSCylXUq0Jm8
 DgApNZTLdxtH2L9j5z7XLrKZRQeM0R2jMSZ6PrsgSQ==
X-Google-Smtp-Source: APXvYqxq7fhyaYGafFtbCO5SV4r6hSp9ssGtNlWV8f9IBcuiRL8birbPQx/oxQqtKKJJITJiIZPwCyiQWkaM9VdkHCE=
X-Received: by 2002:adf:fd88:: with SMTP id d8mr12239490wrr.200.1572337275488; 
 Tue, 29 Oct 2019 01:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191028210559.8289-1-rth@twiddle.net>
 <20191028210559.8289-2-rth@twiddle.net>
In-Reply-To: <20191028210559.8289-2-rth@twiddle.net>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 29 Oct 2019 09:21:03 +0100
Message-ID: <CAKv+Gu9iW341X8FLBedO1Lhr0H-XcA7jDp3bh3nQh7f7N_M0eA@mail.gmail.com>
Subject: Re: [PATCH 1/6] random: Mark CONFIG_ARCH_RANDOM functions __must_check
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Oct 2019 at 22:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot use the pointer output without validating the
> success of the random read.
>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
> Cc: Kees Cook <keescook@chromium.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: linux-arch@vger.kernel.org
> ---
>  include/linux/random.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/random.h b/include/linux/random.h
> index f189c927fdea..84947b489649 100644
> --- a/include/linux/random.h
> +++ b/include/linux/random.h
> @@ -167,11 +167,11 @@ static inline void prandom_seed_state(struct rnd_state *state, u64 seed)
>  #ifdef CONFIG_ARCH_RANDOM
>  # include <asm/archrandom.h>
>  #else
> -static inline bool arch_get_random_long(unsigned long *v)
> +static inline bool __must_check arch_get_random_long(unsigned long *v)
>  {
>         return 0;

For symmetry with the other cleanups, you should probably change these
into 'return false' as well

>  }
> -static inline bool arch_get_random_int(unsigned int *v)
> +static inline bool __must_check arch_get_random_int(unsigned int *v)
>  {
>         return 0;
>  }
> @@ -179,11 +179,11 @@ static inline bool arch_has_random(void)
>  {
>         return 0;
>  }
> -static inline bool arch_get_random_seed_long(unsigned long *v)
> +static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>  {
>         return 0;
>  }
> -static inline bool arch_get_random_seed_int(unsigned int *v)
> +static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
>  {
>         return 0;
>  }
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
