Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7885F8B32
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 14:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlhCX5K5Pz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 23:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.20; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 5405 seconds by postgrey-1.36 at boromir; Sun, 09 Oct 2022 23:27:37 AEDT
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlhBx6YCGz2yxw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 23:27:34 +1100 (AEDT)
Received: from pop-os.home ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id hTsWoW2X5OizNhTsWoCyhu; Sun, 09 Oct 2022 12:49:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Oct 2022 12:49:54 +0200
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/sysdev: Remove some duplicate prefix in some messages
Date: Sun,  9 Oct 2022 12:49:50 +0200
Message-Id: <7b8b5915a2c7c1616b33e8433ebe0a0bf07070a2.1665312579.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the beginning of the file, we have:
   #define pr_fmt(fmt) "xive: " fmt

So, there is no need to duplicate "XIVE:" in debug and error messages.

For the records, these useless prefix have been added in commit
5af50993850a ("KVM: PPC: Book3S HV: Native usage of the XIVE interrupt
controller")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/sysdev/xive/native.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 3925825954bc..19d880ebc5e6 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -535,13 +535,13 @@ static bool __init xive_parse_provisioning(struct device_node *np)
 static void __init xive_native_setup_pools(void)
 {
 	/* Allocate a pool big enough */
-	pr_debug("XIVE: Allocating VP block for pool size %u\n", nr_cpu_ids);
+	pr_debug("Allocating VP block for pool size %u\n", nr_cpu_ids);
 
 	xive_pool_vps = xive_native_alloc_vp_block(nr_cpu_ids);
 	if (WARN_ON(xive_pool_vps == XIVE_INVALID_VP))
-		pr_err("XIVE: Failed to allocate pool VP, KVM might not function\n");
+		pr_err("Failed to allocate pool VP, KVM might not function\n");
 
-	pr_debug("XIVE: Pool VPs allocated at 0x%x for %u max CPUs\n",
+	pr_debug("Pool VPs allocated at 0x%x for %u max CPUs\n",
 		 xive_pool_vps, nr_cpu_ids);
 }
 
-- 
2.34.1

