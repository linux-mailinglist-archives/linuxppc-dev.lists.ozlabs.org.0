Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F707E2F19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 22:45:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OBZGk+jH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPPym6Khyz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 08:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OBZGk+jH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPPxx0PLJz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 08:44:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3F547B811C3;
	Mon,  6 Nov 2023 21:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B19DC433C8;
	Mon,  6 Nov 2023 21:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699307052;
	bh=LBKwZloHD3GlayFamfjU11QjRAvkSMi0DO66ETP6VBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBZGk+jHlSNRYyKPzYEBn8MZwAtY0h62KDpzbvbBGFbIDwl2NxG8o1SziCxcT7xLo
	 npP5TdUrURwGEsg9Tjw2IxthXRhgC2+bU8ndf6VVhPaAvIpUkD2WYdzIqtC7X1GFID
	 9Fi35ty1X/dqWYxGtxY2Bq4sTSqXw9zuJii5sqtprVdTiZ5wreW6VfS0hWrX1gXlE6
	 gqv0aI+EHw9LwBc2VdiM2fBlAZ3usPWPsEjrbH7aWxEaVkUw4G/VIHLPIMPEIetfHi
	 j+Cj3UtmAWRf7HJVh04RgX3IXn+Ns2jK5PKS2xa5wdPYS5wfIeEBobeid96nTYCGWV
	 r1zeDkDjJlswA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id F254F4035D; Mon,  6 Nov 2023 18:44:09 -0300 (-03)
Date: Mon, 6 Nov 2023 18:44:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Message-ID: <ZUleKdUrbR9oFVW4@kernel.org>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <552cbde4-6077-d5a4-251e-6c77786e1b31@arm.com>
 <3AFF6660-5A0E-4028-BA5A-D18CBAC8E1A4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3AFF6660-5A0E-4028-BA5A-D18CBAC8E1A4@linux.vnet.ibm.com>
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

Em Thu, Oct 05, 2023 at 02:24:15PM +0530, Athira Rajeev escreveu:
> > On 05-Oct-2023, at 1:50 PM, James Clark <james.clark@arm.com> wrote:
> > On 29/09/2023 05:11, Athira Rajeev wrote:
> >> Running shellcheck on tests/shell/test_arm_coresight.sh
> >> throws below warnings:
> >> 
> >> In tests/shell/test_arm_coresight.sh line 15:
> >> cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu* -print -quit)
> >>                  ^--^ SC2061: Quote the parameter to -name so the shell won't interpret it.
> >> 
> >> In tests/shell/test_arm_coresight.sh line 20:
> >> if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
> >>                              ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined
> >> 
> >> This warning is observed after commit:
> >> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")"
> >> 
> >> Fixed this issue by using quoting 'cpu*' for SC2061 and
> >> using "&&" in line number 20 for SC2166 warning
> >> 
> >> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
> >> index fe78c4626e45..f2115dfa24a5 100755
> >> --- a/tools/perf/tests/shell/test_arm_coresight.sh
> >> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
> >> @@ -12,12 +12,12 @@
> >> glb_err=0
> >> 
> >> cs_etm_dev_name() {
> >> - cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu* -print -quit)
> >> + cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name 'cpu*' -print -quit)
> >> trcdevarch=$(cat ${cs_etm_path}/mgmt/trcdevarch)
> >> archhver=$((($trcdevarch >> 12) & 0xf))
> >> archpart=$(($trcdevarch & 0xfff))
> >> 
> >> - if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
> >> + if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
> >> echo "ete"
> >> else
> >> echo "etm"
> > 
> > 
> > Reviewed-by: James Clark <james.clark@arm.com>

Some are not applying, even after b4 picking up v2

Total patches: 3
---
Cover: ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.cover
 Link: https://lore.kernel.org/r/20231013073021.99794-1-atrajeev@linux.vnet.ibm.com
 Base: not specified
       git am ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.mbx
⬢[acme@toolbox perf-tools-next]$        git am ./v2_20231013_atrajeev_fix_for_shellcheck_issues_with_latest_scripts_in_tests_shell.mbx
Applying: tools/perf/tests Ignore the shellcheck SC2046 warning in lock_contention
error: patch failed: tools/perf/tests/shell/lock_contention.sh:33
error: tools/perf/tests/shell/lock_contention.sh: patch does not apply
Patch failed at 0001 tools/perf/tests Ignore the shellcheck SC2046 warning in lock_contention
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
⬢[acme@toolbox perf-tools-next]$ git am --abort
⬢[acme@toolbox perf-tools-next]$
