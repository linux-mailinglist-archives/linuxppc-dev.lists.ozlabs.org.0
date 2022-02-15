Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 203784B7485
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:01:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyr6W449fz3dd3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 06:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=IGG9H9Bz;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4pmmE9A7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=IGG9H9Bz; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4pmmE9A7; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyr4N6LdZz3bP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:59:48 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 436EC1F39A;
 Tue, 15 Feb 2022 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644951585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PWzSlQIs0nJhx9D6zU0MUUZU7GkWRLbyy05euVmoJw=;
 b=IGG9H9Bzc67A44ptNhcrUEz/cfW9VghidwrhnwyZ8FSkoOkVKuoECr3k225UksFcSxE08P
 dnSIOwzYjQaJe/tjTZc8K8NmZTp9Pn4PtY03jD+sH8yFeJfNu4WYqf/ue00fLrXHUNFusn
 hslcpkPzuqEk1OP8ZoseWNh4CeYF8E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644951585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PWzSlQIs0nJhx9D6zU0MUUZU7GkWRLbyy05euVmoJw=;
 b=4pmmE9A7EMF9bdscvT3PhBtVNC/Bnclc+ZF9denJsau1bC11G6whW3f61gvnsPAFEU/o+r
 LbX9EYoBgNIeiLAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D202E1376E;
 Tue, 15 Feb 2022 18:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8AjGMSD4C2L2MwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 15 Feb 2022 18:59:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 1/2] crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
Date: Tue, 15 Feb 2022 19:59:35 +0100
Message-Id: <20220215185936.15576-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215185936.15576-1-pvorel@suse.cz>
References: <20220215185936.15576-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nicolai Stange <nstange@suse.de>,
 linux-kbuild@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
 Petr Vorel <pvorel@suse.cz>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

and remove CRYPTO_DEV_VMX, which looked redundant when only
CRYPTO_DEV_VMX_ENCRYPT used it. Also it forces CRYPTO_GHASH to be
builtin even CRYPTO_DEV_VMX_ENCRYPT was configured as module.

Update powerpc defconfigs and description in MAINTAINERS.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
new in v2

This might be a bit aggressive, but IMHO CRYPTO_DEV_VMX only complicated
things for nothing. But if you do *not* agree with removing it, I just add
select to drivers/crypto/vmx/Kconfig (which forces dependencies to be
always modules.)

If it's ok for you to remove, please also check whether the description
is ok. get_maintainer.pl script has size limitation:

$ ./scripts/get_maintainer.pl drivers/crypto/vmx/Kconfig
...
linux-crypto@vger.kernel.org (open list:IBM Power VMX Cryptographic Acceleration Instru...)

maybe the name should be shorter.

Kind regards,
Petr

 MAINTAINERS                            | 2 +-
 arch/powerpc/configs/powernv_defconfig | 2 +-
 arch/powerpc/configs/ppc64_defconfig   | 2 +-
 arch/powerpc/configs/pseries_defconfig | 2 +-
 drivers/crypto/Kconfig                 | 6 ------
 drivers/crypto/vmx/Kconfig             | 4 ++--
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..80e562579180 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9207,7 +9207,7 @@ L:	target-devel@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/ibmvscsi_tgt/
 
-IBM Power VMX Cryptographic instructions
+IBM Power VMX Cryptographic Acceleration Instructions Driver
 M:	Breno Leitão <leitao@debian.org>
 M:	Nayna Jain <nayna@linux.ibm.com>
 M:	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 49f49c263935..4b250d05dcdf 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -337,7 +337,7 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX_ENCRYPT=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index c8b0e80d613b..ebd33b94debb 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -355,7 +355,7 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX_ENCRYPT=m
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b571d084c148..304673817ef1 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -315,7 +315,7 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX_ENCRYPT=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 4f705674f94f..956f956607a5 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -761,12 +761,6 @@ config CRYPTO_DEV_QCOM_RNG
 	  To compile this driver as a module, choose M here. The
 	  module will be called qcom-rng. If unsure, say N.
 
-config CRYPTO_DEV_VMX
-	bool "Support for VMX cryptographic acceleration instructions"
-	depends on PPC64 && VSX
-	help
-	  Support for VMX cryptographic acceleration instructions.
-
 source "drivers/crypto/vmx/Kconfig"
 
 config CRYPTO_DEV_IMGTEC_HASH
diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
index c85fab7ef0bd..1a3808b719f3 100644
--- a/drivers/crypto/vmx/Kconfig
+++ b/drivers/crypto/vmx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CRYPTO_DEV_VMX_ENCRYPT
-	tristate "Encryption acceleration support on P8 CPU"
-	depends on CRYPTO_DEV_VMX
+	tristate "Power VMX cryptographic acceleration instructions driver"
+	depends on PPC64 && VSX
 	select CRYPTO_GHASH
 	default m
 	help
-- 
2.35.1

