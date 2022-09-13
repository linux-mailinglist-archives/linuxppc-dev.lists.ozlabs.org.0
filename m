Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701855B6CAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 14:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRhqR2Sw5z3cfP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 22:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPnn4mLT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPnn4mLT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRhpq3tQMz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 21:59:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DBpxRC015877;
	Tue, 13 Sep 2022 11:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6sb6GAcY6EDsqxxu81BDibBH8xvaUsNveyvlJ6I9w3Y=;
 b=GPnn4mLTmNdEqT4WoAb9BgLDowUVOsbwzi9yttHSfwn7D3GeQpONg4KwBF+7NpkC3A87
 oHwKzuEUm+S6F2BBiIgY47qzfKfr8kvADFfZb2ijFCOf73XyvZNWpWCr+9whdxmLyHrL
 U52eLYoNOC2xhj8wqTK56BVzVUUmDE/wl1oiPvaZkyndKoaerB3K+ovgTdS93Rxr/Vcv
 hYnyYgkrVXnj9TupwjK874IhBG5kaFUxs0qb6RZkQPATfoADfNcl/eX4F4r8icljFomi
 SvgcS4AxSkgIqL8n3eu0brymODoUjTZwyeSb5HzLyBK/DvVipp5znJkr5fbcdZAF3xY2 mQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjsc686a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:59:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DBoTL6012763;
	Tue, 13 Sep 2022 11:59:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3jghujbrxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:59:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DBxZVH27394350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 11:59:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6CABA4053;
	Tue, 13 Sep 2022 11:59:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99FD0A4040;
	Tue, 13 Sep 2022 11:59:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.78.239])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 11:59:32 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH] tools/perf/tests: Fix perf probe error log check in skip_if_no_debuginfo
Date: Tue, 13 Sep 2022 17:29:31 +0530
Message-Id: <20220913115931.36202-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tpJQdSa3f2c29QZXHvaSaNRIJz2iOJM_
X-Proofpoint-ORIG-GUID: tpJQdSa3f2c29QZXHvaSaNRIJz2iOJM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130052
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The perf probe related tests like probe_vfs_getname.sh which
is in "tools/perf/tests/shell" directory have dependency on
debuginfo information in the kernel. Currently debuginfo
check is handled by skip_if_no_debuginfo function in the
file "lib/probe_vfs_getname.sh". skip_if_no_debuginfo function
looks for this specific error log from perf probe to skip
the testcase:

<<>>
Failed to find the path for the kernel|Debuginfo-analysis is
not supported
<>>

But in some case, like this one in powerpc, while running this
test, observed error logs is:

<<>>
The /lib/modules/<version>/build/vmlinux file has no debug information.
Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
package.
  Error: Failed to add events.
<<>>

Update the skip_if_no_debuginfo function to include the above
error, to skip the test in these scenarios too.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/lib/probe_vfs_getname.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 5b17d916c555..26d95069e50d 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -19,6 +19,8 @@ add_probe_vfs_getname() {
 }
 
 skip_if_no_debuginfo() {
-	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)" && return 2
+	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel \
+		|Debuginfo-analysis is not supported) | file has no debug information" && \
+		return 2
 	return 1
 }
-- 
2.31.1

