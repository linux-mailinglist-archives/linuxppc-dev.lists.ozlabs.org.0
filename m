Return-Path: <linuxppc-dev+bounces-12199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E72B57176
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGq90WCVz3dSR;
	Mon, 15 Sep 2025 17:28:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921316;
	cv=none; b=lZOS5WodiCkaN82Pjs+n2B2A3S9rn8ink+4dntjiycctGt489qjoHgNzrvSghwhPnjvS866+3Tuv+2tgKaxpvBAapg2rD6pLHIA8d4Ji1pCEafDa3X7ydbskDf8bEOe6hDNO4A+XV+a6Zae+oPguNFfReOo4KSAOwrSQfi0XrxpGJaB+gKknTMPO5lsOg3JqTPUTyeI0Kn3PoeQb8BNQy8oQwLI7lgcJWGWeThnZjtLPKP3xlsmYhcDILXgRDIAmZINdC/VTvsP+W+rSqXcIOMWQWdy+6dmdfVKYSJzVZCUBh0TOheJsccH2NdIo2lpe4RYoUElIl5NsnTYdr+pfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921316; c=relaxed/relaxed;
	bh=Q0kpztQ6P3nJD3tnaeXaEFl0IxrKJS3hQ6SzxOgikPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVyoqy4BOA9mpYg7rZzdwi7NGAfOlpVWSOcGqbxAFjRFszlZlWgfqez179oULIwRMzNeVJQu4ePbyHot71VJlz0J5f8hpCMzApRnp1743UcGPdRR0DX14IyREMbIAMfpj6lntCoV3M+ztfpmQ0seTJ97jYMeQyWU8q1lcG2Zipt5w/4Enx3A8h3+drvbLzj9yKdloAVWzx4UtEVUOxGfCrrzJQ0YI7h2jFSS8iasDyBeJ/ZAi7vqkvXc6Wv7SdWwh/WxoLH2MAoffwbsC2UgxFv6jMTsPFAGqW4NvWbtGXyDR7CG5i3eISoSIDLtG0HjC6pFT+xkSyMVTq3XHS+x8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPdIqqP9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPdIqqP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGq76Cjlz3dDq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:28:35 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F5e7ej011670;
	Mon, 15 Sep 2025 07:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Q0kpztQ6P3nJD3tna
	eXaEFl0IxrKJS3hQ6SzxOgikPM=; b=EPdIqqP9RmQBq1tW13CDJ4umwJggXHZgK
	gJXEazJKxeNhR6aDr3iigvG19HyzfVmG7u5nQlW8kiJz7e9+3H6JJofn4najnsxV
	Z6+IDmHHgMepA2/Y6JCI4wP37FudJdo+i4lMMjwToprJORSGBz1whmENbrwHyDeF
	a7nAMRJQzLf4gwsIy2XYf9QgJr6VNgCWqJQtHHJgN5RttuiYC5Z5+vgSw1T45r0y
	x07oGXXjz+9PfJEcJ9G40U9LfiImyCQdi2m/on56IRMvfcYnTZBb8U5DvIbjorPr
	jhGKzOAHTbJ/H8r3vaN2dBasKttcXDiqhXYZ3Tx1hWlcWwt7a+t6g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x0kk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F6poAg029771;
	Mon, 15 Sep 2025 07:28:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x0kjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F73teb029498;
	Mon, 15 Sep 2025 07:28:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0nd9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:28:29 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7SOd349086866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:28:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB83620049;
	Mon, 15 Sep 2025 07:28:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E14B220040;
	Mon, 15 Sep 2025 07:28:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:28:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com
Subject: [PATCH V2 3/6] tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to present DTL samples
Date: Mon, 15 Sep 2025 12:57:51 +0530
Message-Id: <20250915072754.99850-4-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072754.99850-1-atrajeev@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfX0XfdULc7aNK+
 5U8It09hPqUqnB3ToFSbo242Xxx3zbiLeMZdPlKPmcUaQDZ7w0hnC22UkGdrK3xoB8q5H0OeVs2
 2kysqcfWxFf52cZFCzgWpNJjQFi7dmBmx5igWXMgrEI10s7Tw0NAA73fEvh1ligxeqrusx/qZaw
 ZwZkGnRJG8JbZQ+4/AJwwKd0i2X5B7TwbV0bpttsFIgf4S+r3Umes55XdXvLkQv1hloB3Xsc4Yb
 M981pD/CvN4c4RjayRhuAJELsUhMro5gwhjlhhaeZRd3gf8h8kGJpeF6rgzbxapB81pkVvnJw4F
 83G5kkERPKOZHNgaCJhsW6KrG0P3M3n3MVKYIosW2AuYjZu9XnKHmyRdpObaJ8jx6O7oURtVLTe
 ZMsRGY1H
