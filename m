Return-Path: <linuxppc-dev+bounces-9283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508FAD50C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 12:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHLpD3xZVz307V;
	Wed, 11 Jun 2025 20:03:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749636212;
	cv=none; b=QxQ8jOiPDtTjiCVwPm1hDQ0VlPQ2lypMl7EHjMWoi7kkeDwY3bFCOkkiCAPIikH30+ASM+Hl3LW7xy8arFjzLj1zo53/MgyhtbPJcS1NIPz7Q2w2hInzJolxR3jtZql8IluEZ08Dj760i71iVG3GLYFuUZDCBeLDNot8gNna8aqkOGmOj2N95Gb3Fu7ulTwMHrYxHO7zkRbZoW4TNu7atq5FjWiYaq99OjAaFl0WgiPNhC2hcuVQ180WuKQxU2NE7et/gbc8mHqj5eoDcZIV+qXD07Q/hiyA+ualYyaiqrYJLLv41hOrfboyK0vOH0862TeV0pouPX+m1SRbhdccxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749636212; c=relaxed/relaxed;
	bh=MnV6WzyNRkhXJvHBqyKabTjSjGqXI64BfPmouK4UWrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHD4XMmRZwPAEuGZ9Za7KdBTGEk+BrZ6grKE4ERgRY3a6DwsBL8+0HErpGFYat3i4lMWRdFWHZsjQv/CcwYQaXy71TNg7ZeajdOdBxQSJYi0SzyYIqQjry3FsJYpeo6ezYzUA11yRVd1BwUapUvSL3i8kl0fWKHf7qqQpk8oMf53/VoOIDPCFGYC1IDdrnWwpJodWvAzKq+dB/4oLcMT3qsRlgBXM5s8n/6yrFEW+ieRb3Y+qzLd80D0jvXICVYbgOKXifKoB2G5hnW3JnFtXfGzXVK4BAbvttfDFVW+kfgYaTtEZ9oDKS51oMgsf3wp4JKTtJRHREmIx2CKV/5v7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfgyq3tc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfgyq3tc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHLpC3MDpz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 20:03:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65B01A51609;
	Wed, 11 Jun 2025 10:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19293C4CEF5;
	Wed, 11 Jun 2025 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749636209;
	bh=8bnFg7Ex1c31Wg8ZGfwLvn1m/DM1vD49g1g+c7qmqE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfgyq3tczjfCxpExT7x4sCS2GTkABalaCVdcqQW2DYDoWoLPGVpvmAbLHZwZh7kye
	 Q+km2FU/OK951dY5/AobofzeH1DR1H52TR/vJs4yaCvod/K7io9IlMom970gOaP4lq
	 HDVquE2oKLHj7taHe+S2EjUKCc44HiAKq9XF4H/u7jcCURN0oTMaHv3D0MLgdWs7Hq
	 UMoSztVaQPk3xRXeQL1NjWzGVGypSVRfRHL6uExX/LqU5wPqhH+7typ8d6ThDjMnFC
	 Llk1oy7xE4FbxT1NgdJYE20McAHnWNOUQJN+BoedB2vMU5BiImvnnTebP7Ih6QtMxU
	 buXjjXwmjgi3Q==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/33] powerpc/legacy_serial: cache serial port and info in add_legacy_port()
