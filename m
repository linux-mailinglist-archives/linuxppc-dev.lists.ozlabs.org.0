Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7085F4ABE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 23:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhr7z5VBNz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 08:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gpPsRLmn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gpPsRLmn;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhgbB3Q74z2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 01:49:41 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id bq9so21698529wrb.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KQKTLP2+V4k64zxBWdwqPH676jZVEuNhWrlkFhJXiW0=;
        b=gpPsRLmn338R+XE8oPiVvgHR1hud+jmqE5oNoFQ4lV6AfrX08KwlRKQ5KdgB5mpfhb
         A2X9f/EDS7ElgA7PpXuRLzN7ht4nLK6xV8/+2tVbLtTybbZ2FzNIqw+UsEm43VF/SBI+
         A8KFW6254TFZv8tZMleC9/ZjdijMxBHiBZ0F3Fd/xFNVEtBKttXKRFnL8BsIblCeQ54e
         ns2RGI0aMOEl0kBPqzvytobJDkhQ9AL+fEa1aVEnOjeG4DJkHnC1IKxaRQovToUaFRPz
         UHVPEKnnpB1y+dB8DwtHhyrcDVEsUNXDLIs2Bbd09eUlDRXAuDLVSPSsuEoQ9ITLLXK4
         Nc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KQKTLP2+V4k64zxBWdwqPH676jZVEuNhWrlkFhJXiW0=;
        b=yRz05S2r7kyPikLzw6Ba8b7gNwBwnQyV5Ts6Kr5wRLLhqUzCxiWXC9AhPQ9BX6C0t+
         AV99DgoN2R1ZUxlsSO69Il1bwRDUeiegxqSLjXB8jjLRT3kjCq+O5FULNrjqioTIVxEg
         BaTPQ1pHdfXdeEQt64vg18saXN3JNoH5r2Rb9DFRdvn1rKNM8qca+TRcNlbR/5DWBPUN
         Asd0gX+ZuyiB3tdT2Fm6+TB5YSBmcd92j2tTwIogILvFpnHphA49Yv8QEKoWWJ4yZexk
         Oy0bkdneE74S3j2c+44Y3FygoFzJX5VP7aA4NZyTVCmoMO3Ky7T1hch1pxTOGJX+t5Ks
         wpbA==
X-Gm-Message-State: ACrzQf1FIPbxKQoM6Dh+kdKVzlPkrqmuEYB+igjiCkpZRf3682r7dBxO
	hon55apwd1YDqomsvIOpmUBq0ksj38t8yy/cL3jdcA==
X-Google-Smtp-Source: AMsMyM6R2y9dkdoLtklwqyeIfdXfYj/vxo1jenp6H3oM+aWlHB9lppTUmTOBCsJGLFweJsgIMS4gZqpsRzNzE6d4kHo=
X-Received: by 2002:adf:fd50:0:b0:22e:5503:9c4c with SMTP id
 h16-20020adffd50000000b0022e55039c4cmr1731173wrs.375.1664894973586; Tue, 04
 Oct 2022 07:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <4792ef3a-8790-a0d4-50f2-4917874d81d6@arm.com> <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
 <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com> <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com> <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
In-Reply-To: <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Oct 2022 07:49:21 -0700
Message-ID: <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000007de18005ea369141"
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:14:24 +1100
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000007de18005ea369141
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2022, 12:06 AM Athira Rajeev <atrajeev@linux.vnet.ibm.com>
wrote:

