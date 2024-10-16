Return-Path: <linuxppc-dev+bounces-2325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B82B9A123F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 21:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTL526bXPz2yQJ;
	Thu, 17 Oct 2024 06:05:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729105510;
	cv=none; b=jXPV7Jrz+ETK2pM0mFqcTdl6yKyFAatzJI72sSGqR5Imvn/reKybAMtQTl3UJ3Jgv3WTafG/Xi79iKbtxGRJ/LEenceMd2SwnNyy0KBdjjhwotFPIsZxUy5vTsdzXpMRcWqynrjCVfUIrWDpFxmomzrrd5I2MI/RyFlm/akdvOEmiHW84st2PEl5DXRYKsMh5F2vwuQw2w0ThSd5uH1tTknzc1t00EwdLi/Emej3Ocn61yskpCJy3NbltpLHTjNztET8fWU1i0HikLbtSGqtxKgB7nzxgdcg/502fBPRvBkW35gwkeSCluWs7bNM4U5ZPbYw0Dszi5rOX34vaN3nGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729105510; c=relaxed/relaxed;
	bh=t7zRfX4mGGXxSTxvTu2G9/F4Ncm83GwEzwpAfcljlS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wqq9ugccizTmOOKKtaGdeGp44bT+BIB0A2lqMhP9nNwkKodmeTRTvF8bTVdTe7295LYINgo/Y9SIdDlR25sZr61Uqk4lHEBTGdD2S4ZGd1LZnPmsfts02y/jD6vccLfwsnIKEUz1ffEymGnelJVg6EUFFdqqtDayeXIh4xlksri1WQINhcPGAVLG/XqSUDKD0TnpvybaRkrifAb5EUWujNkocQ5lvcNijtLORX2U30hqIud09HiJKhFdI6Xz00oZ3OO5vvShprEGGFjv21cRG8IpwT7ab62Z2W/PPekldHR40xJNu0Xdh51dNafIpkdb0aZ1btysrt7Y8vhePrulMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3X+Hv61F; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3X+Hv61F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTL512QZHz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 06:05:08 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-45fb0ebb1d0so51071cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729105503; x=1729710303; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7zRfX4mGGXxSTxvTu2G9/F4Ncm83GwEzwpAfcljlS0=;
        b=3X+Hv61FygSpmyYPScyCEVU98of+/a6Y9/017FmVwR9RSv199Jtkjh/3QKKGYX9V3o
         hWWKzN7nVcrgv/en/P8+9WDj/Ppt7JRyL39TYZVbRB1O7bez/Nlq6UchFJlyWnRZQOqw
         3mE1eVtKZXhIKcCeTpvyDA9nIX1aflWuPfCJ4+hfcrgraEu/Gt8WW5BzvDXp2YfxzuFw
         zc/cKuFRo1lgb9/mWH4IHW5hKcHjFa/1F3uQVmzJWOct+LmmUT8vxqtE+oiHmBqY6CMs
         ZWQeq7StC8LsNSFw4bmJSN4O36veViClhYEOtjstRC1N59cVUhijZc+pV07BpZaKvrtf
         WtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729105503; x=1729710303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7zRfX4mGGXxSTxvTu2G9/F4Ncm83GwEzwpAfcljlS0=;
        b=KXyITkh6leaRGkPd3umr2yEwP/a01AbbJPQsxKJE3B1J54NstYFadCBl6UFyB46Yf1
         R5elqX6l2a/+/VGriwpQ4Bh/SJ3RWFdJQ88s4YuYaUAgA14S3KwPeDzaEPAOsR7X8/PY
         6+owaW7W9C49qE6c8hjufvbk6keNuHeAdVil1bDH71ZLDL6U7zCQwKvFfQFzCHLmSNBG
         GteX7ahY77ORZorvz+UWJWbG/DQ7GKOsGT9X9HVxqR5DB1ZWhZAvv+hDRZdPPV5pXn87
         RrbC5SE5uamMnm/VuVYCa5GfviAqJaJmFWxyMien15FFrlMyJtULr2mRuC/h1Pc7G2t/
         coFw==
X-Forwarded-Encrypted: i=1; AJvYcCX3IxaJ+PvpzHGqF0EtD4kJuxjUe3Nu9IH0Ml2LQ0PMVoTl/IGkbGhZQ/TQxgn+ys22o4Eblepix22lT8E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRW77+RS1V1OMhA3qWdRwRw0exSXJ1YFkkkGbuDCA3Kwr1q6+L
	vi8QQFlYnTGq1naF1IlK8xeO74poGs20ULwBtXnr3Q+ndyOSw7AMoH0HZOFhoMDwxSl5HUCpEpR
	I1x6gN4BnMvFQF0fysrQiIJ3xbxslHZXoZbEt
X-Google-Smtp-Source: AGHT+IF6yT/3DZPUJjVREQ085mlGzCKYggvS44niMjh+ismHxC3q3Agj0jop5VQ9GGNmLz4ZIwzzoI848WEnMWOHipc=
X-Received: by 2002:a05:622a:a709:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4609c8e1bf2mr479661cf.26.1729105502801; Wed, 16 Oct 2024
 12:05:02 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
 <Zw1UXbWTS9Gk3lmw@google.com> <8B5B2251-E41E-4584-881E-61A468AFB222@linux.vnet.ibm.com>
 <CAP-5=fWQsQp3WgJcLvZWsBsiJ2VzxP6j2kOfd5Hrzi0oBUNy2g@mail.gmail.com> <E64BA2C9-3046-4C96-ACB8-A4F0D99BDA40@linux.vnet.ibm.com>
