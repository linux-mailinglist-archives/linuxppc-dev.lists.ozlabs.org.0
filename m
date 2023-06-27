Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550CA73F51D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:13:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e4Tllnzh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqwtV1ngbz3bcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 17:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e4Tllnzh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqwsY1spQz2xpj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 17:13:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R6lWGp015835;
	Tue, 27 Jun 2023 07:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qENkCljCDflHY6/epHP+L8qvaPUneqDYTxiCjsxEAA8=;
 b=e4Tllnzhh/O3oclWXQGJ14+cxcHjGgyQgI+5GKKYqUudGwNWRekOZy6jx9InHgJ+PPBU
 BcXtJlvlPTlT3+enunNhtMHR05jxad8gUCWuQEF4gXVweTNSPj+ofDqWDNAtcYPfrFS/
 yyeQ4fkLpcYyz5Hp+UNKWhxsFrJPyqUado/93ES8fXfYBUkwF1R+jXn114Sm6RMfT+Da
 meEipSb7Dv7uJ3aHk+cj8OZzmUCyx36wzj9tnsBwNyCVqH8BUyugpIhR8lG7T4WnzRC0
 D2adEoFmuexvxqGo6BVTDwHPxsAQzxx1/yBcH7dlWfTd7cscBe8tK63oGc3iNR7LgGHL JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rfttfrqjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 07:12:56 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35R6mKWe018162;
	Tue, 27 Jun 2023 07:12:55 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rfttfrqj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 07:12:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35R0xZZp007897;
	Tue, 27 Jun 2023 07:12:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rdr451ap9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 07:12:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35R7CoUC3932888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jun 2023 07:12:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F03B820040;
	Tue, 27 Jun 2023 07:12:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EB0920043;
	Tue, 27 Jun 2023 07:12:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.188])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 27 Jun 2023 07:12:47 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 00/22] tools/perf: Fix shellcheck coding/formatting issues
 of perf tool shell scripts
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7cj_7SBXtCuP66xra0R4ygNt851A6f20s6BtfyXCzZJrtQ@mail.gmail.com>
Date: Tue, 27 Jun 2023 12:42:34 +0530
Message-Id: <052F4C8C-4F35-44B3-BCE6-E155741A45F9@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cj_7SBXtCuP66xra0R4ygNt851A6f20s6BtfyXCzZJrtQ@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e_iv8czUoDpCR_Q9j3_bwksyMfkuO30k
X-Proofpoint-ORIG-GUID: 8Bj0-cKzX8djvm9ZuszNER4mbKDZGZBh
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_03,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306270066
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, john.g.garry@oracle.com, Kajol Jain <kjain@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24-Jun-2023, at 5:10 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> Hello,
>=20
> On Wed, Jun 21, 2023 at 1:30=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Patchset covers a set of fixes for coding/formatting issues observed whi=
le
>> running shellcheck tool on the perf shell scripts.
>>=20
>> This cleanup is a pre-requisite to include a build option for shellcheck
>> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.=
html
>> First set of patches were posted here:
>> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2=
B522C@linux.vnet.ibm.com/T/#t
>>=20
>> This patchset covers remaining set of shell scripts which needs
>> fix. Patch 1 is resubmission of patch 6 from the initial series.
>> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
>> Other patches are fixes for scripts from tools/perf/tests.
>=20
> Thanks for this work.  But it seems there are some issues
> even after applying this series.
>=20
>  $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do
>> shellcheck $F; done | grep -c -e '(info)' -e '(warning)'
>  29
>=20
>  $ for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do
>> shellcheck $F; done | grep ^In
>  In tests/shell/pipe_test.sh line 10:
>  In tests/shell/pipe_test.sh line 15:
>  In tests/shell/pipe_test.sh line 20:
>  In tests/shell/pipe_test.sh line 21:
>  In tests/shell/pipe_test.sh line 26:
>  In tests/shell/pipe_test.sh line 27:
>  In tests/shell/pipe_test.sh line 33:
>  In tests/shell/record+zstd_comp_decomp.sh line 16:
>  In tests/shell/record+zstd_comp_decomp.sh line 22:
>  In tests/shell/record+zstd_comp_decomp.sh line 27:
>  In tests/shell/record+zstd_comp_decomp.sh line 28:
>  In tests/shell/record+zstd_comp_decomp.sh line 29:
>  In tests/shell/record+zstd_comp_decomp.sh line 30:
>  In tests/shell/record+zstd_comp_decomp.sh line 36:
>  In tests/shell/coresight/thread_loop_check_tid_2.sh line 8:
>  In tests/shell/coresight/thread_loop_check_tid_2.sh line 11:
>  In tests/shell/coresight/thread_loop_check_tid_2.sh line 14:
>=20
> Also unfortunately there's some update in the shell tests.
> Please rebase onto the perf-tools-next.

Hi Namhyung

Thanks for checking. Will send an updated version on top of perf-tools-next

Thanks
Athira
>=20
> Thanks,
> Namhyung
>=20
>=20
>>=20
>> Akanksha J N (1):
>>  tools/perf/tests: Fix shellcheck warnings for
>>    trace+probe_vfs_getname.sh
>>=20
>> Athira Rajeev (11):
>>  tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
>>  tools/perf/tests: Fix unused variable references in
>>    stat+csv_summary.sh testcase
>>  tools/perf/tests: fix shellcheck warning for
>>    test_perf_data_converter_json.sh testcase
>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
>>    testcase
>>  tools/perf/tests: Fix shellcheck issues in
>>    tests/shell/stat+shadow_stat.sh tetscase
>>  tools/perf/tests: Fix shellcheck warnings for
>>    thread_loop_check_tid_10.sh
>>  tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
>>  tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
>>  tools/perf/tests: Fix the shellcheck wanrings in lib/waiting.sh
>>  tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>>  tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>>=20
>> Kajol Jain (10):
>>  tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
>>    testcase
>>  tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
>>  tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
>>  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
>>    testcase
>>  tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
>>    script
>>  tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
>>    shell script
>>  tools/perf/tests: Fix shellcheck warning for coresight.sh shell script
>>  tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>>  tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>>  tools/perf: Fix shellcheck issue for check-headers.sh script
>>=20
>> .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>> tools/perf/check-headers.sh                   |  6 ++--
>> .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>> .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>> .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>> .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>> tools/perf/tests/shell/lib/coresight.sh       |  3 +-
>> tools/perf/tests/shell/lib/probe.sh           |  1 +
>> .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>> tools/perf/tests/shell/lib/waiting.sh         |  1 +
>> tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>> tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>> tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>> tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>> tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>> tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>> .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>> tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>> .../shell/test_perf_data_converter_json.sh    |  2 +-
>> .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>> tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>> tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>> 22 files changed, 58 insertions(+), 61 deletions(-)
>>=20
>> --
>> 2.39.1


