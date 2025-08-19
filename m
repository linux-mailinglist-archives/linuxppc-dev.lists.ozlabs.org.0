Return-Path: <linuxppc-dev+bounces-11129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07125B2CA41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 19:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5wz944Ghz3dDP;
	Wed, 20 Aug 2025 03:08:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755623333;
	cv=none; b=FA5PCz9N5PkGvjYerd3ikafVs3OErAezw1RuPQ1AgjXtnzg+sbr6MHbQnbIcJpMCVX4qk/HgXgyOPYQY/X+1FD/kD7HgZCPPvRmXLhLdmJ0l8bGoXoRQ71Bp9A40YUQ1EozxMyh0jox2QkqPV+r3BDC+Wn1oWhTBXDeUaX6tgQ8jHMT9k/chDPJ+beAFREZlNJn4oN1bdCFcL5gbBUPXZbg7PjxeKKZc6OF6X2S/278h38nkFDKYRHYDBKyiosNLqlu8cobFpw/DQcCHgqGjQgKObYdplV8I/GrjXesdXfZwuR5bQhauUpVuUag4beVga2evyohlu/dNHiNF9Sj/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755623333; c=relaxed/relaxed;
	bh=8cP+VflgCVNtVf3f9XKodv6qzOPG+U075h9FA37e9FM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQpCfHwyGFRxsrR6mIkXReM/d0JUTm7b47lIbAmyQ77GrRAfOS/BcXZrGNOdmCERY9bnnw63cseJ28ktjFGiIvWSw+dUPhQXOJeWmMWj8WTtxoRG4yJiLosWJG2KlwYdXxrllIlvp2Fnh8Y/Qe0RLEj1nfNE5Ux72lQXblvm7TNU66/e8NYr/QBMmb7UdN3qoXcLBtKFYedZncgCrfsU01gDOPpVqwD0x7Ytu8/pA5LrOABLarwXB06ppm/RUwjWhik0cRq7E2+SzYkdTRlFzwFPmZwopJzkdOEBVXLoJ5RUhCxtbzblj8ZJy3DbHPF/BNJiS3H24eP3zT0N2vvkCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LdKA+KXR; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LdKA+KXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 519 seconds by postgrey-1.37 at boromir; Wed, 20 Aug 2025 03:08:50 AEST
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5wz61pQnz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 03:08:49 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755622784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8cP+VflgCVNtVf3f9XKodv6qzOPG+U075h9FA37e9FM=;
	b=LdKA+KXRzXtZpB0v3KtcG8Gs6/M5Cg8Qdz8KMxGwO6r4rvE8A2EmKAGRDjUnNQkbhjyYPU
	Mby6P09sUzosolNNbCKMTa7aDgYFf0W4k04Tx6/FmP5JrRa/GQEogfsdAf/oVQshpUbXqW
	XciK4c4zf6Pvqw40hhxMRmetDTfLSNI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()
Date: Tue, 19 Aug 2025 18:58:29 +0200
Message-ID: <20250819165829.714344-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove hard-coded strings by using the str_write_read() helper function
and silence the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

  opportunity for str_write_read(write)

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/ps3/ps3stor_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ps3/ps3stor_lib.c b/drivers/ps3/ps3stor_lib.c
index a12a1ad9b5fe..3d4d343ee0c8 100644
--- a/drivers/ps3/ps3stor_lib.c
+++ b/drivers/ps3/ps3stor_lib.c
@@ -8,6 +8,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 #include <asm/lv1call.h>
 #include <asm/ps3stor.h>
@@ -265,7 +266,7 @@ u64 ps3stor_read_write_sectors(struct ps3_storage_device *dev, u64 lpar,
 			       u64 start_sector, u64 sectors, int write)
 {
 	unsigned int region_id = dev->regions[dev->region_idx].id;
-	const char *op = write ? "write" : "read";
+	const char *op = str_write_read(write);
 	int res;
 
 	dev_dbg(&dev->sbd.core, "%s:%u: %s %llu sectors starting at %llu\n",
-- 
2.50.1


