Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335CF916FAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 20:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7t0P5hgNz3fnP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 04:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.175; helo=mail-pf1-f175.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7szz22SNz3d2n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 03:59:58 +1000 (AEST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2251628b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 10:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719338395; x=1719943195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5PoShk9ER6oKuETO3bdJUevSzjYujmcfx3i8qQ0MKo=;
        b=Gu4muWJwQogvOqvYKqgZGWqiBsFLYrIrkdAoRr1eR9ZCrkebewiiWNGFaG4yfveaDH
         bFPKxF3ezORkhI+3oyEbuPtFpqKHIxK1qRQaz6URpkamcF6e2NAMxLGyrYm2nfFkJZ0Z
         e27m64wu1a/l+HFiFqVsf0w5G5CDNuZ8ZFhL+i63JI/H6T/+uxzNQyyAsanRXIi2lyao
         c0Kt1UxXr7OAUnqp+K/QzlrihbZBX/azK/86w0pobEqm+bduorWU1ZjwnBEFvek2a/DS
         kdhXk/l62mOYD3mjBwnA+/d8sjDwx+08C49y0xpU8PdWbmSE+yrX0VAdQSSMouTemvn0
         QFHw==
X-Forwarded-Encrypted: i=1; AJvYcCUP+7ySF/uhubsbfUgFxK/gD3tHUObkwf746LpC9eiOtxRbZCJAR66f18RrZ25iGMMXRm7dL2blQ3s7aXo/8X7WiFfSU0328J8v5yWzhg==
X-Gm-Message-State: AOJu0YySpDc4NjyutWqpkMMqKkWC+bV6eJL3MwQ1Wd8PvnkRpk0qmB7J
	elLgkvfPgiprCHbA86JtOYsIdPBGhF0cMqkaj9lUw0F20m3aMyMuacSukSpmaknmiNH4XF3ACKQ
	bUR27REZIJPx0dffTk7YsMbxWqLk=
X-Google-Smtp-Source: AGHT+IGG+13e+IM6YaHCDjgHhxzZwK9iqPFhSJtEBdaJ14Pj4FVkbJjvKOBZjXrBtApOOtBEaVA2FM1ujUiSxA6mseE=
X-Received: by 2002:a05:6a20:7b1b:b0:1b5:5ee0:378a with SMTP id
 adf61e73a8af0-1bcee771ca1mr7839615637.36.1719338395163; Tue, 25 Jun 2024
 10:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
 <722cb4bc-89d4-4e03-a80d-ffe05be52c05@intel.com> <f65ff3cf-1724-45a1-ad88-200d72251042@intel.com>
In-Reply-To: <f65ff3cf-1724-45a1-ad88-200d72251042@intel.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 25 Jun 2024 10:59:44 -0700
Message-ID: <CAM9d7ci2raJmUjb7X2m6O1mCJm5xYLEWS8g_gC7tTjvshm1XFQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
To: Adrian Hunter <adrian.hunter@intel.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Jun 25, 2024 at 5:02=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 25/06/24 14:57, Adrian Hunter wrote:
> > On 23/06/24 09:48, Athira Rajeev wrote:
> >> Perf test for perf probe of function from different CU fails
> >> as below:
> >>
> >>      ./perf test -vv "test perf probe of function from different CU"
> >>      116: test perf probe of function from different CU:
> >>      --- start ---
> >>      test child forked, pid 2679
> >>      Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Msa=
7iy89bx/testfile
> >>        Error: Failed to add events.
> >>      --- Cleaning up ---
> >>      "foo" does not hit any event.
> >>        Error: Failed to delete events.
> >>      ---- end(-1) ----
> >>      116: test perf probe of function from different CU               =
    : FAILED!
> >>
> >> The test does below to probe function "foo" :
> >>
> >>      # gcc -g -Og -flto -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7=
/testfile-foo.c
> >>      -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
> >>      # gcc -g -Og -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testf=
ile-main.c
> >>      -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
> >>      # gcc -g -Og -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testf=
ile
> >>      /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
> >>      /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
> >>
> >>      # ./perf probe -x /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/tes=
tfile foo
> >>      Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Xni=
NxNEVT7/testfile
> >>         Error: Failed to add events.
> >>
> >> Perf probe fails to find symbol foo in the executable placed in
> >> /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7
> >>
> >> Simple reproduce:
> >>
> >>  # mktemp -d /tmp/perf-checkXXXXXXXXXX
> >>    /tmp/perf-checkcWpuLRQI8j
> >>
> >>  # gcc -g -o test test.c
> >>  # cp test /tmp/perf-checkcWpuLRQI8j/
> >>  # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
> >>    00000000100006bc T foo
> >>
> >>  # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
> >>    Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
> >>       Error: Failed to add events.
> >>
> >> But it works with any files like /tmp/perf/test. Only for
> >> patterns with "/tmp/perf-", this fails.
> >>
> >> Further debugging, commit 80d496be89ed ("perf report: Add support
> >> for profiling JIT generated code") added support for profiling JIT
> >> generated code. This patch handles dso's of form
> >> "/tmp/perf-$PID.map" .
> >>
> >> The check used "if (strncmp(self->name, "/tmp/perf-", 10) =3D=3D 0)"
> >> to match "/tmp/perf-$PID.map". With this commit, any dso in
> >> /tmp/perf- folder will be considered separately for processing
> >> (not only JIT created map files ). Fix this by changing the
> >> string pattern to check for "/tmp/perf-%d.map". Add a helper
> >> function is_perf_pid_map_name to do this check. In "struct dso",
> >> dso->long_name holds the long name of the dso file. Since the
> >> /tmp/perf-$PID.map check uses the complete name, use dso___long_name f=
or
> >> the string name.
> >>
> >> With the fix,
> >>      # ./perf test "test perf probe of function from different CU"
> >>      117: test perf probe of function from different CU               =
    : Ok
> >>
> >> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> >
> > Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> >
>
> Although it could use a Fixes tag
>

Thanks, I will add

Fixes: 56cbeacf1435 ("perf probe: Add test for regression introduced
by switch to die_get_decl_file()")

Namhyung
