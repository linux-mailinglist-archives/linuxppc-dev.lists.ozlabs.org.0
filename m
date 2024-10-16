Return-Path: <linuxppc-dev+bounces-2320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0119A0DA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 17:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTDp84B8Mz2yLJ;
	Thu, 17 Oct 2024 02:06:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::832"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729091216;
	cv=none; b=BGVX4quBXQrDwhxKbmYz8h1b3U79GIOdCEh8VBtQA1Ez4LfuAbe+qkHbSK2jvOC0WaRzF1ko1BgVYeFHG1yched9XWFCuLDUqhfSzhwLSHX49yrWjp/5m9nzakUhPsnHKVrqwHMFuJRZ703UJa27YZODPOtVAZzvUz/DLnSnFyZLuzDXmTxOiAAMe/ihFYuGU7PLb/Vg3J77b/Jwahq6gnFKzOauV/PlDSXADFLoMudm8yqteTr8Du8NxH3glvyEsT+1MQEPxf1mGJRujp/JSeyQemezKqB8/R4E34AKnV8BKKK7zG94WMh9z6dgsxwb27iuNO4EO3C0ofmz0QTzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729091216; c=relaxed/relaxed;
	bh=6K4x8bphATLlXhelHBdtpzDtj/LNGp0/65nra7sovmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrIHBpJKpa3GW1+bvXlT3OVmBVuVhx1+40RMV7G4JUm8b6xrhDx3ncsgj/uxa2id6Zhm6qC5WpT2b3TKEcW7eQMVx69tFbcnWC9KHkS12Uqe9HMiDkCoU+EvA+oefX+XxKBJ1MsaXCwxNZL1r7N5fLU8QzSI3lRIYCga8KDSk7ua12O0gjnxEQaUbSogUCHBv1xtU9UyCzEuiiqDG/Ff7CL0MF2biAGxHqiJmd45WxiK15cTTcpcvt0RhNMTBC8+NOTT2WOdqwZcGjcDvuUTTZOtpcoUdAWiQSKSD+7lsAp1E0vl68222LWFaUmdR/59tDLn0EgcpGmDG71aJMEezg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2k9JQhwV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2k9JQhwV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTDp63MkCz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 02:06:53 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-460969c49f2so204301cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729091207; x=1729696007; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K4x8bphATLlXhelHBdtpzDtj/LNGp0/65nra7sovmg=;
        b=2k9JQhwVm2H9qH27n1PdCaocyDZ/NOUj52AmTT48wv5xQlhfqiFjY2SIxJu/bdNzvo
         Iu3K02gimZE97GoUUq04N07qm0EDRXo/Hmuu11zzuoxwUZ3aU29OTqKCpDh0NMnUz4TW
         oiqzdMPkZd2EgvaW9Z6edVU9utQ32AmICaOUEIj4u1uh6E+Y2I77YcYAfc4AWM80me4q
         F5XKhQsAvBkry1ROCNwQXido0MmQsLDtoPIMCQKLr8ZoyjyOzwIaGyQBAMKG2R0+f3RO
         u53GU0Hbw9lYLWLbF14k1VInPLwgiZgI+TDPSyLVCIyb9RDLJB6qEDFEK+j4hWaFwpw9
         Vz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729091207; x=1729696007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K4x8bphATLlXhelHBdtpzDtj/LNGp0/65nra7sovmg=;
        b=S3Z4Jpyc4micEaSeHEkECdOTGBb+/ANyXb0Mp6t12/FRrCjbBfo5OqIg1VA42UGTe3
         MnPn/N1mYyu33q7z8XDD4uOczs7e6SC1S1Mn6p+3wFZdFn9dkQe6ACb5EjM4KIdJJSve
         5bbsunO9GJdA8pBz7cyKt8nEcCmMZzyTyeckm9JKdgJmpEe8BJnQVS3ZgIWiPTrvZbCn
         cAJDADkbGyIpEtrEX8M5Q35NY851U1O7T6FFXpPSSA54HmDrd7TfYXVfKckXOJmm/Lia
         /N94rm5I0EP2sv5KTNx17gMkH7Rpt0HEH3zBSujc8omGskv4T6E9gAJ8dhJ86sG/QzE8
         Ax9A==
