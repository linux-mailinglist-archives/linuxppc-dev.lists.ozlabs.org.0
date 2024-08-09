Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B705194D799
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 21:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgZDQ5HfXz305c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2024 05:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.176; helo=mail-pg1-f176.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgZD30G1wz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2024 05:46:25 +1000 (AEST)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7a130ae7126so1716166a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2024 12:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723232783; x=1723837583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqbAJAIrn+pMqAdKgl2l3QmF9/bwlYdotJYVuqNwgjc=;
        b=EggOgFDGHfes0qsjCdyTqrQxOrw5K8vKIT+i6u7f10qUk4UXW63JnjSW17sOzlTzm9
         GVe/wh6QSBKPYv6ue3lORNZJknl94IAUQM/hpUhgG3RwX1VP04S5HJCQW1bLpKfjcE30
         YpGou5HvT94aV1vSAjMg1ZIgzAUPnDE3I7RP6uCETQFqLhbgMzR7AyQWMZLGSUYZyAYH
         w4t0kQdbR9ViQ3sWfI7IlqhFjDf7pErliasUEIc6WioDHvcA7sd+a3jfACtlqc4lOPN+
         i6/ORs77k4d/0jdmllDHBahaS18h5IiTLcZMkRPkcVYZNllGW6kO99wRwYc/kehe7LLg
         WlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcLWjedXcMx6xazJ7tcTukdudyjnRMY2qrmkPZudgvp5Fm3LQLw6SNZe9gYFOx9H5QmtFnbykxQYCY0AOS12hPym0F7VZMR0Wxe2LHw==
X-Gm-Message-State: AOJu0YxnHBjPmMtD/H4fspT5WKmTIOlWfdEYuTfxsd5MA+Tb7xY+OWit
	SyM88P0U2kh5fHGP78D627WU+ao8N13Qal+E+1tl/483chQXKJSpv/OeGk24l/gutvT7Hm/u985
	O448P0Hvz1kFI5lITC3OybB+b+V0=
X-Google-Smtp-Source: AGHT+IGt8uePCJBxT0xWwJtwoNYeffh75W4vVoECy88I+CFcKDV41N3GU4beyjUcCmxO+1WYu5Rw/yh0rvC5AJP3gCY=
X-Received: by 2002:a17:90b:2390:b0:2ca:d1dc:47e2 with SMTP id
 98e67ed59e1d1-2d1e804a8famr2857954a91.33.1723232782867; Fri, 09 Aug 2024
 12:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240806225013.126130-1-namhyung@kernel.org> <ZrO5HR9x2xyPKttx@google.com>
 <F3C6DE61-8E10-4814-A6C0-C7569B3FD613@linux.vnet.ibm.com> <ZrUSCFLWDg9iJ_23@google.com>
 <56008678-7B06-4E54-8447-1C0DCBC15521@linux.vnet.ibm.com>
In-Reply-To: <56008678-7B06-4E54-8447-1C0DCBC15521@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 9 Aug 2024 12:46:11 -0700
Message-ID: <CAM9d7ch5U1SvgEKiDB4djR70eps_zhaBSWa2guW9NJj6T4ehog@mail.gmail.com>
Subject: Re: [PATCHSET 00/10] perf tools: Sync tools and kernel headers for v6.11
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
Cc: Ian Rogers <irogers@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>, James Clark <james.clark@linaro.org>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2024 at 8:39=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 9 Aug 2024, at 12:14=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
> >
> > Hello,
> >
> > On Thu, Aug 08, 2024 at 12:14:12PM +0530, Athira Rajeev wrote:
> >>
> >>
> >>> On 7 Aug 2024, at 11:42=E2=80=AFPM, Namhyung Kim <namhyung@kernel.org=
> wrote:
> >>>
> >>> Hello folks,
> >>>
> >>> On Tue, Aug 06, 2024 at 03:50:03PM -0700, Namhyung Kim wrote:
> >>>> Hello,
> >>>>
> >>>> This is the usual sync up in header files we keep in tools directory=
.
> >>>> I put a file to give the reason of this work and not to repeat it in
> >>>> every commit message.  The changes will be carried in the perf-tools
> >>>> tree.
> >>>
> >>> Could you please double check what's in the tmp.perf-tools branch at =
the
> >>> perf-tools tree so I don't break build and perf trace for arm64, powe=
rpc
> >>> and s390?  It has this patchset + arm64 unistd header revert (accordi=
ng
> >>> to the discussion on patch 6/10) on top of v6.11-rc2.
> >>>
> >>> Thanks,
> >>> Namhyung
> >> Hi Namhyung,
> >>
> >> Can you please point to the tree. I checked in https://git.kernel.org/=
pub/scm/linux/kernel/git/acme/linux.git as well as https://git.kernel.org/p=
ub/scm/linux/kernel/git/perf/perf-tools-next.git , but didn=E2=80=99t find =
the changes. May be I am missing something. I am trying to check the build =
in powerpc.
> >
> > Oh, sorry about that.  It's in:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git
> >
> > (no -next at the end)
>
> Hi,
>
> I did compile test on powerpc and results are good.
>
> Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks for doing this!
Namhyung
