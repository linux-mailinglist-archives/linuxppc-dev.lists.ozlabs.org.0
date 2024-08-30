Return-Path: <linuxppc-dev+bounces-811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9A9661A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 14:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwHWc6n85z30CB;
	Fri, 30 Aug 2024 22:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725020940;
	cv=none; b=Gt1vXkZ1Om+OC9eMTDeReVviTdKVUIQ4wHVpkO+rNRpJ6ZyI/OexnKIglrtQmsxYst079jwh3R2cH0LmL7BCblklOPrvG5Tu5zuNlP5CXtoqi5dgLnRbRf0/KUITfMyu+jimWjmWgqVUEC4mmpJ08w8vwO8UFjHxaFIktL/JLeyNUGuzdLGRyAYcYx311dQuoHy6+DZFc3lHvKcreSY6MERHRQ7XC4f948KEeeMi53qTD+izQKmM5Z7+1PzDu3/ft5J2gHedlvq32/WubV4msPxyGc/0ySjr7VlOfc20I1l1ZBMZFa8edIKMN4N2k0f6z5GGkQikBJsWWDYzVlBTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725020940; c=relaxed/relaxed;
	bh=3PWC7w5tqU3FWnmEB+bhYVaHr/DdfkNgbI8gDGNi2lM=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=FOUZtnz90fe4pOqrYHO8aHP+dcgufe3dv5JZeCQ5bF+JeAIHnlIQeagKklhvswj1SI4lPDn7QWoNNAr1/4gGOEWM9FyLqvpU6RUxiVinKXEc4YCmyzMMC3jq84R9pNb1ujZb1erNA+jZ+uDTdO0c5HBWkMaLcyXdcQm7+q60/k6Kl6Ag0vS4mQksKEG3hLnQJ85dWFbFpS8jYiegFJdmc0C2eoAZVj6EabyyMP/4Oa+wQzMKnJ+Au1gwyTviJNKorm/xL9LixXIrJrWkHQIdVqZCbtAJroOBv9hIVNdnPkwEAkbDNDDcI76i/IGfvkPpbOvu+5ddRLU6A8fRL1Qh+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHWc4Rbzz300B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:29:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwHWS32fZz9sSK;
	Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqpSmI7yge0W; Fri, 30 Aug 2024 14:28:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwHWR5DWgz9sS8;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A1C238B764;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TbYxRHbKDEWk; Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 263AD8B799;
	Fri, 30 Aug 2024 14:28:51 +0200 (CEST)
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
Subject: [PATCH 2/5] selftests: vdso: Fix vdso_config for powerpc
Date: Fri, 30 Aug 2024 14:28:36 +0200
Message-ID: <f6b730b24361e4154019ec5fefdb8b9b10afb396.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
References: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725020918; l=1294; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=oJ1xcMwdmfR/v7V7BgzIj/WZTewzoHvz/SQaj3yOdaw=; b=ola5krc4mogdL/CH2op9DISC1pgL83EAmvQG0ipPNvIi4OTmpyR5rqdBXqAi/GUztMEdV3jnO AA4aGWq4LdpCk99ICkbprGAUK68fxmfkBshaZFfPlqnNGAlyTYJjTq4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Running vdso_test_correctness on powerpc64 gives the following warning:

  ~ # ./vdso_test_correctness
  Warning: failed to find clock_gettime64 in vDSO

This is because vdso_test_correctness was built with VDSO_32BIT defined.

__powerpc__ macro is defined on both powerpc32 and powerpc64 so
__powerpc64__ needs to be checked first in vdso_config.h

Fixes: 693f5ca08ca0 ("kselftest: Extend vDSO selftest")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/vDSO/vdso_config.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_config.h b/tools/testing/selftests/vDSO/vdso_config.h
index 7b543e7f04d7..00bfed6e4922 100644
--- a/tools/testing/selftests/vDSO/vdso_config.h
+++ b/tools/testing/selftests/vDSO/vdso_config.h
@@ -18,13 +18,13 @@
 #elif defined(__aarch64__)
 #define VDSO_VERSION		3
 #define VDSO_NAMES		0
-#elif defined(__powerpc__)
+#elif defined(__powerpc64__)
 #define VDSO_VERSION		1
 #define VDSO_NAMES		0
-#define VDSO_32BIT		1
-#elif defined(__powerpc64__)
+#elif defined(__powerpc__)
 #define VDSO_VERSION		1
 #define VDSO_NAMES		0
+#define VDSO_32BIT		1
 #elif defined (__s390__)
 #define VDSO_VERSION		2
 #define VDSO_NAMES		0
-- 
2.44.0


