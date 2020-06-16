Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 570011FB34E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 16:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mVJb0rqJzDqmC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 00:02:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mV8p3w0SzDqm9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 23:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=E5AQZP5r; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49mV8m179Fz9sRK; Tue, 16 Jun 2020 23:55:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49mV8l58Vcz9sT6; Tue, 16 Jun 2020 23:55:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592315751;
 bh=KyN/8xEV1ocUHJUV+svHFzygU+CKYg1ZOnKHC5triV4=;
 h=From:To:Cc:Subject:Date:From;
 b=E5AQZP5r9bIEHpD7dBNDSa1Gd4Pp4mQa23qIcRl+V41xprJ/mCcEl0ve5r7DhrqiW
 YpQes4BXZnfCAr/ZYh7mp8YD6L39BAGqbFnr5cbuAolScyOTMtYvkEvxXacK9a9DU6
 SGAuL/0Y3LeyPeVHxQDc7O5ET7tAavb8ss4IS5v1qeoRRUiQ/yJkfxJMq6jbr++jKZ
 A7FIgtw0Crbi5i/Nh/vSr2x0cTKqjsqUdgLpHDu7wnu8dmxbbcUyK8DI+f/ZXDlm/k
 bVXPj94vvbHhNHH7l5orReLRlv+ow0NEhvFeG2ourmrEUKL+iw1QrovJrPKeRzN0yO
 EdoMnVWmgk6GQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc/syscalls: Use the number when building SPU
 syscall table
Date: Tue, 16 Jun 2020 23:56:16 +1000
Message-Id: <20200616135617.2937252-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-arch@ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the macro that inserts entries into the SPU syscall table
doesn't actually use the "nr" (syscall number) parameter.

This does work, but it relies on the exact right number of syscall
entries being emitted in order for the syscal numbers to line up with
the array entries. If for example we had two entries with the same
syscall number we wouldn't get an error, it would just cause all
subsequent syscalls to be off by one in the spu_syscall_table.

So instead change the macro to assign to the specific entry of the
array, meaning any numbering overlap will be caught by the compiler.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20190116132714.20094-1-mpe@ellerman.id.au
---
 arch/powerpc/platforms/cell/spu_callbacks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c b/arch/powerpc/platforms/cell/spu_callbacks.c
index cbee3666da07..abdef9bcf432 100644
--- a/arch/powerpc/platforms/cell/spu_callbacks.c
+++ b/arch/powerpc/platforms/cell/spu_callbacks.c
@@ -35,7 +35,7 @@
  */
 
 static void *spu_syscall_table[] = {
-#define __SYSCALL(nr, entry)	entry,
+#define __SYSCALL(nr, entry) [nr] = entry,
 #include <asm/syscall_table_spu.h>
 #undef __SYSCALL
 };
-- 
2.25.1

