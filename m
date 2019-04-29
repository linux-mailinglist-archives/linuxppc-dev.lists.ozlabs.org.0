Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D2E034
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:05:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t0dx1yz0zDqKj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:05:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0LM31DjzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5XyIAO0"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0LM1xHNz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:51:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0LM0cMNz9sMM; Mon, 29 Apr 2019 19:51:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5XyIAO0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0LL0FJFz9s70
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:51:54 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CE042075E;
 Mon, 29 Apr 2019 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531512;
 bh=Ca+N7ZR1IByO48VP8qk6BlppcAsVAvdqZkovQ9J1z8c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=S5XyIAO0Iu6G6J4ozyR6jf28vOJn74ciegI7fOHSN5BpknNwUBYgxI9S7dhQAlXT0
 /wXCpGbccP42S7ejzfFZifdrkWTccnfWyTVE6ySbPZskukzkpV4gGO3BXodDGH/qc/
 T+1jmtqXUTnOU3EXAdKA48c++Go1WEc9BMVfCtGo=
Subject: Patch "powerpc/64s: Add support for ori barrier_nospec patching" has
 been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:22 +0200
In-Reply-To: <20190421142037.21881-27-mpe@ellerman.id.au>
Message-ID: <1556531482237146@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc/64s: Add support for ori barrier_nospec patching

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-64s-add-support-for-ori-barrier_nospec-patching.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:11 +1000
Subject: powerpc/64s: Add support for ori barrier_nospec patching
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-27-mpe@ellerman.id.au>

From: Michal Suchanek <msuchanek@suse.de>

commit 2eea7f067f495e33b8b116b35b5988ab2b8aec55 upstream.

Based on the RFI patching. This is required to be able to disable the
speculation barrier.

Only one barrier type is supported and it does nothing when the
firmware does not enable it. Also re-patching modules is not supported
So the only meaningful thing that can be done is patching out the
speculation barrier at boot when the user says it is not wanted.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/barrier.h        |    2 +-
 arch/powerpc/include/asm/feature-fixups.h |    9 +++++++++
 arch/powerpc/include/asm/setup.h          |    1 +
 arch/powerpc/kernel/security.c            |    9 +++++++++
 arch/powerpc/kernel/vmlinux.lds.S         |    7 +++++++
 arch/powerpc/lib/feature-fixups.c         |   27 +++++++++++++++++++++++++++
 6 files changed, 54 insertions(+), 1 deletion(-)

--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -97,7 +97,7 @@ do {									\
  * Prevent execution of subsequent instructions until preceding branches have
  * been fully resolved and are no longer executing speculatively.
  */
-#define barrier_nospec_asm ori 31,31,0
+#define barrier_nospec_asm NOSPEC_BARRIER_FIXUP_SECTION; nop
 
 // This also acts as a compiler barrier due to the memory clobber.
 #define barrier_nospec() asm (stringify_in_c(barrier_nospec_asm) ::: "memory")
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -208,6 +208,14 @@ label##3:					       	\
 	FTR_ENTRY_OFFSET 951b-952b;			\
 	.popsection;
 
+#define NOSPEC_BARRIER_FIXUP_SECTION			\
+953:							\
+	.pushsection __barrier_nospec_fixup,"a";	\
+	.align 2;					\
+954:							\
+	FTR_ENTRY_OFFSET 953b-954b;			\
+	.popsection;
+
 
 #ifndef __ASSEMBLY__
 
@@ -215,6 +223,7 @@ extern long stf_barrier_fallback;
 extern long __start___stf_entry_barrier_fixup, __stop___stf_entry_barrier_fixup;
 extern long __start___stf_exit_barrier_fixup, __stop___stf_exit_barrier_fixup;
 extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
+extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
 
 #endif
 
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -38,6 +38,7 @@ enum l1d_flush_type {
 
 void setup_rfi_flush(enum l1d_flush_type, bool enable);
 void do_rfi_flush_fixups(enum l1d_flush_type types);
+void do_barrier_nospec_fixups(bool enable);
 
 #endif /* !__ASSEMBLY__ */
 
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -11,10 +11,19 @@
 
 #include <asm/debug.h>
 #include <asm/security_features.h>
+#include <asm/setup.h>
 
 
 unsigned long powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
 
+static bool barrier_nospec_enabled;
+
+static void enable_barrier_nospec(bool enable)
+{
+	barrier_nospec_enabled = enable;
+	do_barrier_nospec_fixups(enable);
+}
+
 ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	bool thread_priv;
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -93,6 +93,13 @@ SECTIONS
 		*(__rfi_flush_fixup)
 		__stop___rfi_flush_fixup = .;
 	}
+
+	. = ALIGN(8);
+	__spec_barrier_fixup : AT(ADDR(__spec_barrier_fixup) - LOAD_OFFSET) {
+		__start___barrier_nospec_fixup = .;
+		*(__barrier_nospec_fixup)
+		__stop___barrier_nospec_fixup = .;
+	}
 #endif
 
 	EXCEPTION_TABLE(0)
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -274,6 +274,33 @@ void do_rfi_flush_fixups(enum l1d_flush_
 		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
 						: "unknown");
 }
