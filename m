Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC86A7A47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 05:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRyKx4jgPz3chb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 15:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=traphandler.com (client-ip=46.105.34.251; helo=smtpout1.mo528.mail-out.ovh.net; envelope-from=jjhiblot@traphandler.com; receiver=<UNKNOWN>)
X-Greylist: delayed 15002 seconds by postgrey-1.36 at boromir; Thu, 02 Mar 2023 10:03:12 AEDT
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRqXJ2Bkgz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:03:07 +1100 (AEDT)
Received: from pro2.mail.ovh.net (unknown [10.109.156.120])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 92F4C21D7D;
	Wed,  1 Mar 2023 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 19:52:58 +0100
From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To: <saravanak@google.com>, <clement.leger@bootlin.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Russell King
	<linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	<zajec5@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	Marc Zyngier <maz@kernel.org>, <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Rob Herring
	<robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Nishanth Menon <nm@ti.com>, <ssantosh@kernel.org>,
	<mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
Subject: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release the device node
Date: Wed, 1 Mar 2023 19:52:08 +0100
Message-ID: <20230301185209.274134-3-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230301185209.274134-1-jjhiblot@traphandler.com>
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG3EX2.emp2.local (172.16.2.22) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 11460535152860871036
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgtghisehtkeertdertddtnecuhfhrohhmpeflvggrnhdqlfgrtghquhgvshcujfhisghlohhtuceojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqeenucggtffrrghtthgvrhhnpeduteevleevvefggfdvueffffejhfehheeuiedtgedtjeeghfehueduudegfeefueenucfkphepuddvjedrtddrtddruddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhnmhesthhirdgtohhmpdhsshgrnhhtohhshheskhgvrhhnvghlrdhorhhgpdhmrghthhhirghsrdhnhihmrghnsehinhhtvghlrdgtohhmpdhgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdpthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdplhhinhhugi
 dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdplhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdgrtghtihhonhhssehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpsghhvghlghgrrghssehgohhoghhlvgdrtghomhdpfhhrohifrghnugdrlhhishhtsehgmhgrihhlrdgtohhmpdhrohgshhdoughtsehkvghrnhgvlhdrohhrghdpshgrmhhuvghlsehshhholhhlrghnugdrohhrghdptghlvghmvghnthdrlhgvghgvrhessghoohhtlhhinhdrtghomhdpghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdpmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdplhhinhhugiesrghrmhhlihhnuhigrdh
 orhhgrdhukhdpmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhnphhighhgihhnsehgmhgrihhlrdgtohhmpdgthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdiirghjvggtheesghhmrghilhdrtghomhdplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdptghlrghuughiuhdrsggviihnvggrsehmihgtrhhotghhihhprdgtohhmpdhmrgiisehkvghrnhgvlhdrohhrghdprghfrggvrhgsvghrsehsuhhsvgdruggvpdhmrghniheskhgvrhhnvghlrdhorhhgpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdifvghnshestghsihgvrdhorhhgpdhjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdpthhglhigsehlihhnuhhtrhhonhhigidruggvpdfovfetjfhoshhtpehmohehvdekpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Thu, 02 Mar 2023 15:09:14 +1100
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
Cc: devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-actions@lists.infradead.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_irq_parse_one() does a get() on the device node returned in out_irq->np.
Callers of of_irq_parse_one() must do a put() when they are done with it.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 .../mach-shmobile/regulator-quirk-rcar-gen2.c |  1 +
 arch/powerpc/sysdev/mpic_msi.c                |  1 +
 drivers/clocksource/timer-clint.c             |  1 +
 drivers/irqchip/irq-mchp-eic.c                |  1 +
 drivers/irqchip/irq-owl-sirq.c                |  1 +
 drivers/irqchip/irq-renesas-rzg2l.c           |  1 +
 drivers/irqchip/irq-sifive-plic.c             |  1 +
 drivers/irqchip/irq-sun6i-r.c                 |  2 ++
 drivers/of/irq.c                              | 22 ++++++++++++++-----
 drivers/of/unittest.c                         |  7 ++++++
 drivers/pci/of.c                              |  6 ++++-
 drivers/soc/ti/knav_qmss_queue.c              |  3 +++
 drivers/usb/host/xhci-tegra.c                 |  1 +
 13 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 117e7b07995b9..af1c04f0705aa 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 			kfree(quirk);
 			continue;
 		}
