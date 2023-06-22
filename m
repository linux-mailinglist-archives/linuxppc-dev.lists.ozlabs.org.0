Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C273AD2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 01:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnGhR1MCSz3blN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 09:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.178; helo=mail-yb1-f178.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnGgv15n0z300N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 09:25:29 +1000 (AEST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-be49ca27e1fso26199276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 16:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687476327; x=1690068327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9D6B66keXspOwOyeSzVdCMdoaD18gxGOjW8uCE3irU=;
        b=MJ0N/4MXMk0NTmfOjFWc+U6CfrNd36sieLAymOzy43Sr0FeY1WtGkJQqD5t78CtB9c
         nMYtgen5tSJ0F9xffkDzwZ8L9ZVJbhUw0siwAc2+6MzpvLru6NP2ygJmnhcGhdK2QlLM
         sX0mEyfmuAcRLyjAtI9qGaNy5tR94fDRJw9Ze+yXPCcb9CSDPOWdbcV7+DaOzCXxBCrN
         w7GULsv1b5yV/peWZeH89H2sdE9vGF0XCsg0QQR3O9e/BYb8jksj0DlTnfwZB1G7TauV
         o0E6AxvwzqxbfOwI+vKE5U0Fw5Kifddqq2EWkVtPREsmU8A+QUCp6lVYaZPw0FK5tYX8
         3GeQ==
X-Gm-Message-State: AC+VfDy63mGxnLrW8PGtWS7osWfRRgZ1y4AVvDOs+Tb43jLrCOr7mNPS
	Jy9rq9ssCD9tKo23GnCS0/uCT9BIDRvO63zHWmE=
X-Google-Smtp-Source: ACHHUZ6ow45EkSIu6x2UiZKABNGioITYXlqZL321AvKNL3uQdrkqXktRyCwCb9+t4InlJhT0T+mWcfd32Q/+yl/jJXU=
X-Received: by 2002:a25:2693:0:b0:bcd:9e0d:168b with SMTP id
 m141-20020a252693000000b00bcd9e0d168bmr16144564ybm.31.1687476326755; Thu, 22
 Jun 2023 16:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com> <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
 <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com> <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
 <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com> <CAM9d7cgopOAyL0QgHs+x_O9A6v020Jyaju+EOv8ymS_cg1Sarg@mail.gmail.com>
In-Reply-To: <CAM9d7cgopOAyL0QgHs+x_O9A6v020Jyaju+EOv8ymS_cg1Sarg@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 22 Jun 2023 16:25:15 -0700
Message-ID: <CAM9d7cgUXf6ew8_jK5P83QMCcQw5EVOUbHq561==qzUrf9tujQ@mail.gmail.com>
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

Ok, I found two problems.

On Thu, Jun 22, 2023 at 2:33=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello Aditya,
>
> On Wed, Jun 21, 2023 at 11:43=E2=80=AFAM Aditya Gupta <adityag@linux.ibm.=
com> wrote:
> >
> > Hello Namhyung,
> >
> > On 21/06/23 20:53, Namhyung Kim wrote:
> > > Hello Aditya,
> > >
> > > On Wed, Jun 21, 2023 at 3:05=E2=80=AFAM Aditya Gupta <adityag@linux.i=
bm.com> wrote:
> > >> Hello Namhyung,
> > >>
> > >> On 21/06/23 06:18, Namhyung Kim wrote:
> > >>> ...
> > >>>
> > >>> $ sudo ./perf test -v task
> > >>> 114: perf script task-analyzer tests                               =
  :
> > >>> --- start ---
> > >>> test child forked, pid 1771042
> > >>> Please specify a valid report script(see 'perf script -l' for listi=
ng)

The first one is related to this message.  It couldn't find the script
(task-analyzer.py) because PERF_EXEC_PATH is not set.
Running with --exec-path=3D$PWD was ok, but I got a segfault.

The other problem is in set_regs_in_dict().  It tries to capture
register values in the sample and save them to a dictionary.
The sample doesn't have registers so it should have no problem.
But the 'bf' was not initialized properly when size is 0, and it led
PyUnicode_FromString() returning NULL.

After the changes, it ran ok:

$ sudo ./perf test -v task
116: perf script task-analyzer tests                                 :
--- start ---
test child forked, pid 204088
PASS: "test_basic"
PASS: "test_ns_rename"
PASS: "test_ms_filtertasks_highlight"
PASS: "test_extended_times_timelimit_limittasks"
PASS: "test_summary"
PASS: "test_summaryextended"
PASS: "test_summaryonly"
PASS: "test_extended_times_summary_ns"
PASS: "test_extended_times_summary_ns"
PASS: "test_csv"
PASS: "test_csvsummary"
PASS: "test_csv_extended_times"
PASS: "test_csvsummary_extended"
test child finished with 0
---- end ----
perf script task-analyzer tests: Ok

I'll send the fixes soon.

Thanks,
Namhyung


> > >>> FAIL: "invocation of perf command failed" Error message: ""
> > >>> FAIL: "test_basic" Error message: "Failed to find required string:'=
Comm'."
> > >>> Please specify a valid report script(see 'perf script -l' for listi=
ng)
> > >>> FAIL: "invocation of perf command failed" Error message: ""
> > >>> FAIL: "test_ns_rename" Error message: "Failed to find required stri=
ng:'Comm'."
> > >>> ...
> > >>> test child finished with -1
> > >>> ---- end ----
> > >>> perf script task-analyzer tests: FAILED!
> > >> Can you please check if your environment has libtraceevent devel
> > >> libraries (or did you compile with `make NO_LIBTRACEEVENT=3D1`) ? Wh=
en
> > >> libtraceevent support is not there, perf record fails and so perf.da=
ta
> > >> doesn't contain the strings it's searching for and hence those error=
s
> > >>
> > >> The error you mentioned has been mentioned and fixed in patch 17/17 =
of
> > >> this series.
> > > Thanks for your reply but It has libtraceevent.  Also, shouldn't it
> > > skip if it's not?
> > >
> > > Thanks,
> > > Namhyung
> >
> > The skipping is handled in the 17th patch in this series, and
> > considering that patch has also been applied, it will skip the tests if
> > perf wasn't built with proper libtraceevent support.
>
> Right, I tested it with the whole series applied.
> It skipped to run when I disable libtraceevent build.
>
> >
> > Back to the error, Sorry but I tested again on my system and am unable =
to reproduce the issue you are seeing when built with libtraceevent support=
.
> >
> > This is what I did:
> >
> > 0. git clone --depth=3D1 https://github.com/torvalds/linux
> > 0. cd linux/tools/perf
> > 0. git am patch_15/17.patch
> >
> > > I applied ONLY this patch (15/17) of this series, to a fresh linux tr=
ee
> >
> > 1. dnf install libtraceevent-devel
> > 2. make clean && make
> > 3. sudo ./perf test -v "perf script task-analyzer tests"       # Workin=
g fine, tests passed
> >
> > 4. dnf remove libtraceevent-devel
> > 5. make clean && make                                          # There =
will also be a warning during build: "libtraceevent is missing limiting fun=
ctionality"
> > 6. sudo ./perf test -v "perf script task-analyzer tests"       # Fails =
with the error you posted, which was the case till now, it's skipped when t=
he 17th patch is also applied and perf built without libtraceevent support
> >
> > The error in the second case (without proper libtraceevent support) is =
expected, as it was the case till now, that is fixed by the 17th patch, try=
 applying that also and build perf with `make NO_LIBTRACEEVENT=3D1`, it wil=
l skip then.
> >
> > Can you guide me with the steps to reproduce the error ?
>
> You can try the perf-tools-next branch in the perf/perft-tools-next.git r=
epo.
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
>
>   $ make clean all
>   $ sudo ./perf test -v task
>
> >
> > Sidenote: Just in case, please ensure you are running the perf as root =
here as `perf record -e sched:sched_switch -a -- sleep 1` requires root, wh=
ich has been used in `prepare_perf_data`
>
> Sure, I ran the perf test as root.
>
> Thanks,
> Namhyung
