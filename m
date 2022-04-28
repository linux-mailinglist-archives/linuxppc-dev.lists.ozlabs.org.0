Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7CE5137D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 17:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpzZF17DWz3bk5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 01:10:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0osE3Nw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T0osE3Nw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpzXp5Xqzz3064
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 01:08:58 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SF6EFZ036517;
 Thu, 28 Apr 2022 15:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RJIkd+tgKfSnkJ0v+n0oh1N70fr51pqdau+bA0HLRto=;
 b=T0osE3NwJ5n2hQRH5pWtroUXzsQOLVapQc7eqJhDK/1woUgcvIuHIwh9Acy2N39Qx6TS
 W/Nw/FreyCm1KD7gtaBX/A5imCT11Qt4YdWq7KYKCqo4EPQJoBNGMeEUndoBkDUHEY+v
 ewLEBnT9+4nPZqqvnLU1PRXESFnsZrpWrqkC3Cbhljp2j6yjMvBJvv/UW6Tb2h8tAEN/
 VMR/+TDLfTxjE8c2iU6h0Y2FwTmHH97FTeUe0/Eg6eI5jOZyVKJv4xC0Hk4MXWPB/kYj
 4cJmtMBtKoaOoGZiwYX7Qg3m1erFmUc1vLo1VzdpGuLdRmHDXdkCMWgx1RsY4UkXpax0 qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqvap9m4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:50 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SF74qr000328;
 Thu, 28 Apr 2022 15:08:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqvap9m3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SEwcB9009605;
 Thu, 28 Apr 2022 15:08:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3fm8qj7qqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23SF8iuM47972816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 15:08:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6802AA405C;
 Thu, 28 Apr 2022 15:08:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67981A4054;
 Thu, 28 Apr 2022 15:08:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.4.60])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 15:08:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 1/2] tools/perf: Add utility function to read /proc/cpuinfo
 for any field
Date: Thu, 28 Apr 2022 20:38:28 +0530
Message-Id: <20220428150829.30733-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
References: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BdSbWH6hDF6bbF_GalXGSqPY4JRPvuvW
X-Proofpoint-GUID: 65of7KKPjdp5PZUX4t5vFrXKcCcVlXFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280091
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

/proc/cpuinfo provides information about type of processor, number
of CPU's etc. Reading /proc/cpuinfo file outputs useful information
by field name like cpu, platform, model (depending on architecture)
and its value separated by colon.

Add new utility function "cpuinfo_field" in "util/header.c" which
accepts field name as input string to search in /proc/cpuinfo content.
This returns the first matching value as resulting string. Example,
calling the function "cpuinfo_field(platform)" in powerpc returns
the platform value. This can be used to fetch processor information
from "cpuinfo" by other utilities/testcases.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/header.c | 54 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index a27132e5a5ef..0c8dfd0c1e78 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -983,6 +983,60 @@ static int write_dir_format(struct feat_fd *ff,
 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
 }
 
+/*
+ * Return entry from /proc/cpuinfo
+ * indicated by "search" parameter.
+ */
+char *cpuinfo_field(const char *search)
+{
+	FILE *file;
+	char *buf = NULL;
+	char *copy_buf = NULL, *p;
+	size_t len = 0;
+	int ret = -1;
+
+	if (!search)
+		return NULL;
+
+	file = fopen("/proc/cpuinfo", "r");
+	if (!file)
+		return NULL;
+
+	while (getline(&buf, &len, file) > 0) {
+		ret = strncmp(buf, search, strlen(search));
+		if (!ret)
+			break;
+	}
+
+	if (ret)
+		goto done;
+
+	/*
+	 * Trim the new line and separate
+	 * value for search field from ":"
+	 * in cpuinfo line output.
+	 * Example output line:
+	 * platform : <value>
+	 */
+	copy_buf = buf;
+	p = strchr(copy_buf, ':');
+	if (p && *(p+1) == ' ' && *(p+2))
+		copy_buf = p + 2;
+	p = strchr(copy_buf, '\n');
+	if (p)
+		*p = '\0';
+
+	/* Copy the filtered string to buf */
+	strcpy(buf, copy_buf);
+
+	fclose(file);
+	return buf;
+
+done:
+	free(buf);
+	fclose(file);
+	return NULL;
+}
 /*
  * Check whether a CPU is online
  *
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index 0eb4bc29a5a4..b0f754364bd4 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -166,4 +166,5 @@ int get_cpuid(char *buffer, size_t sz);
 
 char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
 int strcmp_cpuid_str(const char *s1, const char *s2);
+char *cpuinfo_field(const char *search);
 #endif /* __PERF_HEADER_H */
-- 
2.35.1

