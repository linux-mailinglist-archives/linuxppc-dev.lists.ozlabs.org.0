Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7E3A8CF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2019 19:04:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MN0m2mHkzDqLF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 03:04:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="T0bHODP+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MMxv672tzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 03:02:11 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 035F1204EC;
 Sun,  9 Jun 2019 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560099729;
 bh=JNOjyPgmgTSyte7PAbhbkFvqDoZLFEsnxxrNq7rCH/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T0bHODP+ETbiacs0GPjmXjtNiRRL79IJqddFv9FzFr55sPsn0GawI97KO2hoNbIBv
 TO1lSaMbtE08BQAwNC1LqP1TOZ5P+wZGkpkGg4+YvqqkpQ/pZgVgyVuGTgVovG5xkJ
 UO5+m+xlp3h9zJfOwGJnjILn/voX0+ZUKisu5gNU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.4 146/241] cpufreq: pmac32: fix possible object reference
 leak
Date: Sun,  9 Jun 2019 18:41:28 +0200
Message-Id: <20190609164151.995736751@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609164147.729157653@linuxfoundation.org>
References: <20190609164147.729157653@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, stable@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Upstream commit 8d10dc28a9ea6e8c02e825dab28699f3c72b02d9 ]

The call to of_find_node_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/cpufreq/pmac32-cpufreq.c:557:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 552, but without a corresponding object release within this function.
./drivers/cpufreq/pmac32-cpufreq.c:569:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 552, but without a corresponding object release within this function.
./drivers/cpufreq/pmac32-cpufreq.c:598:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 587, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-pm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/pmac32-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 1f49d97a70ea1..14928e0dc3265 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -549,6 +549,7 @@ static int pmac_cpufreq_init_7447A(struct device_node *cpunode)
 	volt_gpio_np = of_find_node_by_name(NULL, "cpu-vcore-select");
 	if (volt_gpio_np)
 		voltage_gpio = read_gpio(volt_gpio_np);
+	of_node_put(volt_gpio_np);
 	if (!voltage_gpio){
 		printk(KERN_ERR "cpufreq: missing cpu-vcore-select gpio\n");
 		return 1;
@@ -585,6 +586,7 @@ static int pmac_cpufreq_init_750FX(struct device_node *cpunode)
 	if (volt_gpio_np)
 		voltage_gpio = read_gpio(volt_gpio_np);
 
+	of_node_put(volt_gpio_np);
 	pvr = mfspr(SPRN_PVR);
 	has_cpu_l2lve = !((pvr & 0xf00) == 0x100);
 
-- 
2.20.1



