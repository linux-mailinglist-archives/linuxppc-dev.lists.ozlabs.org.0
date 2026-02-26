Return-Path: <linuxppc-dev+bounces-17217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LJPKfyBn2lrcgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 00:13:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C171C19E9CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 00:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLr3L6jxQz3cBW;
	Thu, 26 Feb 2026 10:12:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772061166;
	cv=none; b=YXCQvSz+FWTMvWmAZHCICX8b4EukiRBsBqpqT75kxpUwFqygP2c/mC7h+5dCU7YRfhXvQOtevcAuUdW7SiAeWzN3dIMpTShhzVLHboKyXwhga/8pnuBy6SO2Wh0xTSvVuCLAMxWwZdkT/ytMTvAJ9XvxYAO7zwuE/mQfjPyVXzoOlE/T148oagzUF787cChDF3l/Ba21IbHOCtpiKtjPZTrlURNtQMN5lFYI5ew15r2vX8grNJM9BLzKANvoZKtxOgq4fuIUdIug/CcYvZS0MRKZGSftlKv/nsN01DDvqixdnMthZafUD3bx/FsW96n0Qv2yl31OT9W3wkPZTRHX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772061166; c=relaxed/relaxed;
	bh=FO99Tw7KP8zdc0ZgvQFOtexMC64CYXyKORCEbrJ3Hh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmgkQLgRY9SFstIZS1LatkCQ4RUeSjjl5B3maTS1gvrGfSmHEZaWhAkpDXxPS5LNpC35BkbCqfN6l+oOuOxVEK24SArB1REaNqiFL8iLw/yUrH8GtaCxgIsTW0u8atq0jqk1RA+QeO380oPlU4e1wCZfiU4Mcgkr8uFt4VwmOG9Ghxk+HoTnA+DtM699zO509K0QwDH2A7Y3bvxBciYja8yI7Va6tBr2Az43qSwviFzSl+DX+zt/ftDmfOYy6EgOSK1lI8etMfrZgspk++f7cD4FNAnHIrhkjdXEPV0rE5Ko8Ts1oj8bcBOFoSJMnuB3H35oIB7HZ2ZWh8JO6Yq+4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KKOf80v4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KKOf80v4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLr3L1JjVz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 10:12:45 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEBQvJ2849182;
	Wed, 25 Feb 2026 23:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FO99Tw7KP8zdc0Zgv
	QFOtexMC64CYXyKORCEbrJ3Hh0=; b=KKOf80v4azS28UAPvkfIrS0287nho5qPD
	2w29PH9pkrxOOBHWtioQ0qmfvY4S/VnNtwQJTgu5nVivGijki3/PLKSP27Yxdoeb
	vwo7hNen84fokeB023mc0NGnr3wZoIsrUDDZ/Bz33V+u6YqRsFLshEOgDLM3NJ4Z
	X5Ek877V8bGUnxJjcWTxSX/hXRKIa8cZv/coH1V1nX6XK/EWriwwv3L/3MxKW+9i
	AtqaJOSjJSEuUjUBnn4VuKoqnWpmqy8m6jdP3zF3A6SVvNinrj1kbNtQPsV7wq6O
	GvehINlc6Uop8MnbiQ+Znuxtu4rRGzvjObFM/Y5LKxB/QH7PTkAbw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24gjg24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 23:12:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61PJkaGP030342;
	Wed, 25 Feb 2026 23:12:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhkfvu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 23:12:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61PNCQ0w50790814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 23:12:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 495D020049;
	Wed, 25 Feb 2026 23:12:26 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B59BF20040;
	Wed, 25 Feb 2026 23:12:24 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 23:12:24 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 3/3] powerpc32/bpf: Add fsession support
