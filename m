Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C4E0AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:42:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t1S95q3xzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0Mf28lrzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JVJ1ngqG"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0Mf1Fvvz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0Mf0WPsz9sCJ; Mon, 29 Apr 2019 19:53:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JVJ1ngqG"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0Md3f5nz9s70
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:53:01 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 738062147A;
 Mon, 29 Apr 2019 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531580;
 bh=/sft6W0Z250JdfIQQC0zbCMDD9RsiLBe0g0/EDwa6TI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=JVJ1ngqG7JM/R1N4OGvPSzhp2Wc7N+ZV5MkeuvkKrHCy13YslRmz+NFQWjtn030aK
 62IWsbFvmQCQh0bow82+v+2Gyom72dWWvlNoo7kXncfF6erISCx7opd/2lzFX6WTGB
 4efdwowpFAdvOw164Gp2eBzZtfiPlv8NEGA5YXcA=
Subject: Patch "powerpc/powernv: Use the security flags in
 pnv_setup_rfi_flush()" has been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:27 +0200
In-Reply-To: <20190421142037.21881-17-mpe@ellerman.id.au>
Message-ID: <155653148779161@kroah.com>
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

    powerpc/powernv: Use the security flags in pnv_setup_rfi_flush()

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-powernv-use-the-security-flags-in-pnv_setup_rfi_flush.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:01 +1000
Subject: powerpc/powernv: Use the security flags in pnv_setup_rfi_flush()
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-17-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

commit 37c0bdd00d3ae83369ab60a6712c28e11e6458d5 upstream.

Now that we have the security flags we can significantly simplify the
code in pnv_setup_rfi_flush(), because we can use the flags instead of
checking device tree properties and because the security flags have
pessimistic defaults.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/platforms/powernv/setup.c |   41 ++++++++-------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -65,7 +65,7 @@ static void init_fw_feat_flags(struct de
 	if (fw_feature_is("enabled", "fw-bcctrl-serialized", np))
 		security_ftr_set(SEC_FTR_BCCTRL_SERIALISED);
 
-	if (fw_feature_is("enabled", "inst-spec-barrier-ori31,31,0", np))
+	if (fw_feature_is("enabled", "inst-l1d-flush-ori30,30,0", np))
 		security_ftr_set(SEC_FTR_L1D_FLUSH_ORI30);
 
 	if (fw_feature_is("enabled", "inst-l1d-flush-trig2", np))
@@ -98,11 +98,10 @@ static void pnv_setup_rfi_flush(void)
 {
 	struct device_node *np, *fw_features;
 	enum l1d_flush_type type;
-	int enable;
+	bool enable;
 
 	/* Default to fallback in case fw-features are not available */
 	type = L1D_FLUSH_FALLBACK;
-	enable = 1;
 
 	np = of_find_node_by_name(NULL, "ibm,opal");
 	fw_features = of_get_child_by_name(np, "fw-features");
@@ -110,40 +109,20 @@ static void pnv_setup_rfi_flush(void)
 
 	if (fw_features) {
 		init_fw_feat_flags(fw_features);
+		of_node_put(fw_features);
 
-		np = of_get_child_by_name(fw_features, "inst-l1d-flush-trig2");
-		if (np && of_property_read_bool(np, "enabled"))
+		if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_TRIG2))
 			type = L1D_FLUSH_MTTRIG;
 
-		of_node_put(np);
-
-		np = of_get_child_by_name(fw_features, "inst-l1d-flush-ori30,30,0");
-		if (np && of_property_read_bool(np, "enabled"))
+		if (security_ftr_enabled(SEC_FTR_L1D_FLUSH_ORI30))
 			type = L1D_FLUSH_ORI;
-
-		of_node_put(np);
-
-		/* Enable unless firmware says NOT to */
-		enable = 2;
-		np = of_get_child_by_name(fw_features, "needs-l1d-flush-msr-hv-1-to-0");
-		if (np && of_property_read_bool(np, "disabled"))
-			enable--;
-
-		of_node_put(np);
-
-		np = of_get_child_by_name(fw_features, "needs-l1d-flush-msr-pr-0-to-1");
-		if (np && of_property_read_bool(np, "disabled"))
-			enable--;
-
-		np = of_get_child_by_name(fw_features, "speculation-policy-favor-security");
-		if (np && of_property_read_bool(np, "disabled"))
-			enable = 0;
-
-		of_node_put(np);
-		of_node_put(fw_features);
 	}
 
-	setup_rfi_flush(type, enable > 0);
+	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
+		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
+		  security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
+
+	setup_rfi_flush(type, enable);
 }
 
 static void __init pnv_setup_arch(void)


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
