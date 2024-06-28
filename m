Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918591C5E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 20:36:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zw7LnwPa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9kfg0nlDz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 04:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zw7LnwPa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9kdy2dG8z30Ty
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 04:35:49 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3762775e9ebso21675ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719599743; x=1720204543; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RErrAs0DK8wPplxpianYaV5QcD/2TCRDQ9qb3zaOQoo=;
        b=zw7LnwPaMiFxBh/gmCkDy3htKHhbHVefxXpVSlKnEA9JEwhEdKw5nsSUSnLfzuPJQc
         PUFrnA4YB7Fd33uGSpNyyxV/yI9xpP7EIFsPgrLuQxgGLz+qnbfejcDYth8JRYkxoZ6x
         vuuMgi60oC5f1ZxdCve9rmrVyM3VJJ5s+xFyFu7EbXOwdeOSA6594qsG83/S0WCLjHK3
         +lCQwDyTbPMCcZXFqy1zwb2cXe2ZCJmX0jgBTV1YpIKONofpG1AyAOaONGp9SLmlCvPQ
         5vFfyyTfISqaV5MRlu/RMiqieZmLQ1kaYFNXzI08oqQaa/B6d+b7s23gI/NYxTvFxfxT
         WrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719599743; x=1720204543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RErrAs0DK8wPplxpianYaV5QcD/2TCRDQ9qb3zaOQoo=;
        b=a8F39G5fS0IkygUaHCIGp5brryawKzHSSTdT2CmcU0Y1ALX1l7Wx5ZVSGvfCFz6d2k
         JstNY1I/4kF/pXf8DSyWv6RnWiJ/KE+zV6zoqTeU9OHMCH17GFdqpEbJ2UGEPr2fSt9w
         c4ks5gz9k3Cq8gl/O3txRy/wpuIAw7RhmBjKJnnC7vE91UNITeHB3qwkbgnXUiKN6Ofh
         oBonkhoqKtUhU1c/rgQEhW1800dsR4p/fYWb+Spa07qyar5+k1A6ejDtW4lxa1ZcG5Lx
         12fZMjvZh7CwEoy61jcunDysftbti1Cs3aS6QkHPkm5aAanOlFfCKhDWoFrBe9azjCxK
         p+DA==
X-Gm-Message-State: AOJu0Yyv9DvOYM+FvBtAaiG2ldC41TJUvGZTsZt/tDyd9gPsEhbBlO7p
	ddOVDk3SWs4RJDTpYDegsWTzo9+kBShhNKpOa+kHilnfJ1QsvVdoQTOk7HJxs07PJiC6t64cTJH
	wFivXYXb0H8lZfFlA4XX3G9XGYXKfAVwvXFku
X-Google-Smtp-Source: AGHT+IEIdTlPMI5QX/9NDYi/RpkgzP+Z+ZzXVhld5+h7yexSsH86cZjoenbpLMSq/Lli4Dab5ND8vBPfg/LmAoRXHrM=
X-Received: by 2002:a05:6e02:156b:b0:375:eeb4:78fd with SMTP id
 e9e14a558f8ab-37c42e1f27emr210045ab.25.1719599743167; Fri, 28 Jun 2024
 11:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240628183224.452055-1-adubey@linux.ibm.com>
In-Reply-To: <20240628183224.452055-1-adubey@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Jun 2024 11:35:32 -0700
Message-ID: <CAP-5=fWT81saq2m+zaXrCsa_V-aqyZvNXDbQ28_wNSBo=-nByw@mail.gmail.com>
Subject: Re: [PATCH] perf report: Calling available function for stats printing
To: Abhishek Dubey <adubey@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: mark.rutland@arm.com, peterz@infradead.org, adrian.hunter@intel.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, alexander.shishkin@linux.intel.com, mingo@redhat.com, jolsa@kernel.org, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 28, 2024 at 11:32=E2=80=AFAM Abhishek Dubey <adubey@linux.ibm.c=
om> wrote:
>
> For printing dump_trace, just use existing stats_print()
> function.
>
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-report.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
> index 9718770facb5..6edc0d4ce6fb 100644
> --- a/tools/perf/builtin-report.c
> +++ b/tools/perf/builtin-report.c
> @@ -1089,8 +1089,7 @@ static int __cmd_report(struct report *rep)
>                         perf_session__fprintf_dsos(session, stdout);
>
>                 if (dump_trace) {
> -                       perf_session__fprintf_nr_events(session, stdout);
> -                       evlist__fprintf_nr_events(session->evlist, stdout=
);
> +                       stats_print(rep);
>                         return 0;
>                 }
>         }
> --
> 2.44.0
>
