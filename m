Return-Path: <linuxppc-dev+bounces-848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E4967B71
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2024 19:24:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxdzV0rNsz2xrC;
	Mon,  2 Sep 2024 03:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725211462;
	cv=none; b=hO6aiFAfAunLNRuoBgzhl/NQHFnWCj5baoSjoOg846oBpPAJ5wmwvrytmNLMtf9Lbtce3OG0urLf4v2iNFvUZ0mowaNfcgxJVEuTYcV1zw4HhTRwI2tvc2T9C+ICWl90iS0zIo9Ju62P+/15y+uv1jxLhQQ7VIV8YcefZuKW9Opcfuo1XdA9BX+GfbOHhlJP9+3PICXAsRmpxDF/xhRZJFz6hY9Q60IdFME3dguAFmz17hb5ktxheJlwDOL7SmW4JeYixfN1PwSfXjK8iMkhiXUpKMhS+5mOKj73m4DKAWOCSO9MGEfsXPXSP+c++zlM8ZBGLS7fDCi+iRWQN/FClg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725211462; c=relaxed/relaxed;
	bh=DtrvZ6rD6FDcuRRo2yStqFlGEThWrinjs3eV3gDcIXU=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding; b=boj72WMt8QR19042pz+LOHe4PIVSUzR0zna6OhYF3F8Td3VGI9mVAOq3cEfU6MxsDgzT1lWJ/thhlDShvDnTjECdQn/eZVrytAmRlUJt3LsLFSvAANHTO/5YLeX2dCaH4yOYbBlyExrRuktcdmy/fWxR16i8DtB+dU2+q8G4XwTYcVnn13qEdHe2t68nMdsUPetBaa1QtxbztW+3LPZsbqGxZl0cdasdQDyEU1gAPR/XoOuabZ3pDmPlxMLkPUYBrTcKJFYHETbw6IEVIwuxgWRGcRk2U/PGBvH2z3yb9ZG+OfRdF0Cf/ftDrjxyJUxiCTCly9kpjofr4GQo5/Dmzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxdzT5VY1z2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 03:24:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WxdzL0BzQz9sSN;
	Sun,  1 Sep 2024 19:24:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUoScOBEsnuO; Sun,  1 Sep 2024 19:24:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WxdzK6MP7z9sSK;
	Sun,  1 Sep 2024 19:24:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C43CA8B767;
	Sun,  1 Sep 2024 19:24:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Cn_kBlYynRVV; Sun,  1 Sep 2024 19:24:13 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.154])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 621E38B763;
	Sun,  1 Sep 2024 19:24:13 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: vDSO: Build vDSO tests with O2 optimisation
Date: Sun,  1 Sep 2024 19:24:03 +0200
Message-ID: <46efa1f62e1604c98d10a1b6856a2b2aec0cfe9c.1725211324.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725211443; l=1306; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=bs+qC6glSgwSCedgq3WLvudKNH/1oLu2pg4U7ZuhR8k=; b=Tv9CZN256k/rxjkm7Waqxj89GaBVxfdFSDD8mxhQer/H94HByLm8t5CliDKIbNNciOGx4x4Mi 6xQ0AxpmqyoCJVNIYKtg06MzdHeHKUDcCdusJTxiCtP+s4w7Gn4RuUM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Without -O2, the generated code for testing chacha function is awful.
GCC even implements rol32() as a function instead of just using the
rotlwi instruction, that function is 20 instructions long.

	~# time ./vdso_test_chacha
	TAP version 13
	1..1
	ok 1 chacha: PASS
	real    0m 37.16s
	user    0m 36.89s
	sys     0m 0.26s

Several other selftests directory add -O2, and the kernel is also
always built with optimisation active. Do the same for vDSO selftests.

With this patch the time is reduced by approx 15%.

	~# time ./vdso_test_chacha
	TAP version 13
	1..1
	ok 1 chacha: PASS
	real    0m 32.09s
	user    0m 31.86s
	sys     0m 0.22s

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index cfb7c281b22c..96f25aa2f84e 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -13,7 +13,7 @@ TEST_GEN_PROGS += vdso_test_correctness
 TEST_GEN_PROGS += vdso_test_getrandom
 TEST_GEN_PROGS += vdso_test_chacha
 
-CFLAGS := -std=gnu99
+CFLAGS := -std=gnu99 -O2
 
 ifeq ($(CONFIG_X86_32),y)
 LDLIBS += -lgcc_s
-- 
2.44.0


