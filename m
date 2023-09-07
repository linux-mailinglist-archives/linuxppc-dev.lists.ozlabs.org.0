Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8F7979A4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:17:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJpPVCAi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQst1YMtz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJpPVCAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQr16Xrwz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:16:01 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387HCc5m002948;
	Thu, 7 Sep 2023 17:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2xQqo4hgVVpQZh3HRgwmJEyOhJ/pAlMfScYT3iKUK5c=;
 b=JJpPVCAiD7w2o4jvtXaGjIhyhc2B7k+y0ZSQVD05DNBZxM0EIwSrQWJsyeAQcECsKnpg
 LGfsohcrSPzmD4yBgMLo8WEKCLqATG/s01BwPVpeSN37ZEi0Tq9/JYIHy3ww/MlC/LRE
 Lot/azpCGqa4Nlw/2ISEohVPCCd/5FpYwtluzr05CD3GUOXwRbp4tGI1ENJHPjVHThSK
 YWXzDMWRjslJ/UDgKby6uHRFMffavk+uodxZqeag1qmhR10PMQKPrW3ElzRXUvVW1VrG
 QoOqDCLKrjutiitY5u2usmCqxTQQi5sRhRfNNE2o8EUQvr9+kw6TwInH37KbZXx74C71 lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syjqbg349-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:52 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387HDRXs006095;
	Thu, 7 Sep 2023 17:15:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syjqbg342-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:52 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387FRUZX021353;
	Thu, 7 Sep 2023 17:15:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfrywkrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 17:15:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387HFmiM59965738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 17:15:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538BB20043;
	Thu,  7 Sep 2023 17:15:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F380F20040;
	Thu,  7 Sep 2023 17:15:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 17:15:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/3] tests/shell: Fix shellcheck SC1090 to handle the location of sourced files
Date: Thu,  7 Sep 2023 22:45:38 +0530
Message-Id: <20230907171540.36736-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2B2FdeyBD_Csh7ebjEqCUfvIjnog-7v6
X-Proofpoint-ORIG-GUID: _rJjNCjbJruFdUepCTcOgqrzKJnpxmiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070152
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running shellcheck on some of the shell scripts throws
below error:

	In tests/shell/coresight/unroll_loop_thread_10.sh line 8:
	. "$(dirname $0)"/../lib/coresight.sh
	  ^-- SC1090: Can't follow non-constant source. Use a directive to specify location.

This happens on shellcheck version "0.6.0". Fix shellcheck
warning for SC1090 using "shellcheck source="i option to mention
the location of sourced files.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 3 +++
 tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 3 +++
 tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 3 +++
 tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 3 +++
 tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 3 +++
 tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
 tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
 tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
 tools/perf/tests/shell/record.sh                             | 1 +
 tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
 tools/perf/tests/shell/stat+std_output.sh                    | 1 +
 tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
 tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
 13 files changed, 26 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/asm_pure_loop.sh b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
index 779bc8608e1e..04387061e9f3 100755
--- a/tools/perf/tests/shell/coresight/asm_pure_loop.sh
+++ b/tools/perf/tests/shell/coresight/asm_pure_loop.sh
@@ -5,7 +5,10 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="asm_pure_loop"
+
+# shellcheck source=../lib/coresight.sh
 . "$(dirname $0)"/../lib/coresight.sh
+
 ARGS=""
 DATV="out"
 DATA="$DATD/perf-$TEST-$DATV.data"
diff --git a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
index 08a44e52ce9b..c17e442ac741 100755
--- a/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
+++ b/tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh
@@ -5,7 +5,10 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="memcpy_thread"
+
+# shellcheck source=../lib/coresight.sh
 . "$(dirname $0)"/../lib/coresight.sh
+
 ARGS="16 10 1"
 DATV="16k_10"
 DATA="$DATD/perf-$TEST-$DATV.data"
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
index c83a200dede4..e47c4e955d0e 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh
@@ -5,7 +5,10 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="thread_loop"
+
+# shellcheck source=../lib/coresight.sh
 . "$(dirname $0)"/../lib/coresight.sh
+
 ARGS="10 1"
 DATV="check-tid-10th"
 DATA="$DATD/perf-$TEST-$DATV.data"
diff --git a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
index 6346fd5e87c8..8bf94a02e384 100755
--- a/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
+++ b/tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh
@@ -5,7 +5,10 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="thread_loop"
+
+# shellcheck source=../lib/coresight.sh
 . "$(dirname $0)"/../lib/coresight.sh
