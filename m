Return-Path: <linuxppc-dev+bounces-4296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFD9F6404
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF708Rtz30V0;
	Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519338;
	cv=none; b=oGuPfpa0rhw8g1mOU8WjwBRAEFF5+gOvkAUW+zbjdTq4cfk6wIVPyNNbDUhvxI59Yb3NIviOTx8qNSExt0hYFb5SsNYpIr/i9Ysm5IeCkgii9/y8MCKKLZWFf8XVMwUxw85llA78jD27GNcnz9btWjtwEkdH/kc0KgP6ymlW9s5JQgBdM1ky585jUxw5TKxTGpLN7GHKjJTn/GaZpASAJGZWgxNJsvR/sgNZrvO7A7uUjB9bM4JrWsytP9DUrgZVnPf5HeSGTl6NeImdtwZ8EhVJrUB82YtcI4oEEpC7d437dwLGEH/oUC0yY8PTmpZlkas7ZCbTM72yL++Fbrp44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519338; c=relaxed/relaxed;
	bh=Ty/2YtR14LZh+B3vW008tEeC5DipMfIBovG1QReJ9/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hb7QYtdfegilWZypYhErBJH7btXqX//FUBIO1XJEX2yAJY6oSh2SNBpGqM2sGqlys6tg+xSIszmNrLSvRgs+8Wh6D8La+8EMweFp12sjTu+R/m59dgZFVwMaLNmaRlLOioV85H+7O6/tBcFUe/Jc/V7dsUPxV2UPZU1erqGTMwmoxWnZvyJXJBHRIjRYf21m+sbCMpMxuYR++/75iAEi/Qa7zjK11ytDK067AQrtJqXrhPGJWQ9mU1krB9DsR2aTGtRTrZnBhb+15d8zgWCdOHnP0+eWDwRX8VtIOtUwZfAYmemMBma3x3Hz5zvPrT2f2L/3nllVbXtcxHvfYqVF0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W44obXvt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W44obXvt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF400CHz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519329;
	bh=Ty/2YtR14LZh+B3vW008tEeC5DipMfIBovG1QReJ9/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W44obXvtXWO5f1NUn6wIIfwLEY4u/ZWLHpRj1ZvkZO8qqUIxGH936qgozWDtMuaxK
	 WwXbXaQhhmvYKLEnt+I7PhhMNe5r6fsgqP4FOQB1IvByuoci7GkvnLqvdYvw7luCFa
	 i5NhGLlQG3u486Y6WleR70iaHDPtNCsJobYmfYWhW6WK/EVMPolBDLo9+Pz2+Rvbh8
	 +9wABsRws7FN575le9uwYiE2iEwItBjkc5BIrPdR7djfOWKMUzNcPY9aAFlaevzPOX
	 lpX+5slLjEy/zomkpmKkRLpxiI1g+CvHDag5kQ+Qnl6RPHgi3Z7bJqIEGYesvJ+kEI
	 +roeeU0lcZMnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDx6CRhz4xfB;
	Wed, 18 Dec 2024 21:55:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 07/25] powerpc: Remove DCR_MMIO and the DCR generic layer
Date: Wed, 18 Dec 2024 21:54:55 +1100
Message-ID: <20241218105523.416573-7-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The Cell blade support was the last user of DCR_MMIO, so it can now
be removed.

That only leaves DCR_NATIVE, meaning the DCR generic layer which allows
using either DCR_NATIVE or DCR_MMIO is also unnecessary, remove it too.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/Kconfig                   |   5 +-
 arch/powerpc/include/asm/dcr-generic.h |  36 -----
 arch/powerpc/include/asm/dcr-mmio.h    |  44 ------
 arch/powerpc/include/asm/dcr.h         |  32 -----
 arch/powerpc/sysdev/dcr.c              | 182 -------------------------
 5 files changed, 1 insertion(+), 298 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/dcr-generic.h
 delete mode 100644 arch/powerpc/include/asm/dcr-mmio.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a0ce777f9706..00d6cd943a1f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -407,12 +407,9 @@ config ARCH_HAS_ADD_PAGES
 config PPC_DCR_NATIVE
 	bool
 
-config PPC_DCR_MMIO
-	bool
-
 config PPC_DCR
 	bool
-	depends on PPC_DCR_NATIVE || PPC_DCR_MMIO
+	depends on PPC_DCR_NATIVE
 	default y
 
 config PPC_PCI_OF_BUS_MAP
