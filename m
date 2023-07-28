Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84B767578
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 20:30:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N3o+ZD1H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCGRN0nyVz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 04:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N3o+ZD1H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCGQS0lXTz3cGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 04:30:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0878621AD;
	Fri, 28 Jul 2023 18:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7718C433C8;
	Fri, 28 Jul 2023 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690569005;
	bh=uInCDj+mYhyh3EGnNpi/lvXN0Ha9NnDbrne3h8BtL2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3o+ZD1Hp89pRzstgK7t37+qptTti4MPp3Y0uEWOAUTQXhTp+IMHBduyVeoYr3yI5
	 X1GqBd5lyf58CrOqhLveam5CfhkAh777luRJNUugRX0ZijXLWDvcYHrSHVe0a0eBLW
	 /0o0MYskZPQ6CWf80g0OlS6xMG72Ftave4s7c388KW9l56qekafaqtQvZ3Yj8JB7dR
	 pron/RgVWBR0rEs9Yg0Lrc+zUqivLjJOriMN9J3RlLfgxxkrTy01FCkKcN7Ujf8yqn
	 ngZ1bz9FoeUBSEbjV7tj/+zSmofi/wyCh7Jb9+7UIU6WHNAY713TLOiUKAXbUkyLnT
	 YkB6SF+IS9Tcg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 2237E40096; Fri, 28 Jul 2023 15:30:02 -0300 (-03)
Date: Fri, 28 Jul 2023 15:30:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
Message-ID: <ZMQJKmV3XtwtZJtO@kernel.org>
References: <20230725061649.34937-1-adityag@linux.ibm.com>
 <ZMPWk5K63tadmDlU@kernel.org>
 <CAP-5=fW1zkpJ4zr4ngz=6bZQuE6hOHo4AtXwUsVJK9oiDSc_mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fW1zkpJ4zr4ngz=6bZQuE6hOHo4AtXwUsVJK9oiDSc_mg@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, disgoel@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Jul 28, 2023 at 09:01:11AM -0700, Ian Rogers escreveu:
> On Fri, Jul 28, 2023 at 7:54 AM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > Em Tue, Jul 25, 2023 at 11:46:49AM +0530, Aditya Gupta escreveu:
> > > Currently we depend on output of 'perf record -e "sched:sched_switch"', to
> > > check whether perf was built with libtraceevent support.
> > >
> > > Instead, a more straightforward approach can be to check the build options,
> > > using 'perf version --build-options', to check for libtraceevent support.
> > >
> > > When perf is compiled WITHOUT libtraceevent ('make NO_LIBTRACEEVENT=1'),
> > > 'perf version --build-options' outputs (output trimmed):
> > >
> > >        ...
> > >          libtraceevent: [ OFF ]  # HAVE_LIBTRACEEVENT
> > >        ...
> > >
> > > While, when perf is compiled WITH libtraceevent,
> > >
> > > 'perf version --build-options' outputs:
> > >
> > > ...
> > >          libtraceevent: [ on ]  # HAVE_LIBTRACEEVENT
> > >        ...
> > >
> > > Suggested-by: Ian Rogers <irogers@google.com>
> > > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> > > ---
> > >
> > >  tools/perf/tests/shell/test_task_analyzer.sh | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
> > > index 0095abbe20ca..a28d784987b4 100755
> > > --- a/tools/perf/tests/shell/test_task_analyzer.sh
> > > +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> > > @@ -52,7 +52,7 @@ find_str_or_fail() {
> > >
> > >  # check if perf is compiled with libtraceevent support
> > >  skip_no_probe_record_support() {
> > > -     perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
> > > +     perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && return 2
> > >       return 0
> >
> > I'll apply this, but please consider adding a:
> >
> >         perf build --has libtraceevent
> 
> That's a nice idea. You mean add a script like perf-archive.sh?

Nope, I would just add a new builtin-build.c (or some other more
suitable name to query what was built into perf) and then it would just
do a simple search on the same array that 'perf version --build-options'
currently uses (or the array that it would then share with 'perf
build', I haven't looked at the source code.).

So instead of a series of fork + execs we would just have one.

- Arnaldo

> Perhaps this flag should be supported by perf version instead.
> 
> Thanks,
> Ian
> 
> > subcommand to have that query made more compact and to avoid the two
> > extra grep.
> >
> > BTW, I'll change that to:
> >
> > [acme@quaco perf-tools-next]$ perf version --build-options | grep " on .* HAVE_LIBTRACEEVENT"
> >          libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
> > [acme@quaco perf-tools-next]$
> >
> > replacing "on" with OFF, so that we have just one grep.
> >
> > Thanks,
> >
> > - Arnaldo
> >
> > >  }
> > >
> > > --
> > > 2.41.0
> > >
> >
> > --
> >
> > - Arnaldo

-- 

- Arnaldo
