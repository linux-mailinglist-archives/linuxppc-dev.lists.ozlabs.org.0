Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1EF814AEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 15:46:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NnRoYV0G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsBrF72dzz3dJn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 01:46:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NnRoYV0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsBqQ2FNrz3cZ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 01:46:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 53356B8283B;
	Fri, 15 Dec 2023 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F79C433C7;
	Fri, 15 Dec 2023 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702651565;
	bh=jzFDNJuLJ6cwKQpJEqNkqbBl62KO2NbbGtnvRVADlZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnRoYV0GsxYWyoEIY20WQJJidmceglphxlMhQ3EjEzFb8hP+8jCFMKvLOz2+djyJ1
	 GZJPl0RT0rkGMHyXkNoaeI0nsPc/Dg9kTKYrn43OkKwVJp/2AiuQoBRayqNZHHwFO5
	 4z2y1VJ1h5ktdmFcu3zW34W12H3UysqzkIPoTY0bVyF2j4A4zMdZMbI6xtZiZ3jZDR
	 /kdibaVCfBfAJG6SOKlzZKA2W7L1ot6/0jFqtmDUnnTmPWFECzgdp0ADylIcz2MNY0
	 EIasHAt3t/Yxar14og65MzqyVlxZNwN9EfBZ2RGnh3SzGHPsfpmgayljpaqMZvlpOZ
	 9bGNm95aBVwIw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B7AA3403EF; Fri, 15 Dec 2023 11:46:02 -0300 (-03)
Date: Fri, 15 Dec 2023 11:46:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: perf tools arch Arm CMN PMU JSON files build breakage on ubuntu
 18.04 cross build
Message-ID: <ZXxmqmBrxe5o0Ytk@kernel.org>
References: <ZBxP77deq7ikTxwG@kernel.org>
 <a21aa4e1-506a-916c-03bd-39d7403c7941@linux.ibm.com>
 <ZXxlERShV-TIGVit@kernel.org>
 <ZXxlj3g-KMG3iYjx@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXxlj3g-KMG3iYjx@kernel.org>
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
Cc: Ian Rogers <irogers@google.com>, kajoljain <kjain@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Dec 15, 2023 at 11:41:19AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Dec 15, 2023 at 11:39:14AM -0300, Arnaldo Carvalho de Melo escreveu:
> > Em Mon, Mar 27, 2023 at 09:52:11AM +0530, kajoljain escreveu:
> > > > UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 55090: ordinal not in range(128)
> > > >   CC      /tmp/build/perf/tests/expr.o
> > > > pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
> > > > make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
> > > > make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
> > > > Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
> > > > make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
> > > > make[2]: *** Waiting for unfinished jobs....
> > 
> > > > Now jevents is an opt-out feature so I'm noticing these problems.
> >  
> > >     Thanks for raising it. I will check this issue.
> > 
> > Now I'm seeing this on:
> 
> Jing,
> 
> 	Please take a look at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d9df8731c0941f3add30f96745a62586a0c9d52
> 
> 	For the fix for the ppc case above.

Its the only .json file with that issue:

⬢[acme@toolbox perf-tools-next]$ find tools/perf/pmu-events/ -name "*.json" | xargs file -i | grep -v us-ascii
tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json:                   application/json; charset=utf-8
⬢[acme@toolbox perf-tools-next]$

- Arnaldo
