Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63649DB66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksYW4Dzmz3cbD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:25:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2RwMnZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G2RwMnZb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksT43RPpz30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:12 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R78Rcm013778; 
 Thu, 27 Jan 2022 07:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gXsQ0jX/XxUrEqwFe0zVodQQ8Txp+NEb1cIEKDBrWx8=;
 b=G2RwMnZbsH/FsnDKHe0kAhgaAXygeMHxy8CUR3dZ9yr0tSTrr2Fbg5c7UaJ2dUGaFbwr
 /fOcBCzOYrto4JpHK1MqYjs1s5NWkVUzsSwpXo30ShbObhJ1sR8rWnVj9qny+FeMuh2i
 D/0OToJLcys00TiA4P7xbunfZg8os5xGp1pNYjNdEmzALWMh+MW2RRExPQftDDLpIf/M
 NwlwqgjjeU9tAxEENq8jYfHgZHLdv+YB5votD5OT684KLzMNxJJ5C8IuNZaDQHr+B5X+
 4hva31ij1wwG/p+oNSZXpWy013ytItG8EKscxf236BQZigk5m7vmAXizZcNFAXa27Haw UQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dup0u91m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:07 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78H3g024505;
 Thu, 27 Jan 2022 07:21:05 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3dr9j9tm7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7L1DP33751546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1963242045;
 Thu, 27 Jan 2022 07:21:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C809342041;
 Thu, 27 Jan 2022 07:20:58 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:20:58 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 05/20] selftest/powerpc/pmu: Add event_init_sampling function
Date: Thu, 27 Jan 2022 12:49:57 +0530
Message-Id: <20220127072012.662451-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rw7CSYsILoj-1td_NwwB_OELc4DMipQm
X-Proofpoint-ORIG-GUID: rw7CSYsILoj-1td_NwwB_OELc4DMipQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=887 priorityscore=1501 mlxscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270040
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Extended event_init_opts() to include initialization
of sampling testcases. Patch adds an event_init_sampling()
wrapper to initialize event attribute fields for sampling
events. This includes initializing sample period, sample type
and event type.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 tools/testing/selftests/powerpc/pmu/event.c | 18 +++++++++++++++++-
 tools/testing/selftests/powerpc/pmu/event.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/event.c b/tools/testing/selftests/powerpc/pmu/event.c
index 48e3a413b15d..cbba74c1170f 100644
--- a/tools/testing/selftests/powerpc/pmu/event.c
+++ b/tools/testing/selftests/powerpc/pmu/event.c
@@ -20,7 +20,8 @@ int perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
 			   group_fd, flags);
 }
 
-void event_init_opts(struct event *e, u64 config, int type, char *name)
+static void  __event_init_opts(struct event *e, u64 config,
+			       int type, char *name, int sampling)
 {
 	memset(e, 0, sizeof(*e));
 
@@ -32,6 +33,16 @@ void event_init_opts(struct event *e, u64 config, int type, char *name)
 	/* This has to match the structure layout in the header */
 	e->attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED | \
 				  PERF_FORMAT_TOTAL_TIME_RUNNING;
+	if (sampling) {
+		e->attr.sample_period = 1000;
+		e->attr.sample_type = PERF_SAMPLE_REGS_INTR;
+		e->attr.disabled = 1;
+	}
+}
+
+void event_init_opts(struct event *e, u64 config, int type, char *name)
+{
+	__event_init_opts(e, config, type, name, 0);
 }
 
 void event_init_named(struct event *e, u64 config, char *name)
@@ -44,6 +55,11 @@ void event_init(struct event *e, u64 config)
 	event_init_opts(e, config, PERF_TYPE_RAW, "event");
 }
 
+void event_init_sampling(struct event *e, u64 config)
+{
+	__event_init_opts(e, config, PERF_TYPE_RAW, "event", 1);
+}
+
 #define PERF_CURRENT_PID	0
 #define PERF_NO_PID		-1
 #define PERF_NO_CPU		-1
diff --git a/tools/testing/selftests/powerpc/pmu/event.h b/tools/testing/selftests/powerpc/pmu/event.h
index 23d20340a160..51aad0b6d9ad 100644
--- a/tools/testing/selftests/powerpc/pmu/event.h
+++ b/tools/testing/selftests/powerpc/pmu/event.h
@@ -32,6 +32,7 @@ struct event {
 void event_init(struct event *e, u64 config);
 void event_init_named(struct event *e, u64 config, char *name);
 void event_init_opts(struct event *e, u64 config, int type, char *name);
+void event_init_sampling(struct event *e, u64 config);
 int event_open_with_options(struct event *e, pid_t pid, int cpu, int group_fd);
 int event_open_with_group(struct event *e, int group_fd);
 int event_open_with_pid(struct event *e, pid_t pid);
-- 
2.27.0

