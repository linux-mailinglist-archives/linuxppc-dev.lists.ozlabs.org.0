Return-Path: <linuxppc-dev+bounces-4970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E82A08DB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 11:18:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTyKw0PTtz3cVJ;
	Fri, 10 Jan 2025 21:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736504323;
	cv=none; b=cKP+ZfgbKu2gYI/d7vFPw7BP5sUDGmj/tV57/mHLEBZKZ1WO41NwpHdW/equS8axHeDOAK2/ZgbjEUvwz4eV1yExlVSU2gl2XMmMSuDD9bNUqIG1tKGgzGY/aeS3oavbGN4JgSzC5RTgiTC9XFKrD55OvPTxQkW6aVD3P1sVqxYBIf/uGRJ8ss4Syasc+/3WlhE+fKKWmI5FbiUglXMad8L2jnjvCesruLnlhUmkavMUdAaXGD8Zb5iu/FOcVKkwdX+JeD4j8eDEnRLsYok6dcghn+ZR56knTg0TmOrY+2ZlVj5lWG3Cr4oVJp8hkFBBoNb3sPZTQYoOmPTpV4xcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736504323; c=relaxed/relaxed;
	bh=Ym/S4x4Djlh78akW6SZhQvGN79woy4U3f1W9nA8zAAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GRI+aTbT4iUG51DoOFMAXFg4tV1eDqIu3CzEwo6VilW40xoQ+NvF5KWsY4JdE3exYrTFrPeUc7MJbg8BQp1DKNtZjTDKVHjCaG472T20p7/cROnXXoqdpOdNWbz7LymN2RATX73Tat3TQ0Ic087ZlrIiPKfrp5p7b3HOhnuhSPCggVXv1+Ni1OZ4L9+J7bu/TTPcKtKCd+EA78Q4zlvms8HKSP2N5av6zTF5H+qzSTsxZuUcZEla3pdQ7eGkUIoux/IPL4Dbfn1XGUY/rtXyB9lnKXfeA6qYnEP71nDbCo2xVLZkDUiOdJRWTc+wZr9MJbsJo3qUR0Hj0OfOKcylQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ighEh0r9; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ighEh0r9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTyKr1yq8z2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:18:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B36575C5E80;
	Fri, 10 Jan 2025 10:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0236AC4CED6;
	Fri, 10 Jan 2025 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736504317;
	bh=oKlq476fY9QM/OujOfwpqryzpqHCumE+M3ptAU9F1uM=;
	h=From:Date:Subject:To:Cc:From;
	b=ighEh0r9RCenwY5oVRkBESBSyg2uDQ7vER54rOH8yoUZV44AdsvHYIL1VZ/dQNEox
	 udfiIztFH/6OwsTjL8O28Y5p55G7ptEBOALldhh4k2flxHpCUwZNUV6kk9TwMN3NX3
	 gDoE61mYLDynVPGn+z36fuJ0SyqHoDEGv26H4LtBi8MlirpTtRntSq+B+onrhriRSl
	 pJ8tWejCVztm6d7ntMpSVSU1vLxNFz6uP9rOEIuaOIJIuxDtk18vqUy4Mm06GtsQ3G
	 2ql+GBVQfTjglmD9NISkf7ixH7TGU1Ik/NNGXOAg2jtn9QHt4yW4KCKVMBCdzr0KiU
	 FNGcxsD1WPfSQ==
From: Simon Horman <horms@kernel.org>
Date: Fri, 10 Jan 2025 10:18:33 +0000
Subject: [PATCH net-next] freescale: ucc_geth: Remove set but unused
 variables
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ucc-unused-var-v1-1-4cf02475b21d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPjzgGcC/x2MzQqDMBAGX0X23IWsQWh8FelB4le7l23JjwiSd
 zf0OAwzF2UkRaZ5uCjh0Kxf6yCPgeJntR2sW2ca3Tg5Ecc1Rq5WMzY+1sTh2YWIR/CeevRLeOv
 5Hy5kKGw4C71auwELOsi/agAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.14.0
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove set but unused variables. These seem to provide no value.
So in the spirit of less being more, remove them.

Flagged by gcc-14 as:

