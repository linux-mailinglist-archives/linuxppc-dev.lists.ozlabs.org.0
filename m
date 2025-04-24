Return-Path: <linuxppc-dev+bounces-7945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD19A99CC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:23:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBb4R8gz2yVV;
	Thu, 24 Apr 2025 10:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454183;
	cv=none; b=ch1b2ufaRrYuiArdNPI9hMu8xdQdZWbhTTLos7zqU/PDZnqPr1fyNDFxwT09nzk0Pwe8iK8/oNa7noq5bbSkZS4pYzUZz9/keub3uxFZYc22PpfpgOXNSiXqsyVLTIyzoxMa0/8oKLZ2+GuGYf1Ji4M31rU6VOH6GP8mpZU8RJfsHGmLfyAghOB/uNv04PnoO2BAVTL+rQE3qqxypvfR0a8uDfPJkCVoY9zJRw3woLJoRPbU/LTkjrm06YgygYvwDzyu4WSpBdodGQZrRmEVB6sEckwMDHeDlFJUxVRwUkpB8p9F33PTYH2jMGTpqMm0onprrOBh59UWxpTzj6N0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454183; c=relaxed/relaxed;
	bh=YOhunbJeWZvAeePiPw3xwCzd9xnHT/WhPCzv+Hlhj4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDSfpD43xpBQ4uB7ZZ67KkwMtHnAadV9M+qi0z6CYA/cG0ub6+Ln/aAZszCKGzRX5agOPm5sOaa8Izg89h4HbAp3O+VZYcwzNAqf2x3OkOEiUUVx6HKaasV0yexFANA4W8xslhZhWw5hLqZHE/sUkh/GUgER7JtXs1Qh/WnViL/uX673caU0FUmcwQk1SGaVMYyVSgqlolMA+d05/cgxqUkAFCKShp2Qq+FKnKBOonGCoBDO5eDGWGDbwfeMi+5CbeHf6HsWn42SfG1pb3O4HJbPazu/chKZcMjRF96sNVHASah5w0BBUE2Nl46G8f6q7gS26y/9jhC58C6dcofBLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0PKp1HX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0PKp1HX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBY3k1Qz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 330CF68463;
	Thu, 24 Apr 2025 00:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EE9C4CEED;
	Thu, 24 Apr 2025 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=D5NU9FcmxKmWEA4XREu5in+DNWt9OzzrzEJU/bEgaCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0PKp1HXIMY3OYdi0+QNxtbOKYvHDj+XNZMJxgb4MF3xoXe6ZeLHMKvvC4RZIH4qO
	 i0tZYXuMUm/aKFnMCifDJ/wwpNleHgIV1Krt4I9CKcqPodLMBXpV3eP7n8pXsK/Mo5
	 zOthyROTuyAqdflz4JtxNSzMN7JDq7D8AlG4vAUfudwlcthNpdpeWlaHLmDi33Kj4r
	 esMpwv9MLcyTyaOA2tyQG/ZzJHP/O11zZQwSpzAmqU/eveXzTAv387y9MiAmXhGlmz
	 LZ1FdafE124aAygI+K3XM7/X220w8EaFQiwxmQTWGBs/9WqQ4wO2h8UBUZkDSsLyrn
	 kEpPI/AJpkbXQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 6/7] sparc/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:37 -0700
Message-ID: <20250424002038.179114-7-ebiggers@kernel.org>
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
 arch/sparc/lib/Makefile                  | 2 +-
 arch/sparc/lib/{crc32_glue.c => crc32.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/sparc/lib/{crc32_glue.c => crc32.c} (97%)

diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5724d0f356eb5..ef8860eb3f3d1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -52,6 +52,6 @@ lib-$(CONFIG_SPARC64) += mcount.o ipcsum.o xor.o hweight.o ffs.o
 
 obj-$(CONFIG_SPARC64) += iomap.o
 obj-$(CONFIG_SPARC32) += atomic32.o
 obj-$(CONFIG_SPARC64) += PeeCeeI.o
 obj-$(CONFIG_CRC32_ARCH) += crc32-sparc.o
-crc32-sparc-y := crc32_glue.o crc32c_asm.o
+crc32-sparc-y := crc32.o crc32c_asm.o
diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32.c
similarity index 97%
rename from arch/sparc/lib/crc32_glue.c
rename to arch/sparc/lib/crc32.c
index d34e7cc7e1a1e..428fd5588e936 100644
--- a/arch/sparc/lib/crc32_glue.c
+++ b/arch/sparc/lib/crc32.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for CRC32C optimized for sparc64 crypto opcodes.
+/* CRC32c (Castagnoli), sparc64 crc32c opcode accelerated
  *
  * This is based largely upon arch/x86/crypto/crc32c-intel.c
  *
  * Copyright (C) 2008 Intel Corporation
  * Authors: Austin Zhang <austin_zhang@linux.intel.com>
-- 
2.49.0


