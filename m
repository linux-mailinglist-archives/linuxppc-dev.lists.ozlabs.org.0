Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD64522D58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KymkM60V5z3c8y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=tbKoqj43;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kymjn1D4Kz3bqC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=tbKoqj43; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kymjn0tL0z4xR7; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4Kymjn0nXhz4xXS; Wed, 11 May 2022 17:28:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652254125;
 bh=v7UTPPJVguw8YKtY6A0Dpw0NspyzUp9jtjt3v+Jo7+c=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=tbKoqj43n+pXyBdSxZ8BGlIxsJeYh5S7cSgFl3QhdnXM+5FqwQuswapPZU1IziFvx
 C94+w0kvnv1YTedmWYuxfbcinf0mPN/YhwwelUOAtHxp3YadA0PKgiAkTfDl4WQw//
 Wx+J6zSIlICYXbP8FKBvhGzCa81jB3O19N0dgQXSe1I0K6axEmEYlhW72pCfBQ3ecx
 mCVdLAKK+tcynw5BAZlfA/YCTnHD/VnTBHa5GDHA3x+O5QbsgfinnGSo6mq2B/cRwr
 2zdModI/ItlODBtMZzdMbQmqwMuMtLMCyOU6ft3LxBTXgpYWyxfHXLNZlU5D1fJ7B+
 hQbDDbBNzTV/g==
Date: Wed, 11 May 2022 17:26:30 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/3] kasan: Document support on 32-bit powerpc
Message-ID: <YntlJmKGkibTZW2l@cleo>
References: <Yntk7oERGce44+Sd@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yntk7oERGce44+Sd@cleo>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

KASAN is supported on 32-bit powerpc and the docs should reflect this.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 Documentation/dev-tools/kasan.rst |  8 ++++++--
 Documentation/powerpc/kasan.txt   | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 8089c559d339..8e5cd26d59cb 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -36,7 +36,8 @@ Both software KASAN modes work with SLUB and SLAB memory allocators,
 while the hardware tag-based KASAN currently only supports SLUB.
 
 Currently, generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390,
-and riscv architectures, and tag-based KASAN modes are supported only for arm64.
+and riscv architectures. It is also supported on 32-bit powerpc kernels.
+Tag-based KASAN modes are supported only for arm64.
 
 Usage
 -----
@@ -349,7 +350,10 @@ CONFIG_KASAN_VMALLOC
 
 With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
 cost of greater memory usage. Currently, this is supported on x86,
-riscv, s390, and powerpc.
+riscv, s390, and 32-bit powerpc.
+
+It is optional, except on 32-bit powerpc kernels with module support,
+where it is required.
 
 This works by hooking into vmalloc and vmap and dynamically
 allocating real shadow memory to back the mappings.
diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
new file mode 100644
index 000000000000..26bb0e8bb18c
--- /dev/null
+++ b/Documentation/powerpc/kasan.txt
@@ -0,0 +1,12 @@
+KASAN is supported on powerpc on 32-bit only.
+
+32 bit support
+==============
+
+KASAN is supported on both hash and nohash MMUs on 32-bit.
+
+The shadow area sits at the top of the kernel virtual memory space above the
+fixmap area and occupies one eighth of the total kernel virtual memory space.
+
+Instrumentation of the vmalloc area is optional, unless built with modules,
+in which case it is required.
-- 
2.35.3

