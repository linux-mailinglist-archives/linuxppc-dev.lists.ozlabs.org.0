Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9CDE07E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:27:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t1722X4dzDqLH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0M55tYYzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATVkCKUO"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0M557Njz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0M54Jmpz9sML; Mon, 29 Apr 2019 19:52:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATVkCKUO"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0M505kcz9sCJ
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:52:33 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CCBE20449;
 Mon, 29 Apr 2019 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531551;
 bh=4fulJPQvF0bqNBaklzV0zCBGHerGF1ics5Pw4KmfOE4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=ATVkCKUOg+jH+RtCacvrU9snedE1QrY7eNXVkATQBNyBHZuWb5Df44YNBlp8/01NG
 Qlsq+GOoq1HZgjl7xlRaHO/N2PMi6gau2Bbpo3zmJDJUd76MVxSPEpFP81YYEcm+cw
 TgqtSIG4vQO3HKZqmf6NQvBwcYEe540IUlopCu8c=
Subject: Patch "powerpc/fsl: Add infrastructure to fixup branch predictor
 flush" has been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:25 +0200
In-Reply-To: <20190421142037.21881-46-mpe@ellerman.id.au>
Message-ID: <1556531485120174@kroah.com>
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

    powerpc/fsl: Add infrastructure to fixup branch predictor flush

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-fsl-add-infrastructure-to-fixup-branch-predictor-flush.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:30 +1000
Subject: powerpc/fsl: Add infrastructure to fixup branch predictor flush
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-46-mpe@ellerman.id.au>

From: Diana Craciun <diana.craciun@nxp.com>

commit 76a5eaa38b15dda92cd6964248c39b5a6f3a4e9d upstream.

In order to protect against speculation attacks (Spectre
variant 2) on NXP PowerPC platforms, the branch predictor
should be flushed when the privillege level is changed.
This patch is adding the infrastructure to fixup at runtime
the code sections that are performing the branch predictor flush
depending on a boot arg parameter which is added later in a
separate patch.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/feature-fixups.h |   12 ++++++++++++
 arch/powerpc/include/asm/setup.h          |    2 ++
 arch/powerpc/kernel/vmlinux.lds.S         |    8 ++++++++
 arch/powerpc/lib/feature-fixups.c         |   23 +++++++++++++++++++++++
 4 files changed, 45 insertions(+)

--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -216,6 +216,17 @@ label##3:					       	\
 	FTR_ENTRY_OFFSET 953b-954b;			\
 	.popsection;
 
+#define START_BTB_FLUSH_SECTION			\
+955:							\
+
+#define END_BTB_FLUSH_SECTION			\
+956:							\
+	.pushsection __btb_flush_fixup,"a";	\
+	.align 2;							\
+957:						\
+	FTR_ENTRY_OFFSET 955b-957b;			\
+	FTR_ENTRY_OFFSET 956b-957b;			\
+	.popsection;
 
 #ifndef __ASSEMBLY__
 
@@ -224,6 +235,7 @@ extern long __start___stf_entry_barrier_
 extern long __start___stf_exit_barrier_fixup, __stop___stf_exit_barrier_fixup;
 extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
 extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
+extern long __start__btb_flush_fixup, __stop__btb_flush_fixup;
 
 #endif
 
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -53,6 +53,8 @@ void do_barrier_nospec_fixups_range(bool
 static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { };
 #endif
 
+void do_btb_flush_fixups(void);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_SETUP_H */
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -104,6 +104,14 @@ SECTIONS
 	}
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
+#ifdef CONFIG_PPC_FSL_BOOK3E
+	. = ALIGN(8);
+	__spec_btb_flush_fixup : AT(ADDR(__spec_btb_flush_fixup) - LOAD_OFFSET) {
+		__start__btb_flush_fixup = .;
+		*(__btb_flush_fixup)
+		__stop__btb_flush_fixup = .;
+	}
+#endif
 	EXCEPTION_TABLE(0)
 
 	NOTES :kernel :notes
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -344,6 +344,29 @@ void do_barrier_nospec_fixups_range(bool
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
+
+static void patch_btb_flush_section(long *curr)
+{
+	unsigned int *start, *end;
+
+	start = (void *)curr + *curr;
+	end = (void *)curr + *(curr + 1);
+	for (; start < end; start++) {
+		pr_devel("patching dest %lx\n", (unsigned long)start);
+		patch_instruction(start, PPC_INST_NOP);
+	}
+}
+
+void do_btb_flush_fixups(void)
+{
+	long *start, *end;
+
+	start = PTRRELOC(&__start__btb_flush_fixup);
+	end = PTRRELOC(&__stop__btb_flush_fixup);
+
+	for (; start < end; start += 2)
+		patch_btb_flush_section(start);
+}
 #endif /* CONFIG_PPC_FSL_BOOK3E */
 
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
