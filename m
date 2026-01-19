Return-Path: <linuxppc-dev+bounces-15983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A2D3A75E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvpfp28m9z2yql;
	Mon, 19 Jan 2026 22:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768821995;
	cv=none; b=jbusOMSDHsbeqxz22Ww4XLeopxyQGVVYqysvoS8GGcC9KyMidiFLHOu2pjIRj7bt6Z6RF5X7juG+xxauqYt7RetUto3sUXymqzj1uGSTa8dBn2luyvFaRJ3QrRkjjoeUGazA33mRLbjY9VIx23CIE115C3P1UiicJBdiPpB9ooxMbG9o5SPCu8lpCGBs04oH4h6aQhbGtvJ5Eoaj9QSNtndGwT8P3jS2eUbV7VM83RXYTN2SKKArzYDrx6pdLZlu4NWGxaVTO8wxZvsWcSZLL6zOWFV5BUO/E586IgKBXwOrhjmvTFiy52Xn3QGDSW8kS4VkpE0BqkQcKzuxJSLhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768821995; c=relaxed/relaxed;
	bh=jJFCPZlfc2d0XP2YZvhE7/lV60DrBLW++wy0oKt7axQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=SLVkNW5nms4xqGVbLRZ21V80mm5hvHqV5a3aBbkLC2nv7G8DQMDbO8CYyd02eEqOhfHkQdZp7xXnL8cpAtSRvd6hTNaCTpb/MXgjFHutP1pMdaEa2xtwoDVBXKXbkoGxl2MvG7MDoyJtf1JV1dUjJtulJSoHkUZnh8mF0cecUzjb0PdY6dbxFf4BoBY2jOeTzM6dfP1Ix1ch3DDCinGZkvP7FQGKGge7QaT6Lz4UTc9KANsiYFQOxpm33N7FBuexacl1PPkZ0AMYUSrGa7nIskmNRg+mSf6gzVrl87YbTuBPtjNffNrm3Tj9r9NWKaZG4ELo0/T41p+GoPmRFnetcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l5ZSURRT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l5ZSURRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvp7Z3ypfz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:26:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3117B41996;
	Mon, 19 Jan 2026 11:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE914C116C6;
	Mon, 19 Jan 2026 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821991;
	bh=TRoYFafhv6XYbtQkSQrDP1VuW/VHQIo2+i4Os6bLwHs=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=l5ZSURRT9nh/iNJP+CEEkjm7D6tFTPPkk6CKCVRdP2iiQf85uUvxe3+WZYtnyIFk9
	 rpI5wivHag132WVnVHOYItMfj1s1t2M6bJM6MqF/VIaQUI74kAWww9I1X0uScXLGIA
	 QuLJaY7iyJ1ghVoNbJVvO1jAeakYmazsiAtd99FuayT/yWM70YaAV9ZBM7AbmgShUw
	 uhCBzpfV2sVtxNg1R/IxbZx6hlPkoEXnBjj4LkatT2DEIQxIT/6hBWvUWH4gySFxc3
	 S3qWf7aJsJ4gkrmhF0iJa0enabfTojzMWOvehsLySEGIH9rYKpCRT601kLyQtvBbyy
	 ElAwngxihO8cg==
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
Date: Mon, 19 Jan 2026 12:26:25 +0100
Message-Id: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)

I think the name of this function is not ideal. 'get' usually indicates tha=
t a
reference count will be taken, but this is not the case here.

I'm also not sure about the machine prefix. If we really want this helper I=
'd
suggest something along the lines of e.g. of_root_read_compatible().

> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);

