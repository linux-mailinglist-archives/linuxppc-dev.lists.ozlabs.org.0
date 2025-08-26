Return-Path: <linuxppc-dev+bounces-11341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B72B3728C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 20:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBGsd1vMJz3dW1;
	Wed, 27 Aug 2025 04:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756234149;
	cv=none; b=R1A/WbH+1RFSRMSyqIk2ZpekTAGWD7NZQ5fuOJvkRfb2KYK14fOOL+P8zoy1PnsZKMMV8s4I8dnALy/ofLwEwepf7dt6NltsQkYb7zsV/1xmnsnDmPbxraa5VNXx/xh75DMEwaG6mzSXJFbXAjWZeo4I7U3yYH+dqwNr68XDk7dmBSGUjfsfrluxu8Vfnt4rz3D5HJ79j4XXkaAH//iHYZn+YWKBt86GLBY6b1FolTktF6BXBVMdtE1jkpV3UgxO+3W9LvEEiArNk3D9T9HuGBbcWxMYPHkOPWJedj7bL4YosOKOSydo8IMA3zdrfs4+pcia9dLUdXj1S5FkdcsYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756234149; c=relaxed/relaxed;
	bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqZ3ZLWjfTGuF1kbxXSW7mB+eZ/As+5dsIvg4tgS4aJ7Fget+KEbJLgvaJGzcB6QdpDgtQlxfopei2m2UvfbDUIPdNKBm4oCMdAASoiihNjCg35FXWrfW8WzL6xFM8j5Y/W1rw0wcgBvpKJGHVWNP5A+CQyjd17czpypB3K6WX1fAI9Fb3I21m/XifE8Qtcyis9yHgypmFPYOF51SS1pWZkVIdCnk1gA+tAVulawnEjVUyeqhxEftCTsvi21/fQWZZ5qmLbh2hEK2FscM4+IKBYSoF9UBS2cuRsEMFERX++TKwyv7U90JdcCSRkclXbgY8dNsTywq9L8qJBZ0NLIhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SX4SktT1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SX4SktT1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBGsW4hnQz3dTD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 04:49:03 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-248681b5892so43925ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756234141; x=1756838941; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=SX4SktT19LYmUSciqzX+MMD6kmAb6M9Qer3NBFNeFopWrmZvGOgNJOahw8+4VO0BcI
         OJTHOFN45MBB+NCw3RWgauKMq32N8CDjNZWm8OZ7Cc+HJ+Y+K0KUvUlW/Xjo2SCTRdxg
         7c7hDzhOmtd5VPjfr9Jf9fP+eACpO0RO0/vLwZhRPBGh/OZhZ1uEsPVTj1cWfQmMT5a7
         chAUoP6dXYF21e4eWNwi3gCd5WLDcBmolDnnQIOYt0/po5gQcCdui4VJOFCS+aEbRtzS
         lX0jU/1dUKMyd65MGSCMP7dhwWWQyNR4jv6noisiHQze/S6cd0Awj3T0P1rHXECdmBc1
         TwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234141; x=1756838941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=bk8IMKZ2YfrhI12PDvRGXv/Kx7xnWZxhx7XqLVCG2r4xSmOqpy4nqU+09psSlly685
         LJxqiFs+aq3v3SjOA2SSibnWxbnG7doiEpq6wTUjZYVE/jDFI8UQRiFIP2sJ+G80dYDS
         4Q8X0BDwuPtw7Ao2YzPWFxzyXPl+SA/0JzlSV1sJ6gChZimehfPX6oFSpe5xJ3Vpza/w
         GCe0ssC52IdmmYaBkadkDVmW7QGTLjweThIoVmK1fVaR3tkYG+PqANS0Sm04oC2EC4ja
         ZG93cP1whgkadWhoIbHD5++Gevg2FOb6znJdhO808ECeCLc35NSyr4jgo6e4baA4PY6C
         rzwg==
