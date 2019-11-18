Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C61002A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 11:39:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Glp11Dp6zDqT1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 21:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GlmC6G6yzDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 21:38:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIAZj2Y103827
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 05:38:15 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wayenrbw2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 05:38:15 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Mon, 18 Nov 2019 10:38:12 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Nov 2019 10:38:09 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAIAc7hE51380430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Nov 2019 10:38:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 995815204F;
 Mon, 18 Nov 2019 10:38:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.92.91])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 612885204E;
 Mon, 18 Nov 2019 10:38:04 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] tools/perf/metricgroup: Fix printing event names of metric
 group with multiple events
Date: Mon, 18 Nov 2019 16:07:49 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111810-0016-0000-0000-000002C6AB91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111810-0017-0000-0000-000033285B49
Message-Id: <20191118103749.12207-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-18_02:2019-11-15,2019-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=1
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911180095
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Andi Kleen <ak@linux.intel.com>, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jin Yao <yao.jin@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 kjain@linux.ibm.com, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit f01642e4912b ("perf metricgroup: Support multiple
events for metricgroup") introduced support for multiple events
in a metric group. But with the current upstream, metric events
names are not printed properly

In power9 platform:
command:# ./perf stat --metric-only -M translation -C 0 -I 1000 sleep 2
     1.000208486
     2.000368863
     2.001400558

Similarly in skylake platform:
command:./perf stat --metric-only -M Power -I 1000
     1.000579994
     2.002189493

With current upstream version, issue is with event name comparison
logic in find_evsel_group(). Current logic is to compare events
belonging to a metric group to the events in perf_evlist.
Since the break statement is missing in the loop used for comparison
between metric group and perf_evlist events, the loop continues to
execute even after getting a pattern match, and end up in discarding
the matches.
Incase of single metric event belongs to metric group, its working fine,
because in case of single event once it compare all events it reaches to
end of perf_evlist.

Example for single metric event in power9 platform
command:# ./perf stat --metric-only  -M branches_per_inst -I 1000 sleep 1
     1.000094653                  0.2
     1.001337059                  0.0

Patch fixes the issue by making sure once we found all events
belongs to that metric event matched in find_evsel_group(), we
successfully break from that loop by adding corresponding condition.

With this patch:
In power9 platform:

command:# ./perf stat --metric-only -M translation -C 0 -I 1000 sleep 2
result:#           time derat_4k_miss_rate_percent  derat_4k_miss_ratio
     derat_miss_ratio derat_64k_miss_rate_percent derat_64k_miss_ratio
         dslb_miss_rate_percent islb_miss_rate_percent
     1.000135672                         0.0                  0.3
                  1.0                          0.0                  0.2
                 0.0                     0.0
     2.000380617                         0.0                  0.0
                                              0.0                  0.0
                0.0                     0.0

command:# ./perf stat --metric-only -M Power -I 1000

Similarly in skylake platform:
result:#           time    Turbo_Utilization    C3_Core_Residency
            C6_Core_Residency    C7_Core_Residency     C2_Pkg_Residency
             C3_Pkg_Residency     C6_Pkg_Residency     C7_Pkg_Residency
     1.000563580                  0.3                  0.0
                  2.6                44.2                 21.9
                  0.0                  0.0                  0.0
     2.002235027                  0.4                  0.0
                  2.7           43.0                 20.7
                  0.0                  0.0               0.0

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Jin Yao <yao.jin@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/util/metricgroup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index a7c0424dbda3..940a6e7a6854 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -103,8 +103,11 @@ static struct evsel *find_evsel_group(struct evlist *perf_evlist,
 		if (!strcmp(ev->name, ids[i])) {
 			if (!metric_events[i])
 				metric_events[i] = ev;
+			i++;
+			if (i == idnum)
+				break;
 		} else {
-			if (++i == idnum) {
+			if (i + 1 == idnum) {
 				/* Discard the whole match and start again */
 				i = 0;
 				memset(metric_events, 0,
@@ -124,7 +127,7 @@ static struct evsel *find_evsel_group(struct evlist *perf_evlist,
 		}
 	}
 
-	if (i != idnum - 1) {
+	if (i != idnum) {
 		/* Not whole match */
 		return NULL;
 	}
-- 
2.21.0

