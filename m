Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0CE7B6F25
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:59:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mp8Ghnsx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0PDR67ZDz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:59:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mp8Ghnsx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0PCX3dQJz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:58:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8A22612EA;
	Tue,  3 Oct 2023 16:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E52C433C7;
	Tue,  3 Oct 2023 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696352290;
	bh=CW7Wcm7sPLaG8k7fCB3cJgGleAH6htQf+NLDbGd1ww0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Mp8GhnsxJ7b8N3UyCEW0vldhx95rABa2K9SUw5GLOM6lphh+vhaFl3Q8pIztBNplq
	 w3ebVYu9/QWtciSFaSoQur/H303AyR/dikGOohNpVsr/8vGN0yJtlDBUk/kIxw2g/f
	 mfCvfsZHVj2Vs1mqXFNoJZcvHXAogBFoejJ3gIv5RfgVnpp8kOk7yWmo9c2TFk63jb
	 +uFRj+o1laiDlaA1EKLAaeFuVDNXaASkuUyw8+wAUYm5zEi5JpJRbvgGfuh0m+IINp
	 mk66GITkXha7HVVMkK2AD8UXDXVvsJxFfpiQ/R1vWwcKJ1ACApugY3t2SjAQe2Q7W3
	 aoc6uBoOp2/zA==
Date: Tue, 3 Oct 2023 11:58:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 0/3] PCI: PCI_HEADER_TYPE bugfix & cleanups
Message-ID: <20231003165808.GA677787@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kw@linux.com, sbranden@broadcom.com, m.karthikeyan@mobiveil.co.in, robh@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Zhiqiang.Hou@nxp.com, nirmal.patel@linux.intel.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, minghuan.Lian@nxp.com, bcm-kernel-feedback-list@broadcom.com, mingkai.hu@nxp.com, jonathan.derrick@linux.dev, rjui@broadcom.com, Bjorn Helgaas <bhelgaas@google.com>, roy.zang@nxp.com, linuxppc-dev@lists.ozlabs.org, yoshihiro.shimoda.uh@renesas.com, linux-arm-kernel@lists.infradead.org, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 03:52:57PM +0300, Ilpo Järvinen wrote:
> One bugfix and cleanups for PCI_HEADER_TYPE_* literals.
> 
> This series only covers what's within drivers/pci/. I'd have patches
> for other subsystems too but I decided to wait with them until
> PCI_HEADER_TYPE_MFD is in Linus' tree (to keep the series receipient
> count reasonable, the rest can IMO go through the subsystem specific
> trees once the define is there).
> 
> Ilpo Järvinen (3):
>   PCI: vmd: Correct PCI Header Type Register's MFD bit check
>   PCI: Add PCI_HEADER_TYPE_MFD pci_regs.h
>   PCI: Use PCI_HEADER_TYPE_* instead of literals
> 
>  drivers/pci/controller/dwc/pci-layerscape.c   |  2 +-
>  .../controller/mobiveil/pcie-mobiveil-host.c  |  2 +-
>  drivers/pci/controller/pcie-iproc.c           |  2 +-
>  drivers/pci/controller/pcie-rcar-ep.c         |  2 +-
>  drivers/pci/controller/pcie-rcar-host.c       |  2 +-
>  drivers/pci/controller/vmd.c                  |  5 ++---
>  drivers/pci/hotplug/cpqphp_ctrl.c             |  6 ++---
>  drivers/pci/hotplug/cpqphp_pci.c              | 22 +++++++++----------
>  drivers/pci/hotplug/ibmphp.h                  |  5 +++--
>  drivers/pci/hotplug/ibmphp_pci.c              |  2 +-
>  drivers/pci/pci.c                             |  2 +-
>  drivers/pci/quirks.c                          |  6 ++---
>  include/uapi/linux/pci_regs.h                 |  1 +
>  13 files changed, 30 insertions(+), 29 deletions(-)

Applied to pci/enumeration for v6.7, thanks!
