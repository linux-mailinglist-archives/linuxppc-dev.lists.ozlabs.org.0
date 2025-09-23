Return-Path: <linuxppc-dev+bounces-12537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC340B960F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 15:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWLqs1P0mz2yqg;
	Tue, 23 Sep 2025 23:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758635209;
	cv=none; b=JhkWGdTcHkxuBrKyyBtUqYYAYYuUda2kFkCmav8ihl5V5CNBVJQB/aWpr1L9gCnbF07CwkZES7dkzwZhi9gpheKHZR9Hy0zGBiXWiGkrwiYDawyj8sNa03al72s5aBXW6/iEU73uO3SNVdz4+F02Q5sptPyS6vbAu3OK8KDNc2jyX3vTz0J/r63Nh9vapuFQmmKHoI5y9xinZeaTq2N4rF4U/RZc8kHsOHbSMhx7MSAdaZSLmpmNbR0JFfYcmIU33WyqYkpJYLrce3pAh08TGxYpwtn3EFTWtFZhC++u7jSMGc+gkb+OT8NFOlyhBNAua1kjACb/NcUcEMc1uVW4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758635209; c=relaxed/relaxed;
	bh=HmiFHqTevzpTd67JED8R3CjY5+3NzH7Hvg1rhxsNPiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDsn9j2fyzaNrHu1veO1UV8wRz2gY0Cisvx+nCzszkOV98OXT/rSIbYVrPPOlTySq9N8xsS64JvquxclydvO5zmiPdTC88kGheCdYVCFmSaAi2cW2Ejm1iAvb7aE+2uN4uz1HVEUc8uiVl1MXcIiz8YwYhp6t2zPqPCu8uXo90PWy9yHi3RTMRXVuyl40M30j5Oucm+mPwnISlidrBZBB0L7Hjdp/hBH4l5xItwScJuvdvanSE/ei8S6CkIBUCCwaOsmapeTe5xPsFEmFnwZJf0CpGdaMwn1WDX2YZKwhCMt2LItpbFoHaBVdKJMIxLdrEG8Lko7SrG8/FI3Nxuq8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qxQ7VDKf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qxQ7VDKf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWLqr3np4z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 23:46:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C48D1449D0;
	Tue, 23 Sep 2025 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C0DC4CEF5;
	Tue, 23 Sep 2025 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758635205;
	bh=FO1IaZWhYXzPZ1kV2cp8Kfr5N2is+biotDlknM0E+x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxQ7VDKfAzJIYa13xErJ+FpKQkM0PJmDHnphGd9CMCFROVxi8kNFAWh/WESrHULj8
	 VLgqHBFIBpQXCtb/GASS4fKMOjmBwZRD7wACS7+FLfDx2ytcroOdgLi/XLulEJQ7NA
	 eNLCLXjkrcFO4s0XZFhspPWr/XwYMMrWpNf12Cwy0wyvAWs1hrhZHgSbO1wapC2gpT
	 4W/lMZbVbEYoyuQoOrhA7kGpyuDXmTm0Ft5mrMqqZvR1kv9x+VF9ILnrRUcYFHInJt
	 uHe+M9HvRIDEV+RyIx9VqgjQDSF4y7mjWkxmTEowB9J7dXKXY2UNJoe3h5D6fiEAoh
	 cpGKGLsVB4rKg==
Date: Tue, 23 Sep 2025 15:46:37 +0200
From: Niklas Cassel <cassel@kernel.org>
To: David Bremner <david@tethera.net>
Cc: devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org,
	bhelgaas@google.com, heiko@sntech.de,
	krishna.chundru@oss.qualcomm.com, kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, lukas@wunner.de, mahesh@linux.ibm.com,
	mani@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
	oohall@gmail.com, p.zabel@pengutronix.de, robh@kernel.org,
	wilfred.mallawa@wdc.com, will@kernel.org
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aNKkI00EAJb8LD9S@fedora>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <87ldm548u2.fsf@tethera.net>
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
In-Reply-To: <87ldm548u2.fsf@tethera.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello David,

On Tue, Sep 23, 2025 at 10:06:13AM -0300, David Bremner wrote:
> 
> I have been testing this series on the 6.17 pre-releases, lightly
> patched by the collabora [1] and mnt-reform [2] teams. I have been testing
> on bare hardware, on MNT Research's pocket-reform product. I'm afraid I
> can only offer CI level feedback, but in case it helps
> 
> 1) The series now applies cleanly onto collabora's rockchip-devel branch
> 2) The resulting kernel boots and runs OK.
> 3) the resulting kernel still fails the "platform" pm_test [3] with
>  "rockchip-dw-pcie a40c00000.pcie: Phy link never came up"
> 
> Of course there could be other reasons for (3), I don't know that much
> about it.

I don't think this driver has support for hibernate in upstream.

Did you try forward porting this patch:
https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/

Also, have you tried the downstream driver?
If it is working there, perhaps you could try to isolate the changes
that make it work there.

Otherwise, I would recommend you to reach out to author of the patch
above ask for support.


Kind regards,
Niklas

