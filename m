Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1DD58D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 01:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rz0S64pQzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 10:48:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ryyZ33z4zDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 10:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="AWvFjUyR"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46ryyZ0QJ7z9sPK; Mon, 14 Oct 2019 10:46:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46ryyY6pG8z9sPT; Mon, 14 Oct 2019 10:46:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571010405;
 bh=ayLYc1zzq7y9hVbzUsniOeTsZNwafSQ00Ngnf/NyOTM=;
 h=From:To:Subject:Date:From;
 b=AWvFjUyRO+QUlfLS9e7vFUBgsKcC47cDIA/OCUFr4KIzExlpOwZHnQb8BDoffLhgj
 q+X9Frpj4jnhHhozvI9SlkaatKKP+JO3byp+OtlTc30nE55FZp2IeRAIeaZ2z55vjp
 OxUA2ysAccXAuppucNLAI5nTLrsrkXwxZILvqSviRNG3sH5J+oDKdk8adQI7VawAnq
 APZQWGVlVOK4Itmpx6iPJT6dyziruwHN5KX1/uxUbQPJ9A+tZrkpBRKHT9tp7LLOBL
 5+/yDOgLYbm/guRFeW0LCNX2Ucq0rLBuS6GoWKRxkkEwHGXU4qaRF864tFngR8pWMf
 YW5McSnyotBCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Reduce sigfuz runtime to ~60s
Date: Mon, 14 Oct 2019 10:46:43 +1100
Message-Id: <20191013234643.3430-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The defaults for the sigfuz test is to run for 4000 iterations, but
that can take quite a while and the test harness may kill the test.
Reduce the number of iterations to 600, which gives a runtime of
roughly 1 minute on a Power8 system.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/signal/sigfuz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/signal/sigfuz.c b/tools/testing/selftests/powerpc/signal/sigfuz.c
index dade00c698c2..08f9afe3b95c 100644
--- a/tools/testing/selftests/powerpc/signal/sigfuz.c
+++ b/tools/testing/selftests/powerpc/signal/sigfuz.c
@@ -42,7 +42,7 @@
 #include "utils.h"
 
 /* Selftest defaults */
-#define COUNT_MAX	4000		/* Number of interactions */
+#define COUNT_MAX	600		/* Number of interactions */
 #define THREADS		16		/* Number of threads */
 
 /* Arguments options */
-- 
2.21.0