X-Forwarded-Encrypted: i=1; AJvYcCUWotvVTujyi4T+Ol0aZLDoN0QHSQoATXvF0mFNvzEGlsNNb8LCR7/vVzQXTsCvsuvSirSN8fPkut9lPFc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzliCQrgiyocpxsczAdGwzfebuZ84LagcjmcjqzEr8SQh6Ycl00
	bOlSFcT2P3bnP5Z0HLfoIfQe/cGgG1ZfQKJawvhWU9rVwFDJmYZlogh3GKBdgp3+ySwE2StBHPM
	8rco5RVhFDHjeGADaIuInC29/iLDNtqdOJ2Pm
X-Google-Smtp-Source: AGHT+IHoJmRL6Rr/b848g5lwqp2hwHbpRFYxfZOHmo4MfEhx8DYqRyOLQGFNUtgMz7WYW9kZ8oqR/5cdGwmeVpfYiOg=
X-Received: by 2002:a05:622a:7a88:b0:460:4638:78c0 with SMTP id
 d75a77b69052e-4608db520e4mr4965651cf.14.1729091206890; Wed, 16 Oct 2024
 08:06:46 -0700 (PDT)
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
In-Reply-To: <8B5B2251-E41E-4584-881E-61A468AFB222@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 16 Oct 2024 08:06:35 -0700
Message-ID: <CAP-5=fWQsQp3WgJcLvZWsBsiJ2VzxP6j2kOfd5Hrzi0oBUNy2g@mail.gmail.com>
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

On Wed, Oct 16, 2024 at 5:30=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 14 Oct 2024, at 10:56=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org>=
 wrote:
> >
> > Hello Athira,
> >
> > On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
> >> perf fails to compile on systems with GCC version11
> >> as below:
> >>
> >> In file included from /usr/include/string.h:519,
> >>                 from /home/athir/perf-tools-next/tools/include/linux/b=
itmap.h:5,
> >>                 from /home/athir/perf-tools-next/tools/perf/util/pmu.h=
:5,
> >>                 from /home/athir/perf-tools-next/tools/perf/util/evsel=
.h:14,
> >>                 from /home/athir/perf-tools-next/tools/perf/util/evlis=
t.h:14,
> >>                 from tests/tool_pmu.c:3:
> >> In function =E2=80=98strncpy=E2=80=99,
> >>    inlined from =E2=80=98do_test=E2=80=99 at tests/tool_pmu.c:25:3:
> >> /usr/include/bits/string_fortified.h:95:10: error: =E2=80=98__builtin_=
strncpy=E2=80=99 specified bound 128 equals destination size [-Werror=3Dstr=
ingop-truncation]
> >>   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
> >>      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>   96 |                                   __glibc_objsize (__dest));
> >>      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> The compile error is from strncpy refernce in do_test:
> >> strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> >>
> >> This behaviour is not observed with GCC version 8, but observed
> >> with GCC version 11 . This is message from gcc for detecting
> >> truncation while using strncpu. Use snprintf instead of strncpy
> >> here to be safe.
> >>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >
> > I found this issue now and thanks for the quick fix.  I will push to
> > perf-tools-next soon.
> >
> > Thanks,
> > Namhyung
> >
>
> Sure
>
> Thanks Namhyung for pulling in the change
>
> Athira

Thanks for the fixes. As this is test code I don't think performance,
style, etc. matter much. The GCC strncpy warnings are annoying imo,
I'm not sure it makes sense for them to be enabled. I see in the
kernel lots of "sizeof(foo)-1" as a workaround. strlcpy looks like a
better alternative but it gets a checkpatch warning as in the kernel
strscpy is preferred. Perhaps we should create a strscpy shim.

Thanks,
Ian

> >> ---
> >> tools/perf/tests/tool_pmu.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
> >> index 94d0dd8fd3cb..297cc8c55579 100644
> >> --- a/tools/perf/tests/tool_pmu.c
> >> +++ b/tools/perf/tests/tool_pmu.c
> >> @@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool with=
_pmu)
> >> if (with_pmu)
> >> snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
> >> else
> >> - strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> >> + snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
> >>
> >> parse_events_error__init(&err);
> >> ret =3D parse_events(evlist, str, &err);
> >> --
> >> 2.43.5
>
>

