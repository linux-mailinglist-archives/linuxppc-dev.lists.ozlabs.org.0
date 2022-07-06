Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55195568D4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNtG15Z3z3fZq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hG+qz9x2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hG+qz9x2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNr86FcQz3fNF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:34:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C7B8B81D93;
	Wed,  6 Jul 2022 15:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194A1C341C8;
	Wed,  6 Jul 2022 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657121653;
	bh=BN3QKHWBFOVmDNAdkhEZg41UokDP2Y1qURVWKR6ME3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hG+qz9x2+NafUyuuOm9V8JTXDpjKiVFhCczobHnEl1IWIYsUzspB27G2PkuYfSTGo
	 TPD7Af/1XhC98QNSlWLRlsFowSwm6eAbiuqcYaUsTsfUqOhy16KuOmOh6dqr2XyFT8
	 yCAH5MhLmnzBfYBr4QXEHh3jCEAvRYclC3fNmSPU31drhLk0KJYSM+yZCfy8CkleGU
	 OOfh0+ebquYquUjZC2KBMFHd8n1T+lu+eEKckOQpq3VE8NGToOaVjs0sknQsAKtI3P
	 7Uvi8CO9rCDBhDTxko6Nl1NbbdLIDN5UvD4WU5QgeJad5HMcR3nP4oIugT9qo3cQK6
	 KNKjYbqhhQtNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 3/5] cpufreq: pmac32-cpufreq: Fix refcount leak bug
Date: Wed,  6 Jul 2022 11:34:05 -0400
Message-Id: <20220706153407.1598915-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153407.1598915-1-sashal@kernel.org>
References: <20220706153407.1598915-1-sashal@kernel.org>
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
index 641f8021855a..62e86f7ca04a 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -473,6 +473,10 @@ static int pmac_cpufreq_init_MacRISC3(struct device_node *cpunode)
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

