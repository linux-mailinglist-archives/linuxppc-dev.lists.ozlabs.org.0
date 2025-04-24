Return-Path: <linuxppc-dev+bounces-7950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46DAA99CD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBf2nHgz3byt;
	Thu, 24 Apr 2025 10:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454186;
	cv=none; b=KQjZ42hkCHCW+iVJcfxpoxuW6Z1BmJpf5xzD1FY2YgHqvQFi8dNYPZoevyZU3uWb9VeuNcXiJ1FQtrSMfsYOstdAc92UiuSkNe+umtwGl/vVSUOz5KTZGaWHjN2VNLYOJrJ4ygmLQwlojMvNdrDlPW/v9pBmRpDs7fKq1B+e02UMNFJkHijIEQU+56f1QWVBPHb9bLRIghwFzGakY3tOQSX1eMqrBKGlOCEqnF1Ss+bKrEHLdTvdnfYlMYYpvtV346GjYHhQZ+wRA1kW3atk4lqLlqcU8lMNWOXtncZMF0l5b/YjpcbWaAhwXtoD5+9pmyiyLAGJRMp2nZfQl4uw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454186; c=relaxed/relaxed;
	bh=r5HA6vTPIAExrshpJRpmOnHG9iQpeFKL/ljG+c8yMR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCJGjZsVN/1TvMKfaXR+Ppv9KaOqG5ZqNOm6V6+KwH1zqBLEyXVpLUhO2HAybbFipOD7qRpa/5L+4YW8Nw+TptscMP1R7eSv96xaRjKpLQCtbu/sx/poFvotEG2Iz+Prc6X2i1bgWCBvcjOPKgXIP0mVzYCe/E9fiwHaLowZcxxx181qoSskv/1yQ19hbMbE++qiIw692/uwSAS1H+cgUn626HuX5NQ87FGse56mNMEG8pGCsD3bTUVhxss5qu19G1nt9YczyqHsMGjVofBJZh/v9EbuxSyCosvJJ04ofO8fLaH/bT8BZEwACRQBdK6xolEsl6CmRpGdpEKao3y+hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FGtI6i60; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FGtI6i60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBZ62h5z3bn1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7620368454;
	Thu, 24 Apr 2025 00:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA2FC4CEEA;
	Thu, 24 Apr 2025 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454177;
	bh=f6qY7h7/z9HFPXtJ7uW93vPk+oRSFTdF1XATrLujF94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGtI6i60jfi/bxvrBjyZrkl3TkhvNSEysxPTGOz6UaGM8gmkSGMzhgzvxG6cSkx4I
	 IER76oYErtjvm57HPR+kvW4xbDJY3gBBtmDAx3GbteOA3X5bCfJxtdP4oWnIZg35eb
	 ovQ/1UKOZtrxFP2oaMWLLDIslp1XyosmGQAIniINOznzhAYu0wZVXys0xwjT8MpXdy
	 Xdx5pA713zOdUR53LMD0F1zwNlgTgL3FxLkHZftpvofB3xxaT0ftBfE4rME11I7H5n
	 6Kw8/d9POrLBi/0pSDx7/rhvpLc1AerJedNLcZgzxHya15q4HPa0TOx+9SfRxzrYO/
	 58NCLhKBn8IdQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 1/7] arm/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:32 -0700
Message-ID: <20250424002038.179114-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/Makefile                            | 4 ++--
 arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/arm/lib/{crc32-glue.c => crc32.c}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/arm/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 007874320937d..d05dd672bcd9c 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -45,9 +45,9 @@ ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
 endif
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm.o
-crc32-arm-y := crc32-glue.o crc32-core.o
+crc32-arm-y := crc32.o crc32-core.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm.o
-crc-t10dif-arm-y := crc-t10dif-glue.o crc-t10dif-core.o
+crc-t10dif-arm-y := crc-t10dif.o crc-t10dif-core.o
diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif.c
similarity index 100%
rename from arch/arm/lib/crc-t10dif-glue.c
rename to arch/arm/lib/crc-t10dif.c
diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32.c
similarity index 100%
rename from arch/arm/lib/crc32-glue.c
rename to arch/arm/lib/crc32.c
-- 
2.49.0


