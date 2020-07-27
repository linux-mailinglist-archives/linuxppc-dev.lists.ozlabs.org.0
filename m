Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8722E638
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFW6C6MQGzDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFW4N1TGKzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:03:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HpvZNPsk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BFW4N09z1z9sPf; Mon, 27 Jul 2020 17:03:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFW4M6Njwz9sRN; Mon, 27 Jul 2020 17:03:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595833427;
 bh=+e33N9pjwOy31NI/YW2FuUMpO+mYa8EuyUkN9D07Z74=;
 h=From:To:Subject:Date:From;
 b=HpvZNPskLYF7kPgWiZaenn0qOvaL+19dSKDuh1qENbBUg8C4ji+yiCRgiA72CN5hN
 U6Wdlc4IzWSjr5cWQSPYoLJM0Oj14xF1v7uvB3jvkmBPD1BdJmzZZM1BIVGt672WSF
 TzKHNNjQZ+m2d2ij2QbAjYMlNatQdaOROHfDKJ+ARLANLxbC6visPRnLFBt9eR+7aO
 ZpS8fuyu5CqpGtdLRf89QOl5c+ffR0qCdFYlZGPMFs4FtiyOEqQRCfk8ojrUvVt7hN
 zzdbSrrmamhIq5fw28HTzRffRP3gfz/H7YyQLKeDtrC8YPMrUXRozZmdrYhqAepmPM
 40YOrLUhsgGQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/fadump: Fix build error with CONFIG_PRESERVE_FA_DUMP=y
Date: Mon, 27 Jul 2020 17:03:41 +1000
Message-Id: <20200727070341.595634-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

skiroot_defconfig fails:

arch/powerpc/kernel/fadump.c:48:17: error: ‘cpus_in_fadump’ defined but not used
   48 | static atomic_t cpus_in_fadump;

Fix it by moving the definition into the #ifdef where it's used.

Fixes: ba608c4fa12c ("powerpc/fadump: fix race between pstore write and fadump crash trigger")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/fadump.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 1858896d6809..10ebb4bf71ad 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -45,10 +45,12 @@ static struct fw_dump fw_dump;
 static void __init fadump_reserve_crash_area(u64 base);
 
 struct kobject *fadump_kobj;
-static atomic_t cpus_in_fadump;
 
 #ifndef CONFIG_PRESERVE_FA_DUMP
+
+static atomic_t cpus_in_fadump;
 static DEFINE_MUTEX(fadump_mutex);
+
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
 
 #define RESERVED_RNGS_SZ	16384 /* 16K - 128 entries */
-- 
2.25.1

