Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5693E10A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:08:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t22B1R2BzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t0NV5qYwzDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lDqLfEQw"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44t0NV4vT3z8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:53:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44t0NV4TpHz9sCJ; Mon, 29 Apr 2019 19:53:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lDqLfEQw"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44t0NV0QP2z9s70
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 19:53:46 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6ED3D20449;
 Mon, 29 Apr 2019 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556531623;
 bh=gpPEct4yNlxo6SvJtoIALOk9oE9boTtwJYde8AeR+50=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=lDqLfEQwDLTrc8IIR1SaOW63pjzYHbOJ8nAt0kZZVBNuQMC83SNO6IZA3MZHASLb9
 GhxSWmYj4JmYrggd3NRPRt/uEblucUZXddGyoXxo6DOBdPzzUcQfI6YHqlZ/9W8Er/
 bPA8W52ephpI+HPplJo3BQnS8c9WgVnJAvk7pqH4=
Subject: Patch "powerpc: Use barrier_nospec in copy_from_user()" has been
 added to the 4.4-stable tree
To: christophe.leroy@c-s.fr, diana.craciun@nxp.com, gregkh@linuxfoundation.org,
 linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, msuchanek@suse.de,
 npiggin@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Apr 2019 11:51:32 +0200
In-Reply-To: <20190421142037.21881-31-mpe@ellerman.id.au>
Message-ID: <1556531492188249@kroah.com>
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

    powerpc: Use barrier_nospec in copy_from_user()

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-use-barrier_nospec-in-copy_from_user.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon 29 Apr 2019 11:38:37 AM CEST
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Apr 2019 00:20:15 +1000
Subject: powerpc: Use barrier_nospec in copy_from_user()
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, diana.craciun@nxp.com, msuchanek@suse.de, npiggin@gmail.com, christophe.leroy@c-s.fr
Message-ID: <20190421142037.21881-31-mpe@ellerman.id.au>

From: Michael Ellerman <mpe@ellerman.id.au>

commit ddf35cf3764b5a182b178105f57515b42e2634f8 upstream.

Based on the x86 commit doing the same.

See commit 304ec1b05031 ("x86/uaccess: Use __uaccess_begin_nospec()
and uaccess_try_nospec") and b3bbfb3fb5d2 ("x86: Introduce
__uaccess_begin_nospec() and uaccess_try_nospec") for more detail.

In all cases we are ordering the load from the potentially
user-controlled pointer vs a previous branch based on an access_ok()
check or similar.

Base on a patch from Michal Suchanek.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/uaccess.h |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -269,6 +269,7 @@ do {								\
 	__chk_user_ptr(ptr);					\
 	if (!is_kernel_addr((unsigned long)__gu_addr))		\
 		might_fault();					\
+	barrier_nospec();					\
 	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 	__gu_err;						\
@@ -283,6 +284,7 @@ do {								\
 	__chk_user_ptr(ptr);					\
 	if (!is_kernel_addr((unsigned long)__gu_addr))		\
 		might_fault();					\
+	barrier_nospec();					\
 	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 	__gu_err;						\
@@ -295,8 +297,10 @@ do {								\
 	unsigned long  __gu_val = 0;					\
 	__typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
 	might_fault();							\
-	if (access_ok(VERIFY_READ, __gu_addr, (size)))			\
+	if (access_ok(VERIFY_READ, __gu_addr, (size))) {		\
+		barrier_nospec();					\
 		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
+	}								\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
 	__gu_err;							\
 })
@@ -307,6 +311,7 @@ do {								\
 	unsigned long __gu_val;					\
 	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
 	__chk_user_ptr(ptr);					\
+	barrier_nospec();					\
 	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 	__gu_err;						\
@@ -323,8 +328,10 @@ extern unsigned long __copy_tofrom_user(
 static inline unsigned long copy_from_user(void *to,
 		const void __user *from, unsigned long n)
 {
-	if (likely(access_ok(VERIFY_READ, from, n)))
+	if (likely(access_ok(VERIFY_READ, from, n))) {
+		barrier_nospec();
 		return __copy_tofrom_user((__force void __user *)to, from, n);
+	}
 	memset(to, 0, n);
 	return n;
 }
@@ -359,21 +366,27 @@ static inline unsigned long __copy_from_
 
 		switch (n) {
 		case 1:
+			barrier_nospec();
 			__get_user_size(*(u8 *)to, from, 1, ret);
 			break;
 		case 2:
+			barrier_nospec();
 			__get_user_size(*(u16 *)to, from, 2, ret);
 			break;
 		case 4:
+			barrier_nospec();
 			__get_user_size(*(u32 *)to, from, 4, ret);
 			break;
 		case 8:
+			barrier_nospec();
 			__get_user_size(*(u64 *)to, from, 8, ret);
 			break;
 		}
 		if (ret == 0)
 			return 0;
 	}
+
+	barrier_nospec();
 	return __copy_tofrom_user((__force void __user *)to, from, n);
 }
 
@@ -400,6 +413,7 @@ static inline unsigned long __copy_to_us
 		if (ret == 0)
 			return 0;
 	}
+
 	return __copy_tofrom_user(to, (__force const void __user *)from, n);
 }
 


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
