Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8C97388D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 17:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmS2q3DFtz3bl3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 01:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmS2J0wgQz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 01:23:35 +1000 (AEST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-bfe6ea01ff5so1021291276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 08:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361012; x=1689953012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/3AFmhGrnT7miz2C2qw2MKk/841rTkgAzatLOE0ayw=;
        b=BPZLnDUSJCq+l7j56YMsO6t9X3A9A4eI/toP7kDECtAWRuNWhb6XUf+cfojfY2nEEs
         Q9d8QHmClZRVwd6t4EX7PcyVi++fWkUVD1OSg2sh4WEvrJWQYZRsqkRnm4k+HfwRnrrX
         Lb0JZjQEZF8zhdrpe6Vlo77Wz7IxdYOb5rQv7hdNVv1j2OQ2HE/278WRDIBPv8ehszlj
         EWlyW1+WErrMnEzyHAkaR0O0A1Wcv8d21TrZ1TmapDmoDzuN1Qie2cnkjVRXh36zQb1G
         vadVJY466r5G2zAMkrS/XqZqv2xMvI0EVvDqekmhvp9/skjD9YBN2uQPwEcLxfDn/10i
         MICA==
X-Gm-Message-State: AC+VfDzoSZI9/4TUKYPUA4y3qLGf7qj7Avde46Slu39NfryE9KIpI4kA
	j42uZ2tSyMyRU6nZNxxH1MUO+wZvnMMPlWkvr/k=
X-Google-Smtp-Source: ACHHUZ7pv1M82zaGE8eykIulxbJ0/K7GzIgBbww4P2+H//HaGGZw4qWn45Wc3Pv5WXcy7xDcNv0U57YFueK6umYS/qA=
X-Received: by 2002:a25:abb1:0:b0:bc2:65d:6e9d with SMTP id
 v46-20020a25abb1000000b00bc2065d6e9dmr12122505ybi.11.1687361012341; Wed, 21
 Jun 2023 08:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com> <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com> <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com>
In-Reply-To: <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 21 Jun 2023 08:23:20 -0700
Message-ID: <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
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

On Wed, Jun 21, 2023 at 3:05=E2=80=AFAM Aditya Gupta <adityag@linux.ibm.com=
> wrote:
>
> Hello Namhyung,
>
> On 21/06/23 06:18, Namhyung Kim wrote:
> > Hello,
> >
> > On Tue, Jun 13, 2023 at 1:06=E2=80=AFPM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> >> Em Tue, Jun 13, 2023 at 10:11:43PM +0530, Athira Rajeev escreveu:
> >>> This issue due to ${$1} caused all function calls to give error in
> >>> `find_str_or_fail` line, and so no test runs completely. But
> >>> 'perf test "perf script task-analyzer tests"' wrongly reports
> >>> that tests passed with the status OK, which is wrong considering
> >>> the tests didn't even run completely
> >>>
> >>> Fixes: e8478b84d6ba ("perf test: add new task-analyzer tests")
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> >>> ---
> > I'm seeing a different error even after this fix.
> > Can you please take a look?
> >
> > Thanks,
> > Namhyung
> >
> >
> > $ sudo ./perf test -v task
> > 114: perf script task-analyzer tests                                 :
> > --- start ---
> > test child forked, pid 1771042
> > Please specify a valid report script(see 'perf script -l' for listing)
> > FAIL: "invocation of perf command failed" Error message: ""
> > FAIL: "test_basic" Error message: "Failed to find required string:'Comm=
'."
> > Please specify a valid report script(see 'perf script -l' for listing)
> > FAIL: "invocation of perf command failed" Error message: ""
> > FAIL: "test_ns_rename" Error message: "Failed to find required string:'=
Comm'."
> > ...
> > test child finished with -1
> > ---- end ----
> > perf script task-analyzer tests: FAILED!
> Can you please check if your environment has libtraceevent devel
> libraries (or did you compile with `make NO_LIBTRACEEVENT=3D1`) ? When
> libtraceevent support is not there, perf record fails and so perf.data
> doesn't contain the strings it's searching for and hence those errors
>
> The error you mentioned has been mentioned and fixed in patch 17/17 of
> this series.

Thanks for your reply but It has libtraceevent.  Also, shouldn't it
skip if it's not?

Thanks,
Namhyung
