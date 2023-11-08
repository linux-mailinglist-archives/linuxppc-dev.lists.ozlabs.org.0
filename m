Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B547E5EF0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 21:05:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XOhsS+eL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQbg12B49z3cVn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 07:05:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XOhsS+eL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQbf53RrZz3cR9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 07:04:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C26EDB81BDF;
	Wed,  8 Nov 2023 20:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43DAC433C8;
	Wed,  8 Nov 2023 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699473880;
	bh=qhUpYSukAlblxid3F/W0xizAg/bkGWOSp+MdQC9RSsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOhsS+eL+8m5YpKIsMJuRqU/oI3wEHeZX8FVzQjzYht3WTCF+HjaZNnZpg18KSKrx
	 2LSA4vsnV+P36SAglTSoapW1iVGGZw0MTTNQI36gSHSqR3lC+4QBqkTsA8Fr/2hKVr
	 /lTSNRK1zWPZXKsFH2uAuEholA8QqAmLkSQHkMLEEIND4R/Q6R1FYHIZ33qucFWYHx
	 ebZAC2fTZx1DjZdSV+iPZSSzCqieNjVTr8v9VOsj/rjjWGRYLPdYCT+oB1eWikVp7S
	 zrTeTu3GHxxbLTAy9BaQdBt4ECZFu4mIhK77l0s2byG2uKjLLmI2eJ5nohfHJ+kWpM
	 J2OpqGZoUqNEg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 7ADD24035D; Wed,  8 Nov 2023 17:04:37 -0300 (-03)
Date: Wed, 8 Nov 2023 17:04:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Message-ID: <ZUvp1YPdOWJcLkyJ@kernel.org>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <552cbde4-6077-d5a4-251e-6c77786e1b31@arm.com>
 <3AFF6660-5A0E-4028-BA5A-D18CBAC8E1A4@linux.vnet.ibm.com>
 <ZUleKdUrbR9oFVW4@kernel.org>
 <8DEA17FB-DC0B-41F9-800D-4B74371F4849@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8DEA17FB-DC0B-41F9-800D-4B74371F4849@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Nov 07, 2023 at 12:08:25PM +0530, Athira Rajeev escreveu:
> > On 07-Nov-2023, at 3:14 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >>> Reviewed-by: James Clark <james.clark@arm.com>

> > Some are not applying, even after b4 picking up v2

> > Total patches: 3

> > Cover: ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.cover
> > Link: https://lore.kernel.org/r/20231013073021.99794-1-atrajeev@linux.vnet.ibm.com
> > Base: not specified
> >       git am ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.mbx
> > ⬢[acme@toolbox perf-tools-next]$        git am ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.mbx
> > Applying: tools/perf/tests Ignore the shellcheck SC2046 warning in lock_contention
> > error: patch failed: tools/perf/tests/shell/lock_contention.sh:33
> > error: tools/perf/tests/shell/lock_contention.sh: patch does not apply
> > Patch failed at 0001 tools/perf/tests Ignore the shellcheck SC2046 warning in lock_contention
> > hint: Use 'git am --show-current-patch=diff' to see the failed patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> > ⬢[acme@toolbox perf-tools-next]$ git am --abort
> > ⬢[acme@toolbox perf-tools-next]$
 
> The patch is picked up : https://lore.kernel.org/all/169757198796.167943.10552920255799914362.b4-ty@kernel.org/ .
> Thanks for looking into.

Thanks for checking, my mistake then,

- Arnaldo
