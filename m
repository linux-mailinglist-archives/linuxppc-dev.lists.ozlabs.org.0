Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F917FBB94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 14:30:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DlnF8rpq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfjxk4qT4z3dLZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:30:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DlnF8rpq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfjv444K1z2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 00:28:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701178080;
	bh=6GjWiie46bFUNT2MT3rH8IEewOgtpJasNxUDdXOUCGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DlnF8rpq/9z02gTjVpMZsVG2BlEozOSQsob9dg/8AqKpgiioTPA69oBNfX8pMtHCE
	 Ou/jibcESnVSBzFEsjJhIKtTMqLRSQZ0Ii/sp0eIKhrnxGthYamQh5XkjXn7qpL135
	 RnxCj5gIHY3F224MQsExbLCjoCtCqhdiI5hO/Z/7fULWuTOMGTdCNnKiXhtC5ufqik
	 0ghPcT9GQUHFzFTHH3YsxmecTR320KjCgIuhmKY9WOzR60B0hvWlhX7+AnPSOXNKQu
	 5NRNe9rU3aCFiqRwyoq9tc7/zv/0Xbtd+v8yF5vTGapH/JQg8RX6EnR2IX0pAGdowZ
	 W/BhBAyMdfIuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sfjv43GZKz4x5s;
	Wed, 29 Nov 2023 00:28:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/5] selftests/powerpc: Run fpu_preempt test for 60 seconds
Date: Wed, 29 Nov 2023 00:27:47 +1100
Message-ID: <20231128132748.1990179-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128132748.1990179-1-mpe@ellerman.id.au>
References: <20231128132748.1990179-1-mpe@ellerman.id.au>
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
Cc: tpearson@raptorengineering.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The FPU preempt test only runs for 20 seconds, which is not particularly
long. Run it for 60 seconds to increase the chance of detecting
corruption.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/fpu_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/math/fpu_preempt.c b/tools/testing/selftests/powerpc/math/fpu_preempt.c
index 97dff3690136..9ddede0770ed 100644
--- a/tools/testing/selftests/powerpc/math/fpu_preempt.c
+++ b/tools/testing/selftests/powerpc/math/fpu_preempt.c
@@ -22,7 +22,7 @@
 #include "fpu.h"
 
 /* Time to wait for workers to get preempted (seconds) */
-#define PREEMPT_TIME 20
+#define PREEMPT_TIME 60
 /*
  * Factor by which to multiply number of online CPUs for total number of
  * worker threads
-- 
2.41.0

