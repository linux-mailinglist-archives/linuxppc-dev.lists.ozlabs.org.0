Return-Path: <linuxppc-dev+bounces-15982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647FD3A75D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvpfT4WK5z2xjb;
	Mon, 19 Jan 2026 22:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768822577;
	cv=none; b=nZRtLciz7Y2FirBkCVSD80ssAsm1TxPX+ZTizZp9vLAmAPCbQggKq8sBZcl6gsR9187G7jBxhKlq270m4Sbted0h0R7O4qXl2TaK8k1kbIqir7VAqrPxDSoCEcD/meTtDP0aeg5PhJK2OrL4sbHPmh8Vk6/OBXonYVPRhb6qdne8IQqTH17sJfLnTc66cHE7Vthr6G/7AECs0FumoPRJJu/+fAKAUgveG7zRDwdmD3mKbVu8LtP+gtUueQE+cW5Wznt00rKQk9XKGOlSHNRes4cPRVGdJcI5t37AIGGVaaviTnCMa5tsLOix1f/kFCnty0G/UgRz29j3bOflIUfWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768822577; c=relaxed/relaxed;
	bh=jxSm0RT6/vS5ISeDyalVPSvK3rwkjosRSSjTO13ynmg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=l/RDP9cGYBp6/5oGdqerFKk625Jj6jvhJhnvSCNzvbXc0xmkx9Prz4fGcaMpEM6JLc0+nMhU9wNGrEOXrfPuQOUZhO4evu9fFMOjt7ua3P1aDoV19hOnKahDr6+ZbXfEvdMrOSHE9CfY7YhiBgRZHbnpwfFshMM9qBkMxG75b22wNTu5jrLGZ0Jn8TmAU24xHBP1jyZBitezNNTgfJ/xBnCToEGsV+/7o5VC6AqdoDktugdwn+npjoa7GvYxiBGXOljY05boV6K5cmOkmWwDpOXMi3QJkDF0iu1d2xIM0mYWIXxo32Tv/olGChZ+WR74rgya5Rrb7AiXvkpWWkbXhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q7rEkfzG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q7rEkfzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvpLn1WBxz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:36:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CFC760140;
	Mon, 19 Jan 2026 11:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9E3C116C6;
	Mon, 19 Jan 2026 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822574;
	bh=OQinx1qBrX1pwq31acCG+L+3NgEjuiriHQfON/AY/rg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Q7rEkfzGjUkdkLUMw2ZzG/zLwSm9pxB9UUK4Zq2Vvsh765XsoyJRENkSFrQycIObl
	 UjIhmRCXCsiKzSUo7mxsWiC3hBoe/LJfFTWvwXQwDC7XwSmACPI06b4qv+pSNrhOgl
	 09sixcXOxnbd7EGd20DKDKUmMchA9DpWntHdNA3XJaawRA65n/PaisNRh2vKd4JbFd
	 VYTqzJgFLx6mpYG4nfUQWGVtU4TAP1eEIdjwAYR/gcD/J52wMH26ARBt4Pqea5KzNP
	 3nz7ojLpYAQLVFUuiR90PbSI5WZ4SCKH/F3KkgIByMQSEUSMAwyA4bNzSqwQli6vie
	 prijfAz8KLjCA==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:36:09 +0100
Message-Id: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_=
attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -	struct device_node *np;
> -
>  	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/"=
);
> +	if (!np)
> +		return -ENOENT;

This should never fail at this point, no? Also, can't we just use of_root?

> =20
> -	np =3D of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);

If we want to export this, we shouldn't reuse the existing name, which is
misleading.

soc_device_get_machine() reads as if we return a reference count of somethi=
ng.
Additionally, it operates on struct soc_device_attribute instead of struct
soc_device, where the name suggests the latter.

Instead this should be soc_device_attribute_read_machine() or if we want a
shorter name, just soc_attr_read_machine().

