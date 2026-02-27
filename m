Return-Path: <linuxppc-dev+bounces-17319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E+1B36woGnUlgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E81AF409
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMNhY0qsQz3c1J;
	Fri, 27 Feb 2026 07:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772138605;
	cv=none; b=iOiMGLcR4GYTgVTrYGVEziUTx2obCpczf7KpN/kCz6b9bHE3MZK0Rrd9syCfDS/A7tyY8TyluwC6EGBm2KFkSTVJLNpoEcW3QcgiO7k6OMFeZyzSlZSqjPviOxBa0/bWCHieHVlyUsA3vx6EXx6mMDiDHGJVMFVIWNHLRFpMu4I4efIO4ehzUdE1YE5U+fPikTd2JhByDsq+GSbvR6AxiRrfuTd+15qWcGqwyCD0GoxPBu7Img4S4ei+LkiwIJ/ivQbaDs77ao1geJCFsfHkmRiwAtcRbRaOpFQzcZrzDRuNTDlgO1X7fao93INYKhC/Gug7/7utV7dv8xjj7I+YcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772138605; c=relaxed/relaxed;
	bh=DbXC/ZebeVH7ZcPCmroeYdy31zFjUQNUMhnkXY5apiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNoHHS0caKImHeJ9PAgw1he4bE0xgQz6UcKy01j+l9he6p04i2SvIsd9RGXgu0W/VeIgmv1ZGzR6gwkBaEi9oyon6cyo7f1TGsl3xdcKxj8s3FsPOKAwyZ5U/wOlZfU3IHkVkHhRthZgRJumvThLGiyVft8UOnIMfNXfm5PF8rEqRfIqGB4eMc6U8PqvgmOXIJaPb+basReuerVc967fGfzDqtQvsdMBgR5rogLbOAgKhBNaJsvE/KqqL8wngh0myMU+G5cMUuzzeiVkJx9lpGvu89BLVZTa7+D1YHQp4AEajox3iVxDT01IQM/rKSqx0GrvNUFRY0I8bDAEcWTMmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGp5BP1j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGp5BP1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMNhX2r2yz309S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:43:24 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QDj9cL1677775;
	Thu, 26 Feb 2026 20:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DbXC/Z
	ebeVH7ZcPCmroeYdy31zFjUQNUMhnkXY5apiI=; b=QGp5BP1j9NLoRw0qyKtnVl
	bspnSNAk7XMaOBMCVl9zjD2yCdIZJe7npRkTp+zNeOuEE5qEViQdORH9y8ffOSs/
	IBnlawTMNYgvjVEW4qzsH2DVeKCROyiiIX0gU86bA2oXZCxp/r/p6P0+c+Do3Ctr
	pYOOxDLQp3KJQ0ZshcZsymZe9rinUgMTBOJP4E+zN+46Wmgu4+ej/2M/IGH9gr1P
	wow0ZUMv2Zbww2Hv4erGbjhtnqKt0K+JL2Q2Tlj87YEb1k5ZNqTQU9WnqvMPW//w
	c6Y5bQ931s2x5eJUrsQAh/wKZ8KxgBR4YxIKRv1MVW9KZMEM/1RJtc7+Rl1UhWnA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34cg3cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QKbwW7013406;
	Thu, 26 Feb 2026 20:43:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdye4kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61QKh5r150463086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 20:43:05 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B20220040;
	Thu, 26 Feb 2026 20:43:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E87E20043;
	Thu, 26 Feb 2026 20:43:04 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Feb 2026 20:43:03 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 3/4] powerpc64/bpf: Add support for indirect jump
Date: Thu, 26 Feb 2026 20:43:10 -0500
Message-ID: <20260227014315.39980-4-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227014315.39980-1-adubey@linux.ibm.com>
References: <20260227014315.39980-1-adubey@linux.ibm.com>
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
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NCBTYWx0ZWRfX7YzVqwXqsAZG
 4jXZjhiAoVO0129rfV2eiLIWt7qWw2yx6aW8vjF/OKKbDTEA5ls+QdrgXtpI8lupc2BT4g3V7Xd
 DCE82bVXgvrmG0Z7HT0Bcn2X46O6pGPHK/jyk/1Lsi364PCBImHT9aRbrF89XDkChOJz7K1CqyH
 xbUWLlakYUfvMzX8lxbvGy8ydO9oTcZFr57+VzJbHrA/Ct4h0gBv5n4QLXvhFlwThG15ES879jm
 qXcTOg3vcA/w80zfO0F70Kh3gAHL9co+B1hWzdOdX/Yt9JuYovnmcj6/nBMg9N/MkLIgtlwttji
 d5iI3dMd6CZFh1EmODUUHQ0M3ZQ0qnezBnVXlVwrA9VFsVrbtZnAcAdzjO9ghMnR0ynTCJE8PV3
 XahyX3+COo5VT81w5hcP5UnFEnbiRw5qJ0I8LAN4QdUm9TGBDTzbQfxAHIhwaHMqnR/LLTOronP
 PAZNG+yllEE/WmRfZTw==
X-Proofpoint-ORIG-GUID: wVhKXsKyf0GQtWjZCFVFVa-DW-aUrCAf
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=69a0b05e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=qf4gfuq51q0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=_W6WOvRXMcVY7OADHKgA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
X-Proofpoint-GUID: wVhKXsKyf0GQtWjZCFVFVa-DW-aUrCAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602260184
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17319-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3C7E81AF409
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Add support for a new instruction

	BPF_JMP|BPF_X|BPF_JA, SRC=0, DST=Rx, off=0, imm=0

which does an indirect jump to a location stored in Rx. The
register Rx should have type PTR_TO_INSN. This new type ensures
that the Rx register contains a value (or a range of values)
loaded from a correct jump table – map of type instruction array.

Support indirect jump to all registers in powerpc64 JIT using
the ctr register. Move Rx content to ctr register, then invoke
bctr instruction to branch to address stored in ctr register.
Skip save and restore of TOC as the jump is always within the
program context.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index c1d011046d8b..2cb550ca1dec 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1627,6 +1627,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			addrs[++i] = ctx->idx * 4;
 			break;
 
+		/*
+		 * JUMP reg
+		 */
+		case BPF_JMP | BPF_JA | BPF_X:
+			EMIT(PPC_RAW_MTCTR(dst_reg));
+			EMIT(PPC_RAW_BCTR());
+			break;
+
 		/*
 		 * Return/Exit
 		 */
-- 
2.52.0


