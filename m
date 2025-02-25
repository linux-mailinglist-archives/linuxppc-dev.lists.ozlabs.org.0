Return-Path: <linuxppc-dev+bounces-6460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B859CA43DB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 12:32:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Fnc1GSVz30Vj;
	Tue, 25 Feb 2025 22:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740483140;
	cv=none; b=D6Hc7PxIOavA0Y9gl499g+Bf0zxUTtEUDd3T0/TLsAirFVvmtbFthJ4Y7kvhQokBBfhfuca6TSRWqVVNXpe8R9DbSoiiW6wLfsPFWuoSvXBKYkUwtjd0g3clbRmzwoPYF/xvpVOzM9dHtg/62J0ayYZXV/HsnO6JMQdtf7LiVX8E+IUZ5je1ikuL/U5HTx9U+gcgXLlQ6m7jl0lRlUUJx7x5GSqoNsZ2DZAN2o/eczgAp/hgGA7/ASVGt9IgErbJzwG6YJBJ70o3nhsRVWRJ0ha9FqAWz+Z3XBvQ/1bAOZ0UXJ7o1palr8Xf6V5N8GTD0ZrLaEvNiGb3OEOH99Yb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740483140; c=relaxed/relaxed;
	bh=KOwvuY0CgjqpsCL+QoA3s0182moYZeyhuRB4GmTf/uw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYRFBMrasRaz1DiPBRdKnvyvCk2kU2493JYuuNHuqTrNuHk0gi5FzOFzm8tdz3JKOyR82R9tfdbifNQD5qx9Z/LOvBbnSwVaRnvjXb5bZ6ix8bOSTx5yQkzstJ3AwECJcL2ddLKQnTba9BQiESJs5Mn+N2vr3Yc0OY8DPO737VsPxMQUyTnRxKOrm8Ozk5dZrHS5MuwNuSCEGG9QBHWoeMl+SgxNiJrkzyskt96qciQ8MThLlrN+gn6zaLj8dKQtK6xbh1fZzhByfkZzzQKC97zGfS8tplnEJf7F83h+SeWtpnjdttdYCZVuAbewNR7zzJHetklxFKW6ySoWS5WKug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c2nz6E2S; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c2nz6E2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2FnZ6tlHz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 22:32:18 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMnHwv013022;
	Tue, 25 Feb 2025 11:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=KOwvuY0CgjqpsCL+QoA3s0182moYZeyhuRB4GmTf/
	uw=; b=c2nz6E2SScqWRGBOpiEhGr8NCGLF8kGaHuC935w7BVCMXD7lPxDBuU98I
	bhUkXsdyN41FQSpesn3jjV1cIYXCOkKxvT6W/0DDZ4NIUwpGHP1UOFIlDZHMlVuf
	CEQcy/43AHi949JQYAEEpUiUpZ/ahLh57+RqG1KEzRD3BFSipC1PUN7ZhsvmjnoH
	5rRaSyfkwwEacNzkbFXIwnTnBr/+tbdGWmC9L+AsMm95tw34/X3GWxzAXOry4OeR
	WERqwP3SdANenhJJEWpJJQjP7om4khhBF9rxnfjtFuh6vHsKkwkPZmkQTvMZCW31
	3F9IcZw7bw5WIx97wYTLcLrpU6/IA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4511waax5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:32:13 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PBU3W0001490;
	Tue, 25 Feb 2025 11:32:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4511waax5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:32:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PAlsAm026964;
	Tue, 25 Feb 2025 11:32:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdkch4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:32:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51PBW7kU58130746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 11:32:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54E9320043;
	Tue, 25 Feb 2025 11:32:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BA020040;
	Tue, 25 Feb 2025 11:32:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.248.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Feb 2025 11:32:00 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH] tools/perf: Use perf_tool__init() to initialize default values in builtin trace
Date: Tue, 25 Feb 2025 17:01:57 +0530
Message-Id: <20250225113157.28836-1-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tmyErrajOq3rnIFzvNbrZGWkNGgSrovL
X-Proofpoint-ORIG-GUID: A2aA0qkMZcXtBKRKqnx0Bzl0kiey4Dg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250081
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Perf trace on perf.data fails as below:

	./perf trace record -- sleep 1
	./perf trace -i perf.data
	perf: Segmentation fault
	Segmentation fault (core dumped)

Backtrace pointed to :
	?? ()
	perf_session.process_user_event ()
	reader.read_event ()
	perf_session.process_events ()
	cmd_trace ()
	run_builtin ()
	handle_internal_command ()
	main ()

Further debug pointed that, segmentation fault happens when
trying to access id_index. Code snippet:

	case PERF_RECORD_ID_INDEX:
		err = tool->id_index(session, event);

Since 'commit 15d4a6f41d72 ("perf tool: Remove
perf_tool__fill_defaults()")', perf_tool__fill_defaults is
removed. All tools are initialized using perf_tool__init()
prior to use. But in builtin-trace, perf_tool__init is not
used and hence the defaults are not initialized. Use
perf_tool__init() in perf trace to handle the initialization.

Reported-by: Tejas Manhas <Tejas.Manhas1@ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/builtin-trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index f55a8a6481f2..092c5f6404ba 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -4589,6 +4589,7 @@ static int trace__replay(struct trace *trace)
 	struct evsel *evsel;
 	int err = -1;
 
+	perf_tool__init(&trace->tool, /*ordered_events=*/true);
 	trace->tool.sample	  = trace__process_sample;
 	trace->tool.mmap	  = perf_event__process_mmap;
 	trace->tool.mmap2	  = perf_event__process_mmap2;
-- 
2.43.5