>
>
> > On 04-Oct-2022, at 12:21 AM, Ian Rogers <irogers@google.com> wrote:
> >
> > On Mon, Oct 3, 2022 at 7:03 AM atrajeev <atrajeev@imap.linux.ibm.com>
> wrote:
> >>
> >> On 2022-10-02 05:17, Ian Rogers wrote:
> >>> On Thu, Sep 29, 2022 at 5:56 AM James Clark <james.clark@arm.com>
> >>> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 29/09/2022 09:49, Athira Rajeev wrote:
> >>>>>
> >>>>>
> >>>>>> On 28-Sep-2022, at 9:05 PM, James Clark <james.clark@arm.com>
> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>> Hi James,
> >>>>>
> >>>>> Thanks for looking at the patch and sharing review comments.
> >>>>>
> >>>>>> On 13/09/2022 12:57, Athira Rajeev wrote:
> >>>>>>> perf stat includes option to specify aggr_mode to display
> >>>>>>> per-socket, per-core, per-die, per-node counter details.
> >>>>>>> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
> >>>>>>> counter values are displayed for each cpu along with "CPU"
> >>>>>>> value in one field of the output.
> >>>>>>>
> >>>>>>> Each of the aggregate mode uses the information fetched
> >>>>>>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
> >>>>>>
> >>>>>> I thought that this wouldn't apply to the cpu field because cpu is
> >>>>>> basically interchangeable as an index in cpumap, rather than
> anything
> >>>>>> being read from the topology file.
> >>>>>
> >>>>> The cpu value is filled in this function:
> >>>>>
> >>>>> Function : aggr_cpu_id__cpu
> >>>>> Code: util/cpumap.c
> >>>>>
> >>>>>>
> >>>>>>> physical_package_id. Utility functions in "cpumap.c" fetches
> >>>>>>> this information and populates the socket id, core id, cpu etc.
> >>>>>>> If the platform does not expose the topology information,
> >>>>>>> these values will be set to -1. Example, in case of powerpc,
> >>>>>>> details like physical_package_id is restricted to be exposed
> >>>>>>> in pSeries platform. So id.socket, id.core, id.cpu all will
> >>>>>>> be set as -1.
> >>>>>>>
> >>>>>>> In case of displaying socket or die value, there is no check
> >>>>>>> done in the "aggr_printout" function to see if it points to
> >>>>>>> valid socket id or die. But for displaying "cpu" value, there
> >>>>>>> is a check for "if (id.core > -1)". In case of powerpc pSeries
> >>>>>>> where detail like physical_package_id is restricted to be
> >>>>>>> exposed, id.core will be set to -1. Hence the column or field
> >>>>>>> itself for CPU won't be displayed in the output.
> >>>>>>>
> >>>>>>> Result for per-socket:
> >>>>>>>
> >>>>>>> <<>>
> >>>>>>> perf stat -e branches --per-socket -a true
> >>>>>>>
> >>>>>>> Performance counter stats for 'system wide':
> >>>>>>>
> >>>>>>> S-1      32            416,851      branches
> >>>>>>> <<>>
> >>>>>>>
> >>>>>>> Here S has -1 in above result. But with -A option which also
> >>>>>>> expects CPU in one column in the result, below is observed.
> >>>>>>>
> >>>>>>> <<>>
> >>>>>>> /bin/perf stat -e instructions -A -a true
> >>>>>>>
> >>>>>>> Performance counter stats for 'system wide':
> >>>>>>>
> >>>>>>>           47,146      instructions
> >>>>>>>           45,226      instructions
> >>>>>>>           43,354      instructions
> >>>>>>>           45,184      instructions
> >>>>>>> <<>>
> >>>>>>>
> >>>>>>> If the cpu id value is pointing to -1 also, it makes sense
> >>>>>>> to display the column in the output to replicate the behaviour
> >>>>>>> or to be in precedence with other aggr options(like per-socket,
> >>>>>>> per-core). Remove the check "id.core" so that CPU field gets
> >>>>>>> displayed in the output.
> >>>>>>
> >>>>>> Why would you want to print -1 out? Seems like the if statement wa=
s
> a
> >>>>>> good one to me, otherwise the output looks a bit broken to users.
> Are
> >>>>>> the other aggregation modes even working if -1 is set for socket a=
nd
> >>>>>> die? Maybe we need to not print -1 in those cases or exit earlier
> with a
> >>>>>> failure.
> >>>>>>
> >>>>>> The -1 value has a specific internal meaning which is "to not
> >>>>>> aggregate". It doesn't mean "not set".
> >>>>>
> >>>>> Currently, this check is done only for printing cpu value.
> >>>>> For socket/die/core values, this check is not done. Pasting an
> >>>>> example snippet from a powerpc system ( specifically from pseries
> platform where
> >>>>> the value is set to -1 )
> >>>>>
> >>>>> ./perf stat --per-core -a -C 1 true
> >>>>>
> >>>>> Performance counter stats for 'system wide':
> >>>>>
> >>>>> S-1-D-1-C-1          1               1.06 msec cpu-clock
>             #    1.018 CPUs utilized
> >>>>> S-1-D-1-C-1          1                  2      context-switches
>            #    1.879 K/sec
> >>>>> S-1-D-1-C-1          1                  0      cpu-migrations
>            #    0.000 /sec
> >>>>>
> >>>>> Here though the value is -1, we are displaying it. Where as in case
> of cpu, the first column will be
> >>>>> empty since we do a check before printing.
> >>>>>
> >>>>> Example:
> >>>>>
> >>>>> ./perf stat --per-core -A -C 1 true
> >>>>>
> >>>>> Performance counter stats for 'CPU(s) 1':
> >>>>>
> >>>>>              0.88 msec cpu-clock                        #    1.022
> CPUs utilized
> >>>>>                 2      context-switches
> >>>>>                 0      cpu-migrations
> >>>>>
> >>>>>
> >>>>> No sure, whether there are scripts out there, which consume the
> current format and
> >>>>> not displaying -1 may break it. That is why we tried with change to
> remove check for cpu, similar to
> >>>>> other modes like socket, die, core etc.
> >>>>
> >>>> I wouldn't worry about that because there are json and CSV modes whi=
ch
> >>>> are machine readable, and -1 is already not always displayed. If
> >>>> anything this change here is also likely to break parsing by adding =
-1
> >>>> where it wasn't before.
> >>>>
> >>>>>
> >>>>> Also perf code ie =E2=80=9Caggr_cpu_id__empty=E2=80=9D in util/cpum=
ap.c initialises
> the
> >>>>> values to -1 . I was checking to see where we are mapping -1 to =E2=
=80=9Cto
> not aggregate=E2=80=9D.
> >>>>> What I could find is AGGR_NONE ( which is for no-aggr ) has value a=
s
> zero.
> >>>>>
> >>>>> Reference: defined in util/stat.h
> >>>>>
> >>>>> enum aggr_mode {
> >>>>>        AGGR_NONE,
> >>>>>
> >>>>
> >>>> That enum is never written to any of the cpumap members, that define=
s
> >>>> the mode of how to fill the cpu map instead. 0 is a valid value, for
> >>>> example "CPU 0". -1 is used as a special case and shouldn't be
> >>>> displayed
> >>>> IMO.
> >>>>
> >>>> Did you see my comment in the code below about the bad merge? Could
> >>>> that
> >>>> not be related to your issue?
> >>>
> >>> I'm suspicious of this too. In Claire's patch:
> >>>
> >>>        case AGGR_NONE:
> >>> -               if (evsel->percore && !config->percore_show_thread) {
> >>> -                       fprintf(config->output, "S%d-D%d-C%*d%s",
> >>> -                               id.socket,
> >>> -                               id.die,
> >>> -                               config->csv_output ? 0 : -3,
> >>> -                               id.core, config->csv_sep);
> >>> -               } else if (id.cpu.cpu > -1) {
> >>> -                       fprintf(config->output, "CPU%*d%s",
> >>> -                               config->csv_output ? 0 : -7,
> >>> -                               id.cpu.cpu, config->csv_sep);
> >>> +               if (config->json_output) {
> >>> +                       if (evsel->percore &&
> >>> !config->percore_show_thread) {
> >>> +                               fprintf(config->output, "\"core\" :
> >>> \"S%d-D%d-C%d\"",
> >>> +                                       id.socket,
> >>> +                                       id.die,
> >>> +                                       id.core);
> >>> +                       } else if (id.core > -1) {
> >>> +                               fprintf(config->output, "\"cpu\" :
> >>> \"%d\", ",
> >>> +                                       id.cpu.cpu);
> >>> +                       }
> >>> +               } else {
> >>> +                       if (evsel->percore &&
> >>> !config->percore_show_thread) {
> >>> +                               fprintf(config->output,
> >>> "S%d-D%d-C%*d%s",
> >>> +                                       id.socket,
> >>> +                                       id.die,
> >>> +                                       config->csv_output ? 0 : -3,
> >>> +                                       id.core, config->csv_sep);
> >>> +                       } else if (id.core > -1) {
> >>> +                               fprintf(config->output, "CPU%*d%s",
> >>> +                                       config->csv_output ? 0 : -7,
> >>> +                                       id.cpu.cpu, config->csv_sep);
> >>> +                       }
> >>>               }
> >>>               break;
> >>>
> >>> The old code was using "id.cpu.cpu > -1" while the new code is
> >>> "id.core > -1". The value printed is id.cpu.cpu and so testing id.cor=
e
> >>> makes less sense to me. Going back to the original patch:
> >>>
> >>>
> https://lore.kernel.org/lkml/20210811224317.1811618-1-cjense@google.com/
> >>>  case AGGR_NONE:
> >>> - if (evsel->percore && !config->percore_show_thread) {
> >>> - fprintf(config->output, "S%d-D%d-C%*d%s",
> >>> - id.socket,
> >>> - id.die,
> >>> - config->csv_output ? 0 : -3,
> >>> - id.core, config->csv_sep);
> >>> + if (config->json_output) {
> >>> + if (evsel->percore && !config->percore_show_thread) {
> >>> + fprintf(config->output, "\"core\" : \"S%d-D%d-C%d\"",
> >>> + id.socket,
> >>> + id.die,
> >>> + id.core);
> >>> + } else if (id.core > -1) {
> >>> + fprintf(config->output, "\"cpu\" : \"%d\", ",
> >>> + evsel__cpus(evsel)->map[id.core]);
> >>> + }
> >>> + } else {
> >>> + if (evsel->percore && !config->percore_show_thread) {
> >>> + fprintf(config->output, "S%d-D%d-C%*d%s",
> >>> + id.socket,
> >>> + id.die,
> >>> + config->csv_output ? 0 : -3,
> >>> + id.core, config->csv_sep);
> >>>  } else if (id.core > -1) {
> >>>  fprintf(config->output, "CPU%*d%s",
> >>>  config->csv_output ? 0 : -7,
> >>>  evsel__cpus(evsel)->map[id.core],
> >>>  config->csv_sep);
> >>> - }
> >>> + }
> >>> + }
> >>> +
> >>>  break;
> >>>
> >>> So testing the id.core isn't a bad index makes sense. However, we
> >>> changed from core to CPU here:
> >>>
> https://lore.kernel.org/all/20220105061351.120843-26-irogers@google.com/
> >>> and that was because of:
> >>> https://lore.kernel.org/r/20220105061351.120843-25-irogers@google.com
> >>>
> >>> So I think the code needs to test CPU and not core. Whether that is
> >>> addressing the Power test failures is another matter, as James said w=
e
> >>> may need a fix in the tests for that.
> >>>
> >>
> >> Hi Ian, James
> >>
> >> Thanks for the reviews and suggestions.
> >>
> >> After checking through the original commits for id.core vs cpu check,
> >> sharing patch below to test CPU and not core.
> >>
> >> From 4dd98d953940deb2f85176cb6b4ecbfd18dbdbf9 Mon Sep 17 00:00:00 2001
> >> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> Date: Mon, 3 Oct 2022 15:47:27 +0530
> >> Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in
> >> aggr_printout
> >>
> >> perf stat has options to aggregate the counts in different
> >> modes like per socket, per core etc. The function "aggr_printout"
> >> in util/stat-display.c which is used to print the aggregates,
> >> has a check for cpu in case of AGGR_NONE. This check was
> >> originally using condition : "if (id.cpu.cpu > -1)". But
> >> this got changed after commit df936cadfb58 ("perf stat: Add
> >> JSON output option"), which added option to output json format
> >> for different aggregation modes. After this commit, the
> >> check in "aggr_printout" is using "if (id.core > -1)".
> >>
> >> The old code was using "id.cpu.cpu > -1" while the new code
> >> is using "id.core > -1". But since the value printed is
> >> id.cpu.cpu, fix this check to use cpu and not core.
> >>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> Suggested-by: James Clark <james.clark@arm.com>
> >> Suggested-by: Ian Rogers <irogers@google.com>
> >
> > The change below works on my dual socket SkylakeX:
> > ..
> > 85: perf stat CSV output linter                                     :
> > Ok
> > 86: perf stat csv summary test                                      : O=
k
> > 87: perf stat JSON output linter                                    : O=
k
> > ..
> > I don't see anything else out of the ordinary.
> >
> > Thanks,
> > Ian
> >
>
> Hi Ian,
> Thanks for helping with testing. Can I add your Tested-by for the patch ?
>

Yep.

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

Arnaldo,
> Please suggest if I have to send as separate patch for the cpu check fix
> patch pasted above:
>  "tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout=E2=80=9D
>
> Thanks
> Athira
> >> ---
> >>  tools/perf/util/stat-display.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tools/perf/util/stat-display.c
> >> b/tools/perf/util/stat-display.c
> >> index b82844cb0ce7..cf28020798ec 100644
> >> --- a/tools/perf/util/stat-display.c
> >> +++ b/tools/perf/util/stat-display.c
> >> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config
> >> *config,
> >>                                        id.socket,
> >>                                        id.die,
> >>                                        id.core);
> >> -                       } else if (id.core > -1) {
> >> +                       } else if (id.cpu.cpu > -1) {
> >>                                fprintf(config->output, "\"cpu\" :
> \"%d\", ",
> >>                                        id.cpu.cpu);
> >>                        }
> >> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config
> >> *config,
> >>                                        id.die,
> >>                                        config->csv_output ? 0 : -3,
> >>                                        id.core, config->csv_sep);
> >> -                       } else if (id.core > -1) {
> >> +                       } else if (id.cpu.cpu > -1) {
> >>                                fprintf(config->output, "CPU%*d%s",
> >>                                        config->csv_output ? 0 : -7,
> >>                                        id.cpu.cpu, config->csv_sep);
> >> --
> >> 2.31.1
> >>
> >> Can you suggest or help to test this patch change.
> >>
> >> To address the test failure, as James suggested, I will handle fix in
> >> testcases and post them
> >> as a separate patch. Plan is to add a sanity check in the tests to see
> >> if the "physical_packagge_id" ( ie socket id ) in topology points to -=
1
> >> and if so skip the test. Also in parallel, checking to see how we can
> >> handle the aggregation modes to work incase of "-1" value for socket o=
r
> >> die
> >>
> >> Thanks
> >> Athira
> >>
> >>> Thanks,
> >>> Ian
> >>>
> >>>> Or the one about fixing it in the test instead? Or failing early if
> >>>> the
> >>>> topology can't be read?
> >>>>
> >>>> I'm still not convinced that any of the modes where -1 is printed ar=
e
> >>>> even working properly so it might be best to fix that rather than ju=
st
> >>>> the printout.
> >>>>
> >>>>> James, can you point me to reference for that meaning if I have
> missed anything.
> >>>>
> >>>> It's here:
> >>>>
> >>>>  /** Identify where counts are aggregated, -1 implies not to
> >>>> aggregate. */
> >>>>  struct aggr_cpu_id {
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>> Athira
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> After the fix:
> >>>>>>>
> >>>>>>> <<>>
> >>>>>>> perf stat -e instructions -A -a true
> >>>>>>>
> >>>>>>> Performance counter stats for 'system wide':
> >>>>>>>
> >>>>>>> CPU-1                  64,034      instructions
> >>>>>>> CPU-1                  68,941      instructions
> >>>>>>> CPU-1                  59,418      instructions
> >>>>>>> CPU-1                  70,478      instructions
> >>>>>>> CPU-1                  65,201      instructions
> >>>>>>> CPU-1                  63,704      instructions
> >>>>>>> <<>>
> >>>>>>>
> >>>>>>> This is caught while running "perf test" for
> >>>>>>> "stat+json_output.sh" and "stat+csv_output.sh".
> >>>>>>
> >>>>>> Is it possible to fix the issue by making the tests cope with the
> lack
> >>>>>> of the CPU id?
> >>>>>>
> >>>>>>>
> >>>>>>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> >>>>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>>>>>> ---
> >>>>>>> tools/perf/util/stat-display.c | 6 ++----
> >>>>>>> 1 file changed, 2 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/tools/perf/util/stat-display.c
> b/tools/perf/util/stat-display.c
> >>>>>>> index b82844cb0ce7..1b751a730271 100644
> >>>>>>> --- a/tools/perf/util/stat-display.c
> >>>>>>> +++ b/tools/perf/util/stat-display.c
> >>>>>>> @@ -168,10 +168,9 @@ static void aggr_printout(struct
> perf_stat_config *config,
> >>>>>>>                                    id.socket,
> >>>>>>>                                    id.die,
> >>>>>>>                                    id.core);
> >>>>>>> -                   } else if (id.core > -1) {
> >>>>>>> +                   } else
> >>>>>>
> >>>>>> This should have been "id.cpu.cpu > -1". Looks like it was changed
> by
> >>>>>> some kind of bad merge or rebase in df936cadfb because there is no
> >>>>>> obvious justification for the change to .core in that commit.
> >>>>>
> >>>>>>
> >>>>>>>                            fprintf(config->output, "\"cpu\" :
> \"%d\", ",
> >>>>>>>                                    id.cpu.cpu);
> >>>>>>> -                   }
> >>>>>>>            } else {
> >>>>>>>                    if (evsel->percore &&
> !config->percore_show_thread) {
> >>>>>>>                            fprintf(config->output,
> "S%d-D%d-C%*d%s",
> >>>>>>> @@ -179,11 +178,10 @@ static void aggr_printout(struct
> perf_stat_config *config,
> >>>>>>>                                    id.die,
> >>>>>>>                                    config->csv_output ? 0 : -3,
> >>>>>>>                                    id.core, config->csv_sep);
> >>>>>>> -                   } else if (id.core > -1) {
> >>>>>>> +                   } else
> >>>>>>>                            fprintf(config->output, "CPU%*d%s",
> >>>>>>>                                    config->csv_output ? 0 : -7,
> >>>>>>>                                    id.cpu.cpu, config->csv_sep);
> >>>>>>> -                   }
> >>>>>>>            }
> >>>>>>>            break;
> >>>>>>>    case AGGR_THREAD:
> >>>>>
>
>

