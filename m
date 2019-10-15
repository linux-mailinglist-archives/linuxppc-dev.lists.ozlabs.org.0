Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BED6D55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 04:52:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sg2t1bZdzDq8X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 13:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="MCzBL4Fp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sftd1RnWzDqv2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 13:45:44 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9824620673;
 Tue, 15 Oct 2019 02:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571107541;
 bh=f9P3u6hsFtkLi5QBoLm8rjSE7jsCU7aMKmz2VezgSTs=;
 h=From:To:Cc:Subject:Date:From;
 b=MCzBL4FpKgSGqTsvWG+HoUAhZSo42Eyh/yqcFn81sUNysWMN8woq1aFOBvDK0IYaI
 ASaC6h51Ortg4rUyR28gpZW0BkqS308his4n7VAAVdHVqWM96ez81h5su6BYQmAvMI
 ALubkXHg0ar+2dlVoW/mKb+YVB78Tvco8hRR1VaI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 0/3] crypto: powerpc - convert SPE AES algorithms to
 skcipher API
Date: Mon, 14 Oct 2019 19:45:14 -0700
Message-Id: <20191015024517.52790-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Markus Stockhausen <stockhausen@collogia.de>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts the glue code for the PowerPC SPE implementations
of AES-ECB, AES-CBC, AES-CTR, and AES-XTS from the deprecated
"blkcipher" API to the "skcipher" API.  This is needed in order for the
blkcipher API to be removed.

Patch 1-2 are fixes.  Patch 3 is the actual conversion.

Tested with:

	export ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-
	make mpc85xx_defconfig
	cat >> .config << EOF
	# CONFIG_MODULES is not set
	# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
	CONFIG_DEBUG_KERNEL=y
	CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
	CONFIG_CRYPTO_AES=y
	CONFIG_CRYPTO_CBC=y
	CONFIG_CRYPTO_CTR=y
	CONFIG_CRYPTO_ECB=y
	CONFIG_CRYPTO_XTS=y
	CONFIG_CRYPTO_AES_PPC_SPE=y
	EOF
	make olddefconfig
	make -j32
	qemu-system-ppc -M mpc8544ds -cpu e500 -nographic \
		-kernel arch/powerpc/boot/zImage \
		-append cryptomgr.fuzz_iterations=1000

Note that xts-ppc-spe still fails the comparison tests due to the lack
of ciphertext stealing support.  This is not addressed by this series.

Changed since v1:

- Split fixes into separate patches.

- Made ppc_aes_setkey_skcipher() call ppc_aes_setkey(), rather than
  creating a separate expand_key() function.  This keeps the code
  shorter.

Eric Biggers (3):
  crypto: powerpc - don't unnecessarily use atomic scatterwalk
  crypto: powerpc - don't set ivsize for AES-ECB
  crypto: powerpc - convert SPE AES algorithms to skcipher API

 arch/powerpc/crypto/aes-spe-glue.c | 389 ++++++++++++-----------------
 crypto/Kconfig                     |   1 +
 2 files changed, 166 insertions(+), 224 deletions(-)

-- 
2.23.0

