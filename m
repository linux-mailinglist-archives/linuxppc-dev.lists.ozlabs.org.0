Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8225F35E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 20:53:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh92L0nbJz3dqc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 05:52:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JR/pPXsk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JR/pPXsk;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh91P0kCGz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 05:52:07 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso9580084wmq.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=edqCkVEL8i4Uz1rA32xtHlJE25wxZYoYykCtsNa8A6g=;
        b=JR/pPXskbhn46ixixGFmyCbqBUDK3mDCTkvpFOhDSdLyO/XyzSsi/hU+FBlkxit4Ui
         NXt+Ky/aMIY5bPK8aDQ1IhPwc9+HhnDaED829lD7zMhEUMSejfdpl15WhA4OTSu/Tram
         fkNz0dQU47zROUddwS6x30PvFnw2aIimXccu9cjng/oDHZFNhMNwvM6jPF57zdaNDoYb
         TzJmQt/8M+4vRaQUpudqQPz3tubf+/O+N7F7JMic7k9iOYJypI25fZ2n6s4Uj6zwdk/T
         Sz7oc5DKCe3r1++UGBK52SdaoI1vVOPo62Fe0vHPC3+rDFWaq9Y4wfWmH6e2qG7O6LFg
         3kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=edqCkVEL8i4Uz1rA32xtHlJE25wxZYoYykCtsNa8A6g=;
        b=iB3zWrcboPVk0rzjzSOUFUvIMy0a3UcRfgXexgayCYWOl/WiIfj44eYMu4KMtqh+kJ
         WofXU85CmjfK9Hy6GcbLhXfuWhar3m2Q1a9hwltxjOLrqLEPqfH3obGWI3yH1xFlvtS7
         pIkPBl26P3a0rFF2WKp9R/mDGKrc1T0cXyEqTspG2dX7wfTjxBqfL6eLIhmDCfIDBa/i
         FTdVjg/ma5AJipp1f/pA1dUGTU38FC1MTmgbJVHzyCgcEtTs0UGibe85mS6AGu9AMguP
         ad207WUIVuVP8vsQNLVVvzd6+LYxhlxq0G+oWzJ+8lqeZtgmD8MhD4eXuk/uRDyp/CL5
         ajgQ==
X-Gm-Message-State: ACrzQf1W9eVAGV5ww/+htnI6zrW7CxRYVK0fnExmu+CYn80b9ArMWAXt
	wO2jW5fszeIZnI3w6gy6S5BGh/1KyWe/i1abviHcRg==
X-Google-Smtp-Source: AMsMyM6UKx5zp/od6I8uCZIBBdLtI/w+LcEZzsAJ76Y4HRwWnzFOmGGeJwEwpF2RYRDZvC20v0gcRdAyd4fMnj1aZ90=
X-Received: by 2002:a05:600c:19ce:b0:3b4:c709:4307 with SMTP id
 u14-20020a05600c19ce00b003b4c7094307mr7681389wmq.182.1664823119734; Mon, 03
 Oct 2022 11:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com> <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
 <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com> <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
