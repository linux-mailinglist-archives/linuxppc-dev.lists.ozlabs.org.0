Return-Path: <linuxppc-dev+bounces-14647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF54CA7D04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCMD3RZfz2yF0;
	Sat, 06 Dec 2025 00:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942360;
	cv=none; b=ns+Lw55xd+wmCk8Z+0q7xMHee+iT+A1R7SZ/IKPUzWfKQyZYmRiV8lw/cPjB+sOV1dr9QvuGekmUmOIIZDZ8tfHDHRw98vgKb8JCC/ist2c9CyBd/xh3TWmpY31GG6MIGDC+ZoEzhevH5bG4Vjs8eV5m/STP30rMhS+AMU2kluRMN97HzGWG/UnNqNzEAzKFyT63UtxJlTejO3uKRdBvFB7KPfnf+AV3/qZ4+bxhGoFbKQG4vI6RU0lh56T+UQS6+pH1xwr62V6jIDMqNqpIMrhwkorMsNWceSRzt0DVKVCkkOtoK04K4FgZVhpBucViNhWp+tvkfDy9jUq4OBp3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942360; c=relaxed/relaxed;
	bh=JYvvikyQkKtNKrZSvUfCiihX0MQfUvZ4A2G4qdiWaYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2ju9ZcmBgKD1o89x1Sf3zHhq9+u4L+gQ5QtffdsI/heAtMMk0PuX8tOKlGDZyGl4KnMuv83TKvytG8WPLCQAllFfqBoVbyS+J9ofDK8K5IO6QHzDxMflWecB2uGM3M9fCXJYhhe5Q1rQfApEXdaCmesjIZ0DDzdZixG7xLO4o/L2tDuQ2bOYiBRw8e86egF1gWg/dr6zvB62tYn08P9pYEvrySkn33kflvtq74E8I0J7WPYrSbYHSvmRZSQpSotzF2qRb8DXAU8aoTAsNjs4Sx0v4wfBdnL2jmRxUk4Td0dycdRkWqSuYB+PsTWgUvmU45fiOrbQpKPoTuVE4E1vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hE8Y7dIm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hE8Y7dIm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCMB71x0z2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:45:58 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5APLQ7002616;
	Fri, 5 Dec 2025 13:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JYvvikyQkKtNKrZSv
	UfCiihX0MQfUvZ4A2G4qdiWaYs=; b=hE8Y7dImF8M3KiSDujHVb/P009ND4jCM0
	DHTXX80ZSj2peYF7ReAbAUTErX6/3ZNPC8DQQL4DsJhrHXnpb5+akWCVTd0kYdpC
	6ypAvMHRSS7RlxarihSm1R6/JDBIPdNZGE3F11uGsEZtozTpWQPG2vozHDImOz+0
	Sqm+uZg0obT6ULoiurWuh5rVn/GTrRAcsHQpRkUSUy8+c7tKyopv5z5z6gGzxdFf
	oTp8297LpdGrDdPZRzs1PfMUcOgIHWwM/riR8y8/MlUawtS8/TBRTm0wL6oRuoLV
	su7xBQShEmx4w5EsWgVXV/1C3B8jnj2JCxBF+PWxUP0zJrvXB92lA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:48 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5DXbwc017700;
	Fri, 5 Dec 2025 13:45:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh7dyqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5BnA2G003834;
	Fri, 5 Dec 2025 13:45:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck59ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5Djhjm45089084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:45:43 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 575982004D;
	Fri,  5 Dec 2025 13:45:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E607F20049;
	Fri,  5 Dec 2025 13:45:40 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:45:40 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
        oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com, sourabhjain@linux.ibm.com
Subject: [PATCH 1/4] powerpc/rtas: Handle special return format for RTAS_FN_IBM_OPEN_ERRINJCT
Date: Fri,  5 Dec 2025 03:45:07 -0600
Message-ID: <20251205094510.4671-2-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
References: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6932e20c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=1mVJ_uiqAAAA:8 a=VnNF1IyMAAAA:8
 a=mIsVmt5rGckx9ddGVSsA:9 a=h67g7WpEjx8dfGT80pje:22
