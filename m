Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B75568CEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNpw5wGPz3c2v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:33:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ilCDhFZJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ilCDhFZJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNnx1tFFz3fCt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:32:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92D3961FE0;
	Wed,  6 Jul 2022 15:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BA0C341C8;
	Wed,  6 Jul 2022 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657121539;
	bh=2tvJ+fipO4VZmFYhZ9As3c1NcfOg4s2bZwVEwvLpA6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilCDhFZJt/Q2Snut441k9GZxbZLf1viePwZlKYh6rDdu+yszJiL7xw0At1WNvDbAA
	 HrvS88ooELOd8Sa2nqE4EkifAw0Fu66toDzsAA09meJh3zLlOqTy3zxQevE2Z6ZTbr
	 +KEzSXNnS4UcphPcwlQyz4HvQS/EeNd+OpuCZ5cBTs0ErLNuWoWTBqL5oLLZAhV0dP
	 gYAKZwVgGB18UqKVN/TjVkgvFn7dn67lzWmDaQXwQDtrkTfQUsPdmrk16Avn5cfNjm
	 obuI6oqM14pxaRm2Tj5ralRSx7Fg4RgeWwqTRMPxYvt/0o6E3gVRUFlfz30pc1S3q3
	 J9Bh6BAoJ9RVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/18] cpufreq: pmac32-cpufreq: Fix refcount leak bug
Date: Wed,  6 Jul 2022 11:31:44 -0400
Message-Id: <20220706153153.1598076-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153153.1598076-1-sashal@kernel.org>
References: <20220706153153.1598076-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, rafael@kernel.org, linuxppc-dev@lists.ozlabs.org, Liang He <windhl@126.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Liang He <windhl@126.com>

[ Upstream commit ccd7567d4b6cf187fdfa55f003a9e461ee629e36 ]

In pmac_cpufreq_init_MacRISC3(), we need to add corresponding
of_node_put() for the three node pointers whose refcount have
been incremented by of_find_node_by_name().

Signed-off-by: Liang He <windhl@126.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/pmac32-cpufreq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 4f20c6a9108d..8e41fe9ee870 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -470,6 +470,10 @@ static int pmac_cpufreq_init_MacRISC3(struct device_node *cpunode)
 	if (slew_done_gpio_np)
 		slew_done_gpio = read_gpio(slew_done_gpio_np);
 
+	of_node_put(volt_gpio_np);
+	of_node_put(freq_gpio_np);
+	of_node_put(slew_done_gpio_np);
+
 	/* If we use the frequency GPIOs, calculate the min/max speeds based
 	 * on the bus frequencies
 	 */
-- 
2.35.1

