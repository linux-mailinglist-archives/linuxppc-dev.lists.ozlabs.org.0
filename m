Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877A757C79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:01:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cjNGC6n0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zbG0Sccz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:00:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cjNGC6n0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zYZ71lqz30YW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F11CC6156E;
	Tue, 18 Jul 2023 12:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C77C433C7;
	Tue, 18 Jul 2023 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685167;
	bh=oU3njfkwyQcLUTNStlO3v1g92OOq3MI+JFNfnGQ7rWU=;
	h=From:To:Cc:Subject:Date:From;
	b=cjNGC6n0Lacvu32Av8BjPOj2sVHcmbn3b5C1j1cIqMYcw5AKSbq127bwEDURXEFnI
	 1RzGblo+Ckqo8sU61AuVnpm/vSRCI9fx6Tl4pGO5C3aykVbeez63VZ35UD7gTc2+Yz
	 0O8ijaCN1hiZ5VE8p5G2S/GK2z4GCyD+HJJ4NFGBRqfrTFEVnYmnzfVqvONti7enoY
	 dxrJdTEVPVBuDYXeBMQDTHwsiansN18Pd5F8MOH9bQt6vKXjB7x8sNJq2/1WBNOO0L
	 T2kmWzS4s/j0mcN9oKBJHplaQD/1M7Nzb/yUJXu1BH2ftnqIDL5KwYKB334Xe1JbVY
	 sCBbLS5ESfhkg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 00/21] crypto: consolidate and clean up compression APIs
Date: Tue, 18 Jul 2023 14:58:26 +0200
Message-Id: <20230718125847.3869700-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7841; i=ardb@kernel.org; h=from:subject; bh=oU3njfkwyQcLUTNStlO3v1g92OOq3MI+JFNfnGQ7rWU=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT05tieP81WwrPyjIKzjVPPPfGRHTIPqvqdtgrV280 HNnoesdJSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKLFjP8eH15qtDcQlPFNpVi DbF19Sd2ZP9yP3cpdv7LrQW6f7eFM/xTemyzcX69C4tV2YxNE2zeblIzPyh7w/pr43X9dVWp2xs ZAQ==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is presented as an RFC, because I haven't quite convinced
myself that the acomp API really needs both scatterlists and request
objects to encapsulate the in- and output buffers, and perhaps there are
more drastic simplifications that we might consider.

However, the current situation with comp, scomp and acomp APIs is
definitely something that needs cleaning up, and so I implemented this
series under the working assumption that we will keep the current acomp
semantics wrt scatterlists and request objects.

Patch #1 drops zlib-deflate support in software, along with the test
cases we have for it. This has no users and should have never been
added.

Patch #2 removes the support for on-the-fly allocation of destination
buffers and scatterlists from the Intel QAT driver. This is never used,
and not even implemented by all drivers (the HiSilicon ZIP driver does
not support it). The diffstat of this patch makes a good case why the
caller should be in charge of allocating the memory, not the driver.

Patch #3 removes this on-the-fly allocation from the core acomp API.

Patch #4 does a minimal conversion of IPcomp to the acomp API.

Patch #5 and #6 are independent UBIFS fixes for things I ran into while
working on patch #7.

Patch #7 converts UBIFS to the acomp API.

Patch #8 converts the zram block driver to the acomp API.

Patches #9 to #19 remove the existing 'comp' API implementations as well
as the core plumbing, now that all clients of the API have been
converted. (Note that pstore stopped using the 'comp' API as well, but
these changes are already queued elsewhere)

Patch #20 converts the generic deflate compression driver to the acomp
API, so that it can natively operate on discontiguous buffers, rather
than requiring scratch buffers. This is the only IPcomp compression
algorithm we actually implement in software in the kernel, and this
conversion could help IPcomp if we decide to convert it further, and
remove the code that 'linearizes' SKBs in order to present them to the
compression API as a contiguous range.

Patch #21 converts the acomp-to-scomp adaptation layer so it no longer
requires per-CPU scratch buffers. This takes advantage of the fact that
all existing users of the acomp API pass contiguous memory regions, and
so scratch buffers are only needed in exceptional cases, and can be
allocated and deallocated on the fly. This removes the need for
preallocated per-CPU scratch buffers that can easily add up to tens of
megabytes on modern systems with high core counts and SMT.

