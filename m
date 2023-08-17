Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69A77FDF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 20:39:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XBZxBeIN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRYgT4D1tz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 04:39:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XBZxBeIN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRYfb0Ypyz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 04:38:13 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4036bd4fff1so47861cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692297490; x=1692902290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBXuyN+ahMK3TbcSAx1pMX5YQur64tRC/lM98OoMLEM=;
        b=XBZxBeIN0lBI1AMcgB9g7mGtwv891PkzGmYi+9B8s9C6Zm8uIx2PEaQtt9Za5yHEwy
         fGFi5uPXNJZyBjBTZfJm2xVkE3zE9/+RT1OEROUrhtrsVDTyRaUr1SamR7/hi0ZoI6vT
         owxi4SufEpgbgvhrgwjFjKX5Dz9Ye4HQFWeXebMmx84wDP0PjqP2+32Y1NcQxWA5KArA
         OhT87ucoU7QClISylApED1Zf08IGqwhjpryMJR6KEu2zk8A51CDhd7ZKJmHCUGE7QICs
         lIC6CKJY+kWJTgWurA4ksnCh4XeJWsn7ndoG9qI//SmY/ixkbLotNWEznt6wzi6Lm4OA
         8HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692297490; x=1692902290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBXuyN+ahMK3TbcSAx1pMX5YQur64tRC/lM98OoMLEM=;
        b=NoIMXZGv00NfePwJ8TYPPgLTxUGCMCAG+OdCaTJpHrHQQQ/o2kSC0tdwrFT/KQ+Yks
         ruwWe/z50sRUZJ6YdHGAXlPhjdbzGWLB9rrhsRUUdv0I8NWAiDZ07z+Z4zorH6mdVtS/
         6RmWXIvdhx5TKdvvt+Ig2OTh66OliI3GHFxnti5L9Dih05Qh38v96WiuiNR6YT2yFRc/
         oZoLx48vFsZ+yot6yQuOd61eQ3ru7sWju7chL2HFeSXPB+RiF9E0rk7U4BSfNC/j/M0I
         8mGq0m3P6ZgSVMIiUKrAf4upEwuX07J0/kNwHX1WbJS/7jDn0Wt5ltXUVkVOnfx+xIXp
         JCuA==
X-Gm-Message-State: AOJu0Yz1kAfsOZ4fPtKQhB+qrEF3ndwQayal3GyAxqkKqNJa/kQpYhct
	Q/GZ4C93ORQVweb597zT3A0NpDIy47YH56wmDPRe7sZwhbMwqqCDk9a3iAVl
X-Google-Smtp-Source: AGHT+IEa9b8tTW/2LEF3u0NHHlIEqrr58RmrKo4P/+dgsIVWsAHNyNloURXbZpi87Qv7ldVvmTkPDt3L0xvcsIeWpwA=
X-Received: by 2002:ac8:5a8b:0:b0:40d:eb06:d3cc with SMTP id
 c11-20020ac85a8b000000b0040deb06d3ccmr30401qtc.7.1692297490348; Thu, 17 Aug
 2023 11:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230807045016.23409-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230807045016.23409-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 17 Aug 2023 11:37:59 -0700
Message-ID: <CAP-5=fXJNqokOKJmu1n1kXUqaqabQrsXw42FVi-MrZb3Ss5R-A@mail.gmail.com>
Subject: Re: [PATCH] perf test: Fix parse-events tests to skip parametrized events
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 6, 2023 at 9:50=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Testcase "Parsing of all PMU events from sysfs" parse events for
> all PMUs, and not just cpu. In case of powerpc, the PowerVM
> environment supports events from hv_24x7 and hv_gpci PMU which
> is of example format like below:
>
> - hv_24x7/CPM_ADJUNCT_INST,domain=3D?,core=3D?/
> - hv_gpci/event,partition_id=3D?/
>
> The value for "?" needs to be filled in depending on system
> configuration. It is better to skip these parametrized events
> in this test as it is done in:
> 'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
> parametrized events")' which handled a simialr instance with
> "all PMU test".

I'd say this is different, the "?" is really ugly. On other
architectures the problem is solved by having >1 PMU, domain and core
can be meta-data associated with the PMU. If we want to aggregate
based on domain and core in the perf tool, it will need a different
way of solving the problem for Power. Skipping the test is just
pushing this problem down the road.

> Fix parse-events test to skip parametrized events since
> it needs proper setup of the parameters.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/parse-events.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-eve=
nts.c
> index b2f82847e4c3..605373c7d005 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -2504,7 +2504,11 @@ static int test__pmu_events(struct test_suite *tes=
t __maybe_unused, int subtest
>         while ((pmu =3D perf_pmus__scan(pmu)) !=3D NULL) {
>                 struct stat st;
>                 char path[PATH_MAX];
> +               char pmu_event[PATH_MAX + 256];

By definition paths can't be longer than PATH_MAX.

> +               char *buf =3D NULL;
> +               FILE *file;
>                 struct dirent *ent;
> +               size_t len =3D 0;
>                 DIR *dir;
>                 int err;
>
> @@ -2528,11 +2532,39 @@ static int test__pmu_events(struct test_suite *te=
st __maybe_unused, int subtest
>                         struct evlist_test e =3D { .name =3D NULL, };
>                         char name[2 * NAME_MAX + 1 + 12 + 3];
>                         int test_ret;
> +                       int skip =3D 0;

Prefer a boolean. Prefer is_event_parameterized over skip to make
variable name more intention revealing.

>
>                         /* Names containing . are special and cannot be u=
sed directly */
>                         if (strchr(ent->d_name, '.'))
>                                 continue;
>
> +                       /* exclude parametrized ones (name contains '?') =
*/
> +                       snprintf(pmu_event, PATH_MAX + 256, "%s%s", path,=
 ent->d_name);

Use sizeof(pmu_event) rather than "PATH_MAX + 256".

Thanks,
Ian

> +                       file =3D fopen(pmu_event, "r");
> +                       if (!file) {
> +                               pr_debug("can't open pmu event file for '=
%s'\n", ent->d_name);
> +                               ret =3D combine_test_results(ret, TEST_FA=
IL);
> +                               continue;
> +                       }
> +
> +                       if (getline(&buf, &len, file) < 0) {
> +                               pr_debug(" pmu event: %s is a null event\=
n", ent->d_name);
> +                               ret =3D combine_test_results(ret, TEST_FA=
IL);
> +                               continue;
> +                       }
> +
> +                       if (strchr(buf, '?'))
> +                               skip =3D 1;
> +
> +                       free(buf);
> +                       buf =3D NULL;
> +                       fclose(file);
> +
> +                       if (skip =3D=3D 1) {
> +                               pr_debug("skipping parametrized PMU event=
: %s which contains ?\n", pmu_event);
> +                               continue;
> +                       }
> +
>                         snprintf(name, sizeof(name), "%s/event=3D%s/u", p=
mu->name, ent->d_name);
>
>                         e.name  =3D name;
> --
> 2.31.1
>
