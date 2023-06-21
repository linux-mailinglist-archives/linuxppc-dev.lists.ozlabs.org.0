Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5A737DBE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:44:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d+0vZV/I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmHBF6lfXz3dJM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d+0vZV/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGv13T5Fz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:31:41 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L88oBv022142;
	Wed, 21 Jun 2023 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1JSoFdw7HHXHRBR4/DLK9dgg6En8RGPiiejBZ+3wFY0=;
 b=d+0vZV/IBpBfUo92eJP7U573k6in7HyQ6xp03zkZTbwHKL+eZeChf738NSPCp0qJmyuW
 l2sujeqFroK/o/hoRGgtNCSMnQqTPiT0c2So6HCPdYTu5lBDmHdfGcoXIXUTbxRRxy8T
 pIwiiPvY6sX/lZOzpTH/IbicATcLwgIRl9trYYP0qNUb45ZfeggllIpi0BeIPgek9xIt
 jwHJhXmzFgfu8zlZ5dZTdaPchJxT+IEhfn2nhrFuWP38k5WvXLpcKd7VsYrrKpZHcU93
 wecOANQwin4rufX1vSO9+GUgynJPOVpLKNWz0kWONJM6/JRNF+dzmXmJ+853snrDj8tY iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbvpbspkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:35 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8Ffaq023203;
	Wed, 21 Jun 2023 08:31:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbvpbspjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35KNCBUH030836;
	Wed, 21 Jun 2023 08:31:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e2mss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8VTxj28050106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:31:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4159220040;
	Wed, 21 Jun 2023 08:31:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A10220043;
	Wed, 21 Jun 2023 08:31:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:31:21 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 15/22] tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
Date: Wed, 21 Jun 2023 14:00:14 +0530
Message-Id: <20230621083021.71203-16-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mObpjQDfRk2JSc9h4v1XcLNHP-wWOtSC
X-Proofpoint-GUID: LqfkyiUjulsVno4Zy-qqx-oHqEPeWpuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306210067
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

