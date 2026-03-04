Return-Path: <linuxppc-dev+bounces-17662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eINaE57Ep2mYjgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:35:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B71FADFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 06:35:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQhG303zKz3c2R;
	Wed, 04 Mar 2026 16:35:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772602522;
	cv=none; b=fQmHHEUHjhtsIfwYhDAHrnWX8UtPmAnNvRJwvWRzmsxoNc17ALbhnYSBXGYK/LnTJE38iV2Nx/KNYBwTR7Gf+Ts6cFrTfaDFAWaIWMhnlHyLuwBwalyuWNECrKtcZwlV4LjN5ev2UoGUflZ/hsZkf/PbHtlLDGcE8IlZiJyOCv1Lq8xd+kTF5bMqo4eWz+sEos4ChYw5uxAa4+2mTkLhcEikiiFj9+B6V/LLfdoJtzvc33VTHsTCOHzdoBnIyonRON7juXzhy7VZT29PGdfaE+crnksWsGOgZzKkV0mjCDvoCLkC7zVWL+34Q3bDj+XMGZlO3+lLLsz8j64exQj7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772602522; c=relaxed/relaxed;
	bh=9uZaslodXGcYyo1ycGh0IFIXYTzGBeUmHeD/I3nZXO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZz9FaWnNavkPvlzRqvv37L6e1Eq0cF3RolSepBzy0xYdWiDUpXt5yKfKugybM44NSNfefptimy7blPqLF+Wy6noj3uqROeAYDY3WBcIlwYEv6e6Xvn8zwVb/pOZ2OnApOKIIuVfnpJTMCWAje3VQTcW5c22glqav1yTDw9UfIiu6QSI5R3ugueuTab64EL3N6gGNOs9BOMWk1gWv3vRd13P8BTCHYk5woY49H0p85nIfdhov+2bn5V00fMVU4JKmHrac+tSj/6Khb1VUXG6se9uyknh4cSbjiY0J5Ks219nmHzPU95Lt1v1v/LLHSZX0l+KNVuvIr1tOCk+pAVA0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JIdS1u/q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JIdS1u/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQhG21Zdfz2yLH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 16:35:22 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623LD2Ik2434764;
	Wed, 4 Mar 2026 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9uZaslodXGcYyo1yc
	Gh0IFIXYTzGBeUmHeD/I3nZXO0=; b=JIdS1u/qzjr3JhXKmKgrc5l87UK+1B2Z0
	dMRcHBwD+wEIeduJQ51MBbG4fpmGsohqAhsTqLin9+Tw98LUr8BxVisaTSJvKlQ9
	E3VGSVNJ6bZdcPXBepjZp+uWg6V/esLDBjBow7K6rW37YX9nQbDh4lxehgDUHqMd
	GhGwK1vUv9xTiKdp7OqfT/e3hok8y67/1w7bxKZrTJgdrIXb1fAq+SqmyOC0CtDJ
	/Oan3SR7iCJe7G0VeHihhFOvqXJG0EeCqKOEhGJazTsY8E9xgKeMdnqHZBu+tp2n
	qF+0qfDqIrk46RlYp48n5Ju+b9tqLtnOQqU6VsMFZ64+TG4jERyaQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrj6233-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:35:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6240onG2027692;
	Wed, 4 Mar 2026 05:35:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjd4pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 05:35:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6245ZDPn51642706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 05:35:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 609D820040;
	Wed,  4 Mar 2026 05:35:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 220DD2004B;
	Wed,  4 Mar 2026 05:35:11 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.124.213.19])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Mar 2026 05:35:10 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: [PATCH v3 2/2] powerpc/selftests/copyloops: extend selftest to exercise __copy_tofrom_user_power7_vmx
