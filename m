Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6C675733
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 15:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz23V1RjVz3fKt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 01:30:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQBdHtot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQBdHtot;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz21x2SXxz3fJV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:29:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24C4361F91;
	Fri, 20 Jan 2023 14:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682A7C433D2;
	Fri, 20 Jan 2023 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674224961;
	bh=IBjuEA1LYU7gz0sqSmBd2iSa+BLtKQyEXGOlz3negME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQBdHtotEDhbBlIuQFXXRtgly8zOJJoZ6Iciib1jvWIjAOMsHBdSvF9ncEfibNEer
	 cqPl9o/UQwVf6EL6NMLWWs2JZVe4YE3X4oEYj1rnQ4gibzpmvTS8JZXgycYA4XvXyE
	 5Pv1gFlIia3/uO0RMly2xM+K4OGm5qVLhn5xzB1cT2HLoo/MCkvSg+qDPR2EcuXvpv
	 zgixVJq5yReDkLg6H7fp9bxaMU5THMpKGl5BUfVORmitGOFKIpOTpo39rAM5EGiaxi
	 tZK7Zs6fVc1iA46v8TZdZ1M03RZBBF1hc1X5sQ+1LcU1u2dS6AYTsg9Wf35Q+E2Yhf
	 jrzM0iFWFP18Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 34352405BE; Fri, 20 Jan 2023 11:29:19 -0300 (-03)
Date: Fri, 20 Jan 2023 11:29:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH V3] tools/perf/tests: Fix string substitutions in build
 id test
Message-ID: <Y8qlP+mmgW0M80u3@kernel.org>
References: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
 <1a2f988593a4403db2a043ff42886ced@AcuMS.aculab.com>
 <Y8l3C8LOohZvQOKH@kernel.org>
 <8c433a543cda48e5b736312903355918@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c433a543cda48e5b736312903355918@AcuMS.aculab.com>
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Jan 20, 2023 at 08:51:59AM +0000, David Laight escreveu:
> From: Arnaldo Carvalho de Melo
> > Sent: 19 January 2023 17:00
> > 
> > Em Thu, Jan 19, 2023 at 03:49:15PM +0000, David Laight escreveu:
> > > From: Athira Rajeev
> > > > Sent: 19 January 2023 14:27
> > > ...
> > > > The test script "tests/shell/buildid.sh" uses some of the
> > > > string substitution ways which are supported in bash, but not in
> > > > "sh" or other shells. Above error on line number 69 that reports
> > > > "Bad substitution" is:
> > >
> > > Looks better - assuming it works :-)
> > 
> > :-)
> > 
> > Can I take this as an:
> > 
> > Acked-by: David Laight <David.Laight@ACULAB.COM>
> 
> I'm not sure that is worth anything.
> You can add a Reviewed-by

Thanks, I'll then add:

Reviewed-by: David Laight <David.Laight@ACULAB.COM>

- Arnaldo
