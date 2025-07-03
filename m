Return-Path: <linuxppc-dev+bounces-10080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B67AF7F1F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 19:39:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bY3tD1yYmz2yPd;
	Fri,  4 Jul 2025 03:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751564372;
	cv=none; b=UBHPrnoXTxaQgIho7fXuQyrc9M1CN6pllZz8mc6DfMqbxvimao6JlhlovHwpox0nMjvEhoXAuuqVR8w4ub8tW0YmBgcwp2SMedbAF6mYw89SuRzxCsejwo5q5bRKfnRy453yGjH7z+WTM/kurrGOzwgncGSIK1u9KDo4GN+T3xvw2tRlzZItFoFm7gRYxWXqB1OmfwRmMcgEybbzgmc1eHOv//O02J7mygVEEg+ro6GbGwnvpqRAxG4qUMeE4ND1q8YVYlZ8zUOvZqGsF6tdYwryPTdKIix4pXa51e8XLCPncrZhQqDvuhNHtbqhJ9fn0mqjiu6Gmjej5TaGWDvdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751564372; c=relaxed/relaxed;
	bh=BA/9Pe8XZQ/jID49Te+dgUeGLEGFsQ/bzJ60aah+lV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVbUQ5Aaz+fGbv+UOM30mObAWuRNTfNQ4akbp07BQiVoajRxdyvzKqyLLh1sbnlObn9bJwyU0kQwWZ5LFYeqbHzjoczxn1+kED31EaQwuBkFPag9JiShNJSbqIzC6tg2Sn/3cQ1yeBWNa1+17iIPN+SP/lkCY6hPKFea+1BHxOh6GzOLoyyY8cGzVs1IXJASC3hSCaTFprKFvjsNIrNF7Ag1Q8cSRXIQZgMZXnMSMkAa+235CuZlalnSWfWJuZ0LX7jhiEtD9R5o4LklXQs7PAePgNpNxpTQrxZSlmZXj0bnOl+MbEjnPFUxbuakzKk8J9XOO6mJZmO6sJ7a5NzaIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0dZv+fn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0dZv+fn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bY3tC25FJz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 03:39:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 581475C4D09;
	Thu,  3 Jul 2025 17:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728FC4CEEE;
	Thu,  3 Jul 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751564369;
	bh=CjXapFJRn6jr02iNiY/fdYyplTrLIb9R/H97pjZWheY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0dZv+fn7ZOGn/n+ubYI9NUTtwxmvb9diBgsUdEhHae7Zutp0YZ/+WA2QVDvdceiE
	 O7nTHh2055ZVNVomkVuKLY51txoTK4sQYkxGKJLuNGWjgzMCqLrTSI5Zrmre6E3N9d
	 fCqJIJIrxGQVxECwKzwOsl0MmJKaXvuoOJBu7JvuajS+a7E5T7s6Jw4u0HPzn2fuBc
	 54A/tyxdEBU9TN8TDN+tWrXb6uTuzTklHPasl0pvtNY3Cpy1Z6/shg/mObJA41LApq
	 X+dBhsWzfe+qFZKn+tPjo/AztvrCYwi/805NTK1OeGQuHpPC0XEgAeQNLWLO7L2VOg
	 LRPocxpDJ4F5w==
Date: Thu, 3 Jul 2025 10:38:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/14] SHA-256 library improvements
Message-ID: <20250703173847.GB2284@sol>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 30, 2025 at 09:06:31AM -0700, Eric Biggers wrote:
> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
> 
> This series improves the SHA-224 and SHA-256 library code to be
> consistent with what I did for SHA-384 and SHA-512.  This includes:
> 
> - Use stronger typing in the SHA-224 and SHA-256 functions.
> 
> - Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
>   patch with KUnit test cases for this.)
> 
> - Make the old-school crypto API's support for sha224 and sha256 just
>   use the actual library API, instead of unsafe low-level functions.
> 
> - Consolidate the CPU-based SHA-224 and SHA-256 code into a single
>   module, with better inlining and dead code elimination.
> 
> - Properly document the SHA-224 and SHA-256 functions.
> 
> - Other changes to synchronize the code with SHA-384 and SHA-512.
> 
> Changed in v2:
> - Dropped sha224_kunit.c changes; it will be added later in the history
> - Dropped some patches that I folded into the SHA-512 series
> - Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
> - Removed obsolete setting of -DARCH for sha256.o
> - Fixed a commit title to mention sha256 instead of sha512
> - Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed
> 
> Eric Biggers (14):
>   libceph: Rename hmac_sha256() to ceph_hmac_sha256()
>   cxl/test: Simplify fw_buf_checksum_show()
>   lib/crypto: sha256: Reorder some code
>   lib/crypto: sha256: Remove sha256_blocks_simd()
>   lib/crypto: sha256: Add sha224() and sha224_update()
>   lib/crypto: sha256: Make library API use strongly-typed contexts
>   lib/crypto: sha256: Propagate sha256_block_state type to
>     implementations
>   lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
>   crypto: sha256 - Wrap library and add HMAC support
>   crypto: sha256 - Use same state format as legacy drivers
>   lib/crypto: sha256: Remove sha256_is_arch_optimized()
>   lib/crypto: sha256: Consolidate into single module
>   lib/crypto: sha256: Sync sha256_update() with sha512_update()
>   lib/crypto: sha256: Document the SHA-224 and SHA-256 API

FYI, applied to libcrypto-next.  Reviews and acks would be greatly appreciated,
though!

To fix https://lore.kernel.org/r/202507010837.ERX7aWw7-lkp@intel.com/
I applied the following fixup to
"lib/crypto: sha256: Propagate sha256_block_state type to implementations".

diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..55f42403d572a 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -26,7 +26,8 @@
  */
 #define MAX_BYTES 1024
 
-extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
+extern void ppc_spe_sha256_transform(struct sha256_block_state *state,
+				     const u8 *src, u32 blocks);
 
 static void spe_begin(void)
 {

