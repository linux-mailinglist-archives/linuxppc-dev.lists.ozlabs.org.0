Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106C75A567
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:19:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rM8mCELj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R61Fh6gRQz3bpd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 15:19:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rM8mCELj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R61Dp6FQLz2ys8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 15:18:34 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K5Hgra001609;
	Thu, 20 Jul 2023 05:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=A8cEG6kLOnv5rWBiLcpCVc8k7Mt90vNyIdR6pFq+6Js=;
 b=rM8mCELjCVFx+hj+ZDhtYuE/j0orWF6XnIfHgiD3uR4cf9VP2ZkJtJij1fXCxfmL4s6g
 5k5t1hl4ocNIc8qphgc688L84eSaQfavcAOk+zoEIv9JIbNHp19ZzCmsbn8z3oRQLZp8
 HsXp1vSQjOO9o86csORp6u/RmmvKh5TxEYFvfr/jAeyEwkSfosoejst0z2LHE6MJZ/OP
 PQ/KwnHa2ACIFSDe4PcBjy/ky1mrmeLLtFuhAYPzTLWTLAAs7ojXo0EqL26l4/3iNQ0j
 If0M3bMg+gEMJdQcTfDvLABrrqV7PJsDkl38DBkI7yxJQaJeWWTw1VCLpaiVRv+YvmGa 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxqs3fm1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:18:26 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36K58Flo002840;
	Thu, 20 Jul 2023 05:18:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxqs3fm18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:18:26 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36K28W6L004156;
	Thu, 20 Jul 2023 05:18:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g15tc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 05:18:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36K5INde16056842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jul 2023 05:18:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A1CF20043;
	Thu, 20 Jul 2023 05:18:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CA9A20040;
	Thu, 20 Jul 2023 05:18:18 +0000 (GMT)
Received: from [9.43.37.180] (unknown [9.43.37.180])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Jul 2023 05:18:17 +0000 (GMT)
Message-ID: <1f1e9978-a176-0ae9-6dac-8cc275c5f905@linux.ibm.com>
Date: Thu, 20 Jul 2023 10:48:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Ian Rogers <irogers@google.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
 <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
 <CAP-5=fWZy-y9kiuAFQsaNeRYn8PJofFR5DHj5qA53FhB3+UrfQ@mail.gmail.com>
 <D52339A7-30C6-4066-AE05-4BF8E9DCCFF4@linux.vnet.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <D52339A7-30C6-4066-AE05-4BF8E9DCCFF4@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rqWRj2maVAwOjoI4RAL3yKZhxxdzQ0hi
X-Proofpoint-ORIG-GUID: jPCEwdzqVGN6KGer8467dJgGvt7PmNDX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/20/23 10:42, Athira Rajeev wrote:
> 
> 
>> On 19-Jul-2023, at 11:16 PM, Ian Rogers <irogers@google.com> wrote:
>>
>> On Tue, Jul 18, 2023 at 11:17 PM kajoljain <kjain@linux.ibm.com> wrote:
>>>
>>> Hi,
>>>
>>> Looking for review comments on this patchset.
>>>
>>> Thanks,
>>> Kajol Jain
>>>
>>>
>>> On 7/9/23 23:57, Athira Rajeev wrote:
>>>> Patchset covers a set of fixes for coding/formatting issues observed while
>>>> running shellcheck tool on the perf shell scripts.
>>>>
>>>> This cleanup is a pre-requisite to include a build option for shellcheck
>>>> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
>>>> First set of patches were posted here:
>>>> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2B522C@linux.vnet.ibm.com/T/#t
>>>>
>>>> This patchset covers remaining set of shell scripts which needs
>>>> fix. Patch 1 is resubmission of patch 6 from the initial series.
>>>> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
>>>> Other patches are fixes for scripts from tools/perf/tests.
>>>>
>>>> The shellcheck is run for severity level for errors and warnings.
>>>> Command used:
>>>>
>>>> # for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
>>>> # echo $?
>>>> 0
>>>>
>>
>> I don't see anything objectionable in the changes so for the series:
>> Acked-by: Ian Rogers <irogers@google.com>
>>
>> Some thoughts:
>> - Adding "#!/bin/bash" to scripts in tools/perf/tests/lib - I think
>> we didn't do this to avoid these being included as tests. There are
>> now extra checks when finding shell tests, so I can imagine doing this
>> isn't a regression but just a heads up.
>> - I think James' comment was addressed:
>> https://lore.kernel.org/linux-perf-users/334989bf-5501-494c-f246-81878fd2fed8@arm.com/
>> - Why aren't these changes being mailed to LKML? The wider community
>> on LKML have thoughts on shell scripts, plus it makes the changes miss
>> my mail filters.
>> - Can we automate this testing into the build? For example, following
>> a similar kernel build pattern we run a python test and make the log
>> output a requirement here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/pmu-events/Build?h=perf-tools-next#n30
>>   I think we can translate:
>> for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck
>> -S warning $F; done
>>   into a rule in make for log files that are then a dependency on the
>> perf binary. We can then parallel shellcheck during the build and
>> avoid regressions. We probably need a CONFIG_SHELLCHECK feature check
>> in the build to avoid not having shellcheck breaking the build.
> 
> Hi Ian
> 
> Thanks for the comments.
> Yes, next step after this is to include build option for shellcheck by updating Makefile.
> We will surely get into that build option enablement patch once we have all these corrections in place.
> 
> Thanks
> Athira
>>

