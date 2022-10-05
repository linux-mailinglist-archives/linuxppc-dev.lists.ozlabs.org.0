Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A65F545F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 14:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjDLg4kyDz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 23:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ln+86B/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ln+86B/L;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjDKj3XgDz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 23:24:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54D05B81DE5;
	Wed,  5 Oct 2022 12:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E657DC433D6;
	Wed,  5 Oct 2022 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664972686;
	bh=2ZLPtC3a9TOF1txjdBviVWxFAhvwAkz+M288orWgDt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ln+86B/LjYMWcKZ8weC6GWmQC1NpW6ma37Y+0a+S2eLrtucOq+wCQbOrmI12y7ZOk
	 8+0B3yTkB9jBMkvdfty9RdviTwJZh92Vz2mxjTw4I09PvedEQnLaiyT5mXDRyjvtRQ
	 63qf82sxTJVi8lmMFTcqu9oUknJ7S4Ci0P2HoZ4fdW2xpz/Cw2h3f+Ui2YaGHgV9ZR
	 v7o42bkF+PPmcIAOH9ztFjwJL2YzYh17i6AuJqYm0F9v6ledC3EU/gWT3MEKy+H1lY
	 cMDYmEAIssoXCs6zNIz1kW0D2oHViPv6muyx4PB/cqTfowzZptoELsRNZOx3hcROs9
	 65JnM/03fTUQQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id A03254062C; Wed,  5 Oct 2022 09:24:43 -0300 (-03)
Date: Wed, 5 Oct 2022 09:24:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
Message-ID: <Yz13i6RRPmOovlC1@kernel.org>
References: <82D5587E-593A-43A7-92D7-7E095E2BE9A9@linux.vnet.ibm.com>
 <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com>
 <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
 <Yzx4A+2I4yWTlbEn@kernel.org>
 <Yzx4ET7QU2VpCcsx@kernel.org>
 <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, atrajeev <atrajeev@imap.linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Oct 05, 2022 at 10:23:39AM +0530, Athira Rajeev escreveu:
> 
> 
> > On 04-Oct-2022, at 11:44 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > 
> > Em Tue, Oct 04, 2022 at 03:14:27PM -0300, Arnaldo Carvalho de Melo escreveu:
> >> Em Tue, Oct 04, 2022 at 07:49:21AM -0700, Ian Rogers escreveu:
> >>> On Tue, Oct 4, 2022, 12:06 AM Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>>> Thanks for helping with testing. Can I add your Tested-by for the patch ?
> >> 
> >>> Yep.
> >> 
> >>> Tested-by: Ian Rogers <irogers@google.com>
> > 
> > 
> > Thanks, applied.
> > 
> > - Arnaldo
> 
> Hi Arnaldo,
> 
> Looks like you have taken change to remove id.core check:
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=tmp.perf/core&id=db83f447b323958cdc5fedcf2134effb2ec9a6fe
> 
> But the patch that has to go in is :
> "[PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in ggr_printout"
> which is tested by Ian and "pasted" by me in same mail thread.
> 
> Re-pasting here for reference:
> 
> >From 4dd98d953940deb2f85176cb6b4ecbfd18dbdbf9 Mon Sep 17 00:00:00 2001
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Date: Mon, 3 Oct 2022 15:47:27 +0530
> Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout
> 
> perf stat has options to aggregate the counts in different
> modes like per socket, per core etc. The function "aggr_printout"
> in util/stat-display.c which is used to print the aggregates,
> has a check for cpu in case of AGGR_NONE. This check was
> originally using condition : "if (id.cpu.cpu > -1)". But
> this got changed after commit df936cadfb58 ("perf stat: Add
> JSON output option"), which added option to output json format
> for different aggregation modes. After this commit, the
> check in "aggr_printout" is using "if (id.core > -1)".
> 
> The old code was using "id.cpu.cpu > -1" while the new code
> is using "id.core > -1". But since the value printed is
> id.cpu.cpu, fix this check to use cpu and not core.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Suggested-by: James Clark <james.clark@arm.com>
> Suggested-by: Ian Rogers <irogers@google.com>
> ---
> tools/perf/util/stat-display.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index b82844cb0ce7..cf28020798ec 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *config,
> 					id.socket,
> 					id.die,
> 					id.core);
> -			} else if (id.core > -1) {
> +			} else if (id.cpu.cpu > -1) {
> 				fprintf(config->output, "\"cpu\" : \"%d\", ",
> 					id.cpu.cpu);
> 			}
> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *config,
> 					id.die,
> 					config->csv_output ? 0 : -3,
> 					id.core, config->csv_sep);
> -			} else if (id.core > -1) {
> +			} else if (id.cpu.cpu > -1) {
> 				fprintf(config->output, "CPU%*d%s",
> 					config->csv_output ? 0 : -7,
> 					id.cpu.cpu, config->csv_sep);
> -- 
> 2.31.1
> 
> If it is confusing, shall I send it as a separate patch along with Tested-by from Ian ?
> 
> Please revert https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=tmp.perf/core&id=db83f447b323958cdc5fedcf2134effb2ec9a6fe

I'll do it, but in these cases just go ahead and resubmit with a v N+1
patchset, so that b4 can pick the newer version even if I point it to
the previous version message-id.

- Arnaldo