--0000000000007de18005ea369141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Oct 4, 2022, 12:06 AM Athira Rajeev &lt;<a hre=
f=3D"mailto:atrajeev@linux.vnet.ibm.com">atrajeev@linux.vnet.ibm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On 04-Oct-2022, at 12:21 AM, Ian Rogers &lt;<a href=3D"mailto:irogers@=
google.com" target=3D"_blank" rel=3D"noreferrer">irogers@google.com</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; On Mon, Oct 3, 2022 at 7:03 AM atrajeev &lt;<a href=3D"mailto:atrajeev=
@imap.linux.ibm.com" target=3D"_blank" rel=3D"noreferrer">atrajeev@imap.lin=
ux.ibm.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; On 2022-10-02 05:17, Ian Rogers wrote:<br>
&gt;&gt;&gt; On Thu, Sep 29, 2022 at 5:56 AM James Clark &lt;<a href=3D"mai=
lto:james.clark@arm.com" target=3D"_blank" rel=3D"noreferrer">james.clark@a=
rm.com</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; On 29/09/2022 09:49, Athira Rajeev wrote:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; On 28-Sep-2022, at 9:05 PM, James Clark &lt;<a hre=
f=3D"mailto:james.clark@arm.com" target=3D"_blank" rel=3D"noreferrer">james=
.clark@arm.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Hi James,<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Thanks for looking at the patch and sharing review com=
ments.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; On 13/09/2022 12:57, Athira Rajeev wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; perf stat includes option to specify aggr_mode=
 to display<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; per-socket, per-core, per-die, per-node counte=
