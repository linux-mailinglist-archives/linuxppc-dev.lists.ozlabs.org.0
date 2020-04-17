Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2F1AD75D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:27:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493SN92kdDzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:27:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.18; helo=m17618.mail.qiye.163.com;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493S8r3R7vzDrVN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:17:32 +1000 (AEST)
Received: from ubuntu.localdomain (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 707D34E1A2C;
 Fri, 17 Apr 2020 15:17:02 +0800 (CST)
From: Wang Wenhu <wenhu.wang@vivo.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 oss@buserror.net, christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5,
 3/4] powerpc: sysdev: fix compile warning for fsl_85xx_cache_sram
Date: Fri, 17 Apr 2020 00:16:15 -0700
Message-Id: <20200417071616.44598-4-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417071616.44598-1-wenhu.wang@vivo.com>
References: <20200417071616.44598-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSVVPTEJLS0tLQkpOTklMSFlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P0k6Nhw*Gjg3Sw4yKQk8DiE4
 Mz9PCyxVSlVKTkNMSktMQ0lJQ09MVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTkpVTE9VSUlNWVdZCAFZQUlDQ0M3Bg++
X-HM-Tid: 0a7186ff7cad9376kuws707d34e1a2c
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
Cc: kernel@vivo.com, Wang Wenhu <wenhu.wang@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function instantiate_cache_sram should not be linked into the init
section for its caller mpc85xx_l2ctlr_of_probe is none-__init.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>

Warning information:
  MODPOST vmlinux.o
WARNING: modpost: vmlinux.o(.text+0x1e540): Section mismatch in reference from the function mpc85xx_l2ctlr_of_probe() to the function .init.text:instantiate_cache_sram()
The function mpc85xx_l2ctlr_of_probe() references
the function __init instantiate_cache_sram().
This is often because mpc85xx_l2ctlr_of_probe lacks a __init
annotation or the annotation of instantiate_cache_sram is wrong.
---
Changes since v1:
 * None
Changes since v2:
 * None
Changes since v3:
 * None
Changes since v4:
 * None
---
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
index be3aef4229d7..3de5ac8382c0 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
@@ -68,7 +68,7 @@ void mpc85xx_cache_sram_free(void *ptr)
 }
 EXPORT_SYMBOL(mpc85xx_cache_sram_free);
 
-int __init instantiate_cache_sram(struct platform_device *dev,
+int instantiate_cache_sram(struct platform_device *dev,
 		struct sram_parameters sram_params)
 {
 	int ret = 0;
-- 
2.17.1

