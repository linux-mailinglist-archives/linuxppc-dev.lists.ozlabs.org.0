Return-Path: <linuxppc-dev+bounces-810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 171699661A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 14:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwHWX5Dgmz304B;
	Fri, 30 Aug 2024 22:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725020936;
	cv=none; b=MnyRte7hQdwbhGqp0nt0hNr213ydVkXd15VyzDJ7JHTz5bzdIhsa1+oNsKS+DiIaLmMMdPogh0vEpsaKvAPTAvd73sr/EYtIzermXRQqE8tQjofzjkRIRyrQVpNyqbUzzi6r9TH7lIkdKPF+96JsfDFGzcvy1GD8fJNnYxfet+YBzEDvxMFUWH0ULpNUePQn+8FGTnblWHvoECMQfji/C0T1FHNkICsF/XayYb0A+zyAlS9I2aF9yT5hJz6ytEE9JILm5qSHQ4vMOmFTF4zHJHlCaiy+PJLLhRG3KVDmZkWPozlOtGpOTV3ZYp9bVO0sfP+X4P1s/EOfBS5gMf40aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725020936; c=relaxed/relaxed;
	bh=A+rmpRSl1uHby4VKNAcqAgRy0R0NS9niiUfrWTXQ37A=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding; b=V/xJh16Ze28hIxc57U9AIBZiV7wj5J8FArG2N88RpYaZR0gsHOHBTcknnNXAXtY3PesQnU4eriFFA0ZZyhP21ho3z3W3f5x7UObjrq6OlfyORTE/7ypI7FSuAWy5hYI4EPjDwxmArzJRZ9+YenTfZIWXn28/VvAwRvblSxEpxuf08VIivCb4IRr0s2ZpXQmwHeZ/ursl3HAZXVkZl+HNvXsli3tx6Cl/FU81xTQPZbPGPQwHLEemjCSZe0CcfQ2r7XL468DWInyXcOk1YeLNNgxIvssbshpK8+R0bXpc35fw6hcUUiKfPSri3FX0Dq5EydIl19SEH3OzqiN5k9k+Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHWX2Ztmz300B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:28:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwHWR2MX5z9sSC;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBkr1uqN9TXB; Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwHWR1XJMz9sS8;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24C748B794;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gHt5fIi9xSXm; Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C72E8B764;
	Fri, 30 Aug 2024 14:28:50 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@mit.edu>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] selftests: vdso: Fix vDSO name for powerpc
Date: Fri, 30 Aug 2024 14:28:35 +0200
Message-ID: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725020918; l=1444; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1CBaJwzTNzlgxwtmL+5E5zwxDWXC8lvz35YzdHo+8qQ=; b=GqQlckbm4yv99v1KrYHEPLEGiiksyVmMX/s/reH2va53dhe71BAE0Uv6wZYaMBlV8LZ/SR+63 eVEeDCGmoePDOwGCQKVauQ4M8mW5KA7aHqDuUajx1yGsozv4zZ/JygN
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Following error occurs when running vdso_test_correctness on powerpc:

~ # ./vdso_test_correctness
[WARN]	failed to find vDSO
[SKIP]	No vDSO, so skipping clock_gettime() tests
[SKIP]	No vDSO, so skipping clock_gettime64() tests
[RUN]	Testing getcpu...
[OK]	CPU 0: syscall: cpu 0, node 0

On powerpc, vDSO is neither called linux-vdso.so.1 nor linux-gate.so.1
but linux-vdso32.so.1 or linux-vdso64.so.1.

Also search those two names before giving up.

Fixes: c7e5789b24d3 ("kselftest: Move test_vdso to the vDSO test suite")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index e691a3cf1491..cdb697ae8343 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -114,6 +114,12 @@ static void fill_function_pointers()
 	if (!vdso)
 		vdso = dlopen("linux-gate.so.1",
 			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
+	if (!vdso)
+		vdso = dlopen("linux-vdso32.so.1",
+			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
+	if (!vdso)
+		vdso = dlopen("linux-vdso64.so.1",
+			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
 	if (!vdso) {
 		printf("[WARN]\tfailed to find vDSO\n");
 		return;
-- 
2.44.0


