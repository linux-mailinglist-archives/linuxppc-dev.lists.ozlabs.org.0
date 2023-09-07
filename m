Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D4797EC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 00:40:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lntICPQj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhZ2F2TyHz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 08:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lntICPQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhZ1K5mkpz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 08:39:32 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-414ba610766so134511cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 15:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694126367; x=1694731167; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtv9dzYwGEPUB4ovcR5uml8jqsakIWZEfBU7crt0IY4=;
        b=lntICPQjAoKgIqmqon+u/yZyiJ2LtpSPKc9yWQTYR1R2T1BRqLa6P4eDs2qhW2gTTj
         dqrkCghgUYNqTKujkB+n36xIjTcbHLGWzM/UUQ7c/lP0hg0ZLvwJh09svxzVRCLdBYE+
         cL7v11utNphJ4/ttnbQz9qjvRiiN4+dedQG97MClrPqOCrCwJ3LaIAAuXEJTgRU7SvYi
         zFaLQyy1A/RQYjmOWMGYYIxbHisaHJbzFPcsT1fdrkg1khucw48ev4KLuTURxjeFSZkd
         rQvYGEZccyQ0NkwDlJBxr6qnewJJvE0pIOIEual/qD3tu6iHts/jsbd8APkGarzJ/z/c
         3YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694126367; x=1694731167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dtv9dzYwGEPUB4ovcR5uml8jqsakIWZEfBU7crt0IY4=;
        b=MsfZsW+T/g2lUBgB6gVRwrAionBMhSqXTAd+NeWdVFWXgY4rQrodQjj/bT3dvtZ01m
         6X5pN6IEx7GGC7P0j7PyIZp+u++a3ImZCB/ObueUMSjbT4MB9bHvy7AAGU7e9LZX6vhj
         AQkMCgwGCtVhKD9BtxzmAdmKGNYirlSPDtlKYn9KY9ByYimUAf5A0QnYzWxr17Ady+aH
         Ov9rPgi8oe0+g3MFP3qlGsunANEMBIHfLeaqYeCSl1iySzRHyqEap+60iaUu6UHrWVIa
         FiSN0dHd4IYEOoBF+SWaCehWVzTo9SwZfHpmJSmc7B4TqzUddLQzwYKxjmNO4ZeCPmXQ
         JqRA==
X-Gm-Message-State: AOJu0Yyo5NYVQKrl9dEJ9MTp8n5Nm5Ee7sMa9Md2DUZ/5Xuuo8rfiUtp
	CZdUI4L7gnb82leMtDN7FjYUKufW1Yn1Pz8BTRURqg==
X-Google-Smtp-Source: AGHT+IGQCD1giz7x0vXxyulVzIfgMyyDNVYuSRfcPv4V5rsD/6b5z1c5uLMx47n6lrTIWQv08u8mDgMuYMUI5XEJWp8=
X-Received: by 2002:ac8:5793:0:b0:410:9d31:68cd with SMTP id
 v19-20020ac85793000000b004109d3168cdmr39978qta.27.1694126367519; Thu, 07 Sep
 2023 15:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Sep 2023 15:39:15 -0700
Message-ID: <CAP-5=fWTSSH2vgxK7LM23mK-PbsOoZc+ZNq_8dL1X=dYMKemfA@mail.gmail.com>
Subject: Re: [PATCH V2] perf test: Fix parse-events tests to skip parametrized events
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 7, 2023 at 9:59=E2=80=AFAM Athira Rajeev
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
>
> Fix parse-events test to skip parametrized events since
> it needs proper setup of the parameters.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changelog:
> v1 -> v2:
>  Addressed review comments from Ian. Updated size of
>  pmu event name variable and changed bool name which is
>  used to skip the test.
>
>  tools/perf/tests/parse-events.c | 38 +++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-eve=
nts.c
> index 658fb9599d95..1ecaeceb69f8 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -2514,9 +2514,14 @@ static int test__pmu_events(struct test_suite *tes=
t __maybe_unused, int subtest
>         while ((pmu =3D perf_pmus__scan(pmu)) !=3D NULL) {
>                 struct stat st;
>                 char path[PATH_MAX];
> +               char pmu_event[PATH_MAX];
> +               char *buf =3D NULL;
> +               FILE *file;
>                 struct dirent *ent;
> +               size_t len =3D 0;
>                 DIR *dir;
>                 int err;
> +               int n;
>
>                 snprintf(path, PATH_MAX, "%s/bus/event_source/devices/%s/=
events/",
>                         sysfs__mountpoint(), pmu->name);
> @@ -2538,11 +2543,44 @@ static int test__pmu_events(struct test_suite *te=
st __maybe_unused, int subtest
>                         struct evlist_test e =3D { .name =3D NULL, };
>                         char name[2 * NAME_MAX + 1 + 12 + 3];
>                         int test_ret;
> +                       bool is_event_parameterized =3D 0;
>
>                         /* Names containing . are special and cannot be u=
sed directly */
>                         if (strchr(ent->d_name, '.'))
>                                 continue;
>
> +                       /* exclude parametrized ones (name contains '?') =
*/
> +                       n =3D snprintf(pmu_event, sizeof(pmu_event), "%s%=
s", path, ent->d_name);
> +                       if (n >=3D PATH_MAX) {
> +                               pr_err("pmu event name crossed PATH_MAX(%=
d) size\n", PATH_MAX);
> +                               continue;
> +                       }
> +
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
> +                               is_event_parameterized =3D 1;
> +
> +                       free(buf);
> +                       buf =3D NULL;
> +                       fclose(file);
> +
> +                       if (is_event_parameterized =3D=3D 1) {
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
