Return-Path: <linuxppc-dev+bounces-3130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE09C669F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 02:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp5Bl2RgHz2yNn;
	Wed, 13 Nov 2024 12:23:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731460991;
	cv=none; b=eAU0ZkSFlQ/Y5REVKxJCUIJELGYPIh/y1GyPl0qlEQKnamEdEkSmg9wtwY29pQfUQrRisl/OIY0WbWlqjE+/gKsiIQT+qrLAxHZ1tgSzAWZ03ogoyTVD5NKjtzhXz3qd00IuD1wpORfhcagiXrbcicuUx2pFqJ/Lv1Iaye9RKvUijPuAr8QAI1LLZ7dpsEdkVR8HR7fOYufrBd1S+CSS8AEtNfFgzoepzN6eSpTg6Qz9erSkCa1LB3Bw6meY1gWIW1sE7GLjbWbE3HTmU95XGQxLx2l5MsJEjH1jx07wSzHeX07QfFp8xdmEtdFdhItOzlpa9bsLLFS2ImG/WFaF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731460991; c=relaxed/relaxed;
	bh=6mHStR/VLKKz3Mn0zc0mAE1DUmttzZaGs19RiSFxzuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1jbYrMw8/XquZ5KtV+BCFxS5gCpxDYlFZ0ixuhPJSwqErrULZ1mNxAVpS8f5TOZ5fCro9ncDcilC4W3vMBj0Y338krbB82xm3/GMXb+QgBwsUbnsXL1/tnFcuzWwoAtLgv9kpxNBjMqqnUHGODQenceCoNKpe4wam8/PddJeTykfE9oppaOZU1xnaOHAj248RxMTcmhKnUKMAcjhmmYm8a6C7MkaBe5wT1Trn+sIfAjxJtMGfUp6idL6wNsX9IkLpLBSBGc8BLu65PtLeBVvlXll2F2nmrQNmYry3L/pzJj1mu3khSO/gc9ZDjCcCTo5ZoH4TuE/IM7Pqvg+h+z/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEkPE6u2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEkPE6u2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp5Bj5Vdkz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 12:23:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E6FDA41DBD;
	Wed, 13 Nov 2024 01:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7378C4CED4;
	Wed, 13 Nov 2024 01:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731460985;
	bh=KzYtezsHHZd5EyINMqqHGG51cXOLpemJwiEUUpvOkA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OEkPE6u2U1WuKnADIOhylmi3CfE92O+1fH0PMk2OcC97uHIF+rD8uPt98OdIcOFX9
	 mBHnkR5vQiCHCFBZWV4FS+jfrBZtscCc5p17M9osJzRLrVx8uMnlviKNu52llsksUI
	 nfbdlsdAAR5V8jJOI4kK4pxjs+qrOaioOp+7aR58hBHoabKdA1qGfXOgO0zMLHqxFR
	 aJSkCG41lRt2Of0Iavy3zRQiuErE3Q23RHcNwXXI7fWGrChlM1ZuKGJBFhtbxsuJQv
	 zfQVeL5tRPZVRYJ03Vn34rjURJ6jgx/w9/GNCbhOYjCi2u9NZ3I6577l4olYOkP7L9
	 mM9NSMb5hQveQ==
Date: Tue, 12 Nov 2024 17:23:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Byungho An <bh74.an@samsung.com>, Kevin Brace
 <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Michal Simek <michal.simek@amd.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Zhao Qiang
 <qiang.zhao@nxp.com>, linux-can@vger.kernel.org (open list:CAN NETWORK
 DRIVERS), linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC
 FS_ENET DRIVER)
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
Message-ID: <20241112172302.582285d3@kernel.org>
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
References: <20241112211442.7205-1-rosenp@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 12 Nov 2024 13:14:42 -0800 Rosen Penev wrote:
>  drivers/net/ethernet/moxa/moxart_ether.c      |  6 ++---
>  .../ethernet/samsung/sxgbe/sxgbe_platform.c   | 24 +++++++------------

coccicheck says:

drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:130:6-26: WARNING: Unsigned expression compared with zero: priv -> rxq [ i ] -> irq_no < 0
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:124:6-26: WARNING: Unsigned expression compared with zero: priv -> txq [ i ] -> irq_no < 0
drivers/net/ethernet/moxa/moxart_ether.c:468:5-8: WARNING: Unsigned expression compared with zero: irq < 0

Is this really worth the review effort? :|

Please do not send any more conversions unless the old API is clearly
deprecated. 
-- 
pw-bot: cr

