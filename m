Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4046BC2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7gYn0Wjzz300S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:07:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=IGN66SNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.120;
 helo=smtp-relay-canonical-0.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=IGN66SNB; 
 dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7gXn36cSz305p
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:06:16 +1100 (AEDT)
Received: from mussarela.. (unknown [191.23.94.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5A3F33F051; 
 Tue,  7 Dec 2021 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638882372;
 bh=pfD3hfjfBHQLHEt8+m6l+yGjSs+9S0CZh8LkB9uKIEI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=IGN66SNBhGbgESvzIgH66Zkq68fAioBytkskSs0gtHv2qEUNvRkTXMBgZcZ35SEAo
 Zg3ITm7VTfHma1leKyg8yseZIjlHAXE8xe2nZN4pOW9CB5jkBCzapsWtfiQflSengO
 pJU5K2YUSedpKmVN8GzJk6nx3+es7LVGIzCa6REuavZffcWZcMfcR69B9R+PhqQWSG
 LH3Bvj7GST8Bma9cqhnHqbgmQDQJC/Fe52kt42TuSPaJAZPdFr3HNJYMo1kpY0WABn
 VSHN35sOjWH/eCQilhCV43j2MpWRE6e2e+VniyVteS5/uXhYqLggaPbZLyykNpLOBY
 2uiOVlpNL7MiA==
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc/spectre_v2: Return skip code when
 miss_percent is high
Date: Tue,  7 Dec 2021 10:05:57 -0300
Message-Id: <20211207130557.40566-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A mis-match between reported and actual mitigation is not restricted to the
Vulnerable case. The guest might also report the mitigation as "Software
count cache flush" and the host will still mitigate with branch cache
disabled.

So, instead of skipping depending on the detected mitigation, simply skip
whenever the detected miss_percent is the expected one for a fully
mitigated system, that is, above 95%.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 tools/testing/selftests/powerpc/security/spectre_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index adc2b7294e5f..83647b8277e7 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -193,7 +193,7 @@ int spectre_v2_test(void)
 			 * We are not vulnerable and reporting otherwise, so
 			 * missing such a mismatch is safe.
 			 */
-			if (state == VULNERABLE)
+			if (miss_percent > 95)
 				return 4;
 
 			return 1;
-- 
2.32.0

