Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5539778626
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 05:42:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DfDe0sLP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMV445rHCz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 13:42:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DfDe0sLP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMTyv29cPz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 13:38:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23B1664325;
	Fri, 11 Aug 2023 03:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CEFBC433C8;
	Fri, 11 Aug 2023 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691725090;
	bh=whhV6SkWkfSGuUqgawwieXdrPYWPSac+Odl5OgaklPE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=DfDe0sLPiPncLsY2sbT70pZ0lDY1i41wPQVm/fwKmZ0U2fNXlG1fYIH+4AZj0qyln
	 1dEdQED/NP4pGRVef+jrI0UlYHKsadZJp4B+x4CfsOij5dIxYwUyJ7hsVc4jaZiY25
	 PbqaAHcl3uT5ijrOe23XaoQWLNAZ96dKrLtGov+j/5fGVGzTDZnbl2sXmNlUOydmB7
	 y+dwA1ogfv2uWJeP1o1C3UVnKxkaPur7KLMIr/hsssimMSvO5RbVoZsnA4qORKybg5
	 Wi7ItzfogLeAeqR3b+rMvtAusPlURfYicquZZUMfqmpzfbO8S7GgkrzclopjGPtExT
	 6CvvPCun/7zzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603D9C001DE;
	Fri, 11 Aug 2023 03:38:10 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 10 Aug 2023 22:37:55 -0500
Subject: [PATCH v2] powerpc/rtas_flash: allow user copy to flash block
 cache objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230810-rtas-flash-vs-hardened-usercopy-v2-1-dcf63793a938@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIABKt1WQC/4XNQQ6DIBCF4asY1h0DmNjSVe/RuEAYyyQKDSjRG
 O9eag/Q5f8W39tZwkiY2L3aWcRMiYIvIS8VM077FwLZ0kxy2fBrIyDOOsEw6uQgJ3A6WvRoYSm
 OCe8NuNKtlU3bcyFYUd4RB1rPh2dX2lGaQ9zOwyy+68++8f92FiBAolJmUCh7tI+R/LLW1E+1C
 RPrjuP4AOBsLJnSAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691725089; l=3245;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=mnxTyBgPfZp2EwTmjYzNjMI5jJcJ4qTWUk5dzWOmYlA=;
 b=x0ZNdmr3h+oB6GmQqV4qkH5z0Kn3pjHXJhNWw+wl5tKyWa6HZJ6Ppd1jwAMLXktRgXVkRrfzu
 MIoMmqKBswLBh9MUxfzfOgjHQJZkouOSveeH8oS+DXgkIHSpwdAynpi
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

With hardened usercopy enabled (CONFIG_HARDENED_USERCOPY=y), using the
/proc/powerpc/rtas/firmware_update interface to prepare a system
firmware update yields a BUG():

kernel BUG at mm/usercopy.c:102!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 2232 Comm: dd Not tainted 6.5.0-rc3+ #2
Hardware name: IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 of:IBM,FW860.50 (SV860_146) hv:phyp pSeries
NIP:  c0000000005991d0 LR: c0000000005991cc CTR: 0000000000000000
REGS: c0000000148c76a0 TRAP: 0700   Not tainted  (6.5.0-rc3+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002242  XER: 0000000c
CFAR: c0000000001fbd34 IRQMASK: 0
[ ... GPRs omitted ... ]
NIP [c0000000005991d0] usercopy_abort+0xa0/0xb0
LR [c0000000005991cc] usercopy_abort+0x9c/0xb0
Call Trace:
[c0000000148c7940] [c0000000005991cc] usercopy_abort+0x9c/0xb0 (unreliable)
[c0000000148c79b0] [c000000000536814] __check_heap_object+0x1b4/0x1d0
[c0000000148c79f0] [c000000000599080] __check_object_size+0x2d0/0x380
[c0000000148c7a30] [c000000000045ed4] rtas_flash_write+0xe4/0x250
[c0000000148c7a80] [c00000000068a0fc] proc_reg_write+0xfc/0x160
[c0000000148c7ab0] [c0000000005a381c] vfs_write+0xfc/0x4e0
[c0000000148c7b70] [c0000000005a3e10] ksys_write+0x90/0x160
[c0000000148c7bc0] [c00000000002f2c8] system_call_exception+0x178/0x320
[c0000000148c7e50] [c00000000000d520] system_call_common+0x160/0x2c4
--- interrupt: c00 at 0x7fff9f17e5e4

The blocks of the firmware image are copied directly from user memory
to objects allocated from flash_block_cache, so flash_block_cache must
be created using kmem_cache_create_usercopy() to mark it safe for user
access.

Fixes: 6d07d1cd300f ("usercopy: Restrict non-usercopy caches to size 0")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
I believe it's much more common to update Power system firmware
without involving a Linux partition, which may explain why this has
gone unreported for so long.
---
Changes in v2:
- Drop excessive local const variables. No functional change.
- Link to v1: https://lore.kernel.org/r/20230801-rtas-flash-vs-hardened-usercopy-v1-1-2e99cf9e2bed@linux.ibm.com
---
 arch/powerpc/kernel/rtas_flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index 4caf5e3079eb..359577ec1680 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -709,9 +709,9 @@ static int __init rtas_flash_init(void)
 	if (!rtas_validate_flash_data.buf)
 		return -ENOMEM;
 
-	flash_block_cache = kmem_cache_create("rtas_flash_cache",
-					      RTAS_BLK_SIZE, RTAS_BLK_SIZE, 0,
-					      NULL);
+	flash_block_cache = kmem_cache_create_usercopy("rtas_flash_cache",
+						       RTAS_BLK_SIZE, RTAS_BLK_SIZE,
+						       0, 0, RTAS_BLK_SIZE, NULL);
 	if (!flash_block_cache) {
 		printk(KERN_ERR "%s: failed to create block cache\n",
 				__func__);

---
base-commit: c3cad890877f59aeeaf5a638aa7a7c0612c16fa1
change-id: 20230731-rtas-flash-vs-hardened-usercopy-09a6d236b011

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

