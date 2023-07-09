Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6674C76E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:46:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jDJD9DBn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzbh96YsQz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jDJD9DBn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbJ42gy3z3c03
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:29:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHmh7004531;
	Sun, 9 Jul 2023 18:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AiQBhZI6o/xL/AdMWZBwh6XcNALOlDZUevA1vDf12Hg=;
 b=jDJD9DBneIJLhjnuPLZCWS04W/dcCmPfEIrTn1/9bVDLAwChmGaD3944wTo8yZVCAZKP
 FnTsuYdmxD087CUP70BMID4mm5ZraoUIrxg51iAMkEbQds2LBa08lCVvN/BLG+CxpB2d
 9666TFu11VtpDDA+NVzAHu9KIpNLcVjEHM6eFBI2STcn9pdy7gZ1YdwCGiFAg/cCRrzg
 0qkDbaNGwT4Ulm1R+yvj6Q0hh41T3KxTy5VY31AMY9IpW1dDcBTjSAmI2cV8Gfrf+xDB
 zpI0e5GEgSTETifo31NKtV6ArYeyA3914H2ePz1l8tzyTXF3U/V9OlQb44L5EzUOQZD0 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:04 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369IIjai007186;
	Sun, 9 Jul 2023 18:29:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3699SNK8016786;
	Sun, 9 Jul 2023 18:29:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3rpye58v4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISwB721627432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9005A20043;
	Sun,  9 Jul 2023 18:28:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FE7820040;
	Sun,  9 Jul 2023 18:28:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 20/26] tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
Date: Sun,  9 Jul 2023 23:57:54 +0530
Message-Id: <20230709182800.53002-21-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 14BOTet6GK0pUL6-w7Q9ON1eA4Gx7zUI
X-Proofpoint-GUID: UZuMgiPEuv6nfYVcjvRHxDClTlVR88yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090169
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

Running shellcheck on x86_arch_prctl.sh generates below warning:

  In ./tools/perf/trace/beauty/x86_arch_prctl.sh line 10:
      	local idx=$1
        ^-------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

  In ./tools/perf/trace/beauty/x86_arch_prctl.sh line 11:
	local prefix=$2
        ^----------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

   In ./tools/perf/trace/beauty/x86_arch_prctl.sh line 12:
	local first_entry=$3
        ^---------------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

Fix this by removing local since these are variables
used only in specific function

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/trace/beauty/x86_arch_prctl.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/trace/beauty/x86_arch_prctl.sh b/tools/perf/trace/beauty/x86_arch_prctl.sh
index fd5c740512c5..b1596df251f0 100755
--- a/tools/perf/trace/beauty/x86_arch_prctl.sh
+++ b/tools/perf/trace/beauty/x86_arch_prctl.sh
@@ -7,9 +7,9 @@
 prctl_arch_header=${x86_header_dir}/prctl.h
 
 print_range () {
-	local idx=$1
-	local prefix=$2
-	local first_entry=$3
+	idx=$1
+	prefix=$2
+	first_entry=$3
 
 	printf "#define x86_arch_prctl_codes_%d_offset %s\n" $idx $first_entry
 	printf "static const char *x86_arch_prctl_codes_%d[] = {\n" $idx
-- 
2.39.1

