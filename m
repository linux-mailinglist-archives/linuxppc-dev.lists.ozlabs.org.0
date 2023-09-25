Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F97ADF61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 21:03:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MquU9wD8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvXN51mp5z3dGQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 05:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MquU9wD8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=joog=fj=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvXMC3pQVz3cBY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 05:03:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D81961047;
	Mon, 25 Sep 2023 19:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FA6C433C9;
	Mon, 25 Sep 2023 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695668579;
	bh=fXjtOigHLEJ1WJtElTztBusz+atOZCq2/IkS7MCl4mI=;
	h=From:To:Cc:Subject:Date:From;
	b=MquU9wD8hYsuyJWG2dXdLxBp2tuZNIl4+TT9klhR9RxTVPdroNxfrbZhxKeimjh4Y
	 JfrN6BpcD6a0DJu8IW9uLq9NwYfBWzgMfBLgIyJcbP8hrirGR8PpT3IuWlzM9yKWjf
	 7AjkLV1PsBQAep7IecnHVy7fJJebuBwDTHWGFxUPQYfzizjByavVoA4V+bNujsVAza
	 rzwf0ZJyGALJUb0SHKewArrjJJOopNKS51TmvMLrVkQz0FWGknyWN9SYJY3D0v3h0+
	 HEwZcBOe3A0Bm4BmV44LbmkXA2yecvLWHmR6iyqMajxbX8NxN3BAlg3iOmhJqXOSIy
	 FCAD5Dx2HQCmA==
Received: (nullmailer pid 1712705 invoked by uid 1000);
	Mon, 25 Sep 2023 19:02:57 -0000
From: Rob Herring <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] cpufreq: pmac32: Use of_property_read_reg() to parse "reg"
Date: Mon, 25 Sep 2023 14:02:35 -0500
Message-Id: <20230925190242.1712212-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the recently added of_property_read_reg() helper to get the
untranslated "reg" address value.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add missing include
---
 drivers/cpufreq/pmac32-cpufreq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index ec75e79659ac..df3567c1e93b 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -24,6 +24,7 @@
 #include <linux/device.h>
 #include <linux/hardirq.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <asm/machdep.h>
 #include <asm/irq.h>
@@ -378,10 +379,9 @@ static int pmac_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 static u32 read_gpio(struct device_node *np)
 {
-	const u32 *reg = of_get_property(np, "reg", NULL);
-	u32 offset;
+	u64 offset;
 
-	if (reg == NULL)
+	if (of_property_read_reg(np, 0, &offset, NULL) < 0)
 		return 0;
 	/* That works for all keylargos but shall be fixed properly
 	 * some day... The problem is that it seems we can't rely
@@ -389,7 +389,6 @@ static u32 read_gpio(struct device_node *np)
 	 * relative to the base of KeyLargo or to the base of the
 	 * GPIO space, and the device-tree doesn't help.
 	 */
-	offset = *reg;
 	if (offset < KEYLARGO_GPIO_LEVELS0)
 		offset += KEYLARGO_GPIO_LEVELS0;
 	return offset;
-- 
2.40.1

