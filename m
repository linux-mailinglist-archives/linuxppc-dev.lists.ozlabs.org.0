Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE05F6555
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 13:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjqMX25cBz30Qt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 22:43:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQCw/wp1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQCw/wp1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjqLY3kgcz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 22:42:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296Ae425011367;
	Thu, 6 Oct 2022 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=bTRBm93w0F2WaBTEd/U8k3M7to/YHtOOTs0ZEXznUI4=;
 b=CQCw/wp1Hdd0xOxO9lcHPvYtjHfPs7+yNsmL+G+XCTWZWy6rmxdIhAZt9uhNfkr7gj5p
 AYm9UVN113Mf5YQpIQH/sV/ldFWFuEwPtVYceNuThlD1goHpPZnA37pZq/ONigPSmfdp
 4fT3e77zI8XDJxalhAeSt2wcUhyRFpNDiNl3OP862VQnhk7YEZNAthbEgBVWkZaghE0l
 9z8uLDc9LBomKpBHxd2Mn9RxBM2zazCPcaFW26MmWC4cq2JnNybH56ncrjPNOjF3ZnvH
 SjSYGnen83aEqamZFYDO2B1ltEY2/862lfBAxYjpp4dVN37z1Nl3+FZDO+edMLIYt6eU 3A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1vm4jvt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 11:42:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296Bb1o1028812;
	Thu, 6 Oct 2022 11:42:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06fra.de.ibm.com with ESMTP id 3jxcthw4f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 11:42:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296BgUpv1507978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 11:42:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2A1DA405B;
	Thu,  6 Oct 2022 11:42:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30661A4054;
	Thu,  6 Oct 2022 11:42:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.29.124])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 11:42:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH] tools/perf: Fix cpu check to use id.cpu.cpu in aggr_printout
Date: Thu,  6 Oct 2022 17:12:25 +0530
Message-Id: <20221006114225.66303-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lSogSH7B4kP3K5tI7OGmOZ4kMcZqpUBm
X-Proofpoint-GUID: lSogSH7B4kP3K5tI7OGmOZ4kMcZqpUBm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060069
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf stat has options to aggregate the counts in different
modes like per socket, per core etc. The function "aggr_printout"
in util/stat-display.c which is used to print the aggregates,
has a check for cpu in case of AGGR_NONE. This check was
originally using condition : "if (id.cpu.cpu > -1)". But
this got changed after commit df936cadfb58 ("perf stat: Add
JSON output option"), which added option to output json format
for different aggregation modes. After this commit, the
check in "aggr_printout" is using "if (id.core > -1)".

The old code was using "id.cpu.cpu > -1" while the new code
is using "id.core > -1". But since the value printed is
id.cpu.cpu, fix this check to use cpu and not core.

Suggested-by: James Clark <james.clark@arm.com>
Suggested-by: Ian Rogers <irogers@google.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Ian Rogers <irogers@google.com>
---
Note: Details for discussion on this logic:
https://www.spinics.net/lists/linux-perf-users/msg22473.html

 tools/perf/util/stat-display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index b82844cb0ce7..cf28020798ec 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -168,7 +168,7 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.socket,
 					id.die,
 					id.core);
-			} else if (id.core > -1) {
+			} else if (id.cpu.cpu > -1) {
 				fprintf(config->output, "\"cpu\" : \"%d\", ",
 					id.cpu.cpu);
 			}
@@ -179,7 +179,7 @@ static void aggr_printout(struct perf_stat_config *config,
 					id.die,
 					config->csv_output ? 0 : -3,
 					id.core, config->csv_sep);
-			} else if (id.core > -1) {
+			} else if (id.cpu.cpu > -1) {
 				fprintf(config->output, "CPU%*d%s",
 					config->csv_output ? 0 : -7,
 					id.cpu.cpu, config->csv_sep);
-- 
2.31.1