diff --git a/arch/powerpc/include/asm/dcr-generic.h b/arch/powerpc/include/asm/dcr-generic.h
deleted file mode 100644
index 099c28dd40b9..000000000000
--- a/arch/powerpc/include/asm/dcr-generic.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * (c) Copyright 2006 Benjamin Herrenschmidt, IBM Corp.
- *                    <benh@kernel.crashing.org>
- */
-
-#ifndef _ASM_POWERPC_DCR_GENERIC_H
-#define _ASM_POWERPC_DCR_GENERIC_H
-#ifdef __KERNEL__
-#ifndef __ASSEMBLY__
-
-enum host_type_t {DCR_HOST_MMIO, DCR_HOST_NATIVE, DCR_HOST_INVALID};
-
-typedef struct {
-	enum host_type_t type;
-	union {
-		dcr_host_mmio_t mmio;
-		dcr_host_native_t native;
-	} host;
-} dcr_host_t;
-
-extern bool dcr_map_ok_generic(dcr_host_t host);
-
-extern dcr_host_t dcr_map_generic(struct device_node *dev, unsigned int dcr_n,
-			  unsigned int dcr_c);
-extern void dcr_unmap_generic(dcr_host_t host, unsigned int dcr_c);
-
-extern u32 dcr_read_generic(dcr_host_t host, unsigned int dcr_n);
-
-extern void dcr_write_generic(dcr_host_t host, unsigned int dcr_n, u32 value);
-
-#endif /* __ASSEMBLY__ */
-#endif /* __KERNEL__ */
-#endif /* _ASM_POWERPC_DCR_GENERIC_H */
-
-
diff --git a/arch/powerpc/include/asm/dcr-mmio.h b/arch/powerpc/include/asm/dcr-mmio.h
deleted file mode 100644
index fc6d93ef4a13..000000000000
--- a/arch/powerpc/include/asm/dcr-mmio.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * (c) Copyright 2006 Benjamin Herrenschmidt, IBM Corp.
- *                    <benh@kernel.crashing.org>
- */
-
-#ifndef _ASM_POWERPC_DCR_MMIO_H
-#define _ASM_POWERPC_DCR_MMIO_H
-#ifdef __KERNEL__
-
-#include <asm/io.h>
-
-typedef struct {
-	void __iomem *token;
-	unsigned int stride;
-	unsigned int base;
-} dcr_host_mmio_t;
-
-static inline bool dcr_map_ok_mmio(dcr_host_mmio_t host)
-{
-	return host.token != NULL;
-}
-
-extern dcr_host_mmio_t dcr_map_mmio(struct device_node *dev,
-				    unsigned int dcr_n,
-				    unsigned int dcr_c);
-extern void dcr_unmap_mmio(dcr_host_mmio_t host, unsigned int dcr_c);
-
-static inline u32 dcr_read_mmio(dcr_host_mmio_t host, unsigned int dcr_n)
-{
-	return in_be32(host.token + ((host.base + dcr_n) * host.stride));
-}
-
-static inline void dcr_write_mmio(dcr_host_mmio_t host,
-				  unsigned int dcr_n,
-				  u32 value)
-{
-	out_be32(host.token + ((host.base + dcr_n) * host.stride), value);
-}
-
-#endif /* __KERNEL__ */
-#endif /* _ASM_POWERPC_DCR_MMIO_H */
-
-
diff --git a/arch/powerpc/include/asm/dcr.h b/arch/powerpc/include/asm/dcr.h
index 64030e3a1f30..180021cd0b30 100644
--- a/arch/powerpc/include/asm/dcr.h
+++ b/arch/powerpc/include/asm/dcr.h
@@ -10,46 +10,14 @@
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_PPC_DCR
 
-#ifdef CONFIG_PPC_DCR_NATIVE
 #include <asm/dcr-native.h>
-#endif
 
-#ifdef CONFIG_PPC_DCR_MMIO
-#include <asm/dcr-mmio.h>
-#endif
-
-
-/* Indirection layer for providing both NATIVE and MMIO support. */
-
-#if defined(CONFIG_PPC_DCR_NATIVE) && defined(CONFIG_PPC_DCR_MMIO)
-
-#include <asm/dcr-generic.h>
-
-#define DCR_MAP_OK(host)	dcr_map_ok_generic(host)
-#define dcr_map(dev, dcr_n, dcr_c) dcr_map_generic(dev, dcr_n, dcr_c)
-#define dcr_unmap(host, dcr_c) dcr_unmap_generic(host, dcr_c)
-#define dcr_read(host, dcr_n) dcr_read_generic(host, dcr_n)
-#define dcr_write(host, dcr_n, value) dcr_write_generic(host, dcr_n, value)
-
-#else
-
-#ifdef CONFIG_PPC_DCR_NATIVE
 typedef dcr_host_native_t dcr_host_t;
 #define DCR_MAP_OK(host)	dcr_map_ok_native(host)
 #define dcr_map(dev, dcr_n, dcr_c) dcr_map_native(dev, dcr_n, dcr_c)
 #define dcr_unmap(host, dcr_c) dcr_unmap_native(host, dcr_c)
 #define dcr_read(host, dcr_n) dcr_read_native(host, dcr_n)
 #define dcr_write(host, dcr_n, value) dcr_write_native(host, dcr_n, value)
