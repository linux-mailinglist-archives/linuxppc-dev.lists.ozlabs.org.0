Return-Path: <linuxppc-dev+bounces-7948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B5A99CD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBd4kbXz3bsY;
	Thu, 24 Apr 2025 10:23:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454185;
	cv=none; b=YbV5rJNG06nV7IXa5q53DAqCh3lx7lOLuCEvyLKB8dgj0vy09M9ZTtvB0HT6gogVNCOxJo0EgaVL5mzffZ1kWz9bxvhUx0PY7Ek6Y4pGEk+D2up8eiqOFejkZaTh57nZYsK6+V8+I22W959paJVwzhxhFWR7m6efSIsztZWoKMsT7JUTZs0ltGqO3R/8ye0iEYR0fP3esN1ua7B6GcFL/XqIg29e05yUq1JMOVbR2Q6fq6dQRVKAjZEmbK3njkEovd27WMfxe+lwEY+jQ+P4s+xIhGL7MXRvjSyQDbAcCffyllnCJho4a4Y7i7w98ir41qtHD2ZfArFA6yBoqy4PtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454185; c=relaxed/relaxed;
	bh=ZbWcMivrKMDK7TfrA20Mqe4AAo8+D5ZysqfxvmmnRek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaY4QQSju4Y2f7QQQaUacpL4PIye/NvsNuyKvOvwYyBBFCC5gsfJySxPBesVxsk31yENezJ044ieVYkrrFV3lGMiYJj4fQi+Ed9wdLfx1JBNIlo/b2rcxAiL99Hn4NX+JU+hGbSaan3sRsO+vXuqu4uURtZ5p4Sw77sBf0jI9rVTmBhNqzv29CiGFrcFDuNT4UiSF6tjOVsxGxEZKKY0DxhDSusPVKJbEdiK1o6Uct5ZdcPGvJIa7wbLXT83YuS0TEylDOSq/EFC+F5mT43kGODohTo/+lE8hV1HMltkdtv3cOAjONnUiPOq2Y82Kj6hLwxIpYbEE3cl3jzzRyHuVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o2B0dh/D; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o2B0dh/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBZ57Sdz3bcW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7406368461;
	Thu, 24 Apr 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E19C4CEF0;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454178;
	bh=rccSS05ssS2rf46bfeneK2x/JfdC1a/pj9EmN7hGOls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2B0dh/DG8edBPHhL47uq8g33ExepNWr6h3LPHIZCuKmntMSr/mh8xBGoaCzeCIYz
	 ss0X/+nCSNljZQuvdx+/pPkkezIyuP5LflGCrevm+LNGeVaMyD2Bg6p2Da+9UM9Mx4
	 KIMbFYDHf8G5Up1Y78RwbPpfddi8F6XU3lykN13xvuYUnJupXwxOl1nMQA3Dp51vP7
	 iH3kpAnJrUwX3mmdSdb+ZbQQkvzajKh+TbEXfG5Fs3gexCvVC8F/d9Sg29inCjkDwM
	 EDPcg2qEEExXt3Dh3Gp/NMUGs3fC3hGtzesBe0Ebszy0b8o2TkzOhyB5MydePYwlG7
	 0/PFol/maj0BA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 4/7] powerpc/crc: rename crc32-vpmsum_core.S to crc-vpmsum-template.S
Date: Wed, 23 Apr 2025 17:20:35 -0700
Message-ID: <20250424002038.179114-5-ebiggers@kernel.org>
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

Rename crc32-vpmsum_core.S to crc-vpmsum-template.S to properly convey
that (a) it actually generates code for both 32-bit and 16-bit CRCs, not
just 32-bit CRCs; and (b) it has "template" semantics, like x86's
crc-pclmul-template.S, in the sense that it's included by other files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} | 0
 arch/powerpc/lib/crc32c-vpmsum_asm.S                            | 2 +-
 arch/powerpc/lib/crct10dif-vpmsum_asm.S                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} (100%)

diff --git a/arch/powerpc/lib/crc32-vpmsum_core.S b/arch/powerpc/lib/crc-vpmsum-template.S
similarity index 100%
rename from arch/powerpc/lib/crc32-vpmsum_core.S
rename to arch/powerpc/lib/crc-vpmsum-template.S
diff --git a/arch/powerpc/lib/crc32c-vpmsum_asm.S b/arch/powerpc/lib/crc32c-vpmsum_asm.S
index bf442004ea1f2..1b35c55cce0a6 100644
--- a/arch/powerpc/lib/crc32c-vpmsum_asm.S
+++ b/arch/powerpc/lib/crc32c-vpmsum_asm.S
@@ -837,6 +837,6 @@
 	/* 33 bit reflected Barrett constant n */
 	.octa 0x00000000000000000000000105ec76f1
 
 #define CRC_FUNCTION_NAME __crc32c_vpmsum
 #define REFLECT
-#include "crc32-vpmsum_core.S"
+#include "crc-vpmsum-template.S"
diff --git a/arch/powerpc/lib/crct10dif-vpmsum_asm.S b/arch/powerpc/lib/crct10dif-vpmsum_asm.S
index f0b93a0fe168a..47a6266d89a8a 100644
--- a/arch/powerpc/lib/crct10dif-vpmsum_asm.S
+++ b/arch/powerpc/lib/crct10dif-vpmsum_asm.S
@@ -840,6 +840,6 @@
 	.octa 0x000000000000000000000001f65a57f8	/* x^64 div p(x) */
 	/* Barrett constant n */
 	.octa 0x0000000000000000000000018bb70000
 
 #define CRC_FUNCTION_NAME __crct10dif_vpmsum
-#include "crc32-vpmsum_core.S"
+#include "crc-vpmsum-template.S"
-- 
2.49.0


