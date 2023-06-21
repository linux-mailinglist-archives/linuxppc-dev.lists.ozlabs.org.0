Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E23737866
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 02:48:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm4cy2Mwnz3bd6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.179; helo=mail-yb1-f179.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm4cQ4rfYz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 10:48:20 +1000 (AEST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bff27026cb0so91430276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687308497; x=1689900497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XivSQCtjI3r7uuieVa+Um6KFwyIb4sUtx6fC8E3IjV0=;
        b=injHBbvzTSM8bsS5NtKHA3B6Eu9dxhWGguB88NhF8g4ZpSiYMlPg8pQ5X95nMFMVNM
         dVIva72OnUwXE8aymEgh8qn8DBXKYzm96bFWYkxBZjijermnd+j/ctKDavkht8qGARvy
         /ewDyr/MyrKI+f0mEj2ZZ3TBrKMmMQiHQmxxcgyzQ+0TjTk0U9nLQcJzUX5XQUBjPhUw
         ygPYO0Eb7xLNBPeRFJJJ0V5eFpvG5CIr3QURxF0MllEd9+Vv71E4n0zw7QolrdWxH8rT
         2deftYXXD0uQyn4MjDahzRHLvfid9kZ07PNTwxDtJdPClnFYmH1rDj6BN6Hh7P3+3+Qr
         KAoA==
X-Gm-Message-State: AC+VfDy1VI0G7waBultb4hkoEZ39Rj4l5x3PKAqExQx+3SbW9jqWWvgb
	YqKwGNlOwJbEiynbp8T3/j2maV/3eyWPN4T1kiY=
X-Google-Smtp-Source: ACHHUZ5ZouLvNwZVP8+Ju4aUatcm1UED7wvrspHS+TPdT8Wp667J4oEVN3NqdwNZE26GHRi8eCaEBQuujEDrhIEO4kI=
X-Received: by 2002:a25:5f4d:0:b0:bcb:caf8:7aae with SMTP id
 h13-20020a255f4d000000b00bcbcaf87aaemr10348976ybm.44.1687308497348; Tue, 20
 Jun 2023 17:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com> <ZIjMWUk/axKfMCM4@kernel.org>
In-Reply-To: <ZIjMWUk/axKfMCM4@kernel.org>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 20 Jun 2023 17:48:05 -0700
Message-ID: <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
Subject: Re: [PATCH 15/17] perf tests task_analyzer: fix bad substitution ${$1}
To: Hagen Paul Pfeifer <hagen@jauu.net>, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, 
	Aditya Gupta <adityag@linux.ibm.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Jun 13, 2023 at 1:06=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Tue, Jun 13, 2023 at 10:11:43PM +0530, Athira Rajeev escreveu:
> > From: Aditya Gupta <adityag@linux.ibm.com>
> >
> > ${$1} gives bad substitution error on sh, bash, and zsh. This seems lik=
e
> > a typo, and this patch modifies it to $1, since that is what it's usage
> > looks like from wherever `check_exec_0` is called.
>
> Nicely spotted!
>
> Please add the people that last touched the problem to the cc list,
> specially when it fixes a bug.
>
> Thanks for adding a Fixes tag, that helps the stable@kernel.org guys to
> get this propagated to supported kernel releases.
>
> I've added the test author to the CC list in this message.
>
> thanks!
>
> - Arnaldo
>
> > This issue due to ${$1} caused all function calls to give error in
> > `find_str_or_fail` line, and so no test runs completely. But
> > 'perf test "perf script task-analyzer tests"' wrongly reports
> > that tests passed with the status OK, which is wrong considering
> > the tests didn't even run completely
> >
> > Fixes: e8478b84d6ba ("perf test: add new task-analyzer tests")
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> > ---

I'm seeing a different error even after this fix.
Can you please take a look?

Thanks,
Namhyung


$ sudo ./perf test -v task
114: perf script task-analyzer tests                                 :
--- start ---
test child forked, pid 1771042
Please specify a valid report script(see 'perf script -l' for listing)
FAIL: "invocation of perf command failed" Error message: ""
FAIL: "test_basic" Error message: "Failed to find required string:'Comm'."
Please specify a valid report script(see 'perf script -l' for listing)
FAIL: "invocation of perf command failed" Error message: ""
FAIL: "test_ns_rename" Error message: "Failed to find required string:'Comm=
'."
...
test child finished with -1
---- end ----
perf script task-analyzer tests: FAILED!