r details.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Also there is option -A ( AGGR_NONE, -no-aggr =
), where the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; counter values are displayed for each cpu alon=
g with &quot;CPU&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; value in one field of the output.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Each of the aggregate mode uses the informatio=
n fetched<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; from &quot;/sys/devices/system/cpu/cpuX/topolo=
gy&quot; like core_id,<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; I thought that this wouldn&#39;t apply to the cpu =
field because cpu is<br>
&gt;&gt;&gt;&gt;&gt;&gt; basically interchangeable as an index in cpumap, r=
ather than anything<br>
&gt;&gt;&gt;&gt;&gt;&gt; being read from the topology file.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; The cpu value is filled in this function:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Function : aggr_cpu_id__cpu<br>
&gt;&gt;&gt;&gt;&gt; Code: util/cpumap.c<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; physical_package_id. Utility functions in &quo=
t;cpumap.c&quot; fetches<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; this information and populates the socket id, =
core id, cpu etc.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; If the platform does not expose the topology i=
nformation,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; these values will be set to -1. Example, in ca=
se of powerpc,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; details like physical_package_id is restricted=
 to be exposed<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; in pSeries platform. So id.socket, id.core, id=
.cpu all will<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; be set as -1.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; In case of displaying socket or die value, the=
re is no check<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; done in the &quot;aggr_printout&quot; function=
 to see if it points to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; valid socket id or die. But for displaying &qu=