.../ucc_geth.c: In function 'ucc_geth_free_rx':
.../ucc_geth.c:1708:31: warning: variable 'uf_info' set but not used [-Wunused-but-set-variable]
 1708 |         struct ucc_fast_info *uf_info;
      |                               ^~~~~~~
.../ucc_geth.c: In function 'ucc_geth_free_tx':
.../ucc_geth.c:1747:31: warning: variable 'uf_info' set but not used [-Wunused-but-set-variable]
 1747 |         struct ucc_fast_info *uf_info;
      |                               ^~~~~~~
.../ucc_geth.c: In function 'ucc_geth_alloc_tx':
.../ucc_geth.c:2039:31: warning: variable 'uf_info' set but not used [-Wunused-but-set-variable]
 2039 |         struct ucc_fast_info *uf_info;
      |                               ^~~~~~~
.../ucc_geth.c: In function 'ucc_geth_alloc_rx':
.../ucc_geth.c:2101:31: warning: variable 'uf_info' set but not used [-Wunused-but-set-variable]
 2101 |         struct ucc_fast_info *uf_info;
      |                               ^~~~~~~
.../ucc_geth.c: In function 'ucc_geth_startup':
.../ucc_geth.c:2168:13: warning: variable 'ifstat' set but not used [-Wunused-but-set-variable]
 2168 |         u32 ifstat, i, j, size, l2qt, l3qt;
      |             ^~~~~~
.../ucc_geth.c:2158:62: warning: variable 'p_82xx_addr_filt' set but not used [-Wunused-but-set-variable]
 2158 |         struct ucc_geth_82xx_address_filtering_pram __iomem *p_82xx_addr_filt;
      |                                                              ^~~~~~~~~~~~~~~~
.../ucc_geth.c: In function 'ucc_geth_rx':
.../ucc_geth.c:2893:13: warning: variable 'bdBuffer' set but not used [-Wunused-but-set-variable]
 2893 |         u8 *bdBuffer;
      |             ^~~~~~~~
.../ucc_geth.c: In function 'ucc_geth_irq_handler':
.../ucc_geth.c:3046:31: warning: variable 'ug_info' set but not used [-Wunused-but-set-variable]
 3046 |         struct ucc_geth_info *ug_info;
      |                               ^~~~~~~

