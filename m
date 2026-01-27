Return-Path: <linuxppc-dev+bounces-16321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNKbL3vReGmNtQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:53:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EAA9610D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 15:53:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0pLX0XbRz3cB3;
	Wed, 28 Jan 2026 01:53:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769525603;
	cv=none; b=iqxR2OTwZ9rQQeU/Dy2e/HoOex7gbijShz9vgK4DQ6ffzPLTVIfrXsP1xglATX1sn15os9JV34Dd770gF3nsqLwf/qPpLke1cSRd21YbDWOEcaWKHQIlZU7ZqeBlYOEYqBGXlsz5jGonEVrXgxyyAHyHHo8AXy5ouwwoV8dYXkqfTCoUbC/VrlpYY3bmE+Gs54EFMBQFj39TNYKNwqzUi9rzX1zmyGIvZGC42oE19oA49MD89YBxXc5cbYkHlSWqM80of+93iUGiOATE/KqmwNFJHIaK4jpjhd3ar1mNCm0XyqaF+LG5TQUIYp0kck2AsTJFJlQB1WUHRoBN1fgW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769525603; c=relaxed/relaxed;
	bh=9Fm0jSaawrywiM+j+JokalnFc+ZmwEdF3JyuNbZO5uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6wrs5Os96SJDbX1Vu3gyCDg9aXIXU92q95/ehYlWklh4awkRtoDCnzCisgRtVdpz0a2ppniH4yB1Uuts9cz2bh/OzG3l7uTsrINUALRLo1K658JWAwLCflyiH/yM1sfcqhirdcSB+0uGMI8QOAQ1AViz12Vb5gP7GkT34jPiAVVfUgiQWxmClWI9RVxbUIwI4AGbEzD/VxeQ6G792QC8F1pUdqwmB1zqgklrwN86AtmaFikhqqA97/pAgfaGjsyVGoKUzzCrUI+/0HvL8dpRph3WLt2qxBuw585DuYa8yhNLG3fDlucdKcuvFAtJKPxW1SpfPjgbqEIT5/5xbUEYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CNM0sEXf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CNM0sEXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0pLW0kM7z3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 01:53:22 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R8OYOo016222;
	Tue, 27 Jan 2026 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9Fm0jSaawrywiM+j+
	JokalnFc+ZmwEdF3JyuNbZO5uQ=; b=CNM0sEXfgjZD5tIqqLDPqq1RZe1zHlIjP
	jOVNG2eKT6y4yYa2utjyeOthJh5ugOZxu0eJWejRzMEexIrDbkjKwwFwLd2NRIoZ
	MefyAI0PdVYEBnySDYsi6BaZpooaLb7yabFrlmvjaCC9aaXMvz7SAcf2pV50xmqW
	x9Pe4od0ZKNYjdl1cBFF5dDXTWVy7kmRhozkmEfUjjXXKWfnQmJH3hlAhpOC7BKy
	fVnX33R53mqL4jLlEZDTzLpeMxdfOVTWpr4LF+FnWjt9ohMoJasdKhKh/fyL2OuM
	O7IgAnFTIfaydfxIQATXWnB6K+d5ObchtJuAS/p0F82AEJyB6fOYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr644fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:53:02 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60REhpsP020393;
	Tue, 27 Jan 2026 14:53:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr644fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:53:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60RDBE3a031067;
	Tue, 27 Jan 2026 14:53:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bw8dsh4he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 14:53:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60REquTo46989700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 14:52:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C67220043;
	Tue, 27 Jan 2026 14:52:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA1720040;
	Tue, 27 Jan 2026 14:52:53 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.210.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 14:52:53 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v5 4/6] pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