Date: Wed,  4 Mar 2026 11:05:06 +0530
Message-ID: <20260304053506.118632-2-sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304053506.118632-1-sayalip@linux.ibm.com>
References: <20260304053506.118632-1-sayalip@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a7c496 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=gZzq1o9Dtywjk6PVXYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0MCBTYWx0ZWRfX9KAUJ2HVGIqO
 2Y8iIRkQoA9iKmhFgi5gfn/JvN5qGK/2+X07kZVUeqKk8YY5KdTJMtLGX3/ELUkB+AMG3+DyYBt
 J30ez3TciIGrMmvRUnNilZT1Lhr4jJ8dm+aDAn+s2HQAKfSjYt7XU/puYxju0Pj20otSi2kh9MU
 ZWKwfgJJku4ZefRxzHj8CL0TxsVKFkZ5GUt4cCsjvHjPKj7OQOPJMy3ZWmkXiJhsgXsIEeOjUbX
 cjRk9SrOI4xjXbwZ4S+BCs7g15oN4amm8vOoVbz2RuUMkGydPFMh0o/iK+4htA2T9Q/bIPibqru
 sEsrmFI2DjCKnxE9j4ZZOVOkQ7Vun7Q8VcEzHmoH6Vsc88EfT1VZDrQULfQc9DgB+JSlqCADpqK
 Du5gvsFv1p+4nZlpvxvM2wZcBIvTN4eXT1cxX56pNij27N9j9ltyrSsXKDToqfy351x6j+0bAhV
 9i4r9N2/YawET97fVtw==
X-Proofpoint-GUID: 89R_jnalKZzgUKu1K2FzMkOFF-TMC_1H
X-Proofpoint-ORIG-GUID: 89R_jnalKZzgUKu1K2FzMkOFF-TMC_1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040040
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 6B4B71FADFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17662-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The new PowerPC VMX fast path (__copy_tofrom_user_power7_vmx) is not
exercised by existing copyloops selftests. This patch updates
the selftest to exercise the VMX variant, ensuring the VMX copy path
is validated.

Changes include:
  - COPY_LOOP=test___copy_tofrom_user_power7_vmx with -D VMX_TEST is used
    in existing selftest build targets.
  - Inclusion of ../utils.c to provide get_auxv_entry() for hardware
    feature detection.
  - At runtime, the test skips execution if Altivec is not available.
  - Copy sizes above VMX_COPY_THRESHOLD are used to ensure the VMX
    path is taken.

This enables validation of the VMX fast path without affecting systems
that do not support Altivec.

Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---

v2->v3
No changes in the patch.

v2: https://lore.kernel.org/all/20260228135319.238985-2-sayalip@linux.ibm.com/

---
 .../selftests/powerpc/copyloops/.gitignore        |  4 ++--
 .../testing/selftests/powerpc/copyloops/Makefile  | 11 ++++++++---
 tools/testing/selftests/powerpc/copyloops/stubs.S |  8 --------
 .../selftests/powerpc/copyloops/validate.c        | 15 ++++++++++++++-
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore b/tools/testing/selftests/powerpc/copyloops/.gitignore
index 7283e8b07b75..80d4270a71ac 100644
--- a/tools/testing/selftests/powerpc/copyloops/.gitignore
+++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
@@ -2,8 +2,8 @@
 copyuser_64_t0
 copyuser_64_t1
 copyuser_64_t2
-copyuser_p7_t0
-copyuser_p7_t1
+copyuser_p7
+copyuser_p7_vmx
 memcpy_64_t0
 memcpy_64_t1
 memcpy_64_t2
diff --git a/tools/testing/selftests/powerpc/copyloops/Makefile b/tools/testing/selftests/powerpc/copyloops/Makefile
index 42940f92d832..0c8efb0bddeb 100644
--- a/tools/testing/selftests/powerpc/copyloops/Makefile
+++ b/tools/testing/selftests/powerpc/copyloops/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_GEN_PROGS := copyuser_64_t0 copyuser_64_t1 copyuser_64_t2 \
-		copyuser_p7_t0 copyuser_p7_t1 \
+		copyuser_p7 copyuser_p7_vmx \
 		memcpy_64_t0 memcpy_64_t1 memcpy_64_t2 \
 		memcpy_p7_t0 memcpy_p7_t1 copy_mc_64 \
 		copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2 \
