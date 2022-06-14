Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA354BA69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 21:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMys81hR0z3cf7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 05:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EScb7iSo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EScb7iSo;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMyrY0pDNz3bs9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 05:18:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 42C71CE1C48;
	Tue, 14 Jun 2022 19:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5739FC3411B;
	Tue, 14 Jun 2022 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655234280;
	bh=FkZw6H17yuD8ClRcK7e3hgSjktksESJzVPAsVJ1/HuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EScb7iSo/mjlIrpaIh5zTTlMrt1P6IP7AFjsm9wiZTiolgrSUycrndaAWgl2NLywV
	 rb/+8hK2eHSXGBiHjpou1uvgPWKi8bt9fiJpZ8l1ATT7qcv5XtT8HuD3FHq7U0LBlD
	 FShuAs8p83pTalZ9e/AL8CJKvD6ihMJnuq5inBHW2JG1i+prN8CWxhOTva1PXAGG6w
	 Y0A4dRq0xBxla/ohPqOtpUx/GAAUxTfxupgCU095rTBsDufp/LZhP64NrQaYl7XDih
	 Hk4YSwLKO2JNXLur+bwChuPEehAsg0XUCX/3BcAVQjbgk/Yl++uumc5WNHL+sJ6Wn1
	 Js+ggLkoZjnOw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 0FD974096F; Tue, 14 Jun 2022 16:17:58 -0300 (-03)
Date: Tue, 14 Jun 2022 16:17:58 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] tools/perf/tests: Fix session topology test comparison
 check
Message-ID: <Yqje5nUpPdkyvfuQ@kernel.org>
References: <20220610135939.63361-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fV6sPUtSqPBmJ0dmeUK+wuuXgyq-GQRV_g_B5uC4y5oGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fV6sPUtSqPBmJ0dmeUK+wuuXgyq-GQRV_g_B5uC4y5oGA@mail.gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com, tmricht@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 14, 2022 at 07:38:55AM -0700, Ian Rogers escreveu:
> On Fri, Jun 10, 2022 at 7:00 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > commit cfd7092c31ae ("perf test session topology: Fix test to
> > skip the test in guest environment") added check to skip the
> > testcase if the socket_id can't be fetched from topology info.
> > But the condition check uses strncmp which should be changed to
> > !strncmp and to correctly match platform. Patch fixes this
> > condition check.
> >
> > Fixes: cfd7092c31ae ("perf test session topology: Fix test to skip the test in guest environment")
> > Reported-by: Thomas Richter <tmricht@linux.ibm.com>
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Acked-by: Ian Rogers <irogers@google.com>

Thanks, applied.

- Arnaldo

 
> Thanks,
> Ian
> 
> > ---
> >  tools/perf/tests/topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
> > index d23a9e322ff5..0b4f61b6cc6b 100644
> > --- a/tools/perf/tests/topology.c
> > +++ b/tools/perf/tests/topology.c
> > @@ -115,7 +115,7 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
> >          * physical_package_id will be set to -1. Hence skip this
> >          * test if physical_package_id returns -1 for cpu from perf_cpu_map.
> >          */
> > -       if (strncmp(session->header.env.arch, "powerpc", 7)) {
> > +       if (!strncmp(session->header.env.arch, "ppc64le", 7)) {
> >                 if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)
> >                         return TEST_SKIP;
> >         }
> > --
> > 2.35.1
> >

-- 

- Arnaldo