Date: Tue, 27 Jan 2026 20:22:26 +0530
Message-ID: <20260127145228.48320-5-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127145228.48320-1-ssrish@linux.ibm.com>
References: <20260127145228.48320-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyMSBTYWx0ZWRfXzAQGl9mHYPId
 iWxsvAz/KVoADaEz8ZpAfuLpWywF70mElwHTepasMd/HSmMUYuIXXeAsIGlonebUH1v2unoZR6f
 UwEDtotUfRqpzSeAw90vdJwGmMvkOt4QjnBuL3w+W/tKsmYKEKcWgIb3sThmTwel8D2sB8pJe61
 La/tZV4DkO38uz3BfXDnK/IIyzRSe27Ul5fBG7vXHVO/rR0XPoM2ujvigJRPv0Sl/07EOtJLeKj
 Dbi41aWovlZiZhfbTmnsxyPPzLc1Hw0Y/jK/UVJAp1Hc1V1aHk7qp/ZZCKlPg1YOwXL3EXUajTx
 K5p1/SCeOXMNsfW7Ccq3nqyBN04wnP8+yb8RkEdfDklqPNtIkLS0MzOEMHsXSaFIgWtpa+ynjUj
 3zV1Izcnv4VH2mlsY0jyXM5wp8INhh6sauVTn2oXvaEkU2ar6EK6x0+46EJL3pqb3+4rDPETLpI
 Gw6+fwPBIlUY5Q6L9dg==
X-Proofpoint-GUID: rXf7kBJpVpDe7ER1usz1NYs5q6P5weJ_
X-Proofpoint-ORIG-GUID: b0VZXbCFY5a4jrZWNjwDB6b7lLSWqF69
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=6978d14e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=nO4dFLMeAchwtJrxA4IA:9 a=POYjf8jjcDEwoKyR:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270121
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
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16321-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,var.name:url]
X-Rspamd-Queue-Id: D9EAA9610D
X-Rspamd-Action: no action

The hypervisor generated wrapping key is an AES-GCM-256 symmetric key which
is stored in a non-volatile, secure, and encrypted storage called the Power
LPAR Platform KeyStore. It has policy based protections that prevent it
from being read out or exposed to the user.

Implement H_PKS_GEN_KEY, H_PKS_WRAP_OBJECT, and H_PKS_UNWRAP_OBJECT HCALLs
to enable using the PowerVM Key Wrapping Module (PKWM) as a new trust
source for trusted keys. Disallow H_PKS_READ_OBJECT, H_PKS_SIGNED_UPDATE,
and H_PKS_WRITE_OBJECT for objects with the 'wrapping key' policy set.
Capture the availability status for the H_PKS_WRAP_OBJECT interface.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
---
 Documentation/arch/powerpc/papr_hcalls.rst |  43 +++
 arch/powerpc/include/asm/plpks.h           |  10 +
 arch/powerpc/platforms/pseries/plpks.c     | 343 ++++++++++++++++++++-
 3 files changed, 394 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 805e1cb9bab9..14e39f095a1c 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -300,6 +300,49 @@ H_HTM supports setup, configuration, control and dumping of Hardware Trace
 Macro (HTM) function and its data. HTM buffer stores tracing data for functions
 like core instruction, core LLAT and nest.
 
+**H_PKS_GEN_KEY**
+
+| Input: authorization, objectlabel, objectlabellen, policy, out, outlen
+| Out: *Hypervisor Generated Key, or None when the wrapping key policy is set*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_Authority, H_Nomem, H_Busy, H_Resource,
+                H_Aborted*
+
+H_PKS_GEN_KEY is used to have the hypervisor generate a new random key.
+This key is stored as an object in the Power LPAR Platform KeyStore with
+the provided object label. With the wrapping key policy set the key is only
+visible to the hypervisor, while the key's label would still be visible to
+the user. Generation of wrapping keys is supported only for a key size of
+32 bytes.
+
+**H_PKS_WRAP_OBJECT**
+
+| Input: authorization, wrapkeylabel, wrapkeylabellen, objectwrapflags, in,
+|        inlen, out, outlen, continue-token
+| Out: *continue-token, byte size of wrapped object, wrapped object*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_P7, H_P8, H_P9, H_Authority, H_Invalid_Key,
+                H_NOT_FOUND, H_Busy, H_LongBusy, H_Aborted*
+
+H_PKS_WRAP_OBJECT is used to wrap an object using a wrapping key stored in the
+Power LPAR Platform KeyStore and return the wrapped object to the caller. The
+caller provides a label to a wrapping key with the 'wrapping key' policy set,
+which must have been previously created with H_PKS_GEN_KEY. The provided object
+is then encrypted with the wrapping key and additional metadata and the result
+is returned to the caller.
+
+
+**H_PKS_UNWRAP_OBJECT**
+
+| Input: authorization, objectwrapflags, in, inlen, out, outlen, continue-token
+| Out: *continue-token, byte size of unwrapped object, unwrapped object*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_P7, H_Authority, H_Unsupported, H_Bad_Data,
+                H_NOT_FOUND, H_Invalid_Key, H_Busy, H_LongBusy, H_Aborted*
+
+H_PKS_UNWRAP_OBJECT is used to unwrap an object that was previously warapped with
+H_PKS_WRAP_OBJECT.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 8f034588fdf7..e87f90e40d4e 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -113,6 +113,16 @@ void plpks_early_init_devtree(void);
 int plpks_populate_fdt(void *fdt);
 
 int plpks_config_create_softlink(struct kobject *from);
