Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A473ABAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnDC04157z3cM5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.176; helo=mail-yb1-f176.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnDBQ1gjtz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 07:33:17 +1000 (AEST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so7370923276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 14:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687469593; x=1690061593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNlPBraAb0ddYlZ5jLanYEj5hG5ppMWiPaAkJlDVGoo=;
        b=Vk3AVaBEwpO4fhRLIsxlMf56kGRveJQhN1xZrmboYu0sWrYxaOITxB7NU2ZCwudrHh
         gdwIjQhcpZ4PvRz/EpUhLgut5U0HeNfnVVOQRaNarGlk5OeSMnZPkWZ3R7/spaFCGiAq
         goaTzMAH4HDxu2qaz9sE/Fku3KlxF/KhylM5ZsiUfBQfPwFXpDwDVmYvbTqWYWcM1HkR
         RoeaO7abjTAvkIfBsAMkxUv+8K3hSFn69zRE7bIJTSc8tC7RBzN6sju+Uoq9ngRDu+wF
         PoE1tUaY3mAHOAGuTaReHxr75eqfGVoytZ8Hs0s5lg22A9IwbvIP4+AOHAYcw/Huv6Dj
         8YKg==
X-Gm-Message-State: AC+VfDwKKJ8BylRrHYqCdKFybvMaBFIsLdkQwOYYZAD3yg2nO3kiu/oa
	ZKonwgn6TAZ/Jxtv9+oDmG2mio0YNx+F6kvBXRE=
X-Google-Smtp-Source: ACHHUZ7ahP08mnJ+Pi0ywwdKgRpTuottvev/vWGMxKQ6Mn3ROdJWIjWu36O2obVi65pWifmkIbtWlVGZ96tjwWogEjk=
X-Received: by 2002:a0d:d485:0:b0:56d:541b:a02e with SMTP id
 w127-20020a0dd485000000b0056d541ba02emr19452926ywd.1.1687469593617; Thu, 22
 Jun 2023 14:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com> <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
 <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com> <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
 <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com>
In-Reply-To: <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 22 Jun 2023 14:33:01 -0700
Message-ID: <CAM9d7cgopOAyL0QgHs+x_O9A6v020Jyaju+EOv8ymS_cg1Sarg@mail.gmail.com>
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

On Wed, Jun 21, 2023 at 11:43=E2=80=AFAM Aditya Gupta <adityag@linux.ibm.co=
m> wrote:
>
> Hello Namhyung,
>
> On 21/06/23 20:53, Namhyung Kim wrote:
> > Hello Aditya,
> >
> > On Wed, Jun 21, 2023 at 3:05=E2=80=AFAM Aditya Gupta <adityag@linux.ibm=
.com> wrote:
> >> Hello Namhyung,
> >>
> >> On 21/06/23 06:18, Namhyung Kim wrote:
> >>> ...
> >>>
> >>> $ sudo ./perf test -v task
> >>> 114: perf script task-analyzer tests                                 =
:
> >>> --- start ---
> >>> test child forked, pid 1771042
> >>> Please specify a valid report script(see 'perf script -l' for listing=
)
> >>> FAIL: "invocation of perf command failed" Error message: ""
> >>> FAIL: "test_basic" Error message: "Failed to find required string:'Co=
mm'."
> >>> Please specify a valid report script(see 'perf script -l' for listing=
)
> >>> FAIL: "invocation of perf command failed" Error message: ""
> >>> FAIL: "test_ns_rename" Error message: "Failed to find required string=
:'Comm'."
> >>> ...
> >>> test child finished with -1
> >>> ---- end ----
> >>> perf script task-analyzer tests: FAILED!
> >> Can you please check if your environment has libtraceevent devel
> >> libraries (or did you compile with `make NO_LIBTRACEEVENT=3D1`) ? When
> >> libtraceevent support is not there, perf record fails and so perf.data
> >> doesn't contain the strings it's searching for and hence those errors
> >>
> >> The error you mentioned has been mentioned and fixed in patch 17/17 of
> >> this series.
> > Thanks for your reply but It has libtraceevent.  Also, shouldn't it
> > skip if it's not?
> >
> > Thanks,
> > Namhyung
>
> The skipping is handled in the 17th patch in this series, and
> considering that patch has also been applied, it will skip the tests if
> perf wasn't built with proper libtraceevent support.

Right, I tested it with the whole series applied.
It skipped to run when I disable libtraceevent build.

>
> Back to the error, Sorry but I tested again on my system and am unable to=
 reproduce the issue you are seeing when built with libtraceevent support.
>
> This is what I did:
>
> 0. git clone --depth=3D1 https://github.com/torvalds/linux
> 0. cd linux/tools/perf
> 0. git am patch_15/17.patch
>
> > I applied ONLY this patch (15/17) of this series, to a fresh linux tree
>
> 1. dnf install libtraceevent-devel
> 2. make clean && make
> 3. sudo ./perf test -v "perf script task-analyzer tests"       # Working =
fine, tests passed
>
> 4. dnf remove libtraceevent-devel
> 5. make clean && make                                          # There wi=
ll also be a warning during build: "libtraceevent is missing limiting funct=
ionality"
> 6. sudo ./perf test -v "perf script task-analyzer tests"       # Fails wi=
th the error you posted, which was the case till now, it's skipped when the=
 17th patch is also applied and perf built without libtraceevent support
>
> The error in the second case (without proper libtraceevent support) is ex=
pected, as it was the case till now, that is fixed by the 17th patch, try a=
pplying that also and build perf with `make NO_LIBTRACEEVENT=3D1`, it will =
skip then.
>
> Can you guide me with the steps to reproduce the error ?

You can try the perf-tools-next branch in the perf/perft-tools-next.git rep=
o.

  git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git

  $ make clean all
  $ sudo ./perf test -v task

>
> Sidenote: Just in case, please ensure you are running the perf as root he=
re as `perf record -e sched:sched_switch -a -- sleep 1` requires root, whic=
h has been used in `prepare_perf_data`

Sure, I ran the perf test as root.

Thanks,
Namhyung
