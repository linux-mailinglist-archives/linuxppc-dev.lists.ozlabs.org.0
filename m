Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26496871F45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:34:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W3uPlOIk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpw4b6Pmlz3ddR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W3uPlOIk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpw3t0Wqzz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 23:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709642055;
	bh=wLlAjoCQp5P2Bx1ku5X0zTZ17ysfF4SXWXTyF4L5VtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W3uPlOIkxIy5ZogNq4n0cZYeNVwztRc+8om9y9z1kU2mZq8rlY4+MvB3EYkYjpqqz
	 sAMOIS3SsMz2T5WwPqwInszE4mSY2Ec9lvqc9vL/779rJu5o0ipcMNqsGE3Sh+CTSM
	 FYaeK5TV2KhCJw1cNAvHJ8XOYn8u+b/dlUerYd3y2bAo0TgtbEd1CTHI1YD1O1bOfr
	 Aay3NWgvpACHBPdiHuNKJFgrtkd19pgA1jeavgXw01iQmGK5coNRTqGeVsyKsk6LZo
	 lqn6vBSsPeniFqgN8VD52qi6gsS+WBn22gJNvAzY7l6CDaCAyKCG6HdUf9aURaiV3z
	 nIJTZWfVUuwsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tpw3q4Xkzz4wyp;
	Tue,  5 Mar 2024 23:34:15 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/amigaone: Make several functions static
Date: Tue,  5 Mar 2024 23:34:09 +1100
Message-ID: <20240305123410.3306253-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305123410.3306253-1-mpe@ellerman.id.au>
References: <20240305123410.3306253-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions can all be static. Make them so. That also fixes no
previous prototype warnings:

  arch/powerpc/platforms/amigaone/setup.c:28:6: error: no previous prototype for 'amigaone_show_cpuinfo'
  arch/powerpc/platforms/amigaone/setup.c:68:13: error: no previous prototype for 'amigaone_setup_arch'
  arch/powerpc/platforms/amigaone/setup.c:86:13: error: no previous prototype for 'amigaone_init_IRQ'
  arch/powerpc/platforms/amigaone/setup.c:126:17: error: no previous prototype for 'amigaone_restart'

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/amigaone/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index 6c6e714a7521..2c8dc0886912 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -25,7 +25,7 @@
 
 extern void __flush_disable_L1(void);
 
-void amigaone_show_cpuinfo(struct seq_file *m)
+static void amigaone_show_cpuinfo(struct seq_file *m)
 {
 	seq_printf(m, "vendor\t\t: Eyetech Ltd.\n");
 }
@@ -65,7 +65,7 @@ static int __init amigaone_add_bridge(struct device_node *dev)
 	return 0;
 }
 
-void __init amigaone_setup_arch(void)
+static void __init amigaone_setup_arch(void)
 {
 	if (ppc_md.progress)
 		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
@@ -83,7 +83,7 @@ static void __init amigaone_discover_phbs(void)
 	BUG_ON(phb != 0);
 }
 
-void __init amigaone_init_IRQ(void)
+static void __init amigaone_init_IRQ(void)
 {
 	struct device_node *pic, *np = NULL;
 	const unsigned long *prop = NULL;
@@ -123,7 +123,7 @@ static int __init request_isa_regions(void)
 }
 machine_device_initcall(amigaone, request_isa_regions);
 
-void __noreturn amigaone_restart(char *cmd)
+static void __noreturn amigaone_restart(char *cmd)
 {
 	local_irq_disable();
 
-- 
2.43.2

