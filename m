Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D16CEE67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmrsV0HNTz3gks
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.181; helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrgb5rgjz3f3h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:31 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id l18so11896013oic.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/jkzEqUMbBSjs4kiPLKjfNJkvrHk6Wvng20abXkerU=;
        b=D5XZo2NrDAiOPPg/FJVCT/bxWxxqqlEBajfuQGdHN+jBSKlwpKP85PA33XdhIsWICp
         tL+KURdxlPrnApXrAFkLbFH4K9y25cR0QnO7kbxbqsgnLKpLqicxn/Y8I2TC6U0DpfsD
         svAN/eDuCo11yBuy3jW5LZEE9yWOilPEQI7Feo5qKYGm0tVgn1WqT+RDM3oSUIrgkT8L
         hGu2OzoDlaTjTK8oxdgCk4v2TK5fZNgrExJaZGVFHOXpnJtvINBn5PS8TrYVj1NKfS5z
         TCwkMZMWip/a4PG/wfWrYOKISv2sF7Nzv394yZAcbzR3Zf+5/KHFaWMYqiVWTUnrSjcc
         +/6Q==
X-Gm-Message-State: AO0yUKX5F7/U1WzpqBw1B3GGF6XFI7rCY1lupNDZjCoXwBEunAbU5Ktr
	wzERMU7KSJrj28KDRYWF8Q==
X-Google-Smtp-Source: AK7set/MTp3w22+pQb2OMPwzzF/wsNsFes87Jt9z1LBQnRiVFzJLKTuWRe65EFeSlZ8Hu0XY5YYhjg==
X-Received: by 2002:a54:4f03:0:b0:386:ef98:e5d5 with SMTP id e3-20020a544f03000000b00386ef98e5d5mr8728584oiy.24.1680105209619;
        Wed, 29 Mar 2023 08:53:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 7-20020aca0907000000b00386b8b1448dsm9015456oij.34.2023.03.29.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:29 -0700 (PDT)
