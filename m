Return-Path: <linuxppc-dev+bounces-10244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60DB05480
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 10:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhBq91lYvz3c57;
	Tue, 15 Jul 2025 18:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752567397;
	cv=none; b=BZVy9d5QYGTQ0S+LK8wyacFaMQOB1aKy9iQ5c5+zqETL8uHKl1J0kFgb49mYXbTtQiGyQpY+gimC3OFa2fdW6Q0sgaaV8jVOBKzdTdDEDwzBoqIZF9dW0MnxJyjxyWYxDKjDRRnZKyNA3KV9z9cnFhbSlx9kWGcBntJyaCIhkuuX5dXPJ8aBrkTSs6zTcZARxsgTCms0td+xKB2aJWYl3pHLDPhA02O/ZEzb5FmNw3WRy3i0us2dXYtGO1EJ+Iqo9Dzy/no+pF3mmdKZ1y7OqbPNrbmdpSwtg35UWlqz0CzL4JeEq99rhAtvGVR3R46Kvz53Qc0GeKQFx2dooAclTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752567397; c=relaxed/relaxed;
	bh=VAO71PoTRT57v2tf32yzlu+uhqoq+aoYC6EYVWufyhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4Ktd46hC1/f15ba8zl0ov2ZNzzmd1AzfMehQtJ4bef+HDR3XcA2TCD9HUgjPZVXkcYcFvFLn+h7BqL7at7F2HeDSUDCBhG4ch/UYyDCyBhYOH+5aRdE+tzWsyYj6JOT0sp6w3bBDWT/IoMs017MXCu7+A0omLWf8KhX1+uMcsWGtHXtaZPzkAd+1cjX0NILyANX6jaTc7oQgVxq9zgJ+r1vWkWxTqspRm4ronAF8Ai7JKvw7T5N6Y2okHQaXop6NvuwVKZnV80a8ZCfP9/wB1qALmgT4xCrLe1Dgw3nMwXujafDUF8jz5PVlRaPveUA/46211PmasASeXAHcRxFRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhBq76vqCz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:16:33 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 5578C2C06843;
	Tue, 15 Jul 2025 10:16:27 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 20CD4390420; Tue, 15 Jul 2025 10:16:27 +0200 (CEST)
Date: Tue, 15 Jul 2025 10:16:27 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
Message-ID: <aHYOW3P0wvHo5a1j@wunner.de>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
 <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
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
In-Reply-To: <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 01:29:18PM +0530, Manivannan Sadhasivam wrote:
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>  
>  void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_root_port) {
> +		ret = host->reset_root_port(host, dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> +
> +		return;
> +	}
> +

There used to be a pci_is_root_bus() check here:

https://lore.kernel.org/r/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/

Thanks,

Lukas

