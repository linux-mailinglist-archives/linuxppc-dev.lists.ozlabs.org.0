Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3489503740
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 17:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KgbwN0HtHz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 01:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JsGelCQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=JsGelCQg; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgbvn2czdz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 00:59:46 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id m14so13733324wrb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OO1451Z/51EUQiODYQcioXNtAk5WDJClp+v1gsb4O+A=;
 b=JsGelCQgSfft9VxIYkI97wbWG1Wnm7X9pfRoYqmEWOo9hpWdzwWLwiWQqwhnjSMUKt
 Kc14Sh6fqshzpxMj6q2WvlyVH2SL7rZH0iSVd62N/WQulajBAf6BLXeaiPaNQ/MvJlHO
 3s0/2yk8wxg0g7RgchbWU8lO9FupY6w+J/88Wl+mgkQwwQD5qJmpVQoZHMRB1etsUDUa
 DBKpijfWSZs6SQjStJ5SBH1LnUW3WJH5iLErJhnltNlsks4HmlbGGaUhXm+y9fYD0okl
 154Eh5cOsi2ONW+/sEeXldDTqdGXMjGX7e/S80TGZdqg+2c9JhJkl0/vZpOD6NrFy1fC
 XOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OO1451Z/51EUQiODYQcioXNtAk5WDJClp+v1gsb4O+A=;
 b=CZlRCNPx3+5Fak40g9c0dZfytEZn/bkLl6VLikEYIZHSuEoifkoz2aS4xIWflcFovj
 pezcoq9l79DfFt6LfUMU7v6UuNlcOmBrPO5jz4Llor9ZOMoq274imISMwMooWgkwjJoi
 k/IqYR91TKOfVCSePfVBjxN0OlBvB69DBcIGEmQoWbAY1r/WADcarkR01GVSeGe/2l71
 9sv6FNl3+jvt2LXJ09apZPwdscQJ62ML1sD1ZkElw+x1EDvTqqXrGN1ims9QRCR0ZnJS
 ubqdqi5sPSUJCGMElrn/GXVwtlQvnlzG1S9B7VuxfO1byZ/bZDUvUeq+tVvx0ib85qFG
 5nlQ==
X-Gm-Message-State: AOAM531e9Pzdjdn+6f7Te33Y226oAPXdkFtPCmH1cM1gmVU5uL6sQr1y
 aymUpDjHjD1Z+XeXW8PwpOMblep4Q9x35d0JykdiJQ==
X-Google-Smtp-Source: ABdhPJygSfQudGHNGaIYA8AF4RqP8bQ81BW1Wk85dVq6W4Vll53M5oge7GeBZ1IPlzfuBne9ZZ6kH4WkXvpz8agqIAU=
X-Received: by 2002:adf:eb09:0:b0:207:bb77:9abb with SMTP id
 s9-20020adfeb09000000b00207bb779abbmr2770912wrn.375.1650121180438; Sat, 16
 Apr 2022 07:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220416004048.1514900-1-namhyung@kernel.org>
 <20220416004048.1514900-2-namhyung@kernel.org>
In-Reply-To: <20220416004048.1514900-2-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 16 Apr 2022 10:59:27 -0400
Message-ID: <CAP-5=fX5S2CR58REzAhXH4s8_27=D2LbKksS7mHoSoxYOOmN4g@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf symbol: Pass is_kallsyms to symbols__fixup_end()
To: Namhyung Kim <namhyung@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Petlan <mpetlan@redhat.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 15, 2022 at 8:40 PM Namhyung Kim <namhyung@kernel.org> wrote:
>
> The symbol fixup is necessary for symbols in kallsyms since they don't
> have size info.  So we use the next symbol's address to calculate the
> size.  Now it's also used for user binaries because sometimes they
> miss size for hand-written asm functions.
>
> There's a arch-specific function to handle kallsyms differently but
> currently it cannot distinguish kallsyms from others.  Pass this
> information explicitly to handle it properly.  Note that those arch
> functions will be moved to the generic function so I didn't added it
> to the arch-functions.

Thanks Namhyung, in:
https://lore.kernel.org/linux-perf-users/20220412154817.2728324-3-irogers@google.com/
I used "dso->kernel != DSO_SPACE__USER" in symbol-elf to make this
more than just kallsyms as presumably kernel code is the issue. Do we
know elf kernel code has correctly sized symbols?

Thanks,
Ian

> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/perf/util/symbol-elf.c | 2 +-
>  tools/perf/util/symbol.c     | 7 ++++---
>  tools/perf/util/symbol.h     | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 31cd59a2b66e..ecd377938eea 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1290,7 +1290,7 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
>          * For misannotated, zeroed, ASM function sizes.
>          */
>         if (nr > 0) {
> -               symbols__fixup_end(&dso->symbols);
> +               symbols__fixup_end(&dso->symbols, false);
>                 symbols__fixup_duplicate(&dso->symbols);
>                 if (kmap) {
>                         /*
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index dea0fc495185..1b85cc1422a9 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -217,7 +217,8 @@ void symbols__fixup_duplicate(struct rb_root_cached *symbols)
>         }
>  }
>
> -void symbols__fixup_end(struct rb_root_cached *symbols)
> +void symbols__fixup_end(struct rb_root_cached *symbols,
> +                       bool is_kallsyms __maybe_unused)
>  {
>         struct rb_node *nd, *prevnd = rb_first_cached(symbols);
>         struct symbol *curr, *prev;
> @@ -1467,7 +1468,7 @@ int __dso__load_kallsyms(struct dso *dso, const char *filename,
>         if (kallsyms__delta(kmap, filename, &delta))
>                 return -1;
>
> -       symbols__fixup_end(&dso->symbols);
> +       symbols__fixup_end(&dso->symbols, true);
>         symbols__fixup_duplicate(&dso->symbols);
>
>         if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
> @@ -1659,7 +1660,7 @@ int dso__load_bfd_symbols(struct dso *dso, const char *debugfile)
>  #undef bfd_asymbol_section
>  #endif
>
> -       symbols__fixup_end(&dso->symbols);
> +       symbols__fixup_end(&dso->symbols, false);
>         symbols__fixup_duplicate(&dso->symbols);
>         dso->adjust_symbols = 1;
>
> diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
> index fbf866d82dcc..5fcdd1f94c56 100644
> --- a/tools/perf/util/symbol.h
> +++ b/tools/perf/util/symbol.h
> @@ -203,7 +203,7 @@ void __symbols__insert(struct rb_root_cached *symbols, struct symbol *sym,
>                        bool kernel);
>  void symbols__insert(struct rb_root_cached *symbols, struct symbol *sym);
>  void symbols__fixup_duplicate(struct rb_root_cached *symbols);
> -void symbols__fixup_end(struct rb_root_cached *symbols);
> +void symbols__fixup_end(struct rb_root_cached *symbols, bool is_kallsyms);
>  void maps__fixup_end(struct maps *maps);
>
>  typedef int (*mapfn_t)(u64 start, u64 len, u64 pgoff, void *data);
> --
> 2.36.0.rc0.470.gd361397f0d-goog
>