+
 ARGS="2 20"
 DATV="check-tid-2th"
 DATA="$DATD/perf-$TEST-$DATV.data"
diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
index 7304e3d3a6ff..0dc9ef424233 100755
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
@@ -5,7 +5,10 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="unroll_loop_thread"
+
+# shellcheck source=../lib/coresight.sh
 . "$(dirname $0)"/../lib/coresight.sh
+
 ARGS="10"
 DATV="10"
 DATA="$DATD/perf-$TEST-$DATV.data"
diff --git a/tools/perf/tests/shell/probe_vfs_getname.sh b/tools/perf/tests/shell/probe_vfs_getname.sh
index 871243d6d03a..554e12e83c55 100755
--- a/tools/perf/tests/shell/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/probe_vfs_getname.sh
@@ -4,10 +4,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
+# shellcheck source=lib/probe.sh
 . "$(dirname $0)"/lib/probe.sh
 
 skip_if_no_perf_probe || exit 2
 
+# shellcheck source=lib/probe_vfs_getname.sh
 . "$(dirname $0)"/lib/probe_vfs_getname.sh
 
 add_probe_vfs_getname || skip_if_no_debuginfo
diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index 89214a6d9951..eebeea6bdc76 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -10,7 +10,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
+# shellcheck source=lib/probe.sh
 . "$(dirname "$0")/lib/probe.sh"
+# shellcheck source=lib/probe_vfs_getname.sh
 . "$(dirname "$0")/lib/probe_vfs_getname.sh"
 
 libc=$(grep -w libc /proc/self/maps | head -1 | sed -r 's/.*[[:space:]](\/.*)/\1/g')
diff --git a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
index 7f664f1889d9..5eedbe29bba1 100755
--- a/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/record+script_probe_vfs_getname.sh
@@ -9,10 +9,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
+# shellcheck source=lib/probe.sh
 . "$(dirname "$0")/lib/probe.sh"
 
 skip_if_no_perf_probe || exit 2
 
+# shellcheck source=lib/probe_vfs_getname.sh
 . "$(dirname "$0")/lib/probe_vfs_getname.sh"
 
 record_open_file() {
diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
index 4fbc74805d52..29443b8e8876 100755
--- a/tools/perf/tests/shell/record.sh
+++ b/tools/perf/tests/shell/record.sh
@@ -5,6 +5,7 @@
 set -e
 
 shelldir=$(dirname "$0")
+# shellcheck source=lib/waiting.sh
 . "${shelldir}"/lib/waiting.sh
 
 err=0
diff --git a/tools/perf/tests/shell/stat+csv_output.sh b/tools/perf/tests/shell/stat+csv_output.sh
index d890eb26e914..f1818fa6d9ce 100755
--- a/tools/perf/tests/shell/stat+csv_output.sh
+++ b/tools/perf/tests/shell/stat+csv_output.sh
@@ -6,6 +6,7 @@
 
 set -e
 
+# shellcheck source=lib/stat_output.sh
 . "$(dirname $0)"/lib/stat_output.sh
 
 csv_sep=@
diff --git a/tools/perf/tests/shell/stat+std_output.sh b/tools/perf/tests/shell/stat+std_output.sh
index fb2b10547a11..4fcdd1a9142c 100755
--- a/tools/perf/tests/shell/stat+std_output.sh
+++ b/tools/perf/tests/shell/stat+std_output.sh
@@ -6,6 +6,7 @@
 
 set -e
 
+# shellcheck source=lib/stat_output.sh
 . "$(dirname $0)"/lib/stat_output.sh
 
 stat_output=$(mktemp /tmp/__perf_test.stat_output.std.XXXXX)
diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index 3a8b9bffa022..723ec501f99a 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -8,6 +8,7 @@ set -e
 perf list | grep -q 'intel_pt//' || exit 2
 
 shelldir=$(dirname "$0")
+# shellcheck source=lib/waiting.sh
 . "${shelldir}"/lib/waiting.sh
 
 skip_cnt=0
diff --git a/tools/perf/tests/shell/trace+probe_vfs_getname.sh b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
index 4014487cf4d9..3146a1eece07 100755
--- a/tools/perf/tests/shell/trace+probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
@@ -10,6 +10,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
+# shellcheck source=lib/probe.sh
 . "$(dirname $0)"/lib/probe.sh
 
 skip_if_no_perf_probe || exit 2
-- 
2.31.1

