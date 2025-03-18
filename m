Return-Path: <linuxppc-dev+bounces-7190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A542BA67CFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 20:23:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHMFT3n59z2ySd;
	Wed, 19 Mar 2025 06:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742325805;
	cv=none; b=nOZvOy44vXvQo4OEftDemWXoQVjKGdAiRPQXebfglwldHai7P5+M5U1S8tbV0/zGmvs+jF7eJivzvZoqaeExlZ0MAkGUheXgoQSAdPeQK5zf8DPmVZmeky4wdB9NpFWSb2ALE2t83acSxC6HHywxJSEwRcOqRNFpbPfvFdkoN0T7WKkQlPKyaVWmkKgpwmsWj/KJhvvW3OH7hkq9pNPUHO0Jb1p3rWj1//3JCkp/R91OFUitHpreJfhuttLdGF5kcYMePSMr5FHg6dKVsv3Eja/vlobky/b/OJ6R/lftHA2vWet0XFtNWwpNUNOZAV5KdsJwcQun62DDfsJlnfLVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742325805; c=relaxed/relaxed;
	bh=onsym4uhTiJ1273lzFjzkcYkiTpHZzwHzu2+YvG0vNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TaT+DhaMkjKi+r6Ddh/49tohaLCmqZCizFf1Zt/VM8POcp6RPYMsJuJn/DBffZ2aMqZP5Z5ONXbKYPs0NY5X8zU8wnlyaBxuSo2hRfXmmAUndx/O7mmellZD4j1eLSVh7zSzWP6HyubLeEjPw7mr+0GGZsISGt3jP8ACWlHKx3qewTj9lvNqS8mkrLasTIxFebyxdbl2xG2N8cotbP6vrsIE54aEy8vXlVTPl89GvamtCjfKuXFlX+c4MIFmQDw1vnJQQQBWmSNiBlce7lodH8VSZdartKO/JRl2V6z30qHmJYGZ0FjMQQ5AaOhC948EbX0Mn+03JQuqnmW1mTkp5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C0f245C8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C0f245C8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHMFS4hCmz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 06:23:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60E855C56CE;
	Tue, 18 Mar 2025 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA05FC4CEEE;
	Tue, 18 Mar 2025 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742325802;
	bh=rR5kl4eYsl4yRHFKGBdxMy3aCSYWtkBlbYl5vE39f+I=;
	h=From:To:Cc:Subject:Date:From;
	b=C0f245C8CdxaBXW2HBxXnQRVBW0+9L1AxH82XadnPtOCQr0I50qAV+ZqqZ63ATK5K
	 qUZesaVHxFStJam+u7qSzjTDkfalASqIhBsw1cEbYHHfizgpsKJddrJGNTNIgMKrJP
	 pkn8sDzhaMXT79gWbWzblUd5hIcdIlnXFvjJS3PO84lLUwvTzOiZVKTArHcQYmDwoJ
	 jkTDhbF09IXjSIY+aenWVw+eEPYMmyze2S1tqdMaHtONSi9yhUX5sADOKTQ1vx2Uxz
	 hgZRsCYpeuHv0yVf52X3Y/uzhd6KVw2WpmnKYmFHrcDMhDNIa9sbBaudgXX+OT+0gY
	 P2eXxR1jvdU8A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/prom_init: Fixup missing powermac #size-cells on i2s nodes
Date: Tue, 18 Mar 2025 14:22:55 -0500
Message-ID: <20250318192256.3534046-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On some powermacs `i2s` nodes are missing `#size-cells` properties,
which is deprecated and now triggers a warning at boot since commit
045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells
handling").

For example:

  Missing '#size-cells' in /pci@f2000000/mac-io@17/i2s@10000
  WARNING: CPU: 0 PID: 462 at drivers/of/base.c:134 of_bus_n_size_cells+0xb0/0x120
  Hardware name: PowerMac3,4 7400 0xc0209 PowerMac
  ...
  Call Trace:
    of_bus_n_size_cells+0xb0/0x120 (unreliable)
    of_bus_default_count_cells+0x40/0x60
    __of_get_address+0x158/0x294
    __of_address_to_resource+0x48/0x258
    i2sbus_probe+0x564/0x85c [snd_aoa_i2sbus]
    macio_device_probe+0x60/0x108
    really_probe+0xd8/0x344
    __driver_probe_device+0x90/0x1f0
    driver_probe_device+0x40/0xf4
    ...

As there's already a fixup for the same issue on `escc` nodes, add
`i2s` device_type to the existing fixup.

Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 57082fac4668..69018a2afc41 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2889,11 +2889,11 @@ static void __init fixup_device_tree_pmac(void)
 	char type[8];
 	phandle node;
 
-	// Some pmacs are missing #size-cells on escc nodes
+	// Some pmacs are missing #size-cells on escc and i2s nodes
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = '\0';
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "escc"))
+		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
 			continue;
 
 		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
-- 
2.47.2