In-Reply-To: <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Oct 2022 11:51:47 -0700
Message-ID: <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
To: atrajeev <atrajeev@imap.linux.ibm.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 3, 2022 at 7:03 AM atrajeev <atrajeev@imap.linux.ibm.com> wrote=
:
>
> On 2022-10-02 05:17, Ian Rogers wrote:
> > On Thu, Sep 29, 2022 at 5:56 AM James Clark <james.clark@arm.com>
> > wrote:
> >>
> >>
> >>
> >> On 29/09/2022 09:49, Athira Rajeev wrote:
> >> >
> >> >
> >> >> On 28-Sep-2022, at 9:05 PM, James Clark <james.clark@arm.com> wrote=
:
> >> >>
> >> >>
> >> >>
> >> >
> >> > Hi James,
> >> >
> >> > Thanks for looking at the patch and sharing review comments.
> >> >
> >> >> On 13/09/2022 12:57, Athira Rajeev wrote:
> >> >>> perf stat includes option to specify aggr_mode to display
> >> >>> per-socket, per-core, per-die, per-node counter details.
> >> >>> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
> >> >>> counter values are displayed for each cpu along with "CPU"
> >> >>> value in one field of the output.
> >> >>>
> >> >>> Each of the aggregate mode uses the information fetched
> >> >>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
> >> >>
> >> >> I thought that this wouldn't apply to the cpu field because cpu is
> >> >> basically interchangeable as an index in cpumap, rather than anythi=
ng
> >> >> being read from the topology file.
> >> >
> >> > The cpu value is filled in this function:
> >> >
> >> > Function : aggr_cpu_id__cpu
> >> > Code: util/cpumap.c
> >> >
> >> >>
> >> >>> physical_package_id. Utility functions in "cpumap.c" fetches
> >> >>> this information and populates the socket id, core id, cpu etc.
> >> >>> If the platform does not expose the topology information,
> >> >>> these values will be set to -1. Example, in case of powerpc,
> >> >>> details like physical_package_id is restricted to be exposed
> >> >>> in pSeries platform. So id.socket, id.core, id.cpu all will
> >> >>> be set as -1.
> >> >>>
> >> >>> In case of displaying socket or die value, there is no check
> >> >>> done in the "aggr_printout" function to see if it points to
> >> >>> valid socket id or die. But for displaying "cpu" value, there
> >> >>> is a check for "if (id.core > -1)". In case of powerpc pSeries
> >> >>> where detail like physical_package_id is restricted to be
> >> >>> exposed, id.core will be set to -1. Hence the column or field
> >> >>> itself for CPU won't be displayed in the output.
> >> >>>
> >> >>> Result for per-socket:
> >> >>>
> >> >>> <<>>
> >> >>> perf stat -e branches --per-socket -a true
> >> >>>
> >> >>> Performance counter stats for 'system wide':
> >> >>>
> >> >>> S-1      32            416,851      branches
> >> >>> <<>>
> >> >>>
> >> >>> Here S has -1 in above result. But with -A option which also
> >> >>> expects CPU in one column in the result, below is observed.
> >> >>>
> >> >>> <<>>
> >> >>> /bin/perf stat -e instructions -A -a true
> >> >>>
> >> >>> Performance counter stats for 'system wide':
> >> >>>
> >> >>>            47,146      instructions
> >> >>>            45,226      instructions
> >> >>>            43,354      instructions
> >> >>>            45,184      instructions
> >> >>> <<>>
> >> >>>
> >> >>> If the cpu id value is pointing to -1 also, it makes sense
> >> >>> to display the column in the output to replicate the behaviour
> >> >>> or to be in precedence with other aggr options(like per-socket,
> >> >>> per-core). Remove the check "id.core" so that CPU field gets
> >> >>> displayed in the output.
> >> >>
> >> >> Why would you want to print -1 out? Seems like the if statement was=
 a
> >> >> good one to me, otherwise the output looks a bit broken to users. A=
re
> >> >> the other aggregation modes even working if -1 is set for socket an=
d
> >> >> die? Maybe we need to not print -1 in those cases or exit earlier w=
ith a
> >> >> failure.
> >> >>
> >> >> The -1 value has a specific internal meaning which is "to not
> >> >> aggregate". It doesn't mean "not set".
> >> >
> >> > Currently, this check is done only for printing cpu value.
> >> > For socket/die/core values, this check is not done. Pasting an
> >> > example snippet from a powerpc system ( specifically from pseries pl=
atform where
> >> > the value is set to -1 )
> >> >
> >> > ./perf stat --per-core -a -C 1 true
> >> >
> >> >  Performance counter stats for 'system wide':
> >> >
> >> > S-1-D-1-C-1          1               1.06 msec cpu-clock            =
            #    1.018 CPUs utilized
> >> > S-1-D-1-C-1          1                  2      context-switches     =
            #    1.879 K/sec
> >> > S-1-D-1-C-1          1                  0      cpu-migrations       =
            #    0.000 /sec
