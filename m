Return-Path: <linuxppc-dev+bounces-16246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN4jHReoc2msxwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23E78B1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyPFL4rZLz3bjb;
	Sat, 24 Jan 2026 03:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769187334;
	cv=none; b=Dw3wScOocJKGXcw7YI/s5kkdSO7cN+EUAsIv+64ZVIvZEyXSEFNa/I+TuAKCBI6FWyFF4Y9CPr8sSp05htNoZvoEqahdGJhC8UjkviHHb0dNQjwRMG5p6L9PVnNtl+GXzVkMYbUwuvi3WYNwSVVuFhGHx9R0lSK59ce/Vcwpu4jF3foJM+Vj5sxIdT36/g53MNtp7jhi0rzfMsMuSnBTDOUhIsqLbmr6nqQNBU9KYFTIQLB9jrrK1/32wcHINK3GlP9+/x0NG5Bm8aEANRzq8CJBpIWbUWm7JOk2bJQlhOlRxUI3fE1SBe25IMHAbxjwMr1Qlhxj1ZBLN5N5bmRWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769187334; c=relaxed/relaxed;
	bh=a/I3IQMNmuuOZ52w0m9lg27mtQD6p4jvhBcOsmdsias=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6rgCvVtEntlwVv2brwMPjtsOG1CzPcsPrJa1V5PU4PR8/xWhio7i9JUhUelXIp9NdncbGRisrPfsYBUHbROWUEzfbtSS8PeqnQam3trdmuqvsPBbS8E75ICtlr5WMW1B856DQGqzsBP6G7wUP+08t4NIOUCZvBwMXcWUj7IUdLq/llmHru+08D6QlxjVXNZJlVD64/t0ZYXmDsYVVisNd4OqV9kJn+kwXwlggbc+w0wPRKc4ufNw4EPFbbIamN5n8tRKQr2yLNzmkE7n9rBn6OWX1r5lpyhT0MOyQ9SS0pnxrpkHwoYXak+30qw8vcSiI89OXV8IgfSAjDaxJc/gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQZo0FJf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cQZo0FJf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyPFK5NWPz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 03:55:33 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60NCHVLZ006245;
	Fri, 23 Jan 2026 16:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=a/I3IQMNmuuOZ52w0
	m9lg27mtQD6p4jvhBcOsmdsias=; b=cQZo0FJfjCVJe/Y4iL6SwU9p07EXrxGWw
	DZuP1I7BuwJRRy7mLY3upIysGOFLw4OTp5hwhKLvA37GOlw2RuZNr1PM8F7CCZbA
	b6GqGJovnwE3aKl1PLOlGBtTfd44ysqbsJZDPdzLTF/r08Jp1heZ1pcQSSYbeZKS
	D+QtvsazCTkhnSAnrpp1buIipQH37x+ClnBoTFgCAbawBoMeAKGzp8wZpwL9LIXS
	FthzROMo4pDcxYM1aMHliSwcdiftb7WHAfzVjqmEC4Bem7xvV4VAcj7arHnZqQgK
	fYCVEh793rEk7u5SssxVus6/4h3AoqntJpbCfYh6hLPS1c/UTNrUw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sh9sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:22 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NGopbb004695;
	Fri, 23 Jan 2026 16:55:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sh9sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NF4HQN006451;
	Fri, 23 Jan 2026 16:55:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf21vpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NGtGOD31326556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 16:55:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0D4D20043;
	Fri, 23 Jan 2026 16:55:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B9AE20040;
	Fri, 23 Jan 2026 16:55:13 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.24.251])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 16:55:12 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        stefanb@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
        ssrish@linux.ibm.com