Compile tested only.
No runtime effect intended.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 39 +++++++------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 88510f822759..1e3a1cb997c3 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1704,14 +1704,8 @@ static int ugeth_82xx_filtering_clear_addr_in_paddr(struct ucc_geth_private *uge
 
 static void ucc_geth_free_rx(struct ucc_geth_private *ugeth)
 {
-	struct ucc_geth_info *ug_info;
-	struct ucc_fast_info *uf_info;
-	u16 i, j;
 	u8 __iomem *bd;
-
-
-	ug_info = ugeth->ug_info;
-	uf_info = &ug_info->uf_info;
+	u16 i, j;
 
 	for (i = 0; i < ucc_geth_rx_queues(ugeth->ug_info); i++) {
 		if (ugeth->p_rx_bd_ring[i]) {
@@ -1743,16 +1737,11 @@ static void ucc_geth_free_rx(struct ucc_geth_private *ugeth)
 
 static void ucc_geth_free_tx(struct ucc_geth_private *ugeth)
 {
-	struct ucc_geth_info *ug_info;
-	struct ucc_fast_info *uf_info;
-	u16 i, j;
 	u8 __iomem *bd;
+	u16 i, j;
 
 	netdev_reset_queue(ugeth->ndev);
 
-	ug_info = ugeth->ug_info;
-	uf_info = &ug_info->uf_info;
-
 	for (i = 0; i < ucc_geth_tx_queues(ugeth->ug_info); i++) {
 		bd = ugeth->p_tx_bd_ring[i];
 		if (!bd)
@@ -2036,13 +2025,11 @@ static int ucc_struct_init(struct ucc_geth_private *ugeth)
 static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth_info *ug_info;
-	struct ucc_fast_info *uf_info;
+	u8 __iomem *bd;
 	int length;
 	u16 i, j;
-	u8 __iomem *bd;
 
 	ug_info = ugeth->ug_info;
-	uf_info = &ug_info->uf_info;
 
 	/* Allocate Tx bds */
 	for (j = 0; j < ucc_geth_tx_queues(ug_info); j++) {
@@ -2098,13 +2085,11 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
 static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth_info *ug_info;
-	struct ucc_fast_info *uf_info;
+	u8 __iomem *bd;
 	int length;
 	u16 i, j;
-	u8 __iomem *bd;
 
 	ug_info = ugeth->ug_info;
-	uf_info = &ug_info->uf_info;
 
 	/* Allocate Rx bds */
 	for (j = 0; j < ucc_geth_rx_queues(ug_info); j++) {
@@ -2155,7 +2140,6 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
 
 static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 {
-	struct ucc_geth_82xx_address_filtering_pram __iomem *p_82xx_addr_filt;
 	struct ucc_geth_init_pram __iomem *p_init_enet_pram;
 	struct ucc_fast_private *uccf;
 	struct ucc_geth_info *ug_info;
@@ -2165,8 +2149,8 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	int ret_val = -EINVAL;
 	u32 remoder = UCC_GETH_REMODER_INIT;
 	u32 init_enet_pram_offset, cecr_subblock, command;
-	u32 ifstat, i, j, size, l2qt, l3qt;
 	u16 temoder = UCC_GETH_TEMODER_INIT;
+	u32 i, j, size, l2qt, l3qt;
 	u8 function_code = 0;
 	u8 __iomem *endOfRing;
 	u8 numThreadsRxNumerical, numThreadsTxNumerical;
@@ -2260,7 +2244,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 	/*                    Set IFSTAT                     */
 	/* For more details see the hardware spec.           */
 	/* Read only - resets upon read                      */
-	ifstat = in_be32(&ug_regs->ifstat);
+	in_be32(&ug_regs->ifstat);
 
 	/*                    Clear UEMPR                    */
 	/* For more details see the hardware spec.           */
@@ -2651,10 +2635,6 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 		for (j = 0; j < NUM_OF_PADDRS; j++)
 			ugeth_82xx_filtering_clear_addr_in_paddr(ugeth, (u8) j);
 
-		p_82xx_addr_filt =
-		    (struct ucc_geth_82xx_address_filtering_pram __iomem *) ugeth->
-		    p_rx_glbl_pram->addressfiltering;
-
 		ugeth_82xx_filtering_clear_all_addr_in_hash(ugeth,
 			ENET_ADDR_TYPE_GROUP);
 		ugeth_82xx_filtering_clear_all_addr_in_hash(ugeth,
@@ -2889,9 +2869,8 @@ static int ucc_geth_rx(struct ucc_geth_private *ugeth, u8 rxQ, int rx_work_limit
 	struct sk_buff *skb;
 	u8 __iomem *bd;
 	u16 length, howmany = 0;
-	u32 bd_status;
-	u8 *bdBuffer;
 	struct net_device *dev;
+	u32 bd_status;
 
 	ugeth_vdbg("%s: IN", __func__);
 
@@ -2904,7 +2883,7 @@ static int ucc_geth_rx(struct ucc_geth_private *ugeth, u8 rxQ, int rx_work_limit
 
 	/* while there are received buffers and BD is full (~R_E) */
 	while (!((bd_status & (R_E)) || (--rx_work_limit < 0))) {
-		bdBuffer = (u8 *) in_be32(&((struct qe_bd __iomem *)bd)->buf);
+		in_be32(&((struct qe_bd __iomem *)bd)->buf);
 		length = (u16) ((bd_status & BD_LENGTH_MASK) - 4);
 		skb = ugeth->rx_skbuff[rxQ][ugeth->skb_currx[rxQ]];
 
@@ -3043,14 +3022,12 @@ static irqreturn_t ucc_geth_irq_handler(int irq, void *info)
 	struct net_device *dev = info;
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
 	struct ucc_fast_private *uccf;
-	struct ucc_geth_info *ug_info;
 	register u32 ucce;
 	register u32 uccm;
 
 	ugeth_vdbg("%s: IN", __func__);
 
 	uccf = ugeth->uccf;
-	ug_info = ugeth->ug_info;
 
 	/* read and clear events */
 	ucce = (u32) in_be32(uccf->p_ucce);