These changes have been build tested and only lightly runtime tested. In
particular, I haven't performed any thorough testing on the acomp
conversions of IPcomp, UBIFS and ZRAM. Any hints on which respective
methods and test cases to use here are highly appreciated.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Haren Myneni <haren@us.ibm.com>
Cc: Nick Terrell <terrelln@fb.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: qat-linux@intel.com
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mtd@lists.infradead.org
Cc: netdev@vger.kernel.org

Ard Biesheuvel (21):
  crypto: scomp - Revert "add support for deflate rfc1950 (zlib)"
  crypto: qat - Drop support for allocating destination buffers
  crypto: acompress - Drop destination scatterlist allocation feature
  net: ipcomp: Migrate to acomp API from deprecated comp API
  ubifs: Pass worst-case buffer size to compression routines
  ubifs: Avoid allocating buffer space unnecessarily
  ubifs: Migrate to acomp compression API
  zram: Migrate to acomp compression API
  crypto: nx - Migrate to scomp API
  crypto: 842 - drop obsolete 'comp' implementation
  crypto: deflate - drop obsolete 'comp' implementation
  crypto: lz4 - drop obsolete 'comp' implementation
  crypto: lz4hc - drop obsolete 'comp' implementation
  crypto: lzo-rle - drop obsolete 'comp' implementation
  crypto: lzo - drop obsolete 'comp' implementation
  crypto: zstd - drop obsolete 'comp' implementation
  crypto: cavium/zip - drop obsolete 'comp' implementation
  crypto: compress_null - drop obsolete 'comp' implementation
  crypto: remove obsolete 'comp' compression API
  crypto: deflate - implement acomp API directly
  crypto: scompress - Drop the use of per-cpu scratch buffers

 Documentation/crypto/architecture.rst               |   2 -
 crypto/842.c                                        |  63 +---
 crypto/Makefile                                     |   2 +-
 crypto/acompress.c                                  |   6 -
 crypto/api.c                                        |   4 -
 crypto/compress.c                                   |  32 --
 crypto/crypto_null.c                                |  31 +-
 crypto/crypto_user_base.c                           |  16 -
 crypto/crypto_user_stat.c                           |   4 -
 crypto/deflate.c                                    | 386 ++++++--------------
 crypto/lz4.c                                        |  61 +---
 crypto/lz4hc.c                                      |  63 +---
 crypto/lzo-rle.c                                    |  60 +--
 crypto/lzo.c                                        |  60 +--
 crypto/proc.c                                       |   3 -
 crypto/scompress.c                                  | 169 ++++-----
 crypto/testmgr.c                                    | 184 +---------
 crypto/testmgr.h                                    |  75 ----
 crypto/zstd.c                                       |  56 +--
 drivers/block/zram/zcomp.c                          |  67 +++-
 drivers/block/zram/zcomp.h                          |   7 +-
 drivers/block/zram/zram_drv.c                       |  12 +-
 drivers/crypto/cavium/zip/zip_crypto.c              |  40 --
 drivers/crypto/cavium/zip/zip_crypto.h              |  10 -
 drivers/crypto/cavium/zip/zip_main.c                |  50 +--
 drivers/crypto/intel/qat/qat_common/qat_bl.c        | 159 --------
 drivers/crypto/intel/qat/qat_common/qat_bl.h        |   6 -
 drivers/crypto/intel/qat/qat_common/qat_comp_algs.c |  86 +----
 drivers/crypto/intel/qat/qat_common/qat_comp_req.h  |  10 -
 drivers/crypto/nx/nx-842.c                          |  34 +-
 drivers/crypto/nx/nx-842.h                          |  14 +-
 drivers/crypto/nx/nx-common-powernv.c               |  30 +-
 drivers/crypto/nx/nx-common-pseries.c               |  32 +-
 fs/ubifs/compress.c                                 |  61 +++-
 fs/ubifs/file.c                                     |  46 +--
 fs/ubifs/journal.c                                  |  33 +-
 fs/ubifs/ubifs.h                                    |  15 +-
 include/crypto/acompress.h                          |  21 +-
 include/crypto/internal/scompress.h                 |   2 -
 include/crypto/scatterwalk.h                        |   2 +-
 include/linux/crypto.h                              |  49 +--
 include/net/ipcomp.h                                |   4 +-
 net/xfrm/xfrm_algo.c                                |   7 +-
 net/xfrm/xfrm_ipcomp.c                              | 107 ++++--
 44 files changed, 502 insertions(+), 1679 deletions(-)
 delete mode 100644 crypto/compress.c

-- 
2.39.2

