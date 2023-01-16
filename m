Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DB66D137
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 23:01:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwmFW32gSz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 09:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nNjvKSs3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nNjvKSs3;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwmDZ6Yzhz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 09:00:45 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so257641wmq.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNMgnRdxl8cID5dDHZQku0mVCQNWegrqxUVZnzdGN40=;
        b=nNjvKSs3qKm3edSQucxlO+wqSAIaJBfNi6p974ivDyPbkfD8OZ+5nykh/KI0CjaL99
         ZME9P3rbqBe0w3vVscfSjuxMyr70jJgpfmAb9KdvkqTBrhUJpNL2cFmoXHQI09/3ffcM
         xKfMXfQeDGJ4VdSW+sRGlMmleWKNJbFBK+paWE5FucznXbSlp5PlaBiPepVgcOTH922c
         cVPaNj1quO1FKiniINuBvFIxBAGIN+Vq/X1KVn1VV0Z1/GQLknPUfX1Nwh5Jktp9HNn+
         Ons3PhsSm8KvF2oldYDiQH7KIOCmjmqySkSMRka3oebj7c1qn15LBRSqZwsT5eI+eGss
         nlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNMgnRdxl8cID5dDHZQku0mVCQNWegrqxUVZnzdGN40=;
        b=C2UPwcEGorHl1P74uUPVSzpyK9cl2aGRFxQt46utjMQ3OWv7XT1Wm58vyPrMzMAodi
         gC2gfvDqH37RKC17wX1Sfm9fQEAa50ewJ0Wf0HHZdSA5IG+aCAs12jfebTrCAiWC+yup
         mbN1jIQWOpReUbN5EcmvUYKd+Dm7kwTR5mB+MHMnLOMF215YH01LgZ8F7Wc91kTPpuvP
         KdxvMjoFIVss9e+Tew3pe7RYmeOIVDDaqFcgsVUwDbtIZscx4/JQH5CcLmIenFtjFTSF
         12iwzeurartR72kpLV7GHTPqOxaahQIW9OHzCdhE3+DmqoFjz6KBClwdsZmdMpwOSByR
         LR4g==
X-Gm-Message-State: AFqh2koT+Bf+ARtFeoxbnifUjdY13m2074UMh3gKZEWiSkwT1YBcENJt
	qWSjTLbupV93xfCurwf64VWNLFY8qmld3DlQ/OwICg==
X-Google-Smtp-Source: AMrXdXsHuIgBy5BIQSMKTjuF57zvRXqW6FJhSaYVpJ46vp68UspRzwYrRXRofjTIHrEnHoSLw6D3Ivsy7ftSB8M1BWQ=
X-Received: by 2002:a05:600c:1c9a:b0:3d9:ee45:8a9e with SMTP id
 k26-20020a05600c1c9a00b003d9ee458a9emr45362wms.174.1673906438517; Mon, 16 Jan
 2023 14:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
 <Yyy0W6CnPk7BkkCU@kernel.org> <444a5a64-7bc6-d5fd-2880-611c5cbca587@intel.com>
 <3EE5CFF3-51BC-444E-8FEF-2AC219E809F6@linux.vnet.ibm.com> <41461A8A-74F7-4938-9E8D-9F275114E906@linux.vnet.ibm.com>
 <CAP-5=fXWCYQSpp92L64+7Piu0sfEq+RsigNLUowgCjsT218jow@mail.gmail.com> <5CAD9B57-1788-4C7E-9658-7634A49D8BF0@linux.vnet.ibm.com>
In-Reply-To: <5CAD9B57-1788-4C7E-9658-7634A49D8BF0@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jan 2023 14:00:26 -0800
Message-ID: <CAP-5=fXS+8Wg8+Qrob+7fb5Y6FeBQphzd=Y0a1eh6xNwc-SfYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build
 id test
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 4:00 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 16-Jan-2023, at 11:47 AM, Ian Rogers <irogers@google.com> wrote:
> >
> > On Sun, Jan 15, 2023 at 9:03 PM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> >>
> >>
> >>
> >>> On 28-Sep-2022, at 10:24 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.c=
om> wrote:
> >>>
> >>> Hi All,
> >>>
> >>> Looking for what direction we can take here.
> >>> Do we want to change all tests in tools/perf/tests/shell except test_=
intel_pt.sh to use "bash" or go with
> >>> the approach in the patch ? Please share your comments
> >>>
> >>> Thanks
> >>> Athira
> >>>
> >>
> >> Hi All,
> >>
> >> Looking for what direction we can take here.
> >> Do we want to change all tests in tools/perf/tests/shell except test_i=
ntel_pt.sh to use "bash" or go with
> >> the approach in the patch ? Please share your comments
> >>
> >> Thanks
> >> Athira
> >
>
> Thanks Ian for the response.
>
> > I think some of what the patch is doing is good, some of it the
>
> Ian, can I take this as an ack for the patch so that Arnaldo can pick thi=
s in acme git ?

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > readability becomes a little harder by not being bash. I'm agnostic as
> > to which approach to take for the fix.
>
> May be we can take this as separate mail thread to get everyone=E2=80=99s=
 opinion on changing all tests in "tools/perf/tests/shell" except test_inte=
