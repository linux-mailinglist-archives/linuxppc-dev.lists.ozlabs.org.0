Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB82674C74F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:41:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxcQcpF8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbZ94ktFz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxcQcpF8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHm51Wvz3bw4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:52 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHNq6018392;
	Sun, 9 Jul 2023 18:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1JSoFdw7HHXHRBR4/DLK9dgg6En8RGPiiejBZ+3wFY0=;
 b=BxcQcpF8EULRHwzeWY47mVmC6fYCn1AXYvJm/9qu07jPIIuZ6cRgN5TQ983rw4f3K/hH
 yfi2BQ8ygXhN/IQv0ybmT63sym1PAdMYD59kwssvPFFoShbK3lBD6kazGZo54KMtc1+A
 Xr5rty/gqqmDZCZ49LI81imqxjZBXovlCzd/QJK4om4cBPQ0SMOUlnO4Lod8ywf5aq5Z
 45vYzJGbJddXr7m2mLqPxUTHNfdp/zJFoMsJP2vJYKRRpTmtnHITvjZ+m+oFazQyqcbt
 onBPgFdDu1IEvKCohsXNrx0pCU0wG2Oq94fzpYxoHL3Xhh5a96vWjFdCHNrUaABgtkJ6 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21n03r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:49 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369ISmPv011097;
	Sun, 9 Jul 2023 18:28:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21n03qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369CluOf001193;
	Sun, 9 Jul 2023 18:28:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rpy2e0v9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISgC841943728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C482C20043;
	Sun,  9 Jul 2023 18:28:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3E3620040;
	Sun,  9 Jul 2023 18:28:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 14/26] tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
Date: Sun,  9 Jul 2023 23:57:48 +0530
Message-Id: <20230709182800.53002-15-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: __kpJ791IgSkM88zkfPPPnVg-Xw4zYp7
X-Proofpoint-ORIG-GUID: IHasdl-upqD7a1zcnBhKSN3bdUlZy9E7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090169
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

From: Kajol Jain <kjain@linux.ibm.com>

Running shellcheck on arch_errno_names.sh generates below warning:

In arch_errno_names.sh line 20:
	local arch="$1"
        ^--------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

......

In arch_errno_names.sh line 61:
	local arch
        ^--------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

In arch_errno_names.sh line 67:
		printf '\t\treturn errno_to_name__%s(err);\n' $(arch_string "$arch")
                                                              ^--------------------^ SC2046 (warning): Quote this to prevent word splitting.

In arch_errno_names.sh line 69:
	printf '\treturn errno_to_name__%s(err);\n' $(arch_string "$default")
                                                    ^-----------------------^ SC2046 (warning): Quote this to prevent word splitting.

Fixed the warnings by:
- Fixing shellcheck warnings for local usage, by removing
  local from the variable names
- Adding quotes to avoid word splitting

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/trace/beauty/arch_errno_names.sh | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tools/perf/trace/beauty/arch_errno_names.sh b/tools/perf/trace/beauty/arch_errno_names.sh
index 37c53bac5f56..cc09dcaa891e 100755
--- a/tools/perf/trace/beauty/arch_errno_names.sh
+++ b/tools/perf/trace/beauty/arch_errno_names.sh
@@ -17,8 +17,7 @@ arch_string()
 
 asm_errno_file()
 {
-	local arch="$1"
-	local header
+	arch="$1"
 
 	header="$toolsdir/arch/$arch/include/uapi/asm/errno.h"
 	if test -r "$header"; then
@@ -30,8 +29,7 @@ asm_errno_file()
 
 create_errno_lookup_func()
 {
-	local arch=$(arch_string "$1")
-	local nr name
+	arch=$(arch_string "$1")
 
 	printf "static const char *errno_to_name__%s(int err)\n{\n\tswitch (err) {\n" $arch
 
@@ -44,8 +42,8 @@ create_errno_lookup_func()
 
 process_arch()
 {
-	local arch="$1"
-	local asm_errno=$(asm_errno_file "$arch")
+	arch="$1"
+	asm_errno=$(asm_errno_file "$arch")
 
 	$gcc $CFLAGS $include_path -E -dM -x c $asm_errno \
 		|grep -hE '^#define[[:blank:]]+(E[^[:blank:]]+)[[:blank:]]+([[:digit:]]+).*' \
@@ -56,9 +54,8 @@ process_arch()
 
 create_arch_errno_table_func()
 {
-	local archlist="$1"
-	local default="$2"
-	local arch
+	archlist="$1"
+	default="$2"
 
 	printf 'const char *arch_syscalls__strerrno(const char *arch, int err)\n'
 	printf '{\n'
-- 
2.39.1

