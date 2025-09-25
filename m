Return-Path: <linuxppc-dev+bounces-12585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE85BA1FE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 01:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXr2h1xWBz3cYg;
	Fri, 26 Sep 2025 09:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758843980;
	cv=none; b=N5NorcPUim5vBSTVmkKZbORe/w7lTgsfjlb9FLpmTx2PKe/ZvD1zHRD5D/TP6UWx0l0HtziFMCpCLxMPTQQlU/XScMoh4+xSk8k0LMrkZDYJxEEcfDNgQI3HKVXy52PzFO5qcjQwih05tJ34VKlYuM9lTnVVXmWwfY4xUlaDj+NRxPrT0z7hqNXHcLe4JJCc7rfHAVeNPlBmkmNQ/Gqq9LjWeFfDTcSHgUseDJnOV3ISUIVsekQMQ8waPsKog5f+SU+bd8ioQ+DxXwQeo9EWAPaDsPJpDawNcV6XXdan1qHye495tXwLTO5s9+U/ZYOTdbLPO0PnRnglh8QuooSxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758843980; c=relaxed/relaxed;
	bh=C7Z5D/YZWEF3HavVLZgOxCipRcy2DjZbJREVSVMfMAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iwm1aMhqDXFKTetLjBwbJxxNXObgwm9n2c1iUvo272sPzFPq6yfaUXAxkGX0LRoJiYz7F6o5TpNlRoYAt6TZyClrDvNl7RiJXGPgHczgQZXsMZli5KdHvBmpSCRiCWlP/CCDSpWPmUvY+o5Wek8ZlVXIDKYx3LScY4gZ/jR806Zmoh9dDhQrwXxtl2aACreysGk5N4Vq8kSSM+pSy232LHyjVmtSmwqyhJQSUnp9isq/rcZTCOa6yazk8FScXG8Grh+8M7W6zRslE3JUwu70c09Awk6q2KUY3sSd58dJOWR3csf1aeui806kgdhsQk6ZtsQUYe0vb8RcVYh4QwibIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jW8SEeu/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jW8SEeu/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXr2g3JDJz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 09:46:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF9A261356;
	Thu, 25 Sep 2025 23:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3096FC4CEF5;
	Thu, 25 Sep 2025 23:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758843976;
	bh=jy6XpX73dzULscHEsspzWI272121ql+W/8qzRykVrYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jW8SEeu/EqILn9p3g3Lc3UEpDoC65BCidi263ce7vw1jhKXx0XuNnFeTK+KLQivpy
	 PXtMEapZ7EpiVFCc1kUHLc7tafQOv0neAjpa7Mm+lAIir1AVyIGguWRm0Ny+AZzHeN
	 b4q/7z7dBxivOkf4wsBAKOfYE1F3dqR81nOavq3CDk7l0mU/lP885FW9gr3vE3urOH
	 V3Hh4/qoPY7647RmF0nxVsns6ReqUxidoPkAh3BXsaRU8WiYNsowqg7AseifHrmBRr
	 Z1Hj/wgPfl7K37YPYEO57MYmdMENJX5FExuUwDGINC5hflPiZJcaWY+5hYRoN+JV9E
	 uAAkrTPHd78IA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Sep 2025 19:46:06 -0400
Subject: [PATCH 1/2] powerpc/powermac: Include linux/of.h in backlight.c
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-1-d256858d86a6@kernel.org>
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
In-Reply-To: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
To: Lee Jones <lee@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jy6XpX73dzULscHEsspzWI272121ql+W/8qzRykVrYw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlXrzjZcf9vrA8PmPpkgfqyNC2FO5cC3l5k2B63qps/l
 W/1rolrOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEQpgZGSYsUPcycnfwl6ks
 017xcMPy+JlXtYxYTVfEHbZZKMQjtJbhn+m/Mz8YL+oKxXHu7Jphy6m4IP7xTY0VS3+uLSp3dvu
 WzAkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

After the recent removal of the fb.h include from backlight.h, which
transitively included of.h, there are several errors in the powermac backlight
driver:

  arch/powerpc/platforms/powermac/backlight.c: In function 'pmac_has_backlight_type':
  arch/powerpc/platforms/powermac/backlight.c:59:39: error: implicit declaration of function 'of_find_node_by_name'; did you mean 'bus_find_device_by_name'? [-Wimplicit-function-declaration]
     59 |         struct device_node* bk_node = of_find_node_by_name(NULL, "backlight");
        |                                       ^~~~~~~~~~~~~~~~~~~~
        |                                       bus_find_device_by_name
  arch/powerpc/platforms/powermac/backlight.c:59:39: error: initialization of 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  arch/powerpc/platforms/powermac/backlight.c:60:17: error: implicit declaration of function 'of_property_match_string' [-Wimplicit-function-declaration]
     60 |         int i = of_property_match_string(bk_node, "backlight-control", type);
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~
  arch/powerpc/platforms/powermac/backlight.c:62:9: error: implicit declaration of function 'of_node_put' [-Wimplicit-function-declaration]
     62 |         of_node_put(bk_node);
        |         ^~~~~~~~~~~

Explicitly include of.h to resolve the errors.

Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/platforms/powermac/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
index 79741370c40c..9afb64723649 100644
--- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -14,6 +14,7 @@
 #include <linux/pmu.h>
 #include <linux/atomic.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <asm/backlight.h>
 
 #define OLD_BACKLIGHT_MAX 15

-- 
2.51.0


