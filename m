Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5047675FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 21:05:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KkMRmy+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCHCD4821z3cQj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 05:05:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KkMRmy+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCHBJ461sz2ysp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 05:04:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 767B5621CC;
	Fri, 28 Jul 2023 19:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A8DC433C8;
	Fri, 28 Jul 2023 19:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690571077;
	bh=oCcj4l/vxi3/5RrYa/uVUooUB2AdUtBM+entoWzf4Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkMRmy+QWHMDjCVm7r9wyeSdGZ6tqC//Nui97d5EU1UZI22qzfjN/kVC6ariGtpYY
	 kKGF06NSQ7S/pJjsEHiqEMZIm6Yn39mtWQ/HWAgduLaWGjBPVmqQ2N228YWMiLS9nb
	 fVigmhD1fE9EMmIdhkZiW2ZgePbhluErtE8IYB3rQ+mB3lJ1QMFCvpSNNkJdP1H7BZ
	 wjArhSXiRtoRUeWPdqDwvK9SMeWGyX/FSydqr6Sp7pKgoDJJVMiqRrTuMjHrm1Eoci
	 icQ0EQ/7G/48aseE6SvQvnJkCkpvel+nlGzOmT/NqAJGyGwH2yKaEqiGZCGT3C4HVb
	 ktOxhZAjk97IA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 57DAA40096; Fri, 28 Jul 2023 16:04:35 -0300 (-03)
Date: Fri, 28 Jul 2023 16:04:35 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
Message-ID: <ZMQRQ7K0DfgzH7yJ@kernel.org>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
 <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
 <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
 <D52339A7-30C6-4066-AE05-4BF8E9DCCFF4@linux.vnet.ibm.com>
 <1f1e9978-a176-0ae9-6dac-8cc275c5f905@linux.ibm.com>
 <89C3584E-97E6-4FCF-ABFA-C94AD3F65BC4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89C3584E-97E6-4FCF-ABFA-C94AD3F65BC4@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jul 25, 2023 at 11:20:37AM +0530, Athira Rajeev escreveu:
> 
> 
> > On 20-Jul-2023, at 10:48 AM, kajoljain <kjain@linux.ibm.com> wrote:
> > 
> > 
> > 
> > On 7/20/23 10:42, Athira Rajeev wrote:
> >> 
> >> 
> >>> On 19-Jul-2023, at 11:16 PM, Ian Rogers <irogers@google.com> wrote:
> >>> 
> >>> On Tue, Jul 18, 2023 at 11:17 PM kajoljain <kjain@linux.ibm.com> wrote:
> >>>> 
> >>>> Hi,
> >>>> 
> >>>> Looking for review comments on this patchset.
> >>>> 
> >>>> Thanks,
> >>>> Kajol Jain
> >>>> 
> >>>> 
> >>>> On 7/9/23 23:57, Athira Rajeev wrote:
> >>>>> Patchset covers a set of fixes for coding/formatting issues observed while
> >>>>> running shellcheck tool on the perf shell scripts.
> >>>>> 
> >>>>> This cleanup is a pre-requisite to include a build option for shellcheck
> >>>>> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
> >>>>> First set of patches were posted here:
> >>>>> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2B522C@linux.vnet.ibm.com/T/#t
> >>>>> 
> >>>>> This patchset covers remaining set of shell scripts which needs
> >>>>> fix. Patch 1 is resubmission of patch 6 from the initial series.
> >>>>> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
> >>>>> Other patches are fixes for scripts from tools/perf/tests.
> >>>>> 
> >>>>> The shellcheck is run for severity level for errors and warnings.
> >>>>> Command used:
> >>>>> 
> >>>>> # for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> >>>>> # echo $?
> >>>>> 0
> >>>>> 
> >>> 
> >>> I don't see anything objectionable in the changes so for the series:
> >>> Acked-by: Ian Rogers <irogers@google.com>
> >>> 
> >>> Some thoughts:
> >>> - Adding "#!/bin/bash" to scripts in tools/perf/tests/lib - I think
> >>> we didn't do this to avoid these being included as tests. There are
> >>> now extra checks when finding shell tests, so I can imagine doing this
> >>> isn't a regression but just a heads up.
> >>> - I think James' comment was addressed:
> >>> https://lore.kernel.org/linux-perf-users/334989bf-5501-494c-f246-81878fd2fed8@arm.com/
> >>> - Why aren't these changes being mailed to LKML? The wider community
> >>> on LKML have thoughts on shell scripts, plus it makes the changes miss
> >>> my mail filters.
> >>> - Can we automate this testing into the build? For example, following
> >>> a similar kernel build pattern we run a python test and make the log
> >>> output a requirement here:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/pmu-events/Build?h=perf-tools-next#n30
> >>>  I think we can translate:
> >>> for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck
> >>> -S warning $F; done
> >>>  into a rule in make for log files that are then a dependency on the
> >>> perf binary. We can then parallel shellcheck during the build and
> >>> avoid regressions. We probably need a CONFIG_SHELLCHECK feature check
> >>> in the build to avoid not having shellcheck breaking the build.
> >> 
> >> Hi Ian
> >> 
> >> Thanks for the comments.
> >> Yes, next step after this is to include build option for shellcheck by updating Makefile.
> >> We will surely get into that build option enablement patch once we have all these corrections in place.
> >> 
> >> Thanks
> >> Athira
> >>> 
> > 
> > Hi Ian,
> >   Thanks for reviewing the patches. As athira mentioned our next is to
> > include build option. So, we will work on it next once all the
> > correction done.
> > 
> > Thanks,
> > Kajol Jain
> 
> Hi Arnaldo,  Namhyung
> 
> Can you have this patchset applied along with Acked-by from Ian ?
> Our next step is to add a build option for shellcheck by updating Makefile and will be working on that.

