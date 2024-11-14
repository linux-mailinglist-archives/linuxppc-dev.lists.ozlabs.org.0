Return-Path: <linuxppc-dev+bounces-3204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9939C8B8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:12:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sZ6znrz30Kd;
	Fri, 15 Nov 2024 00:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589890;
	cv=none; b=bNFWA517jcStAASzKVMmRghZcZ81U02H+zF/PCpjkgn91hd0CVyGoEil1Ir12zkJ+WSL2muF6owj3SM5KPnPOVCEsLmwHBL8B7ESALH4La+e/bAwvhcZ9y56vPzm+8Iwzykh+5xI4VpfO1c3dsDuErPljFbiN/n7mH/Va8b6Pm9/Pt6zPL3S8uJozIe0KBvmqzqXDanE2+ukXNGlJxT7g5zqLqpClJEAQnfV1KS63xTTWmAZ5qOaZUzs/pGr21uPxT2AJw74pnTtXN+KkN9JH6sgSXRlAJ5XF4+opcRHOzc+YQick3l/r5VUkyQC/go97373PZup+qwQp4Kk2h8tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589890; c=relaxed/relaxed;
	bh=iKQ3hFaNj1tO8Sd5kK/B33uo0idb6gnoDTS3R6ggsjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPQQ/1f1iQWfXDkvV5gByh9xoxf1wWI8UFLLee8U0b1rADGOjGKMI/zwUysPvO1ZB9NlecHIIvhh3Ltqg0RUXZhUohbpDWSay2SJB1takEQevMKVlMwEFz8nLcPoBNIgulrF6svtjrguFdohzrPF9BUK+PoFbt2FyHjmz3zWd19MEuol3+zt8rEC+WfTyIcB1BSI7QgaeE3ntJzfVMow+eY4tL0eZVO+bd7XNuoE61nfhBBpqEPKRcduqKs0/lEUZfRy1jD8GOarbExI+zPUoqR2O4D1xFZeTnxpTN1vAk5cIB/TunhdmHPdF1+iqPWeRggiTfL1zh5vTXmVMnQLXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GcuLMt8q; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GcuLMt8q;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sZ1kHyz306x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589884;
	bh=iKQ3hFaNj1tO8Sd5kK/B33uo0idb6gnoDTS3R6ggsjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GcuLMt8q33FJ4E/hQygjJHhuuxmwIacc66hzuqQHcREYEbgobABlaAa7MR+0xyQaZ
	 96QopqKl2B94GAm9JxSfAK+RnA+AUE/hxTYT16lYMpmDmRfenR8OHgRZBVBGbGmWe1
	 8psvLci8I+5nbYulCLhxLTvn1x5WdNxN7FfNUVEs54cbZqkvRpOfKDsWPDRlmN33PS
	 656ejgFOSSDWVzxzsSgS98WaRKDGUDNduJvJdQzeJ23FLrS6z/Iy2Eq8w3e8xJbNwV
	 ty185Kad4eapmmLxmXE4EXBp04HCmZDktAwKYB0wzgS4rSWnkuVzZA9NLQWj6+6gX/
	 v6U4AoZM8f+Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sS4Hkqz4xD7;
	Fri, 15 Nov 2024 00:11:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 07/10] powerpc: Remove CONFIG_ISA
Date: Fri, 15 Nov 2024 00:11:10 +1100
Message-ID: <20241114131114.602234-7-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ISA support depended on PPC_CHRP which has now been removed, making
ISA unselectable, so remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig                  | 11 -----------
 arch/powerpc/configs/chrp32_defconfig |  1 -
 arch/powerpc/configs/ppc6xx_defconfig |  1 -
 3 files changed, 13 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f79e28f47dea..958e227a3cbf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1083,17 +1083,6 @@ config ISA_DMA_API
 
 menu "Bus options"
 
-config ISA
-	bool "Support for ISA-bus hardware"
-	depends on PPC_CHRP
-	select PPC_I8259
-	help
-	  Find out whether you have ISA slots on your motherboard.  ISA is the
-	  name of a bus system, i.e. the way the CPU talks to the other stuff
-	  inside your box.  If you have an Apple machine, say N here; if you
-	  have an IBM RS/6000 or pSeries machine, say Y.  If you have an
-	  embedded board, consult your board documentation.
-
 config GENERIC_ISA_DMA
 	bool
 	depends on ISA_DMA_API
diff --git a/arch/powerpc/configs/chrp32_defconfig b/arch/powerpc/configs/chrp32_defconfig
index fb314f75ad4b..88eae3fae0fb 100644
--- a/arch/powerpc/configs/chrp32_defconfig
+++ b/arch/powerpc/configs/chrp32_defconfig
@@ -20,7 +20,6 @@ CONFIG_GEN_RTC=y
 CONFIG_HIGHMEM=y
 CONFIG_BINFMT_MISC=y
 CONFIG_IRQ_ALL_CPUS=y
-CONFIG_ISA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index c06344db0eb3..350167bf6d00 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -66,7 +66,6 @@ CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BINFMT_MISC=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
-CONFIG_ISA=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_MSI=y
 CONFIG_PCCARD=y
-- 
2.47.0


