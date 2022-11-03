Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38B6183EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 17:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N385k6Fjyz3cLq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 03:16:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ByazuTSm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ByazuTSm;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N384r1Tx2z3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 03:15:55 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id v1so3493441wrt.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIA3GBeXOfRhXEjRCDEwyUNKkrK8wlI75UwFpO43d88=;
        b=ByazuTSmWWuXJkPK6GFWUlorHo3+SwvoeOlBaVRszTLGLJnV1sjESVtie558CjO1Mk
         BmMu9XqRllW3tVM8CnoWbCfVPRjvWvE3vpWRgG+3dlu19UC27kD4FI48Pn4aZ/4JqVT2
         mgCkhxPHtXomrO7/4N1wisI7SLn6GMXgWGDoThYHmkiLbXs10BJHVwFnH6J8V2gID/XS
         q0JaKyR2NTQkdrHpgCj3vWkWVfMh9yxO7yVGNcv1yC8eWnG0PDx6dzvPO/n7XJT+7vEx
         d7lFvKuOAZ7m1mSjgUT9ZFYX/VHSfoYaLZjPsUY6tHpnksWRkrur9192SaLjvQQX+y2F
         b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIA3GBeXOfRhXEjRCDEwyUNKkrK8wlI75UwFpO43d88=;
        b=smwp00HHP8DbmuiRmCUH2gTxstjUclSvYC1bfCGuaGUckx0GZrOsNPjaL7BB+bJTbz
         kNnHcmmZ8He75KyGAvXqz34Sqs2IxtRzmGNAVWfW30OjBG7KH3zMbLrclreKbTFDi6m2
         CiXudR2e/1/b0lTPFhBkXkL6WIzoChWcDT3HSLCYDVHUKRKipT5TUV+Dd57nrTy7PcAt
         3On3XcqX3ANaWE/5OgnOiSLgEBwr46gSfNe3+U0Ji2y3Wu47J9aQqNG6B1iiULcGzxUg
         aGdQRpDIjbDN9Vzzq3D0vrt9HB87W8T5nazFYn+YOWyXCYiWg4OfqxccNTdXwGyFOvgH
         xYvA==
X-Gm-Message-State: ACrzQf35cXpesvusu36LCSVE1VB4YHTEyNPnHWGErRq+V1e1adXcin2N
	CyDXlJJ6Jowu9M69IqejBmXVw2iZZjv7wLSHPhSXzw==
X-Google-Smtp-Source: AMsMyM74xNT8KKrwvdpYNSaCNP0OJJDK9ogT5tFmLzsIQzW5O1a8m6DxkHcwTnHLMC3GNIriNc0h7wNhU4UWN8WacGc=
X-Received: by 2002:a05:6000:1817:b0:236:77f0:ef60 with SMTP id
 m23-20020a056000181700b0023677f0ef60mr18894921wrh.343.1667492151162; Thu, 03
 Nov 2022 09:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com> <0B7A4A12-2528-439A-BB83-BBC5606A27B0@linux.vnet.ibm.com>
In-Reply-To: <0B7A4A12-2528-439A-BB83-BBC5606A27B0@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Nov 2022 09:15:38 -0700
Message-ID: <CAP-5=fVdsaNPptvgQ0NaqhXYELFY8HwwhjAaem0B_HrL2GUkUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/perf: Fix printing os->prefix in CSV metrics output
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 2, 2022 at 1:36 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 18-Oct-2022, at 2:26 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > Perf stat with CSV output option prints an extra empty
> > string as first field in metrics output line.
> > Sample output below:
> >
> >       # ./perf stat -x, --per-socket -a -C 1 ls
> >       S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
> >       S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
> >       S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
> >       S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
> >       S0,1,875807,,cycles,1769826,100.00,0.491,GHz
> >       S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend cycles idle
> >       S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend cycles idle
> >       S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
> > ====> ,S0,1,,,,,,,2.00,stalled cycles per insn
> >
> > The above command line uses field separator as ","
> > via "-x," option and per-socket option displays
> > socket value as first field. But here the last line
> > for "stalled cycles per insn" has "," in the
> > beginning.
> >
> > Sample output using interval mode:
> >       # ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
> >       0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs utilized
> >       0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
> >       ------
> >       0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn per cycle
> > ====> 0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn
> >
> > Above result also has an extra csv separator after
> > the timestamp. Patch addresses extra field separator
> > in the beginning of the metric output line.
> >
> > The counter stats are displayed by function
> > "perf_stat__print_shadow_stats" in code
> > "util/stat-shadow.c". While printing the stats info
> > for "stalled cycles per insn", function "new_line_csv"
> > is used as new_line callback.
> >
> > The new_line_csv function has check for "os->prefix"
> > and if prefix is not null, it will be printed along
> > with cvs separator.
> > Snippet from "new_line_csv":
> >       if (os->prefix)
> >               fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
> >
> > Here os->prefix gets printed followed by ","
> > which is the cvs separator. The os->prefix is
> > used in interval mode option ( -I ), to print
> > time stamp on every new line. But prefix is
> > already set to contain csv separator when used
> > in interval mode for csv option.
> >
> > Reference: Function "static void print_interval"
> > Snippet:
> >       sprintf(prefix, "%6lu.%09lu%s", ts->tv_sec, ts->tv_nsec, config->csv_sep);
> >
> > Also if prefix is not assigned (if not used with
> > -I option), it gets set to empty string.
> > Reference: function printout() in util/stat-display.c
> > Snippet:
> >       .prefix = prefix ? prefix : "",
> >
> > Since prefix already set to contain cvs_sep in interval
> > option, patch removes printing config->csv_sep in
> > new_line_csv function to avoid printing extra field.
> >
> > After the patch:
> >
> >       # ./perf stat -x, --per-socket -a -C 1 ls
> >       S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
> >       S0,1,2,,context-switches,2041444,100.00,979.289,/sec
> >       S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
> >       S0,1,2,,page-faults,2040288,100.00,979.289,/sec
> >       S0,1,254589,,cycles,2036066,100.00,0.125,GHz
> >       S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles idle
> >       S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend cycles idle
> >       S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
> >       S0,1,,,,,,,1.27,stalled cycles per insn
> >
> > Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>
> Hi All,
>
> Looking for review comments for this change.

Hi,

Thanks for addressing issues in this code. What is the status of the
CSV output test following these changes?

I think going forward we need to move away from CSV and columns, to
something with structure like json. We also need to refactor this
code, trying to add meaning to a newline character is a bad strategy
and creates some unnatural things. To some extent this overlaps with
Namhyung's aggregation cleanup. There are also weirdnesses in
jevents/pmu-events, like the same ScaleUnit applying to a metric and
an event - why are metrics even parts of events?

Given the current code is wac-a-mole, and this is another whack, if
the testing is okay I think we should move forward with this change.

Thanks,
Ian




> Thanks
> Athira
>
> > ---
> > tools/perf/util/stat-display.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> > index 5c47ee9963a7..879874a4bc07 100644
> > --- a/tools/perf/util/stat-display.c
> > +++ b/tools/perf/util/stat-display.c
> > @@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config *config, void *ctx)
> >
> >       fputc('\n', os->fh);
> >       if (os->prefix)
> > -             fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
> > +             fprintf(os->fh, "%s", os->prefix);
> >       aggr_printout(config, os->evsel, os->id, os->nr);
> >       for (i = 0; i < os->nfields; i++)
> >               fputs(config->csv_sep, os->fh);
> > --
> > 2.31.1
> >
>