+
+bool plpks_wrapping_is_supported(void);
+
+int plpks_gen_wrapping_key(void);
+
+int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
+		      u8 **output_buf, u32 *output_len);
+
+int plpks_unwrap_object(u8 **input_buf, u32 input_len,
+			u8 **output_buf, u32 *output_len);
 #else // CONFIG_PSERIES_PLPKS
 static inline bool plpks_is_available(void) { return false; }
 static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 4a08f51537c8..038ecf8f6d6b 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -9,6 +9,32 @@
 
 #define pr_fmt(fmt) "plpks: " fmt
 
+#define PLPKS_WRAPKEY_COMPONENT	"PLPKSWR"
+#define PLPKS_WRAPKEY_NAME	"default-wrapping-key"
+
+/*
+ * To 4K align the {input, output} buffers to the {UN}WRAP H_CALLs
+ */
+#define PLPKS_WRAPPING_BUF_ALIGN	4096
+
+/*
+ * To ensure the output buffer's length is at least 1024 bytes greater
+ * than the input buffer's length during the WRAP H_CALL
+ */
+#define PLPKS_WRAPPING_BUF_DIFF	1024
+
+#define PLPKS_WRAP_INTERFACE_BIT	3
+#define PLPKS_WRAPPING_KEY_LENGTH	32
+
+#define WRAPFLAG_BE_BIT_SET(be_bit) \
+	BIT_ULL(63 - (be_bit))
+
+#define WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo) \
+	GENMASK_ULL(63 - (be_bit_hi), 63 - (be_bit_lo))
+
+#define WRAPFLAG_BE_FIELD_PREP(be_bit_hi, be_bit_lo, val) \
+	FIELD_PREP(WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo), (val))
+
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/io.h>
@@ -19,6 +45,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/memblock.h>
+#include <linux/bitfield.h>
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
 #include <asm/plpks.h>
@@ -39,6 +66,7 @@ static u32 supportedpolicies;
 static u32 maxlargeobjectsize;
 static u64 signedupdatealgorithms;
 static u64 wrappingfeatures;