Date: Wed, 11 Jun 2025 12:02:48 +0200
Message-ID: <20250611100319.186924-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611100319.186924-1-jirislaby@kernel.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Caching the port and info in local variables makes the code more compact
and easier to understand.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/legacy_serial.c | 52 ++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index 1da2f6e7d2a1..d9080189c28c 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -77,6 +77,8 @@ static int __init add_legacy_port(struct device_node *np, int want_index,
 				  phys_addr_t taddr, unsigned long irq,
 				  upf_t flags, int irq_check_parent)
 {
+	struct plat_serial8250_port *legacy_port;
+	struct legacy_serial_info *legacy_info;
 	const __be32 *clk, *spd, *rs;
 	u32 clock = BASE_BAUD * 16;
 	u32 shift = 0;
@@ -110,16 +112,17 @@ static int __init add_legacy_port(struct device_node *np, int want_index,
 	if (index >= legacy_serial_count)
 		legacy_serial_count = index + 1;
 
+	legacy_port = &legacy_serial_ports[index];
+	legacy_info = &legacy_serial_infos[index];
+
 	/* Check if there is a port who already claimed our slot */
-	if (legacy_serial_infos[index].np != NULL) {
+	if (legacy_info->np != NULL) {
 		/* if we still have some room, move it, else override */
 		if (legacy_serial_count < MAX_LEGACY_SERIAL_PORTS) {
 			printk(KERN_DEBUG "Moved legacy port %d -> %d\n",
 			       index, legacy_serial_count);
-			legacy_serial_ports[legacy_serial_count] =
-				legacy_serial_ports[index];
-			legacy_serial_infos[legacy_serial_count] =
-				legacy_serial_infos[index];
+			legacy_serial_ports[legacy_serial_count] = *legacy_port;
+			legacy_serial_infos[legacy_serial_count] = *legacy_info;
 			legacy_serial_count++;
 		} else {
 			printk(KERN_DEBUG "Replacing legacy port %d\n", index);
@@ -127,36 +130,33 @@ static int __init add_legacy_port(struct device_node *np, int want_index,
 	}
 
 	/* Now fill the entry */
-	memset(&legacy_serial_ports[index], 0,
-	       sizeof(struct plat_serial8250_port));
+	memset(legacy_port, 0, sizeof(*legacy_port));
 	if (iotype == UPIO_PORT)
-		legacy_serial_ports[index].iobase = base;
+		legacy_port->iobase = base;
 	else
-		legacy_serial_ports[index].mapbase = base;
-
-	legacy_serial_ports[index].iotype = iotype;
-	legacy_serial_ports[index].uartclk = clock;
-	legacy_serial_ports[index].irq = irq;
-	legacy_serial_ports[index].flags = flags;
-	legacy_serial_ports[index].regshift = shift;
-	legacy_serial_infos[index].taddr = taddr;
-	legacy_serial_infos[index].np = of_node_get(np);
-	legacy_serial_infos[index].clock = clock;
-	legacy_serial_infos[index].speed = spd ? be32_to_cpup(spd) : 0;
-	legacy_serial_infos[index].irq_check_parent = irq_check_parent;
+		legacy_port->mapbase = base;
+
+	legacy_port->iotype = iotype;
+	legacy_port->uartclk = clock;
+	legacy_port->irq = irq;
+	legacy_port->flags = flags;
+	legacy_port->regshift = shift;
+	legacy_info->taddr = taddr;
+	legacy_info->np = of_node_get(np);
+	legacy_info->clock = clock;
+	legacy_info->speed = spd ? be32_to_cpup(spd) : 0;
+	legacy_info->irq_check_parent = irq_check_parent;
 
 	if (iotype == UPIO_TSI) {
-		legacy_serial_ports[index].serial_in = tsi_serial_in;
-		legacy_serial_ports[index].serial_out = tsi_serial_out;
+		legacy_port->serial_in = tsi_serial_in;
+		legacy_port->serial_out = tsi_serial_out;
 	}
 
-	printk(KERN_DEBUG "Found legacy serial port %d for %pOF\n",
-	       index, np);
+	printk(KERN_DEBUG "Found legacy serial port %d for %pOF\n", index, np);
 	printk(KERN_DEBUG "  %s=%llx, taddr=%llx, irq=%lx, clk=%d, speed=%d\n",
 	       (iotype == UPIO_PORT) ? "port" : "mem",
 	       (unsigned long long)base, (unsigned long long)taddr, irq,
-	       legacy_serial_ports[index].uartclk,
-	       legacy_serial_infos[index].speed);
+	       legacy_port->uartclk, legacy_info->speed);
 
 	return index;
 }
-- 
2.49.0


