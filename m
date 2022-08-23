Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12959DB11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 14:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBnr42wYcz3cfY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 22:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jXl2P/yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBnpt5j9Wz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 22:00:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jXl2P/yp;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MBnpr22Kjz4yMs;
	Tue, 23 Aug 2022 22:00:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661256004;
	bh=BM2OoX1X5/M1PL3XwCFSoUUGkRwpuN+iuxXEa1u1kZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXl2P/ypnA2XrYYHmvy1aqbWqbIm17EX99l910SLUQnRiR45a0GdG/pQgsooyQwFR
	 cML5RbPav7aZS1bUZb+hCLn3oZf72tzxyaPyY0WN29a5q3gucwi4y8jIdSK/AXPW3M
	 ca07y+biMnvR8GQQD1hU6o+KQi4IBhHBJFMzZ6YzLTIzhPZXlPCl9LyNgkTVa7ETxv
	 vKIOUzzsJVeoAmDZukP1lOLcku4k1BQ0iYqlpHU0kQ+uBE7WXbjC0pR3dfaKjgAlGK
	 +gpfOXXOGW0SywjaYf1lpsk82fbdpxxWjDxsU3n/Gw32MwAgva75v/bbs3rXb7kfcN
	 kMaNlfji6FU+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
Date: Tue, 23 Aug 2022 21:59:52 +1000
Message-Id: <20220823115952.1203106-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823115952.1203106-1-mpe@ellerman.id.au>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The semi-recent changes to MSR handling when entering RTAS (firmware)
cause crashes on IBM Cell machines. An example trace:

  kernel tried to execute user page (2fff01a8) - exploit attempt? (uid: 0)
  BUG: Unable to handle kernel instruction fetch
  Faulting instruction address: 0x2fff01a8
  Oops: Kernel access of bad area, sig: 11 [#1]
  BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=4 NUMA Cell
  Modules linked in:
  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.0.0-rc2-00433-gede0a8d3307a #207
  NIP:  000000002fff01a8 LR: 0000000000032608 CTR: 0000000000000000
  REGS: c0000000015236b0 TRAP: 0400   Tainted: G        W           (6.0.0-rc2-00433-gede0a8d3307a)
  MSR:  0000000008001002 <ME,RI>  CR: 00000000  XER: 20000000
  ...
  NIP 0x2fff01a8
  LR  0x32608
  Call Trace:
    0xc00000000143c5f8 (unreliable)
    .rtas_call+0x224/0x320
    .rtas_get_boot_time+0x70/0x150
    .read_persistent_clock64+0x114/0x140
    .read_persistent_wall_and_boot_offset+0x24/0x80
    .timekeeping_init+0x40/0x29c
    .start_kernel+0x674/0x8f0
    start_here_common+0x1c/0x50

Unlike PAPR platforms where RTAS is only used in guests, on the IBM Cell
machines Linux runs with MSR[HV] set but also uses RTAS, provided by
SLOF.

Fix it by copying the MSR[HV] bit from the MSR value we've just read
using mfmsr into the value used for RTAS.

It seems like we could also fix it using an #ifdef CELL to set MSR[HV],
but that doesn't work because it's possible to build a single kernel
image that runs on both Cell native and pseries.

Fixes: b6b1c3ce06ca ("powerpc/rtas: Keep MSR[RI] set when calling RTAS")
Cc: stable@vger.kernel.org # v5.19+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/rtas_entry.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 9a434d42e660..6ce95ddadbcd 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -109,8 +109,12 @@ _GLOBAL(enter_rtas)
 	 * its critical regions (as specified in PAPR+ section 7.2.1). MSR[S]
 	 * is not impacted by RFI_TO_KERNEL (only urfid can unset it). So if
 	 * MSR[S] is set, it will remain when entering RTAS.
+	 * If we're in HV mode, RTAS must also run in HV mode, so extract MSR_HV
+	 * from the saved MSR value and insert into the value RTAS will use.
 	 */
+	extrdi	r0, r6, 1, 63 - MSR_HV_LG
 	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)
+	insrdi	r6, r0, 1, 63 - MSR_HV_LG
 
 	li      r0,0
 	mtmsrd  r0,1                    /* disable RI before using SRR0/1 */
-- 
2.37.1