+
+void do_barrier_nospec_fixups(bool enable)
+{
+	unsigned int instr, *dest;
+	long *start, *end;
+	int i;
+
+	start = PTRRELOC(&__start___barrier_nospec_fixup),
+	end = PTRRELOC(&__stop___barrier_nospec_fixup);
+
+	instr = 0x60000000; /* nop */
+
+	if (enable) {
+		pr_info("barrier-nospec: using ORI speculation barrier\n");
+		instr = 0x63ff0000; /* ori 31,31,0 speculation barrier */
+	}
+
+	for (i = 0; start < end; start++, i++) {
+		dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+		patch_instruction(dest, instr);
+	}
+
+	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
+}
+
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)


Patches currently in stable-queue which might be from mpe@ellerman.id.au are

queue-4.4/powerpc-64s-add-support-for-a-store-forwarding-barrier-at-kernel-entry-exit.patch
queue-4.4/powerpc-64-make-stf-barrier-ppc_book3s_64-specific.patch
queue-4.4/powerpc-pseries-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-fsl-fix-spectre_v2-mitigations-reporting.patch
queue-4.4/powerpc-64s-patch-barrier_nospec-in-modules.patch
queue-4.4/powerpc-pseries-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-call-setup_rfi_flush-after-lpm-migration.patch
queue-4.4/powerpc-pseries-query-hypervisor-for-count-cache-flush-settings.patch
queue-4.4/powerpc-powernv-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-64s-add-support-for-software-count-cache-flush.patch
queue-4.4/powerpc64s-show-ori31-availability-in-spectre_v1-sysfs-file-not-v2.patch
queue-4.4/powerpc-fsl-flush-the-branch-predictor-at-each-kernel-entry-64bit.patch
queue-4.4/powerpc-fsl-update-spectre-v2-reporting.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v2.patch
queue-4.4/powerpc-64-make-meltdown-reporting-book3s-64-specific.patch
queue-4.4/powerpc-rfi-flush-make-it-possible-to-call-setup_rfi_flush-again.patch
queue-4.4/powerpc-64s-add-support-for-ori-barrier_nospec-patching.patch
queue-4.4/powerpc-use-barrier_nospec-in-copy_from_user.patch
queue-4.4/powerpc-64s-fix-section-mismatch-warnings-from-setup_rfi_flush.patch
queue-4.4/powerpc-avoid-code-patching-freed-init-sections.patch
queue-4.4/powerpc-fsl-add-macro-to-flush-the-branch-predictor.patch
queue-4.4/powerpc-xmon-add-rfi-flush-related-fields-to-paca-dump.patch
queue-4.4/powerpc-fsl-add-barrier_nospec-implementation-for-nxp-powerpc-book3e.patch
queue-4.4/powerpc-security-fix-spectre_v2-reporting.patch
queue-4.4/powerpc-add-security-feature-flags-for-spectre-meltdown.patch
queue-4.4/powerpc-powernv-use-the-security-flags-in-pnv_setup_rfi_flush.patch
queue-4.4/powerpc-64-disable-the-speculation-barrier-from-the-command-line.patch
queue-4.4/powerpc-fsl-fix-the-flush-of-branch-predictor.patch
queue-4.4/powerpc-pseries-use-the-security-flags-in-pseries_setup_rfi_flush.patch
queue-4.4/powerpc-64-add-config_ppc_barrier_nospec.patch
queue-4.4/powerpc-64s-move-cpu_show_meltdown.patch
queue-4.4/powerpc-64-use-barrier_nospec-in-syscall-entry.patch
queue-4.4/powerpc-fsl-add-nospectre_v2-command-line-argument.patch
queue-4.4/powerpc-64s-add-new-security-feature-flags-for-count-cache-flush.patch
queue-4.4/powerpc-fsl-add-infrastructure-to-fixup-branch-predictor-flush.patch
queue-4.4/powerpc-rfi-flush-differentiate-enabled-and-patched-flush-types.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64-call-setup_barrier_nospec-from-setup_arch.patch
queue-4.4/powerpc-rfi-flush-always-enable-fallback-flush-on-pseries.patch
queue-4.4/powerpc-64s-improve-rfi-l1-d-cache-flush-fallback.patch
queue-4.4/powerpc-asm-add-a-patch_site-macro-helpers-for-patching-instructions.patch
queue-4.4/powerpc-pseries-add-new-h_get_cpu_characteristics-flags.patch
queue-4.4/powerpc-64s-enable-barrier_nospec-based-on-firmware-settings.patch
queue-4.4/powerpc-powernv-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-move-the-logic-to-avoid-a-redo-into-the-debugfs-code.patch
queue-4.4/powerpc-powernv-query-firmware-for-count-cache-flush-settings.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64s-add-barrier_nospec.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_meltdown.patch
queue-4.4/powerpc-move-default-security-feature-flags.patch
queue-4.4/powerpc-pseries-fix-clearing-of-security-feature-flags.patch
queue-4.4/powerpc-pseries-restore-default-security-feature-flags-on-setup.patch
