Return-Path: <linuxppc-dev+bounces-17125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFlXI7QFnmmhTAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDD18C4CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL8390mcgz3cyZ;
	Wed, 25 Feb 2026 07:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771963813;
	cv=none; b=YeXZZ0al54IIREiYjxzNiTaJQsCfLUpFszsWZKQA3ZmQeHPEhIhFzBqFeZvISsYRMs9qldNwnyOW0OpMS8N6nFT50AyanDzp6rlFRvQvlwn9feMFtm1Suck0oyW60R2ZdSeJPuF8gn3OvhBvZIxSStJQGmJ21upAD7MQvrjYwjPwycjJdeVpFRzaUzEPinEveXtYDk9bHdNPuGbRe2yxI5PvE1JYjpZ8TjQKZD9E5JhRj7JLQoE1j7QC72YczcL4+VqQnIhBStD+h8jVL1+XqEcUYgps2Wmuw/7zNyC+TsNNiajy3OX733DE8ZUkXZNBfEOttqryapN8QlXwnoqR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771963813; c=relaxed/relaxed;
	bh=kC8H0PEdfXYyKnAPHiJszHn1jKV1YYA3ikR0P5y6cHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuQtk1mT8nsspvnunpB5rnxs1MrosvaSbkQVIaXqDZWUfvn3R3uq8vItwQX+dMV4tdCenodqXiXZkglqVjpZvoCZi+x8TsXMgqzOaVV5FI9vD/91J+z3HguX41cYfEidw8q+MJ3yKJljuJ0rMj8DWKo/AGKgtOE4TfCZhBP/KNIDN3+MWuZRysrrIQYIHr4vF1RD7nZNp40GJTWrRzbjNv72Xu+M47gCBEqz1i9cFjvPpuxUCo9AXfTvLM2n/3yAb8YJXqoUZryABiX5LlZ4EIaor3F0EC2JhGMXIEM2QYPvYRaGal8tZV8HFsATQcZp5RXfPfuzNRHWqSok7N6cKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OddVm8Cl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OddVm8Cl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL8382t4tz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 07:10:12 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O9XIDm2648089;
	Tue, 24 Feb 2026 20:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kC8H0PEdfXYyKnAPH
	iJszHn1jKV1YYA3ikR0P5y6cHQ=; b=OddVm8ClqYmp4W/eom8FteSTXwYMXwvUb
	uCy2/vi4fAxrU+HRIV5JzYdn/VEZ+tTTsbHLXN7HtT/CKHB01Em/syO68RM4vvm8
	8OliflQL778dAD9Vz/vELTpTmdK+tSTSebabR7Pd+Ge909ch6BNqkK3xQcezYm8x
	JL92NaFdP8MSmio+no3Quzcn/0NnMedOx0+KiuUDn2KhGgWhInrN4em5TsyuCUAM
	PV9DYL942gn2IDT9Absg+uqhGEuRNjsNytfE/36aSc4cH5J/jY1la5N25AlDPpgK
	g4xC8alYuRY4AoA8hoMyaPD1smwkTNLPw6M/Oux+8PN+RFGdP7JXg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34c4t6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:09:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OI2MIK027887;
	Tue, 24 Feb 2026 20:09:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr1t70c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:09:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OK9r3G55771610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 20:09:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8148020040;
	Tue, 24 Feb 2026 20:09:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC44120043;
	Tue, 24 Feb 2026 20:09:51 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 20:09:51 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 2/4] selftest/bpf: Enable instruction array test for powerpc64
Date: Tue, 24 Feb 2026 20:09:30 -0500
Message-ID: <20260225010950.20218-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225010950.20218-1-adubey@linux.ibm.com>
References: <20260225010950.20218-1-adubey@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MyBTYWx0ZWRfX+Tyo5BDmryxG
 we2lBeWMRdN0rPIQUgR/5/fW3BOuG0CVij8u1FoysflftoE9TnREt3ZI8KUcRebKAWdYSgtA2eR
 tro084MCt/J0PG+JgDaGvJ0+8JY4fKKstFeTpL4qFj/kHmesKG/gwFsKRUd5usnvME4oBGwN//6
 qMxS33wzkB+Rw0WQ/R78Gfa3Ch51EqsMl2EN0Ob2z1UrQfzswpLxarvcZAZZPKh6/c/mKlPdHHu
 Zd2334G29KiNqjgXSosY+FjRsw7mYzZWe7iE5z9yKZ+6Yxj/dmjae+5RLXOGTIRNmphpDp7qYw7
 gE55W/Vb9WfHNKLdmojlyceShEoBzg9Jl+one77SuhDVuCdd0hjeCV//a//dptHxC9NszaL9Uy3
 c0LNWtTco3pU4whMFcf908g6iic/7NPLo+yGwdwJ7nTTXMQQ1Zv0djmINTw3zFhqqF0Dmpk/84w
 68Lg302r8etp95e9wwA==
X-Proofpoint-ORIG-GUID: Wsp6EfrkJ9V3zDf6krm32ch0PnrlsN3J
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=699e0596 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=Dg5FhV6KW9bU0H1UeMMA:9
X-Proofpoint-GUID: Wsp6EfrkJ9V3zDf6krm32ch0PnrlsN3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240173
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17125-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86DDD18C4CA
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

With instruction array now supported, enable corresponding bpf
selftest for powerpc.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
index 93166c2da8e7..57ce6943fcfd 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_insn_array.c
@@ -3,7 +3,7 @@
 #include <bpf/bpf.h>
 #include <test_progs.h>
 
-#if defined(__x86_64__) || defined(__aarch64__)
+#if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__)
 static int map_create(__u32 map_type, __u32 max_entries)
 {
 	const char *map_name = "insn_array";
-- 
2.52.0


