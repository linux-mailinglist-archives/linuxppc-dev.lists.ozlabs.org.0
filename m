Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF34EEFA5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVMvv66n7z30G6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RfWMpevk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RfWMpevk; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVMvC3dNVz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:27:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71DC461BCE;
 Fri,  1 Apr 2022 14:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618FBC2BBE4;
 Fri,  1 Apr 2022 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823235;
 bh=XDdrt3Zdkqf91+hsmo+atvf9Fl2UncK5Pbj1CzGlJm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RfWMpevkqUxFGU1DHgaE2lF9GTSml12ZoHoonIGLKVlKh+2tgbgkinsA6l2G6nETP
 c3dbxiCGaY1MCIPUKUOHdbFkmxZzJFWt7HlHbs4lfmNmcZsmdAyrVoewh+rg0kbDxY
 oUCR1+7GtKR4cN58YsuXJVioo5/SrwQqb1Uexhq+oGPz8OmdNzBMCWNzytW3lBqyut
 gS2K9V079sRbsptaz42urIFtFeHWBkkgDn3vuSsi8HrcVqmyffk6DweCkr2wwFfIth
 j+wTQ6E84WBqKty/y32t8ywCkZWxp5m+b9Uad0xhPi0bMQi89Ny3BID9mcPqzJA771
 4osOANCmOi9dQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 027/149] powerpc/xive: Export XIVE IPI
 information for online-only processors.
Date: Fri,  1 Apr 2022 10:23:34 -0400
Message-Id: <20220401142536.1948161-27-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, groug@kaod.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sachin Sant <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sachin Sant <sachinp@linux.ibm.com>

[ Upstream commit 279d1a72c0f8021520f68ddb0a1346ff9ba1ea8c ]

Cédric pointed out that XIVE IPI information exported via sysfs
(debug/powerpc/xive) display empty lines for processors which are
not online.

Switch to using for_each_online_cpu() so that information is
displayed for online-only processors.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Sachin Sant <sachinp@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/xive/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 1ca5564bda9d..32863b4daf72 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1791,7 +1791,7 @@ static int xive_ipi_debug_show(struct seq_file *m, void *private)
 	if (xive_ops->debug_show)
 		xive_ops->debug_show(m, private);
 
-	for_each_possible_cpu(cpu)
+	for_each_online_cpu(cpu)
 		xive_debug_show_ipi(m, cpu);
 	return 0;
 }
-- 
2.34.1

