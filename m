Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74B6A7A4A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 05:11:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRyMl6nctz3fVt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 15:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=traphandler.com (client-ip=46.105.34.251; helo=smtpout1.mo528.mail-out.ovh.net; envelope-from=jjhiblot@traphandler.com; receiver=<UNKNOWN>)
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRqYd2xV8z3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:04:18 +1100 (AEDT)
Received: from pro2.mail.ovh.net (unknown [10.109.156.120])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 694A92195F;
	Wed,  1 Mar 2023 18:52:58 +0000 (UTC)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 19:52:57 +0100
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
Subject: [PATCH 0/3] of: irq: Fixes refcount issues with of_irq_parse_one()/of_irq_parse_raw()
Date: Wed, 1 Mar 2023 19:52:06 +0100
Message-ID: <20230301185209.274134-1-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG3EX2.emp2.local (172.16.2.22) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 11460535153186650492
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeflvggrnhdqlfgrtghquhgvshcujfhisghlohhtuceojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqeenucggtffrrghtthgvrhhnpeejuefhkeelgffhlefhtefhgeektdevvdfgkeeltdehgeeujeeutdehkeeuhffftdenucfkphepuddvjedrtddrtddruddpkeekrdduiedurddvhedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhnmhesthhirdgtohhmpdhsshgrnhhtohhshheskhgvrhhnvghlrdhorhhgpdhmrghthhhirghsrdhnhihmrghnsehinhhtvghlrdgtohhmpdhgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdpthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdplhhinhhugidqrh
 gvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdplhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdgrtghtihhonhhssehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqphgtihesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpsghhvghlghgrrghssehgohhoghhlvgdrtghomhdpfhhrohifrghnugdrlhhishhtsehgmhgrihhlrdgtohhmpdhrohgshhdoughtsehkvghrnhgvlhdrohhrghdpshgrmhhuvghlsehshhholhhlrghnugdrohhrghdptghlvghmvghnthdrlhgvghgvrhessghoohhtlhhinhdrtghomhdpghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdpmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdplhhinhhugiesrghrmhhlihhnuhigrdhorhh
 grdhukhdpmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhnphhighhgihhnsehgmhgrihhlrdgtohhmpdgthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdiirghjvggtheesghhmrghilhdrtghomhdplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdptghlrghuughiuhdrsggviihnvggrsehmihgtrhhotghhihhprdgtohhmpdhmrgiisehkvghrnhgvlhdrohhrghdprghfrggvrhgsvghrsehsuhhsvgdruggvpdhmrghniheskhgvrhhnvghlrdhorhhgpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdifvghnshestghsihgvrdhorhhgpdhjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdpthhglhigsehlihhnuhhtrhhonhhigidruggvpdfovfetjfhoshhtpehmohehvdekpdhmohguvgepshhmthhpohhuth
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

This series attempts to fix refcounting issues related to of_irq_parse_one()
and of_irq_parse_raw().

The first issue is simply that most callers of of_irq_parse_one() and
of_irq_parse_raw() don't call of_node_put() on the returned device node when
they no longer need it.

The second issue is a double get() happening in of_irq_parse_one() when
parsing the "interrupts-extended" properties.

WARNING: I tried to be careful when modifying the callers of
of_irq_parse_one()/of_irq_parse_raw() but haven't test-build all the changes.


Jean-Jacques Hiblot (3):
  of: irq: make callers of of_irq_parse_raw() release the device node
  of: irq: make callers of of_irq_parse_one() release the device node
  of: irq: release the node after looking up for "interrupts-extended"

 .../mach-shmobile/regulator-quirk-rcar-gen2.c |  1 +
 arch/powerpc/platforms/fsl_uli1575.c          |  1 +
 arch/powerpc/sysdev/mpic_msi.c                |  1 +
 drivers/bcma/main.c                           |  5 +++-
 drivers/clocksource/timer-clint.c             |  1 +
 drivers/irqchip/irq-mchp-eic.c                |  1 +
 drivers/irqchip/irq-owl-sirq.c                |  1 +
 drivers/irqchip/irq-renesas-rzg2l.c           |  1 +
 drivers/irqchip/irq-sifive-plic.c             |  1 +
 drivers/irqchip/irq-sun6i-r.c                 |  2 ++
 drivers/of/irq.c                              | 30 ++++++++++++++-----
 drivers/of/unittest.c                         |  7 +++++
 drivers/pci/of.c                              |  6 +++-
 drivers/soc/ti/knav_qmss_queue.c              |  3 ++
 drivers/usb/host/xhci-tegra.c                 |  1 +
 15 files changed, 53 insertions(+), 9 deletions(-)

-- 
2.25.1

