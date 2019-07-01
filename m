Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBB5C056
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 17:35:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45crzK4Q6TzDq9T
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 01:35:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=jeyu@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="y7bqjm3q"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cqwy04B9zDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:48:02 +1000 (AEST)
Received: from linux-8ccs (ip5f5ade8b.dynamic.kabel-deutschland.de
 [95.90.222.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C4972064B;
 Mon,  1 Jul 2019 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561992479;
 bh=eWd844sqUf7/Cav62XflkGWhhzfKQ2VHhz2g3WuFpG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y7bqjm3qprKdQmXs4IhW0kdDOeWF8ghzgbcsKAJZajarOxYIoGvSk/+LRG4mijRv5
 96JYOnmsV3GRwYcBoZMXxr61qt4fEVB9bdjWSKbHw7SwIZpUckxwCz8DHYDCZAwpPm
 7hLeSn5yMazZ5AojiCZre4S2MNhNGOQP1SClJFXQ=
Date: Mon, 1 Jul 2019 16:47:53 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v12 01/11] MODSIGN: Export module signature definitions
Message-ID: <20190701144752.GC25484@linux-8ccs>
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
 <20190628021934.4260-2-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190628021934.4260-2-bauerman@linux.ibm.com>
X-OS: Linux linux-8ccs 5.1.0-rc1-lp150.12.28-default+ x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 02 Jul 2019 01:31:59 +1000
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Thiago Jung Bauermann [27/06/19 23:19 -0300]:
>IMA will use the module_signature format for append signatures, so export
>the relevant definitions and factor out the code which verifies that the
>appended signature trailer is valid.
>
>Also, create a CONFIG_MODULE_SIG_FORMAT option so that IMA can select it
>and be able to use mod_check_sig() without having to depend on either
>CONFIG_MODULE_SIG or CONFIG_MODULES.
>
>Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>Cc: Jessica Yu <jeyu@kernel.org>
>---
> include/linux/module.h           |  3 --
> include/linux/module_signature.h | 44 +++++++++++++++++++++++++
> init/Kconfig                     |  6 +++-
> kernel/Makefile                  |  1 +
> kernel/module.c                  |  1 +
> kernel/module_signature.c        | 46 ++++++++++++++++++++++++++
> kernel/module_signing.c          | 56 +++++---------------------------
> scripts/Makefile                 |  2 +-
> 8 files changed, 106 insertions(+), 53 deletions(-)
>
>diff --git a/include/linux/module.h b/include/linux/module.h
>index 188998d3dca9..aa56f531cf1e 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -25,9 +25,6 @@
> #include <linux/percpu.h>
> #include <asm/module.h>
>
>-/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
>-#define MODULE_SIG_STRING "~Module signature appended~\n"
>-

Hi Thiago, apologies for the delay.

It looks like arch/s390/kernel/machine_kexec_file.c also relies on
MODULE_SIG_STRING being defined, so module_signature.h will need to be
included there too, otherwise we'll run into a compilation error.

Other than that, the module-related changes look good to me:

Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks!

Jessica

> /* Not Yet Implemented */
> #define MODULE_SUPPORTED_DEVICE(name)
>
>diff --git a/include/linux/module_signature.h b/include/linux/module_signature.h
>new file mode 100644
>index 000000000000..523617fc5b6a
>--- /dev/null
>+++ b/include/linux/module_signature.h
>@@ -0,0 +1,44 @@
>+/* SPDX-License-Identifier: GPL-2.0+ */
>+/*
>+ * Module signature handling.
>+ *
>+ * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
>+ * Written by David Howells (dhowells@redhat.com)
>+ */
>+
>+#ifndef _LINUX_MODULE_SIGNATURE_H
>+#define _LINUX_MODULE_SIGNATURE_H
>+
>+/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
>+#define MODULE_SIG_STRING "~Module signature appended~\n"
>+
>+enum pkey_id_type {
>+	PKEY_ID_PGP,		/* OpenPGP generated key ID */
>+	PKEY_ID_X509,		/* X.509 arbitrary subjectKeyIdentifier */
>+	PKEY_ID_PKCS7,		/* Signature in PKCS#7 message */
>+};
>+
>+/*
>+ * Module signature information block.
>+ *
>+ * The constituents of the signature section are, in order:
>+ *
>+ *	- Signer's name
>+ *	- Key identifier
>+ *	- Signature data
>+ *	- Information block
>+ */
>+struct module_signature {
>+	u8	algo;		/* Public-key crypto algorithm [0] */
>+	u8	hash;		/* Digest algorithm [0] */
>+	u8	id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
>+	u8	signer_len;	/* Length of signer's name [0] */
>+	u8	key_id_len;	/* Length of key identifier [0] */
>+	u8	__pad[3];
>+	__be32	sig_len;	/* Length of signature data */
>+};
>+
>+int mod_check_sig(const struct module_signature *ms, size_t file_len,
>+		  const char *name);
>+
>+#endif /* _LINUX_MODULE_SIGNATURE_H */
>diff --git a/init/Kconfig b/init/Kconfig
>index 8b9ffe236e4f..c2286a3c74c5 100644
>--- a/init/Kconfig
>+++ b/init/Kconfig
>@@ -1852,6 +1852,10 @@ config BASE_SMALL
> 	default 0 if BASE_FULL
> 	default 1 if !BASE_FULL
>
>+config MODULE_SIG_FORMAT
>+	def_bool n
>+	select SYSTEM_DATA_VERIFICATION
>+
> menuconfig MODULES
> 	bool "Enable loadable module support"
> 	option modules
>@@ -1929,7 +1933,7 @@ config MODULE_SRCVERSION_ALL
> config MODULE_SIG
> 	bool "Module signature verification"
> 	depends on MODULES
>-	select SYSTEM_DATA_VERIFICATION
>+	select MODULE_SIG_FORMAT
> 	help
> 	  Check modules for valid signatures upon load: the signature
> 	  is simply appended to the module. For more information see
>diff --git a/kernel/Makefile b/kernel/Makefile
>index 33824f0385b3..f29ae2997a43 100644
>--- a/kernel/Makefile
>+++ b/kernel/Makefile
>@@ -58,6 +58,7 @@ endif
> obj-$(CONFIG_UID16) += uid16.o
> obj-$(CONFIG_MODULES) += module.o
> obj-$(CONFIG_MODULE_SIG) += module_signing.o
>+obj-$(CONFIG_MODULE_SIG_FORMAT) += module_signature.o
> obj-$(CONFIG_KALLSYMS) += kallsyms.o
> obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
> obj-$(CONFIG_CRASH_CORE) += crash_core.o
>diff --git a/kernel/module.c b/kernel/module.c
>index 6e6712b3aaf5..2712f4d217f5 100644
>--- a/kernel/module.c
>+++ b/kernel/module.c
>@@ -19,6 +19,7 @@
> #include <linux/export.h>
> #include <linux/extable.h>
> #include <linux/moduleloader.h>
>+#include <linux/module_signature.h>
> #include <linux/trace_events.h>
> #include <linux/init.h>
> #include <linux/kallsyms.h>
>diff --git a/kernel/module_signature.c b/kernel/module_signature.c
>new file mode 100644
>index 000000000000..4224a1086b7d
>--- /dev/null
>+++ b/kernel/module_signature.c
>@@ -0,0 +1,46 @@
>+// SPDX-License-Identifier: GPL-2.0+
>+/*
>+ * Module signature checker
>+ *
>+ * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
>+ * Written by David Howells (dhowells@redhat.com)
>+ */
>+
>+#include <linux/errno.h>
>+#include <linux/printk.h>
>+#include <linux/module_signature.h>
>+#include <asm/byteorder.h>
>+
>+/**
>+ * mod_check_sig - check that the given signature is sane
>+ *
>+ * @ms:		Signature to check.
>+ * @file_len:	Size of the file to which @ms is appended.
>+ * @name:	What is being checked. Used for error messages.
>+ */
>+int mod_check_sig(const struct module_signature *ms, size_t file_len,
>+		  const char *name)
>+{
>+	if (be32_to_cpu(ms->sig_len) >= file_len - sizeof(*ms))
>+		return -EBADMSG;
>+
>+	if (ms->id_type != PKEY_ID_PKCS7) {
>+		pr_err("%s: Module is not signed with expected PKCS#7 message\n",
>+		       name);
>+		return -ENOPKG;
>+	}
>+
>+	if (ms->algo != 0 ||
>+	    ms->hash != 0 ||
>+	    ms->signer_len != 0 ||
>+	    ms->key_id_len != 0 ||
>+	    ms->__pad[0] != 0 ||
>+	    ms->__pad[1] != 0 ||
>+	    ms->__pad[2] != 0) {
>+		pr_err("%s: PKCS#7 signature info has unexpected non-zero params\n",
>+		       name);
>+		return -EBADMSG;
>+	}
>+
>+	return 0;
>+}
>diff --git a/kernel/module_signing.c b/kernel/module_signing.c
>index 6b9a926fd86b..cdd04a6b8074 100644
>--- a/kernel/module_signing.c
>+++ b/kernel/module_signing.c
>@@ -11,37 +11,13 @@
>
> #include <linux/kernel.h>
> #include <linux/errno.h>
>+#include <linux/module.h>
>+#include <linux/module_signature.h>
> #include <linux/string.h>
> #include <linux/verification.h>
> #include <crypto/public_key.h>
> #include "module-internal.h"
>
>-enum pkey_id_type {
>-	PKEY_ID_PGP,		/* OpenPGP generated key ID */
>-	PKEY_ID_X509,		/* X.509 arbitrary subjectKeyIdentifier */
>-	PKEY_ID_PKCS7,		/* Signature in PKCS#7 message */
>-};
>-
>-/*
>- * Module signature information block.
>- *
>- * The constituents of the signature section are, in order:
>- *
>- *	- Signer's name
>- *	- Key identifier
>- *	- Signature data
>- *	- Information block
>- */
>-struct module_signature {
>-	u8	algo;		/* Public-key crypto algorithm [0] */
>-	u8	hash;		/* Digest algorithm [0] */
>-	u8	id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
>-	u8	signer_len;	/* Length of signer's name [0] */
>-	u8	key_id_len;	/* Length of key identifier [0] */
>-	u8	__pad[3];
>-	__be32	sig_len;	/* Length of signature data */
>-};
>-
> /*
>  * Verify the signature on a module.
>  */
>@@ -49,6 +25,7 @@ int mod_verify_sig(const void *mod, struct load_info *info)
> {
> 	struct module_signature ms;
> 	size_t sig_len, modlen = info->len;
>+	int ret;
>
> 	pr_devel("==>%s(,%zu)\n", __func__, modlen);
>
>@@ -56,32 +33,15 @@ int mod_verify_sig(const void *mod, struct load_info *info)
> 		return -EBADMSG;
>
> 	memcpy(&ms, mod + (modlen - sizeof(ms)), sizeof(ms));
>-	modlen -= sizeof(ms);
>+
>+	ret = mod_check_sig(&ms, modlen, info->name);
>+	if (ret)
>+		return ret;
>
> 	sig_len = be32_to_cpu(ms.sig_len);
>-	if (sig_len >= modlen)
>-		return -EBADMSG;
>-	modlen -= sig_len;
>+	modlen -= sig_len + sizeof(ms);
> 	info->len = modlen;
>
>-	if (ms.id_type != PKEY_ID_PKCS7) {
>-		pr_err("%s: Module is not signed with expected PKCS#7 message\n",
>-		       info->name);
>-		return -ENOPKG;
>-	}
>-
>-	if (ms.algo != 0 ||
>-	    ms.hash != 0 ||
>-	    ms.signer_len != 0 ||
>-	    ms.key_id_len != 0 ||
>-	    ms.__pad[0] != 0 ||
>-	    ms.__pad[1] != 0 ||
>-	    ms.__pad[2] != 0) {
>-		pr_err("%s: PKCS#7 signature info has unexpected non-zero params\n",
>-		       info->name);
>-		return -EBADMSG;
>-	}
>-
> 	return verify_pkcs7_signature(mod, modlen, mod + modlen, sig_len,
> 				      VERIFY_USE_SECONDARY_KEYRING,
> 				      VERIFYING_MODULE_SIGNATURE,
>diff --git a/scripts/Makefile b/scripts/Makefile
>index 9d442ee050bd..52098b080ab7 100644
>--- a/scripts/Makefile
>+++ b/scripts/Makefile
>@@ -17,7 +17,7 @@ hostprogs-$(CONFIG_VT)           += conmakehash
> hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
> hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
> hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
>-hostprogs-$(CONFIG_MODULE_SIG)	 += sign-file
>+hostprogs-$(CONFIG_MODULE_SIG_FORMAT) += sign-file
> hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
> hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
>
