Return-Path: <linuxppc-dev+bounces-2271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8599E048
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 10:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSRV94N31z2yGY;
	Tue, 15 Oct 2024 19:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728977124;
	cv=none; b=FDMU8kcs2uXuMBLczGiRMbyPhR0IcsxiT6tHzVlwVUSaP5Z5aag4wsQ7DoNYrkTyOeXzTUUpmr9Fmao4SC0HYM2vTGas503wyCht0vlY+RZDiOb3IZX7Ekg/rDI18Hiw3kROrh7TQCiPVDUTvHNL+7tS8F6AkdpD1IhBDHTBE+NtNHNXTcDrsEqoGmmJZdCtO+ZePkkTDBm1O7ejk6E/e9b8D47nor0dc2PJmEHM5zYT+FM8yWEzAnRD1w+BzoA0+zKzzgRBHn0C8At0fQW+3CZPkqg1JIPScSC466OiPKHFXFNNln/oRFG2Et/CazQXIfXd37yZbrROKlucUnZtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728977124; c=relaxed/relaxed;
	bh=afcZeUIFR50Imn4zQmHd4rdPl8f1Sby5Ky42SFq8ZRo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juwQ/O4Sy0sLNes41Wday4ULpxeGKsvXoQQPL7d4XiBYz2WBk3gdUcO2QUXMS53snURk6HQ/4WdE+18NK9p0BKtsDMpBUX8OvX5wyR0QmDU6BCa202DrZ5kvlQ4MhLNQ8oLk4rf8lx6KqDGcD1mFDQdarlixofcuknzg5a8GOLVd5HXPlJy1QQsAW4T7jDRRG0//J2FwHj4a90/3nE9tVoVf9lldd6hzolq9PgjjRgPrDbfUOoPogLCwmFEBaYzBUBjsEgwjXswL84wbUeXip2NPlaR2VSLj6FHc0hq8hXp7vXaWKqzrt7MXRXrt4E7sKUf8NoRA6kEF5YsRX2xkZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Wq/CyEHV; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=01160dc57=daniel.machon@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Wq/CyEHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=01160dc57=daniel.machon@microchip.com; receiver=lists.ozlabs.org)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSQc30KHlz3bcV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 18:25:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728977122; x=1760513122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNwnXbZISPM5dAQq/ufCyRD5g/sXSG37J6CeuntZpr4=;
  b=Wq/CyEHVnbOjxdSxbZXWHyooTN3SSXgdwxDv6PC3AtIlp96r/8OohWnn
   6p0ej2YSvbBKrG6ZyafQ3F5pSh+VSx0RP5rj4SZjULTzMUTk+VMBHIvCe
   zuFzv5Lb7GTMSYoMqEWlLoKaEl0AX95N5WMizNAw6aC7cDjBQq1nDcmnP
   BacgxE24AC/3yxFMXE0/MZrNMJb2y5m7N6A7+qBfEdyRIamZabvLcjIuK
   ll9BXsGv2mUV8MeK/OKkRiSG3xBq4vBvuXoa8bcc4qyr8YiJ4uWijplfb
   87qPIxcZ8zuu9I/ASCTe2+FeA02HjG/ugaZNkSR+1rDfzg4eGPf6g2/0f
   A==;
X-CSE-ConnectionGUID: VOCQDlkbTci7FliPfYogbQ==
X-CSE-MsgGUID: CzdCf0pGQ9+wU5rW2LqoTg==
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="36374574"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Oct 2024 00:25:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 15 Oct 2024 00:24:50 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 15 Oct 2024 00:24:48 -0700
Date: Tue, 15 Oct 2024 07:24:48 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Simon Horman <horms@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/2] net: ethernet: freescale: Use %pa to format
 resource_size_t
Message-ID: <20241015072448.6ssv6vsyjpv4vnhi@DEN-DL-M70577>
References: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Hi,
> 
> This short series addersses the formatting of variables of
> type resource_size_t in freescale drivers.
> 
> The correct format string for resource_size_t is %pa which
> acts on the address of the variable to be formatted [1].
> 
> [1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229
> 
> These problems were introduced by
> commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/
> 
> ---
> Simon Horman (2):
>       net: fec_mpc52xx_phy: Use %pa to format resource_size_t
>       net: ethernet: fs_enet: Use %pa to format resource_size_t
> 
>  drivers/net/ethernet/freescale/fec_mpc52xx_phy.c     | 2 +-
>  drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> base-commit: 6aac56631831e1386b6edd3c583c8afb2abfd267
> 

Hi Simon,

Is this for net-next? I dont see a target tree name :-)

Looking at the docs, %pa seems correct to me.

For the series:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>


