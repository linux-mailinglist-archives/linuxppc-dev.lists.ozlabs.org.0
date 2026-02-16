Return-Path: <linuxppc-dev+bounces-16882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AeCFDX3kmlx0gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:53:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D514286A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 11:53:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF04R3HPmz3bnx;
	Mon, 16 Feb 2026 21:53:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771239207;
	cv=none; b=cqVRcNPxcOnJG9D3qynNRWsktCu4TKSX+bBlbkMALFpvhsYYJKcBlU12KxmeZv68itajnDltGSAHt8FYv69XM+UdncCeQHYjVdsVbi5k9eydFqLqGs1csOd0XoOI/gE+LnbMndlRIhfSsr4huNKO9ImnMHSI823LWuvjCd/HmcO+KMn60TJJUwVn0p4V4bK/ku1R26xGTvF7mUvjW3EsjdQUop3pmFt/9ojuiviuj3zK0zNRV3+qEw34Soj8bRJhJczdnn1IAI7I+xeTjXIvtHexqgqZq6sq0cSTp3H+CS6ghRjAQFMgIshzukyk3XWlP5P3+D8uVB34rQO0vO54Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771239207; c=relaxed/relaxed;
	bh=OmqFTgRqOq9or6wZKZbPjcu17SMCURtdsaFIELB0ln8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHXNGjb4k6I03uEBRsCDkKURC8YfpzWOsaR8dAltCd4oQxSCDOEuhcZqSIRDa8exs3vAq4LCtg7DChD7Wi2ZfnyAClpXtxHX/kfdhKe8WMSvJngl3nYWr7Mh+0rfcHTXTT2/OFHK3V3SlMnbQ+A7yPBjf1WfkJwcU4KeNHsTKNo7pWplXZqUb5NzTy/vYyCS6SpWT5TQCPWnwySbu0lQnZa9BErMrON1W6/19opeVySbRRDjG/k78AQj6j9zXyu6YWSpytgt3zbVZIgiJhzKswcPs11vmJ4yF8sDknEuR1LlTEXHsiRSKq8mwx9NRLqnaSXZvq3eo4bhRi6zrlr24w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQdmL+d8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQdmL+d8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF04Q4mHdz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 21:53:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G5PNbY1448294;
	Mon, 16 Feb 2026 10:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OmqFTgRqOq9or6wZK
	ZbPjcu17SMCURtdsaFIELB0ln8=; b=LQdmL+d8tMJYv8WJ//pCA+zIbN+Gq0c2v
	OB/FLOYb+YExEP66hTkvaGYnis7O7uz5hAnvvQYlXExGO6TQN2CXAqUuJAGEZcJv
	yGhhuyR8c4qmlBtvytkdHfA+MWK7RtNJjb3tPid4fwnlLLZreQg0eaSfe7j9k2kU
	Sp4xRKXnyQutuA5oF1/U55kJ/3dQ7ENRwXod9m2brmCUlBYc8pmHqlgu5RVp2fUr
	5iukjXHGTATHqNUWddSjI4kt1NbPbRH7QxLg6l6SJbPjyrjUp3OhcErXpc1iauU4
	rxHP7gpYZxFqLDj225nBcLz7kxFNvyNJwWVEtgnIN+O5xdGfCxXFQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj63xu9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:53:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6LTwF025053;
	Mon, 16 Feb 2026 10:53:04 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cb3rxn5jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 10:53:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61GAr0Gt37814606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 10:53:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D34D2004D;
	Mon, 16 Feb 2026 10:53:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00AB220043;
	Mon, 16 Feb 2026 10:52:58 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 10:52:57 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
        eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com,
        ihor.solodrai@linux.dev, chleroy@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 3/3] powerpc32/bpf: Add fsession support
Date: Mon, 16 Feb 2026 10:53:10 -0500
Message-ID: <20260216155310.38457-3-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216155310.38457-1-adubey@linux.ibm.com>
References: <20260216155310.38457-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nEgH6frHMIvewrpChD0Hisy_VMYOOLqL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MCBTYWx0ZWRfX2vpzY9BZK9Vx
 QgCB/BmVb0/Qi+OM7/ZO4m6CLAor/N8rIuNmGJsVKJ426mWWPwBl/rEKIUoMFFsJMaI2GmJl6iQ
 Dm2e6yHcmGswDNDG0v3Yi32JlC86MBTRwCOec11hA8oRK/CnsyDB6vdImwQfhMy+YJiIQDqnJnw
 +OPjJFVwwIN8nEbqVCzNOs277ynKE+5gI/Kilu7+wkE6NA5YeTG/eFGH9fFzmbsQVit8pMejOA7
 KCf/DIyPl3FkNzIF1/4GmuDg7XFs8y5tCp1jkz+OYdwM3mbCM7GCINJQqp7v5peJmHe6TF80GC5
 CxvGGhwesrz9MmPnqmnQpfbqAvxq6wdj7xsWP6qtBa8ezY1iLul+ngMG90KYs0gW5+9fZ3Iffet
 hIAj3Blx2O83Ac5ejfZIVQ20pOMbwhjWUQeYcSyTU6CNwcPW+lLGl9fQpfFWXROHo3jJc+xRIeR
 UbE/WkMbrMJ3+IIowrw==
X-Proofpoint-GUID: vcHD1HVWe-I1JxvKtHROaS96omExZ4Ve
X-Authority-Analysis: v=2.4 cv=U+mfzOru c=1 sm=1 tr=0 ts=6992f711 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=_ySWqCA71J16aY6q5SMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160090
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16882-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,m:adubey@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D8D514286A
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

Extend JIT support of fsession in powerpc64 trampoline, since
ppc64 and ppc32 shares common trampoline implementation.
Arch specific helpers handle 64-bit data copy using 32 bit regs.

Need to validate fsession support along with trampoline support.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c   |  8 ++++++-
 arch/powerpc/net/bpf_jit_comp32.c | 35 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 65e091064fe4..31896ed34129 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -529,7 +529,13 @@ bool bpf_jit_supports_private_stack(void)
 
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


