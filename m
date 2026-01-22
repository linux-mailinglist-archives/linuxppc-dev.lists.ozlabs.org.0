Return-Path: <linuxppc-dev+bounces-16130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B+iJfzncWkONAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:03:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B1642B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxZqW0V3fz2ySb;
	Thu, 22 Jan 2026 20:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769072630;
	cv=none; b=MlBxdWvutiNkGhazL6IwPMtCKZ/aWXE224+KMu+73/LCoNFxNsPwt6gDuXovY8vDSXcOFCbWAITdNwTQ0u3F4ssRjd76HhKC0CeF1/UmzpeGTS0JkdJVAvqUi7NMm8H9ApoYKBqxumy28A6rR9MuXCX7j0ur5um0qj6xmfL0aBPS9Gxu/7xFbmrgQ1S95ZVnKLPvyvUSmNRG8kcfPSzmP61zOp1ytIUyqdTB4eKZA9sfSCnjprpywW6XW4iR3izsXiw47AGdofjx1uXo+PplrFiW71dZ1oUyshp9tMf692CirRjyR4zn5VL04v5Kaq/Z7iIPQBhDvPix4bcue90LUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769072630; c=relaxed/relaxed;
	bh=SeiWwo15Nl2QP4Gshbe6/rmkv+39cznqDqZx/8qTvMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSAGIVS5HGfTbl9gmEooTMueJPOuKCzwJk2COqNgaSlQKZaZLSPYaTnSSs7xtulAYgBR63nPBJwQ6w8N4pR2eQceBViQf3KMHtHfBwroYRDJASwePo5/waHRnjfxvlV7lZs0ltAhSGPUPg5geKWZOLReyGzbYhHhE9+MsJZGEI9m5ueHXaMRwSKYT7URAmGw3JmUJNgGEpcB38b6HBzhYiRxOiN4GGJ6fnJCIvEUqboJWY4gQMN9y8i4RHWddJIgo5M1+SLabZpQIKk6oZ5CsklVxG6Wpy3pk1nKhxXsRcFbCsdN9O+pj8wBl5OZX0RX2wApEOKxcsOtYIn4FX798A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzS2xZFu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzS2xZFu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxZqV1g7Vz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 20:03:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2702408EA;
	Thu, 22 Jan 2026 09:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B24C116C6;
	Thu, 22 Jan 2026 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769072627;
	bh=/MehKJmORgEwpJF+msBgFBXkm59BZbIQr2N6eBZwaBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzS2xZFueyQor31YESEgMROI8UCRsNdNneVBo50jCEGgFSMndbkcVLiq094C9Jgwo
	 35xH5C7NvzIFyWXvYPRYokoInGijcOBS0s7kTSD2rs1/MqN9zduYtpaudJCO+JuAqG
	 qcWHYywg7hKt7GdHjeGmWDOUYJB6iwtmm/ueYCQLgRuZFzV2GbCuKXuU2MXYlJakLG
	 aH44EBU6o0ftXLIKcH4ybHu24Fk6i93FHqusQwGGBCq7PliSXGB5LtBmwErA8ofuSI
	 1bNHoT4dAhRVT8PtymGXeVJ7cNMHyPdS0U6tbkBKYlgKT3Kc03EbDVdYMvih9iEmwv
	 v/QGCAMt1Lw/Q==
Date: Thu, 22 Jan 2026 10:03:33 +0100
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
Subject: Re: [PATCH v9 2/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aXHn3zuxxfBN1yps@ryzen>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-3-den@valinux.co.jp>
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
In-Reply-To: <20260122084909.2390865-3-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16130-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:den@valinux.co.jp,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:vidyas@nvidia.com,m
 :Frank.Li@nxp.com,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 539B1642B7
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:49:06PM +0900, Koichiro Den wrote:
> Some endpoint platforms have only a small number of usable BARs. At the
> same time, EPF drivers (e.g. vNTB) may need multiple independent inbound
> regions (control/scratchpad, one or more memory windows, and optionally
> MSI or other feature-related regions). Subrange mapping allows these to
> share a single BAR without consuming additional BARs that may not be
> available, or forcing a fragile layout by aggressively packing into a
> single contiguous memory range.
> 
> Extend the PCI endpoint core to support mapping subranges within a BAR.
> Add an optional 'submap' field in struct pci_epf_bar so an endpoint
> function driver can request inbound mappings that fully cover the BAR.
> 
> Introduce a new EPC feature bit, subrange_mapping, and reject submap
> requests from pci_epc_set_bar() unless the controller advertises both
> subrange_mapping and dynamic_inbound_mapping features.
> 
> The submap array describes the complete BAR layout (no overlaps and no
> gaps are allowed to avoid exposing untranslated address ranges). This
> provides the generic infrastructure needed to map multiple logical
> regions into a single BAR at different offsets, without assuming a
> controller-specific inbound address translation mechanism.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

