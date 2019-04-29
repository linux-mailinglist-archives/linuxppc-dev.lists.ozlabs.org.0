Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E64E041
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:08:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t0jH0rDhzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 20:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0LS66MYzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tpMZo00j"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0LS41fdz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:52:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0LS33lLz9sCJ; Mon, 29 Apr 2019 19:52:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="tpMZo00j"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0LR20ZXz9s70
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:51:59 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 403A12075E;
 Mon, 29 Apr 2019 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531517;
 bh=fHGgDnY7NYBBzmC9xy4NIgEtGXMZOOe4TuzPxS+MMvc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=tpMZo00jfbhpavJ6OVnoDDzEi3dhaFk/iGClJWxbSNQHCh0XwY4ULup8q0b49EG4j
 UFsiGp2sxNDaNy/KJEXapRX+9x4w8tRNXx0KXDorPpeZu/gyjC5+FwIkGHdNj45YLb
 3mfyVh1YUI8hHTtmIljN633vVc6mTkRALaoNN78c=
Subject: Patch "powerpc/64s: Enable barrier_nospec based on firmware settings"
 has been added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:22 +0200
In-Reply-To: <20190421142037.21881-29-mpe@ellerman.id.au>
Message-ID: <155653148212385@kroah.com>
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

    powerpc/64s: Enable barrier_nospec based on firmware settings

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-64s-enable-barrier_nospec-based-on-firmware-settings.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:13 +1000
Subject: powerpc/64s: Enable barrier_nospec based on firmware settings
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-29-mpe@ellerman.id.au>

From: Michal Suchanek <msuchanek@suse.de>

commit cb3d6759a93c6d0aea1c10deb6d00e111c29c19c upstream.

Check what firmware told us and enable/disable the barrier_nospec as
appropriate.

We err on the side of enabling the barrier, as it's no-op on older
systems, see the comment for more detail.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/setup.h       |    1 
 arch/powerpc/kernel/security.c         |   59 +++++++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/setup.c |    1 
 arch/powerpc/platforms/pseries/setup.c |    1 
 4 files changed, 62 insertions(+)

--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -38,6 +38,7 @@ enum l1d_flush_type {
 
 void setup_rfi_flush(enum l1d_flush_type, bool enable);
 void do_rfi_flush_fixups(enum l1d_flush_type types);
+void setup_barrier_nospec(void);
 void do_barrier_nospec_fixups(bool enable);
 extern bool barrier_nospec_enabled;
 
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -24,6 +24,65 @@ static void enable_barrier_nospec(bool e
 	do_barrier_nospec_fixups(enable);
 }
 
+void setup_barrier_nospec(void)
+{
+	bool enable;
+
+	/*
+	 * It would make sense to check SEC_FTR_SPEC_BAR_ORI31 below as well.
+	 * But there's a good reason not to. The two flags we check below are
+	 * both are enabled by default in the kernel, so if the hcall is not
+	 * functional they will be enabled.
+	 * On a system where the host firmware has been updated (so the ori
+	 * functions as a barrier), but on which the hypervisor (KVM/Qemu) has
+	 * not been updated, we would like to enable the barrier. Dropping the
+	 * check for SEC_FTR_SPEC_BAR_ORI31 achieves that. The only downside is
+	 * we potentially enable the barrier on systems where the host firmware
+	 * is not updated, but that's harmless as it's a no-op.
+	 */
+	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
+		 security_ftr_enabled(SEC_FTR_BNDS_CHK_SPEC_BAR);
+
+	enable_barrier_nospec(enable);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int barrier_nospec_set(void *data, u64 val)
+{
+	switch (val) {
+	case 0:
+	case 1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!!val == !!barrier_nospec_enabled)
+		return 0;
+
+	enable_barrier_nospec(!!val);
+
+	return 0;
+}
+
+static int barrier_nospec_get(void *data, u64 *val)
+{
+	*val = barrier_nospec_enabled ? 1 : 0;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_barrier_nospec,
+			barrier_nospec_get, barrier_nospec_set, "%llu\n");
+
+static __init int barrier_nospec_debugfs_init(void)
+{
+	debugfs_create_file("barrier_nospec", 0600, powerpc_debugfs_root, NULL,
+			    &fops_barrier_nospec);
+	return 0;
+}
+device_initcall(barrier_nospec_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */
+
 ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	bool thread_priv;
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -123,6 +123,7 @@ static void pnv_setup_rfi_flush(void)
 		  security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
 
 	setup_rfi_flush(type, enable);
+	setup_barrier_nospec();
 }
 
 static void __init pnv_setup_arch(void)
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -574,6 +574,7 @@ void pseries_setup_rfi_flush(void)
 		 security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR);
 
 	setup_rfi_flush(types, enable);
+	setup_barrier_nospec();
 }
 
 static void __init pSeries_setup_arch(void)


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