l_pt.sh to use =E2=80=9Cbash" ?
>
> >
> > An aside, I noticed that we do run some tests at build time:
> > https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/lib=
/Makefile?h=3Dperf/core#n390
> > So perhaps we can have a shellcheck build option, defaulted off but
> > enabled as part of Arnaldo's regular test scripts. The shellcheck
> > build option would run shellcheck to make sure that there weren't
> > errors in the shell code, which it is far too easy to introduce.
>
> Sure, that is a good option to have. I will check on having =E2=80=9Cshel=
lcheck" as a build option.
>
> Thanks
> Athira
>
> >
> > Thanks,
> > Ian
> >
> >>>> On 23-Sep-2022, at 11:54 AM, Adrian Hunter <adrian.hunter@intel.com>=
 wrote:
> >>>>
> >>>> On 22/09/22 22:15, Arnaldo Carvalho de Melo wrote:
> >>>>> Em Wed, Sep 21, 2022 at 10:38:38PM +0530, Athira Rajeev escreveu:
> >>>>>> The perf test named =E2=80=9Cbuild id cache operations=E2=80=9D sk=
ips with below
> >>>>>> error on some distros:
> >>>>>
> >>>>> I wonder if we shouldn't instead state that bash is needed?
> >>>>>
> >>>>> =E2=AC=A2[acme@toolbox perf-urgent]$ head -1 tools/perf/tests/shell=
/*.sh | grep ^#
> >>>>> #!/bin/sh
> >>>>> #!/bin/bash
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/bash
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/bash
> >>>>> #!/bin/sh
> >>>>> #!/bin/bash
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> #!/bin/sh
> >>>>> =E2=AC=A2[acme@toolbox perf-urgent]$
> >>>>>
> >>>>> Opinions?
> >>>>>
> >>>>
> >>>> Please don't change tools/perf/tests/shell/test_intel_pt.sh
> >>>>
> >>>> I started using shellcheck on that with the "perf test:
> >>>> test_intel_pt.sh: Add per-thread test" patch set that I sent.
> >>>>
> >>>> FYI, if you use shellcheck on buildid.sh, it shows up issues even
> >>>> after changing to bash:
> >>>>
> >>>> *** Before ***
> >>>>
> >>>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 69:
> >>>>      link=3D${build_id_dir}/.build-id/${id:0:2}/${id:2}
> >>>>                                     ^-------^ SC2039: In POSIX sh, s=
tring indexing is undefined.
> >>>>                                               ^-----^ SC2039: In POS=
IX sh, string indexing is undefined.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 77:
> >>>>      file=3D${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/e=
lf
> >>>>                                     ^-------^ SC2039: In POSIX sh, s=
tring indexing is undefined.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 123:
> >>>>      echo "running: perf record $@"
> >>>>                                 ^-- SC2145: Argument mixes string an=
d array. Use * or separate argument.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 124:
> >>>>      ${perf} record --buildid-all -o ${data} $@ &> ${log}
> >>>>                                              ^-- SC2068: Double quot=
e array expansions to avoid re-splitting elements.
> >>>>                                                 ^-------^ SC2039: In=
 POSIX sh, &> is undefined.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 126:
> >>>>              echo "failed: record $@"
> >>>>                                   ^-- SC2145: Argument mixes string =
and array. Use * or separate argument.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 131:
> >>>>      check ${@: -1}
> >>>>            ^------^ SC2068: Double quote array expansions to avoid r=
e-splitting elements.
> >>>>            ^------^ SC2039: In POSIX sh, string indexing is undefine=
d.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 158:
> >>>> exit ${err}
> >>>>   ^----^ SC2154: err is referenced but not assigned.
> >>>>
> >>>> For more information:
> >>>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansi=
ons to ...
> >>>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and =
array. ...
> >>>> https://www.shellcheck.net/wiki/SC2039 -- In POSIX sh, &> is undefin=
ed.
> >>>>
> >>>> *** After ***
> >>>>
> >>>> $ shellcheck -S warning tools/perf/tests/shell/buildid.sh
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 123:
> >>>>      echo "running: perf record $@"
> >>>>                                 ^-- SC2145: Argument mixes string an=
d array. Use * or separate argument.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 124:
> >>>>      ${perf} record --buildid-all -o ${data} $@ &> ${log}
> >>>>                                              ^-- SC2068: Double quot=
e array expansions to avoid re-splitting elements.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 126:
> >>>>              echo "failed: record $@"
> >>>>                                   ^-- SC2145: Argument mixes string =
and array. Use * or separate argument.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 131:
> >>>>      check ${@: -1}
> >>>>            ^------^ SC2068: Double quote array expansions to avoid r=
e-splitting elements.
> >>>>
> >>>>
> >>>> In tools/perf/tests/shell/buildid.sh line 158:
> >>>> exit ${err}
> >>>>   ^----^ SC2154: err is referenced but not assigned.
> >>>>
> >>>> For more information:
> >>>> https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansi=
ons to ...
> >>>> https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and =
array. ...
> >>>> https://www.shellcheck.net/wiki/SC2154 -- err is referenced but not =
assigned.
>
