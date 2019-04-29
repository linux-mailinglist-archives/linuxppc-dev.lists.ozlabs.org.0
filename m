Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF7E0FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:01:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t1tw3pfzzDqXP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:01:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0NH74gPzDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="xJ6+D1rk"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0NH532Kz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0NH4TqHz9sN6; Mon, 29 Apr 2019 19:53:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="xJ6+D1rk"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0NG6fjjz9sML
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:53:34 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF26420449;
 Mon, 29 Apr 2019 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531613;
 bh=yPbW5I1y/gg1pa44Czahy5Xjvo3HpRhsGbrj849sd+8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=xJ6+D1rkf5O7Q+4v0dULCqbVPlnQnq8IRu32rsVfSXwW1Q6iCrsW8Sn064oPthduK
 15nDOl2iPQrHuBotdasXfbCFLGj+ZRxFME5AooZK88mxVltuNdxgH7gRCLWTKhOvjD
 yqon7BuuxTzJG3O4pt2qHxHWtS0oic73TbuUApOg=
Subject: Patch "powerpc/security: Fix spectre_v2 reporting" has been added to
 the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mikey@neuling.org, mpe@ellerman.id.au,
 msuchanek@suse.de, npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:31 +0200
In-Reply-To: <20190421142037.21881-52-mpe@ellerman.id.au>
Message-ID: <1556531491129252@kroah.com>
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

    powerpc/security: Fix spectre_v2 reporting

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-security-fix-spectre_v2-reporting.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:36 +1000
Subject: powerpc/security: Fix spectre_v2 reporting
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-52-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

commit 92edf8df0ff2ae86cc632eeca0e651fd8431d40d upstream.

When I updated the spectre_v2 reporting to handle software count cache
flush I got the logic wrong when there's no software count cache
enabled at all.

The result is that on systems with the software count cache flush
disabled we print:

  Mitigation: Indirect branch cache disabled, Software count cache flush

Which correctly indicates that the count cache is disabled, but
incorrectly says the software count cache flush is enabled.

The root of the problem is that we are trying to handle all
combinations of options. But we know now that we only expect to see
the software count cache flush enabled if the other options are false.

So split the two cases, which simplifies the logic and fixes the bug.
We were also missing a space before "(hardware accelerated)".

The result is we see one of:

  Mitigation: Indirect branch serialisation (kernel only)
  Mitigation: Indirect branch cache disabled
  Mitigation: Software count cache flush
  Mitigation: Software count cache flush (hardware accelerated)

Fixes: ee13cb249fab ("powerpc/64s: Add support for software count cache flush")
Cc: stable@vger.kernel.org # v4.19+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Michael Neuling <mikey@neuling.org>
Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/security.c |   23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -190,29 +190,22 @@ ssize_t cpu_show_spectre_v2(struct devic
 	bcs = security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED);
 	ccd = security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED);
 
-	if (bcs || ccd || count_cache_flush_type != COUNT_CACHE_FLUSH_NONE) {
-		bool comma = false;
+	if (bcs || ccd) {
 		seq_buf_printf(&s, "Mitigation: ");
 
-		if (bcs) {
+		if (bcs)
 			seq_buf_printf(&s, "Indirect branch serialisation (kernel only)");
-			comma = true;
-		}
 
-		if (ccd) {
-			if (comma)
-				seq_buf_printf(&s, ", ");
-			seq_buf_printf(&s, "Indirect branch cache disabled");
-			comma = true;
-		}
-
-		if (comma)
+		if (bcs && ccd)
 			seq_buf_printf(&s, ", ");
 
-		seq_buf_printf(&s, "Software count cache flush");
+		if (ccd)
+			seq_buf_printf(&s, "Indirect branch cache disabled");
+	} else if (count_cache_flush_type != COUNT_CACHE_FLUSH_NONE) {
+		seq_buf_printf(&s, "Mitigation: Software count cache flush");
 
 		if (count_cache_flush_type == COUNT_CACHE_FLUSH_HW)
-			seq_buf_printf(&s, "(hardware accelerated)");
+			seq_buf_printf(&s, " (hardware accelerated)");
 	} else if (btb_flush_enabled) {
 		seq_buf_printf(&s, "Mitigation: Branch predictor state flush");
 	} else {


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