In-Reply-To: <E64BA2C9-3046-4C96-ACB8-A4F0D99BDA40@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 16 Oct 2024 12:04:49 -0700
Message-ID: <CAP-5=fWEkpxsUkX_o_wMjkn6rvwr81oGPJ=6_85Q45RZhqXUng@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests: Fix compilation error with strncpy in tests/tool_pmu
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, acme@kernel.org, jolsa@kernel.org, 
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 11:23=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 16 Oct 2024, at 8:36=E2=80=AFPM, Ian Rogers <irogers@google.com> wro=
te:
> >
> > On Wed, Oct 16, 2024 at 5:30=E2=80=AFAM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> >>
> >>
> >>
> >>> On 14 Oct 2024, at 10:56=E2=80=AFPM, Namhyung Kim <namhyung@kernel.or=
g> wrote:
> >>>
> >>> Hello Athira,
> >>>
> >>> On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
> >>>> perf fails to compile on systems with GCC version11
> >>>> as below:
> >>>>
> >>>> In file included from /usr/include/string.h:519,
> >>>>                from /home/athir/perf-tools-next/tools/include/linux/=
bitmap.h:5,
> >>>>                from /home/athir/perf-tools-next/tools/perf/util/pmu.=
h:5,
> >>>>                from /home/athir/perf-tools-next/tools/perf/util/evse=
l.h:14,
> >>>>                from /home/athir/perf-tools-next/tools/perf/util/evli=
st.h:14,
> >>>>                from tests/tool_pmu.c:3:
> >>>> In function =E2=80=98strncpy=E2=80=99,
> >>>>   inlined from =E2=80=98do_test=E2=80=99 at tests/tool_pmu.c:25:3:
> >>>> /usr/include/bits/string_fortified.h:95:10: error: =E2=80=98__builti=
n_strncpy=E2=80=99 specified bound 128 equals destination size [-Werror=3Ds=
tringop-truncation]
> >>>>  95 |   return __builtin___strncpy_chk (__dest, __src, __len,
> >>>>     |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>>  96 |                                   __glibc_objsize (__dest));
> >>>>     |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>>
> >>>> The compile error is from strncpy refernce in do_test:
> >>>> strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> >>>>
> >>>> This behaviour is not observed with GCC version 8, but observed
> >>>> with GCC version 11 . This is message from gcc for detecting
> >>>> truncation while using strncpu. Use snprintf instead of strncpy
> >>>> here to be safe.
> >>>>
> >>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>>
> >>> I found this issue now and thanks for the quick fix.  I will push to
> >>> perf-tools-next soon.
> >>>
> >>> Thanks,
> >>> Namhyung
> >>>
> >>
> >> Sure
> >>
> >> Thanks Namhyung for pulling in the change
> >>
> >> Athira
> >
> > Thanks for the fixes. As this is test code I don't think performance,
> > style, etc. matter much. The GCC strncpy warnings are annoying imo,
> > I'm not sure it makes sense for them to be enabled. I see in the
> > kernel lots of "sizeof(foo)-1" as a workaround. strlcpy looks like a
> > better alternative but it gets a checkpatch warning as in the kernel
> > strscpy is preferred. Perhaps we should create a strscpy shim.
> >
>
> IIUC, strscpy is defined in kernel source and is currently not used in to=
ols side.
>
> Ian,
> Your point here is that we can create an interface in tools side so that =
we can later safely use strscpy in cases like this ?

Yeah. Tbh the string code is a bit chaotic in the code base. There's
some stuff using char*s, some asprintf, there's strbuf then there all
the kernel ways of doing things. I lose track of why strscpy is
superior to strlcpy, but strlcpy will get you a checkpath warning.

The standard kernel solution to the GCC strncpy warning I've seen,
changing "strncpy(a, b, sizeof(a))" to "strncpy(a, b, sizeof(a) - 1)",
looks dodgy and possibly worse to me. The point of the warning I think
relates to strncpy not necessarily \0 terminating the string and you
need to reserve at least 1 character for this, while strlcpy
guarantees the \0 termination. Doing "sizeof(..) - 1" likely confuses
the checker making it give up, but now you have less space to copy a
potential \0 as well as not getting a \0.

Thanks,
Ian


> Thanks
> Athira
>
> > Thanks,
> > Ian
> >
> >>>> ---
> >>>> tools/perf/tests/tool_pmu.c | 2 +-
> >>>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu=
.c
> >>>> index 94d0dd8fd3cb..297cc8c55579 100644
> >>>> --- a/tools/perf/tests/tool_pmu.c
> >>>> +++ b/tools/perf/tests/tool_pmu.c
> >>>> @@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool wi=
th_pmu)
> >>>> if (with_pmu)
> >>>> snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
> >>>> else
> >>>> - strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> >>>> + snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
> >>>>
> >>>> parse_events_error__init(&err);
> >>>> ret =3D parse_events(evlist, str, &err);
> >>>> --
> >>>> 2.43.5
>
>

