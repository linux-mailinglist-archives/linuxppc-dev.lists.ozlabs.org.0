Return-Path: <linuxppc-dev+bounces-2207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0099C776
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:48:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRv8q52ZQz3bpd;
	Mon, 14 Oct 2024 21:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728902907;
	cv=none; b=molUnonOG2fAglBBFjFz+FtAJABeN8BPkXFssJEavCmC05vnQj481REJvkGPKsMkFlOQDAQ42BP9qIKvvx3qYtirWrk8vDJr265ZYx98mZAzc39r1RFMRvJNSjae85c6V4RwgBtJ1V1NDRBKCBtZ2NxdpaKftHuFAll6FsqXCTHzT+L4CF/fwaqV3FYWTEsCSnsrwyPA30pzVTur7ilJKco6rJnAVbsTL63wNldb/V0JmX5ozD63QQBbftiCNA+Dw26f1kfyxgTNzqkgBSPsNSBoDH5jkv+xfPKb4P//hc7cxSKuChBqXvPsjIFijyqlgn1r/1PcARKMULe0j4TK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728902907; c=relaxed/relaxed;
	bh=AcyEmMVdok+bxnRfwBDJnt6eM4ncRn5lIt6hsSMfQtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUP9PAX+K71GTK73iiBCNnGT8DZZTIYi+HBnVeQW//j7bhtdsEeBPb81Z97Sh7F5FfwMhtGHgtZ2eOpoXpcUcs3aFGqptSR2Km++ZwV2V6lj1szWiXIo60vsIJEzfaKBydvEkHPzhd7IzWvSBpx9NLPqrrgPTVv8JdWcLF6jScLP2PWVzRAUvXaCanywzq+o2eB4vmH5MSUPOpcYJEsBnC0VTqe10fhihbtjsQ0P9TN/tC31btq/EEVYuTTXZTRgqqz5xJXPxutYYnmsJa+edDo+tAUkxpqGKp8UpxTWbsgaYh07PDRCIbAC49FSiZVXC7gC/KncNbUppoS3SERRfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VkKjUHZS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VkKjUHZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRv8p5mLZz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:48:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9109A419DC;
	Mon, 14 Oct 2024 10:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D82C4CED0;
	Mon, 14 Oct 2024 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728902902;
	bh=/OCNlnab7LfsKEO2VBkimOwewUj/x1P/69LUtdzV8g0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VkKjUHZS/u3NFSC9JvmfosumUNe8X8td95QU+p4SCOlUVIjq/MGZ25TnjcI8mOF46
	 0+JxRa6Cq5BPpi06vQDSt8huggXNk/227rTcUmA9JZF8vBBwNdoNZPvVvCBxVOxo8K
	 pTAH3thq1hkoOHL5q8lWqhOiiL9iYwckwBqFtrWGvSDoMfuRXZVy2OXAi7744tt5Eg
	 zrYXjKOLrqxGc27zGvR25rfzYZd5gZeJTsOFkAivCBSM7UYUdonZ5HzsZI8xcxfd1F
	 wP42Wa9rnL1c8en/4CZlIKv4Biuvme3qznuyVFEeWnK+N/Pfnjp5Rd5fAZr0P7kXcC
	 DWpYw7MPrEPOw==
From: Simon Horman <horms@kernel.org>
Date: Mon, 14 Oct 2024 11:48:07 +0100
Subject: [PATCH 1/2] net: fec_mpc52xx_phy: Use %pa to format
 resource_size_t
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-net-pa-fmt-v1-1-dcc9afb8858b@kernel.org>
References: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
In-Reply-To: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.14.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The correct format string for resource_size_t is %pa which
acts on the address of the variable to be formatted [1].

[1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229

Introduced by commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")

Flagged by gcc-14 as:

drivers/net/ethernet/freescale/fec_mpc52xx_phy.c: In function 'mpc52xx_fec_mdio_probe':
drivers/net/ethernet/freescale/fec_mpc52xx_phy.c:97:46: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
   97 |         snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
      |                                             ~^   ~~~~~~~~~
      |                                              |      |
      |                                              |      resource_size_t {aka long long unsigned int}
      |                                              unsigned int
      |                                             %llx

No functional change intended.
Compile tested only.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index 2c37004bb0fe..3d073f0fae63 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -94,7 +94,7 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 		goto out_free;
 	}
 
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
 	bus->priv = priv;
 
 	bus->parent = dev;

-- 
2.45.2


