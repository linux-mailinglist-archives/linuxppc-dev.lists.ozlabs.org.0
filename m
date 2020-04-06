Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF219F7C1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 16:17:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wt0X36D3zDrCD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 00:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=arnaldo.melo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jcx1bcE+; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wswZ37bjzDr5Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 00:14:03 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id q73so7562141qvq.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R0Dkto3Ot48r4LAZirJdCjJm2TIVdoamwirZwpn+9cw=;
 b=jcx1bcE+a0LgJPXgP9nl9JzqNgJqVUUBtXhNmKY84/JIT5MP+YEoV0pzYdhGJ74g4I
 FR7P8JUeHNeXRPkEW9RavpxyoBRZ/NYBGdzMwUyRcF2dsfIbuJQ3JIfOwI49IRgfvPp2
 sI+ykJEfGDfSIa0l3a9fahD1j5huAGIK4IJIZqZAxrx64yG74pe/eWDuf2lZTXZNNN0R
 aIWtKzPVWoF6hgPhXBtdvIPeWSCMitN/vXDd/qgFDT3w+hF2yhBnZQLUeeCSBRm0NoTM
 yJ2gnHUA6KeNPEc5u9x+UKsRaoAJL7dGmwBMy5TRhkhHCkaEyLl0C1afgCZzKeE+nGU5
 KAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R0Dkto3Ot48r4LAZirJdCjJm2TIVdoamwirZwpn+9cw=;
 b=qVxGLR3T3A7AM14RRnmO69XYHFWsKilIwno+xsR2YUDoN+FfOHfu7OY/mnamLVUXsk
 iZRGIc/9gWTGoqDSn5iH/xcqxMkm8aU6Pd+yuKaFmir9iUTly9OqUConUrUV9AqRbUiv
 SBUGBI10bXoz+Su8qvOJn+Q2CX9xQMhz7hIOvu2/9a1LWNEx29Sw7YTjAh5iY2G+w89s
 Krybe7QcWkA5s0UXyuDkPf831Qpk4J3svlBdxvU9vSP91NSYz1wMv9bh1nKT629SfaXI
 /do45fKatUvpxPQIG5LYZIXGOPHmPaKFvhJ+ioMBknchCGh0jfQBKuYKVkyU1xIln1sK
 +xbw==
X-Gm-Message-State: AGi0PuYJETdf+ZIiKWuA6hMXK8zlqvosekWTmUD6lwx2atvJeDacGhPs
 76327tsh6wFB0zyWm4KuKZI=
X-Google-Smtp-Source: APiQypJCnBu9UsuvGtSAitWe33sdsCEgCiDe6OtydtOmMXDRFvRnwa459nOSeZ9/VnPo/1nEJGnDTA==
X-Received: by 2002:a0c:f207:: with SMTP id h7mr20287593qvk.20.1586182440215; 
 Mon, 06 Apr 2020 07:14:00 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.37.151])
 by smtp.gmail.com with ESMTPSA id g201sm14740449qke.99.2020.04.06.07.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 07:13:59 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 6983D409A3; Mon,  6 Apr 2020 11:13:57 -0300 (-03)
Date: Mon, 6 Apr 2020 11:13:57 -0300
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 1/7] perf expr: Add expr_ prefix for parse_ctx and
 parse_id
Message-ID: <20200406141357.GG29826@kernel.org>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
 <20200401203340.31402-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401203340.31402-2-kjain@linux.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Apr 02, 2020 at 02:03:34AM +0530, Kajol Jain escreveu:
> From: Jiri Olsa <jolsa@kernel.org>
> 
> Adding expr_ prefix for parse_ctx and parse_id,
> to straighten out the expr* namespace.
> 
> There's no functional change.

Next time please add your Signed-off-by: as well when pushing 3rd party
patches.

Applied.

