Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85304752831
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 18:19:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOyqGAr/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R20DH33sXz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 02:19:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOyqGAr/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R20CR2Qq9z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 02:18:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07A7461A3C;
	Thu, 13 Jul 2023 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4214DC433C8;
	Thu, 13 Jul 2023 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689265104;
	bh=M5KNkk7y8WRgRwNkixhnaGSx2aVsqh4lnrhxGKhe8mM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lOyqGAr/LKuO0I7KVPy5t5cFIU2CVAi1pJixGngkGfDTAy1nbCGXfUUxp5ny3Z2wq
	 etnzslBN1vsOYYw4n00a1ACFW+ZUlcg8bHrBT3ty1UDExp2750/CxehRYiTlnSTKVr
	 HRMGMXSsflhd0L+82+0qWqY4ookgyK5pccLTxsl4ctx0JHrU9nMtfV3zLqAhh4pGtY
	 4CWRZLOlEiLSrViTx3hLqbu1u7Ba00DAeZlou8hMIpRhhpD9pAJLhi2wxUN6VkTPqn
	 Y+qkmsVM73/9QGntMQbBs2XJum1IRyjEboJSF3OVzN/g6LyA8RShq9toiIZ6jbUHzb
	 C37Au2fkQ2ymA==
Date: Thu, 13 Jul 2023 11:18:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI/AER: Remove/unexport error reporting
 enable/disable
Message-ID: <20230713161822.GA320898@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710232136.233034-1-helgaas@kernel.org>
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 06:21:34PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> pci_disable_pcie_error_reporting() is unused; remove it.
> pci_enable_pcie_error_reporting() is used only inside aer.c; make it
> static.
> 
> Bjorn Helgaas (2):
>   PCI/AER: Drop unused pci_disable_pcie_error_reporting()
>   PCI/AER: Unexport pci_enable_pcie_error_reporting()
> 
>  drivers/pci/pcie/aer.c | 15 +--------------
>  include/linux/aer.h    | 11 -----------
>  2 files changed, 1 insertion(+), 25 deletions(-)

Applied to pci/aer for v6.6, thanks Christoph and Sathy!
