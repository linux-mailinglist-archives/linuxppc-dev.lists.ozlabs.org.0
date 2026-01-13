Return-Path: <linuxppc-dev+bounces-15617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E8D17E8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:14:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4qT0szZz2xWP;
	Tue, 13 Jan 2026 21:14:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299285;
	cv=none; b=IkXTqDh3IdxNZsyc5VKdwS5wGJpZ2rj6eddVL8VWnQ+q8cxxJNlqxTXZ+SIHRvuGPBupCMS8irKjJznh3EFy0pwxPNtSRmRvXUfx7WATePmXA2HRZjw+GSvdf2wgG0roudmC38r4QDEZuB05R2WFVYJOiUAbmmt+UyX/q8u34Gx4tjxKZk+7IeVbjgvu9W5voF2rggPwRWG/aIp5txNbrRn2WmebyXsbBkgG8fQxB3GgMRMix2gFLmcUJ0HT9NE88DSOxJqDN2NivtMvMEa/LNHi+kzGwX9RnF3NuZy3aKesjopJhg4XMx9sRZrMm8DdvZz9207NpVd/R9zoXdE0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299285; c=relaxed/relaxed;
	bh=girjG2CHkD0tqg+oq696dBVbBD4SwFE7XgRn0/5jOn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cO+NCMSdo8Zu95limcvpuRNjgbi30PTbSA43p2kYTd8+TMVMKFpov7Kqf3kdF56QQOL888RT623++ew9z0mXqYCSUh4AJ7468vSaL4JdK5CuomQUCxf4VhWN7nLX7FH10VY/r5uAMqM4X1/G3G8BC6/wJNCf+DThl+D1wntg+tsCEWDYPABFQseWKZKjmPCa7/mSRv2hbDH+V7ceVGYQM6CqkEFx1qoHYpaAkQyHtffDI0vjzTj/kWMUdRmG3j3E236j3RPvRGCcYl/A2LOZaEYs7YSbIzhlDx+i2UZ56Vx0L46U2+N7OtXRQ8nW6P2QHbN72pwxuKE3wF+gAf8EOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4jHHzHO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4jHHzHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4qS2HDJz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:14:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A81B142A60;
	Tue, 13 Jan 2026 10:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8ABC116C6;
	Tue, 13 Jan 2026 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299252;
	bh=TGUkh8Gval+loBUcY0wl9fpiuvXqEh3n7gDAud8tPZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4jHHzHOUVsgIY6iLEFwNqEhROfJX0HqEz2AgiMoJ905dpc27Ipl7uiQTzDuSkHGt
	 a4zqFmQddcjjIpU2Hk3SV+UnBl1MicSbvTR3yWKw7wp+MVL+NWLjFwKsS7xUA/1Ccb
	 kNVgZP8Lgvr//+yMpx/aw01IOJZlWqk/NM8uUKtlM5PbVbeOiN/MvtCR7FMhwZbUyT
	 mj1PV/ATKjO2Tcxn2J9SnCGVkgOlTlA04Cx64oDamNIXkqBH9smtxiiJSdrPOXnc45
	 8GojOC7O2PjYBb2RMI+Sa4E6tlzIl8RDdudZLPrZc8befQdJTEqeHc10imI5fCVeSk
	 g4bwybfGogERQ==
Date: Tue, 13 Jan 2026 11:13:59 +0100
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
Subject: Re: [PATCH v6 1/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aWYa59GgcB7jOfQq@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-2-den@valinux.co.jp>
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
In-Reply-To: <20260113023715.3463724-2-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:37:11AM +0900, Koichiro Den wrote:
> Extend the PCI endpoint core to support mapping subranges within a BAR.
> Introduce a new 'submap' field and a 'use_submap' flag in struct
> pci_epf_bar so an endpoint function driver can request inbound mappings
> that fully cover the BAR.
> 
> Add a subrange_mapping feature bit to struct pci_epc_features so EPC
> drivers can explicitly advertise support. Make pci_epc_set_bar() reject
> use_submap requests (-EINVAL) when the EPC does not advertise
> subrange_mapping, to avoid silently accepting a configuration that the
> controller cannot implement.
> 
> The submap array describes the complete BAR layout (no overlaps and no
> gaps are allowed to avoid exposing untranslated address ranges). This
> provides the generic infrastructure needed to map multiple logical
> regions into a single BAR at different offsets, without assuming a
> controller-specific inbound address translation mechanism. Also, the
> array must be sorted in ascending order by offset.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

I think this patch should be after the:
"PCI: endpoint: Add dynamic_inbound_mapping EPC feature"
patch...


>  drivers/pci/endpoint/pci-epc-core.c |  3 +++
>  include/linux/pci-epc.h             |  3 +++
>  include/linux/pci-epf.h             | 31 +++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index ca7f19cc973a..8d809a2c3ce9 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -596,6 +596,9 @@ int pci_epc_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	if (!epc_features)
>  		return -EINVAL;
>  
> +	if (epf_bar->use_submap && !epc_features->subrange_mapping)
> +		return -EINVAL;

...then you can change this condition to:

	if (epf_bar->use_submap &&
	    !(epc_features->dynamic_inbound_mapping &&
	      epc_features->subrange_mapping))
		return -EINVAL;


> +
>  	if (epc_features->bar[bar].type == BAR_RESIZABLE &&
>  	    (epf_bar->size < SZ_1M || (u64)epf_bar->size > (SZ_128G * 1024)))
>  		return -EINVAL;
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 4286bfdbfdfa..898a29e7d6f7 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -223,6 +223,8 @@ struct pci_epc_bar_desc {
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> + * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
> + *                    BAR

This text should probably also mention that this feature depends on the
dynamic_inbound_mapping feature.


With those comments fixed, looks good to me:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