+		of_node_put(argsa->np);
 
 		list_for_each_entry(pos, &quirk_list, list) {
 			argsb = &pos->irq_args;
diff --git a/arch/powerpc/sysdev/mpic_msi.c b/arch/powerpc/sysdev/mpic_msi.c
index 34246c8e01c2b..bac8b12291a87 100644
--- a/arch/powerpc/sysdev/mpic_msi.c
+++ b/arch/powerpc/sysdev/mpic_msi.c
@@ -63,6 +63,7 @@ static int __init mpic_msi_reserve_u3_hwirqs(struct mpic *mpic)
 			ops->xlate(mpic->irqhost, NULL, oirq.args,
 						oirq.args_count, &hwirq, &flags);
 			msi_bitmap_reserve_hwirq(&mpic->msi_bitmap, hwirq);
+			of_node_put(oirq.np);
 		}
 	}
 
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 6cfe2ab73eb0c..126912674610c 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -175,6 +175,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		    oirq.args[0] == RV_IRQ_TIMER &&
 		    irq_find_host(oirq.np))
 			clint_timer_irq = irq_of_parse_and_map(np, i);
+		of_node_put(oirq.np);
 	}
 
 	/* If CLINT timer irq not found then fail */
diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index c726a19837d29..f020d28efc6a4 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -239,6 +239,7 @@ static int mchp_eic_init(struct device_node *node, struct device_node *parent)
 		ret = of_irq_parse_one(node, i, &irq);
 		if (ret)
 			goto clk_unprepare;
+		of_node_put(irq.np);
 
 		if (WARN_ON(irq.args_count != 3)) {
 			ret = -EINVAL;
diff --git a/drivers/irqchip/irq-owl-sirq.c b/drivers/irqchip/irq-owl-sirq.c
index 6e4127465094f..1ac31acb8e792 100644
--- a/drivers/irqchip/irq-owl-sirq.c
+++ b/drivers/irqchip/irq-owl-sirq.c
@@ -311,6 +311,7 @@ static int __init owl_sirq_init(const struct owl_sirq_params *params,
 			pr_err("%pOF: failed to parse interrupt %d\n", node, i);
 			goto out_unmap;
 		}
+		of_node_put(irq.np);
 
 		if (WARN_ON(irq.args_count != 3)) {
 			ret = -EINVAL;
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 25fd8ee66565b..095d2263e2dac 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -310,6 +310,7 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l_irqc_priv *priv,
 			return ret;
 		of_phandle_args_to_fwspec(np, map.args, map.args_count,
 					  &priv->fwspec[i]);
+		of_node_put(map.np);
 	}
 
 	return 0;
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index ff47bd0dec455..1a863ab2abd60 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -420,6 +420,7 @@ static int __init __plic_init(struct device_node *node,
 				irq_set_chained_handler(plic_parent_irq,
 							plic_handle_irq);
 		}
+		of_node_put(parent.np);
 
 		/*
 		 * When running in M-mode we need to ignore the S-mode handler.
diff --git a/drivers/irqchip/irq-sun6i-r.c b/drivers/irqchip/irq-sun6i-r.c
index a01e440494154..29e5917d1fc9d 100644
--- a/drivers/irqchip/irq-sun6i-r.c
+++ b/drivers/irqchip/irq-sun6i-r.c
@@ -317,6 +317,8 @@ static int __init sun6i_r_intc_init(struct device_node *node,
 	ret = of_irq_parse_one(node, 0, &nmi_parent);
 	if (ret)
 		return ret;
+	of_node_put(nmi_parent.np);
+
 	if (nmi_parent.args_count < 3 ||
 	    nmi_parent.args[0] != GIC_SPI ||
 	    nmi_parent.args[2] != IRQ_TYPE_LEVEL_HIGH)
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e9bf5236ed892..95da943fcf075 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -35,12 +35,16 @@
  */
 unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 {
+	unsigned int res;
 	struct of_phandle_args oirq;
 
 	if (of_irq_parse_one(dev, index, &oirq))
 		return 0;
 
-	return irq_create_of_mapping(&oirq);
+	res = irq_create_of_mapping(&oirq);
+	of_node_put(oirq.np);
+
+	return res;
 }
 EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 
@@ -438,10 +442,16 @@ int of_irq_get(struct device_node *dev, int index)
 		return rc;
 
 	domain = irq_find_host(oirq.np);
-	if (!domain)
-		return -EPROBE_DEFER;
+	if (!domain) {
+		rc = -EPROBE_DEFER;
+		goto out;
+	}
 
-	return irq_create_of_mapping(&oirq);
+	rc = irq_create_of_mapping(&oirq);
+
+out:
+	of_node_put(oirq.np);
+	return rc;
 }
 EXPORT_SYMBOL_GPL(of_irq_get);
 