> >> >
> >> > Here though the value is -1, we are displaying it. Where as in case =
of cpu, the first column will be
> >> > empty since we do a check before printing.
> >> >
> >> > Example:
> >> >
> >> > ./perf stat --per-core -A -C 1 true
> >> >
> >> >  Performance counter stats for 'CPU(s) 1':
> >> >
> >> >               0.88 msec cpu-clock                        #    1.022 =
CPUs utilized
> >> >                  2      context-switches
> >> >                  0      cpu-migrations
> >> >
> >> >
> >> > No sure, whether there are scripts out there, which consume the curr=
ent format and
> >> > not displaying -1 may break it. That is why we tried with change to =
remove check for cpu, similar to
> >> > other modes like socket, die, core etc.
> >>
> >> I wouldn't worry about that because there are json and CSV modes which
> >> are machine readable, and -1 is already not always displayed. If
> >> anything this change here is also likely to break parsing by adding -1
> >> where it wasn't before.
> >>
> >> >
> >> > Also perf code ie =E2=80=9Caggr_cpu_id__empty=E2=80=9D in util/cpuma=
p.c initialises the
> >> > values to -1 . I was checking to see where we are mapping -1 to =E2=
=80=9Cto not aggregate=E2=80=9D.
> >> > What I could find is AGGR_NONE ( which is for no-aggr ) has value as=
 zero.