+static bool wrapsupport;
 
 struct plpks_auth {
 	u8 version;
@@ -283,6 +311,7 @@ static int _plpks_get_config(void)
 	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
 	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
 	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
+	wrapsupport = config->flags & PPC_BIT8(PLPKS_WRAP_INTERFACE_BIT);
 
 	// Validate that the numbers we get back match the requirements of the spec
 	if (maxpwsize < 32) {
@@ -614,6 +643,9 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 	if (!(var->policy & PLPKS_SIGNEDUPDATE))
 		return -EINVAL;
 
+	if (var->policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	// Signed updates need the component to be NULL.
 	if (var->component)
 		return -EINVAL;
@@ -696,6 +728,9 @@ int plpks_write_var(struct plpks_var var)
 	if (var.policy & PLPKS_SIGNEDUPDATE)
 		return -EINVAL;
 
+	if (var.policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	auth = construct_auth(PLPKS_OS_OWNER);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
@@ -790,6 +825,9 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 	if (var->namelen > PLPKS_MAX_NAME_SIZE)
 		return -EINVAL;
 
+	if (var->policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	auth = construct_auth(consumer);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
@@ -845,8 +883,309 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 }
 
 /**
- * plpks_read_os_var() - Fetch the data for the specified variable that is
- * owned by the OS consumer.
+ * plpks_wrapping_is_supported() - Get the H_PKS_WRAP_OBJECT interface
+ * availability status for the LPAR.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * sets bit 3 of the flags variable in the PLPKS config structure if the
+ * H_PKS_WRAP_OBJECT interface is supported.
+ *
+ * Returns: true if the H_PKS_WRAP_OBJECT interface is supported, false if not.
+ */
+bool plpks_wrapping_is_supported(void)
+{
+	return wrapsupport;
+}
+
+/**
+ * plpks_gen_wrapping_key() - Generate a new random key with the 'wrapping key'
+ * policy set.
+ *
+ * The H_PKS_GEN_KEY HCALL makes the hypervisor generate a new random key and
+ * store the key in a PLPKS object with the provided object label. With the
+ * 'wrapping key' policy set, only the label to the newly generated random key
+ * would be visible to the user.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid object label parameter
+ *		if invalid object label len parameter
+ *		if invalid or unsupported policy declaration
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ * -EPERM	if access is denied
+ * -ENOMEM	if there is inadequate memory to perform this operation
+ * -EBUSY	if unable to handle the request
+ * -EEXIST	if the object label already exists
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_gen_wrapping_key(void)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	struct label *label;
+	int rc = 0, pseries_status = 0;
+	struct plpks_var var = {
+		.name = PLPKS_WRAPKEY_NAME,
+		.namelen = strlen(var.name),
+		.policy = PLPKS_WRAPPINGKEY,
+		.os = PLPKS_VAR_LINUX,
+		.component = PLPKS_WRAPKEY_COMPONENT
+	};
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	label = construct_label(var.component, var.os, var.name, var.namelen);
+	if (IS_ERR(label)) {
+		rc = PTR_ERR(label);
+		goto out;
+	}
+
+	rc = plpar_hcall(H_PKS_GEN_KEY, retbuf,
+			 virt_to_phys(auth), virt_to_phys(label),
+			 label->size, var.policy,
+			 NULL, PLPKS_WRAPPING_KEY_LENGTH);
+
+	if (!rc)
+		rc = plpks_confirm_object_flushed(label, auth);
+
+	pseries_status = rc;
+	rc = pseries_status_to_err(rc);
+
+	if (rc && rc != -EEXIST) {
+		pr_err("H_PKS_GEN_KEY failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+	} else {
+		rc = 0;
+	}
+
+	kfree(label);
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_gen_wrapping_key);
+
+/**
+ * plpks_wrap_object() - Wrap an object using the default wrapping key stored in
+ * the PLPKS.
+ * @input_buf: buffer containing the data to be wrapped
+ * @input_len: length of the input buffer
+ * @wrap_flags: object wrapping flags
+ * @output_buf: buffer to store the wrapped data
+ * @output_len: length of the output buffer
+ *
+ * The H_PKS_WRAP_OBJECT HCALL wraps an object using a wrapping key stored in
+ * the PLPKS and returns the wrapped object to the caller. The caller provides a
+ * label to the wrapping key with the 'wrapping key' policy set that must have
+ * been previously created with the H_PKS_GEN_KEY HCALL. The provided object is
+ * then encrypted with the wrapping key and additional metadata and the result
+ * is returned to the user. The metadata includes the wrapping algorithm and the
+ * wrapping key name so those parameters are not required during unwrap.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid wrapping key label parameter
+ *		if invalid wrapping key label length parameter
+ *		if invalid or unsupported object wrapping flags
+ *		if invalid input buffer parameter
+ *		if invalid input buffer length parameter
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ *		if invalid continue token parameter
+ *		if the wrapping key is not compatible with the wrapping
+ *		algorithm
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested wrapping key was not found
+ * -EBUSY	if unable to handle the request or long running operation
+ *		initiated, retry later.
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
+		      u8 **output_buf, u32 *output_len)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	struct label *label;
+	u64 continuetoken = 0;
+	u64 objwrapflags = 0;
+	int rc = 0, pseries_status = 0;
+	bool sb_audit_or_enforce_bit = wrap_flags & BIT(0);
+	bool sb_enforce_bit = wrap_flags & BIT(1);
+	struct plpks_var var = {
+		.name = PLPKS_WRAPKEY_NAME,
+		.namelen = strlen(var.name),
+		.os = PLPKS_VAR_LINUX,
+		.component = PLPKS_WRAPKEY_COMPONENT
+	};
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	label = construct_label(var.component, var.os, var.name, var.namelen);
+	if (IS_ERR(label)) {
+		rc = PTR_ERR(label);
+		goto out;
+	}
+
+	/* Set the consumer password requirement bit. A must have. */
+	objwrapflags |= WRAPFLAG_BE_BIT_SET(3);
+
+	/* Set the wrapping algorithm bit. Just one algorithm option for now */
+	objwrapflags |= WRAPFLAG_BE_FIELD_PREP(60, 63, 0x1);
+
+	if (sb_audit_or_enforce_bit & sb_enforce_bit) {
+		pr_err("Cannot set both audit/enforce and enforce bits.");
+		rc = -EINVAL;
+		goto out_free_label;
+	} else if (sb_audit_or_enforce_bit) {
+		objwrapflags |= WRAPFLAG_BE_BIT_SET(1);
+	} else if (sb_enforce_bit) {
+		objwrapflags |= WRAPFLAG_BE_BIT_SET(2);
+	}
+
+	*output_len = input_len + PLPKS_WRAPPING_BUF_DIFF;
+
+	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
+			      GFP_KERNEL);
+	if (!(*output_buf)) {
+		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
+		rc = -ENOMEM;
+		goto out_free_label;
+	}
+
+	do {
+		rc = plpar_hcall9(H_PKS_WRAP_OBJECT, retbuf,
+				  virt_to_phys(auth), virt_to_phys(label),
+				  label->size, objwrapflags,
+				  virt_to_phys(*input_buf), input_len,
+				  virt_to_phys(*output_buf), *output_len,
+				  continuetoken);
+
+		continuetoken = retbuf[0];
+		pseries_status = rc;
+		rc = pseries_status_to_err(rc);
+	} while (rc == -EBUSY);
+
+	if (rc) {
+		pr_err("H_PKS_WRAP_OBJECT failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+		kfree(*output_buf);
+		*output_buf = NULL;
+	} else {
+		*output_len = retbuf[1];
+	}
+
+out_free_label:
+	kfree(label);
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_wrap_object);
+
+/**
+ * plpks_unwrap_object() - Unwrap an object using the default wrapping key
+ * stored in the PLPKS.
+ * @input_buf: buffer containing the data to be unwrapped
+ * @input_len: length of the input buffer
+ * @output_buf: buffer to store the unwrapped data
+ * @output_len: length of the output buffer
+ *
+ * The H_PKS_UNWRAP_OBJECT HCALL unwraps an object that was previously wrapped
+ * using the H_PKS_WRAP_OBJECT HCALL.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid or unsupported object unwrapping flags
+ *		if invalid input buffer parameter
+ *		if invalid input buffer length parameter
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ *		if invalid continue token parameter
+ *		if the wrapping key is not compatible with the wrapping
+ *		algorithm
+ *		if the wrapped object's format is not supported
+ *		if the wrapped object is invalid
+ * -EPERM	if access is denied
+ * -ENOENT	if the wrapping key for the provided object was not found
+ * -EBUSY	if unable to handle the request or long running operation
+ *		initiated, retry later.
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_unwrap_object(u8 **input_buf, u32 input_len, u8 **output_buf,
+			u32 *output_len)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	u64 continuetoken = 0;
+	u64 objwrapflags = 0;
+	int rc = 0, pseries_status = 0;
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	*output_len = input_len - PLPKS_WRAPPING_BUF_DIFF;
+	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
+			      GFP_KERNEL);
+	if (!(*output_buf)) {
+		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	do {
+		rc = plpar_hcall9(H_PKS_UNWRAP_OBJECT, retbuf,
+				  virt_to_phys(auth), objwrapflags,
+				  virt_to_phys(*input_buf), input_len,
+				  virt_to_phys(*output_buf), *output_len,
+				  continuetoken);
+
+		continuetoken = retbuf[0];
+		pseries_status = rc;
+		rc = pseries_status_to_err(rc);
+	} while (rc == -EBUSY);
+
+	if (rc) {
+		pr_err("H_PKS_UNWRAP_OBJECT failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+		kfree(*output_buf);
+		*output_buf = NULL;
+	} else {
+		*output_len = retbuf[1];
+	}
+
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_unwrap_object);
+
+/**
+ * plpks_read_os_var() - Fetch the data for the specified variable that is owned
+ * by the OS consumer.
  * @var: variable to be read from the PLPKS
  *
  * The consumer or the owner of the object is the os kernel. The
-- 
2.47.3


