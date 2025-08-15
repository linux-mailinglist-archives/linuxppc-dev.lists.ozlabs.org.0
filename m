Return-Path: <linuxppc-dev+bounces-11051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43FB27B28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Fn963wzz3cc0;
	Fri, 15 Aug 2025 18:35:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246957;
	cv=none; b=nY927nooI4lVA10SjC/6eFzCHuV4yob5IYmNzWRjvvCeSzULlGIx6w1fGl5sE3qz5+hyxAQ21k0XT64L226xuL3D500fweJa10Bpmk5mlOvLEcgoG1hyACJ2hdACqxAiFD10EdovvPg6MVm38SZkEBfXK1t9HZO9EZW/tPJJDOqSUGwr4TIvMUSy+SNSfkoGy6GM7w4W39k68gvex7bFGiuinwU2qJKGhJ8xlaXp5w4p3jPPsI9Qc2AHBFLvzohfIhO2l5B72wp332uzFZaoKvjJ0df/CZixj7ihYHk7obIfPMpp97mwA/qdjSbcxfmptN9vKC2hB9EPCmnFe1HBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246957; c=relaxed/relaxed;
	bh=+aQ8lvs/IXg4oAyf7yZma++uklamV/92suGgyNy0g50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DuJQeLbiJQ0khagKCxqPhSkGRGq463WKNYiQrZMor4LhRxw62gnW7PA2bBrWFDSKKC1pnTYovje/DxuLLwbTdwEkFCVGNtle+WXU+Hbu/R+muPsyYcb9g5RYIFIqZWqFXtJ+d4PKA06rJ1BqYl/tQOApn2Zh40rfRmh6QP4Kh8qYtI+/LoKXEjcP1+zOjLFYkav/BiMnM07PS3fJbE/8ozWX4nsSaj92FWnlCq6sF8/QzlFfHsJusdrP1dmHnbCLOEmNs9YqK8EsWbdXu+UeLmn3+qybZtZ3426PfoOAkElRytdWiNTNabUZzoHH0BChwqULbR5kEkqfiYedkqNbyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IUMs3DaS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IUMs3DaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Fn90hymz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:35:56 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ENfstl011922;
	Fri, 15 Aug 2025 08:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+aQ8lvs/IXg4oAyf7
	yZma++uklamV/92suGgyNy0g50=; b=IUMs3DaSZtCVwpWlKCmgu8LcZPIBouT+5
	+Fbbfp+HzH1MfH7txcKAc3R7kxXMtwBdjx4EUc2NYfv025LM5hGdoS8tz1/1EkpX
	L+IFTeHOWzkhs2Jcwx8N6j4A0nPBMMq4M3FAcHxGvUE64Sm64N2xkL7JJP0IY3Xo
	xFpE50wLZW542TQekVrSYI5BO8gnf9BIGHOiUGGXY+w81R53PtjZKtrUwOmS0bEb
	aqqUrp43ELhBueIHFtWRHDe0vaMCd7yyVDUDVBfwz19pIDDuY6mFrI69cOQWpSDt
	2DcxmJhh5tVzGSvR9lWijKegwHcQTfIjkcQLMGvtRvBaJZJP0qxLQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupfay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:52 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8WUOI019683;
	Fri, 15 Aug 2025 08:35:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48durupfax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F6AEOL026345;
	Fri, 15 Aug 2025 08:35:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21g9ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:35:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8Zlud52166964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:35:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1725E20040;
	Fri, 15 Aug 2025 08:35:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DA882004B;
	Fri, 15 Aug 2025 08:35:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:35:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 09/14] tools/perf: Add event name as vpa-dtl of PERF_TYPE_SYNTH type to present DTL samples
Date: Fri, 15 Aug 2025 14:04:02 +0530
Message-Id: <20250815083407.27953-10-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-GUID: slh3oAJXOkuSCDtRMhXdDXsYMPkNy3oS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX9W9rU5oNUFHR
 6s5P5VA0I/kwtvhx95Xo5ro5RMaeMmEcl99bxKCUryf3xdykJf8Rg9Kr2D6DjncZ5AWi61gbc8b
 a48XNw+OpFqn7zpXLbHge6bJMShxzDLEe+mbP4OJVoDlwYcRB7cNJwB8sSyqU/WpO4ka9L+3A4M
 3dcCVxBklXXqOwa4sTh1r1izBi7Sevo9z7nLg4MGIOKXTsEUcxv6tyjg7EILofPvpwarTeE1uq2
 MNjmyFt8lH32HJFUovfftdSKe0kdRooRWg3Cl1q0WjeHYaj/h9K8MPRLZrYg2Il8bHKZNj3hb/j
 9tWPq56CD0/NblFZLD6kprT7ofPU77Iht8LSFdzfuJSr2nrv4x1bE+PKk7Wlb/7o1jsBVyBs1Fx
 SS3xgkey
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689ef168 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=gFY-KEiRM8imJIGC6w4A:9
X-Proofpoint-ORIG-GUID: YEqyt2J9aoJ5OWz20iCzwcYEUznL9yMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
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
 tools/perf/util/powerpc-vpadtl.c | 75 ++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index e40d16d3246c..eea21a542b22 100644
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
index ea7b59c45f4a..36c02821cf0a 100644
--- a/tools/perf/util/powerpc-vpadtl.c
+++ b/tools/perf/util/powerpc-vpadtl.c
@@ -56,6 +56,7 @@ struct powerpc_vpadtl {
 	struct perf_session		*session;
 	struct machine			*machine;
 	u32				pmu_type;
+	u64				sample_id;
 };
 
 struct boottb_freq {
@@ -250,6 +251,65 @@ static void powerpc_vpadtl_print_info(__u64 *arr)
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
+		if (evsel->core.attr.type == vpa->pmu_type) {
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
@@ -291,8 +351,23 @@ int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
 
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


