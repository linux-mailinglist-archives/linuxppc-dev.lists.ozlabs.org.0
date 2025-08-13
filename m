Return-Path: <linuxppc-dev+bounces-10959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49BB252F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 20:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2Gt31F5fz30Qk;
	Thu, 14 Aug 2025 04:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755109307;
	cv=none; b=RKJc+ux6ySz5e0JluZKxysMNbav/6GxgVKffn+OdJthmDShsIJUMdRHGzwdYeWhMhBCfcu1TBy+uPjjoGoFYTAMRo+0ReBwA0k7V2YFNx+BMAvVHryuBv89F6wqAfB2jaq4k0xv4UjWJvZlvMaaJYZos4J72OKuiBQNejflDBwuK/0uBteVChDY3U7jd/QZDIhLr75xM41j7THy/Cxxtx76xnpo5Yiaf3FnTierLxzUq67nPV6UgzVcDBCvuBu3/jBEUzr+JKph7eBRDdrtOhn6TLTfcziidFU5oTo2P8JGQTX4uvy78/TlVC/VC6Lc+/XokYSpRFop5fD7l1hyhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755109307; c=relaxed/relaxed;
	bh=6zUl0Eq6Fc+iqSxbhSfLOzZHT/armqF1X1gWG6H04gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SgRWEkCKDV+sRtgm7b3PS2XBqeNH1EivgTcE1fG2RQnYTDQPHRhpqHSMvVmpod2thUoaGvN2amwaZn2pNgFCD0bL4pv/NDh7227rqr0jrR39XWxA/E2CEkGhHFLZjvI4Jcjrx4E7eerFupfZPEII8qXTUQO3M7g8XScvksw+XMpqQoUK5MKwNH7zB1+rAN1FE26qTHzRtiWu1HstcuTMPVD8r9H9gZ4Bd+JXAcqvygn6ZzD0b5/dTRsVdnyNG7AgREtT+q2POzkvXrPIfwPqae0Olhw5Cn+PKtH+7I02FTS/REcDTsAskRl6wx7WjiQrw9Y3J7/Ahe5DRxvusw6smA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d0tXGjri; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d0tXGjri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2Gt16rfgz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 04:21:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB7FB5C6E7C;
	Wed, 13 Aug 2025 18:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265E1C4CEEB;
	Wed, 13 Aug 2025 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755109303;
	bh=m2dHhOh71l27TfOyul2QFpCLU8gr00gihOmNiH3cfok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=d0tXGjriRbT/lDQu8XoR2xw6GFLRQrG33FOX7ZW7/c0eVqzUV6GE3rkjcjDNxj5fi
	 FOFFe9Kp0KSQh6IS5tRaIwR+R5ELW2ddlfXH4ZIgrr9GHrC2pqp/EU5rryS7pRfofJ
	 nqlEFhaq84ZufKrJiLVDw/VbIbyiK45nkULmgvElXiqhWjlpUXOG6NHN+KC1TDOVqb
	 4yFSRDEGra3Ng+m39pU9ZOnEaCQQFO1Lfc7i9DbZik/PHeFbagg2H3N7BdBURiZY9O
	 k8MpR6uzftJ3Ty6jvObrUpAtVQPjjFRVmLIo9/P0n0xtfkg78JW0hpr8Rp2t3XoXET
	 SVygpQqXQAEiA==
Date: Wed, 13 Aug 2025 13:21:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Riana Tauro <riana.tauro@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	Shahed Shaikh <shshaikh@marvell.com>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Edward Cree <ecree.xilinx@gmail.com>, linux-net-drivers@amd.com,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vg,
	er.kernel.org@lists.ozlabs.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/5] PCI: Reduce AER / EEH deviations
Message-ID: <20250813182141.GA284875@bhelgaas>
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
In-Reply-To: <cover.1755008151.git.lukas@wunner.de>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 07:11:00AM +0200, Lukas Wunner wrote:
> The kernel supports three different PCI error recovery mechanisms:
> 
> * AER per PCIe r7.0 sec 6.2 (drivers/pci/pcie/aer.c + err.c)
> * EEH on PowerPC (arch/powerpc/kernel/eeh_driver.c)
> * zPCI on s390 (arch/s390/pci/pci_event.c)
> 
> In theory, they should all follow Documentation/PCI/pci-error-recovery.rst
> to afford uniform behavior to drivers across platforms.
> 
> In practice, there are deviations which this series seeks to reduce.
> 
> One particular pain point is AER not allowing drivers to opt in to a
> Bus Reset on Non-Fatal Errors (patch [1/5]).  EEH allows this and the
> "xe" graphics driver would like to take advantage of it on AER-capable
> platforms.  Patches [2/5] to [4/5] address various other deviations,
> while patch [5/5] cleans up old gunk in code comments.
> 
> I've gone through all drivers implementing pci_error_handlers to ascertain
> that no regressions are introduced by these changes.  Nevertheless further
> reviewing and testing would be appreciated to raise the confidence.
> Thanks!
> 
> Lukas Wunner (5):
>   PCI/AER: Allow drivers to opt in to Bus Reset on Non-Fatal Errors
>   PCI/ERR: Fix uevent on failure to recover
>   PCI/ERR: Notify drivers on failure to recover
>   PCI/ERR: Update device error_state already after reset
>   PCI/ERR: Remove remnants of .link_reset() callback
> 
>  .../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c   |  1 -
>  .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  |  2 -
>  drivers/net/ethernet/sfc/efx_common.c         |  3 --
>  drivers/net/ethernet/sfc/falcon/efx.c         |  3 --
>  drivers/net/ethernet/sfc/siena/efx_common.c   |  3 --
>  drivers/pci/pcie/err.c                        | 40 ++++++++++++++-----
>  drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
>  drivers/scsi/qla2xxx/qla_os.c                 |  5 ---
>  8 files changed, 32 insertions(+), 27 deletions(-)

Applied to pci/aer for v6.18, thanks, Lukas!

