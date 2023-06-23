Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DC573C4B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 01:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QntKm47Wrz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 09:11:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.179; helo=mail-yb1-f179.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QntKD0NwVz3bPJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 09:11:26 +1000 (AEST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bd5f59fb71dso1132263276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 16:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687561882; x=1690153882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwmigcEEESvOYD+x372yFpLKh6lHO297GOtcjzBMVLY=;
        b=LG87jEpSHm5yWOhcGe0GXdA57AfkoVABfuzRNwttSTeYIK6IQzGvzN1JG/sDvx60lB
         JwN0Fl6puLpEr3a8jF7cMYa+0dY+sBX3yBFwQqQE6n+hB6KOWhiDOREeE6JmEmoQVZK/
         wJb0hib/jka6dZ0Gv/WhLfKZwMzEc0TNfA2A5fFeujUA1WUkPBvOFce53ih8cqvBhRIa
         aB3wbx2ulL+cEWVHAvDho5NkLnHWdihdu+GPmOWNE5gIPQfqG0BatsWsbyxWYm3F10KV
         Yx2WUCZvQDRC+rC4tXAnumOgAPpeIy9Xl+NzH3n1GB+5JuD7RxodutoJRvEXCEsYqF5k
         j6sg==
X-Gm-Message-State: AC+VfDwnYhe7A21Vl7ZqRooJFMFz4mn0t5g9cPX4vDn5Htou+uWViOfC
	G/BhtfTRlSEpkP4BX5LuukS5ZXlSEGHXklLiWAU=
X-Google-Smtp-Source: ACHHUZ5t8GihsmR3Ov20If3Bon5OlbqGAkJKblrWwfE1YAH6V6f+YIni54il9aoP0qvOo5B1b/MJXPyzZVbmN4Niv9k=
X-Received: by 2002:a25:ef12:0:b0:bec:9efe:100e with SMTP id
 g18-20020a25ef12000000b00bec9efe100emr20772059ybd.14.1687561882002; Fri, 23
 Jun 2023 16:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com> <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
 <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com> <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
 <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com> <CAM9d7cgopOAyL0QgHs+x_O9A6v020Jyaju+EOv8ymS_cg1Sarg@mail.gmail.com>
 <CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com> <89f3889b-7d1e-0b04-34a0-f6eb8d9309c8@linux.ibm.com>
In-Reply-To: <89f3889b-7d1e-0b04-34a0-f6eb8d9309c8@linux.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 23 Jun 2023 16:11:10 -0700
Message-ID: <CAM9d7cjL0ddXSNej2KWuPBqCbgGP8kjLwzt9yX9CnA05jsfBtQ@mail.gmail.com>
Subject: Re: [PATCH 15/17] perf tests task_analyzer: fix bad substitution ${$1}
To: Aditya Gupta <adityag@linux.ibm.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, Hagen Paul Pfeifer <hagen@jauu.net>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, ravi.bangoria@amd.com, maddy@linux.ibm.com, jolsa@kernel.org, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Aditya,

On Fri, Jun 23, 2023 at 11:19=E2=80=AFAM Aditya Gupta <adityag@linux.ibm.co=
m> wrote:
>
> Hello, Namhyung,
>
> On 23/06/23 04:55, Namhyung Kim wrote:
> > Ok, I found two problems.
> >
> > ...
> >
> > The first one is related to this message.  It couldn't find the script
> > (task-analyzer.py) because PERF_EXEC_PATH is not set.
> > Running with --exec-path=3D$PWD was ok, but I got a segfault.
> >
> > The other problem is in set_regs_in_dict().  It tries to capture
> > register values in the sample and save them to a dictionary.
> > The sample doesn't have registers so it should have no problem.
> > But the 'bf' was not initialized properly when size is 0, and it led
> > PyUnicode_FromString() returning NULL.
> >
> > After the changes, it ran ok:
> >
> > $ sudo ./perf test -v task
> > 116: perf script task-analyzer tests                                 :
> > --- start ---
> > test child forked, pid 204088
> > PASS: "test_basic"
> > PASS: "test_ns_rename"
> > PASS: "test_ms_filtertasks_highlight"
> > PASS: "test_extended_times_timelimit_limittasks"
> > PASS: "test_summary"
> > PASS: "test_summaryextended"
> > PASS: "test_summaryonly"
> > PASS: "test_extended_times_summary_ns"
> > PASS: "test_extended_times_summary_ns"
> > PASS: "test_csv"
> > PASS: "test_csvsummary"
> > PASS: "test_csv_extended_times"
> > PASS: "test_csvsummary_extended"
> > test child finished with 0
> > ---- end ----
> > perf script task-analyzer tests: Ok
> This is interesting. I did not encounter these earlier.
>
> > I'll send the fixes soon.
> >
> Thanks for fixing it.

No problem.

> >>> You can try the perf-tools-next branch in the perf/perft-tools-next.g=
it repo.
> >>>
> >>>    git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next=
.git
> >>>
> >>>    $ make clean all
> >>>    $ sudo ./perf test -v task
> >>>
>
> I tested with the steps provided, i.e.. clone, /*apply patch 15 (added
> this step myself)*/, clean, make, ./perf test -v test. But still- test
> passed:
>
> '''
> ~/temp_clones/perf-tools-next/tools/perf git:(master) sudo ./perf test
> -v test
>
> ...
>
> --- start ---
> test child forked, pid 75261
> PASS: "test_basic"
> PASS: "test_ns_rename"
> PASS: "test_ms_filtertasks_highlight"
> PASS: "test_extended_times_timelimit_limittasks"
> PASS: "test_summary"
> PASS: "test_summaryextended"
> PASS: "test_summaryonly"
> PASS: "test_extended_times_summary_ns"
> PASS: "test_extended_times_summary_ns"
> PASS: "test_csv"
> PASS: "test_csvsummary"
> PASS: "test_csv_extended_times"
> PASS: "test_csvsummary_extended"
> test child finished with 0
> ---- end ----
> '''
>
> Maybe my environment had that other things set in a way that, I did not
> face any issue (I don't recall doing any special thing with my
> environment though, and these patches have been tested multiple times by
> more people also).
> But thanks for your efforts to debug and fix the issue.

I don't know but you might either set PERF_EXEC_PATH env or
install the scripts somewhere that can be found by default.

Thanks,
Namhyung