-#else
-typedef dcr_host_mmio_t dcr_host_t;
-#define DCR_MAP_OK(host)	dcr_map_ok_mmio(host)
-#define dcr_map(dev, dcr_n, dcr_c) dcr_map_mmio(dev, dcr_n, dcr_c)
-#define dcr_unmap(host, dcr_c) dcr_unmap_mmio(host, dcr_c)
-#define dcr_read(host, dcr_n) dcr_read_mmio(host, dcr_n)
-#define dcr_write(host, dcr_n, value) dcr_write_mmio(host, dcr_n, value)
-#endif
-
-#endif /* defined(CONFIG_PPC_DCR_NATIVE) && defined(CONFIG_PPC_DCR_MMIO) */
 
 /*
  * additional helpers to read the DCR * base from the device-tree
diff --git a/arch/powerpc/sysdev/dcr.c b/arch/powerpc/sysdev/dcr.c
index 70ce66eadff1..cb44a69958e7 100644
--- a/arch/powerpc/sysdev/dcr.c
+++ b/arch/powerpc/sysdev/dcr.c
@@ -11,107 +11,6 @@
 #include <linux/of_address.h>
 #include <asm/dcr.h>
 
-#ifdef CONFIG_PPC_DCR_MMIO
-static struct device_node *find_dcr_parent(struct device_node *node)
-{
-	struct device_node *par, *tmp;
-	const u32 *p;
-
-	for (par = of_node_get(node); par;) {
-		if (of_property_read_bool(par, "dcr-controller"))
-			break;
-		p = of_get_property(par, "dcr-parent", NULL);
-		tmp = par;
-		if (p == NULL)
-			par = of_get_parent(par);
-		else
-			par = of_find_node_by_phandle(*p);
-		of_node_put(tmp);
-	}
-	return par;
-}
-#endif
-
-#if defined(CONFIG_PPC_DCR_NATIVE) && defined(CONFIG_PPC_DCR_MMIO)
-
-bool dcr_map_ok_generic(dcr_host_t host)
-{
-	if (host.type == DCR_HOST_NATIVE)
-		return dcr_map_ok_native(host.host.native);
-	else if (host.type == DCR_HOST_MMIO)
-		return dcr_map_ok_mmio(host.host.mmio);
-	else
-		return false;
-}
-EXPORT_SYMBOL_GPL(dcr_map_ok_generic);
-
-dcr_host_t dcr_map_generic(struct device_node *dev,
-			   unsigned int dcr_n,
-			   unsigned int dcr_c)
-{
-	dcr_host_t host;
-	struct device_node *dp;
-	const char *prop;
-
-	host.type = DCR_HOST_INVALID;
-
-	dp = find_dcr_parent(dev);
-	if (dp == NULL)
-		return host;
-
-	prop = of_get_property(dp, "dcr-access-method", NULL);
-
-	pr_debug("dcr_map_generic(dcr-access-method = %s)\n", prop);
-
-	if (!strcmp(prop, "native")) {
-		host.type = DCR_HOST_NATIVE;
-		host.host.native = dcr_map_native(dev, dcr_n, dcr_c);
-	} else if (!strcmp(prop, "mmio")) {
-		host.type = DCR_HOST_MMIO;
-		host.host.mmio = dcr_map_mmio(dev, dcr_n, dcr_c);
-	}
-
-	of_node_put(dp);
-	return host;
-}
-EXPORT_SYMBOL_GPL(dcr_map_generic);
-
-void dcr_unmap_generic(dcr_host_t host, unsigned int dcr_c)
-{
-	if (host.type == DCR_HOST_NATIVE)
-		dcr_unmap_native(host.host.native, dcr_c);
-	else if (host.type == DCR_HOST_MMIO)
-		dcr_unmap_mmio(host.host.mmio, dcr_c);
-	else /* host.type == DCR_HOST_INVALID */
-		WARN_ON(true);
-}
-EXPORT_SYMBOL_GPL(dcr_unmap_generic);
-
-u32 dcr_read_generic(dcr_host_t host, unsigned int dcr_n)
-{
-	if (host.type == DCR_HOST_NATIVE)
-		return dcr_read_native(host.host.native, dcr_n);
-	else if (host.type == DCR_HOST_MMIO)
-		return dcr_read_mmio(host.host.mmio, dcr_n);
-	else /* host.type == DCR_HOST_INVALID */
-		WARN_ON(true);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(dcr_read_generic);
-
-void dcr_write_generic(dcr_host_t host, unsigned int dcr_n, u32 value)
-{
-	if (host.type == DCR_HOST_NATIVE)
-		dcr_write_native(host.host.native, dcr_n, value);
-	else if (host.type == DCR_HOST_MMIO)
-		dcr_write_mmio(host.host.mmio, dcr_n, value);
-	else /* host.type == DCR_HOST_INVALID */
-		WARN_ON(true);
-}
-EXPORT_SYMBOL_GPL(dcr_write_generic);
-
-#endif /* defined(CONFIG_PPC_DCR_NATIVE) && defined(CONFIG_PPC_DCR_MMIO) */
-
 unsigned int dcr_resource_start(const struct device_node *np,
 				unsigned int index)
 {
@@ -137,86 +36,5 @@ unsigned int dcr_resource_len(const struct device_node *np, unsigned int index)
 }
 EXPORT_SYMBOL_GPL(dcr_resource_len);
 
-#ifdef CONFIG_PPC_DCR_MMIO
-
-static u64 of_translate_dcr_address(struct device_node *dev,
-				    unsigned int dcr_n,
-				    unsigned int *out_stride)
-{
-	struct device_node *dp;
-	const u32 *p;
-	unsigned int stride;
-	u64 ret = OF_BAD_ADDR;
-
-	dp = find_dcr_parent(dev);
-	if (dp == NULL)
-		return OF_BAD_ADDR;
-
-	/* Stride is not properly defined yet, default to 0x10 for Axon */
-	p = of_get_property(dp, "dcr-mmio-stride", NULL);
-	stride = (p == NULL) ? 0x10 : *p;
-
-	/* XXX FIXME: Which property name is to use of the 2 following ? */
-	p = of_get_property(dp, "dcr-mmio-range", NULL);
-	if (p == NULL)
-		p = of_get_property(dp, "dcr-mmio-space", NULL);
-	if (p == NULL)
-		goto done;
-
-	/* Maybe could do some better range checking here */
-	ret = of_translate_address(dp, p);
-	if (ret != OF_BAD_ADDR)
-		ret += (u64)(stride) * (u64)dcr_n;
-	if (out_stride)
-		*out_stride = stride;
-
- done:
-	of_node_put(dp);
-	return ret;
-}
-
-dcr_host_mmio_t dcr_map_mmio(struct device_node *dev,
-			     unsigned int dcr_n,
-			     unsigned int dcr_c)
-{
-	dcr_host_mmio_t ret = { .token = NULL, .stride = 0, .base = dcr_n };
-	u64 addr;
-
-	pr_debug("dcr_map(%pOF, 0x%x, 0x%x)\n",
-		 dev, dcr_n, dcr_c);
-
-	addr = of_translate_dcr_address(dev, dcr_n, &ret.stride);
-	pr_debug("translates to addr: 0x%llx, stride: 0x%x\n",
-		 (unsigned long long) addr, ret.stride);
-	if (addr == OF_BAD_ADDR)
-		return ret;
-	pr_debug("mapping 0x%x bytes\n", dcr_c * ret.stride);
-	ret.token = ioremap(addr, dcr_c * ret.stride);
-	if (ret.token == NULL)
-		return ret;
-	pr_debug("mapped at 0x%p -> base is 0x%p\n",
-		 ret.token, ret.token - dcr_n * ret.stride);
-	ret.token -= dcr_n * ret.stride;
-	return ret;
-}
-EXPORT_SYMBOL_GPL(dcr_map_mmio);
-
-void dcr_unmap_mmio(dcr_host_mmio_t host, unsigned int dcr_c)
-{
-	dcr_host_mmio_t h = host;
-
-	if (h.token == NULL)
-		return;
-	h.token += host.base * h.stride;
-	iounmap(h.token);
-	h.token = NULL;
-}
-EXPORT_SYMBOL_GPL(dcr_unmap_mmio);
-
-#endif /* defined(CONFIG_PPC_DCR_MMIO) */
-
-#ifdef CONFIG_PPC_DCR_NATIVE
 DEFINE_SPINLOCK(dcr_ind_lock);
 EXPORT_SYMBOL_GPL(dcr_ind_lock);
-#endif	/* defined(CONFIG_PPC_DCR_NATIVE) */
-
-- 
2.47.1


