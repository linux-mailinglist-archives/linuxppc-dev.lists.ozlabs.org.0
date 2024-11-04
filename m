Return-Path: <linuxppc-dev+bounces-2845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9F9BBEF2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 21:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3Pf64Tsz2yY0;
	Tue,  5 Nov 2024 07:45:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730753110;
	cv=none; b=ePkfdWRNVFIxt1ZtNkAvg439TT3U/Uwko0yq7Wtm0E5U37zM+4Wx6I6AJs4Wl49SWmq7IR/A2fT830oPZRzbFGhlinZmoYVeiI5ZIiCiUojRGUceJZ4I2VXs2vb5+MbErxKVQR4VEAtU4qCDVIwFDr5oKntn4Nfu2p+RS6hiwTpo/UUSrH2fmOY7GspiJyKZMgCFKkhj/Xdl0NsfVhUcxVC01wixBw7rusH/sJ+iZ/0wiNEAr3hSagRwv7EGlNwVfTV5A2jHE9bXUjPalZ/MrCEygRw6TraLZeSWXJ2ePFxVnIGnHJwUOdhdTnzF4qj7EfS5fFpIauRtlFwPBwwF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730753110; c=relaxed/relaxed;
	bh=He3P8aPu/Jm2CYhNDWEntlDA9h70vRKHNVKjtIl0OdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itZZd5YGCOXZOG+Ga2Qf9ont+qD1G3giHsDk9mLCmTJkMwoYeyVh3Vj4sjMifDeQMjO/xDRJ/fWVf3rS8pl+Fclpc0AkJKTLiWHPEGYp20wIdGgjyH+KmbTN8SNZkGY6imD6kVe3oPJmo53sjrKg0693+p5nNNyhW9Yxp23tlm8CGuIfBbAzkEJ+aQYIUjbJg2CcNEOGpG/WswRVgGPRhBf5O7dlo3zWJ7ea353WuSQm2Vb2u57zswPpO+hCC+ekBX+mMrheKrzWTt2YTNy5QXfocdrJ6xtukdp6uXX4qfXwPn7Ub4H5tRd8vID3lCULOqtspD5fSp2JGb3cCWHTyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zkaw0UCv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zkaw0UCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3Pd0n4Bz2yR5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 07:45:07 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3a6c3bdbebcso9665ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730753102; x=1731357902; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He3P8aPu/Jm2CYhNDWEntlDA9h70vRKHNVKjtIl0OdM=;
        b=zkaw0UCvEh/aYYQ3wxI2dWQ9ERMKSanmL+JJHnrSmERRUDZmN3sNnpLhmCNnAa5r84
         Zr1xiwRJWP5v5NW0Beg0x3pLyrroJni6Svt5Cs01nn9Wb1A27czM92q8FcBx9Nb+AlNk
         Kis6hOQtHOZjL8z4Jc3cxCP15zHUUNsC9AZEUsAAuklrc2LK6BTbrRaGXEKb7G0pzKcE
         2jAhwskpOaaqymSNuvdH6bVcyZjRhFQ9dV4xIz/afyH6XUGKMY1cCDF4OoNRc5bPcFI5
         UyPmHT3DIF9pR6Z0ob7QtrALLpZL5Q2xK5ZhM7QHPkz2g78E1rJM3EWPrdB/UiVqnTp8
         sA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730753102; x=1731357902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He3P8aPu/Jm2CYhNDWEntlDA9h70vRKHNVKjtIl0OdM=;
        b=sNLRy/n+lXxhqDWZWPY/Rmwp3DUFxj6KlEpB9THRe9wJzLSAUNdJd7RMNEpmjOMwju
         8773Hq89RnqkEWiTtFv4RWw1ZUhaLA+xr7fsM2eIePsAUwS2htPewJZIs3GIZp9SjF5C
         a5w/x991ZWUpPkmtsRyQpKQ2DY6DuDl67UDv5rmAFp3QQYjGCahi/wo/m6ubvSIqSxO9
         2koOQ5DJzpVb+iTQ3NnCboDPJDWefRXX0P/dWnKfLJG/g8t4dxSgEe3aFnYev9gpyG2A
         lBfMxyv9Qeip6Os2X0hVgIZtK4/pjLLlt/xqZM5acEvbIa2kc+45zbq9LtvyWDRnj4u2
         trBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTe5szImS0jliH2R+H1mjcMJeAGMhF5k1MTsXxh0/kww/W2CtUvNgB3I0bSOwoH2ldQIklRamlQpXC3gQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+RzcETrfmaojoWkju9TWSe2PHW3XT5CkC63m+IIM+J5K372iS
	nrjTOkiS/F+rn/oqZ2j0JkpiesnrEJ28BKCy0dku0SOEwfFCWEwc81CGdOEh1/dJgE5Sj8AGrif
	BN03hlNrIgxF5yiKYh9p3LfDL7gdKU+xQlTVA
