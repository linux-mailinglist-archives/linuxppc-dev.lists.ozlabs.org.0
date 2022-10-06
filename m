Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D25F68BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtTf3CY8z3dqV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:04:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7D7v3DB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7D7v3DB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtSl4FQDz3bqn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:03:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C41BB8202F;
	Thu,  6 Oct 2022 14:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E8C433D6;
	Thu,  6 Oct 2022 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665064995;
	bh=wf7OSuh0L2i4XtkdDkRXHGr/tdQFot0vIQqK82uYxKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7D7v3DBFqVsqVCVxOBn9y+EWoEX3gcezoz6NUB8TzrKozXLmDY9Rv/2yBfjNrb/0
	 gtOwN4iTy0v/8JZpUsZh/JO0gLvRmAr6hUUYfpvmKNvmuZ9iaVGRdPJjDIILvE6vle
	 bCP/i0wVRGdhvI20OrSpU0D72xjbdXaArNTPXyUc34KoTy/uwYU3Ew/ACwTU6ksKqi
	 9QpYdN48a0JsELoDd0fi7aJGFR5PqR7j6RHYYrVUjcw1LSOcch/tf5+D2rINL9coD4
	 Wp42iPuqhtXn6BVfQ0LRIc+m4MW/Jl9S4nNYlG1zTJv1+asgoQpDuwoAMlsMFaG669
	 VG7Y8I5yofPhg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 850914062C; Thu,  6 Oct 2022 11:03:12 -0300 (-03)
Date: Thu, 6 Oct 2022 11:03:12 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
Message-ID: <Yz7gIHyBhvR5UcaM@kernel.org>
References: <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
 <Yzx4A+2I4yWTlbEn@kernel.org>
 <Yzx4ET7QU2VpCcsx@kernel.org>
 <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
 <Yz14hG3EVJPph11m@kernel.org>
 <Yz16FdcUF+Wn8xvA@kernel.org>
 <3D36EC01-B516-46CA-BC71-010617DB4A9D@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3D36EC01-B516-46CA-BC71-010617DB4A9D@linux.vnet.ibm.com>
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

Em Thu, Oct 06, 2022 at 06:16:14PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 05-Oct-2022, at 6:05 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > 
> > Em Wed, Oct 05, 2022 at 09:28:52AM -0300, Arnaldo Carvalho de Melo escreveu:
> >> Em Wed, Oct 05, 2022 at 10:23:39AM +0530, Athira Rajeev escreveu:
> >>> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> >>> index b82844cb0ce7..cf28020798ec 100644
> >>> --- a/tools/perf/util/stat-display.c
> >>> +++ b/tools/perf/util/stat-display.c
> >>> @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *config,
> >>> 					id.socket,
> >>> 					id.die,
> >>> 					id.core);
> >>> -			} else if (id.core > -1) {
> >>> +			} else if (id.cpu.cpu > -1) {
> >>> 				fprintf(config->output, "\"cpu\" : \"%d\", ",
> >>> 					id.cpu.cpu);
> >>> 			}
> >>> @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *config,
> >>> 					id.die,
> >>> 					config->csv_output ? 0 : -3,
> >>> 					id.core, config->csv_sep);
> >>> -			} else if (id.core > -1) {
> >>> +			} else if (id.cpu.cpu > -1) {
> >>> 				fprintf(config->output, "CPU%*d%s",
> >>> 					config->csv_output ? 0 : -7,
> >>> 					id.cpu.cpu, config->csv_sep);
> >>> -- 
> >>> If it is confusing, shall I send it as a separate patch along with Tested-by from Ian ?
> >> 
> >> I'll have to do this by hand, tried pointing b4 to this message and it
> >> picked the old one, also tried to save the message and apply by hand,
> >> its mangled.
> > 
> > This is what I have now, will force push later, please triple check :-)
> 
> 
> Sorry for all the confusion Arnaldo. Hereafter, I will resubmit the patch to avoid this.
> In below patch which you shared, code change is correct. But commit message is different.
> So to avoid further confusion, I went ahead and posted a separate patch in the mailing list with:
> 
> subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout
> Patch link: https://lore.kernel.org/lkml/20221006114225.66303-1-atrajeev@linux.vnet.ibm.com/T/#u
> 
> Please pick the separately send patch.

Ok, will do.

- Arnaldo
