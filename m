Return-Path: <linuxppc-dev+bounces-8694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9FABCA9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 00:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WsG4hW0z2xXP;
	Tue, 20 May 2025 08:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747692194;
	cv=none; b=JfTn0Xx2L1/b4xw1yyrWicoHbjPNaYxJmBeneyo9hsGRT4g6PAI4F8k1QGXh4XslSOwzkv0fL5hw4jSmhu0k5kjQWVj+vcybwrs2fdRXBfa9viKfsHQMQkm1OvXCUqIf5RXIpmBTM/Hmw0B7Tr++6ehgAN39MJamiSjGQYvp2y8/6SLkEV1QHkm1wlk+1CGqI0l1HwTDBCDh2a/fZgSJm44T4pJ8uBW4JZjqZkoG2qDZruCLFK6bEgRa4P77JUV/KYT7do/hTXsmAoB1YQMR2LzYLb86jy9UdujaHqhaO77SYKqDZvcTnSDPNjxldZwLas68TBXU9lUQofaK7FeKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747692194; c=relaxed/relaxed;
	bh=1Watb8yGTvtjzod986AyYLLCGZq6ZrQtmNfOYreXWAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ctyr8a/LsgiZHP9oXZckJ1knyXpp3wJniqnKYMx4kQimaO34stMhGQT04HAfK+FzknGMaSXbNHRuKYsW3J4bLXeVibp/7w62se0fH7GOhIzBy7cxzrt7kA/+lzAJVJZELcoI6+aItCkJhLgtTndCbNVUD2PMTSEK0Q+ga2Ei6QsXh4EdjgUq+UsSBOQaD6kQvsXg4Wi1uKqWKZm0T4BVUlAlNd00y7rHyvZvjovc2gSQ8uZlYabitYL8dYB9HLFYvUecF9daJbp57cXiz5oZs3ti8EfRZfk5lOMRqgPh2NHeXracyozKwZx//KXznFzi5gNHsh2orRp/ZYTKk1dDpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fY1Ih3HJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fY1Ih3HJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WsF6C2pz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 08:03:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5CAE43F05;
	Mon, 19 May 2025 22:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2379C4CEE4;
	Mon, 19 May 2025 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747692191;
	bh=dP8DTzm2DGeiuCXy2S920fdu9ae3F5qfO3VOTNqBlDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fY1Ih3HJDv1BXFOaah3htNOB7+kdjIfLm1whO3wWOOdiW3eWfYYLWosKGrHKP7BVx
	 LD9CD1LJtESRSDjfxmSpuVrFkne42Z9yas3F52WtjgpUcScId9doSWSDTYB06j5Xc6
	 2fTmvdGfPSvP+fqYC9Sjf3o9yKTS+NaBat7bIgYkuTDavFNAWJ278cilzD2SuYT85m
	 aGHAqyAyqTDFiT3BU2qU+CrdhVwStwurrta6JIMztmfiycDJsirpJg06pYtwuJfrEL
	 t0B9/oHhT7xiYErIZdBXySyp/gkQUaFkVp61GB1I/9eRGPWjSvwWeKakgamdW6NmXK
	 257opCzTtmGpQ==
Date: Mon, 19 May 2025 17:03:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
	manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com,
	oohall@gmail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
Message-ID: <20250519220310.GA1258923@bhelgaas>
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
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 17, 2025 at 12:55:14AM +0800, Hans Zhang wrote:
> The following series introduces a new kernel command-line option aer_panic
> to enhance error handling for PCIe Advanced Error Reporting (AER) in
> mission-critical environments. This feature ensures deterministic recover
> from fatal PCIe errors by triggering a controlled kernel panic when device
> recovery fails, avoiding indefinite system hangs.

We try very hard not to add new kernel parameters.

It sounds like part of the problem is the use of SPI interrupts rather
than the PCIe-architected INTx/MSI/MSI-X.  I'm not sure this warrants
generic upstream code changes.  This might be something you need to
maintain out-of-tree.

> Problem Statement
> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
> traditional error recovery mechanisms may leave the system unresponsive
> indefinitely. This is unacceptable for high-availability environment
> requiring prompt recovery via reboot.
> 
> Solution
> The aer_panic option forces a kernel panic on unrecoverable AER errors.
> This bypasses prolonged recovery attempts and ensures immediate reboot.
> 
> Patch Summary:
> Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
> its purpose and usage.
> 
> Command-Line Handling: Implements pci=aer_panic parsing and state
> management in PCI core.
> 
> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
> mode is active.
> 
> Panic Trigger: Modifies recovery logic to panic the system when recovery
> fails and aer_panic is enabled.
> 
> Impact
> Controlled Recovery: Reduces downtime by replacing hangs with immediate
> reboots.
> 
> Optional: Enabled via pci=aer_panic; no default behavior change.
> 
> Dependency: Requires CONFIG_PCIEAER.
> 
> For example, in mobile phones and tablets, when there is a problem with
> the PCIe link and it cannot be restored, it is expected to provide an
> alternative method to make the system panic without waiting for the
> battery power to be completely exhausted before restarting the system.
> 
> ---
> For example, the sm8250 and sm8350 of qcom will panic and restart the
> system when they are linked down.
> 
> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
> 
> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
> 
> 
> Since the design schemes of each SOC manufacturer are different, the AXI
> and other buses connected by PCIe do not have a design to prevent hanging.
> Once a FATAL error occurs in the PCIe link and cannot be restored, the
> system needs to be restarted.
> 
> 
> Dear Mani,
> 
> I wonder if you know how other SoCs of qcom handle FATAL errors that occur
> in PCIe link.
> ---
> 
> Hans Zhang (4):
>   pci: implement "pci=aer_panic"
>   PCI/AER: Introduce aer_panic kernel command-line option
>   PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
>   PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
> 
>  .../admin-guide/kernel-parameters.txt          |  7 +++++++
>  drivers/pci/pci.c                              |  2 ++
>  drivers/pci/pci.h                              |  4 ++++
>  drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
>  drivers/pci/pcie/err.c                         |  8 ++++++--
>  5 files changed, 37 insertions(+), 2 deletions(-)
> 
> 
> base-commit: fee3e843b309444f48157e2188efa6818bae85cf
> prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
> prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b
> -- 
> 2.25.1
> 

