Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE751BC58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 11:41:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv7xz5Br9z3bq9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:41:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o9Rkenqx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o9Rkenqx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv7wZ04TLz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 19:40:29 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458h2fs029794;
 Thu, 5 May 2022 09:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BzUI8x9CukGsgU7XYPqbyddH5RXHCfLtgP2p1hscRhQ=;
 b=o9RkenqxzyqCZExL9onDQZhSua0jIljSKaVSYc3UcQJLld0PVS/qOyAT/inEZL4kCyRK
 XEg0W6SQC40B6VdzW7fSfySMn+nf4jz8xmpuoFPvCjo8hcnw/5mdGd0c2/3iflgoJGiz
 LxDIywIyn3fK8L0xFSd7cOI36NCBhFtQcP7/FthjebfuOMLPK7QIVAuablnvl6Cmyu7g
 ozniGMmkxGiGDnxHpgYTwR2dbiSEYjj1T1pCVVNFAQrbvtgw7RNbmjEhow3kqwVTNQEc
 s0+H6xxqJUNHDSMmIc4+PgofyPMIsn8KblONQTI3rlnOqqshI7JTw40U4J3m+jtx73fU tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbabh0ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24599eIn028504;
 Thu, 5 May 2022 09:40:23 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbabh0m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:23 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2459ZOAu001511;
 Thu, 5 May 2022 09:40:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7futsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2459eDK329950216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 09:40:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36757A404D;
 Thu,  5 May 2022 09:40:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84CC7A4040;
 Thu,  5 May 2022 09:40:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.80.15])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 09:40:13 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 1/2] tools/perf: Add utility function to read /proc/cpuinfo
 for any field
Date: Thu,  5 May 2022 15:09:59 +0530
Message-Id: <20220505094000.58220-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FGDK7DECe1Hhj7f4Wr4AqRXNV_ou2pqX
X-Proofpoint-GUID: lbEYGQzv4TkEfXmRVagxUqnlNqZOMZMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050067
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
 tools/perf/util/header.c | 53 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index a27132e5a5ef..f08857f96606 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -983,6 +983,59 @@ static int write_dir_format(struct feat_fd *ff,
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
+
+	if (!search)
+		return NULL;
+
+	file = fopen("/proc/cpuinfo", "r");
+	if (!file)
+		return NULL;
+
+	while (getline(&buf, &len, file) > 0) {
+		if (!strncmp(buf, search, strlen(search)))
+			break;
+	}
+
+	if (feof(file))
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
+
+	/* Go to string after ":" */
+	copy_buf = p + 1;
+	p = strchr(copy_buf, '\n');
+	if (p)
+		*p = '\0';
+
+	/* Copy the filtered string after removing space to buf */
+	strcpy(buf, strim(copy_buf));
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

