Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DA831C85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 16:29:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDBdwisn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG69z1ttzz3cSH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pDBdwisn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG65Q556Fz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:25:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A38FCE1FE9;
	Thu, 18 Jan 2024 15:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38468C433A6;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705591542;
	bh=loaLhqGDhJWXtcsUXFBqm/6Nnc30eNcrN719EvZDEF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pDBdwisnWTJWdSizVqn8gGCbn7LTVoeGfXEaWx+rYB2ELXojCW/UhSdoM03OITk2N
	 V5leDhhgvX3r5nMaAs2QQauxCFIth/tKExfEEJZ4ZmctTHaHAXVlZg8oI65z7zJuCJ
	 by7Y7PFSrbOKb0zeZqZScClsxFW4Vf7ralolLy8rQfhhhcoJ/kQetkpVKFbmTJcHSA
	 rv9zq96ICpHm8Qz7iGcHXGRa0xEf9DwxYjRwLsNLVT7ipcFJrqfgVcGVB/Tdu+D33m
	 voFfx8sUvZf6mveAbYOsrKP5I2io2jVZ+yClR8IvLJHqjJ74pYY5NgHCiAmMeUFfiX
	 zgqHewOd7+SFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2532CC47DD6;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 18 Jan 2024 09:25:16 -0600
Subject: [PATCH RFC 5/5] powerpc/pseries: Update hardware description
 string after migration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240118-update-dump-stack-arch-str-v1-5-5c0f98d017b5@linux.ibm.com>
References:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
In-Reply-To:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Brian King <brking@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 John Ogness <john.ogness@linutronix.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Petr Mladek <pmladek@suse.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705591541; l=4664;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=yLmHE9ThZlzMbb6aloXvN4gTgnWJfDyfG66G809WhB4=;
 b=Q+37SjK8zZS4Tun8c+TodJT0/xdTHbgWsnBNDyyUECvL05LqqXalJJi38TeuCBXrRQu3g/dT8
 C/f58x/aq0iDCDQFi4PKjSRId3cA59UKDsExSucwkOSohtWaW/rYYO6
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Introduce code that rebuilds the short hardware description printed by
stack traces. This sort of duplicates some code from boot (prom.c
mainly), but that code populates the string as early as possible using
APIs that aren't available later. So sharing all the code between the
boot and runtime versions isn't feasible.

To prevent "drift" between the boot and runtime versions, rebuild the
description using the new runtime APIs in a late initcall and warn if
it doesn't match the one built earlier. The initcall also invokes
dump_stack_update_arch_desc() twice to fully exercise it before any
partition migration occurs. These checks could be dropped or made
configurable later.

Call pseries_update_hw_description() immediately after updating the
device tree when resuming from a partition migration.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c |  5 +++
 arch/powerpc/platforms/pseries/pseries.h  |  1 +
 arch/powerpc/platforms/pseries/setup.c    | 70 +++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 1798f0f14d58..ff573cb5aee5 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -378,6 +378,11 @@ void post_mobility_fixup(void)
 	rc = pseries_devicetree_update(MIGRATION_SCOPE);
 	if (rc)
 		pr_err("device tree update failed: %d\n", rc);
+	/*
+	 * Rebuild the hardware description printed in stack traces
+	 * using the updated device tree.
+	 */
+	pseries_update_hw_description();
 
 	cacheinfo_rebuild();
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index bba4ad192b0f..810a64fccc7e 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -56,6 +56,7 @@ extern int dlpar_acquire_drc(u32 drc_index);
 extern int dlpar_release_drc(u32 drc_index);
 extern int dlpar_unisolate_drc(u32 drc_index);
 extern void post_mobility_fixup(void);
+void pseries_update_hw_description(void);
 
 void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 9ae1951f8312..72177411026e 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1034,6 +1034,76 @@ static void pseries_add_hw_description(struct seq_buf *sb)
 		seq_buf_printf(sb, "hv:phyp ");
 }
 
+static void pseries_rebuild_hw_desc(struct seq_buf *sb)
+{
+	struct device_node *cpudn, *root;
+	const char *model;
+	u32 cpu_version;
+
+	seq_buf_clear(sb);
+
+	root = of_find_node_by_path("/");
+	if (!of_property_read_string(root, "model", &model))
+		seq_buf_printf(sb, "%s ", model);
+	of_node_put(root);
+
+	seq_buf_printf(sb, "%s 0x%04lx ", cur_cpu_spec->cpu_name, mfspr(SPRN_PVR));
+
+	cpudn = of_get_next_cpu_node(NULL);
+	if (!of_property_read_u32(cpudn, "cpu-version", &cpu_version)) {
+		if ((cpu_version & 0xff000000) == 0x0f000000)
+			seq_buf_printf(sb, "0x%04x ", cpu_version);
+	}
+	of_node_put(cpudn);
+
+	pseries_add_hw_description(sb);
+
+	seq_buf_puts(sb, ppc_md.name);
+}
+
+void pseries_update_hw_description(void)
+{
+	struct seq_buf sb = { // todo: use DECLARE_SEQ_BUF() once it's fixed
+		.buffer = (char[128]) { 0 },
+		.size = sizeof(char[128]),
+	};
+
+	pseries_rebuild_hw_desc(&sb);
+	dump_stack_update_arch_desc("%s", seq_buf_str(&sb));
+}
+
+static int __init pseries_test_update_hw_desc(void)
+{
+	struct seq_buf sb = { // todo: use DECLARE_SEQ_BUF() once it's fixed
+		.buffer = (char[128]) { 0 },
+		.size = sizeof(char[128]),
+	};
+	bool mismatch;
+
+	/*
+	 * Ensure the rebuilt description matches the one built during
+	 * boot.
+	 */
+	pseries_rebuild_hw_desc(&sb);
+
+	mismatch = strcmp(seq_buf_str(&ppc_hw_desc), seq_buf_str(&sb));
+	if (WARN(mismatch, "rebuilt hardware description string mismatch")) {
+		pr_err("  boot:    '%s'\n", ppc_hw_desc.buffer);
+		pr_err("  runtime: '%s'\n", sb.buffer);
+		return -EINVAL;
+	}
+
+	/*
+	 * Invoke dump_stack_update_arch_desc() *twice* to ensure it
+	 * exercises the free path.
+	 */
+	dump_stack_update_arch_desc("%s", sb.buffer);
+	dump_stack_update_arch_desc("%s", sb.buffer);
+
+	return 0;
+}
+late_initcall(pseries_test_update_hw_desc);
+
 /*
  * Early initialization.  Relocation is on but do not reference unbolted pages
  */

-- 
2.43.0

