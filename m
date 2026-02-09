Return-Path: <linuxppc-dev+bounces-16725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF5nLbSfiWlU/wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C510D34C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8dfb1S8Fz3btw;
	Mon, 09 Feb 2026 19:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770626967;
	cv=none; b=MZDcpoOjiDMvg1zY7fUxxD6fSmPDC6YNI232E+swk6y5JB4Fuy9mDlfK7QlSs2ngtdhhsEcq9tGQBOdcxoRRWPn4oHbH7ok8c4lDxNEipaDZiUvYILXUK8guRsbk38swdA+99vmBQu4J490PX6Y2EhJpzTu2OvyJ6kdUUN9wY/v/kAsREKttC2jGaQVDvgAxmJbMl0cOYGgiizC1BW8C/csP0qOgoprDWZIkUVQBZqoztisdaq38cmK1Txfau5bi5x8z/fYd210PQWFxyEQnlComCCqbne133S8LbA5YUHtn1Cyroi6GukEGzB0ft+tAQWAk/JNO3/i2Toz0/Gz6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770626967; c=relaxed/relaxed;
	bh=mdZpntruiqLsnnXGWS5ds3iTzhGltfz08W0xIBP0Nis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSXTEHgYA6N9F2TKt11gziYlG0eWRA4KMQW9Z26gayEUAlPk/13KrH8bLw+Ru8vYJNi/+vDDBRKzIl4WuCK3RfBfyAVlWdwcvPursTH6SX5nhyfa55hSspnBMC1T8GZDdY5upJZNvYQ1KAhalooNYyWFywZUNm8zRx0K0ON7dsO67Js+N+sOHr9310kaS24zNJEZw9WErr21g7sgN1LC+qlV6Gn07wJJEvVlTmlTHi9mJ3sgaX0zgsdEVGNc7gAI0SCWVH8jelFo+ApCAJw4zfZxHTRRd7QgIQPNsmZ+AAUF+0fet+BEs80yfOz/b9yhi7ZK24TxAsA8zslnhPJCCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjmE4si6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjmE4si6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8dfZ1YYBz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:49:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618LtJwu331321;
	Mon, 9 Feb 2026 08:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mdZpntruiqLsnnXGW
	S5ds3iTzhGltfz08W0xIBP0Nis=; b=UjmE4si6ptdCGowetvoQvw1lR2DXJVSol
	xqMJSTwQVyLe6yBnvGw5kUg6IZdMvpoDOqj6F5rGMeN+G1J36j+rTIEEf15IuHki
	VavkbtG4UxeNUCMQuJBm/rQ7gVpfNVCrvpCtk9XeNRhPYwPJnUkcXKw9RgPW7dr7
	nxeSiNiVxH8e2E1nny2aRrLG/95kvkBZdy5XSKxJF4cmBH/oeqM2A9l8h7hNwOGG
	rIblDImAYJrT9NUKp5HXB0cb8UNlnnuzT/YhKtDwApmBqtSYPygpLZtULyVS/sBI
	35UJ/++zNkEshykaQYR5fmHg8BwGkd0hVhWHK+wyBcdAZBH8EJhaw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696uvyee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6194oHie001825;
	Mon, 9 Feb 2026 08:49:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6je1v5kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198mwWX28967506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF56220040;
	Mon,  9 Feb 2026 08:48:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2AAF2004D;
	Mon,  9 Feb 2026 08:48:54 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:54 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 3/6] objtool: Fix "can't find starting instruction" warnings on vmlinux
Date: Mon,  9 Feb 2026 14:18:17 +0530
Message-ID: <20260209084820.57298-4-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209084820.57298-1-sv@linux.ibm.com>
References: <20260209084820.57298-1-sv@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1TPwQzylPSvBZ7eiikEEW4WWFGapK_b2
X-Proofpoint-ORIG-GUID: qqryV2YEGOyoLgrM3ibQWZzp4u3dBsrU
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=69899f7f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=7w6QjbFeSYXBFb6lQ1YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfXymowdVw2GDQG
 O0mtY8q6Wb9N/x71F23493QWqd4SqoRc28duIC3MHZGIRZD5t+z+qPbxds5IFrsnZ6Qmfd1PiQP
 lCaP0YdJC9TuvPIwq7eRg5O1z/T2RTlcKc+M5sV/dAG7aktkO6z0GvLrj1lXmUkCNLer4Dl9RIe
 vumxk2Bu0QsrEPfeGb94BrWam3XYAMB8WnLBV9/TLLH/kgBOaRBkFWFCt47t8+3Yq9D3+9NkFVS
 35bZlC616cbPvvNEXwkHMncpjPYfGy6UqmSj4dUpAlQaQV8WolmCV/ciM6ujFwxaOhnzUSYfytH
 6h/RM0Vl+DZS0oHZQKFcbA8dgKok0uNdpctUvTglu5oBfC0VoI/TN72kJHCoOdpu+1gmlqCxnji
 lZoCmRJS2S/GefWlNlKJMi7ZsQT/r9iaj8mFJdrMAs0fTwBmYE9za24VobBL8q9TI54HnOyFIxP
 1pWa+EELaoh6hfvfeEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:kees@kernel.org,m:naveen@kernel.org,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:npiggin@gmail.com,m:maddy@linux.ibm.com,m:segher@kernel.crashing.org,m:christophe.leroy@csgroup.eu,m:mingo@kernel.org,m:mpe@ellerman.id.au,m:sv@linux.ibm.com,m:nsc@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16725-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DB1C510D34C
X-Rspamd-Action: no action

Objtool throws a lot of can't find starting instruction warnings
when run on vmlinux with --ftr-fixup option.

These warnings are seen because find_insn() function looks for
instructions at offsets that are relative to the start of the section.
In case of individual object files (.o), there are no can't find
starting instruction warnings seen because the actual offset
associated with an instruction is itself a relative offset since the
sections start at offset 0x0.

However, in case of vmlinux, find_insn() function fails to find
instructions at the actual offset associated with an instruction
since the sections in vmlinux do not start at offset 0x0. Due to
this, find_insn() will look for absolute offset and not the relative
offset. This is resulting in a lot of can't find starting instruction
warnings when objtool is run on vmlinux.

To fix this, pass offset that is relative to the start of the section
to find_insn().

find_insn() is also looking for symbols of size 0. But, objtool does
not store empty STT_NOTYPE symbols in the rbtree. Due to this,
for empty symbols, objtool is throwing can't find starting
instruction warnings. Fix this by ignoring symbols that are of
size 0 since objtool does not add them to the rbtree.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 667d95431793..92fe5dc05cdb 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -492,7 +492,11 @@ static int decode_instructions(struct objtool_file *file)
 			if (func->embedded_insn || func->alias != func)
 				continue;
 
-			if (!find_insn(file, sec, func->offset)) {
+			if (func->len == 0)
+				continue;
+
+			if (!find_insn(file, sec, opts.ftr_fixup ?
+					func->offset - sec->sym->offset : func->offset)) {
 				ERROR("%s(): can't find starting instruction", func->name);
 				return -1;
 			}
-- 
2.43.0