X-Gm-Gg: ASbGncsaZ/BcC2gCLxfB/4UgyuPg1gSdOHfS9SmdA8pvZTc6I09HbiqfttF8xZT1+NY
	Ed3NHvSsJQNGjtC09Qoeq9RiW0t86PPARosZ3f7azKQz2ftJbjUiO9byKZUv47A==
X-Google-Smtp-Source: AGHT+IFfnbN9BAA2BakuIB2L/xKT1aGeT83pEF3lKubysgH7OYLfMygoLxxccfWtXB15UBsXLNUWr0QuSRdAoh5f9KU=
X-Received: by 2002:a05:6e02:154d:b0:377:1653:a1da with SMTP id
 e9e14a558f8ab-3a6daaa5be9mr713115ab.19.1730753101548; Mon, 04 Nov 2024
 12:45:01 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241022140156.98854-1-atrajeev@linux.vnet.ibm.com>
 <ZyF2-XNUh38p_5Gg@google.com> <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
In-Reply-To: <B72F330F-2A56-41B0-ABED-FCA7DC9EE711@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Nov 2024 12:44:50 -0800
Message-ID: <CAP-5=fXCYURva6Q8ktRVmnf2QCcsr-E3fPn327k0JRCw_9fn3A@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests/expr: Make the system_tsc_freq test only
 for intel
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, tmricht@linux.ibm.com, 
	acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, 
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 3, 2024 at 8:17=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 30 Oct 2024, at 5:29=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
> >
> > Hello,
> >
> > On Tue, Oct 22, 2024 at 07:31:56PM +0530, Athira Rajeev wrote:
> >> The "Simple expression parser" test fails on powerpc
> >> as below:
> >>
> >> parsing metric: #system_tsc_freq
> >> Unrecognized literal '#system_tsc_freq'literal: #system_tsc_freq =3D n=
an
> >> syntax error
> >> FAILED tests/expr.c:247 #system_tsc_freq
> >> ---- end(-1) ----
> >> 7: Simple expression parser  : FAILED!
> >>
> >> In the test, system_tsc_freq is checked as below:
> >>
> >> if (is_intel)
> >>    TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> >> else
> >>
> >> But commit 609aa2667f67 ("perf tool_pmu: Switch to standard
> >> pmu functions and json descriptions")' changed condition in
> >
> > Probably need to put it as Fixes: tag.
> >
> >
> >> tool_pmu__skip_event so that system_tsc_freq event should
> >> only appear on x86
> >>
> >> +#if !defined(__i386__) && !defined(__x86_64__)
> >> +       /* The system_tsc_freq event should only appear on x86. */
> >> +       if (strcasecmp(name, "system_tsc_freq") =3D=3D 0)
> >> +               return true;
> >> +#endif
> >>
> >> After this commit, the testcase breaks for expr__parse of
> >> system_tsc_freq in powerpc case. Fix the testcase to have
> >> complete system_tsc_freq test within "is_intel" check.
> >
> > Ian, are you ok with this?
> >
> > Thanks,
> > Namhyung
> >
>
> Hi Ian
>
> If the change looks good to you, I will send a V2 with Fixes tag added. P=
lease share your review comments
>
> Hi James, Thomas
>
> Looking for help to test since in non-intel platform, this test will fail=
 without the patch


Hi Athira,

sorry for the breakage and thank you for the detailed explanation. As
the code will run on AMD I think your change will break that - . It is
probably safest to keep the ".. else { .." for this case but guard it
in the ifdef.

Thanks,
Ian

> Thanks
> Athira
>
> >>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> tools/perf/tests/expr.c | 7 +++----
> >> 1 file changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tools/perf/tests/expr.c b/tools/perf/tests/expr.c
> >> index e3aa9d4fcf3a..eb3bd68fc4ce 100644
> >> --- a/tools/perf/tests/expr.c
> >> +++ b/tools/perf/tests/expr.c
> >> @@ -244,11 +244,10 @@ static int test__expr(struct test_suite *t __may=
be_unused, int subtest __maybe_u
> >> if (num_dies) // Some platforms do not have CPU die support, for examp=
le s390
> >> TEST_ASSERT_VAL("#num_dies >=3D #num_packages", num_dies >=3D num_pack=
ages);
> >>
> >> - TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_=
tsc_freq") =3D=3D 0);
> >> - if (is_intel)
> >> + if (is_intel) {
> >> + TEST_ASSERT_VAL("#system_tsc_freq", expr__parse(&val, ctx, "#system_=
tsc_freq") =3D=3D 0);
> >> TEST_ASSERT_VAL("#system_tsc_freq > 0", val > 0);
> >> - else
> >> - TEST_ASSERT_VAL("#system_tsc_freq =3D=3D 0", fpclassify(val) =3D=3D =
FP_ZERO);
> >> + }
> >>
> >> /*
> >>  * Source count returns the number of events aggregating in a leader
> >> --
> >> 2.43.5
>
>

