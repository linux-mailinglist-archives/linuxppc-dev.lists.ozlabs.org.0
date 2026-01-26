Return-Path: <linuxppc-dev+bounces-16290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFLNMxNBd2mMdQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 11:25:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196586D67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 11:25:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f04Rg6GRKz2yGM;
	Mon, 26 Jan 2026 21:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769423119;
	cv=none; b=UnNBaGcpQLtR8nyfLfVDGVzBgsBQQiFEw/ZthZ9VRACE5DSbjjEu+HhXPEfxGT3vERbFpLnyEtNqKY/lWC2F9c2Hi6ESOrmd4mtzOStO23jSR2GX8nNXkeBr5wr6tqDss3TPNKmjf86rb3/M6O5Tqr/2jsCfqSRUokG8riFyHFr0/yf0SIrCERQK7yv+Fu85qbUQN80cUwoQ7gfoHMB4hR3/q06cKxVc/2XtsdlUZJez++9EMfjlZhNwB9y1Rda8ziOrW8qQl73rlnOxf7cCUxsh9rWjPmP5y4I22DPn83iAq18afyo8g5m/823XK10qv0QWffmqeiBzXguDZUFaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769423119; c=relaxed/relaxed;
	bh=DUqWl1y7oyh8LiQaIA6uCbvrDP5+dnfBjkDRJwjKaIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYWGp9NdNxYvJeUpjHrxSMmhJOzbVtrRzIugc+1YxE8G23jVHhWD9s557HBIKKhtqvbu75mg7PwOhbkVL9kv3ru3NV74rSEuOXJoToi+2rlLrIo17QCXnCkmq36uAu9ic5ZLh+OP9EwCgZNBb/aiUh+9+ZY4xiBVpEoEqgYGIWRRKA3Ts/oTZbspjXpU4oHor6VKVL19EU03a8UxZ4gc9jZsR670OSqROM++DXcESyf8vu/+DlcIgFH3WQiMc5NcowcaxzklijXUHJRITN2//WaZHOeClIbXgiwKYAMa0QQimzWTuVkyOWNn+hDmMNfZ3+JDoOAPDeXxSXoqgZZy+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kigC4KnP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kigC4KnP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f04Rf5DjYz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 21:25:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43EE4600B0;
	Mon, 26 Jan 2026 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABA5C116C6;
	Mon, 26 Jan 2026 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423116;
	bh=X15mCfB1eLkM+Q70lpbeFtmKLy3xRRhtPt0DJGPJd1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kigC4KnPkwuten2W4vry7/Q7uLnx5jkxhwNDPy0SmE0+vvbSCHF02ake/mqQ6lpDx
	 k3o+5GdnskVWEhwFv+soH8UL3BFwTStxAXpVkb7npdZKtA0UMIAzg1tVPsbpFK6Rg6
	 4I1DwGLJocJGNLwVtaDzP5qs/IXjbThjudzizPR9NNoCayirZ5zFwD+EhinoKSrkqO
	 FEa8FbY08hWJdyw1ez2QCO5ymgyh4sujmDe9gD6sM5qhEicDEJ9FfhMQgnchnA1N6u
	 xE9gTZtR5iqv2+uoDoCPjx2r7bV7yVpvWCG0stjTBpjqqoqt2A+mm+zAfNOJhw0pf0
	 WqfejPPvWWhng==
Date: Mon, 26 Jan 2026 11:25:03 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	Frank.Li@nxp.com, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, shuah@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 4/8] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aXdA_6shI23JBswI@ryzen>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-5-den@valinux.co.jp>
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
In-Reply-To: <20260124145012.2794108-5-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16290-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:den@valinux.co.jp,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:heiko@sntech.de,m:srikanth.thokala@intel.com,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:kishon@kernel.org,m:jirislaby@kernel.org,m:rongqianfeng@vivo.com,m:18255117159@163.com,m:shawn.lin@rock-chips.com,m:nicolas.frattaroli@collabora.com,m:linux.amoon@gmail.com,m:
 vidyas@nvidia.com,m:shuah@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,nxp.com,ti.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email]
X-Rspamd-Queue-Id: 6196586D67
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 11:50:08PM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
> is non-zero.
> 
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> num_submap is non-zero, read the assigned BAR base address and program
> one inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> 
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
> 
> Advertise this capability by extending the common feature bit
> initializer macro (DWC_EPC_COMMON_FEATURES).
> 
> This enables multiple inbound windows within a single BAR, which is
> useful on platforms where usable BARs are scarce but EPFs need multiple
> inbound regions.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

