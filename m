Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC87609C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 07:51:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GZU72zMA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R95ky6lHmz3c5R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GZU72zMA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R95k11SWNz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 15:51:04 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P5YSPJ030406;
	Tue, 25 Jul 2023 05:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9VhP5synuBkn8l9QHwHLwIIsVPg8oD9RbvsgOyx6Obc=;
 b=GZU72zMAURmHXRpAFHDevjYGd8fHAuj3PzA3KcMGtluG1h35bAevH7YWqZh4b30y+fEB
 xUrV/dGM4EFBIPwxTswykn27IJg6NyNEUAuLxH/xcVAFJRTCrtfqqUe+uXu5Wn6BwCHQ
 2G5nWX+y0vLZP6OnXNYnupct977Orter0EqQqWru615CLvvjCqvdWoKwN1Y5ZgAxpiQS
 zI2MMi8RJ4OgdB4OtyYnJIwh5jp4OfdpgpnVka5S7SoGMCVMOpw9Iv+YyfnaHtwiBpH4
 nQd3jfkfUqsiHSUfLv7U25Ze8NoT8gqtmASGNKmVh6maN+q1OU8o3BRcs34gvM19JNkB vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s20jt9mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 05:50:58 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36P5ZlBq003313;
	Tue, 25 Jul 2023 05:50:58 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s20jt9mjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 05:50:58 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P55Et2016574;
	Tue, 25 Jul 2023 05:50:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v510vwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 05:50:57 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P5oqE514352916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jul 2023 05:50:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 341732004D;
	Tue, 25 Jul 2023 05:50:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 164EA20040;
	Tue, 25 Jul 2023 05:50:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.73.40])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jul 2023 05:50:49 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1f1e9978-a176-0ae9-6dac-8cc275c5f905@linux.ibm.com>
Date: Tue, 25 Jul 2023 11:20:37 +0530
Message-Id: <89C3584E-97E6-4FCF-ABFA-C94AD3F65BC4@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
 <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
 <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
 <D52339A7-30C6-4066-AE05-4BF8E9DCCFF4@linux.vnet.ibm.com>
 <1f1e9978-a176-0ae9-6dac-8cc275c5f905@linux.ibm.com>
To: kajoljain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vuVA6CNK4pkpjoiEaaQpl9ffVamy-T4Q
X-Proofpoint-GUID: 7JBDLpYQgz5z8cmVWI0IYKPiiGuWQhJW
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_02,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307250050
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 20-Jul-2023, at 10:48 AM, kajoljain <kjain@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 7/20/23 10:42, Athira Rajeev wrote:
>>=20
>>=20
>>> On 19-Jul-2023, at 11:16 PM, Ian Rogers <irogers@google.com> wrote:
>>>=20
>>> On Tue, Jul 18, 2023 at 11:17=E2=80=AFPM kajoljain <kjain@linux.ibm.com=
> wrote:
>>>>=20
>>>> Hi,
>>>>=20
>>>> Looking for review comments on this patchset.
>>>>=20
>>>> Thanks,
>>>> Kajol Jain
>>>>=20
>>>>=20
>>>> On 7/9/23 23:57, Athira Rajeev wrote:
>>>>> Patchset covers a set of fixes for coding/formatting issues observed =
while
>>>>> running shellcheck tool on the perf shell scripts.
>>>>>=20
>>>>> This cleanup is a pre-requisite to include a build option for shellch=
eck
>>>>> discussed here: https://www.spinics.net/lists/linux-perf-users/msg255=
53.html
>>>>> First set of patches were posted here:
>>>>> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205=
EE2B522C@linux.vnet.ibm.com/T/#t
>>>>>=20
>>>>> This patchset covers remaining set of shell scripts which needs
>>>>> fix. Patch 1 is resubmission of patch 6 from the initial series.
>>>>> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
>>>>> Other patches are fixes for scripts from tools/perf/tests.
>>>>>=20
>>>>> The shellcheck is run for severity level for errors and warnings.
>>>>> Command used:
>>>>>=20
>>>>> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellch=
eck -S warning $F; done
>>>>> # echo $?
>>>>> 0
>>>>>=20
>>>=20
>>> I don't see anything objectionable in the changes so for the series:
>>> Acked-by: Ian Rogers <irogers@google.com>
>>>=20
>>> Some thoughts:
>>> - Adding "#!/bin/bash" to scripts in tools/perf/tests/lib - I think
>>> we didn't do this to avoid these being included as tests. There are
>>> now extra checks when finding shell tests, so I can imagine doing this
>>> isn't a regression but just a heads up.
>>> - I think James' comment was addressed:
>>> https://lore.kernel.org/linux-perf-users/334989bf-5501-494c-f246-81878f=
d2fed8@arm.com/
>>> - Why aren't these changes being mailed to LKML? The wider community
>>> on LKML have thoughts on shell scripts, plus it makes the changes miss
>>> my mail filters.
>>> - Can we automate this testing into the build? For example, following
>>> a similar kernel build pattern we run a python test and make the log
>>> output a requirement here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/Build?h=3Dperf-tools-next#n30
>>>  I think we can translate:
>>> for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellcheck
>>> -S warning $F; done
>>>  into a rule in make for log files that are then a dependency on the
>>> perf binary. We can then parallel shellcheck during the build and
>>> avoid regressions. We probably need a CONFIG_SHELLCHECK feature check
>>> in the build to avoid not having shellcheck breaking the build.
>>=20
>> Hi Ian
>>=20
>> Thanks for the comments.
>> Yes, next step after this is to include build option for shellcheck by u=
pdating Makefile.
>> We will surely get into that build option enablement patch once we have =
all these corrections in place.
>>=20
>> Thanks
>> Athira
>>>=20
>=20
> Hi Ian,
>   Thanks for reviewing the patches. As athira mentioned our next is to
> include build option. So, we will work on it next once all the
> correction done.
>=20
> Thanks,
> Kajol Jain

