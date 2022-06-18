Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C199F5501FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 04:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ0Cy58Djz3bqk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 12:26:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ibVG8KPw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ibVG8KPw;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ0CN4397z30Hf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 12:26:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=W9BI6
	P0wZUTOeM9TLmKa8PQCi7xOpiT0T54lCxRxPbc=; b=ibVG8KPwq/8c02tvikycl
	pOIqVmCmLOfty7N3F6ILGT6B2d+3IX8TYRbMEnGrKe/jtvpaRjWAL5CQ7oM+X8Hd
	pJAi3rFuP1tzaiiYolrycWkWeDhx1z20LDn4kKsiwQknmkoCBEr5KFmIFPk12j6X
	jzqPwT8YJ8hCfmhALecgiU=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgCXm7CqN61iMTL+Ew--.45752S2;
	Sat, 18 Jun 2022 10:25:47 +0800 (CST)
From: Liang He <windhl@126.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] cpufreq: pmac32-cpufreq: Fix refcount leak bug
Date: Sat, 18 Jun 2022 10:25:45 +0800
Message-Id: <20220618022545.4056299-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCXm7CqN61iMTL+Ew--.45752S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry8GFWDuw1fur17urW7urg_yoWfCwc_ur
	n5WFy7Zw4UC3WIgr43Cr1Sq3sIv34fWF1FyFn2qF98Aw15Zr9Ivr48WrnrX3929w4Utw43
	Xw4qya1fuw47AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMXo2UUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgskF1-HZUmuEQAAsp
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pmac_cpufreq_init_MacRISC3(), we need to add corresponding
of_node_put() for the three node pointers whose refcount have
been incremented by of_find_node_by_name().

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/cpufreq/pmac32-cpufreq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 20f64a8b0a35..4b8ee2014da6 100644
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
2.25.1

