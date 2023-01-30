Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7102680392
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 02:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4rfj4RHzz3dvZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 12:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TzUgk3GB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4rdr1l6Vz2yXJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 12:47:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TzUgk3GB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P4rdr0Lrrz4x1T;
	Mon, 30 Jan 2023 12:47:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675043232;
	bh=T8SiFpcyFmu5tq7EpVfp5YXgPvM1N5s3CTzE8xJveGo=;
	h=From:To:Cc:Subject:Date:From;
	b=TzUgk3GBo5uMbaHdfMSYV2Kr2zPVEOJkwJXcbEwZ2tZFedRRo2kAdhbUJfE9GL6fJ
	 XUly9/ggekZnwuKxQ2skXY5D8frgccOt9SmYR24bYKbzdoIHnCinx+/6cWTVuMVbIn
	 9ygbY12lQDb8JpGqdkmLVW33cnT0FxQkatNBX4JSm2CSpZiFlCl5sze3zIRa6DMY/a
	 P8oTlfBbkz3DZyD05/DwHqZs2l7B7WPkkQddotfGtWeqCAxbY26DTEqcRCLp5xcJzM
	 Sd/z2YGbKHgHSTh6AA5jQBRRGbguHUgtFgyAFBIKwUIv6ZIjBp8pzSSjrIQApbnpYs
	 czLSxn+iPhceg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/kexec_file: Fix division by zero in extra size estimation
Date: Mon, 30 Jan 2023 12:47:07 +1100
Message-Id: <20230130014707.541110-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Cc: sourabhjain@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kexec_extra_fdt_size_ppc64() there's logic to estimate how much
extra space will be needed in the device tree for some memory related
properties.

That logic uses the size of RAM divided by drmem_lmb_size() to do the
estimation. However drmem_lmb_size() can be zero if the machine has no
hotpluggable memory configured, which is the case when booting with qemu
and no maxmem=x parameter is passed (the default).

The division by zero is reported by UBSAN, and can also lead to an
overflow and a warning from kvmalloc, and kdump kernel loading fails:

  WARNING: CPU: 0 PID: 133 at mm/util.c:596 kvmalloc_node+0x15c/0x160
  Modules linked in:
  CPU: 0 PID: 133 Comm: kexec Not tainted 6.2.0-rc5-03455-g07358bd97810 #223
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-dd0dca pSeries
  NIP:  c00000000041ff4c LR: c00000000041fe58 CTR: 0000000000000000
  REGS: c0000000096ef750 TRAP: 0700   Not tainted  (6.2.0-rc5-03455-g07358bd97810)
  MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24248242  XER: 2004011e
  CFAR: c00000000041fed0 IRQMASK: 0
  ...
  NIP kvmalloc_node+0x15c/0x160
  LR  kvmalloc_node+0x68/0x160
  Call Trace:
    kvmalloc_node+0x68/0x160 (unreliable)
    of_kexec_alloc_and_setup_fdt+0xb8/0x7d0
    elf64_load+0x25c/0x4a0
    kexec_image_load_default+0x58/0x80
    sys_kexec_file_load+0x5c0/0x920
    system_call_exception+0x128/0x330
    system_call_vectored_common+0x15c/0x2ec

To fix it, skip the calculation if drmem_lmb_size() is zero.

Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kexec/file_load_64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index af8854f9eae3..3caee570e79b 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -989,10 +989,12 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	 * linux,drconf-usable-memory properties. Get an approximate on the
 	 * number of usable memory entries and use for FDT size estimation.
 	 */
-	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
-		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
-
-	extra_size = (unsigned int)(usm_entries * sizeof(u64));
+	if (drmem_lmb_size()) {
+		usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
+			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
+		extra_size = (unsigned int)(usm_entries * sizeof(u64));
+	} else
+		extra_size = 0;
 
 	/*
 	 * Get the number of CPU nodes in the current DT. This allows to
-- 
2.39.1

