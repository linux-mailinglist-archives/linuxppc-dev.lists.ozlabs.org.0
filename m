Return-Path: <linuxppc-dev+bounces-2914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3A9BEC7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:05:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk55r636Dz30NN;
	Thu,  7 Nov 2024 00:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730898304;
	cv=none; b=frFvl4IZwAJII5JvSmp6msZLZCfP9Dptlqokwt+BwKmDWguaE9jfWo8chrkis9Nv2/mCZHcD5+IKXLxYXJMN6lVXs/tD2HYFRkc9Gxp1wtdWHNRQwaG+U/gqvxyZDZtHlMb2aVkYIdDavo/YiZhGyRgrDVQzUtRTjbj4N+W43lP7mEcdkqXxCoXnBPhIQvNvy4OQiMJ4Grfqq9Oq8R4t3swbKPlXR8Ai080HHAZdBCRGIyEOFUmiXFCuhqn5fMp+SVm2IcEqnMc/0TECx+OdZMyNLcW0y1jo/dRb+d2jWq3xVkyvW928eazYbKJstmMrvJBm2FZVbXOybmHYbai6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730898304; c=relaxed/relaxed;
	bh=oEc126lVY8sqIE1oH16a792a7OULOP+M/PDQo12uYUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZHl14ONTAfXBeGfY/YfxVyx7vq8dqSsKaTIcUmLkLvVy3dUZB58pwXJjiZnOJtcnoNuFBjtCZJA/m9pdH/UV7pFr+r86NkxFuzCUrS8OZ8ERJmN+i/FUKqkLvcPslz9TOl0/fgAoAwpgxI7Vx3ntTerD7Es3MvK0weE5YkAgVGLrK5RIwlBIMupOmuH4anCHRIPYIuzIKaLCYYKA+bKI0NI/oUfBpESKrWGSHirQt2tNENIWmYT4oYLGD+8HJhJBOXhD/KkeIfzuULTSwfV97bZPvs2fIjg3O2rHWIm4rd5W0UhzNedd0D8pb8w8ZsvtytAeMzIyTlGZAYPys52bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gv0tLdHm; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gv0tLdHm;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk55q5WHCz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:05:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730898301;
	bh=oEc126lVY8sqIE1oH16a792a7OULOP+M/PDQo12uYUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gv0tLdHmaT1OUnl5g29n/lmsztFYL6Ahesi8b1OCqc/hJCdJfcgjAqq9YLLHKz5tE
	 xxgbn/XzFFzoOn6LSlR/QanbTPNciiKYobOhET/slcyYTUU4WLNrWoKLLf4u6UNOTe
	 GIo+YeSG9PRB7DzKfW8wngDpLuZzdu0TCPpvRAuMFGy4gq1xjd7IEzNPeO8QYJEGD6
	 SHIUV3n6UCi6LwX+YM9VayQRJHa2Ggz+cNdq9iun0PF3kHWM6D66br9j2AU6XZ5F2V
	 Tk26su/1wqcD0h9Oz0i1NPVJMQDWNqv5IN89hxrTcLgq/lzvb7Bga72UCKuAm7Yv2+
	 rNlhTB+cGU/cA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk55n2LJmz4xc7;
	Thu,  7 Nov 2024 00:05:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kselftest@vger.kernel.org>
Subject: [PATCH 5/5] selftests/powerpc: Detect taint change in mitigation patching test
Date: Thu,  7 Nov 2024 00:04:53 +1100
Message-ID: <20241106130453.1741013-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106130453.1741013-1-mpe@ellerman.id.au>
References: <20241106130453.1741013-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently the mitigation patching test errors out if the kernel is
tainted prior to the test running.

That causes the test to fail unnecessarily if some other test has caused
the kernel to be tainted, or if a proprietary or force module is loaded
for example.

Instead just warn if the kernel is tainted to begin with, and only
report a change in the taint state as an error in the test.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/security/mitigation-patching.sh     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/mitigation-patching.sh b/tools/testing/selftests/powerpc/security/mitigation-patching.sh
index f43aa4b77fba..9a4612e2e953 100755
--- a/tools/testing/selftests/powerpc/security/mitigation-patching.sh
+++ b/tools/testing/selftests/powerpc/security/mitigation-patching.sh
@@ -36,8 +36,7 @@ fi
 
 tainted=$(cat /proc/sys/kernel/tainted)
 if [[ "$tainted" -ne 0 ]]; then
-    echo "Error: kernel already tainted!" >&2
-    exit 1
+    echo "Warning: kernel already tainted! ($tainted)" >&2
 fi
 
 mitigations="barrier_nospec stf_barrier count_cache_flush rfi_flush entry_flush uaccess_flush"
@@ -68,9 +67,10 @@ fi
 echo "Waiting for timeout ..."
 wait
 
+orig_tainted=$tainted
 tainted=$(cat /proc/sys/kernel/tainted)
-if [[ "$tainted" -ne 0 ]]; then
-    echo "Error: kernel became tainted!" >&2
+if [[ "$tainted" != "$orig_tainted" ]]; then
+    echo "Error: kernel newly tainted, before ($orig_tainted) after ($tainted)" >&2
     exit 1
 fi
 
-- 
2.47.0


