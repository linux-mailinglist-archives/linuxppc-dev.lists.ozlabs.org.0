Return-Path: <linuxppc-dev+bounces-8988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF8AC741C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 00:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b747w01XVz2xGY;
	Thu, 29 May 2025 08:35:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748471707;
	cv=none; b=jOw514gW3IV5UAd9zzU0caaOT6LcwN76jQENzTdPYG8jd3USyQCZFLdTyzveBH38vlN/Eka4rhLq5NZQrVL9DyYSFJZh15lV2JooGasYSqNWi0hvy98wCJ0wUQaoVRnMp9dDujvVbPy6/gyxP+dpJvrC8ucdWuAX/jgDfGbUBozUF9bjD6qC85KpnTNUwi9wzgsPsspPEbCdMc4wdfuPRf/nvvAdw/cU1WIwtBezFP6lMGBgkGkKNbTBFjM9Lqya6HvIQL6VZaE5S8G1fbN6GwE0aEQRhr6Pr00YeqAZTfrzVU0fpmLYuMlLfUf7/9bpsvT+W5M1fFUsbIuZy6sT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748471707; c=relaxed/relaxed;
	bh=2zUXSpzXYnPglbEzEWR7B7kzGmejoqeOnfrqssc5yQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bxxNldFdcAsDMRHP2AKahAHL+NRu+fQS13X6D7QIDzTEX8JUYuiCGZ59ADv7xemomrPikQ5wCGqlw1A7KY+4Yceh2wSGJhnIlF46kt1FBgedLFtrEj4p/gvtPWfFWasxPc0SdM278k7rRk4EaqAoxP07r3pa89qot6vDKXunAZUtgb9c43bysxiRlwuJUkge2lXd24Di6FLfj5S3yxXL2mmJnGFcfiScBir6BX8d3CzdoLwEh4AP1XfzRlV1c6QVh68kYR4NcW26xjuYHFiI76lOR2/ftYpwiB48bwImuJqHFcAmd+eDlh3ciTYZpaA1XZs9IsyUwLz8heFJ7T3buA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UTS9s/t9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UTS9s/t9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b747t0hRPz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 08:35:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 846FCA4F381;
	Wed, 28 May 2025 22:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D324BC4CEE3;
	Wed, 28 May 2025 22:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748471702;
	bh=G/c8gLq1UOYM2sneyafsU62G5RMVALyJq3J1BkyGhfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UTS9s/t9dgzKMS69c26wtss9wbJFXwAdQVw0jYJpOf0PidV1XhhRUQYejNZvNZdlK
	 HeaIovN6Mcj2OQMfrCvy3nHZrJrKlYoKMHhozxBCRXO8C2PhsjzmArrHbPBRrQnubZ
	 rbVClPpcjpNZxQizn8W3Oj6piVhPORsVI/wlef5kpq/P8Pa3WG+04h5IpWKDjZoVwE
	 GZMsZWYRvz9BSd632glvDalgHlYLaT8RWlFn28UaTSo+X94gm1rnSbuZbCr35yZU1Z
	 ZIn0WY7wkryHte585r5iTZnOJtzoeUXqrXA8Uuh3K/axLPciB5TsR3Y2bqeFzN+WDx
	 SYwfxPGqcuwUA==
Date: Wed, 28 May 2025 17:35:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250528223500.GA58129@bhelgaas>
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
In-Reply-To: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.
> 
> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pci_host_reset_slot() will be called for the slot, which will reset the
> slot using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.

Link down is an event for a single Root Port.  Why would we iterate
through all the Root Ports if the link went down for one of them?