Received: (nullmailer pid 3198069 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:01 -0500
Subject: [PATCH 04/19] of: Move CPU node related functions to their own
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-4-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/of/base.c is quite long and we've accumulated a number of CPU
node functions. Let's move them to a new file, cpu.c, along with the
lone of_cpu_device_node_get() in of_device.h. Moving the declaration has
no effect yet as of.h is included by of_device.h. This serves as
preparation to disentangle the includes in of_device.h and
of_platform.h.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/Makefile       |   2 +-
 drivers/of/base.c         | 187 -----------------------------------------
 drivers/of/cpu.c          | 210 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h        |  19 +++--
 include/linux/of_device.h |  14 ----
 5 files changed, 223 insertions(+), 209 deletions(-)

diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index e0360a44306e..10f704592561 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y = base.o device.o platform.o property.o
+obj-y = base.o cpu.o device.o platform.o property.o
 obj-$(CONFIG_OF_KOBJ) += kobj.o
 obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ac6fde53342f..7f1720af813c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -286,193 +286,6 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
-/**
- * of_get_cpu_hwid - Get the hardware ID from a CPU device node
- *
- * @cpun: CPU number(logical index) for which device node is required
- * @thread: The local thread number to get the hardware ID for.
- *
- * Return: The hardware ID for the CPU node or ~0ULL if not found.
- */
-u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread)
-{
-	const __be32 *cell;
-	int ac, len;
-
-	ac = of_n_addr_cells(cpun);
-	cell = of_get_property(cpun, "reg", &len);
-	if (!cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len))
-		return ~0ULL;
-
-	cell += ac * thread;
-	return of_read_number(cell, ac);
-}
-
-/*
- * arch_match_cpu_phys_id - Match the given logical CPU and physical id
- *
- * @cpu: logical cpu index of a core/thread
- * @phys_id: physical identifier of a core/thread
- *
- * CPU logical to physical index mapping is architecture specific.
- * However this __weak function provides a default match of physical
- * id to logical cpu index. phys_id provided here is usually values read
- * from the device tree which must match the hardware internal registers.
- *
- * Returns true if the physical identifier and the logical cpu index
- * correspond to the same core/thread, false otherwise.
- */
-bool __weak arch_match_cpu_phys_id(int cpu, u64 phys_id)
-{
-	return (u32)phys_id == cpu;
-}
-
-/*
- * Checks if the given "prop_name" property holds the physical id of the
- * core/thread corresponding to the logical cpu 'cpu'. If 'thread' is not
- * NULL, local thread number within the core is returned in it.
- */
-static bool __of_find_n_match_cpu_property(struct device_node *cpun,
-			const char *prop_name, int cpu, unsigned int *thread)
-{
-	const __be32 *cell;
-	int ac, prop_len, tid;
-	u64 hwid;
-
-	ac = of_n_addr_cells(cpun);
-	cell = of_get_property(cpun, prop_name, &prop_len);
-	if (!cell && !ac && arch_match_cpu_phys_id(cpu, 0))
-		return true;
-	if (!cell || !ac)
-		return false;
-	prop_len /= sizeof(*cell) * ac;
-	for (tid = 0; tid < prop_len; tid++) {
-		hwid = of_read_number(cell, ac);
-		if (arch_match_cpu_phys_id(cpu, hwid)) {
-			if (thread)
-				*thread = tid;
-			return true;
-		}
-		cell += ac;
-	}
-	return false;
-}
-
-/*
- * arch_find_n_match_cpu_physical_id - See if the given device node is
- * for the cpu corresponding to logical cpu 'cpu'.  Return true if so,
- * else false.  If 'thread' is non-NULL, the local thread number within the
- * core is returned in it.
- */
-bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
-					      int cpu, unsigned int *thread)
-{
-	/* Check for non-standard "ibm,ppc-interrupt-server#s" property
-	 * for thread ids on PowerPC. If it doesn't exist fallback to
-	 * standard "reg" property.
-	 */
-	if (IS_ENABLED(CONFIG_PPC) &&
-	    __of_find_n_match_cpu_property(cpun,
-					   "ibm,ppc-interrupt-server#s",
-					   cpu, thread))
-		return true;
-
-	return __of_find_n_match_cpu_property(cpun, "reg", cpu, thread);
-}
-
-/**
- * of_get_cpu_node - Get device node associated with the given logical CPU
- *
- * @cpu: CPU number(logical index) for which device node is required
- * @thread: if not NULL, local thread number within the physical core is
- *          returned
- *
- * The main purpose of this function is to retrieve the device node for the
- * given logical CPU index. It should be used to initialize the of_node in
- * cpu device. Once of_node in cpu device is populated, all the further
- * references can use that instead.
- *
- * CPU logical to physical index mapping is architecture specific and is built
- * before booting secondary cores. This function uses arch_match_cpu_phys_id
- * which can be overridden by architecture specific implementation.
- *
- * Return: A node pointer for the logical cpu with refcount incremented, use
- * of_node_put() on it when done. Returns NULL if not found.
- */
-struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
-{
-	struct device_node *cpun;
-
-	for_each_of_cpu_node(cpun) {
-		if (arch_find_n_match_cpu_physical_id(cpun, cpu, thread))
-			return cpun;
-	}
-	return NULL;
-}
-EXPORT_SYMBOL(of_get_cpu_node);
-
-/**
- * of_cpu_node_to_id: Get the logical CPU number for a given device_node
- *
- * @cpu_node: Pointer to the device_node for CPU.
- *
- * Return: The logical CPU number of the given CPU device_node or -ENODEV if the
- * CPU is not found.
- */
-int of_cpu_node_to_id(struct device_node *cpu_node)
-{
-	int cpu;
-	bool found = false;
-	struct device_node *np;
-
-	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
-		found = (cpu_node == np);
-		of_node_put(np);
-		if (found)
-			return cpu;
-	}
-
-	return -ENODEV;
-}
-EXPORT_SYMBOL(of_cpu_node_to_id);
-
-/**
- * of_get_cpu_state_node - Get CPU's idle state node at the given index
- *
- * @cpu_node: The device node for the CPU
- * @index: The index in the list of the idle states
- *
- * Two generic methods can be used to describe a CPU's idle states, either via
- * a flattened description through the "cpu-idle-states" binding or via the
- * hierarchical layout, using the "power-domains" and the "domain-idle-states"
- * bindings. This function check for both and returns the idle state node for
- * the requested index.
- *
- * Return: An idle state node if found at @index. The refcount is incremented
- * for it, so call of_node_put() on it when done. Returns NULL if not found.
- */
-struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
-					  int index)
-{
-	struct of_phandle_args args;
-	int err;
-
-	err = of_parse_phandle_with_args(cpu_node, "power-domains",
-					"#power-domain-cells", 0, &args);
-	if (!err) {
-		struct device_node *state_node =
-			of_parse_phandle(args.np, "domain-idle-states", index);
-
-		of_node_put(args.np);
-		if (state_node)
-			return state_node;
-	}
-
-	return of_parse_phandle(cpu_node, "cpu-idle-states", index);
-}
-EXPORT_SYMBOL(of_get_cpu_state_node);
-
 /**
  * __of_device_is_compatible() - Check if the node matches given constraints
  * @device: pointer to node
diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
new file mode 100644
index 000000000000..d17b2f851082
--- /dev/null
+++ b/drivers/of/cpu.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/cpu.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+/**
+ * of_get_cpu_hwid - Get the hardware ID from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ * @thread: The local thread number to get the hardware ID for.
+ *
+ * Return: The hardware ID for the CPU node or ~0ULL if not found.
+ */
+u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread)
+{
+	const __be32 *cell;
+	int ac, len;
+
+	ac = of_n_addr_cells(cpun);
+	cell = of_get_property(cpun, "reg", &len);
+	if (!cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len))
+		return ~0ULL;
+
+	cell += ac * thread;
+	return of_read_number(cell, ac);
+}
+
+/*
+ * arch_match_cpu_phys_id - Match the given logical CPU and physical id
+ *
+ * @cpu: logical cpu index of a core/thread
+ * @phys_id: physical identifier of a core/thread
+ *
+ * CPU logical to physical index mapping is architecture specific.
+ * However this __weak function provides a default match of physical
+ * id to logical cpu index. phys_id provided here is usually values read
+ * from the device tree which must match the hardware internal registers.
+ *
+ * Returns true if the physical identifier and the logical cpu index
+ * correspond to the same core/thread, false otherwise.
+ */
+bool __weak arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+	return (u32)phys_id == cpu;
+}
+
+/*
+ * Checks if the given "prop_name" property holds the physical id of the
+ * core/thread corresponding to the logical cpu 'cpu'. If 'thread' is not
+ * NULL, local thread number within the core is returned in it.
+ */
+static bool __of_find_n_match_cpu_property(struct device_node *cpun,
+			const char *prop_name, int cpu, unsigned int *thread)
+{
+	const __be32 *cell;
+	int ac, prop_len, tid;
+	u64 hwid;
+
+	ac = of_n_addr_cells(cpun);
+	cell = of_get_property(cpun, prop_name, &prop_len);
+	if (!cell && !ac && arch_match_cpu_phys_id(cpu, 0))
+		return true;
+	if (!cell || !ac)
+		return false;
+	prop_len /= sizeof(*cell) * ac;
+	for (tid = 0; tid < prop_len; tid++) {
+		hwid = of_read_number(cell, ac);
+		if (arch_match_cpu_phys_id(cpu, hwid)) {
+			if (thread)
+				*thread = tid;
+			return true;
+		}
+		cell += ac;
+	}
+	return false;
+}
+
+/*
+ * arch_find_n_match_cpu_physical_id - See if the given device node is
+ * for the cpu corresponding to logical cpu 'cpu'.  Return true if so,
+ * else false.  If 'thread' is non-NULL, the local thread number within the
+ * core is returned in it.
+ */
+bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
+					      int cpu, unsigned int *thread)
+{
+	/* Check for non-standard "ibm,ppc-interrupt-server#s" property
+	 * for thread ids on PowerPC. If it doesn't exist fallback to
+	 * standard "reg" property.
+	 */
+	if (IS_ENABLED(CONFIG_PPC) &&
+	    __of_find_n_match_cpu_property(cpun,
+					   "ibm,ppc-interrupt-server#s",
+					   cpu, thread))
+		return true;
+
+	return __of_find_n_match_cpu_property(cpun, "reg", cpu, thread);
+}
+
+/**
+ * of_get_cpu_node - Get device node associated with the given logical CPU
+ *
+ * @cpu: CPU number(logical index) for which device node is required
+ * @thread: if not NULL, local thread number within the physical core is
+ *          returned
+ *
+ * The main purpose of this function is to retrieve the device node for the
+ * given logical CPU index. It should be used to initialize the of_node in
+ * cpu device. Once of_node in cpu device is populated, all the further
+ * references can use that instead.
+ *
+ * CPU logical to physical index mapping is architecture specific and is built
+ * before booting secondary cores. This function uses arch_match_cpu_phys_id
+ * which can be overridden by architecture specific implementation.
+ *
+ * Return: A node pointer for the logical cpu with refcount incremented, use
+ * of_node_put() on it when done. Returns NULL if not found.
+ */
+struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
+{
+	struct device_node *cpun;
+
+	for_each_of_cpu_node(cpun) {
+		if (arch_find_n_match_cpu_physical_id(cpun, cpu, thread))
+			return cpun;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL(of_get_cpu_node);
+
+/**
+ * of_cpu_device_node_get: Get the CPU device_node for a given logical CPU number
+ *
+ * @cpu: The logical CPU number
+ *
+ * Return: Pointer to the device_node for CPU with its reference count
+ * incremented of the given logical CPU number or NULL if the CPU device_node
+ * is not found.
+ */
+struct device_node *of_cpu_device_node_get(int cpu)
+{
+	struct device *cpu_dev;
+	cpu_dev = get_cpu_device(cpu);
+	if (!cpu_dev)
+		return of_get_cpu_node(cpu, NULL);
+	return of_node_get(cpu_dev->of_node);
+}
+EXPORT_SYMBOL(of_cpu_device_node_get);
+
+/**
+ * of_cpu_node_to_id: Get the logical CPU number for a given device_node
+ *
+ * @cpu_node: Pointer to the device_node for CPU.
+ *
+ * Return: The logical CPU number of the given CPU device_node or -ENODEV if the
+ * CPU is not found.
+ */
+int of_cpu_node_to_id(struct device_node *cpu_node)
+{
+	int cpu;
+	bool found = false;
+	struct device_node *np;
+
+	for_each_possible_cpu(cpu) {
+		np = of_cpu_device_node_get(cpu);
+		found = (cpu_node == np);
+		of_node_put(np);
+		if (found)
+			return cpu;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL(of_cpu_node_to_id);
+
+/**
+ * of_get_cpu_state_node - Get CPU's idle state node at the given index
+ *
+ * @cpu_node: The device node for the CPU
+ * @index: The index in the list of the idle states
+ *
+ * Two generic methods can be used to describe a CPU's idle states, either via
+ * a flattened description through the "cpu-idle-states" binding or via the
+ * hierarchical layout, using the "power-domains" and the "domain-idle-states"
+ * bindings. This function check for both and returns the idle state node for
+ * the requested index.
+ *
+ * Return: An idle state node if found at @index. The refcount is incremented
+ * for it, so call of_node_put() on it when done. Returns NULL if not found.
+ */
+struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
+					  int index)
+{
+	struct of_phandle_args args;
+	int err;
+
+	err = of_parse_phandle_with_args(cpu_node, "power-domains",
+					"#power-domain-cells", 0, &args);
+	if (!err) {
+		struct device_node *state_node =
+			of_parse_phandle(args.np, "domain-idle-states", index);
+
+		of_node_put(args.np);
+		if (state_node)
+			return state_node;
+	}
+
+	return of_parse_phandle(cpu_node, "cpu-idle-states", index);
+}
+EXPORT_SYMBOL(of_get_cpu_state_node);
diff --git a/include/linux/of.h b/include/linux/of.h
index b7118d68c73a..1f1e847a1c13 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -359,6 +359,8 @@ extern const void *of_get_property(const struct device_node *node,
 				const char *name,
 				int *lenp);
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
+extern struct device_node *of_cpu_device_node_get(int cpu);
+extern int of_cpu_node_to_id(struct device_node *np);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(struct device_node *cpu_node,
 						 int index);
@@ -439,8 +441,6 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 
 bool of_console_check(struct device_node *dn, char *name, int index);
 
-extern int of_cpu_node_to_id(struct device_node *np);
-
 int of_map_id(struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
@@ -635,6 +635,16 @@ static inline struct device_node *of_get_cpu_node(int cpu,
 	return NULL;
 }
 
+static inline struct device_node *of_cpu_device_node_get(int cpu)
+{
+	return NULL;
+}
+
+static inline int of_cpu_node_to_id(struct device_node *np)
+{
+	return -ENODEV;
+}
+
 static inline struct device_node *of_get_next_cpu_node(struct device_node *prev)
 {
 	return NULL;
@@ -837,11 +847,6 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 {
 }
 
-static inline int of_cpu_node_to_id(struct device_node *np)
-{
-	return -ENODEV;
-}
-
 static inline int of_map_id(struct device_node *np, u32 id,
 			     const char *map_name, const char *map_mask_name,
 			     struct device_node **target, u32 *id_out)
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 6af4c3acd502..910951a22eb4 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -32,15 +32,6 @@ extern int of_device_request_module(struct device *dev);
 extern void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
 
-static inline struct device_node *of_cpu_device_node_get(int cpu)
-{
-	struct device *cpu_dev;
-	cpu_dev = get_cpu_device(cpu);
-	if (!cpu_dev)
-		return of_get_cpu_node(cpu, NULL);
-	return of_node_get(cpu_dev->of_node);
-}
-
 int of_dma_configure_id(struct device *dev,
 		     struct device_node *np,
 		     bool force_dma, const u32 *id);
@@ -89,11 +80,6 @@ static inline const struct of_device_id *of_match_device(
 	return NULL;
 }
 
-static inline struct device_node *of_cpu_device_node_get(int cpu)
-{
-	return NULL;
-}
-
 static inline int of_dma_configure_id(struct device *dev,
 				      struct device_node *np,
 				      bool force_dma,

-- 
2.39.2