ot;cpu&quot; value, there<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; is a check for &quot;if (id.core &gt; -1)&quot=
;. In case of powerpc pSeries<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; where detail like physical_package_id is restr=
icted to be<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; exposed, id.core will be set to -1. Hence the =
column or field<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; itself for CPU won&#39;t be displayed in the o=
utput.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Result for per-socket:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; perf stat -e branches --per-socket -a true<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Performance counter stats for &#39;system wide=
&#39;:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; S-1=C2=A0 =C2=A0 =C2=A0 32=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 416,851=C2=A0 =C2=A0 =C2=A0 branches<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Here S has -1 in above result. But with -A opt=
ion which also<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; expects CPU in one column in the result, below=
 is observed.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; /bin/perf stat -e instructions -A -a true<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Performance counter stats for &#39;system wide=
&#39;:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A047,146=
=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A045,226=
=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043,354=
=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A045,184=
=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; If the cpu id value is pointing to -1 also, it=
 makes sense<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; to display the column in the output to replica=
te the behaviour<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; or to be in precedence with other aggr options=
(like per-socket,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; per-core). Remove the check &quot;id.core&quot=
; so that CPU field gets<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; displayed in the output.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; Why would you want to print -1 out? Seems like the=
 if statement was a<br>
&gt;&gt;&gt;&gt;&gt;&gt; good one to me, otherwise the output looks a bit b=
roken to users. Are<br>
&gt;&gt;&gt;&gt;&gt;&gt; the other aggregation modes even working if -1 is =
set for socket and<br>
&gt;&gt;&gt;&gt;&gt;&gt; die? Maybe we need to not print -1 in those cases =
or exit earlier with a<br>
&gt;&gt;&gt;&gt;&gt;&gt; failure.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; The -1 value has a specific internal meaning which=
 is &quot;to not<br>
&gt;&gt;&gt;&gt;&gt;&gt; aggregate&quot;. It doesn&#39;t mean &quot;not set=
&quot;.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Currently, this check is done only for printing cpu va=
lue.<br>
&gt;&gt;&gt;&gt;&gt; For socket/die/core values, this check is not done. Pa=
sting an<br>
&gt;&gt;&gt;&gt;&gt; example snippet from a powerpc system ( specifically f=
rom pseries platform where<br>
&gt;&gt;&gt;&gt;&gt; the value is set to -1 )<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; ./perf stat --per-core -a -C 1 true<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Performance counter stats for &#39;system wide&#39;:<b=
r>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; S-1-D-1-C-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.06 msec cpu-clock=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 #=C2=A0 =C2=A0 1.018 CPUs utilized<br>
&gt;&gt;&gt;&gt;&gt; S-1-D-1-C-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=
=A0 context-switches=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#=C2=A0 =C2=A0 1.879 K/sec<br>
&gt;&gt;&gt;&gt;&gt; S-1-D-1-C-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 cpu-migrations=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0#=C2=A0 =C2=A0 0.000 /sec<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Here though the value is -1, we are displaying it. Whe=
re as in case of cpu, the first column will be<br>
&gt;&gt;&gt;&gt;&gt; empty since we do a check before printing.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Example:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; ./perf stat --per-core -A -C 1 true<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Performance counter stats for &#39;CPU(s) 1&#39;:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.88 m=
sec cpu-clock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 1.022 CPUs utilized<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A02=C2=A0 =C2=A0 =C2=A0 context-switches<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00=C2=A0 =C2=A0 =C2=A0 cpu-migrations<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; No sure, whether there are scripts out there, which co=
nsume the current format and<br>
&gt;&gt;&gt;&gt;&gt; not displaying -1 may break it. That is why we tried w=
ith change to remove check for cpu, similar to<br>
&gt;&gt;&gt;&gt;&gt; other modes like socket, die, core etc.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; I wouldn&#39;t worry about that because there are json and=
 CSV modes which<br>
