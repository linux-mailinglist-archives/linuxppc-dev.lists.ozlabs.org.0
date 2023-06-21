Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1164737DB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:40:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRMxjX1s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmH586r5Tz3dJV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRMxjX1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGtd4CqBz3bcH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:31:21 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8JRkh024876;
	Wed, 21 Jun 2023 08:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GH5MJUn1KHTRi5EBDxe7B2jyXMg20TotDqSQv21P5+Y=;
 b=JRMxjX1sOVNQzbSjAgMoaxwBla6+8UJXwZYp5stURveE7DU7rHTLxJJPMjjMYAIF5QcS
 p/er/tCulNkLEUJiHSxL2aKIH1bHTLzBL8AO/xLk4ZJ4ceABGNe/EkKkfC4Znq6VPWjF
 jh4qPnuR6/pIyBASNjQvK8lUUIQjXrH+awGRfmlQcwLwDd4SvB5DbBQetWqsVZuhpaln
 wMpaqyOO1Ru+h+1Mce/CziHSbTUWfMVhqJqfqiyP+SFNKZaC2tMXlQR+ck61scTjC8Dv
 zahAO5GF63ae4ADMozQ6nZ8F6iaA14z82R83H8tyLzi3764e/GpjLAE+EyfgJpHCZ41f fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwk786qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:12 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8KlQh027936;
	Wed, 21 Jun 2023 08:31:12 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwk786pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:11 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5EZf0025700;
	Wed, 21 Jun 2023 08:31:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r94f59yn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8V6n29306708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:31:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D72C2004B;
	Wed, 21 Jun 2023 08:31:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEB3820043;
	Wed, 21 Jun 2023 08:31:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:31:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 10/22] tools/perf/tests: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh tetscase
Date: Wed, 21 Jun 2023 14:00:09 +0530
Message-Id: <20230621083021.71203-11-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tARHMa-M0k_eu76T8bam7i0zWYm2Nkwy
X-Proofpoint-GUID: uwQ3Sl3d0m_h5P2LGpMEijByqRjN182X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0
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

Running shellcheck on stat+shadow_stat.sh generates below
warning:

In tests/shell/stat+shadow_stat.sh line 48:
        while read cpu num evt hash ipc rest
                               ^--^ SC2034 (warning): hash appears unused. Verify use (or export if used externally).

This variable is intentioanlly unused since it is
needed to parse through the output. Use "_" as a
prefix for this throw away variable.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/stat+shadow_stat.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/stat+shadow_stat.sh b/tools/perf/tests/shell/stat+shadow_stat.sh
index 0e9cba84e757..a1918a15e36a 100755
--- a/tools/perf/tests/shell/stat+shadow_stat.sh
+++ b/tools/perf/tests/shell/stat+shadow_stat.sh
@@ -14,7 +14,7 @@ test_global_aggr()
 {
 	perf stat -a --no-big-num -e cycles,instructions sleep 1  2>&1 | \
 	grep -e cycles -e instructions | \
-	while read num evt hash ipc rest
+	while read num evt _hash ipc rest
 	do
 		# skip not counted events
 		if [ "$num" = "<not" ]; then
@@ -45,7 +45,7 @@ test_no_aggr()
 {
 	perf stat -a -A --no-big-num -e cycles,instructions sleep 1  2>&1 | \
 	grep ^CPU | \
-	while read cpu num evt hash ipc rest
+	while read cpu num evt _hash ipc rest
 	do
 		# skip not counted events
 		if [ "$num" = "<not" ]; then
-- 
2.39.1

