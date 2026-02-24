Return-Path: <linuxppc-dev+bounces-17122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCBLMTDwnWkHSwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 19:38:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C818B7E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 19:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL61T2S5Cz3cb0;
	Wed, 25 Feb 2026 05:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771958317;
	cv=none; b=OzSNYQi89VkH1l8BaUmw2+FxVMMNqOk/nEtHkGZXYTBgXz20XilQcvc/A4Dn9KSzg2tjsHXCeWYyrXbMJr5j1Hz3npaMxRpayQ+dlrZAHZTeVQGgTz7VzRqpbDhn7xoE5d44OCE+JgfTisHFVWKjB58I5a3jmijv97xEqbbpv22frAMJ7kfersnZtQJ15aLNyr3BSLcM0b4ZXucEqJgArR9+zvv96X6kxI85nUI4W7mj8bwW2r+TOXyVaw8Wtu21t0RSYYC7ltxggW2F0CwIaDQnkZmdxmU4JSJiCn+eX3sxcUlFcbLSyqFS5BbNBpXpYGwegc1L98zAvK7Guj0b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771958317; c=relaxed/relaxed;
	bh=4+9/kVThc3/+V8elCs3VhAo/JNdEc8B5u2qZALvxJF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i82LSe3uReriosJ0LH2ClO5+ZeTUYLR2Mh1GeyMgzKLWX9Hvj69wR6EL4f3Or6Dszweu0z/8vNEZkYaBG0P2tneva4rITq12zXrkeiVnYvYBUWDNKXSJQokIUxDW0DTITe/3e+CVEPJqAt9NBeXGU7z9G5FmqH4cawfTnQ+IyqRPq2XtF/0R/AODUnXWu8CpvimookznM9mFJcNAEL9aViStQ1gNO+bvKFgHFkwy9NJMAgn3o26FN7ZQKl3Fl2Td8CnMa2ufB9fkh0DZ2i3HeF2pu2UNJujdh6MCzFy7e3IqTTFFwQ0pu+JiAwq4GgF6dlp+cy/UgZZRnpIgDqLeFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeVWlmTO; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeVWlmTO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL61S2nZHz3cZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 05:38:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63FF8600AD;
	Tue, 24 Feb 2026 18:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B2DC116D0;
	Tue, 24 Feb 2026 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771958313;
	bh=dS/PeNeD3SjxSqxDdPYuOcwLO2rhR2F/UDY4OUrE8go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeVWlmTOJhJlcf2PmA7E4NC6gNxINhb72p4NHtgkyLKaCJYMzQAy/keCJnA2KK+D4
	 Mf0HKgARJSzH2/4R4f40d31RyUB9qGr3mFYQrsP3gxEg+O4XWATTxQHXdNslk5f+yv
	 w2pFlwO5vAp9GZHfw6EXQ0O5P5At56q/eE3dWguZ64rHK/ZtFclnJZZaFmSBaKdvv6
	 rtQ1AGhipiTlK6H9Xbigxs2zEBQUPcF79m1CMwGc0e6oxJHnP96DtyoNcxU1LGg/3j
	 D0QGJ6559cz1b6h6MDNhDBN2F0l6CZzeazoO+GDCuTQ3g0z4Od6TmS4qZI3gX1qV7f
	 Ejfo/J/YfSL7w==
Date: Tue, 24 Feb 2026 12:38:32 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Message-ID: <20260224183832.GB3239922-robh@kernel.org>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
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
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17122-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:peng.fan@nxp.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E07C818B7E9
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> linux/of.h declares a set of variables providing addresses of certain
> key OF nodes. The pointers being variables can't profit from stubs
> provided for when CONFIG_OF is disabled which means that drivers
> accessing these variables can't profit from CONFIG_COMPILE_TEST=y
> coverage.
> 
> There are drivers under drivers/soc/ that access the of_root node. This
> series introduces new OF helpers for reading the machine compatible and
> model strings, exports an existing SoC helper that reads the machine
> string from the root node and finally replaces all direct accesses to
> of_root with new or already existing helper functions.
> 
> Merging strategy: first two patches should be either acked by Rob or
> picked up into an immutable branch based on v7.0-rc1, the rest can go
> through the SoC tree.

SoC tree is good.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - rename of_machine_get_compatible() to of_machine_read_compatible() and
>   add the index argument
> - add a stub for of_machine_read_compatible() for !CONFIG_OF
> - provide of_machine_read_model() to avoid having to look-up the root
>   node via of_find_node_by_path("/")
> - rename soc_device_get_machine() to soc_attr_read_machine() before
>   making it an exported symbol
> - Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (9):
>       of: provide of_machine_read_compatible()
>       of: provide of_machine_read_model()
>       base: soc: order includes alphabetically
>       base: soc: rename and export soc_device_get_machine()
>       soc: fsl: guts: don't access of_root directly
>       soc: imx8m: don't access of_root directly
>       soc: imx9: don't access of_root directly
>       soc: renesas: don't access of_root directly
>       soc: sunxi: mbus: don't access of_root directly

For all but patch 8,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

