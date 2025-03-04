Return-Path: <linuxppc-dev+bounces-6696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438BA4E3D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 16:41:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6g0851knz3bn4;
	Wed,  5 Mar 2025 02:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741102904;
	cv=none; b=NfBe9qnmFpkkmATEb3OZx/Svue1ihrKtaEVXjr8XJqYSkudm2XYqsAh2wk5FTg9dPHjrL+TEqCG5fMgnUmlioxoPpmFL3kRfn+loFRzMkgINxn6Jb1q/xhDvBMJ+cUczCGnK2db4lI1cf3gtoVG8BHAFVmZb1kM28MNFLpvhZzLIIwuCP21TWkf7t0jfkjbWvUUo/hiSfHpELY9Z25GFlT5tf0LZ+Dhii4FenSiq6VDluZJ6NMJRh8PPgR5fdDly6xgKLnvXDgZl4tGb1ZTfZuy9wjvDxemOOPnadNnFPGvyx3x5KlmqnPEnNB1P1gy7Sn2fPQDHZH2q0LBc8Ui3og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741102904; c=relaxed/relaxed;
	bh=e0up8sC3K+1Jkwt9G1IT+r16t01wOo+kIOHKgW+bXPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PjbRRcGQr2w2IJA/H9DX+MPaG+pinMYlkgD8GMlrjo8//zbi6BQO7fEAiHfd2p03MCUxkrV0uky9LyOId43Jq/m2kjHTXJPQlkE3PZCcc9VUKyj2KftGOZ2GTDtNC7zsVxz8wBJPsXR/1Ch1oEYaqT5cLyZ3NKMx+KAcafFnIO5AW/Z4g6Hjbib65D3Swy85CbH/gFIQgmWs0Px+9+scXejC9KHChEgPsi8yjf4kWrZSQM9hgTJYH0jw0SlltAaKDMs9cHCjlQ+6BjcX/IAxuntOcK04dCBM7OlfX63Bo7r9qBC5hCbyj1eJcadEj6zcmvwC7SUTAp3HwBW24z2R/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWU/Osjz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWU/Osjz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6g0760Wdz3089
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 02:41:43 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249XOYv023382;
	Tue, 4 Mar 2025 15:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e0up8sC3K+1Jkwt9G
	1IT+r16t01wOo+kIOHKgW+bXPM=; b=MWU/OsjzSl0A1MTUF78uiP09pzgUAKh7g
	1hkWyD/cq+u9ZPnbW7Y40iGp9HiRAX9M/9fdVzAnD3p99ioz28OgSOthpVJtmpfH
	w0jwD2mry9yH4ZeEY4g8tNPzVYCpcMyBtlZ0wmlpWmCUHS4Gl0Rn040eLi1Q0HBq
	/THFd//pDVef3GNbusORK2EZ0iPTSTcpvSyzjfRWilX44Oc5/Ey2pU+ONb15pOVd
	D0/xFakoCunrGMre2mVvSFT/zFbmDJk715wtquP8L0SYtDaIgOEHjQUrcgCoX7SI
	buO9FozaBVcVom9hxLxkdWaFM9komV9nF/gU+zzxS+m6+bwOg+lyg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455ku54s2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 15:41:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 524FMkS4015664;
	Tue, 4 Mar 2025 15:41:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455ku54s2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 15:41:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 524C5Evs013772;
	Tue, 4 Mar 2025 15:41:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2kp055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 15:41:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 524FfXuJ56688970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 15:41:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 153942004B;
	Tue,  4 Mar 2025 15:41:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A362E20040;
	Tue,  4 Mar 2025 15:41:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.255.217])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 15:41:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH 2/2] tools/perf/powerpc: Use return code from disasm_line__parse
Date: Tue,  4 Mar 2025 21:11:14 +0530
Message-Id: <20250304154114.62093-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250304154114.62093-1-atrajeev@linux.ibm.com>
References: <20250304154114.62093-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: wVeafdR1JO6tbHirHChUOPri3CYEYHXf
X-Proofpoint-GUID: rR1PsjPyJ_BAlfUrT37UR_mRAzfzshTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_06,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040125
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In disasm_line__parse_powerpc() , return code from function
disasm_line__parse() is ignored. This will result in bad results
if the disasm_line__parse fails to disasm the line. Use
the return code to fix this.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
 tools/perf/util/disasm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index a53e8c4e5bca..8f0eb56c6fc6 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -976,6 +976,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
 	char *tmp_raw_insn, *name_raw_insn = skip_spaces(line);
 	char *name = skip_spaces(name_raw_insn + RAW_BYTES);
 	int disasm = 0;
+	int ret = 0;
 
 	if (args->options->disassembler_used)
 		disasm = 1;
@@ -984,7 +985,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
 		return -1;
 
 	if (disasm)
-		disasm_line__parse(name, namep, rawp);
+		ret = disasm_line__parse(name, namep, rawp);
 	else
 		*namep = "";
 
@@ -998,7 +999,7 @@ static int disasm_line__parse_powerpc(struct disasm_line *dl, struct annotate_ar
 	if (disasm)
 		dl->raw.raw_insn = be32_to_cpu(dl->raw.raw_insn);
 
-	return 0;
+	return ret;
 }
 
 static void annotation_line__init(struct annotation_line *al,
-- 
2.43.5


