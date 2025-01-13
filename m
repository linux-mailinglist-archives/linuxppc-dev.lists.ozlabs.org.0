Return-Path: <linuxppc-dev+bounces-5171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4988AA0BDD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWygf1jYxz3cdh;
	Tue, 14 Jan 2025 03:41:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736786462;
	cv=none; b=RJUf0k3Dw/7m2U4BTLuIinh7KVEJl4fom1atpXqh5iuq++9t300Rw7ou/ZKSk+BnczFIaJ9WdGA0fwpDngMhOUqDyd1k7BPsLxy8XUwzW/gmEC3Xm7f4zth5V+bko0JC50jtGr2ymy+ZQLpm2yLZqX3nkI0hpw4o7lTElafgMDMfNcE8i1AfsUk+T8KpvM3J1hNaaY2oO+sM7SvjQX4x9kTO7Y+m9b9noSNgVypsz79Yf1JmOOE56QTIbOw/DsBF6tGgJz05GZGPFMOTmBuKvbmspg7BQJQUqj1nmrWXxbwzWNI/TMa8l/XjoYJqjNYnBfY55dgM0wOf9vTiOl6m8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736786462; c=relaxed/relaxed;
	bh=+56sXW5cvb4SRJIQXhu5dD2c6leOlZPo0B2gUvq89ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=edGCnn4B582AP9fHMkk/wIuMCXHWYWRbNHNENs0hpw1qoD4NSgn1mvgBDAvuVX3L39cfk6r2moeLqP3IWNpO6M3LzWoZIldMz8hXCV6+BK9MHX8ubaXfV1px3XaHlNcTxU0EgDjD/qUzO9AHPoUcc4qTB7i6ImTqIJ9tFsZSoRca5h6lNY2ZcjioYLH1k9Mq0SxWVLf+/bxr/STQQ0nIzyaBJA4C/Ti1bn0DKrNTebpyyUlTnPg9r+tPDK7pE/45krvOmGFj4yzHugpIubLkkD2/pKL0W+ncA2chJZY9wezVkKBS+40gwpf/ETgdfuy0SfSHxkSFEfvx5sq2eBLPsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PGiOirgl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PGiOirgl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWygd3m3dz3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:41:01 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFRw3m003381
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+56sXW5cvb4SRJIQX
	hu5dD2c6leOlZPo0B2gUvq89ps=; b=PGiOirglcL3sPBpHRkpGwNBQfX+SrcNKx
	v/37jSXCezslJTwdKWvogHM2AE5LC4a9mvzO9+mORSCZ8oDYlI+WdkZpIYOmMEuh
	DZebrTKXpQIPGLlcQ3Dv9anaYlxqiTBGcNlKipi6TCrop4APAcRpAbA2051s8OTr
	WVt8FvrJf8TrrlnfYlbzgO9+deybFFvbsCr0ZUFlzi9uhv4t5+Hk45gZ6IMRn1wW
	jO0mMc/pVxMUtP062LowJz++nvFQJ8VaRfHM4tg7qyAKt/98ooLnzyKfhIJLVMlg
	X+sQ8GrXH6DBnPTkGAPqhkqqLMqUd7MA2mAYFeVzsw/MsRp9CVh+Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uagu328-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGAmgt007462
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ymy368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DGesVb63701344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:40:54 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE3D2004F;
	Mon, 13 Jan 2025 16:40:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A61FC20043;
	Mon, 13 Jan 2025 16:40:53 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 16:40:53 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 RESEND 3/3] powerpc: Document details on H_HTM hcall
Date: Mon, 13 Jan 2025 11:40:39 -0500
Message-Id: <20250113164039.302017-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250113164039.302017-1-adubey@linux.ibm.com>
References: <20250113164039.302017-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: dxO-6lRy7q_6_wUng8HCA8ZCBikV3ZhG
X-Proofpoint-GUID: dxO-6lRy7q_6_wUng8HCA8ZCBikV3ZhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130135
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-3-maddy@linux.ibm.com/

 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.39.3


