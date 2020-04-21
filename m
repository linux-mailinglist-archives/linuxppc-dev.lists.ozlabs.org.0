Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A381B21BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 10:34:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495xgC2RsZzDr61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 18:33:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=ykaukab@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495xbK26ZbzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 18:30:37 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3046ACAE;
 Tue, 21 Apr 2020 08:30:33 +0000 (UTC)
From: Mian Yousaf Kaukab <ykaukab@suse.de>
To: linux-pm@vger.kernel.org, andy.tang@nxp.com, sboyd@kernel.org,
 linux-clk@vger.kernel.org, rjw@rjwysocki.net, shawnguo@kernel.org,
 leoyang.li@nxp.com
Subject: [PATCH v2 2/2] clk: qoriq: add cpufreq platform device
Date: Tue, 21 Apr 2020 10:30:00 +0200
Message-Id: <20200421083000.16740-2-ykaukab@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200421083000.16740-1-ykaukab@suse.de>
References: <20200421083000.16740-1-ykaukab@suse.de>
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
Cc: Mian Yousaf Kaukab <ykaukab@suse.de>, viresh.kumar@linaro.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a platform device for qoirq-cpufreq driver for the compatible
clockgen blocks.

Reviewed-by: Yuantian Tang <andy.tang@nxp.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
v2:
 +Rafael, Stephen, linux-clk
 Add Reviewed-by and Acked-by tags

 drivers/clk/clk-qoriq.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index d5946f7486d6..374afcab89af 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -95,6 +95,7 @@ struct clockgen {
 };
 
 static struct clockgen clockgen;
+static bool add_cpufreq_dev __initdata;
 
 static void cg_out(struct clockgen *cg, u32 val, u32 __iomem *reg)
 {
@@ -1019,7 +1020,7 @@ static void __init create_muxes(struct clockgen *cg)
 	}
 }
 
-static void __init clockgen_init(struct device_node *np);
+static void __init _clockgen_init(struct device_node *np, bool legacy);
 
 /*
  * Legacy nodes may get probed before the parent clockgen node.
@@ -1030,7 +1031,7 @@ static void __init clockgen_init(struct device_node *np);
 static void __init legacy_init_clockgen(struct device_node *np)
 {
 	if (!clockgen.node)
-		clockgen_init(of_get_parent(np));
+		_clockgen_init(of_get_parent(np), true);
 }
 
 /* Legacy node */
@@ -1447,7 +1448,7 @@ static bool __init has_erratum_a4510(void)
 }
 #endif
 
-static void __init clockgen_init(struct device_node *np)
+static void __init _clockgen_init(struct device_node *np, bool legacy)
 {
 	int i, ret;
 	bool is_old_ls1021a = false;
@@ -1516,12 +1517,35 @@ static void __init clockgen_init(struct device_node *np)
 		       __func__, np, ret);
 	}
 
+	/* Don't create cpufreq device for legacy clockgen blocks */
+	add_cpufreq_dev = !legacy;
+
 	return;
 err:
 	iounmap(clockgen.regs);
 	clockgen.regs = NULL;
 }
 
+static void __init clockgen_init(struct device_node *np)
+{
+	_clockgen_init(np, false);
+}
+
+static int __init clockgen_cpufreq_init(void)
+{
+	struct platform_device *pdev;
+
+	if (add_cpufreq_dev) {
+		pdev = platform_device_register_simple("qoriq-cpufreq", -1,
+				NULL, 0);
+		if (IS_ERR(pdev))
+			pr_err("Couldn't register qoriq-cpufreq err=%ld\n",
+				PTR_ERR(pdev));
+	}
+	return 0;
+}
+device_initcall(clockgen_cpufreq_init);
+
 CLK_OF_DECLARE(qoriq_clockgen_1, "fsl,qoriq-clockgen-1.0", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_2, "fsl,qoriq-clockgen-2.0", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_b4420, "fsl,b4420-clockgen", clockgen_init);
-- 
2.16.4

