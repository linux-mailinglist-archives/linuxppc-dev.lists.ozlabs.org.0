Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1BC73C4D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 01:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qnv052w94z3c13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 09:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.180; helo=mail-yb1-f180.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QntzX6WNTz30P5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 09:41:12 +1000 (AEST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bacf685150cso981695276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 16:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563670; x=1690155670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtQbddG1H64F3aPrbEnH+Y3DELwzZ1ltdWOcLHRFOEE=;
        b=YLQVmBlQT9iCTW/UIc0pj6oSMCvb4OpL4/OsU4c1/Is70k2yDvoHDu25eKBI3/R1Ca
         Ix39LHOjmqahxVxjmXDLMTFJZOmVI5vPDUJgRmHUXahl8w3tkcNOHnk2NBJc7NjZDH2L
         +DMo63DFqE3lYNhzulOFtPg+jT24H3a71Fzpcf31xqBYCtB/KcxIX+P+T3hmZI5hiEVy
         FLIffAKF0JCv9i0CaN6NQ4WjAl3PwPYItAq6JrXeWHnXlRB0n8qxOXoAmhlliQc0Ib/D
         sFR/jHpi0W0bbxw6yZBQQlZQY0PBbDMJUfhPiD3G/CfT4GyJGkmB4Gdx/SmYRLy4NjXr
         +rFg==
X-Gm-Message-State: AC+VfDxSM+Dep7kfJUyC5U8NggnSyjyWoSz5e70+cV6TeKEcgnD8GyOV
	yqobxTVM0M5X1o70mB0dmNmHxckg/TAQeiDadKE=
X-Google-Smtp-Source: ACHHUZ6ezoNJi7hfr0fqJFKxqMLm+TxDihoiReWtwdkozqCi1mEuYpX1dSwa22PY69DvC0gvJyAIOf285BKnmX0YvQo=
X-Received: by 2002:a25:b21e:0:b0:bc5:affa:fedb with SMTP id
 i30-20020a25b21e000000b00bc5affafedbmr17862375ybj.41.1687563669805; Fri, 23
 Jun 2023 16:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 23 Jun 2023 16:40:58 -0700
Message-ID: <CAM9d7cj_7SBXtCuP66xra0R4ygNt851A6f20s6BtfyXCzZJrtQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] tools/perf: Fix shellcheck coding/formatting issues
 of perf tool shell scripts
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Jun 21, 2023 at 1:30=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Patchset covers a set of fixes for coding/formatting issues observed whil=
e
> running shellcheck tool on the perf shell scripts.
>
> This cleanup is a pre-requisite to include a build option for shellcheck
> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.h=
tml
> First set of patches were posted here:
> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2B=
522C@linux.vnet.ibm.com/T/#t
>
> This patchset covers remaining set of shell scripts which needs
> fix. Patch 1 is resubmission of patch 6 from the initial series.
> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
> Other patches are fixes for scripts from tools/perf/tests.

Thanks for this work.  But it seems there are some issues
even after applying this series.

  $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do
  > shellcheck $F; done | grep -c -e '(info)' -e '(warning)'
  29

  $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do
  > shellcheck $F; done | grep ^In
  In tests/shell/pipe_test.sh line 10:
  In tests/shell/pipe_test.sh line 15:
  In tests/shell/pipe_test.sh line 20:
  In tests/shell/pipe_test.sh line 21:
  In tests/shell/pipe_test.sh line 26:
  In tests/shell/pipe_test.sh line 27:
  In tests/shell/pipe_test.sh line 33:
  In tests/shell/record+zstd_comp_decomp.sh line 16:
  In tests/shell/record+zstd_comp_decomp.sh line 22:
  In tests/shell/record+zstd_comp_decomp.sh line 27:
  In tests/shell/record+zstd_comp_decomp.sh line 28:
  In tests/shell/record+zstd_comp_decomp.sh line 29:
  In tests/shell/record+zstd_comp_decomp.sh line 30:
  In tests/shell/record+zstd_comp_decomp.sh line 36:
  In tests/shell/coresight/thread_loop_check_tid_2.sh line 8:
  In tests/shell/coresight/thread_loop_check_tid_2.sh line 11:
  In tests/shell/coresight/thread_loop_check_tid_2.sh line 14:

Also unfortunately there's some update in the shell tests.
Please rebase onto the perf-tools-next.

Thanks,
Namhyung


>
> Akanksha J N (1):
>   tools/perf/tests: Fix shellcheck warnings for
>     trace+probe_vfs_getname.sh
>
> Athira Rajeev (11):
>   tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
>   tools/perf/tests: Fix unused variable references in
>     stat+csv_summary.sh testcase
>   tools/perf/tests: fix shellcheck warning for
>     test_perf_data_converter_json.sh testcase
>   tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
>     testcase
>   tools/perf/tests: Fix shellcheck issues in
>     tests/shell/stat+shadow_stat.sh tetscase
>   tools/perf/tests: Fix shellcheck warnings for
>     thread_loop_check_tid_10.sh
>   tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
>   tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
>   tools/perf/tests: Fix the shellcheck wanrings in lib/waiting.sh
>   tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>   tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>
> Kajol Jain (10):
>   tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
>     testcase
>   tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
>   tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
>   tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
>     testcase
>   tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
>     script
>   tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
>     shell script
>   tools/perf/tests: Fix shellcheck warning for coresight.sh shell script
>   tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>   tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>   tools/perf: Fix shellcheck issue for check-headers.sh script
>
>  .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>  tools/perf/check-headers.sh                   |  6 ++--
>  .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>  .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>  .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>  .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>  tools/perf/tests/shell/lib/coresight.sh       |  3 +-
>  tools/perf/tests/shell/lib/probe.sh           |  1 +
>  .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>  tools/perf/tests/shell/lib/waiting.sh         |  1 +
>  tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>  tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>  tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>  tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>  tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>  tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>  .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>  tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>  .../shell/test_perf_data_converter_json.sh    |  2 +-
>  .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>  tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>  tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>  22 files changed, 58 insertions(+), 61 deletions(-)
>
> --
> 2.39.1
>
