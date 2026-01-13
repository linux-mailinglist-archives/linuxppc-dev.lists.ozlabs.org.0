Return-Path: <linuxppc-dev+bounces-15616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46007D17E72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4pG4XxVz2xlF;
	Tue, 13 Jan 2026 21:13:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299222;
	cv=none; b=d2SmvQ/2zPxrU5Z3QMqx0YV/svZsBTh0eD7rlK0n+AOeIkmIz8tJpsOr32yg819VRuceoZ8tPjHnI7hb+pVH139HndgcLPuVoqtQ88sX4Vb4MfpeuAUy/kfsk/TlnsB4p4R3ou/QYDCBQhgwXw0lUkrOw4SeRZohJ2HIh+wOjwjO9xcA/PU+VUPW3gx6L0rXCwtm6sJs3oSoQve4c9HAj9k/tulNaP2vSerzcz8yfAw7qPfsk2IVCJaDd4U6HUsrma5w03SaREV7qsbt9gp/ZAVb7pqfmdhwd92bdF+aN94/2yMFN/6c8cYMj9iwJQgtf5rKUaJaAVvxud3THub7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299222; c=relaxed/relaxed;
	bh=7JdHDhnk1cnDQF/4+ViQCWWBCwdPy3CW34/gulTECKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlPCrXBLH5smmITRpTxtZ04GPSV4kaNurrd614QhcccBqIJlLDrd8uLhv98EezkGFJEBFZe3DMyKwSPj2BJTRxAguoBnPECyZj1tGlmZr0fHj/S9IWQJDOZ9mhRQuKlMkRT56unZkWqhazO6hwArAxrTQl/CMiDsNLtWrI+PTBcHg4T5LiMoTb1QjTO7Oqv0M8YTEyxAStjTdVqswvglFRymmUDjlOW6f44W8Ym5ERU5AMLaa87245zAiJ7Wxn9OysIn1RqDNlMpqgKCN2Un65sSOOgE2kkYOYrBkmVMjqmhq37J8JRS6/Wzu2zjWt4Qm6L5Vr84NmU0SvgCP+lGCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TR1n3nxe; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TR1n3nxe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4pG15BPz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:13:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E228F43FCC;
	Tue, 13 Jan 2026 10:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED356C19423;
	Tue, 13 Jan 2026 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299189;
	bh=B60Fgt62EI+KMFzznTOtUxbSOZ4bl9cL8ytB20WIh18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TR1n3nxeNYKPBju7jSmTmUvHf2B07hvvjuClTqXpglYDTqUIy3Qc+ayTSIQ67kdIW
	 M0dogUadKwpI8h4jvgScUNLHuPpfbDt72RggjaLhTMNJ7ilAdcNOaFZ7DP4BB8L3iQ
	 pxtiM+2rAxz/7nXY1Gfa4Lf/sua6WJYBRwQl3QgHhT9y7zjGrl8I21BrlhCOtmeZ7M
	 j/QK2RGJUmXm/TWFHY1viLqWV/1cRQnveztEjn7wZpPxhcp3HkUUE5GqdpNOtWv+Z3
	 JSgAtsbANLy8Foi9gAgpkGw7D1b7Q4uu7lOrRkXsdRH4iHGFcjMTZa2D+8nBwldlOa
	 l9AGfTdUR8RjQ==
Date: Tue, 13 Jan 2026 11:12:57 +0100
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
Subject: Re: [PATCH v6 3/5] PCI: endpoint: Add dynamic_inbound_mapping EPC
 feature
Message-ID: <aWYaqZLhNVHof4BW@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-4-den@valinux.co.jp>
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
In-Reply-To: <20260113023715.3463724-4-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:37:13AM +0900, Koichiro Den wrote:
> Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
> whether an Endpoint Controller can update the inbound address
> translation for a BAR without requiring the EPF driver to clear/reset
> the BAR first.
> 
> Endpoint Function drivers (e.g. vNTB) can use this information to decide
> whether it really is safe to call pci_epc_set_bar() multiple times to
> update inbound mappings for the BAR.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Since your new feature depends on this feature, this patch should be first
in the series.

With that fixed:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