- Arnaldo
 
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  tools/perf/tests/expr.c       |  4 ++--
>  tools/perf/util/expr.c        | 10 +++++-----
>  tools/perf/util/expr.h        | 12 ++++++------
>  tools/perf/util/expr.y        |  6 +++---
>  tools/perf/util/stat-shadow.c |  2 +-
>  5 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> index 28313e59d6f6..ea10fc4412c4 100644
> --- a/tools/perf/tests/expr.c
> +++ b/tools/perf/tests/expr.c
> @@ -6,7 +6,7 @@
>  #include <string.h>
>  #include <linux/zalloc.h>
>  
> -static int test(struct parse_ctx *ctx, const char *e, double val2)
> +static int test(struct expr_parse_ctx *ctx, const char *e, double val2)
>  {
>  	double val;
>  
> @@ -22,7 +22,7 @@ int test__expr(struct test *t __maybe_unused, int subtest __maybe_unused)
>  	const char **other;
>  	double val;
>  	int i, ret;
> -	struct parse_ctx ctx;
> +	struct expr_parse_ctx ctx;
>  	int num_other;
>  
>  	expr__ctx_init(&ctx);
> diff --git a/tools/perf/util/expr.c b/tools/perf/util/expr.c
> index fd192ddf93c1..c8ccc548a585 100644
> --- a/tools/perf/util/expr.c
> +++ b/tools/perf/util/expr.c
> @@ -11,7 +11,7 @@ extern int expr_debug;
>  #endif
>  
>  /* Caller must make sure id is allocated */
> -void expr__add_id(struct parse_ctx *ctx, const char *name, double val)
> +void expr__add_id(struct expr_parse_ctx *ctx, const char *name, double val)
>  {
>  	int idx;
>  
> @@ -21,13 +21,13 @@ void expr__add_id(struct parse_ctx *ctx, const char *name, double val)
>  	ctx->ids[idx].val = val;
>  }
>  
> -void expr__ctx_init(struct parse_ctx *ctx)
> +void expr__ctx_init(struct expr_parse_ctx *ctx)
>  {
>  	ctx->num_ids = 0;
>  }
>  
>  static int
> -__expr__parse(double *val, struct parse_ctx *ctx, const char *expr,
> +__expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
>  	      int start)
>  {
>  	YY_BUFFER_STATE buffer;
> @@ -52,7 +52,7 @@ __expr__parse(double *val, struct parse_ctx *ctx, const char *expr,
>  	return ret;
>  }
>  
> -int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr)
> +int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr)
>  {
>  	return __expr__parse(final_val, ctx, expr, EXPR_PARSE) ? -1 : 0;
>  }
> @@ -75,7 +75,7 @@ int expr__find_other(const char *expr, const char *one, const char ***other,
>  		     int *num_other)
>  {
>  	int err, i = 0, j = 0;
> -	struct parse_ctx ctx;
> +	struct expr_parse_ctx ctx;
>  
>  	expr__ctx_init(&ctx);
>  	err = __expr__parse(NULL, &ctx, expr, EXPR_OTHER);
> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
> index 9377538f4097..b9e53f2b5844 100644
> --- a/tools/perf/util/expr.h
> +++ b/tools/perf/util/expr.h
> @@ -5,19 +5,19 @@
>  #define EXPR_MAX_OTHER 20
>  #define MAX_PARSE_ID EXPR_MAX_OTHER
>  
> -struct parse_id {
> +struct expr_parse_id {
>  	const char *name;
>  	double val;
>  };
>  
> -struct parse_ctx {
> +struct expr_parse_ctx {
>  	int num_ids;
> -	struct parse_id ids[MAX_PARSE_ID];
> +	struct expr_parse_id ids[MAX_PARSE_ID];
>  };
>  
> -void expr__ctx_init(struct parse_ctx *ctx);
> -void expr__add_id(struct parse_ctx *ctx, const char *id, double val);
> -int expr__parse(double *final_val, struct parse_ctx *ctx, const char *expr);
> +void expr__ctx_init(struct expr_parse_ctx *ctx);
> +void expr__add_id(struct expr_parse_ctx *ctx, const char *id, double val);
> +int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr);
>  int expr__find_other(const char *expr, const char *one, const char ***other,
>  		int *num_other);
>  
> diff --git a/tools/perf/util/expr.y b/tools/perf/util/expr.y
> index 4720cbe79357..cd17486c1c5d 100644
> --- a/tools/perf/util/expr.y
> +++ b/tools/perf/util/expr.y
> @@ -15,7 +15,7 @@
>  %define api.pure full
>  
>  %parse-param { double *final_val }
> -%parse-param { struct parse_ctx *ctx }
> +%parse-param { struct expr_parse_ctx *ctx }
>  %parse-param {void *scanner}
>  %lex-param {void* scanner}
>  
> @@ -39,14 +39,14 @@
>  
>  %{
>  static void expr_error(double *final_val __maybe_unused,
> -		       struct parse_ctx *ctx __maybe_unused,
> +		       struct expr_parse_ctx *ctx __maybe_unused,
>  		       void *scanner,
>  		       const char *s)
>  {
>  	pr_debug("%s\n", s);
>  }
>  
> -static int lookup_id(struct parse_ctx *ctx, char *id, double *val)
> +static int lookup_id(struct expr_parse_ctx *ctx, char *id, double *val)
>  {
>  	int i;
>  
> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
> index 0fd713d3674f..402af3e8d287 100644
> --- a/tools/perf/util/stat-shadow.c
> +++ b/tools/perf/util/stat-shadow.c
> @@ -729,7 +729,7 @@ static void generic_metric(struct perf_stat_config *config,
>  			   struct runtime_stat *st)
>  {
>  	print_metric_t print_metric = out->print_metric;
> -	struct parse_ctx pctx;
> +	struct expr_parse_ctx pctx;
>  	double ratio, scale;
>  	int i;
>  	void *ctxp = out->ctx;
> -- 
> 2.21.0
> 

-- 

- Arnaldo
