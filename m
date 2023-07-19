Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D7758DB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:23:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EQSLbTmI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Qjx5v2Tz3cfR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:23:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EQSLbTmI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Qb20JHMz3cQK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 16:17:17 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J68ImV028431;
	Wed, 19 Jul 2023 06:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9L9oMBpmGFFeIYhxMPZL/jZawONiDUb0YmBOMQ4z7UE=;
 b=EQSLbTmIWP78aVPU/PEUqIVKA5VZzmh2msiYuXB/rYXojB90aWJzihxpPzJw+FzHkJ23
 3hRt6RihwMPkCtGrTtdvHOOEIK6YlyVCtgkYBzqcw+Fu9TEOdHQeIFWc0rR9CXXdmzsW
 hRtP8Kr6xCzunK2+aNvCt8qDC6lFjL+e8wwXWrEoAm93yQ4G0F+8IY1/WkuC7sUhR5M6
 Nb50qrGlmRujjBpAFlpbAlj1HmS0HWshgcqlNm89dLMAh/U0aO9ftLe6byYK+HS4drtB
 k70ovWHt7BmGIunoYpLqCLka6FL16ZKVn790NRMR7mpC//Yr6igB/Vnv5ylLryAXxrxp fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rx6ynks1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:17:12 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36J68PQH029015;
	Wed, 19 Jul 2023 06:17:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rx6ynks1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:17:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36J5aVY2004455;
	Wed, 19 Jul 2023 06:17:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g110ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:17:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36J6H9uU20709888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jul 2023 06:17:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4529420043;
	Wed, 19 Jul 2023 06:17:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB99E2004D;
	Wed, 19 Jul 2023 06:17:03 +0000 (GMT)
Received: from [9.43.119.126] (unknown [9.43.119.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Jul 2023 06:17:03 +0000 (GMT)
Message-ID: <1fbdbb26-4fce-ea25-a96a-99982b3f1603@linux.ibm.com>
Date: Wed, 19 Jul 2023 11:47:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting
 issues of perf tool shell scripts
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8BvKljGvN83JOw693shD1Jk71BPB3s3b
X-Proofpoint-ORIG-GUID: 8x-C4BeZR454gUZtsJ5M6BFzs_wzGBzP
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_02,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307190056
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Looking for review comments on this patchset.

Thanks,
Kajol Jain


On 7/9/23 23:57, Athira Rajeev wrote:
> Patchset covers a set of fixes for coding/formatting issues observed while
> running shellcheck tool on the perf shell scripts.
> 
> This cleanup is a pre-requisite to include a build option for shellcheck
> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
> First set of patches were posted here:
> https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2B522C@linux.vnet.ibm.com/T/#t
> 
> This patchset covers remaining set of shell scripts which needs
> fix. Patch 1 is resubmission of patch 6 from the initial series.
> Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
> Other patches are fixes for scripts from tools/perf/tests.
> 
> The shellcheck is run for severity level for errors and warnings.
> Command used:
> 
> # for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> # echo $?
> 0
> 
> Changelog:
> v1 -> v2:
>   - Rebased on top of perf-tools-next from:
>   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf-tools-next
> 
>   - Fixed shellcheck errors and warnings reported for newly
>     added changes from perf-tools-next branch
> 
>   - Addressed review comment from James clark for patch 
>     number 13 from V1. The changes in patch 13 were not necessary
>     since the file "tests/shell/lib/coresight.sh" is sourced from
>     other test files.
> 
> Akanksha J N (1):
>   tools/perf/tests: Fix shellcheck warnings for
>     trace+probe_vfs_getname.sh
> 
> Athira Rajeev (14):
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
>   tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
>   tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
>   tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
>   tools/perf/tests/shell: Fix the shellcheck warnings in
>     record+zstd_comp_decomp.sh
>   tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
>     testcase
>   tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
>     testcase
> 
> Kajol Jain (11):
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
>   tools/perf/tests: Fix shellcheck warning for probe.sh shell script
>   tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
>   tools/perf: Fix shellcheck issue for check-headers.sh script
>   tools/shell/coresight: Fix shellcheck warning for
>     thread_loop_check_tid_2.sh shell script
>   tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
>     shell script
> 
>  .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
>  tools/perf/check-headers.sh                   |  6 ++--
>  .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
>  .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
>  .../coresight/thread_loop_check_tid_10.sh     |  2 +-
>  .../coresight/thread_loop_check_tid_2.sh      |  2 +-
>  .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
>  tools/perf/tests/shell/lib/probe.sh           |  1 +
>  .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
>  tools/perf/tests/shell/lib/stat_output.sh     |  1 +
>  tools/perf/tests/shell/lib/waiting.sh         |  1 +
>  tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
>  tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
>  .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
>  tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
>  tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
>  tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
>  tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
>  tools/perf/tests/shell/stat+std_output.sh     |  3 +-
>  tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
>  .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
>  tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
>  .../shell/test_perf_data_converter_json.sh    |  2 +-
>  .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
>  tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
>  tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
>  26 files changed, 67 insertions(+), 71 deletions(-)
> 