I'll check it now
 
> Thanks
> Athira 
> > 
> >>> Thanks,
> >>> Ian
> >>> 
> >>>>> Changelog:
> >>>>> v1 -> v2:
> >>>>> - Rebased on top of perf-tools-next from:
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf-tools-next
> >>>>> 
> >>>>> - Fixed shellcheck errors and warnings reported for newly
> >>>>>   added changes from perf-tools-next branch
> >>>>> 
> >>>>> - Addressed review comment from James clark for patch
> >>>>>   number 13 from V1. The changes in patch 13 were not necessary
> >>>>>   since the file "tests/shell/lib/coresight.sh" is sourced from
> >>>>>   other test files.
> >>>>> 
> >>>>> Akanksha J N (1):
> >>>>> tools/perf/tests: Fix shellcheck warnings for
> >>>>>   trace+probe_vfs_getname.sh
> >>>>> 
> >>>>> Athira Rajeev (14):
> >>>>> tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
> >>>>> tools/perf/tests: Fix unused variable references in
> >>>>>   stat+csv_summary.sh testcase
> >>>>> tools/perf/tests: fix shellcheck warning for
> >>>>>   test_perf_data_converter_json.sh testcase
> >>>>> tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
> >>>>>   testcase
> >>>>> tools/perf/tests: Fix shellcheck issues in
> >>>>>   tests/shell/stat+shadow_stat.sh tetscase
> >>>>> tools/perf/tests: Fix shellcheck warnings for
> >>>>>   thread_loop_check_tid_10.sh
> >>>>> tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
> >>>>> tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
> >>>>> tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
> >>>>> tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
> >>>>> tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
> >>>>> tools/perf/tests/shell: Fix the shellcheck warnings in
> >>>>>   record+zstd_comp_decomp.sh
> >>>>> tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
> >>>>>   testcase
> >>>>> tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
> >>>>>   testcase
> >>>>> 
> >>>>> Kajol Jain (11):
> >>>>> tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
> >>>>>   testcase
> >>>>> tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
> >>>>> tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
> >>>>> tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
> >>>>>   testcase
> >>>>> tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
> >>>>>   script
> >>>>> tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
> >>>>>   shell script
> >>>>> tools/perf/tests: Fix shellcheck warning for probe.sh shell script
> >>>>> tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
> >>>>> tools/perf: Fix shellcheck issue for check-headers.sh script
> >>>>> tools/shell/coresight: Fix shellcheck warning for
> >>>>>   thread_loop_check_tid_2.sh shell script
> >>>>> tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
> >>>>>   shell script
> >>>>> 
> >>>>> .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
> >>>>> tools/perf/check-headers.sh                   |  6 ++--
> >>>>> .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
> >>>>> .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
> >>>>> .../coresight/thread_loop_check_tid_10.sh     |  2 +-
> >>>>> .../coresight/thread_loop_check_tid_2.sh      |  2 +-
> >>>>> .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
> >>>>> tools/perf/tests/shell/lib/probe.sh           |  1 +
> >>>>> .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
> >>>>> tools/perf/tests/shell/lib/stat_output.sh     |  1 +
> >>>>> tools/perf/tests/shell/lib/waiting.sh         |  1 +
> >>>>> tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
> >>>>> tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
> >>>>> .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
> >>>>> tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
> >>>>> tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
> >>>>> tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
> >>>>> tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
> >>>>> tools/perf/tests/shell/stat+std_output.sh     |  3 +-
> >>>>> tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
> >>>>> .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
> >>>>> tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
> >>>>> .../shell/test_perf_data_converter_json.sh    |  2 +-
> >>>>> .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
> >>>>> tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
> >>>>> tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
> >>>>> 26 files changed, 67 insertions(+), 71 deletions(-)
> 
> 

-- 

- Arnaldo