&gt;&gt;&gt;&gt; are machine readable, and -1 is already not always display=
ed. If<br>
&gt;&gt;&gt;&gt; anything this change here is also likely to break parsing =
by adding -1<br>
&gt;&gt;&gt;&gt; where it wasn&#39;t before.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Also perf code ie =E2=80=9Caggr_cpu_id__empty=E2=80=9D=
 in util/cpumap.c initialises the<br>
&gt;&gt;&gt;&gt;&gt; values to -1 . I was checking to see where we are mapp=
ing -1 to =E2=80=9Cto not aggregate=E2=80=9D.<br>
&gt;&gt;&gt;&gt;&gt; What I could find is AGGR_NONE ( which is for no-aggr =
) has value as zero.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Reference: defined in util/stat.h<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; enum aggr_mode {<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AGGR_NONE,<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; That enum is never written to any of the cpumap members, t=
hat defines<br>
&gt;&gt;&gt;&gt; the mode of how to fill the cpu map instead. 0 is a valid =
value, for<br>
&gt;&gt;&gt;&gt; example &quot;CPU 0&quot;. -1 is used as a special case an=
d shouldn&#39;t be<br>
&gt;&gt;&gt;&gt; displayed<br>
&gt;&gt;&gt;&gt; IMO.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Did you see my comment in the code below about the bad mer=
ge? Could<br>
&gt;&gt;&gt;&gt; that<br>
&gt;&gt;&gt;&gt; not be related to your issue?<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; I&#39;m suspicious of this too. In Claire&#39;s patch:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 case AGGR_NONE:<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ev=
sel-&gt;percore &amp;&amp; !config-&gt;percore_show_thread) {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;output, &quot;S%d-D%d-C%*d%s&quo=
t;,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id.socket,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id.die,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config-&gt;csv_output ?=
 0 : -3,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id.core, config-&gt;csv=
_sep);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else=
 if (id.cpu.cpu &gt; -1) {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;output, &quot;CPU%*d%s&quot;,<br=
>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config-&gt;csv_output ?=
 0 : -7,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id.cpu.cpu, config-&gt;=
csv_sep);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (co=
nfig-&gt;json_output) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (evsel-&gt;percore &amp;&amp;<br>
&gt;&gt;&gt; !config-&gt;percore_show_thread) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;outp=
ut, &quot;\&quot;core\&quot; :<br>
&gt;&gt;&gt; \&quot;S%d-D%d-C%d\&quot;&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.socket,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.die,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.core);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;outp=
ut, &quot;\&quot;cpu\&quot; :<br>
&gt;&gt;&gt; \&quot;%d\&quot;, &quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.cpu.cpu);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else=
 {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (evsel-&gt;percore &amp;&amp;<br>
&gt;&gt;&gt; !config-&gt;percore_show_thread) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;outp=
ut,<br>
&gt;&gt;&gt; &quot;S%d-D%d-C%*d%s&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.socket,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.die,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0config-&gt;csv_output ? 0 : -3,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.core, config-&gt;csv_sep);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(config-&gt;outp=
ut, &quot;CPU%*d%s&quot;,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0config-&gt;csv_output ? 0 : -7,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id.cpu.cpu, config-&gt;csv_sep);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<b=
r>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; The old code was using &quot;id.cpu.cpu &gt; -1&quot; while th=
e new code is<br>
&gt;&gt;&gt; &quot;id.core &gt; -1&quot;. The value printed is id.cpu.cpu a=
nd so testing id.core<br>
&gt;&gt;&gt; makes less sense to me. Going back to the original patch:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <a href=3D"https://lore.kernel.org/lkml/20210811224317.1811618=
-1-cjense@google.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lore.kernel.org/lkml/20210811224317.1811618-1-cjense@google.com/</a><br=
>
&gt;&gt;&gt;=C2=A0 case AGGR_NONE:<br>
&gt;&gt;&gt; - if (evsel-&gt;percore &amp;&amp; !config-&gt;percore_show_th=
read) {<br>
&gt;&gt;&gt; - fprintf(config-&gt;output, &quot;S%d-D%d-C%*d%s&quot;,<br>
&gt;&gt;&gt; - id.socket,<br>
&gt;&gt;&gt; - id.die,<br>
&gt;&gt;&gt; - config-&gt;csv_output ? 0 : -3,<br>
&gt;&gt;&gt; - id.core, config-&gt;csv_sep);<br>
&gt;&gt;&gt; + if (config-&gt;json_output) {<br>
&gt;&gt;&gt; + if (evsel-&gt;percore &amp;&amp; !config-&gt;percore_show_th=
read) {<br>
&gt;&gt;&gt; + fprintf(config-&gt;output, &quot;\&quot;core\&quot; : \&quot=
;S%d-D%d-C%d\&quot;&quot;,<br>
&gt;&gt;&gt; + id.socket,<br>
&gt;&gt;&gt; + id.die,<br>
&gt;&gt;&gt; + id.core);<br>
&gt;&gt;&gt; + } else if (id.core &gt; -1) {<br>
&gt;&gt;&gt; + fprintf(config-&gt;output, &quot;\&quot;cpu\&quot; : \&quot;=
%d\&quot;, &quot;,<br>
&gt;&gt;&gt; + evsel__cpus(evsel)-&gt;map[id.core]);<br>
&gt;&gt;&gt; + }<br>
&gt;&gt;&gt; + } else {<br>
&gt;&gt;&gt; + if (evsel-&gt;percore &amp;&amp; !config-&gt;percore_show_th=
read) {<br>
&gt;&gt;&gt; + fprintf(config-&gt;output, &quot;S%d-D%d-C%*d%s&quot;,<br>
&gt;&gt;&gt; + id.socket,<br>
&gt;&gt;&gt; + id.die,<br>
&gt;&gt;&gt; + config-&gt;csv_output ? 0 : -3,<br>
&gt;&gt;&gt; + id.core, config-&gt;csv_sep);<br>
&gt;&gt;&gt;=C2=A0 } else if (id.core &gt; -1) {<br>
&gt;&gt;&gt;=C2=A0 fprintf(config-&gt;output, &quot;CPU%*d%s&quot;,<br>
&gt;&gt;&gt;=C2=A0 config-&gt;csv_output ? 0 : -7,<br>
&gt;&gt;&gt;=C2=A0 evsel__cpus(evsel)-&gt;map[id.core],<br>
&gt;&gt;&gt;=C2=A0 config-&gt;csv_sep);<br>
&gt;&gt;&gt; - }<br>
&gt;&gt;&gt; + }<br>
&gt;&gt;&gt; + }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 break;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; So testing the id.core isn&#39;t a bad index makes sense. Howe=
ver, we<br>
&gt;&gt;&gt; changed from core to CPU here:<br>
&gt;&gt;&gt; <a href=3D"https://lore.kernel.org/all/20220105061351.120843-2=
6-irogers@google.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lore.kernel.org/all/20220105061351.120843-26-irogers@google.com/</a><br=
>
&gt;&gt;&gt; and that was because of:<br>
&gt;&gt;&gt; <a href=3D"https://lore.kernel.org/r/20220105061351.120843-25-=
irogers@google.com" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lore.kernel.org/r/20220105061351.120843-25-irogers@google.com</a><br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; So I think the code needs to test CPU and not core. Whether th=
at is<br>
&gt;&gt;&gt; addressing the Power test failures is another matter, as James=
 said we<br>