@@ -478,8 +488,10 @@ int of_irq_count(struct device_node *dev)
 	struct of_phandle_args irq;
 	int nr = 0;
 
-	while (of_irq_parse_one(dev, nr, &irq) == 0)
+	while (of_irq_parse_one(dev, nr, &irq) == 0) {
 		nr++;
+		of_node_put(irq.np);
+	}
 
 	return nr;
 }
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index bc0f1e50a4bee..801a42c20fc79 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1021,6 +1021,8 @@ static void __init of_unittest_parse_interrupts(void)
 
 		memset(&args, 0, sizeof(args));
 		rc = of_irq_parse_one(np, i, &args);
+		if (!rc)
+			of_node_put(args.np);
 
 		passed &= !rc;
 		passed &= (args.args_count == 1);
@@ -1028,6 +1030,7 @@ static void __init of_unittest_parse_interrupts(void)
 
 		unittest(passed, "index %i - data error on node %pOF rc=%i\n",
 			 i, args.np, rc);
+
 	}
 	of_node_put(np);
 
@@ -1042,6 +1045,8 @@ static void __init of_unittest_parse_interrupts(void)
 
 		memset(&args, 0, sizeof(args));
 		rc = of_irq_parse_one(np, i, &args);
+		if (!rc)
+			of_node_put(args.np);
 
 		/* Test the values from tests-phandle.dtsi */
 		switch (i) {
@@ -1098,6 +1103,8 @@ static void __init of_unittest_parse_interrupts_extended(void)
 
 		memset(&args, 0, sizeof(args));
 		rc = of_irq_parse_one(np, i, &args);
+		if (!rc)
+			of_node_put(args.np);
 
 		/* Test the values from tests-phandle.dtsi */
 		switch (i) {
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 196834ed44fe8..a3a047f57e439 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -535,7 +535,11 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	if (ret)
 		return 0; /* Proper return code 0 == NO_IRQ */
 
-	return irq_create_of_mapping(&oirq);
+	ret = irq_create_of_mapping(&oirq);
+
+	of_node_put(oirq.np);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
 #endif	/* CONFIG_OF_IRQ */
diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 8fb76908be704..0ac4a0f219127 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1240,6 +1240,9 @@ static int knav_setup_queue_range(struct knav_device *kdev,
 			break;
 
 		range->irqs[i].irq = irq_create_of_mapping(&oirq);
+
+		of_node_put(oirq.np);
+
 		if (range->irqs[i].irq == IRQ_NONE)
 			break;
 
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index bdb776553826b..538eedac1c71e 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1458,6 +1458,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	/* Older device-trees don't have padctrl interrupt */
 	err = of_irq_parse_one(np, 0, &args);
 	if (!err) {
+		of_node_put(args.np);
 		tegra->padctl_irq = of_irq_get(np, 0);
 		if (tegra->padctl_irq <= 0) {
 			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
-- 
2.25.1

