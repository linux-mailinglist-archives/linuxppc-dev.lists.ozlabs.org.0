Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4013D1DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:05:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynbb512mzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:05:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCG32b2zDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OeABgFqS; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCG1Nz6z9sR4; Thu, 16 Jan 2020 12:48:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCF6rxYz9sRW; Thu, 16 Jan 2020 12:48:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139289;
 bh=P0wNkA1RPcDiRu9JMlwXkQJa5eGaK3bgNZtxpPWbapM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OeABgFqSkMpkZ9AlC3engtQ7Uwpy2EqEEYYOKReAMKyzQ09HwASsqA0UJLyVMgAXY
 WZ12/1F8d2bvShprvwMl8f7vMw8kJWGxK83Hq8+P6SgHuYhtmqrCEbx1/uuDLW7UPj
 o2z1zHlyLp6ceBADsN0qjNel0qE8QUKyQRhRkpv+QzZHP8G070Z0OlQ4aLc5et9znR
 lQ5jznOVxBL4pUDU+OMPlDaptZqvhEeOrO7W/gPnqw2l8TUPFTjIfTa+yCOmhr5cWo
 VXMZ0IL55JVFPPlDD7C6AFRJazijBx/H/rveoEYOEaDF74AZYdChfkBZixOMJfS1tO
 pPIMBRQNTnt5w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 9/9] powerpc/configs/skiroot: Enable some more hardening
 options
Date: Thu, 16 Jan 2020 11:48:08 +1000
Message-Id: <20200116014808.15756-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116014808.15756-1-mpe@ellerman.id.au>
References: <20200116014808.15756-1-mpe@ellerman.id.au>
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
Cc: joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable more hardening options.

Note BUG_ON_DATA_CORRUPTION selects DEBUG_LIST and is essentially just
a synonym for it.

DEBUG_SG, DEBUG_NOTIFIERS, DEBUG_LIST, DEBUG_CREDENTIALS and
SCHED_STACK_END_CHECK should all be low overhead and just add a few
extra checks.

Unselecting SLAB_MERGE_DEFAULT causes the SLAB to use more memory, but
the skiroot kernel shouldn't be memory constrained on any of our
systems, all it does is run a small bootloader.

SLAB_FREELIST_RANDOM, and SLUB_DEBUG_ON will add some overhead to the
SLAB allocator, but nothing that should be meaningful for skiroot.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 12c96c8b0c1d..59c2de904fda 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -23,6 +23,8 @@ CONFIG_EXPERT=y
 # CONFIG_AIO is not set
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
 CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_PPC64=y
 CONFIG_ALTIVEC=y
@@ -293,6 +295,8 @@ CONFIG_LIBCRC32C=y
 # CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_SLUB_DEBUG_ON=y
+CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
@@ -301,6 +305,10 @@ CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
 CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
+CONFIG_DEBUG_SG=y
+CONFIG_DEBUG_NOTIFIERS=y
+CONFIG_BUG_ON_DATA_CORRUPTION=y
+CONFIG_DEBUG_CREDENTIALS=y
 # CONFIG_FTRACE is not set
 CONFIG_XMON=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.21.1

