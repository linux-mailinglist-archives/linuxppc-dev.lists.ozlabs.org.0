Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C89DF52CD6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 09:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hk05BLHz303H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 17:46:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=y7b0T/XP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hjP0tfFz2xKw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 17:45:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=y7b0T/XP; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L3hjM4FtPz4xD3; Thu, 19 May 2022 17:45:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L3hjM48zxz4xDC; Thu, 19 May 2022 17:45:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652946327;
 bh=OCIl5mUZRz/jXBubSc/6w82t7EkjOyWO+mwxDB1TntA=;
 h=Date:From:To:Cc:Subject:From;
 b=y7b0T/XPTRy0PADzlhAVM0kKQI8H+6dlojmB8euBpJe0Kr0oT76HcWeAlJ29F9F+a
 fJ4BDn3p17hbwdgnqx+PP19AYgjs9DR3PIZiwR5L1Xv411lIc8wkKXlUuTCroXUR7z
 tRqqPvfPeNyOFT7pJWnyMeZy+wEDpJei71M3X1YrSFtciLK1U9DxebsXgVfTFIIoZt
 RneHsUmt50F/TOj6hkeEVPoo7m58qPco3ZJlNBCZolFi3xBfe71ycN4F4fwQSIXtH6
 3yUT6ubocI71JcZbo/dpr69jpD8peBzXJt/zAVf+gojXWcRWl/j3c9JYb5pvPr1OFS
 okdQ4icT9edfg==
Date: Thu, 19 May 2022 17:45:21 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/kasan: Mark more real-mode code as not to be
 instrumented
Message-ID: <YoX1kZPnmUX4RZEK@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This marks more files and functions that can possibly be called in
real mode as not to be instrumented by KASAN.  Most were found by
inspection, except for get_pseries_errorlog() which was reported as
causing a crash in testing.

Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/kernel/Makefile            | 2 ++
 arch/powerpc/kernel/rtas.c              | 4 ++--
 arch/powerpc/kexec/crash.c              | 2 +-
 arch/powerpc/platforms/powernv/Makefile | 1 +
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index e46335da7f72..e9aec39f734f 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -37,6 +37,8 @@ KASAN_SANITIZE_paca.o := n
 KASAN_SANITIZE_setup_64.o := n
 KASAN_SANITIZE_mce.o := n
 KASAN_SANITIZE_mce_power.o := n
+KASAN_SANITIZE_udbg.o := n
+KASAN_SANITIZE_udbg_16550.o := n
 
 # we have to be particularly careful in ppc64 to exclude code that
 # runs with translations off, as we cannot access the shadow with
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 733e6ef36758..dbba4ff6b8cf 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -974,8 +974,8 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
  *
  * Return: A pointer to the specified errorlog or NULL if not found.
  */
-struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
-					      uint16_t section_id)
+noinstr struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
+						      uint16_t section_id)
 {
 	struct rtas_ext_event_log_v6 *ext_log =
 		(struct rtas_ext_event_log_v6 *)log->buffer;
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 22ceeeb705ab..968dbbe49f12 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -225,7 +225,7 @@ void crash_kexec_secondary(struct pt_regs *regs)
 
 /* wait for all the CPUs to hit real mode but timeout if they don't come in */
 #if defined(CONFIG_SMP) && defined(CONFIG_PPC64)
-static void __maybe_unused crash_kexec_wait_realmode(int cpu)
+noinstr static void __maybe_unused crash_kexec_wait_realmode(int cpu)
 {
 	unsigned int msecs;
 	int i;
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 6488b3842199..19f0fc5c6f1b 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -4,6 +4,7 @@
 # in particular, idle code runs a bunch of things in real mode
 KASAN_SANITIZE_idle.o := n
 KASAN_SANITIZE_pci-ioda.o := n
+KASAN_SANITIZE_pci-ioda-tce.o := n
 # pnv_machine_check_early
 KASAN_SANITIZE_setup.o := n
 
-- 
2.35.3

