Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C8C143657
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:46:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wwK2cvJzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYy14PszDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pBRY+qFm; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYv0gVKz9sSV; Tue, 21 Jan 2020 15:30:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYt6LNXz9sP6; Tue, 21 Jan 2020 15:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581010;
 bh=GYDIQ6HPJMCD94E8gKjYzDNuG0sdrQXzLzX8H2mVRvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pBRY+qFm9mqlPs7WspwXryoSRPEtMCRMn1bXN/dxXWI4ih5oMn+D2eZguFO4Tlowr
 bzzAmtfh5MqvzHiXH+uGcSiHTRG1faMH/STVfUYX84QsjtHzgoakUYjEF9mWQl2IZd
 WqS7gEZqQ0STqFRfBabU6WRS0sQD/bv2K+4WUmSlfoX+YlCKcIlz9EmQ3LAtnOTHZ6
 TOmvYeU8eUU2sZv24bE4El5pcY3umCJQAk49Z+wAl5BxZ9jG9H2qDpPnfPUCMuT9Re
 +JVf/NBLUco7QwzmNjVkSQF816Z+7Q0NWIDGeT6P7yqFVTvERYgZOA4inGHoGrND69
 TYWADnVdgpNhw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 10/10] powerpc/configs/skiroot: Enable CONFIG_PRINTK_CALLER
Date: Tue, 21 Jan 2020 15:30:00 +1100
Message-Id: <20200121043000.16212-10-mpe@ellerman.id.au>
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

This adds the CPU or thread number to printk messages. This can help
decipher concurrent oopses that have been interleaved.

Example output, of PID1 (T1) triggering a warning:

  [    1.581678][    T1] WARNING: CPU: 0 PID: 1 at crypto/rsa-pkcs1pad.c:539 pkcs1pad_verify+0x38/0x140
  [    1.581681][    T1] Modules linked in:
  [    1.581693][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty #1515
  [    1.581700][    T1] NIP:  c000000000207d64 LR: c000000000207d3c CTR: c000000000207d2c
  [    1.581708][    T1] REGS: c0000000fd2e7560 TRAP: 0700   Not tainted  (5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty)
  [    1.581712][    T1] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44000222  XER: 00040000

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

v2: New.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index ca6f1842aa29..ae1d7137a84e 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -294,6 +294,7 @@ CONFIG_LIBCRC32C=y
 # CONFIG_XZ_DEC_ARMTHUMB is not set
 # CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
+CONFIG_PRINTK_CALLER=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_SLUB_DEBUG_ON=y
 CONFIG_SCHED_STACK_END_CHECK=y
-- 
2.21.1

