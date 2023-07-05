Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB458748BC5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:25:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx7Pq5hq2z3c1J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:25:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.177; helo=mail-yb1-f177.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx7PG1mVHz301r
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 04:25:04 +1000 (AEST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so7827883276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 11:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581502; x=1691173502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLQigBjvEsL4L4SEWiFAmw+5TP0gGuXu4MpzoGKUTGI=;
        b=lESn49lTAkZ0C0mq2lqb5Lo81Wl+xoXxOaE4aIHO2qIjci2wInWwMlgnxc5rT42yTg
         kRD/UITanF2ctOyN6DDmoYZ+06ByMyJ83rmzUnnCTVR83BbCdF5iBruIqgBk8AGJcIYf
         13p9wMitUdgwvh9eK3XPGLFIbGnCVMtYTGExrEv8QcA9H9DV66Lbc30FrK5q9NavpJFh
         iPtCDVEOSo5tWfIYHhblyhL3lo+1Fa81bCGcs0MVkDxO5Tr9wTfIgY4B1fRvwrRpZrDG
         byGlAN31uYu9bqpfJUw1si8FuakU8BPVM8qB7Y4x+wv3xXXjjjBrZGDyiHp4D606XNqL
         c1GA==
X-Gm-Message-State: ABy/qLbcOuZ9oTXAmQBllEHvLOlunBIdUclZmYgG1JjXgyjIoudyYP07
	9DKi4xUymg0j3fpeo3tvk3w9KfbixX5yWs8F0n4=
X-Google-Smtp-Source: APBJJlEZp5VBkE7EXQVipl0ZmJqRv4vOXxGE3w348J8DHFyeF3664343o6i3s30KMoEQytttMjfQzMfNYTRdNgFwUHQ=
X-Received: by 2002:a25:8b06:0:b0:c57:81fd:904d with SMTP id
 i6-20020a258b06000000b00c5781fd904dmr6698484ybl.10.1688581501864; Wed, 05 Jul
 2023 11:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com> <AEE7B55C-BA6B-4E0E-A2E9-4E7EE09B4D50@linux.vnet.ibm.com>
In-Reply-To: <AEE7B55C-BA6B-4E0E-A2E9-4E7EE09B4D50@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 5 Jul 2023 11:24:50 -0700
Message-ID: <CAM9d7chEpdJkpWuxZD2-w89SFBm9CU28MpLA40LV+=GaLJXS1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/perf/tests: perf all metrics test fails when
 perf_event access is restricted
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 3, 2023 at 10:04=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 15-Jun-2023, at 1:08 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com>=
 wrote:
> >
> > Perf all metrics test fails as below when perf_event access
> > is restricted.
> >
> >    ./perf test -v "perf all metrics test"
> >    Metric 'Memory_RD_BW_Chip' not printed in:
> >    Error:
> >    Access to performance monitoring and observability operations is lim=
ited.
> >    Enforced MAC policy settings (SELinux) can limit access to performan=
ce
> >    =E2=80=94
> >    access to performance monitoring and observability operations for pr=
ocesses
> >    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capabilit=
y.
> >    =E2=80=94
> >    test child finished with -1
> >    ---- end ----
> >    perf all metrics test: FAILED!

In my system, it fails like below:

  $ ./perf test -v 101
  101: perf all metrics test                                           :
  --- start ---
  test child forked, pid 398458
  Testing branch_misprediction_ratio
  Testing all_remote_links_outbound
  Metric 'all_remote_links_outbound' not printed in:
  Error:
  Invalid event (remote_outbound_data_controller_3:u) in per-thread
mode, enable system wide with '-a'.
  Testing nps1_die_to_dram
  ...

Thanks,
Namhyung

>
>
> Hi,
>
> Looking for review comments on this patch.
>
> Thanks
> >
> > The perf all metrics test picks the input events from
> > "perf list --raw-dump metrics" and runs "perf stat -M "$m""
> > for each of the metrics in the list. It fails here for some
> > of the metrics which needs access, since it collects system
> > wide resource details/statistics. Fix the testcase to skip
> > those metric events.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> > tools/perf/tests/shell/stat_all_metrics.sh | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/te=
sts/shell/stat_all_metrics.sh
> > index 54774525e18a..14b96484a359 100755
> > --- a/tools/perf/tests/shell/stat_all_metrics.sh
> > +++ b/tools/perf/tests/shell/stat_all_metrics.sh
> > @@ -6,7 +6,9 @@ err=3D0
> > for m in $(perf list --raw-dump metrics); do
> >   echo "Testing $m"
> >   result=3D$(perf stat -M "$m" true 2>&1)
> > -  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not support=
ed>" ]]
> > +  # Skip if there is no access to perf_events monitoring
> > +  # and observability operations
> > +  if [[ "$result" =3D~ ${m:0:50} ]] || [[ "$result" =3D~ "<not support=
ed>" ]] || [[ "$result" =3D~ "Access to performance monitoring and observab=
ility operations is limited" ]]
> >   then
> >     continue
> >   fi
> > --
> > 2.31.1
> >
>