> >> >
> >> > Reference: defined in util/stat.h
> >> >
> >> > enum aggr_mode {
> >> >         AGGR_NONE,
> >> >
> >>
> >> That enum is never written to any of the cpumap members, that defines
> >> the mode of how to fill the cpu map instead. 0 is a valid value, for
> >> example "CPU 0". -1 is used as a special case and shouldn't be
> >> displayed
> >> IMO.
> >>
> >> Did you see my comment in the code below about the bad merge? Could
> >> that
> >> not be related to your issue?
> >
> > I'm suspicious of this too. In Claire's patch:
> >
> >         case AGGR_NONE:
> > -               if (evsel->percore && !config->percore_show_thread) {
> > -                       fprintf(config->output, "S%d-D%d-C%*d%s",
> > -                               id.socket,
> > -                               id.die,
> > -                               config->csv_output ? 0 : -3,
> > -                               id.core, config->csv_sep);
> > -               } else if (id.cpu.cpu > -1) {
> > -                       fprintf(config->output, "CPU%*d%s",
> > -                               config->csv_output ? 0 : -7,
> > -                               id.cpu.cpu, config->csv_sep);
> > +               if (config->json_output) {
> > +                       if (evsel->percore &&
> > !config->percore_show_thread) {
> > +                               fprintf(config->output, "\"core\" :
> > \"S%d-D%d-C%d\"",
> > +                                       id.socket,
> > +                                       id.die,
> > +                                       id.core);
> > +                       } else if (id.core > -1) {
> > +                               fprintf(config->output, "\"cpu\" :
> > \"%d\", ",
> > +                                       id.cpu.cpu);
> > +                       }
> > +               } else {
> > +                       if (evsel->percore &&
> > !config->percore_show_thread) {
> > +                               fprintf(config->output,
> > "S%d-D%d-C%*d%s",
> > +                                       id.socket,
> > +                                       id.die,
> > +                                       config->csv_output ? 0 : -3,
> > +                                       id.core, config->csv_sep);
> > +                       } else if (id.core > -1) {
> > +                               fprintf(config->output, "CPU%*d%s",
> > +                                       config->csv_output ? 0 : -7,
> > +                                       id.cpu.cpu, config->csv_sep);
> > +                       }
> >                }
> >                break;
> >
> > The old code was using "id.cpu.cpu > -1" while the new code is
> > "id.core > -1". The value printed is id.cpu.cpu and so testing id.core
> > makes less sense to me. Going back to the original patch:
> >
> > https://lore.kernel.org/lkml/20210811224317.1811618-1-cjense@google.com=
/
> >   case AGGR_NONE:
> > - if (evsel->percore && !config->percore_show_thread) {
> > - fprintf(config->output, "S%d-D%d-C%*d%s",
> > - id.socket,
> > - id.die,
> > - config->csv_output ? 0 : -3,
> > - id.core, config->csv_sep);
> > + if (config->json_output) {
> > + if (evsel->percore && !config->percore_show_thread) {
> > + fprintf(config->output, "\"core\" : \"S%d-D%d-C%d\"",
> > + id.socket,
> > + id.die,
> > + id.core);
> > + } else if (id.core > -1) {
> > + fprintf(config->output, "\"cpu\" : \"%d\", ",
> > + evsel__cpus(evsel)->map[id.core]);
> > + }
> > + } else {
> > + if (evsel->percore && !config->percore_show_thread) {
> > + fprintf(config->output, "S%d-D%d-C%*d%s",
> > + id.socket,
> > + id.die,
> > + config->csv_output ? 0 : -3,
> > + id.core, config->csv_sep);
> >   } else if (id.core > -1) {
> >   fprintf(config->output, "CPU%*d%s",
> >   config->csv_output ? 0 : -7,
> >   evsel__cpus(evsel)->map[id.core],
> >   config->csv_sep);
> > - }
> > + }
> > + }
> > +
> >   break;
> >
> > So testing the id.core isn't a bad index makes sense. However, we
> > changed from core to CPU here:
> > https://lore.kernel.org/all/20220105061351.120843-26-irogers@google.com=
/
> > and that was because of:
> > https://lore.kernel.org/r/20220105061351.120843-25-irogers@google.com
> >
> > So I think the code needs to test CPU and not core. Whether that is
> > addressing the Power test failures is another matter, as James said we
> > may need a fix in the tests for that.
> >
>
> Hi Ian, James
>
> Thanks for the reviews and suggestions.
>
> After checking through the original commits for id.core vs cpu check,
> sharing patch below to test CPU and not core.
>
>  From 4dd98d953940deb2f85176cb6b4ecbfd18dbdbf9 Mon Sep 17 00:00:00 2001
>  From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Date: Mon, 3 Oct 2022 15:47:27 +0530
> Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in
> aggr_printout
>
> perf stat has options to aggregate the counts in different
> modes like per socket, per core etc. The function "aggr_printout"
> in util/stat-display.c which is used to print the aggregates,
> has a check for cpu in case of AGGR_NONE. This check was
> originally using condition : "if (id.cpu.cpu > -1)". But
> this got changed after commit df936cadfb58 ("perf stat: Add
> JSON output option"), which added option to output json format
> for different aggregation modes. After this commit, the
> check in "aggr_printout" is using "if (id.core > -1)".
>
> The old code was using "id.cpu.cpu > -1" while the new code
> is using "id.core > -1". But since the value printed is
> id.cpu.cpu, fix this check to use cpu and not core.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Suggested-by: James Clark <james.clark@arm.com>
> Suggested-by: Ian Rogers <irogers@google.com>

The change below works on my dual socket SkylakeX:
..
85: perf stat CSV output linter                                     :
Ok
86: perf stat csv summary test                                      : Ok
87: perf stat JSON output linter                                    : Ok
..
I don't see anything else out of the ordinary.

Thanks,
Ian

> ---
>   tools/perf/util/stat-display.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/stat-display.c
> b/tools/perf/util/stat-display.c
> index b82844cb0ce7..cf28020798ec 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config
> *config,
>                                         id.socket,
>                                         id.die,
>                                         id.core);
> -                       } else if (id.core > -1) {
> +                       } else if (id.cpu.cpu > -1) {
>                                 fprintf(config->output, "\"cpu\" : \"%d\"=
, ",
>                                         id.cpu.cpu);
>                         }
> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config
> *config,
>                                         id.die,
>                                         config->csv_output ? 0 : -3,
>                                         id.core, config->csv_sep);
> -                       } else if (id.core > -1) {
> +                       } else if (id.cpu.cpu > -1) {
>                                 fprintf(config->output, "CPU%*d%s",
>                                         config->csv_output ? 0 : -7,
>                                         id.cpu.cpu, config->csv_sep);
> --
> 2.31.1
>
> Can you suggest or help to test this patch change.
>
> To address the test failure, as James suggested, I will handle fix in
> testcases and post them
> as a separate patch. Plan is to add a sanity check in the tests to see
> if the "physical_packagge_id" ( ie socket id ) in topology points to -1
> and if so skip the test. Also in parallel, checking to see how we can
> handle the aggregation modes to work incase of "-1" value for socket or
> die
>
> Thanks
> Athira
>
> > Thanks,
> > Ian
> >
> >> Or the one about fixing it in the test instead? Or failing early if
> >> the
> >> topology can't be read?
> >>
> >> I'm still not convinced that any of the modes where -1 is printed are
> >> even working properly so it might be best to fix that rather than just
> >> the printout.
> >>
> >> > James, can you point me to reference for that meaning if I have miss=
ed anything.
> >>
> >> It's here:
> >>
> >>   /** Identify where counts are aggregated, -1 implies not to
> >> aggregate. */
> >>   struct aggr_cpu_id {
> >>
> >> >
> >> > Thanks
> >> > Athira
> >> >
> >> >>
> >> >>>
> >> >>> After the fix:
> >> >>>
> >> >>> <<>>
> >> >>> perf stat -e instructions -A -a true
> >> >>>
> >> >>> Performance counter stats for 'system wide':
> >> >>>
> >> >>> CPU-1                  64,034      instructions
> >> >>> CPU-1                  68,941      instructions
> >> >>> CPU-1                  59,418      instructions
> >> >>> CPU-1                  70,478      instructions
> >> >>> CPU-1                  65,201      instructions
> >> >>> CPU-1                  63,704      instructions
> >> >>> <<>>
> >> >>>
> >> >>> This is caught while running "perf test" for
> >> >>> "stat+json_output.sh" and "stat+csv_output.sh".
> >> >>
> >> >> Is it possible to fix the issue by making the tests cope with the l=
ack
> >> >> of the CPU id?
> >> >>
> >> >>>
> >> >>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> >> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> >>> ---
> >> >>> tools/perf/util/stat-display.c | 6 ++----
> >> >>> 1 file changed, 2 insertions(+), 4 deletions(-)
> >> >>>
> >> >>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat=
-display.c
> >> >>> index b82844cb0ce7..1b751a730271 100644
> >> >>> --- a/tools/perf/util/stat-display.c
> >> >>> +++ b/tools/perf/util/stat-display.c
> >> >>> @@ -168,10 +168,9 @@ static void aggr_printout(struct perf_stat_co=
nfig *config,
> >> >>>                                     id.socket,
> >> >>>                                     id.die,
> >> >>>                                     id.core);
> >> >>> -                   } else if (id.core > -1) {
> >> >>> +                   } else
> >> >>
> >> >> This should have been "id.cpu.cpu > -1". Looks like it was changed =
by
> >> >> some kind of bad merge or rebase in df936cadfb because there is no
> >> >> obvious justification for the change to .core in that commit.
> >> >
> >> >>
> >> >>>                             fprintf(config->output, "\"cpu\" : \"%=
d\", ",
> >> >>>                                     id.cpu.cpu);
> >> >>> -                   }
> >> >>>             } else {
> >> >>>                     if (evsel->percore && !config->percore_show_th=
read) {
> >> >>>                             fprintf(config->output, "S%d-D%d-C%*d%=
s",
> >> >>> @@ -179,11 +178,10 @@ static void aggr_printout(struct perf_stat_c=
onfig *config,
> >> >>>                                     id.die,
> >> >>>                                     config->csv_output ? 0 : -3,
> >> >>>                                     id.core, config->csv_sep);
> >> >>> -                   } else if (id.core > -1) {
> >> >>> +                   } else
> >> >>>                             fprintf(config->output, "CPU%*d%s",
> >> >>>                                     config->csv_output ? 0 : -7,
> >> >>>                                     id.cpu.cpu, config->csv_sep);
> >> >>> -                   }
> >> >>>             }
> >> >>>             break;
> >> >>>     case AGGR_THREAD:
> >> >
