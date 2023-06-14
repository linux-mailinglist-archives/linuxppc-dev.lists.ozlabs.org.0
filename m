Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE537305DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 19:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhBvq6wngz3brc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 03:18:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.45; helo=mail-io1-f45.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhBvF5zXRz303p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 03:17:45 +1000 (AEST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-76c64da0e46so305592639f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 10:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686763062; x=1689355062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRPE1en485fgipWFHZePCu5grK9T3reUk/ZQQmM4jPI=;
        b=cJuRbT7sZEcdSLHGLWEA2pOSeVU9xhXBVPjS+FIaK3lwq4UcKMtPHrhBdRAXme3cx0
         76OKnXtQhiFpe54QcSU0MpTSgFMocND+lkt9Y5xnhPKJeboLKs5L/NexjETF1bqLLux6
         /wDELZnUo3r5sNhWxIX+3r0pGL1VK0g9bvTYs/+OxdP3Z0K0cSLzLOHjLFSiOgWQyEbK
         6Hy+zUWneb9JnB5WmNYMLQxACT27dDkvWpLFhEpbPXGgPeSMLQQIHMlssymRi2xSy2AM
         tnj+9OZ3vSClHYHv/xbdyFOkYVrGwTglz1u0ElfilQtWQSKArLKuwnPPQ7KwoxtKoQj2
         irdw==
X-Gm-Message-State: AC+VfDxDRtZmT2orNuoqRr2gNegs/dtPZOGrYyz2uByu+O1/+H/zuSLr
	480ZPBI/LpRkVMD7WifWgQ==
X-Google-Smtp-Source: ACHHUZ5A60A7vgjjtAmIlvkG1bo3D2NjQKXfldt7NImSW743rHOfA7n43Tp86e7opfaHS6dpIfLCpQ==
X-Received: by 2002:a5e:db0d:0:b0:77a:d862:242f with SMTP id q13-20020a5edb0d000000b0077ad862242fmr13623229iop.21.1686763062023;
        Wed, 14 Jun 2023 10:17:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w12-20020a02968c000000b0041d7ad74b36sm5144823jai.17.2023.06.14.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 10:17:40 -0700 (PDT)
Received: (nullmailer pid 2404355 invoked by uid 1000);
	Wed, 14 Jun 2023 17:17:39 -0000
From: Rob Herring <robh@kernel.org>
To: Anatolij Gustschin <agust@denx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: 52xx: Make immr_id DT match tables static
Date: Wed, 14 Jun 2023 11:17:23 -0600
Message-Id: <20230614171724.2403982-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In some builds, the mpc52xx_pm_prepare()/lite5200_pm_prepare() functions
generate stack size warnings. The addition of 'struct resource' in commit
2500763dd3db ("powerpc: Use of_address_to_resource()") grew the stack size
and is blamed for the warnings. However, the real issue is there's no
reason the 'struct of_device_id immr_ids' DT match tables need to be on
the stack as they are constant. Declare them as static to move them off
the stack.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306130405.uTv5yOZD-lkp@intel.com/
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/platforms/52xx/lite5200_pm.c | 2 +-
 arch/powerpc/platforms/52xx/mpc52xx_pm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/lite5200_pm.c b/arch/powerpc/platforms/52xx/lite5200_pm.c
index ee29b63fca16..4900f5f48cce 100644
--- a/arch/powerpc/platforms/52xx/lite5200_pm.c
+++ b/arch/powerpc/platforms/52xx/lite5200_pm.c
@@ -47,7 +47,7 @@ static int lite5200_pm_begin(suspend_state_t state)
 static int lite5200_pm_prepare(void)
 {
 	struct device_node *np;
-	const struct of_device_id immr_ids[] = {
+	static const struct of_device_id immr_ids[] = {
 		{ .compatible = "fsl,mpc5200-immr", },
 		{ .compatible = "fsl,mpc5200b-immr", },
 		{ .type = "soc", .compatible = "mpc5200", }, /* lite5200 */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pm.c b/arch/powerpc/platforms/52xx/mpc52xx_pm.c
index 549b3629e39a..f0c31ae15da5 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pm.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pm.c
@@ -60,7 +60,7 @@ int mpc52xx_set_wakeup_gpio(u8 pin, u8 level)
 int mpc52xx_pm_prepare(void)
 {
 	struct device_node *np;
-	const struct of_device_id immr_ids[] = {
+	static const struct of_device_id immr_ids[] = {
 		{ .compatible = "fsl,mpc5200-immr", },
 		{ .compatible = "fsl,mpc5200b-immr", },
 		{ .type = "soc", .compatible = "mpc5200", }, /* lite5200 */
-- 
2.39.2

