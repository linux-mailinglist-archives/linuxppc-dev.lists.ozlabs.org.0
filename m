Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065B14364D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:42:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wrM3XHSzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:42:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYt3JymzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QpzwKbqQ; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYs6sKwz9sP6; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYs5Ccsz9sRp; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581009;
 bh=EdB3r8nFo8QuDAgUcGaZb/3oe/3f3bCjyQbscJcIHpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QpzwKbqQO/acSTd6V6pjLPUj3xZ5VjIESJYwykALpsIBkCW5cMEM6Q66gJ1QyZ+mP
 6WvsbdASSk62Aw/xA4SDrLFVoc632U+1+idlpdUbMz3R49GzSYBR7zDkUVll7yc7bq
 Y71CWdzw/pwtA8bd/Bi255oUQaGXzUzhAKj14E1gX8znikiT+Chp3xNRqrpEipw7Ac
 AopwU2xtuEbDk/HE73/3QAdMhJSgUiWvHWg6xjuIyK4OGhrNb2ikk39fb06tPW2LpD
 RFVZ0EzlbFHwhJhBhCmtDbLsARkbiDf6PDNII5Ei84Gcv3+AtUBg+BL92RwZkCZl9i
 l/oK31GLDZwKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 08/10] powerpc/configs/skiroot: Disable xmon default &
 enable reboot on panic
Date: Tue, 21 Jan 2020 15:29:58 +1100
Message-Id: <20200121043000.16212-8-mpe@ellerman.id.au>
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

If the skiroot kernel crashes we don't want it sitting at an xmon
prompt forever. Instead it's more helpful to reboot and bring the
boot loader back up, and if the crash was transient we can then boot
successfully.

Similarly if we panic we should reboot, with a short timeout in case
someone is watching the console.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

v2: No change.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 93b478436a2b..28cfd68e8b16 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -29,6 +29,7 @@ CONFIG_ALTIVEC=y
 CONFIG_VSX=y
 CONFIG_NR_CPUS=2048
 CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_PANIC_TIMEOUT=30
 # CONFIG_PPC_VAS is not set
 # CONFIG_PPC_PSERIES is not set
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
@@ -293,6 +294,7 @@ CONFIG_LIBCRC32C=y
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_STACKOVERFLOW=y
+CONFIG_PANIC_ON_OOPS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
 CONFIG_HARDLOCKUP_DETECTOR=y
@@ -301,5 +303,4 @@ CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_XMON=y
-CONFIG_XMON_DEFAULT=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.21.1

