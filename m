Return-Path: <linuxppc-dev+bounces-11384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CAB3860E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 17:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBp501Fyxz300M;
	Thu, 28 Aug 2025 01:15:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756307748;
	cv=none; b=aZyj2Qz0qbP51Z4/nBD6g7xIt7/8h2xhaEUykVXYLTgGWwQa+4+nKxK9hffkldiYSvC2jU26asDjz9ZmlGHkTp7PAEBYRGrW1MLpC+TTS7brOge3UpWPWjs/ILGhxdlPBPAWHnj2YNeAdDL9uwjZkoSMwHjRHzM23L9CnJIJk3yRWyHUAX3GiNI6QLXYIEMYYCUWd7iWCvspexy2oqszWUcYPEh++5+yw4gJS74KYIbKGaa339N193+sbzeHqOSuUIE/Nz23bf3or8QzQxoXDOOTmISsc78SJM8n1eHNGmVQnXZ71Rk4hP6yoLyd9q1ozkTkRjzLKdYlQcu/PfeQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756307748; c=relaxed/relaxed;
	bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLI/XBLQOUGVcH4yH0XN6bP9H6m+aEiuTJlkaH/1Uj+TgrcUrz+tLVLNInt9EL5WUhD9Jjk89/yG2m+qyP79kgU/b3eWXvJPG4IyPrnR1JCVC78NhINE6nkBQNV2tbFcg5R4+k+fctRFEsfo4wFhR08e8BTIQr8/RAqgXyXFeAsJIRxgd4hE9qtowx2oR+xllozpcNQTb3oh8SzwJyg0Y2Kr5oijxDcFHi4cmgP9itcuHx1d9nwD5L+Oir+Es6gmVIDOuQu5DvSgzQ0k7czoOY8NfVFc2lgcn0RSPJYLe5Q2PZ5sg7jjNqc9ExuHGSyB2btBpt8t1r7dk+hjK3TCIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KMtn9kME; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KMtn9kME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBp4y5V0Sz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 01:15:46 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-248681b5892so229145ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756307744; x=1756912544; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=KMtn9kME0g1Y7V0F+A6ne2jgynrLIH0zCC4rnR12ZHstBkFd+qdzQfOccuYuTE1beE
         gUaWdL40QK2+1aOyTzxZWZXzwXoISkTvzoHHBylcg2QIktC88/9c1+I5S3lr8GlB26sg
         +dJIDcgT3COEvOnR7nGmbA5xE+f2jgBwW09rEZy6iib46FID9rJbL2On0PsLwPbBy6P4
         Cw1AJj1f7QIJAHUlBe1nAiTEhYIpACC8lDqzdNJBVp2od2pArADskGc7w+pmH/iS4q/C
         nISlSGcSoXBt6fFdhfWNeTfYhtZ2f2ULttj8g6Of9xParTehQ2prNm99f6IPENnTdgIu
         SZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307744; x=1756912544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGPhYDWt388RttmicU0o24RVsxY/twdNMb4O/vzImCs=;
        b=Fq32cl48JMRPJ+Z3y8CFQUFQnb2l+bufj0T5c3Rn6zeFBIivUMdA6oey0MP/k/Vhmk
         caY2ScSO8yZK6Ekfh6Kvjd9WiblXTt1VrgbuFVCpOdrZkVg16Uh6fW1seCNDlnV+JtbR
         zFcka3SsaygyS7f5WXn/qinukgw/UuV/z1mgm7d+kIpIqEzrpNlPK3RWKpWyA0lAOpkA
         paJ/9JD48Md+MThstn7LJpc+tn8Osjl87aoyPViGxVg5ENNmx+1naIBG4qLQqzQ4Wsd/
         bYUIxr9yenS0/Qm0V9pAJyb0Pl6ZSomCRQ0uIrFv4eA0u4OlFe7Ww0bUIvmwR60YZ2JC
         7ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6layNkyCHzqDvIhIxVSt6wtebf9TpTlJFpFoIlPnMEOA4haexSKSuHCOlYjYXApRSFkGuMELQvteNTpU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEiwqiKiPdzmb/hoYM/Nv0lwPQ/+oxKGiPxUYa9XAv/UhVV/HF
	3Bfbv7NwHmRU4N0xnj91PYIB6V/lggQKRmBsBJ4pf0vZslu/kNbD8LviaFAWlQpENVK5LFPXWC/
	qQWRUUop4OBwBHgmEa3ffZKmgfpycYtuhjcGkJtIV
X-Gm-Gg: ASbGnctE7cmi1sUvqe04iMUIcWh8Z/VbRuB5wNfB1dXOOnlJwZiL7HhIQVbJTr+dns3
	ArpaoyUjMbeYb1U1YkPoLovCyUSBKxwYCRTn9P1HwHbU6+TEVetKw4zoYKz+aDjGmF3fijT6UgA
	bNPn9s0/t74YNIyYzzkBtKQK6YSdlNst8dWMdapUT2+OeHBiCjA0mm2TDM/FIluUu1E88cZUAON
	CSJsPZ0dpUdYqlmxkhuCreuU6OXGPP7M4+DBsaqfic=
