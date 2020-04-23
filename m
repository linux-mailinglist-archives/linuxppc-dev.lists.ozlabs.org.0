Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28291B5484
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 08:02:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4976C73vVvzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 16:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49769F11l3zDqvK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 16:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nKS7a1LD; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49769D5kwRz9sSb; Thu, 23 Apr 2020 16:00:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49769D4Hj3z9sSd; Thu, 23 Apr 2020 16:00:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587621632;
 bh=kj5s+MP/lpyiN4w9qGRGHWnhm1Ls0kADeWkUY5MSswU=;
 h=From:To:Cc:Subject:Date:From;
 b=nKS7a1LDPzBgbIWSX1fXC5UWRGQOYczv4akAXi7vK3qgNYK6De8DSDyDO84cA2LFZ
 Zv9PbDRxV3Xwl8pQm7fOSqAB9WdX7ltHUs3PHvBXySrfh77FqO8qL8W2Z6hAPaarCF
 89i+0soq+BxSx3Vdz6XTHNzq4CEqFsylfwSRhHBYAL9wxPwlbnsaWgnItqS5YP8f9U
 ehDBu6eY8pbU96KsRs+1M+036QnKO8n81ZO7KEJnY6E6DLR2DYmp7W45psl8C1qgem
 IajyuPBojHYckGJaFte5s5ieXDHDBV6fdeNY865tt+pjLCVmmfSt0iHLOuvQCocLNp
 2KbMOYtZTTc7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] drivers/macintosh: Fix memleak in windfarm_pm112 driver
Date: Thu, 23 Apr 2020 16:00:38 +1000
Message-Id: <20200423060038.3308530-1-mpe@ellerman.id.au>
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
Cc: erhard_f@mailbox.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

create_cpu_loop() calls smu_sat_get_sdb_partition() which does
kmalloc() and returns the allocated buffer. In fact it's called twice,
and neither buffer is freed.

This results in a memory leak as reported by Erhard:
  unreferenced object 0xc00000047081f840 (size 32):
    comm "kwindfarm", pid 203, jiffies 4294880630 (age 5552.877s)
    hex dump (first 32 bytes):
      c8 06 02 7f ff 02 ff 01 fb bf 00 41 00 20 00 00  ...........A. ..
      00 07 89 37 00 a0 00 00 00 00 00 00 00 00 00 00  ...7............
    backtrace:
      [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0 [windfarm_smu_sat]
      [<000000003010fcb7>] .pm112_wf_notify+0x104c/0x13bc [windfarm_pm112]
      [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
      [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
      [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
      [<000000000d54838d>] .kthread+0x13c/0x190
      [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64
  unreferenced object 0xc0000004737089f0 (size 16):
    comm "kwindfarm", pid 203, jiffies 4294880879 (age 5552.050s)
    hex dump (first 16 bytes):
      c4 04 01 7f 22 11 e0 e6 ff 55 7b 12 ec 11 00 00  ...."....U{.....
    backtrace:
      [<0000000083f0a65c>] .smu_sat_get_sdb_partition+0xc4/0x2d0 [windfarm_smu_sat]
      [<00000000b94ef7e1>] .pm112_wf_notify+0x1294/0x13bc [windfarm_pm112]
      [<00000000b958b2dd>] .notifier_call_chain+0xa8/0x180
      [<0000000070490868>] .blocking_notifier_call_chain+0x64/0x90
      [<00000000131d8149>] .wf_thread_func+0x114/0x1a0
      [<000000000d54838d>] .kthread+0x13c/0x190
      [<00000000669b72bc>] .ret_from_kernel_thread+0x58/0x64

Fix it by rearranging the logic so we deal with each buffer
separately, which then makes it easy to free the buffer once we're
done with it.

Fixes: ac171c46667c ("[PATCH] powerpc: Thermal control for dual core G5s")
Cc: stable@vger.kernel.org # v2.6.16+
Reported-by: Erhard F. <erhard_f@mailbox.org>
Tested-by: Erhard F. <erhard_f@mailbox.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/windfarm_pm112.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm112.c b/drivers/macintosh/windfarm_pm112.c
index 4150301a89a5..e8377ce0a95a 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -132,14 +132,6 @@ static int create_cpu_loop(int cpu)
 	s32 tmax;
 	int fmin;
 
-	/* Get PID params from the appropriate SAT */
-	hdr = smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
-	if (hdr == NULL) {
-		printk(KERN_WARNING"windfarm: can't get CPU PID fan config\n");
-		return -EINVAL;
-	}
-	piddata = (struct smu_sdbp_cpupiddata *)&hdr[1];
-
 	/* Get FVT params to get Tmax; if not found, assume default */
 	hdr = smu_sat_get_sdb_partition(chip, 0xC4 + core, NULL);
 	if (hdr) {
@@ -152,6 +144,16 @@ static int create_cpu_loop(int cpu)
 	if (tmax < cpu_all_tmax)
 		cpu_all_tmax = tmax;
 
+	kfree(hdr);
+
+	/* Get PID params from the appropriate SAT */
+	hdr = smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
+	if (hdr == NULL) {
+		printk(KERN_WARNING"windfarm: can't get CPU PID fan config\n");
+		return -EINVAL;
+	}
+	piddata = (struct smu_sdbp_cpupiddata *)&hdr[1];
+
 	/*
 	 * Darwin has a minimum fan speed of 1000 rpm for the 4-way and
 	 * 515 for the 2-way.  That appears to be overkill, so for now,
@@ -174,6 +176,9 @@ static int create_cpu_loop(int cpu)
 		pid.min = fmin;
 
 	wf_cpu_pid_init(&cpu_pid[cpu], &pid);
+
+	kfree(hdr);
+
 	return 0;
 }
 
-- 
2.25.1

