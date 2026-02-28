Return-Path: <linuxppc-dev+bounces-17453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPReM2bzomlD8QQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:53:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C531C35C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNRVp1qv8z3c4d;
	Sun, 01 Mar 2026 00:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772286818;
	cv=none; b=n7C4BZAmaLamkDiZIhtUzr2NS2tLSORrzc6CeNWNDNhc94OCsowhht3PxhFtwNKQT1k5a02wohAhrCSGot3EuOtgWu9MLWH7IrBViEmRbNvih9H2rEXFWyKsPSLIIKSkaxunzJ/mRJnVI+qGY4Z4OgMjKuwhnJU/xTx7eL2maJ3pH4TC7hIJBQYEWSGbMzKBlwRfqtRSd0/htwhBkuSk40s6v4GkyIJPzwvffleFD+uaycXgoHrgmunkmnV1JoJm+OyB7iVz2D24WZ4hTwKlBtg8iXhzgzvJlsrYMCpzaq0zHQU8fydJsP/wGmscDUIVvC5+28d9GH/t+MGt1otNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772286818; c=relaxed/relaxed;
	bh=1zPHSD8Nr9GKccVpCF6s6vJbp1Gbd+d5cYC/E9ROuQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmyEJP9nLlJScXlLq8AFJ8VfB0R1jBglHVaDcs1VEDtNy9UBiikmnn2Lwuls7hWqaRRhxTB6z4Z76H4bMMZsxnrGDYPLMvEGGqE+MVZ3Sug3wiwhJXizOK4jXF3nMlmEKA4C5/J8ljSkKoBzBPAhd2TcP8MkRb1nSlI+wy7vRi/vcT2eOzVNn99zLg8jEgfXJ1V9ipv0I/DjMZXR5y+lFGlhmY/DePddYr23lJZXyy+98o4CIL2GSMahGL7/0KfF0wjyeb9H7vJ0FnURZiWCrIyS6RAqswBotHhcSdkJjHsErbsrtTcmMka81TL3lKlGhQOBtdPv05AcY5gu3MncoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bI+fPjTU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bI+fPjTU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNRVn3WCDz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 00:53:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S4tHxn2031079;
	Sat, 28 Feb 2026 13:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1zPHSD8Nr9GKccVpC
	F6s6vJbp1Gbd+d5cYC/E9ROuQA=; b=bI+fPjTUP2TxB/ywBoakb8fId6ZGYpnP2
	9M95yTvykqStEXvxhCmt4gI5UW27USL4fcvG4fjVMt30QStz6pyvPuH3sdwS9put
	8Uwqpb2YHIccosOq5QZoS7+QnSxqEShE8kbXPT6Geq4b5HvXWUq4eeuVWBbYsZv4
	R4ZW6WQ7Kfa26nhrQ+Db+vz4DXUCXXDozwFiq7rtMOIk5hx6aqZPIuxEzaVl00pv
	2e/F/X1uR4D3Uz8wpwsXZrYeLj62oLg4MXa0Pec2OzA8LyWKl35tuVbXkvskV31s
	ehZyXVkt/3YQUkMHh8fHsyldudPIwQwBhB0zweeWX+nziq+ltbgIw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrhs0fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:53:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61S8FeIq001607;
	Sat, 28 Feb 2026 13:53:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1nptwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:53:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SDrRoB29885130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 13:53:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7880E20043;
	Sat, 28 Feb 2026 13:53:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24E2B20040;
	Sat, 28 Feb 2026 13:53:23 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.124.210.20])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 13:53:22 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: [PATCH v2 2/2] powerpc/selftests/copyloops: extend selftest to exercise __copy_tofrom_user_power7_vmx
Date: Sat, 28 Feb 2026 19:23:19 +0530
Message-ID: <20260228135319.238985-2-sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260228135319.238985-1-sayalip@linux.ibm.com>
References: <20260228135319.238985-1-sayalip@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a2f35c cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=gZzq1o9Dtywjk6PVXYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNiBTYWx0ZWRfX01dqOEQ+qmOA
 gN2XkVupJ9L3Vt2eGGJDkkMEwT1Cg0pdFBaxAfNrhAmQknjjJru3C74Z9ZFWAfdlpXaawsoLkSe
 Ip2qPFisYub/kRQ7H/cIxnKOpKecKHMNefm58ObmEpWure7Illuanrp3DK5LR5t9MWFw8nGn9Wu
 2XpCPEuUVbix2n4rLEvyKxwhKKkZ7jQBkb+v5cISy2TALxXn1jKSHyFMFv1PsfMzCyFU5Ziz4s1
 kei3ZB2sBeG1s5KXEL22rz4OqNlpXp8lK2iFlRcAdD13Oat7Wqqqn68HDiJEQhSG87gB5h4Fkl2
 KfehKK03/xrh8y1jWoaF2gTLtreqLGa7IQlYoGN8S60qREJOq7rSWVKNd36H8OZCdmkAG6BikPh
 fY+umv+POy1FrJpvgG/2wK9BVZeqd+kBTp3qAkp4JL+YY6AMe5clI6G1EL7EMMCzFXoBxqdHnxZ
 VtQn/+pju0kbKADyevg==
X-Proofpoint-GUID: gHTAaKtKdIXNPqt0atfLREmNMuQJu8ah
X-Proofpoint-ORIG-GUID: gHTAaKtKdIXNPqt0atfLREmNMuQJu8ah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17453-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 25C531C35C4
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

v1->v2
No changs in the patch.

v1: https://lore.kernel.org/all/20260217124457.89219-2-sayalip@linux.ibm.com/

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


