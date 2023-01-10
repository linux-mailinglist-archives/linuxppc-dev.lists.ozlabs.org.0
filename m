Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7426644A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 16:27:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrvn02pfkz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 02:27:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aN1C5tuh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aN1C5tuh;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrvm52zHfz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 02:26:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1687DB80DD1;
	Tue, 10 Jan 2023 15:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282FDC433D2;
	Tue, 10 Jan 2023 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673364368;
	bh=i8m6nnObUjQAxVsR4ErMApSFIjYm0i6e8LmsHTc+RzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aN1C5tuhxBq0HXkvxafm6eDrBiqlZObX9jGntIfkU2YFvTz31cTWAzfBQdkMxNvhu
	 RugL5b0ZhmQqd87cotoEzdTTZhnI8efCiGumaEjdht+GBaSLL7BZzsaZqE/ZGF0IHC
	 9VczJ/WT+PyDjYOoDfYM7DhwOnmcNgV8ei0atpHfANoKCU+RlMwfcg9KfgkMu7AxQB
	 A3qIt+vw3iC+/W+D1yzz6cm7hL2a++O8lStMtk4R+aKazbPR6Pz+ND6/VYfzaF1UPr
	 IfMG1O1ndu2S4XQ9YaZpDB2b+ItQMCpvYholdLIQSqoM9nzG3z0n3Vwcr4rrMLFaW5
	 bEKiSZmHVwvZg==
Date: Tue, 10 Jan 2023 09:26:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
Subject: Re: [PATCH net-next 2/7] PCI: Remove PCI IDs used by the Sun Cassini
 driver
Message-ID: <20230110152606.GA1504608@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106220020.1820147-3-anirudh.venkataramanan@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 06, 2023 at 02:00:15PM -0800, Anirudh Venkataramanan wrote:
> The previous patch removed the Cassini driver (drivers/net/ethernet/sun).
> With this, PCI_DEVICE_ID_NS_SATURN and PCI_DEVICE_ID_SUN_CASSINI are
> unused. Remove them.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
> ---
>  include/linux/pci_ids.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index b362d90..eca2340 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -433,7 +433,6 @@
>  #define PCI_DEVICE_ID_NS_CS5535_AUDIO	0x002e
>  #define PCI_DEVICE_ID_NS_CS5535_USB	0x002f
>  #define PCI_DEVICE_ID_NS_GX_VIDEO	0x0030
> -#define PCI_DEVICE_ID_NS_SATURN		0x0035
>  #define PCI_DEVICE_ID_NS_SCx200_BRIDGE	0x0500
>  #define PCI_DEVICE_ID_NS_SCx200_SMI	0x0501
>  #define PCI_DEVICE_ID_NS_SCx200_IDE	0x0502
> @@ -1047,7 +1046,6 @@
>  #define PCI_DEVICE_ID_SUN_SABRE		0xa000
>  #define PCI_DEVICE_ID_SUN_HUMMINGBIRD	0xa001
>  #define PCI_DEVICE_ID_SUN_TOMATILLO	0xa801
> -#define PCI_DEVICE_ID_SUN_CASSINI	0xabba

I don't think there's value in removing these definitions.  I would
just leave them alone.