@@ -28,10 +28,15 @@ $(OUTPUT)/copyuser_64_t%:	copyuser_64.S $(EXTRA_SOURCES)
 		-D SELFTEST_CASE=$(subst copyuser_64_t,,$(notdir $@)) \
 		-o $@ $^
 
-$(OUTPUT)/copyuser_p7_t%:	copyuser_power7.S $(EXTRA_SOURCES)
+$(OUTPUT)/copyuser_p7:	copyuser_power7.S $(EXTRA_SOURCES)
 	$(CC) $(CPPFLAGS) $(CFLAGS) \
 		-D COPY_LOOP=test___copy_tofrom_user_power7 \
-		-D SELFTEST_CASE=$(subst copyuser_p7_t,,$(notdir $@)) \
+		-o $@ $^
+
+$(OUTPUT)/copyuser_p7_vmx:       copyuser_power7.S $(EXTRA_SOURCES) ../utils.c
+	$(CC) $(CPPFLAGS) $(CFLAGS) \
+		-D COPY_LOOP=test___copy_tofrom_user_power7_vmx \
+		-D VMX_TEST \
 		-o $@ $^
 
 # Strictly speaking, we only need the memcpy_64 test cases for big-endian
diff --git a/tools/testing/selftests/powerpc/copyloops/stubs.S b/tools/testing/selftests/powerpc/copyloops/stubs.S
index ec8bcf2bf1c2..3a9cb8c9a3ee 100644
--- a/tools/testing/selftests/powerpc/copyloops/stubs.S
+++ b/tools/testing/selftests/powerpc/copyloops/stubs.S
@@ -1,13 +1,5 @@
 #include <asm/ppc_asm.h>
 
-FUNC_START(enter_vmx_usercopy)
-	li	r3,1
-	blr
-
-FUNC_START(exit_vmx_usercopy)
-	li	r3,0
-	blr
-
 FUNC_START(enter_vmx_ops)
 	li	r3,1
 	blr
diff --git a/tools/testing/selftests/powerpc/copyloops/validate.c b/tools/testing/selftests/powerpc/copyloops/validate.c
index 0f6873618552..fb822534fbe9 100644
--- a/tools/testing/selftests/powerpc/copyloops/validate.c
+++ b/tools/testing/selftests/powerpc/copyloops/validate.c
@@ -12,6 +12,10 @@
 #define BUFLEN (MAX_LEN+MAX_OFFSET+2*MIN_REDZONE)
 #define POISON 0xa5
 
+#ifdef VMX_TEST
+#define VMX_COPY_THRESHOLD 3328
+#endif
+
 unsigned long COPY_LOOP(void *to, const void *from, unsigned long size);
 
 static void do_one(char *src, char *dst, unsigned long src_off,
@@ -81,8 +85,12 @@ int test_copy_loop(void)
 	/* Fill with sequential bytes */
 	for (i = 0; i < BUFLEN; i++)
 		fill[i] = i & 0xff;
-
+#ifdef VMX_TEST
+	/* Force sizes above kernel VMX threshold (3328) */
+	for (len = VMX_COPY_THRESHOLD + 1; len < MAX_LEN; len++) {
+#else
 	for (len = 1; len < MAX_LEN; len++) {
+#endif
 		for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
 			for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
 				do_one(src, dst, src_off, dst_off, len,
@@ -96,5 +104,10 @@ int test_copy_loop(void)
 
 int main(void)
 {
+#ifdef VMX_TEST
+	/* Skip if Altivec not present */
+	SKIP_IF_MSG(!have_hwcap(PPC_FEATURE_HAS_ALTIVEC), "ALTIVEC not supported");
+#endif
+
 	return test_harness(test_copy_loop, str(COPY_LOOP));
 }
-- 
2.52.0


