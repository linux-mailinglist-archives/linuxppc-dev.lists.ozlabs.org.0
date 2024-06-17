Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D490AEAC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 15:05:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6S8dK11;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2qrJ5Sf6z3g0g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 23:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F6S8dK11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2qp746hLz3fsl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 23:03:59 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HCQpv6013610;
	Mon, 17 Jun 2024 13:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=F1aygYlyQ1AHK
	zAJrOBghvCQaOOlKlQz25eOCxkF8iE=; b=F6S8dK119w0tXQPKcWOfdMWy+m6eR
	G+lMHTYGWeiQNuYL4RKQPL9kIsVRo7PAmjcsIg75lylh+yS4DYq0xUiMhSXbYugm
	9glKKHG3EXk3ClOS/t9v+nGQn7pz2NHSU84jrL6D7kUq7Sya0350GnxaVjr8nv9S
	4OYWyqm0Ovs3a/EEtJOz+TSnfKOhKY5JRNBK/9FMyfCVzD4LSXV/Fk1Yrjs4ATxs
	gJqhZNscQ/6TUYXxH2QMkv4Sacbe993mwVXh5NEjBX6Ei/JKA5zWz5KDQMnv9O2r
	2UDMHOC8Hr+c74Y7OWh6GbXcXE+y3bMmFmPNYEOwK0sf1/vslYSos1UKQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytjkbgg5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 13:03:48 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45HD3lHh003679;
	Mon, 17 Jun 2024 13:03:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytjkbgg5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 13:03:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45HD1O9Y006227;
	Mon, 17 Jun 2024 13:03:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ysn9uah6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 13:03:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45HD3ets28377836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 13:03:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C2820040;
	Mon, 17 Jun 2024 13:03:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07FAF20043;
	Mon, 17 Jun 2024 13:03:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.218])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2024 13:03:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 2/3] tools/perf: Use is_perf_pid_map_name helper function to check dso's of pattern /tmp/perf-%d.map
Date: Mon, 17 Jun 2024 18:33:31 +0530
Message-Id: <20240617130332.13427-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240617130332.13427-1-atrajeev@linux.vnet.ibm.com>
References: <20240617130332.13427-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: laypn9f-7IeJSlHckrkR3y0G-aqYNmih
X-Proofpoint-ORIG-GUID: LuLsZvnwnqoRUnOm5rBM_oHQIft6o9D9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_11,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170100
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 80d496be89ed ("perf report: Add support for profiling JIT
generated code") added support for profiling JIT generated code.
This patch handles dso's of form "/tmp/perf-$PID.map".

Some of the references doesn't check exactly for same pattern.
some uses "if (!strncmp(dso_name, "/tmp/perf-", 10))". Fix
this by using helper function is_perf_pid_map_name which looks
for proper pattern of form: "/tmp/perf-$PID.map" for these checks.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/dsos.c    | 2 +-
 tools/perf/util/srcline.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index ab3d0c01dd63..23cd02aa701d 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
 	char *base, *lname;
 	int tid;
 
-	if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) == 1) {
+	if (is_perf_pid_map_name(dso__long_name(dso))) {
 		if (asprintf(&base, "[JIT] tid %d", tid) < 0)
 			return;
 	} else {
diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index 9d670d8c1c08..51eb78993fe2 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -39,7 +39,7 @@ static const char *srcline_dso_name(struct dso *dso)
 	if (dso_name[0] == '[')
 		return NULL;
 
-	if (!strncmp(dso_name, "/tmp/perf-", 10))
+	if (is_perf_pid_map_name(dso_name))
 		return NULL;
 
 	return dso_name;
-- 
2.35.3

