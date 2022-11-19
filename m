Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D60630E88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 12:48:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDsNr66bQz3fNN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 22:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDsKQ4C98z3dvj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:45:30 +1100 (AEDT)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 6AFE9C1213
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 11:31:42 +0000 (UTC)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A8A86FF807;
	Sat, 19 Nov 2022 11:31:28 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org,
	segher@kernel.crashing.org,
	pali@kernel.org
Subject: [PATCH v4 05/11] powerpc: wiiu: declare as non-coherent
Date: Sat, 19 Nov 2022 22:30:35 +1100
Message-Id: <20221119113041.284419-6-ash@heyquark.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119113041.284419-1-ash@heyquark.com>
References: <20220628133144.142185-1-ash@heyquark.com>
 <20221119113041.284419-1-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Nintendo Wii U requires explicit cache handling when interfacing
with DMA devices.

Signed-off-by: Ash Logan <ash@heyquark.com>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 0c4eed9aea80..ae1ee77705ea 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -522,7 +522,7 @@ config NR_CPUS
 config NOT_COHERENT_CACHE
 	bool
 	depends on 4xx || PPC_8xx || PPC_MPC512x || \
-		GAMECUBE_COMMON || AMIGAONE
+		GAMECUBE_COMMON || AMIGAONE || WIIU
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
-- 
2.38.1

