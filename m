Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BA143651
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:44:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wtQ4TcLzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:44:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYw211kzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=g2dUdUOS; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYt48mFz9sSK; Tue, 21 Jan 2020 15:30:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYt2R5Sz9sSQ; Tue, 21 Jan 2020 15:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581010;
 bh=nE3GlFhHFobjmuchXHmciD9pPMoPUMaIcfp/9GSfq9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2dUdUOSTwdmtzmgXme0a7S1m9lSo7Gupa8h4hpIhqmPu3aNmiqDPgRiGGCeovE1O
 awRYFC4q6zoU5NHCpADt0b6eDMGqglEM8TodfKXwhtQ09PuM5m4j5D0+f2VQLZ/pP4
 Ig3rPt/Ahj+8yRbJcj5A8VNt4XAS/qTMmQIgcUMPxb5kYo8ErHumEQsn5RoMkvQCZ7
 lHrmvU3OEgiG5SsiTmqPO49KOAtayMOUPp4WRHXe9kHrZhW4b5oKUb2zb/E3korMnp
 kWzcxluASikGuFVgSmCMlmnyEffd0pVQVsQLKIG1bAINTVuXVVwtfSyuzZ8W+bqMM0
 S1p+uCRhqwSlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 09/10] powerpc/configs/skiroot: Enable some more hardening
 options
Date: Tue, 21 Jan 2020 15:29:59 +1100
Message-Id: <20200121043000.16212-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121043000.16212-1-mpe@ellerman.id.au>
References: <20200121043000.16212-1-mpe@ellerman.id.au>
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable more hardening options.

Note BUG_ON_DATA_CORRUPTION selects DEBUG_LIST and is essentially just
a synonym for it.

DEBUG_SG, DEBUG_NOTIFIERS, DEBUG_LIST, DEBUG_CREDENTIALS and
SCHED_STACK_END_CHECK should all be low overhead and just add a few
extra checks.

SLAB_FREELIST_RANDOM, and SLUB_DEBUG_ON will add some overhead to the
SLAB allocator, but nothing that should be meaningful for skiroot.

Unselecting SLAB_MERGE_DEFAULT causes the SLAB to use more memory, but
the skiroot kernel shouldn't be memory constrained on any of our
systems, all it does is run a small bootloader.

Disabling merging has some security/robustness benefit as it means a
user-after-free or overflow will be limited to the objects in that
slab, rather than potentially affecting objects from unrelated slabs
that have been merged.

Note also that slab merging is disabled anyway by enabling
SLUB_DEBUG_ON, because of the SLAB_NEVER_MERGE mask.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

v2: Add more explanation about slab merging.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 28cfd68e8b16..ca6f1842aa29 100644
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

