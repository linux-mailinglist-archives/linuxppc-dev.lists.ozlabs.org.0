Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86732759CB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:47:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DqvencPS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5jvm34SXz30KG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DqvencPS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5jtr5RJmz304b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:46:59 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4036bd4fff1so23881cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689788815; x=1692380815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYibOhQ/sb7T0GVqrGS+JLuttKSP7dbSD4obWi2tT7o=;
        b=DqvencPSSPr2JJyXLrEqYm/67F/ouEBYqSRKwLqwY8JZEiYWqnkruw7t/OvRhlKXNk
         M2Bd9c1yBVnqK5HXtFfco1qntVSoG1FtvLv0FmqdjWlX0gTCagYd/Ul79qHNNApcuIzX
         96nkDN5vWJV+fB29hYkGSq5bVv2jnEpEieKbC/u4zZWFtO51eZp3cQSjnKDv1t4t64Eu
         +pa7/lKiGXBTGfwqHGZY0JzKsZzON4gbyUHvFMzx71RjexrpjhJZm8EtJ2zerAd8oH48
         0XK4V7OUTUYwsD4Yo2v1Mc5zjH3LVUsk3MJPmzgytKGh5Hd2D+Xbo9e9TvzpND/70vDE
         g2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788815; x=1692380815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYibOhQ/sb7T0GVqrGS+JLuttKSP7dbSD4obWi2tT7o=;
        b=SUcBVAMAKkSdMeYXMwZPIz3mcLfoOwL1jsnSOwpQx/q2eeFhMGK27kKX9FAAmHohxG
         gWlMC3qvqwYEGgbut8V3HMw9Dqfyrq5DdfS1PcrDLcb7KiIEuwvEvXtgZSVfnrtn8LIl
         jo8c0w+u8u86O9mYcr+j7i3rDXr5917yIKzcSMJhEU5DnK4dqq+vAStIuZbKHY/rCgw2
         oYXKDK2GmgViEUUz4NDe2mp/jLjKFJ+CDjkz8h45NgoTk9mQPNlN0Hu+3VCqgwAkDvkN
         ccwqA7iq2M/k8ndm6PsxmJ8pDhTjs/5zPSnxW8fkJTRVWf0rQw1Yy1G0ag5DLeFkmkIr
         SZuw==
X-Gm-Message-State: ABy/qLYm6+LMY+djEJ0sdh754hL7hsoCxwIavDI0l5VbdBJtKBKZTEXV
	pgfIwS3kORGvzU2nNRfMH5cPkkAPLIadhEPLoSbFrw==
X-Google-Smtp-Source: APBJJlGoKIi4FBiyCYQOIQ+Vf+tb88VPR3HCoCjhXLwpWBaCgudXFTXJoz84j+yaSdbrPI22S1OaeJnRO0yzoEOZGJ8=
X-Received: by 2002:a05:622a:181f:b0:3ef:3361:75d5 with SMTP id
 t31-20020a05622a181f00b003ef336175d5mr3548qtc.11.1689788815460; Wed, 19 Jul
 2023 10:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com> <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
In-Reply-To: <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 19 Jul 2023 10:46:40 -0700
Message-ID: <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
To: kajoljain <kjain@linux.ibm.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 11:17=E2=80=AFPM kajoljain <kjain@linux.ibm.com> wr=
ote:
>
> Hi,
>
> Looking for review comments on this patchset.
>
> Thanks,
> Kajol Jain
>
>
> On 7/9/23 23:57, Athira Rajeev wrote:
> > Patchset covers a set of fixes for coding/formatting issues observed wh=
ile
> > running shellcheck tool on the perf shell scripts.
> >
> > This cleanup is a pre-requisite to include a build option for shellchec=
k
> > discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553=
.html
> > First set of patches were posted here:
> > https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE=
2B522C@linux.vnet.ibm.com/T/#t
> >
> > This patchset covers remaining set of shell scripts which needs
> > fix. Patch 1 is resubmission of patch 6 from the initial series.
> > Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
> > Other patches are fixes for scripts from tools/perf/tests.
> >
> > The shellcheck is run for severity level for errors and warnings.
> > Command used:
> >
> > # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellchec=
k -S warning $F; done
> > # echo $?
> > 0
> >

