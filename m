Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B89599A66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Jpv2bByz3dxN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n3APHCjA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8JpK50Cwz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 21:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n3APHCjA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8JpG02Nlz4x1G;
	Fri, 19 Aug 2022 21:05:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660907158;
	bh=qDaNGFrjkTr/2c17HZF7YEdK2qSIXC8cTLExvM6qBeA=;
	h=From:To:Subject:Date:From;
	b=n3APHCjAXDs6kM3hYvz3qhnXU73Hv9CwtcThMXkju3H4YoMAxlx6aMNu/k7u71OsV
	 qWdwLXvbUWFpcUwUTVSlaJGj0/PIaOlECOVYWzHkw0r7mQP4PQldwxj7X5sUFfsT69
	 zYLRdqyoYPqnlzmuz3Ew3/CdaEHlVmVWDL6wVfk0whvEuGcPdChghjsdpOr/IBQVvw
	 EfH0D7wfg+iqSY1c0oNSJTMEi7xbnQZ8pe5JiFzuBHKCqzztjQZTw7WTAsp38J37ra
	 EVFN5gRHBUKwSx3M9o2o50AlPZAs81LEeqrwAN1V+ipVGvZ1RqrA7Ip7tpZwyVt08f
	 XJh3Ucwc29aOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/boot: Drop unused dummy.c
Date: Fri, 19 Aug 2022 21:05:56 +1000
Message-Id: <20220819110556.434970-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The last use of dummy.c was dropped in commit 2bf118197cb4 ("[POWERPC]
Create a "wrapper" script and use it in arch/powerpc/boot").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/dummy.c | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 arch/powerpc/boot/dummy.c

diff --git a/arch/powerpc/boot/dummy.c b/arch/powerpc/boot/dummy.c
deleted file mode 100644
index 31dbf45bf99c..000000000000
--- a/arch/powerpc/boot/dummy.c
+++ /dev/null
@@ -1,4 +0,0 @@
-int main(void)
-{
-	return 0;
-}
-- 
2.37.1