Hi Arnaldo,  Namhyung

Can you have this patchset applied along with Acked-by from Ian ?
Our next step is to add a build option for shellcheck by updating Makefile =
and will be working on that.

Thanks
Athira=20
>=20
>>> Thanks,
>>> Ian
>>>=20
>>>>> Changelog:
>>>>> v1 -> v2:
>>>>> - Rebased on top of perf-tools-next from:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=
=3Dperf-tools-next
>>>>>=20
>>>>> - Fixed shellcheck errors and warnings reported for newly
>>>>>   added changes from perf-tools-next branch
>>>>>=20
>>>>> - Addressed review comment from James clark for patch
>>>>>   number 13 from V1. The changes in patch 13 were not necessary
>>>>>   since the file "tests/shell/lib/coresight.sh" is sourced from
>>>>>   other test files.
>>>>>=20
>>>>> Akanksha J N (1):
>>>>> tools/perf/tests: Fix shellcheck warnings for
>>>>>   trace+probe_vfs_getname.sh
>>>>>=20
>>>>> Athira Rajeev (14):
>>>>> tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
>>>>> tools/perf/tests: Fix unused variable references in
>>>>>   stat+csv_summary.sh testcase
>>>>> tools/perf/tests: fix shellcheck warning for
>>>>>   test_perf_data_converter_json.sh testcase
>>>>> tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
>>>>>   testcase
>>>>> tools/perf/tests: Fix shellcheck issues in
>>>>>   tests/shell/stat+shadow_stat.sh tetscase
>>>>> tools/perf/tests: Fix shellcheck warnings for
>>>>>   thread_loop_check_tid_10.sh
>>>>> tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
>>>>> tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
>>>>> tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
>>>>> tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>>>>> tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>>>>> tools/perf/tests/shell: Fix the shellcheck warnings in
>>>>>   record+zstd_comp_decomp.sh
>>>>> tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
>>>>>   testcase
>>>>> tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
>>>>>   testcase
>>>>>=20
>>>>> Kajol Jain (11):
>>>>> tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
>>>>>   testcase
>>>>> tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
>>>>> tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
>>>>> tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
>>>>>   testcase
>>>>> tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
>>>>>   script
>>>>> tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
>>>>>   shell script
>>>>> tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>>>>> tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>>>>> tools/perf: Fix shellcheck issue for check-headers.sh script
>>>>> tools/shell/coresight: Fix shellcheck warning for
>>>>>   thread_loop_check_tid_2.sh shell script
>>>>> tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
>>>>>   shell script
>>>>>=20
>>>>> .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>>>>> tools/perf/check-headers.sh                   |  6 ++--
>>>>> .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>>>>> .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>>>>> .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>>>>> .../coresight/thread_loop_check_tid_2.sh      |  2 +-
>>>>> .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>>>>> tools/perf/tests/shell/lib/probe.sh           |  1 +
>>>>> .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>>>>> tools/perf/tests/shell/lib/stat_output.sh     |  1 +
>>>>> tools/perf/tests/shell/lib/waiting.sh         |  1 +
>>>>> tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>>>>> tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>>>>> .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
>>>>> tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>>>>> tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
>>>>> tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>>>>> tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>>>>> tools/perf/tests/shell/stat+std_output.sh     |  3 +-
>>>>> tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>>>>> .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>>>>> tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>>>>> .../shell/test_perf_data_converter_json.sh    |  2 +-
>>>>> .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>>>>> tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>>>>> tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>>>>> 26 files changed, 67 insertions(+), 71 deletions(-)