I don't see anything objectionable in the changes so for the series:
Acked-by: Ian Rogers <irogers@google.com>

Some thoughts:
 - Adding "#!/bin/bash" to scripts in tools/perf/tests/lib - I think
we didn't do this to avoid these being included as tests. There are
now extra checks when finding shell tests, so I can imagine doing this
isn't a regression but just a heads up.
 - I think James' comment was addressed:
https://lore.kernel.org/linux-perf-users/334989bf-5501-494c-f246-81878fd2fe=
d8@arm.com/
 - Why aren't these changes being mailed to LKML? The wider community
on LKML have thoughts on shell scripts, plus it makes the changes miss
my mail filters.
 - Can we automate this testing into the build? For example, following
a similar kernel build pattern we run a python test and make the log
output a requirement here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/pmu-events/Build?h=3Dperf-tools-next#n30
   I think we can translate:
for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellcheck
-S warning $F; done
   into a rule in make for log files that are then a dependency on the
perf binary. We can then parallel shellcheck during the build and
avoid regressions. We probably need a CONFIG_SHELLCHECK feature check
in the build to avoid not having shellcheck breaking the build.

Thanks,
Ian

> > Changelog:
> > v1 -> v2:
> >   - Rebased on top of perf-tools-next from:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=
=3Dperf-tools-next
> >
> >   - Fixed shellcheck errors and warnings reported for newly
> >     added changes from perf-tools-next branch
> >
> >   - Addressed review comment from James clark for patch
> >     number 13 from V1. The changes in patch 13 were not necessary
> >     since the file "tests/shell/lib/coresight.sh" is sourced from
> >     other test files.
> >
> > Akanksha J N (1):
> >   tools/perf/tests: Fix shellcheck warnings for
> >     trace+probe_vfs_getname.sh
> >
> > Athira Rajeev (14):
> >   tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
> >   tools/perf/tests: Fix unused variable references in
> >     stat+csv_summary.sh testcase
> >   tools/perf/tests: fix shellcheck warning for
> >     test_perf_data_converter_json.sh testcase
> >   tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
> >     testcase
> >   tools/perf/tests: Fix shellcheck issues in
> >     tests/shell/stat+shadow_stat.sh tetscase
> >   tools/perf/tests: Fix shellcheck warnings for
> >     thread_loop_check_tid_10.sh
> >   tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.s=
h
> >   tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.s=
h
> >   tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
> >   tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warning=
s
> >   tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
> >   tools/perf/tests/shell: Fix the shellcheck warnings in
> >     record+zstd_comp_decomp.sh
> >   tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
> >     testcase
> >   tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
> >     testcase
> >
> > Kajol Jain (11):
> >   tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
> >     testcase
> >   tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcas=
e
> >   tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcas=
e
> >   tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
> >     testcase
> >   tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
> >     script
> >   tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
> >     shell script
> >   tools/perf/tests: Fix shellcheck warning for probe.sh shell script
> >   tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
> >   tools/perf: Fix shellcheck issue for check-headers.sh script
> >   tools/shell/coresight: Fix shellcheck warning for
> >     thread_loop_check_tid_2.sh shell script
> >   tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
> >     shell script
> >
> >  .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
> >  tools/perf/check-headers.sh                   |  6 ++--
> >  .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
> >  .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
> >  .../coresight/thread_loop_check_tid_10.sh     |  2 +-
> >  .../coresight/thread_loop_check_tid_2.sh      |  2 +-
> >  .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
> >  tools/perf/tests/shell/lib/probe.sh           |  1 +
> >  .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
> >  tools/perf/tests/shell/lib/stat_output.sh     |  1 +
> >  tools/perf/tests/shell/lib/waiting.sh         |  1 +
> >  tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
> >  tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
> >  .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
> >  tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
> >  tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
> >  tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
> >  tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
> >  tools/perf/tests/shell/stat+std_output.sh     |  3 +-
> >  tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
> >  .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
> >  tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
> >  .../shell/test_perf_data_converter_json.sh    |  2 +-
> >  .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
> >  tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
> >  tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
> >  26 files changed, 67 insertions(+), 71 deletions(-)
> >