X-Proofpoint-GUID: zFWtLkZZ1spCPSctBynvjOUfaMab-X1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX5LX8gidQHPN7
 yYEDNYO7s6AMI+udpPZ5tuJ92nq9w+A3HkH9/VsLORltEnXz7Yf7iXZlVfPR6r8IVH+IvL20udI
 7myGIGDfiD8rM13VjA+nwHaYD0bA8pveVSTTSxleObGZ6GZeDmBuosI38XOkKIHnhpf3pWI1Fr/
 NCUtFMfQb6hYGXVwmCUAGYxzMMjBg5wk0RuO0LbvQshRHrTLl1pWwHhmOsr3U17B4lMHqNeDUbO
 6dHq373JIe+nZ7GSeTEakLvhQXBEQWFwg5sFjKai8UbbwDVtskoCfkceZGIkfGuoz8n7qP9NrlT
 F9ZqcBsHVN03ghZw1cZDey7qzyVJ/JPs6+Kl7eyDYx5bLhMatqDH+z16CH2molDP8L6HsiPxcDs
 4G1dD3JB7LEA4Tclud+kAU840YUn3A==
X-Proofpoint-ORIG-GUID: XklVvrKlvvDrazOtJH8DP9ZE3W_fpRVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

RTAS_FN_IBM_OPEN_ERRINJCT returns results in special format:
  rets[0] = session token (output)
  rets[1] = status code
  rets[2..] = additional outputs (if any)

Unlike standard RTAS calls where:
  rets[0] = status code
  rets[1..] = outputs

This patch adds special handling for OPEN_ERRINJCT to:
1. Check correct status position (rets[1]) for __fetch_rtas_last_error()
2. Copy all rets[0..nret-1] to outputs[] (including token at rets[0])
3. Return status from rets[1] instead of rets[0]

Reference: OpenPOWER PAPR documentation
	   https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 8d81c1e7a8db..04c8438aadda 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1183,7 +1183,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	unsigned long flags;
 	struct rtas_args *args;
 	char *buff_copy = NULL;
-	int ret;
+	int ret = 0;
 
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
@@ -1213,15 +1213,33 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	va_rtas_call_unlocked(args, token, nargs, nret, list);
 	va_end(list);
 
+	/* Special handling for RTAS_FN_IBM_OPEN_ERRINJCT for error fetching */
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
-	if (be32_to_cpu(args->rets[0]) == -1)
+
+	if (token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT) && nret > 1)
+		ret = be32_to_cpu(args->rets[1]);
+	else if (nret > 0)
+		ret = be32_to_cpu(args->rets[0]);
+
+	if (ret == -1)
 		buff_copy = __fetch_rtas_last_error(NULL);
 
-	if (nret > 1 && outputs != NULL)
-		for (i = 0; i < nret-1; ++i)
-			outputs[i] = be32_to_cpu(args->rets[i + 1]);
-	ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
+	/* Handle outputs and return status */
+	if (nret > 1 && outputs != NULL) {
+		if (token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT)) {
+			/* Special case: rets[0]=token, rets[1]=status, rets[2..]=outputs */
+			for (i = 0; i < nret; ++i)
+				outputs[i] = be32_to_cpu(args->rets[i]);
+		} else {
+			/* Normal case: rets[0]=status, rets[1..]=outputs */
+			for (i = 0; i < nret - 1; ++i)
+				outputs[i] = be32_to_cpu(args->rets[i + 1]);
+		}
+	} else {
+		/* No outputs: just ret is status */
+		ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
+	}
 
 	lockdep_unpin_lock(&rtas_lock, cookie);
 	raw_spin_unlock_irqrestore(&rtas_lock, flags);
-- 
2.51.1


