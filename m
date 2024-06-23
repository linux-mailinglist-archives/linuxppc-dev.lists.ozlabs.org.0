Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3091385B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 08:49:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UHcJqmP3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6MCc3YKcz3cXK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 16:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UHcJqmP3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6MBv1Zwfz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 16:49:10 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45N5uhqL007961;
	Sun, 23 Jun 2024 06:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=SVxEI1Xo6AFLf
	6kIIt2Gs7dNrEuAM0rikRzL+VZn28w=; b=UHcJqmP3S3YV0AWKPnJYBVHytTdDn
	GCJUurSHxy6HXGpe0iQyT9UuF5CGXMCnLQlTobS5pbD8fL+P+/mSGjL+YVFDgctn
	DA+w2BIwAfXPxUhO2d+qSSbM2SmVgT6zgdBqBxlHOQX1FPZJ2ba6tdkfwwOgZpQM
	1SE/3+S6ADpVtcxwNfWsxC/9whroMiPM0lTdcmg5iU3hNQxt5onvDViuRW4MHIMf
	wI3yDPSZy57oPMvGqb/e9daRFThkYQpx/cqV34ipl00WHCvChTQoCEJNvS0jGURS
	VtgKaYdvgp/8mQkGB1FS7tRbeqGHqbhb8eUgGOdKhSDd+Rs3v/GI7xuBA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yxc93g7tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:06 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45N6n6U0018324;
	Sun, 23 Jun 2024 06:49:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yxc93g7tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45N2gcdb019984;
	Sun, 23 Jun 2024 06:49:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5m0scm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45N6mx4e32834064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Jun 2024 06:49:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BCFF2004D;
	Sun, 23 Jun 2024 06:48:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35D432004F;
	Sun, 23 Jun 2024 06:48:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.64.228])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Jun 2024 06:48:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V4 2/3] tools/perf: Use is_perf_pid_map_name helper function to check dso's of pattern /tmp/perf-%d.map
Date: Sun, 23 Jun 2024 12:18:49 +0530
Message-Id: <20240623064850.83720-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oKy7q-Ew-GUP27ocbsHDr59YNDT1J0WD
X-Proofpoint-GUID: YafeZ3bdIcmVkcs3nhhbcRy0scaLX1zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_01,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230047
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
this by using helper function perf_pid_map_tid and
is_perf_pid_map_name which looks for proper pattern of
form: "/tmp/perf-$PID.map" for these checks.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/dsos.c    | 2 +-
 tools/perf/util/srcline.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index ab3d0c01dd63..846828ea1f00 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -275,7 +275,7 @@ static void dso__set_basename(struct dso *dso)
 	char *base, *lname;
 	int tid;
 
-	if (sscanf(dso__long_name(dso), "/tmp/perf-%d.map", &tid) == 1) {
+	if (perf_pid_map_tid(dso__long_name(dso), &tid)) {
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