Hi Ian,
   Thanks for reviewing the patches. As athira mentioned our next is to
include build option. So, we will work on it next once all the
correction done.

Thanks,
Kajol Jain

>> Thanks,
>> Ian
>>
>>>> Changelog:
>>>> v1 -> v2:
>>>>  - Rebased on top of perf-tools-next from:
>>>>  https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf-tools-next
>>>>
>>>>  - Fixed shellcheck errors and warnings reported for newly
>>>>    added changes from perf-tools-next branch
>>>>
>>>>  - Addressed review comment from James clark for patch
>>>>    number 13 from V1. The changes in patch 13 were not necessary
>>>>    since the file "tests/shell/lib/coresight.sh" is sourced from
>>>>    other test files.
>>>>
>>>> Akanksha J N (1):
>>>>  tools/perf/tests: Fix shellcheck warnings for
>>>>    trace+probe_vfs_getname.sh
>>>>
>>>> Athira Rajeev (14):
>>>>  tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
>>>>  tools/perf/tests: Fix unused variable references in
>>>>    stat+csv_summary.sh testcase
>>>>  tools/perf/tests: fix shellcheck warning for
>>>>    test_perf_data_converter_json.sh testcase
>>>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
>>>>    testcase
>>>>  tools/perf/tests: Fix shellcheck issues in
>>>>    tests/shell/stat+shadow_stat.sh tetscase
>>>>  tools/perf/tests: Fix shellcheck warnings for
>>>>    thread_loop_check_tid_10.sh
>>>>  tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
>>>>  tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
>>>>  tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
>>>>  tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>>>>  tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>>>>  tools/perf/tests/shell: Fix the shellcheck warnings in
>>>>    record+zstd_comp_decomp.sh
>>>>  tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
>>>>    testcase
>>>>  tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
>>>>    testcase
>>>>
>>>> Kajol Jain (11):
>>>>  tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
>>>>    testcase
>>>>  tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
>>>>  tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
>>>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
>>>>    testcase
>>>>  tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
>>>>    script
>>>>  tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
>>>>    shell script
>>>>  tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>>>>  tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>>>>  tools/perf: Fix shellcheck issue for check-headers.sh script
>>>>  tools/shell/coresight: Fix shellcheck warning for
>>>>    thread_loop_check_tid_2.sh shell script
>>>>  tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
>>>>    shell script
>>>>
>>>> .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>>>> tools/perf/check-headers.sh                   |  6 ++--
>>>> .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>>>> .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>>>> .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>>>> .../coresight/thread_loop_check_tid_2.sh      |  2 +-
>>>> .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>>>> tools/perf/tests/shell/lib/probe.sh           |  1 +
>>>> .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>>>> tools/perf/tests/shell/lib/stat_output.sh     |  1 +
>>>> tools/perf/tests/shell/lib/waiting.sh         |  1 +
>>>> tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>>>> tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>>>> .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
>>>> tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>>>> tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
>>>> tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>>>> tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>>>> tools/perf/tests/shell/stat+std_output.sh     |  3 +-
>>>> tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>>>> .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>>>> tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>>>> .../shell/test_perf_data_converter_json.sh    |  2 +-
>>>> .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>>>> tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>>>> tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>>>> 26 files changed, 67 insertions(+), 71 deletions(-)
> 
> 