Date: Wed, 25 Feb 2026 23:12:17 -0500
Message-ID: <20260226041217.18059-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226041217.18059-1-adubey@linux.ibm.com>
References: <20260226041217.18059-1-adubey@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=699f81df cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=_ySWqCA71J16aY6q5SMA:9
X-Proofpoint-GUID: hxDGXg3X-PbYF9CewQESPQZjNc-YwS2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyMSBTYWx0ZWRfX0p9LnbgkihbS
 8YhSZ1ig+wmtg7GDuRaGePQJ6V0GeyBUOktyFrfPDKsrMB1wFFi4rWrJ3mbDYjTfZ3rCvsEkjlc
 UvODbjKOXinW9T0YLMaSPsGC0wrLZy4lZdzSKCJKIHT4eUJ+Oag7Wkt7vwIgXO7S8RDZcPl1Xxw
 9gnbjCEHZVcIgaoBE3YEGTxI34Jc1FtBW9hEi2C1AJwOrUtjGvQEhx1Un+LXa7CgVnoZlCw/277
 zxfOBapfXOJNr9NP99mPQnNw94aAS+ijZ5aw7zeCl8L8sc3nlUpdboOjjCPWyeBoaB36WnWPRZk
 ep5m2pf86QStwQKkzEsBTfr9B2mg+YwlxPe9dBa72ffyx02WjLCC04Juf/TzxWmWVxjyDfxQVuR
 xxagtfw5MGkWQyS2X63snznnaGtaKopLkojCwBk9FMvfgPpp5Z+DSJ8lm+F/4mgRlPLD2ftVQQb
 CjS/q4FFNHSCHvJUaZA==
X-Proofpoint-ORIG-GUID: hxDGXg3X-PbYF9CewQESPQZjNc-YwS2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250221
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
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17217-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C171C19E9CE
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Extend JIT support of fsession in powerpc64 trampoline, since
ppc64 and ppc32 shares common trampoline implementation.
Arch specific helpers handle 64-bit data copy using 32 bit regs.

Need to validate fsession support along with trampoline support.

v1->v2:
  No change since v1

[v1]: https://lore.kernel.org/bpf/20260216155310.38457-1-adubey@linux.ibm.com

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   |  8 ++++++-
 arch/powerpc/net/bpf_jit_comp32.c | 35 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 6d334c0c3d85..8e6bfba37a67 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -542,7 +542,13 @@ bool bpf_jit_supports_private_stack(void)
 
 bool bpf_jit_supports_fsession(void)
 {
-	return IS_ENABLED(CONFIG_PPC64);
+	/*
+	 * TODO: Remove after validating support
+	 * for fsession and trampoline on ppc32.
+	 */
+	if (IS_ENABLED(CONFIG_PPC32))
+		return -EOPNOTSUPP;
+	return true;
 }
 
 bool bpf_jit_supports_arena(void)
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 3087e744fb25..72dc2a55d66c 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -123,6 +123,41 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 	}
 }
 
+void prepare_for_fsession_fentry(u32 *image, struct codegen_context *ctx, int cookie_cnt,
+						int cookie_off, int retval_off)
+{
+	/*
+	 * Set session cookies value
+	 * Clear cookies field on stack
+	 * Ensure retval to be cleared on fentry
+	 */
+	EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG), 0));
+
+	for (int i = 0; i < cookie_cnt; i++) {
+		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, cookie_off + 4 * i));
+		EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, cookie_off + 4 * i + 4));
+	}
+
+	EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, retval_off));
+	EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, retval_off + 4));
+}
+
+void store_func_meta(u32 *image, struct codegen_context *ctx,
+					u64 func_meta, int func_meta_off)
+{
+	/*
+	 * Store func_meta to stack: [R1 + func_meta_off] = func_meta
+	 * func_meta := argument count in first byte + cookie value
+	 */
+	/* Store lower word */
+	EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG), (u32)func_meta));
+	EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off));
+
+	/* Store upper word */
+	EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG), (u32)(func_meta >> 32)));
+	EMIT(PPC_RAW_STW(bpf_to_ppc(TMP_REG), _R1, func_meta_off + 4));
+}
+
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
-- 
2.52.0


