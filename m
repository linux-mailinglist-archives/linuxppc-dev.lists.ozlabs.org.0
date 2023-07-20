Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBF75A564
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:13:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTxi5qtv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R616y6Lv9z3c3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 15:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTxi5qtv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R61626p61z2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 15:12:42 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K58OcN004491;
	Thu, 20 Jul 2023 05:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=elPyhpH7mkUZN1pn+7b5abzFqrEEiJxLXwHx/SG699s=;
 b=lTxi5qtvB+oyVYikkfruWbKTxBGzE+EvB+x+hlC7Piq4LzA8h0rjqAcM+DpYEvFv4dko
 0MagTcR9coR7XOSUMKB+Di37BID8MVNcQrYn6ZwWa3CrdpZ0FtKf0SnpolzBHbJ1BsUI
 veSRU4zzFodKDIkhF5vvDtxCMkSLoFDQI0lKrj0BPZcfkuOk1m3qiVNXAqY2MGkSJ4RW
 TOz4eZJ3M0SqsG8d2/JEUoHFe1s0a52R89RtnT85bsoirJZf8EFSFyO404mghx+twEGJ
 pcHOBd/6szFzHQYCUmqmKWk9cDFrJjYQXlQlvo08LGO2Ye5hNI+ixszKIga+45HU8C2Z /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxvwt1nes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:12:33 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36K58XGh005661;
	Thu, 20 Jul 2023 05:12:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxvwt1nef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:12:33 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36K3nkNJ004510;
	Thu, 20 Jul 2023 05:12:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv80jar7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:12:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36K5CT7l21037576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jul 2023 05:12:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99FC62004B;
	Thu, 20 Jul 2023 05:12:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABD0E20040;
	Thu, 20 Jul 2023 05:12:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.35.28])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Jul 2023 05:12:27 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
Date: Thu, 20 Jul 2023 10:42:15 +0530
Message-Id: <D52339A7-30C6-4066-AE05-4BF8E9DCCFF4@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
 <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
 <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s6L7S4FcqhOZeb8u54IbYUgWV3tvmvPv
X-Proofpoint-GUID: UvavT3O4cg5JpyzfBU3N7dwg_AuxVOa5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200040
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Jul-2023, at 11:16 PM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Tue, Jul 18, 2023 at 11:17=E2=80=AFPM kajoljain <kjain@linux.ibm.com> =
wrote:
>>=20
>> Hi,
>>=20
>> Looking for review comments on this patchset.
>>=20
>> Thanks,
>> Kajol Jain
>>=20
>>=20
>> On 7/9/23 23:57, Athira Rajeev wrote:
>>> Patchset covers a set of fixes for coding/formatting issues observed wh=
ile
>>> running shellcheck tool on the perf shell scripts.
>>>=20
>>> This cleanup is a pre-requisite to include a build option for shellcheck
>>> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553=
.html
>>> First set of patches were posted here:
>>> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE=
2B522C@linux.vnet.ibm.com/T/#t
>>>=20
>>> This patchset covers remaining set of shell scripts which needs
>>> fix. Patch 1 is resubmission of patch 6 from the initial series.
>>> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
>>> Other patches are fixes for scripts from tools/perf/tests.
>>>=20
>>> The shellcheck is run for severity level for errors and warnings.
>>> Command used:
>>>=20
>>> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellchec=
k -S warning $F; done
>>> # echo $?
>>> 0
>>>=20
>=20
> I don't see anything objectionable in the changes so for the series:
> Acked-by: Ian Rogers <irogers@google.com>
>=20
> Some thoughts:
> - Adding "#!/bin/bash" to scripts in tools/perf/tests/lib - I think
> we didn't do this to avoid these being included as tests. There are
> now extra checks when finding shell tests, so I can imagine doing this
> isn't a regression but just a heads up.
> - I think James' comment was addressed:
> https://lore.kernel.org/linux-perf-users/334989bf-5501-494c-f246-81878fd2=
fed8@arm.com/
> - Why aren't these changes being mailed to LKML? The wider community
> on LKML have thoughts on shell scripts, plus it makes the changes miss
> my mail filters.
> - Can we automate this testing into the build? For example, following
> a similar kernel build pattern we run a python test and make the log
> output a requirement here:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/pmu-events/Build?h=3Dperf-tools-next#n30
>   I think we can translate:
> for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellcheck
> -S warning $F; done
>   into a rule in make for log files that are then a dependency on the
> perf binary. We can then parallel shellcheck during the build and
> avoid regressions. We probably need a CONFIG_SHELLCHECK feature check
> in the build to avoid not having shellcheck breaking the build.

