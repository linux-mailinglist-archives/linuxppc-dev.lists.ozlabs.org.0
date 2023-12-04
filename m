Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6D803F30
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 21:22:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HZVcGy0m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkZq158Zbz3cmW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 07:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HZVcGy0m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkZp83QtFz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 07:22:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4DB73B811F6;
	Mon,  4 Dec 2023 20:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A61C433B8;
	Mon,  4 Dec 2023 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701721323;
	bh=PjUxLEuMpPT3Gh8kqwZ43jGuO0j2CLzhXvjSFTof8dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZVcGy0mxpw2Hn/hgqHSUccNQ84SY5TwbiJWA+Ur8xUSVXOz7/rZCD1x1JH6UACTZ
	 GXmnmMk9Dpd/l2QwukdMYt+NLR3W8Ojnizf3NluhSPtKM9xZEBuXoyvcfA3elST5pL
	 xpLsk3T1FrHcv0dfrkY75YnIDe63vnnh3XR1POfmo83iLKfQ/KpBav4P8vpWRpbigI
	 FW402qW8qWj/BWAp8JabZOahUgiTpqGKminukOguSg4HVKosSXwQB0XWsSm0mbBfBe
	 uN5mhs1Ctq3ctowQ7wzSCswRNebKaZcCk1PedAHx5L1WlGOHHxmq5xuI5048zOdcev
	 fGkhtPwDSJTbQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BC96C40094; Mon,  4 Dec 2023 17:22:00 -0300 (-03)
Date: Mon, 4 Dec 2023 17:22:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
Message-ID: <ZW406O38z3DmVwOX@kernel.org>
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWtLHCyZh_6hBkCg16ekOXfwSGAVT9xvgKcUsMcu=Ou9w@mail.gmail.com>
 <ZW40nstmGUeV9Fie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZW40nstmGUeV9Fie@kernel.org>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Dec 04, 2023 at 05:20:46PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Mon, Dec 04, 2023 at 12:12:54PM -0800, Ian Rogers escreveu:
> > On Thu, Nov 23, 2023 at 8:01 AM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> > >
> > > Running "perf list" on powerpc fails with segfault
> > > as below:
> > >
> > >    ./perf list
> > >    Segmentation fault (core dumped)
> > >
> > > This happens because of duplicate events in the json list.
> > > The powerpc Json event list contains some event with same
> > > event name, but different event code. They are:
> > > - PM_INST_FROM_L3MISS (Present in datasource and frontend)
> > > - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
> > > - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
> > > - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
> > >
> > > pmu_events_table__num_events uses the value from
> > > table_pmu->num_entries which includes duplicate events as
> > > well. This causes issue during "perf list" and results in
> > > segmentation fault.
> > >
> > > Since both event codes are valid, append _DSRC to the Data
> > > Source events (datasource.json), so that they would have a
> > > unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
> > > PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
> > > works as expected.
> > >
> > > Fixes: fc1435807533 ("perf vendor events power10: Update JSON/events")
> > > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > 
> > Given duplicate events creates broken pmu-events.c we should capture
> > that as an exception in jevents.py. That way a JEVENTS_ARCH=all build
> > will fail if any vendor/architecture would break in this way. We
> > should also add JEVENTS_ARCH=all to tools/perf/tests/make. Athira, do
> > you want to look at doing this?
> 
> Should I go ahead and remove this patch till this is sorted out?

I'll keep it, its already in tmp.perf-tools-next, we can go from there
and improve this with follow up patches,

- Arnaldo