&gt;&gt;&gt; may need a fix in the tests for that.<br>
&gt;&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Hi Ian, James<br>
&gt;&gt; <br>
&gt;&gt; Thanks for the reviews and suggestions.<br>
&gt;&gt; <br>
&gt;&gt; After checking through the original commits for id.core vs cpu che=
ck,<br>
&gt;&gt; sharing patch below to test CPU and not core.<br>
&gt;&gt; <br>
&gt;&gt; From 4dd98d953940deb2f85176cb6b4ecbfd18dbdbf9 Mon Sep 17 00:00:00 =
2001<br>
&gt;&gt; From: Athira Rajeev &lt;<a href=3D"mailto:atrajeev@linux.vnet.ibm.=
com" target=3D"_blank" rel=3D"noreferrer">atrajeev@linux.vnet.ibm.com</a>&g=
t;<br>
&gt;&gt; Date: Mon, 3 Oct 2022 15:47:27 +0530<br>
&gt;&gt; Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in<br=
>
&gt;&gt; aggr_printout<br>
&gt;&gt; <br>
&gt;&gt; perf stat has options to aggregate the counts in different<br>
&gt;&gt; modes like per socket, per core etc. The function &quot;aggr_print=
out&quot;<br>
&gt;&gt; in util/stat-display.c which is used to print the aggregates,<br>
&gt;&gt; has a check for cpu in case of AGGR_NONE. This check was<br>
&gt;&gt; originally using condition : &quot;if (id.cpu.cpu &gt; -1)&quot;. =
But<br>
&gt;&gt; this got changed after commit df936cadfb58 (&quot;perf stat: Add<b=
r>
&gt;&gt; JSON output option&quot;), which added option to output json forma=
t<br>
&gt;&gt; for different aggregation modes. After this commit, the<br>
&gt;&gt; check in &quot;aggr_printout&quot; is using &quot;if (id.core &gt;=
 -1)&quot;.<br>
&gt;&gt; <br>
&gt;&gt; The old code was using &quot;id.cpu.cpu &gt; -1&quot; while the ne=
w code<br>
&gt;&gt; is using &quot;id.core &gt; -1&quot;. But since the value printed =
is<br>
&gt;&gt; id.cpu.cpu, fix this check to use cpu and not core.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Athira Rajeev &lt;<a href=3D"mailto:atrajeev@linux.=
vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">atrajeev@linux.vnet.ibm.=
com</a>&gt;<br>
&gt;&gt; Suggested-by: James Clark &lt;<a href=3D"mailto:james.clark@arm.co=
m" target=3D"_blank" rel=3D"noreferrer">james.clark@arm.com</a>&gt;<br>
&gt;&gt; Suggested-by: Ian Rogers &lt;<a href=3D"mailto:irogers@google.com"=
 target=3D"_blank" rel=3D"noreferrer">irogers@google.com</a>&gt;<br>
&gt; <br>
&gt; The change below works on my dual socket SkylakeX:<br>
&gt; ..<br>
&gt; 85: perf stat CSV output linter=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0:<br>
&gt; Ok<br>
&gt; 86: perf stat csv summary test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : Ok<br>
&gt; 87: perf stat JSON output linter=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 : Ok<br>
&gt; ..<br>
&gt; I don&#39;t see anything else out of the ordinary.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Ian<br>
&gt; <br>
<br>
Hi Ian,<br>
Thanks for helping with testing. Can I add your Tested-by for the patch ?<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ye=
p.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tested-by: Ian Rogers=
 &lt;<a href=3D"mailto:irogers@google.com">irogers@google.com</a>&gt;</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto=
