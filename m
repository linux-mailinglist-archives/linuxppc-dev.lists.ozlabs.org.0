Return-Path: <linuxppc-dev+bounces-13283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7716C06E30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctRGX2jlXz3cQx;
	Sat, 25 Oct 2025 02:12:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761318756;
	cv=none; b=hn2EXUWSEqaQByKr2HCVvDG3XerBGGR6fDQ0MFisHO84ov/vxXyX1joZlrt23f0oMy6DWYSMxkIKcUJ4jU6Hi83fXumNFGcxatXeXgLTm4PaDkXDpO7KXmP2Kwd2Vk7TWrlt3xCNUwfrj2iCf212bkR4m/lZx0JRg84VRx/V/n+q3cND5sZIGb3J/N3vlXN2G51CN05JLwfSfBRLjE+2Yuw598kQlpflzjvYM8lROMrJlPapW6XHiLGS18bE4yFgs6Ka+b8Iw6Le9bf3b/QNnFIT3WQG11YmKSCeLp4OQl1DqabYMKYv6AueiF2jb7G4l929HriGAzPh7fcastPsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761318756; c=relaxed/relaxed;
	bh=2u1GxpItX4GsLPyxf0QUT58D0fyWlx2o68v+6F3CPls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRjB+Ho67yFhF1mwVc0lcVA8Dgx+FZCVQ1LlB0HrFxXnCNUuwoxnUjAZn/fvbTPu+Mc4KphZO7tyBld6qzITBdxJaDQ3lqmbahLhRyh/e4gjHMdg6r82Gx33ynLGQ4vPKLWE9SalgrK7PYIpLIIroclMhkZ6zfzJR1Ay9iC9ebq4XRzDgayT4H+XptzxSLMHfI3cWFQr7mBW5oyAwPh/dvXnxxa7phMSsjT/JxM2s3qBcPObm/9nq9D879k5WJmhdVTDur77GnttAo1xmMnMQoQy3iHz0giNYmrxL1iRBZrIw1tB41bsxbNSsM/KnWwOgdAPg9RXB9rJ77p+/xmCYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MidoN/rj; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MidoN/rj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctRGW23VNz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:12:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30B3C602A4;
	Fri, 24 Oct 2025 15:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11BBC4CEF1;
	Fri, 24 Oct 2025 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761318751;
	bh=UZIPf66k/1+SxC28rDg1HdR6h2ZzeGZdZt38ixelz0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MidoN/rjVDsT2uZ0vhICv+XEKOtW7Bk+aov/uZhFq91KaJ0UMHT1VK6KiWJlid7Sk
	 ncU0CtDsFxZKgmN/5ncxknbGz+efAMnwXEET5Lc05JYzweDlZdhBxNTN0huGNRaFPX
	 KdVMri2sn2zcLNerlNe5EMph6C4R4dbYihIksTBf2YTZGocoevCPgb73SKSymGcal0
	 Pcmsn4UBYkgzG6PMribcDK5V8eTNCtkZ4PMfuQtyVP4vxL6c3dTG2qc6WQjDEtZ7HI
	 BrUqW1yNEsrIVeA9b7EBSWPatgdWguDrDWL9hUP8YzjWabWUR4vZIS01EY/wwVD/EM
	 NKQV0sztncCBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vCJT4-000000003NV-3WvI;
	Fri, 24 Oct 2025 17:12:38 +0200
Date: Fri, 24 Oct 2025 17:12:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <aPuXZlaawFmmsLmX@hovoldconsulting.com>
References: <20251023180645.1304701-1-helgaas@kernel.org>
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
In-Reply-To: <20251023180645.1304701-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> platforms") enabled Clock Power Management and L1 PM Substates, but those
> features depend on CLKREQ# and possibly other device-specific
> configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
> blindly enable Clock PM and L1 PM Substates.
> 
> Enable only ASPM L0s and L1, and only when both ends of the link advertise
> support for them.
> 
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> ---
> I intend this for v6.18-rc3.

Note that this will regress ASPM on Qualcomm platforms further by
disabling L1SS for devices that do not use pwrctrl (e.g. NVMe). ASPM
with pwrctrl is already broken since 6.15. [1]

Reverting also a729c1664619 ("PCI: qcom: Remove custom ASPM enablement
code") should avoid the new regression until a proper fix for the 6.15
regression is in place.

Johan


[1] https://lore.kernel.org/lkml/aH4JPBIk_GEoAezy@hovoldconsulting.com/