X-Forwarded-Encrypted: i=1; AJvYcCUnQEmhlCSNLdJ2KH/5sGXSc8eWh6KJVavAXZ9X9nMmI0aosJOugbYR8E62CpE34z5eIGt/yJegxCdRu/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFXqMcb+7mril2wEwyGOSS4jXYXfOReyD1pK1oDTPN9u3XBP0T
	93QxV5rWeJckp7eyOSCh7nCozS+ecOwuDul4GmvnNsP+RQ0QiNaFCNaM8bm1aLo6V9+6TZmUs8m
	tWNgYJ4aF5Yg5ZR9KLNHAWBLW0Lw4m+pEcP+pX0/o
X-Gm-Gg: ASbGncvQ+mqtDR82XR7V6bFue5d6cCdt9Aknh5JP3QNZaw6Cq5951RM2Dn6ju3Tr9vT
	l6cI4o1+ASZxSBkj8/Hp7bPg2HNXhepvxKlwpUk4kVOP8Sb37SENymGU3uGV7x7T3jikVG2YXDd
	+P4hjpkMvvE5YQSGT6FIbp9Yr1QZf50+nbcMzCKaVyrBI0sbuXKl8Jd19hLUmZJ3fxw/PaEBvF0
	ZS/k1Q58SkDOW06FHoZUFCDOMgxB6xAefgCL+Fm4UUt3s6/VMxtoHnoqhNjngtk
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
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
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net> <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
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

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> >> It may have been different long ago, but today it seems wrong for thes=
e
> >> drivers to skip counting disabled sibling events in group validation,
> >> given that perf_event_enable() could make them schedulable again, and
> >> thus increase the effective size of the group later. Conversely, if a
> >> sibling event is truly dead then it stands to reason that the whole
> >> group is dead, so it's not worth going to any special effort to try to
> >> squeeze in a new event that's never going to run anyway. Thus, we can
> >> simply remove all these checks.
> >
> > So currently you can do sort of a manual event rotation inside an
> > over-sized group and have it work.
> >
> > I'm not sure if anybody actually does this, but its possible.
> >
> > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > periodically cycle which of the 5 events is off.

I'm not sure this is true, I thought this would fail in the
perf_event_open when adding the 5th event and there being insufficient
counters for the group. Not all PMUs validate a group will fit on the
counters, but I thought at least Intel's core PMU would validate and
not allow this. Fwiw, the metric code is reliant on this behavior as
by default all events are placed into a weak group:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/metricgroup.c?h=3Dperf-tools-next#n631
Weak groups are really just groups that when the perf_event_open fails
retry with the grouping removed. PMUs that don't fail the
perf_event_open are problematic as the reads just report "not counted"
and the metric doesn't work. Sometimes the PMU can't help it due to
errata. There are a bunch of workarounds for those cases carried in
the perf tool, but in general weak groups working is relied upon:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/pmu-events.h?h=3Dperf-tools-next#n16

Thanks,
Ian

> > So I'm not against changing this, but changing stuff like this always
> > makes me a little fearful -- it wouldn't be the first time that when it
> > finally trickles down to some 'enterprise' user in 5 years someone come=
s
> > and finally says, oh hey, you broke my shit :-(
>
> Eww, I see what you mean... and I guess that's probably lower-overhead
> than actually deleting and recreating the sibling event(s) each time,
> and potentially less bother then wrangling multiple groups for different
> combinations of subsets when one simply must still approximate a complex
> metric that requires more counters than the hardware offers.
>
> I'm also not keen to break anything that wasn't already somewhat broken,
> especially since this patch is only intended as cleanup, so either we
> could just drop it altogether, or perhaps I can wrap the existing
> behaviour in a helper that can at least document this assumption and
> discourage new drivers from copying it. Am I right that only
> PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my
> reasoning for state <=3D PERF_EVENT_STATE_EXIT should still stand? As for
> the fiddly discrepancy with enable_on_exec between arm_pmu and others
> I'm not really sure what to think...
>
> Thanks,
> Robin.