">Ian</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
Arnaldo,<br>
Please suggest if I have to send as separate patch for the cpu check fix pa=
tch pasted above:<br>
=C2=A0&quot;tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout=E2=
=80=9D<br>
<br>
Thanks<br>
Athira<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tools/perf/util/stat-display.c | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/tools/perf/util/stat-display.c<br>
&gt;&gt; b/tools/perf/util/stat-display.c<br>
&gt;&gt; index b82844cb0ce7..cf28020798ec 100644<br>
&gt;&gt; --- a/tools/perf/util/stat-display.c<br>
&gt;&gt; +++ b/tools/perf/util/stat-display.c<br>
&gt;&gt; @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_con=
fig<br>
&gt;&gt; *config,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.socket,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.die,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.core);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else if (id.cpu.cpu &gt; -1) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(config-&gt;output, &q=
uot;\&quot;cpu\&quot; : \&quot;%d\&quot;, &quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.cpu.cpu);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_con=
fig<br>
&gt;&gt; *config,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.die,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onfig-&gt;csv_output ? 0 : -3,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.core, config-&gt;csv_sep);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0} else if (id.cpu.cpu &gt; -1) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(config-&gt;output, &q=
uot;CPU%*d%s&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onfig-&gt;csv_output ? 0 : -7,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
d.cpu.cpu, config-&gt;csv_sep);<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1<br>
&gt;&gt; <br>
&gt;&gt; Can you suggest or help to test this patch change.<br>
&gt;&gt; <br>
&gt;&gt; To address the test failure, as James suggested, I will handle fix=
 in<br>
&gt;&gt; testcases and post them<br>
&gt;&gt; as a separate patch. Plan is to add a sanity check in the tests to=
 see<br>
&gt;&gt; if the &quot;physical_packagge_id&quot; ( ie socket id ) in topolo=
gy points to -1<br>
&gt;&gt; and if so skip the test. Also in parallel, checking to see how we =
can<br>
&gt;&gt; handle the aggregation modes to work incase of &quot;-1&quot; valu=
e for socket or<br>
&gt;&gt; die<br>
&gt;&gt; <br>
&gt;&gt; Thanks<br>
&gt;&gt; Athira<br>
&gt;&gt; <br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Ian<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Or the one about fixing it in the test instead? Or failing=
 early if<br>
&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt; topology can&#39;t be read?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; I&#39;m still not convinced that any of the modes where -1=
 is printed are<br>
&gt;&gt;&gt;&gt; even working properly so it might be best to fix that rath=
er than just<br>
&gt;&gt;&gt;&gt; the printout.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; James, can you point me to reference for that meaning =
if I have missed anything.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; It&#39;s here:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;=C2=A0 /** Identify where counts are aggregated, -1 implies=
 not to<br>
&gt;&gt;&gt;&gt; aggregate. */<br>
&gt;&gt;&gt;&gt;=C2=A0 struct aggr_cpu_id {<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Thanks<br>
&gt;&gt;&gt;&gt;&gt; Athira<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; After the fix:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; perf stat -e instructions -A -a true<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Performance counter stats for &#39;system wide=
&#39;:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 64,034=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 68,941=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 59,418=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 70,478=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 65,201=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; CPU-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 63,704=C2=A0 =C2=A0 =C2=A0 instructions<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;&lt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This is caught while running &quot;perf test&q=
uot; for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;stat+json_output.sh&quot; and &quot;stat=
+csv_output.sh&quot;.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; Is it possible to fix the issue by making the test=
s cope with the lack<br>
&gt;&gt;&gt;&gt;&gt;&gt; of the CPU id?<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Reported-by: Disha Goel &lt;<a href=3D"mailto:=
disgoel@linux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">disgoel@li=
nux.vnet.ibm.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Athira Rajeev &lt;<a href=3D"ma=
ilto:atrajeev@linux.vnet.ibm.com" target=3D"_blank" rel=3D"noreferrer">atra=
jeev@linux.vnet.ibm.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; tools/perf/util/stat-display.c | 6 ++----<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1 file changed, 2 insertions(+), 4 deletions(-=
)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/tools/perf/util/stat-display.c b/=
tools/perf/util/stat-display.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index b82844cb0ce7..1b751a730271 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/tools/perf/util/stat-display.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/tools/perf/util/stat-display.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -168,10 +168,9 @@ static void aggr_printout=
(struct perf_stat_config *config,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.socket,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.die,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.core);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; This should have been &quot;id.cpu.cpu &gt; -1&quo=
t;. Looks like it was changed by<br>
&gt;&gt;&gt;&gt;&gt;&gt; some kind of bad merge or rebase in df936cadfb bec=
ause there is no<br>
&gt;&gt;&gt;&gt;&gt;&gt; obvious justification for the change to .core in t=
hat commit.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(config-&gt;out=
put, &quot;\&quot;cpu\&quot; : \&quot;%d\&quot;, &quot;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.cpu.cpu);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } els=
e {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (evsel-&gt;percore &amp;&amp; !config-&gt;perco=
re_show_thread) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(config-&gt;out=
put, &quot;S%d-D%d-C%*d%s&quot;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -179,11 +178,10 @@ static void aggr_printou=
t(struct perf_stat_config *config,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.die,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 config-&gt;csv_output ? 0 : -3,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.core, config-&gt;csv_sep);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else if (id.core &gt; -1) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(config-&gt;out=
put, &quot;CPU%*d%s&quot;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 config-&gt;csv_output ? 0 : -7,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 id.cpu.cpu, config-&gt;csv_sep);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break=
;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 case AGGR_THREAD:<br>
&gt;&gt;&gt;&gt;&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000007de18005ea369141--