X-Proofpoint-ORIG-GUID: zh0qBK-EOOw8L_bSM_Z--N2Cbu7UiIUF
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c7c01e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=gFY-KEiRM8imJIGC6w4A:9
X-Proofpoint-GUID: 9Rc6l9fRxnfWbyZyWh_qyaLHqssBIzpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dispatch Trace Log details are captured as-is in PERF_RECORD_AUXTRACE
records. To present dtl entries as samples, create an event with name as
"vpa-dtl" and type PERF_TYPE_SYNTH. Add perf_synth_id,
"PERF_SYNTH_POWERPC_VPA_DTL" as config value for the event. Create a
sample id to be a fixed offset from evsel id.
To present the relevant fields from the "struct dtl_entry",
prepare the entries as events of type PERF_TYPE_SYNTH. By
defining as PERF_TYPE_SYNTH type, samples can be printed as part of
perf_sample__fprintf_synth in builtin-script.c

From powerpc_vpadtl_process_auxtrace_info(), invoke
auxtrace_queues__process_index() function which will queue the
auxtrace buffers by invoke auxtrace_queues__add_event().

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/util/event.h          |  1 +
 tools/perf/util/powerpc-vpadtl.c | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 7ba208ae86fd..7e0e58979e9c 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -117,6 +117,7 @@ enum perf_synth_id {
 	PERF_SYNTH_INTEL_PSB,
 	PERF_SYNTH_INTEL_EVT,
 	PERF_SYNTH_INTEL_IFLAG_CHG,
+	PERF_SYNTH_POWERPC_VPA_DTL,
 };
 
 /*
diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
index 2e8488a3dbd7..9098cbe00bfd 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -3,6 +3,7 @@
  * VPA DTL PMU support
  */
 
+#include <linux/string.h>
 #include <inttypes.h>
 #include "color.h"
 #include "evlist.h"
@@ -21,6 +22,7 @@ struct powerpc_vpadtl {
 	struct perf_session		*session;
 	struct machine			*machine;
 	u32				pmu_type;
+	u64				sample_id;
 };
 
 struct boottb_freq {
@@ -214,6 +216,65 @@ static void powerpc_vpadtl_print_info(__u64 *arr)
 	fprintf(stdout, powerpc_vpadtl_info_fmts[POWERPC_VPADTL_TYPE], arr[POWERPC_VPADTL_TYPE]);
 }
 
+static void set_event_name(struct evlist *evlist, u64 id,
+		const char *name)
+{
+	struct evsel *evsel;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.id && evsel->core.id[0] == id) {
+			if (evsel->name)
+				zfree(&evsel->name);
+			evsel->name = strdup(name);
+			break;
+		}
+	}
+}
+
+static int
+powerpc_vpadtl_synth_events(struct powerpc_vpadtl *vpa, struct perf_session *session)
+{
+	struct evlist *evlist = session->evlist;
+	struct evsel *evsel;
+	struct perf_event_attr attr;
+	bool found = false;
+	u64 id;
+	int err;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (strstarts(evsel->name, "vpa_dtl")) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		pr_debug("No selected events with VPA trace data\n");
+		return 0;
+	}
+
+	memset(&attr, 0, sizeof(struct perf_event_attr));
+	attr.size = sizeof(struct perf_event_attr);
+	attr.sample_type = evsel->core.attr.sample_type;
+	attr.sample_id_all = evsel->core.attr.sample_id_all;
+	attr.type = PERF_TYPE_SYNTH;
+	attr.config = PERF_SYNTH_POWERPC_VPA_DTL;
+
+	/* create new id val to be a fixed offset from evsel id */
+	id = evsel->core.id[0] + 1000000000;
+	if (!id)
+		id = 1;
+
+	err = perf_session__deliver_synth_attr_event(session, &attr, id);
+	if (err)
+		return err;
+
+	vpa->sample_id = id;
+	set_event_name(evlist, id, "vpa-dtl");
+
+	return 0;
+}
+
 /*
  * Process the PERF_RECORD_AUXTRACE_INFO records and setup
  * the infrastructure to process auxtrace events. PERF_RECORD_AUXTRACE_INFO
@@ -255,8 +316,23 @@ int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
 
 	powerpc_vpadtl_print_info(&auxtrace_info->priv[0]);
 
+	if (dump_trace)
+		return 0;
+
+	err = powerpc_vpadtl_synth_events(vpa, session);
+	if (err)
+		goto err_free_queues;
+
+	err = auxtrace_queues__process_index(&vpa->queues, session);
+	if (err)
+		goto err_free_queues;
+
 	return 0;
 
+err_free_queues:
+	auxtrace_queues__free(&vpa->queues);
+	session->auxtrace = NULL;
+
 err_free:
 	free(vpa);
 	return err;
-- 
2.47.1


