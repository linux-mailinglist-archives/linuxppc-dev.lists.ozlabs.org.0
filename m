Return-Path: <linuxppc-dev+bounces-10145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B6AFB1F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 13:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbLy82GHKz30W1;
	Mon,  7 Jul 2025 21:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751886352;
	cv=none; b=Fq8VDbLM4RXo/pOFIlnFJvWn4d6WKBxloWaEgMgMw4riQbQbqXNDXestwskiCw1M5QKrJt6KpYh/0oSCOJBn5Ho1/p4qVlHPC8HHFNMk8YFb2DZRutByki56ymDJzoyaMSLl16wY0JIXFaxYpIxI3uhVCXNSl1X5Hz0VwaSF6uClT5ywnjHnhktnLFN3m7OygzBQA43KO0XoJKC/Cfktm57HQekBetgnOJZF/8YmGbv4bv83VmCpZGoNqbl3GpKpfqDG41v+LAowh08GLKjdzEke9Li48bj6vnFc3wIX/L6vZnc9Kr2HApy4j49OZYdvZK40CqI2edsfPPPU7TyDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751886352; c=relaxed/relaxed;
	bh=fNH/Ud2f5PPEpOq+XQfdy8tzQFTqZ/0vJRrcuO4jMkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABfvBTuxk3EW1ca0BkYDDMozfhNn0YVo/TLqOIyln5nZCL7uBPbz6m2BLc/2nfaT3zPRUi01gahgzdEV6jKbawIwK7+kLG5JzlyQaExoXD0MFylS4kvUIkqGIihSJ33Ga5XRxQBWJf9/ZAMxLxt21J6PHIz7FrnI2ZOUXGftGZqa8AJS3lNk1d5M99OTCcU6xAHGkS3BYQ9Z+22q7K/NODIwA3inYKXoO+ULbHdw6bw9u7Cyn3qTdnzdJTjS4mTZH3zk3RPQom42Rmydkh2E8lHeoYS+nvg6aWIJGYlBz/eVUS1Q6uqL8ScUAgT/FuAOTfbLYJnMDGvnpoaz4jXQxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sDDxGoey; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sDDxGoey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbLy72h5lz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 21:05:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9771EA53EE5;
	Mon,  7 Jul 2025 11:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1431C4CEE3;
	Mon,  7 Jul 2025 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886346;
	bh=KoMwxI+BjZlkT8Tms2SDNkjYSNzeRufAe/1amGoI+ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDDxGoeyD7+j008f4C5gG8JDXIDhNP0oYiiRUsHQHw1XANM4XOzj4BtQ3WRR5Nn0K
	 WLQ2PaBnbxIIzlNv3K7Ile06rk1m+JjXzF5UOOIs8F8KxsKtXtAULq9PJzo5d1kaxo
	 caU444uhBlooXbSdeQvgvT8/tOrzFv03nVOss4vwcoBh01qYKDQ0/1z8HNvWeFWIXT
	 ihr6tAvSPIwYq+TN0y7vd0jE6GXiIDMGZTlGlX4HxAe7bi6VDUGc9t5elocqno+Onm
	 crt4dZtDXxsWvYAgX2SCmcV72FGyZzew9r+pB2iOAoJINY5GG/OgEc6ykmZmHl6wTS
	 gBqnE5NypwKLA==
Date: Mon, 7 Jul 2025 13:05:39 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
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
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <aGuqA92VDLK8eRY1@ryzen>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
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
In-Reply-To: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Mani,

On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> 
> > I think pci_host_handle_link_down() should take a Root Port, not a
> > host bridge, and the controller driver should figure out which port
> > needs to be recovered, or the controller driver can have its own loop
> > to recover all of them if it can't figure out which one needs it.
> > 
> 
> This should also work. Feel free to drop the relevant commits for v6.16, I can
> resubmit them (including dw-rockchip after -rc1).

What is the current status of this?

I assume that there is not much time left before 6.17 cut-off.


Kind regards,
Niklas

