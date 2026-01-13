Return-Path: <linuxppc-dev+bounces-15618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC2D17E96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4qy0RgXz2xl0;
	Tue, 13 Jan 2026 21:15:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299309;
	cv=none; b=Juu4RMbiRmmTn19bQ2yP6pdnAjjxKrpXlZM61rfmQ+noz/qxngrRyGNuvkkpsyd+ilGTNim3mUR+mEVg0Owqnq1W3jFI7PosH1mCITRlAqRWveR0xGi6Y14uw8k2FjZX08+tmpowgdTxoEF4ppK130OetWdgiLnoTVTpVH7oVYEI8KhbJCgvJj6T/qgn8iwM4r8QmvxKxUV0+EgfvgHvVTCrW8MT3z+OhfwfVPDKASquXYNMhiM0E3NyOKHDd/8xovv1bKH/agYslBcwaR1Zbq9dT75H1pswuw5l/aGzB3J43r7c25zcBSAB2S7+IBqgudIjE60NhLvcqmYMBZW+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299309; c=relaxed/relaxed;
	bh=+5OljhevJ6yo8pdweE7A/vRUo0XUzF1UqRwrEmzsiiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAXU1CSLGoWOLEn0kEIDxL4LV+fXleXIkdH/VuWl/YWZYy1993nZ0czIEzl6BObqdOwVEjmwh+++6960kZiQnRcMIDzLXtSPBE5TELQQlUN2PoLKF4TSw3FOSkyjuk5QXREDS2ilA4ESUDWhFcDSxuUEGWVtILe0NI0Z37+SGprfdRAd5nEthBrc9R56uIQp+dFrfLcqWpQrj7zW63KSDQUBmcX8hJImadLFoy0YF/jXbEgn5PjCArLDi+H/h5/5bxB4c5+HVcJnuGa3VWs3Z53Q2A4X9WhWwogAiEZKpbyjoadeso/tfAp4f/Eka1QkgjsUlruLR9rQWiZNeeR+sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DnCo48+i; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DnCo48+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4qx2d83z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:15:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FBCB6000A;
	Tue, 13 Jan 2026 10:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44057C116C6;
	Tue, 13 Jan 2026 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299276;
	bh=noH2csNYttkzJximg2DkOMRq7PSZu8QvD26YdxlPYIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnCo48+itSv/Z28wMZQtVhh0fd455MaYSuLbQW6msp/bVpo2RGKM7v01FABDcC/+U
	 6APVMBzTSQbuUc6AhL7BcTRAI4Ixf+UFQNB4/DHAQArlAsgjubbi6i5acb75Au4E4Z
	 8MjbpNxoc3ojtcQwW/hR8ZT+dxKkJ/RRMJ9g2rkV08Nhf4bobolIcGJsMuW5IoG60K
	 YqIaDSdymp+dxdHtZ30GCRkvvFqg2To2vhn47htFBg2/y6fikSE3Nm9wqjNn2PzWHB
	 BK4d/7sUcf70yGB9PUsgJE4SbBD1cX2dV7Oe2O9HSgpZl83MYSX/dmIyJNVoc2FGPw
	 PN58GnzLcopoA==
Date: Tue, 13 Jan 2026 11:14:23 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
	heiko@sntech.de, srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
	rongqianfeng@vivo.com, 18255117159@163.com,
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 2/5] PCI: dwc: Allow glue drivers to return mutable
 EPC features
Message-ID: <aWYa_9mlWu-A2uCN@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-3-den@valinux.co.jp>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113023715.3463724-3-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:37:12AM +0900, Koichiro Den wrote:
> The DesignWare EP midlayer needs to advertise additional capabilities at
> the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> in every DWC-based glue driver and without copying feature structures.
> 
> Change dw_pcie_ep_ops.get_features() to return a mutable
> struct pci_epc_features * and update all DWC-based glue drivers
> accordingly. The DWC midlayer can then adjust/augment the returned
> features while still exposing a const struct pci_epc_features * to the
> PCI EPC core.
> 
> No functional change on its own.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

