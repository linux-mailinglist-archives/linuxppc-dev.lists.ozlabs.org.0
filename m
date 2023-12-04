Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE08040DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:14:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wS54Zjn7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skby65fQzz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 08:14:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wS54Zjn7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkbxG0jKwz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 08:13:20 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b422a274dso15915e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701724397; x=1702329197; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+Dl1d6P4p90dv5VdxYZbL5mNMDqiGBE2uSVy6Yzsvc=;
        b=wS54Zjn7F1+qbp6keVb28/hpBEmoEbicMsl4y+3ecvHd6NTCEntXR9O17ExB7rlGqg
         FbXSyRWWNcXEfBtp9qem+CvLJlaZQBXXHkCY4SAWzjaM5I9NEw19ZWWNyQ5gd659sEwa
         FZevA9ylIDPm1pfO2qZ662fAaH5jwbFWQEKtD8Orn3eL5OwY2FXlOLZ8E7bpmfrj0WTI
         FPrYBADPy4eApP+8OUwfBrRRh9Nhwji7LVIAhF1cQKiyoFf1nAwxY5a/hAsLsGQmzRsE
         bs2xxFeXYFcu6wd8QKDQKQvnOMMakSHJYZRoe5SNDwTirNbRxvGYBkRJroU7nAmRTret
         aI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701724397; x=1702329197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+Dl1d6P4p90dv5VdxYZbL5mNMDqiGBE2uSVy6Yzsvc=;
        b=d6RnGbXKnoloO67/YYflhVsiXb7zh5rbJkqqj7vhcuy8/uoj9y7Bf4IOAMy5JKs1JL
         XbBqbVPqTCOER1KkPAVy5FyRV/z36O5orLs+CVf2xAJ/xuiCkgKHuDT7W+mfucFo5p43
         P4Tj7GW3R3yJeSwm3QzA30w/abSGbvT/YW9qBJEkO7iTL7fkHSs+ApEiVgTCoAXiqLVC
         r3O4hT+QEw4fVq9EWp8KW5om7BX38L32V7EhDABO4orhoUebWTs0i6R2GYkc24y3l/Rp
         /V3A57Xo0iOoz+HKT7cJQTvAyIqI0cK3FXkmpfGxOGRBkYsstdRzu/FBB4njUslRXAv5
         cOdw==
X-Gm-Message-State: AOJu0YzJZWS/ldtMGRvBaPhrAk/QblGfo5rx5VOMTufRM+XjTuzgLRQd
	RB2uYGp8BUqgQJrTKHNgXkNix6k3uJnuUFXK9ALm0Q==
X-Google-Smtp-Source: AGHT+IFUGQiCVonpkjbD3G1w6HtwBrOXendCflfcgWfkve4cy1akFBvaxLgjGfoGqJUsaDbzDhEerx/X5MBOk5g+gUc=
X-Received: by 2002:a7b:cb59:0:b0:40b:4221:4085 with SMTP id
 v25-20020a7bcb59000000b0040b42214085mr433700wmj.1.1701724397294; Mon, 04 Dec
 2023 13:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
 <ZW40nstmGUeV9Fie@kernel.org> <ZW406O38z3DmVwOX@kernel.org>
In-Reply-To: <ZW406O38z3DmVwOX@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 4 Dec 2023 13:13:05 -0800
Message-ID: <CAP-5=fXWm_ZZjQ-36eTJTuWQsQwwCEXer22Oid7X-PSe8=WY1Q@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 4, 2023 at 12:22=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Mon, Dec 04, 2023 at 05:20:46PM -0300, Arnaldo Carvalho de Melo escrev=
eu:
> > Em Mon, Dec 04, 2023 at 12:12:54PM -0800, Ian Rogers escreveu:
> > > On Thu, Nov 23, 2023 at 8:01=E2=80=AFAM Athira Rajeev
> > > <atrajeev@linux.vnet.ibm.com> wrote:
> > > >
> > > > Running "perf list" on powerpc fails with segfault
> > > > as below:
> > > >
> > > >    ./perf list
> > > >    Segmentation fault (core dumped)
> > > >
> > > > This happens because of duplicate events in the json list.
> > > > The powerpc Json event list contains some event with same
> > > > event name, but different event code. They are:
> > > > - PM_INST_FROM_L3MISS (Present in datasource and frontend)
> > > > - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
> > > > - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
> > > > - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
> > > >
> > > > pmu_events_table__num_events uses the value from
> > > > table_pmu->num_entries which includes duplicate events as
> > > > well. This causes issue during "perf list" and results in
> > > > segmentation fault.
> > > >
> > > > Since both event codes are valid, append _DSRC to the Data
> > > > Source events (datasource.json), so that they would have a
> > > > unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
> > > > PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
> > > > works as expected.
> > > >
> > > > Fixes: fc1435807533 ("perf vendor events power10: Update JSON/event=
s")
> > > > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > >
> > > Given duplicate events creates broken pmu-events.c we should capture
> > > that as an exception in jevents.py. That way a JEVENTS_ARCH=3Dall bui=
ld
> > > will fail if any vendor/architecture would break in this way. We
> > > should also add JEVENTS_ARCH=3Dall to tools/perf/tests/make. Athira, =
do
> > > you want to look at doing this?
> >
> > Should I go ahead and remove this patch till this is sorted out?
>
> I'll keep it, its already in tmp.perf-tools-next, we can go from there
> and improve this with follow up patches,

Agreed. I could look to do the follow up but likely won't have a
chance for a while. If others could help out it would be great. I'd
like to have the jevents and json be robust enough that we don't trip
over problems like this and the somewhat similar AmpereOne issue.

Thanks,
Ian

> - Arnaldo