X-Google-Smtp-Source: AGHT+IExi0QgPJP/5AblrVahQdACSVklatzIIhzDoM8PROF9H/mRXxhxpv9GhjknP28Wz6ljzGsei6gbP7f3oTXJLVM=
X-Received: by 2002:a17:902:ec87:b0:246:a8ac:1a36 with SMTP id
 d9443c01a7336-2485ba5311amr9397575ad.2.1756307741849; Wed, 27 Aug 2025
 08:15:41 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com> <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
 <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
In-Reply-To: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
From: Ian Rogers <irogers@google.com>
Date: Wed, 27 Aug 2025 08:15:29 -0700
X-Gm-Features: Ac12FXwUZ4TrRSXyzgr8XTQRkesJ87wwMtoKHvx086ZRlV4GbvgOq2WSyedNfZ4
Message-ID: <CAP-5=fU0-QDMP-VG3O1qBvJ8uzHHYCQ8j1Vrzy9a0YUk=UMvHw@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
	will@kernel.org, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 1:18=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Aug 26, 2025 at 11:48:48AM -0700, Ian Rogers wrote:
> > On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> > >
> > > On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > > > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> > > >> It may have been different long ago, but today it seems wrong for =
these
> > > >> drivers to skip counting disabled sibling events in group validati=
on,
> > > >> given that perf_event_enable() could make them schedulable again, =
and
> > > >> thus increase the effective size of the group later. Conversely, i=
f a
> > > >> sibling event is truly dead then it stands to reason that the whol=
e
> > > >> group is dead, so it's not worth going to any special effort to tr=
y to
> > > >> squeeze in a new event that's never going to run anyway. Thus, we =
can
> > > >> simply remove all these checks.
> > > >
> > > > So currently you can do sort of a manual event rotation inside an
> > > > over-sized group and have it work.
> > > >
> > > > I'm not sure if anybody actually does this, but its possible.
> > > >
> > > > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > > > periodically cycle which of the 5 events is off.
> >
> > I'm not sure this is true, I thought this would fail in the
> > perf_event_open when adding the 5th event and there being insufficient
> > counters for the group.
>
> We're talking specifically about cases where the logic in a pmu's
> pmu::event_init() callback doesn't count events in specific states, and
> hence the 5th even doesn't get rejected when it is initialised.
>
> For example, in arch/x86/events/core.c, validate_group() uses
> collect_events(), which has:
>
>         for_each_sibling_event(event, leader) {
>                 if (!is_x86_event(event) || event->state <=3D PERF_EVENT_=
STATE_OFF)
>                         continue;
>
>                 if (collect_event(cpuc, event, max_count, n))
>                         return -EINVAL;
>
>                 n++;
>         }
>
> ... and so where an event's state is <=3D PERF_EVENT_STATE_OFF at init
> time, that event is not counted to see if it fits into HW counters.

Hmm.. Thinking out loud. So it looked like perf with weak groups could
be broken then:
```
$ sudo perf stat -vv -e '{instructions,cycles}:W' true
...
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000001
(cpu_core/PERF_COUNT_HW_INSTRUCTIONS/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 disabled                         1
 inherit                          1
 enable_on_exec                   1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd -1  flags 0x8 =3D 5
------------------------------------------------------------
perf_event_attr:
 type                             0 (PERF_TYPE_HARDWARE)
 size                             136
 config                           0x400000000
(cpu_core/PERF_COUNT_HW_CPU_CYCLES/)
 sample_type                      IDENTIFIER
 read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING|ID|=
GROUP
 inherit                          1
------------------------------------------------------------
sys_perf_event_open: pid 3337764  cpu -1  group_fd 5  flags 0x8 =3D 7
...
```
Note, the group leader (instructions) is disabled because of:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/stat.c?h=3Dperf-tools-next#n761
```
/*
* Disabling all counters initially, they will be enabled
* either manually by us or by kernel via enable_on_exec
* set later.
*/
if (evsel__is_group_leader(evsel)) {
        attr->disabled =3D 1;
```
but the checking of being disabled (PERF_EVENT_STATE_OFF) is only done
on siblings in the code you show above. So yes, you can disable the
group events to allow the perf_event_open to succeed but not on the
leader which is always checked (no PERF_EVENT_STATE_OFF check):
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/arch/x86/events/core.c?h=3Dperf-tools-next#n1204
```
if (is_x86_event(leader)) {
        if (collect_event(cpuc, leader, max_count, n))
                return -EINVAL;
```

Thanks,
Ian