Hi Ian

Thanks for the comments.
Yes, next step after this is to include build option for shellcheck by upda=
ting Makefile.
We will surely get into that build option enablement patch once we have all=
 these corrections in place.

Thanks
Athira
>=20
> Thanks,
> Ian
>=20
>>> Changelog:
>>> v1 -> v2:
>>>  - Rebased on top of perf-tools-next from:
>>>  https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=
=3Dperf-tools-next
>>>=20
>>>  - Fixed shellcheck errors and warnings reported for newly
>>>    added changes from perf-tools-next branch
>>>=20
>>>  - Addressed review comment from James clark for patch
>>>    number 13 from V1. The changes in patch 13 were not necessary
>>>    since the file "tests/shell/lib/coresight.sh" is sourced from
>>>    other test files.
>>>=20
>>> Akanksha J N (1):
>>>  tools/perf/tests: Fix shellcheck warnings for
>>>    trace+probe_vfs_getname.sh
>>>=20
>>> Athira Rajeev (14):
>>>  tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
>>>  tools/perf/tests: Fix unused variable references in
>>>    stat+csv_summary.sh testcase
>>>  tools/perf/tests: fix shellcheck warning for
>>>    test_perf_data_converter_json.sh testcase
>>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
>>>    testcase
>>>  tools/perf/tests: Fix shellcheck issues in
>>>    tests/shell/stat+shadow_stat.sh tetscase
>>>  tools/perf/tests: Fix shellcheck warnings for
>>>    thread_loop_check_tid_10.sh
>>>  tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
>>>  tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
>>>  tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
>>>  tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>>>  tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>>>  tools/perf/tests/shell: Fix the shellcheck warnings in
>>>    record+zstd_comp_decomp.sh
>>>  tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
>>>    testcase
>>>  tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
>>>    testcase
>>>=20
>>> Kajol Jain (11):
>>>  tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
>>>    testcase
>>>  tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
>>>  tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
>>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
>>>    testcase
>>>  tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
>>>    script
>>>  tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
>>>    shell script
>>>  tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>>>  tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>>>  tools/perf: Fix shellcheck issue for check-headers.sh script
>>>  tools/shell/coresight: Fix shellcheck warning for
>>>    thread_loop_check_tid_2.sh shell script
>>>  tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
>>>    shell script
>>>=20
>>> .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>>> tools/perf/check-headers.sh                   |  6 ++--
>>> .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>>> .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>>> .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>>> .../coresight/thread_loop_check_tid_2.sh      |  2 +-
>>> .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>>> tools/perf/tests/shell/lib/probe.sh           |  1 +
>>> .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>>> tools/perf/tests/shell/lib/stat_output.sh     |  1 +
>>> tools/perf/tests/shell/lib/waiting.sh         |  1 +
>>> tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>>> tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>>> .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
>>> tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>>> tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
>>> tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>>> tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>>> tools/perf/tests/shell/stat+std_output.sh     |  3 +-
>>> tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>>> .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>>> tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>>> .../shell/test_perf_data_converter_json.sh    |  2 +-
>>> .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>>> tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>>> tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>>> 26 files changed, 67 insertions(+), 71 deletions(-)


