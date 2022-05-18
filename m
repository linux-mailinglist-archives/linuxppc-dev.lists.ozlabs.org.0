Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAEE52B69D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L37zN5B2bz3dpL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:10:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Vzb0X3AS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37wt2GN3z3bwr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:08:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Vzb0X3AS; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L37ws3W8Tz4xbP; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L37ws3QT8z4xVP; Wed, 18 May 2022 20:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652868509;
 bh=0y/CsNgHYNPNSLEUxoH5VBFJEOQxxlCgSaFEdcA0DjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vzb0X3ASEW2/VkUMbHcdMvePK+RhmBpgMGaYb7hekeNJ/hJCRkBnOEvpnBF5Y7IEQ
 C9e20MPwfLNUFQ7X4tnyW7Zhwb7XLvK7oH2vzoILPqEpNEbOHgVD+k6PxG60UGL+nR
 hE7WRUFaaOcCtWk5rsLGPOmlRp9Drfm4AvetEqfCcBk08tle8X8ak+XyN0uKEUFn5d
 Ym0NGGD++Cih9QwwHuncVlwYVQDU3eWc+yQbIOD83TssEW+vhbHcjAvWUyumOMrFpJ
 +pk37sAxmn0gBk1orAKf9bMDJ6w3Engi/KqlJsVG++DZZM+0EoS0zIJeHn6NCjLD5X
 7Gi8em9FYuBSw==
Date: Wed, 18 May 2022 20:07:46 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 6/6] Documentation/kasan: Update details of KASAN on powerpc
Message-ID: <YoTFctxWJIkI9yGy@cleo>
References: <YoTEb2BaH3MDkH+2@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 Documentation/dev-tools/kasan.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 8089c559d339..448995c11bee 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -36,7 +36,9 @@ Both software KASAN modes work with SLUB and SLAB memory allocators,
 while the hardware tag-based KASAN currently only supports SLUB.
 
 Currently, generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390,
-and riscv architectures, and tag-based KASAN modes are supported only for arm64.
+and riscv architectures. It is also supported on powerpc for 32-bit kernels and
+for 64-bit kernels running under the Radix MMU. Tag-based KASAN modes are
+supported only for arm64.
 
 Usage
 -----
@@ -351,6 +353,9 @@ With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
 cost of greater memory usage. Currently, this is supported on x86,
 riscv, s390, and powerpc.
 
+It is optional, except on 64-bit powerpc kernels, and on 32-bit
+powerpc kernels with module support, where it is required.
+
 This works by hooking into vmalloc and vmap and dynamically
 allocating real shadow memory to back the mappings.
 
-- 
2.35.3

