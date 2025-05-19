Return-Path: <linuxppc-dev+bounces-8695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49FABCA9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 00:04:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WtB0N9Mz2xgp;
	Tue, 20 May 2025 08:04:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747692242;
	cv=none; b=fMggJHdbg8gSeno38gPKBiipiBBYP2o5/U35/RqSubhxn0O4U9AgJ/JbV/EkZ/tHw8OVX6ilbNO0YKlsE6eYSR1dMpHdUlMmaLfabKNxMz8CampHViG2Z1+qu3D/NHmXW6cb34E6P+D+cCODnbfHUk/1ddIpfr/HZKkU7pEdtc2YhXymtDUaLba4mzEDs8Q5LGXVQ4YHFmWnHoCbrnOkQ9kCuETMHG5kXGV+UUH4bCIyh7suz4ZaSdKm8xPD9MLeGLngQOuBe74zz2X2T/q2lZy4244/ul7GNoBhGADt5ygD5gEkTWH1XWzaMuxO/EdaWiqh67UalVuEHtLZX92R2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747692242; c=relaxed/relaxed;
	bh=ebGS+sXSJ2Dchn8L69jgJOJytC58S8NTavlrCJe99w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaQyULrQRyX3Yu84vSaEp75ouTDclE4wyVCWocyKj0DNIqAoHEpCRrRDNlEVaSngBGu53c5qahMAlhR/lun4ecDOsFPekIUpnsHOLILzNdhpqpmldkqY4Gfo3PlSlCFoKpsnklY/433hpcu51597YVijUKwJmB8jThGh7qa4Hh2/IfuP5NK6i7OduhSegSA2ryt+7ni1NbRNofojSuzLvggxBTpAoX/HrniPWxmOwDA4aqN31j2ojUVewsT4KNzCm1G+N7s2tgp+xcG3OB7uOIh6gpHV4v28PJaGyD4/x6N+xbD0sNBdc1gJuS2yxZxhFyX0jRuDoAHROpRsFsxuNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DG4M5PKs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DG4M5PKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Wt93FRYz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 08:04:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22D985C0667;
	Mon, 19 May 2025 22:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55536C4CEE4;
	Mon, 19 May 2025 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747692239;
	bh=lG7yr7akkyy/8Og1W+0QQWxoqRcWGSbfq6/Uv7nAl2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DG4M5PKsVyRbkosrzHCYgWWc1jWWAUMIro5zOorWPsk2DBX/iRH9Prn3sQt5P13i+
	 dbBHOt9TK8rYEhAMttkNbxm7atTBXaqWFI/FJRaAJveI6S04hdRqsvW7WYR5sVKfQo
	 jwajjyZRJcqhPR2BUACN8voNaOn4hzoibwMC4x2s1CTytz1kgtoQZjEHNGHpwTZ8VT
	 VGqJ8KYOAiO7R1sErQR2i0G4/xr8mD7jGV9784RyGvavcuHwXpvPlgx/OOJCXPnqCW
	 PpvfjlDRMhL56lrI67WN8IcuhDJXhum7wHO3FdHv/Wbe4Opss7e7U8+7DL/1LUbW9u
	 P2YfRBO5CNH0A==
Date: Tue, 20 May 2025 00:03:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
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
In-Reply-To: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Wolfram,

On Mon, May 19, 2025 at 01:13:12PM +0200, Wolfram Sang wrote:
> 'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
> core handles them equally, so simply convert this driver to fwnode.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I took this patch in i2c/i2c-host. Please let me know if you want
me to take also the others.

Thanks,
Andi

