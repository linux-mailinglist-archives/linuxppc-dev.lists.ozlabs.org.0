Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1A635FEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 14:34:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHMY640Tyz3dvj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 00:34:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LOl7Q4n4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LOl7Q4n4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHMXD4d3gz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 00:33:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5552961C65;
	Wed, 23 Nov 2022 13:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB36C433D6;
	Wed, 23 Nov 2022 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669210409;
	bh=o5a/1D++1Mz35bMC46Wx3lUgNniBZ5e14zrk6/8nSLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOl7Q4n4cEl48OuaUSA+Bgl0IZTxdonu6mUt/hJRzmYjzYC5vh9Aa2N3ZXMxrUR/6
	 48m+AKkRf2fO3muoslzGBzQUQBe2NxHZTgy+eHvpR+Au3yxQ2og13EtKoKPsTf8Wyg
	 nwUHbaUgC/sR+weWCCWEzz0ML39ZkwLmTORo98UEeKQs4s5cDDnvO08asxGGog6Ydz
	 eBDgNoiqpV5wqgiRgNG0A/FUmd9zgySBEdzk5Ud2AYI+S2ARX0UaCBcxxK1s3revGZ
	 GA8gUTbE00d7ixoql1pdSKm1bZNED2WAN8pFIiz5zQiXrapqcLWoVFoJCyl8cfqdRy
	 8bN3OuFhi7ziQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id E73C84034E; Wed, 23 Nov 2022 10:33:26 -0300 (-03)
Date: Wed, 23 Nov 2022 10:33:26 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] perf test: Skip watchpoint tests if no watchpoints
 available
Message-ID: <Y34hJrqCzSE+W+X9@kernel.org>
References: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
 <a9f0f8f1-96cd-f6a8-9dda-d4744b938f97@csgroup.eu>
 <CAP-5=fXJf+1V5RF-m3e+AhK0Qg-yaJ1_2HL0CTOvp1xkK-1fDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXJf+1V5RF-m3e+AhK0Qg-yaJ1_2HL0CTOvp1xkK-1fDg@mail.gmail.com>
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
Cc: Ravi Bangoria <ravi.bangoria@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Nov 22, 2022 at 12:57:05PM -0800, Ian Rogers escreveu:
> On Tue, Nov 22, 2022 at 11:19 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 21/11/2022 à 11:27, Naveen N. Rao a écrit :
> > > On IBM Power9, perf watchpoint tests fail since no hardware breakpoints
> > > are available. Detect this by checking the error returned by
> > > perf_event_open() and skip the tests in that case.
> > >
> > > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > > ---
> > >   tools/perf/tests/wp.c | 12 +++++++-----
> > >   1 file changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/tools/perf/tests/wp.c b/tools/perf/tests/wp.c
> > > index 56455da30341b4..cc8719609b19ea 100644
> > > --- a/tools/perf/tests/wp.c
> > > +++ b/tools/perf/tests/wp.c
> > > @@ -59,8 +59,10 @@ static int __event(int wp_type, void *wp_addr, unsigned long wp_len)
> > >       get__perf_event_attr(&attr, wp_type, wp_addr, wp_len);
> > >       fd = sys_perf_event_open(&attr, 0, -1, -1,
> > >                                perf_event_open_cloexec_flag());
> > > -     if (fd < 0)
> > > +     if (fd < 0) {
> > > +             fd = -errno;
> > >               pr_debug("failed opening event %x\n", attr.bp_type);
> > > +     }
> >
> > Do you really need that ?
> >
> > Can't you directly check errno in the caller ?
> 
> errno is very easily clobbered and not clearly set on success - ie,
> it'd be better not to do that.
> 
> Acked-by: Ian Rogers <irogers@google.com>

Thanks, applied.

- Arnaldo