Subject: [PATCH 2/2] keys/trusted_keys: move TPM-specific fields into trusted_tpm_options
Date: Fri, 23 Jan 2026 22:25:04 +0530
Message-ID: <20260123165504.461607-3-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123165504.461607-1-ssrish@linux.ibm.com>
References: <20260123165504.461607-1-ssrish@linux.ibm.com>
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
X-Proofpoint-GUID: _QiGcykUqncnlHZbG6zyXJwgQ42oR-B0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEyNiBTYWx0ZWRfX+QpBbCtr8xUM
 agfq3DudN71XIQ7CMeANkLZdBtGVdGeess14vMQboBVfEnMFSymM00Vr9q0rN+ohbjjmUaGYPX5
 4FBKOOcrUyxSuX+VKF5/bvPdmEJDvIThlHw5dqXWF0Lof6m5TgeCPWapGC/ycDGtEP1WQJfpOxv
 LXWGhBdE5siDqpByPAWGWxdtfgemBecI1VhswY69X8eAkLHffklesIu8We1+BfgcN/QU0O1OyxD
 u872pwAqDgr0te9XrnqBvGv+0dpw3c9bMKTYEG+E6qYh3HZa47bHQJS0m2EK3x+u4xsLAYzPL+f
 tY8T+3Y6xExJvFLBXiavuCVOft5RYw8EDemhN/RzDPpe3eUBQOizrhrVhyZUVgh1+2bzvfiO/8s
 CHTYUtc8coMbF6nHir86FyfAaUyQ9o5m59U0L2kmLl92mKfvHdcpA8BY4gwpAAOr3ft1evpaKEY
 wUN5gZVOtCngQ9LHPJA==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6973a7fa cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=5BZ-QB4JF1YIb4A2tUIA:9
X-Proofpoint-ORIG-GUID: BQVXFLDUo8D2a9DHVNK704Y3618QQKeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
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
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:stefanb@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16246-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.095];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 7F23E78B1A
X-Rspamd-Action: no action

The trusted_key_options struct contains TPM-specific fields (keyhandle,
keyauth, blobauth_len, blobauth, pcrinfo_len, pcrinfo, pcrlock, hash,
policydigest_len, policydigest, and policyhandle). This leads to the
accumulation of backend-specific fields in the generic options structure.

Define trusted_tpm_options structure and move the TPM-specific fields
there. Store a pointer to trusted_tpm_options in trusted_key_options's
private.

No functional change intended.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 include/keys/trusted-type.h               |  11 ---
 include/keys/trusted_tpm.h                |  14 +++
 security/keys/trusted-keys/trusted_tpm1.c | 103 ++++++++++++++--------
 security/keys/trusted-keys/trusted_tpm2.c |  62 ++++++++-----
 4 files changed, 121 insertions(+), 69 deletions(-)

diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
index 03527162613f..b80f250305b8 100644
--- a/include/keys/trusted-type.h
+++ b/include/keys/trusted-type.h
@@ -39,17 +39,6 @@ struct trusted_key_payload {
 
 struct trusted_key_options {
 	uint16_t keytype;
-	uint32_t keyhandle;
-	unsigned char keyauth[TPM_DIGEST_SIZE];
-	uint32_t blobauth_len;
-	unsigned char blobauth[TPM_DIGEST_SIZE];
-	uint32_t pcrinfo_len;
-	unsigned char pcrinfo[MAX_PCRINFO_SIZE];
-	int pcrlock;
-	uint32_t hash;
-	uint32_t policydigest_len;
-	unsigned char policydigest[MAX_DIGEST_SIZE];
-	uint32_t policyhandle;
 	void *private;
 };
 
diff --git a/include/keys/trusted_tpm.h b/include/keys/trusted_tpm.h
index 0fadc6a4f166..355ebd36cbfd 100644
--- a/include/keys/trusted_tpm.h
+++ b/include/keys/trusted_tpm.h
@@ -7,6 +7,20 @@
 
 extern struct trusted_key_ops trusted_key_tpm_ops;
 
+struct trusted_tpm_options {
+	uint32_t keyhandle;
+	unsigned char keyauth[TPM_DIGEST_SIZE];
+	uint32_t blobauth_len;
+	unsigned char blobauth[TPM_DIGEST_SIZE];
+	uint32_t pcrinfo_len;
+	unsigned char pcrinfo[MAX_PCRINFO_SIZE];
+	int pcrlock;
+	uint32_t hash;
+	uint32_t policydigest_len;
+	unsigned char policydigest[MAX_DIGEST_SIZE];
+	uint32_t policyhandle;
+};
+
 int tpm2_seal_trusted(struct tpm_chip *chip,
 		      struct trusted_key_payload *payload,
 		      struct trusted_key_options *options);
diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index 636acb66a4f6..0ab0234ebe37 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -50,12 +50,14 @@ enum {
 #if TPM_DEBUG
 static inline void dump_options(struct trusted_key_options *o)
 {
+	struct trusted_tpm_options *tpm_opts = o->private;
+
 	pr_info("sealing key type %d\n", o->keytype);
-	pr_info("sealing key handle %0X\n", o->keyhandle);
-	pr_info("pcrlock %d\n", o->pcrlock);
-	pr_info("pcrinfo %d\n", o->pcrinfo_len);
+	pr_info("sealing key handle %0X\n", tpm_opts->keyhandle);
+	pr_info("pcrlock %d\n", tpm_opts->pcrlock);
+	pr_info("pcrinfo %d\n", tpm_opts->pcrinfo_len);
 	print_hex_dump(KERN_INFO, "pcrinfo ", DUMP_PREFIX_NONE,
-		       16, 1, o->pcrinfo, o->pcrinfo_len, 0);
+		       16, 1, tpm_opts->pcrinfo, tpm_opts->pcrinfo_len, 0);
 }
 
 static inline void dump_sess(struct osapsess *s)
@@ -624,6 +626,7 @@ static int tpm_unseal(struct tpm_buf *tb,
 static int key_seal(struct trusted_key_payload *p,
 		    struct trusted_key_options *o)
 {
+	struct trusted_tpm_options *tpm_opts;
 	struct tpm_buf tb;
 	int ret;
 
@@ -634,9 +637,12 @@ static int key_seal(struct trusted_key_payload *p,
 	/* include migratable flag at end of sealed key */
 	p->key[p->key_len] = p->migratable;
 
-	ret = tpm_seal(&tb, o->keytype, o->keyhandle, o->keyauth,
+	tpm_opts = o->private;
+
+	ret = tpm_seal(&tb, o->keytype, tpm_opts->keyhandle, tpm_opts->keyauth,
 		       p->key, p->key_len + 1, p->blob, &p->blob_len,
-		       o->blobauth, o->pcrinfo, o->pcrinfo_len);
+		       tpm_opts->blobauth, tpm_opts->pcrinfo,
+		       tpm_opts->pcrinfo_len);
 	if (ret < 0)
 		pr_info("srkseal failed (%d)\n", ret);
 
@@ -650,6 +656,7 @@ static int key_seal(struct trusted_key_payload *p,
 static int key_unseal(struct trusted_key_payload *p,
 		      struct trusted_key_options *o)
 {
+	struct trusted_tpm_options *tpm_opts;
 	struct tpm_buf tb;
 	int ret;
 
@@ -657,8 +664,10 @@ static int key_unseal(struct trusted_key_payload *p,
 	if (ret)
 		return ret;
 
-	ret = tpm_unseal(&tb, o->keyhandle, o->keyauth, p->blob, p->blob_len,
-			 o->blobauth, p->key, &p->key_len);
+	tpm_opts = o->private;
+
+	ret = tpm_unseal(&tb, tpm_opts->keyhandle, tpm_opts->keyauth, p->blob,
+			 p->blob_len, tpm_opts->blobauth, p->key, &p->key_len);
 	if (ret < 0)
 		pr_info("srkunseal failed (%d)\n", ret);
 	else
@@ -695,6 +704,7 @@ static const match_table_t key_tokens = {
 static int getoptions(char *c, struct trusted_key_payload *pay,
 		      struct trusted_key_options *opt)
 {
+	struct trusted_tpm_options *tpm_opts;
 	substring_t args[MAX_OPT_ARGS];
 	char *p = c;
 	int token;
@@ -710,7 +720,9 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 	if (tpm2 < 0)
 		return tpm2;
 
-	opt->hash = tpm2 ? HASH_ALGO_SHA256 : HASH_ALGO_SHA1;
+	tpm_opts = opt->private;
+
+	tpm_opts->hash = tpm2 ? HASH_ALGO_SHA256 : HASH_ALGO_SHA1;
 
 	if (!c)
 		return 0;
@@ -724,11 +736,11 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 
 		switch (token) {
 		case Opt_pcrinfo:
-			opt->pcrinfo_len = strlen(args[0].from) / 2;
-			if (opt->pcrinfo_len > MAX_PCRINFO_SIZE)
+			tpm_opts->pcrinfo_len = strlen(args[0].from) / 2;
+			if (tpm_opts->pcrinfo_len > MAX_PCRINFO_SIZE)
 				return -EINVAL;
-			res = hex2bin(opt->pcrinfo, args[0].from,
-				      opt->pcrinfo_len);
+			res = hex2bin(tpm_opts->pcrinfo, args[0].from,
+				      tpm_opts->pcrinfo_len);
 			if (res < 0)
 				return -EINVAL;
 			break;
@@ -737,12 +749,12 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 			if (res < 0)
 				return -EINVAL;
 			opt->keytype = SEAL_keytype;
-			opt->keyhandle = handle;
+			tpm_opts->keyhandle = handle;
 			break;
 		case Opt_keyauth:
 			if (strlen(args[0].from) != 2 * SHA1_DIGEST_SIZE)
 				return -EINVAL;
-			res = hex2bin(opt->keyauth, args[0].from,
+			res = hex2bin(tpm_opts->keyauth, args[0].from,
 				      SHA1_DIGEST_SIZE);
 			if (res < 0)
 				return -EINVAL;
@@ -753,21 +765,23 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 			 * hex strings.  TPM 2.0 authorizations are simple
 			 * passwords (although it can take a hash as well)
 			 */
-			opt->blobauth_len = strlen(args[0].from);
+			tpm_opts->blobauth_len = strlen(args[0].from);
 
-			if (opt->blobauth_len == 2 * TPM_DIGEST_SIZE) {
-				res = hex2bin(opt->blobauth, args[0].from,
+			if (tpm_opts->blobauth_len == 2 * TPM_DIGEST_SIZE) {
+				res = hex2bin(tpm_opts->blobauth, args[0].from,
 					      TPM_DIGEST_SIZE);
 				if (res < 0)
 					return -EINVAL;
 
-				opt->blobauth_len = TPM_DIGEST_SIZE;
+				tpm_opts->blobauth_len = TPM_DIGEST_SIZE;
 				break;
 			}
 
-			if (tpm2 && opt->blobauth_len <= sizeof(opt->blobauth)) {
-				memcpy(opt->blobauth, args[0].from,
-				       opt->blobauth_len);
+			if (tpm2 &&
+			    tpm_opts->blobauth_len <=
+				sizeof(tpm_opts->blobauth)) {
+				memcpy(tpm_opts->blobauth, args[0].from,
+				       tpm_opts->blobauth_len);
 				break;
 			}
 
@@ -785,14 +799,14 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 			res = kstrtoul(args[0].from, 10, &lock);
 			if (res < 0)
 				return -EINVAL;
-			opt->pcrlock = lock;
+			tpm_opts->pcrlock = lock;
 			break;
 		case Opt_hash:
 			if (test_bit(Opt_policydigest, &token_mask))
 				return -EINVAL;
 			for (i = 0; i < HASH_ALGO__LAST; i++) {
 				if (!strcmp(args[0].from, hash_algo_name[i])) {
-					opt->hash = i;
+					tpm_opts->hash = i;
 					break;
 				}
 			}
@@ -804,14 +818,14 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 			}
 			break;
 		case Opt_policydigest:
-			digest_len = hash_digest_size[opt->hash];
+			digest_len = hash_digest_size[tpm_opts->hash];
 			if (!tpm2 || strlen(args[0].from) != (2 * digest_len))
 				return -EINVAL;
-			res = hex2bin(opt->policydigest, args[0].from,
+			res = hex2bin(tpm_opts->policydigest, args[0].from,
 				      digest_len);
 			if (res < 0)
 				return -EINVAL;
-			opt->policydigest_len = digest_len;
+			tpm_opts->policydigest_len = digest_len;
 			break;
 		case Opt_policyhandle:
 			if (!tpm2)
@@ -819,7 +833,7 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 			res = kstrtoul(args[0].from, 16, &handle);
 			if (res < 0)
 				return -EINVAL;
-			opt->policyhandle = handle;
+			tpm_opts->policyhandle = handle;
 			break;
 		default:
 			return -EINVAL;
@@ -830,6 +844,7 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
 
 static struct trusted_key_options *trusted_options_alloc(void)
 {
+	struct trusted_tpm_options *tpm_opts;
 	struct trusted_key_options *options;
 	int tpm2;
 
@@ -842,14 +857,23 @@ static struct trusted_key_options *trusted_options_alloc(void)
 		/* set any non-zero defaults */
 		options->keytype = SRK_keytype;
 
-		if (!tpm2)
-			options->keyhandle = SRKHANDLE;
+		tpm_opts = kzalloc(sizeof(*tpm_opts), GFP_KERNEL);
+		if (!tpm_opts) {
+			kfree_sensitive(options);
+			options = NULL;
+		} else {
+			if (!tpm2)
+				tpm_opts->keyhandle = SRKHANDLE;
+
+			options->private = tpm_opts;
+		}
 	}
 	return options;
 }
 
 static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
 {
+	struct trusted_tpm_options *tpm_opts = NULL;
 	struct trusted_key_options *options = NULL;
 	int ret = 0;
 	int tpm2;
@@ -867,7 +891,9 @@ static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
 		goto out;
 	dump_options(options);
 
-	if (!options->keyhandle && !tpm2) {
+	tpm_opts = options->private;
+
+	if (!tpm_opts->keyhandle && !tpm2) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -881,20 +907,22 @@ static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
 		goto out;
 	}
 
-	if (options->pcrlock) {
-		ret = pcrlock(options->pcrlock);
+	if (tpm_opts->pcrlock) {
+		ret = pcrlock(tpm_opts->pcrlock);
 		if (ret < 0) {
 			pr_info("pcrlock failed (%d)\n", ret);
 			goto out;
 		}
 	}
 out:
+	kfree_sensitive(options->private);
 	kfree_sensitive(options);
 	return ret;
 }
 
 static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
 {
+	struct trusted_tpm_options *tpm_opts = NULL;
 	struct trusted_key_options *options = NULL;
 	int ret = 0;
 	int tpm2;
@@ -912,7 +940,9 @@ static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
 		goto out;
 	dump_options(options);
 
-	if (!options->keyhandle && !tpm2) {
+	tpm_opts = options->private;
+
+	if (!tpm_opts->keyhandle && !tpm2) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -924,14 +954,15 @@ static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
 	if (ret < 0)
 		pr_info("key_unseal failed (%d)\n", ret);
 
-	if (options->pcrlock) {
-		ret = pcrlock(options->pcrlock);
+	if (tpm_opts->pcrlock) {
+		ret = pcrlock(tpm_opts->pcrlock);
 		if (ret < 0) {
 			pr_info("pcrlock failed (%d)\n", ret);
 			goto out;
 		}
 	}
 out:
+	kfree_sensitive(options->private);
 	kfree_sensitive(options);
 	return ret;
 }
diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index 6340823f8b53..568c4af9010c 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -24,6 +24,7 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
 			   struct trusted_key_options *options,
 			   u8 *src, u32 len)
 {
+	struct trusted_tpm_options *tpm_opts;
 	const int SCRATCH_SIZE = PAGE_SIZE;
 	u8 *scratch = kmalloc(SCRATCH_SIZE, GFP_KERNEL);
 	u8 *work = scratch, *work1;
@@ -46,7 +47,9 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
 	work = asn1_encode_oid(work, end_work, tpm2key_oid,
 			       asn1_oid_len(tpm2key_oid));
 
-	if (options->blobauth_len == 0) {
+	tpm_opts = options->private;
+
+	if (tpm_opts->blobauth_len == 0) {
 		unsigned char bool[3], *w = bool;
 		/* tag 0 is emptyAuth */
 		w = asn1_encode_boolean(w, w + sizeof(bool), true);
@@ -69,7 +72,7 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
 		goto err;
 	}
 
-	work = asn1_encode_integer(work, end_work, options->keyhandle);
+	work = asn1_encode_integer(work, end_work, tpm_opts->keyhandle);
 	work = asn1_encode_octet_string(work, end_work, pub, pub_len);
 	work = asn1_encode_octet_string(work, end_work, priv, priv_len);
 
@@ -102,6 +105,7 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
 			   struct trusted_key_options *options,
 			   u8 **buf)
 {
+	struct trusted_tpm_options *tpm_opts;
 	int ret;
 	struct tpm2_key_context ctx;
 	u8 *blob;
@@ -120,8 +124,10 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
 	if (!blob)
 		return -ENOMEM;
 
+	tpm_opts = options->private;
+
 	*buf = blob;
-	options->keyhandle = ctx.parent;
+	tpm_opts->keyhandle = ctx.parent;
 
 	memcpy(blob, ctx.priv, ctx.priv_len);
 	blob += ctx.priv_len;
@@ -233,6 +239,7 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 		      struct trusted_key_payload *payload,
 		      struct trusted_key_options *options)
 {
+	struct trusted_tpm_options *tpm_opts;
 	off_t offset = TPM_HEADER_SIZE;
 	struct tpm_buf buf, sized;
 	int blob_len = 0;
@@ -240,11 +247,13 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 	u32 flags;
 	int rc;
 
-	hash = tpm2_find_hash_alg(options->hash);
+	tpm_opts = options->private;
+
+	hash = tpm2_find_hash_alg(tpm_opts->hash);
 	if (hash < 0)
 		return hash;
 
-	if (!options->keyhandle)
+	if (!tpm_opts->keyhandle)
 		return -EINVAL;
 
 	rc = tpm_try_get_ops(chip);
@@ -268,18 +277,19 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 		goto out_put;
 	}
 
-	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
+	rc = tpm_buf_append_name(chip, &buf, tpm_opts->keyhandle, NULL);
 	if (rc)
 		goto out;
 
 	tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT,
-				    options->keyauth, TPM_DIGEST_SIZE);
+				    tpm_opts->keyauth, TPM_DIGEST_SIZE);
 
 	/* sensitive */
-	tpm_buf_append_u16(&sized, options->blobauth_len);
+	tpm_buf_append_u16(&sized, tpm_opts->blobauth_len);
 
-	if (options->blobauth_len)
-		tpm_buf_append(&sized, options->blobauth, options->blobauth_len);
+	if (tpm_opts->blobauth_len)
+		tpm_buf_append(&sized, tpm_opts->blobauth,
+			       tpm_opts->blobauth_len);
 
 	tpm_buf_append_u16(&sized, payload->key_len);
 	tpm_buf_append(&sized, payload->key, payload->key_len);
@@ -292,14 +302,15 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
 
 	/* key properties */
 	flags = 0;
-	flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
+	flags |= tpm_opts->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
 	flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
 	tpm_buf_append_u32(&sized, flags);
 
 	/* policy */
-	tpm_buf_append_u16(&sized, options->policydigest_len);
-	if (options->policydigest_len)
-		tpm_buf_append(&sized, options->policydigest, options->policydigest_len);
+	tpm_buf_append_u16(&sized, tpm_opts->policydigest_len);
+	if (tpm_opts->policydigest_len)
+		tpm_buf_append(&sized, tpm_opts->policydigest,
+			       tpm_opts->policydigest_len);
 
 	/* public parameters */
 	tpm_buf_append_u16(&sized, TPM_ALG_NULL);
@@ -373,6 +384,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 			 u32 *blob_handle)
 {
 	u8 *blob_ref __free(kfree) = NULL;
+	struct trusted_tpm_options *tpm_opts;
 	struct tpm_buf buf;
 	unsigned int private_len;
 	unsigned int public_len;
@@ -391,8 +403,10 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 		blob_ref = blob;
 	}
 
+	tpm_opts = options->private;
+
 	/* new format carries keyhandle but old format doesn't */
-	if (!options->keyhandle)
+	if (!tpm_opts->keyhandle)
 		return -EINVAL;
 
 	/* must be big enough for at least the two be16 size counts */
@@ -433,11 +447,11 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 		return rc;
 	}
 
-	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
+	rc = tpm_buf_append_name(chip, &buf, tpm_opts->keyhandle, NULL);
 	if (rc)
 		goto out;
 
-	tpm_buf_append_hmac_session(chip, &buf, 0, options->keyauth,
+	tpm_buf_append_hmac_session(chip, &buf, 0, tpm_opts->keyauth,
 				    TPM_DIGEST_SIZE);
 
 	tpm_buf_append(&buf, blob, blob_len);
@@ -481,6 +495,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 			   struct trusted_key_options *options,
 			   u32 blob_handle)
 {
+	struct trusted_tpm_options *tpm_opts;
 	struct tpm_header *head;
 	struct tpm_buf buf;
 	u16 data_len;
@@ -502,10 +517,12 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 	if (rc)
 		goto out;
 
-	if (!options->policyhandle) {
+	tpm_opts = options->private;
+
+	if (!tpm_opts->policyhandle) {
 		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT,
-					    options->blobauth,
-					    options->blobauth_len);
+					    tpm_opts->blobauth,
+					    tpm_opts->blobauth_len);
 	} else {
 		/*
 		 * FIXME: The policy session was generated outside the
@@ -518,9 +535,10 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 		 * could repeat our actions with the exfiltrated
 		 * password.
 		 */
-		tpm2_buf_append_auth(&buf, options->policyhandle,
+		tpm2_buf_append_auth(&buf, tpm_opts->policyhandle,
 				     NULL /* nonce */, 0, 0,
-				     options->blobauth, options->blobauth_len);
+				     tpm_opts->blobauth,
+				     tpm_opts->blobauth_len);
 		if (tpm2_chip_auth(chip)) {
 			tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT, NULL, 0);
 		} else  {
-- 
2.43.0


