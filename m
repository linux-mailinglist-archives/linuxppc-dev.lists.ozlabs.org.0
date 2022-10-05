Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5245F549A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 14:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjDb035XNz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 23:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FqMsFoM5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FqMsFoM5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjDZ43z5zz2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 23:35:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C375AB81C44;
	Wed,  5 Oct 2022 12:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371E6C433D6;
	Wed,  5 Oct 2022 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664973336;
	bh=n3uxAPagq6lhuYs2Q/ymQSQ+tG2YXiSgBL5FgiUtu/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqMsFoM5vTIhFqyhXgJtDfTuVICFjtgXn1XVyDRkSY7KoL3o94nvmH0Z/fzYHEHF8
	 /igRAE/G2C4O4BiQflN/wjuo4rlANzlDeKQiTqvkA92M4HveMEw7qxXtHDWz/QV4GM
	 7BxVBuelfhM1UX9cKRuScojDBFOkfPBsjbKO6+LnRtl/INRVt4F7H4LGqyoNqVTtqO
	 T2WF65EUaJESmVMth/er+W567aVjCJQvDbmg0XuztMI1OBVIa0K/ChmSFqhmx00CoK
	 z3ibMkSaSKvuAfs63/H+hZcU8wTb7jL3APAE8lUAEjeME4sYvB4co1Nxqe+7e3F4kb
	 GAWPwM4Hq66+A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id AEF0E4062C; Wed,  5 Oct 2022 09:35:33 -0300 (-03)
Date: Wed, 5 Oct 2022 09:35:33 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
Message-ID: <Yz16FdcUF+Wn8xvA@kernel.org>
References: <6627ae9a-91e3-0923-1234-54e0fc3f4916@arm.com>
 <CAP-5=fVBzLfhfwPjxE_9DNeesPaPxf3k0b5T5S6THzB1H85mrA@mail.gmail.com>
 <993a1391ee931e859d972c460644d171@imap.linux.ibm.com>
 <CAP-5=fWJ0YBxdCarpNSfbzoAZ9uTAtgj4CdR7sQU8748Y-+DVA@mail.gmail.com>
 <6A5D0603-CF66-43B4-A13F-0308CF01967A@linux.vnet.ibm.com>
 <CAP-5=fU=bwv-e_53QagWsKvW8wjibOjfGvnivWFFVba5A55boA@mail.gmail.com>
 <Yzx4A+2I4yWTlbEn@kernel.org>
 <Yzx4ET7QU2VpCcsx@kernel.org>
 <137635B2-F4E8-4C65-B797-5C6511E265A8@linux.vnet.ibm.com>
 <Yz14hG3EVJPph11m@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz14hG3EVJPph11m@kernel.org>
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

Em Wed, Oct 05, 2022 at 09:28:52AM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Wed, Oct 05, 2022 at 10:23:39AM +0530, Athira Rajeev escreveu:
> > diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> > index b82844cb0ce7..cf28020798ec 100644
> > --- a/tools/perf/util/stat-display.c
> > +++ b/tools/perf/util/stat-display.c
> > @@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *config,
> > 					id.socket,
> > 					id.die,
> > 					id.core);
> > -			} else if (id.core > -1) {
> > +			} else if (id.cpu.cpu > -1) {
> > 				fprintf(config->output, "\"cpu\" : \"%d\", ",
> > 					id.cpu.cpu);
> > 			}
> > @@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *config,
> > 					id.die,
> > 					config->csv_output ? 0 : -3,
> > 					id.core, config->csv_sep);
> > -			} else if (id.core > -1) {
> > +			} else if (id.cpu.cpu > -1) {
> > 				fprintf(config->output, "CPU%*d%s",
> > 					config->csv_output ? 0 : -7,
> > 					id.cpu.cpu, config->csv_sep);
> > -- 
> > If it is confusing, shall I send it as a separate patch along with Tested-by from Ian ?
> 
> I'll have to do this by hand, tried pointing b4 to this message and it
> picked the old one, also tried to save the message and apply by hand,
> its mangled.

This is what I have now, will force push later, please triple check :-)

- Arnaldo

From b7dd96f9211e4ddbd6fa080da8dec2eac98d3f2a Mon Sep 17 00:00:00 2001
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Date: Tue, 13 Sep 2022 17:27:17 +0530
Subject: [PATCH 1/1] perf stat: Fix aggr_printout to display CPU field
 irrespective of core value

perf stat includes option to specify aggr_mode to display per-socket,
per-core, per-die, per-node counter details.  Also there is option -A (
AGGR_NONE, -no-aggr ), where the counter values are displayed for each
CPU along with "CPU" value in one field of the output.

Each of the aggregate mode uses the information fetched from
"/sys/devices/system/cpu/cpuX/topology" like core_id,
physical_package_id. Utility functions in "cpumap.c" fetches this
information and populates the socket id, core id, CPU etc.  If the
platform does not expose the topology information, these values will be
set to -1. Example, in case of powerpc, details like physical_package_id
is restricted to be exposed in pSeries platform. So id.socket, id.core,
id.cpu all will be set as -1.

In case of displaying socket or die value, there is no check done in the
"aggr_printout" function to see if it points to valid socket id or die.
But for displaying "cpu" value, there is a check for "if (id.core >
-1)". In case of powerpc pSeries where detail like physical_package_id
is restricted to be exposed, id.core will be set to -1. Hence the column
or field itself for CPU won't be displayed in the output.

Result for per-socket:

  perf stat -e branches --per-socket -a true

   Performance counter stats for 'system wide':

  S-1      32            416,851      branches

Here S has -1 in above result. But with -A option which also expects CPU
in one column in the result, below is observed.

  perf stat -e instructions -A -a true

   Performance counter stats for 'system wide':

            47,146      instructions
            45,226      instructions
            43,354      instructions
            45,184      instructions

If the CPU id value is pointing to -1 also, it makes sense to display
the column in the output to replicate the behaviour or to be in
precedence with other aggr options(like per-socket, per-core). Remove
the check "id.core" so that CPU field gets displayed in the output.

After the fix:

  perf stat -e instructions -A -a true

   Performance counter stats for 'system wide':

  CPU-1                  64,034      instructions
  CPU-1                  68,941      instructions
  CPU-1                  59,418      instructions
  CPU-1                  70,478      instructions
  CPU-1                  65,201      instructions
  CPU-1                  63,704      instructions

This is caught while running "perf test" for "stat+json_output.sh" and
"stat+csv_output.sh".

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Suggested-by: Ian Rogers <irogers@google.com>
Suggested-by: James Clark <james.clark@arm.com>
Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Tested-by: Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20220913115717.36191-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/stat-display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index df26fb5eb072be9f..5c47ee9963a7c04c 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.socket,
 					id.die,
 					id.core);
-			} else if (id.core > -1) {
+			} else if (id.cpu.cpu > -1) {
 				fprintf(config->output, "\"cpu\" : \"%d\", ",
 					id.cpu.cpu);
 			}
@@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.die,
 					config->csv_output ? 0 : -3,
 					id.core, config->csv_sep);
-			} else if (id.core > -1) {
+			} else if (id.cpu.cpu > -1) {
 				fprintf(config->output, "CPU%*d%s",
 					config->csv_output ? 0 : -7,
 					id.cpu.cpu, config->csv_sep);
-- 
2.37.3

