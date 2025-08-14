Return-Path: <linuxppc-dev+bounces-11039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE2B27080
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 23:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2yNb3CZgz30WS;
	Fri, 15 Aug 2025 07:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755205327;
	cv=none; b=IgvxYqTYeEzSQyt484kRsx97v/n5FcDaOEaNBy5CcmZcsTUWJujL6geVD/4ZbLJSAfC1cv6KpOd/sR1urL4oJXEFOACc3qN1oeGw57geXc4rKIxyQPH0urCd71qkHLNwZk0lPKrWcE2t069/iDN2ttRW53CNUfz/3xtsdcnPpwyLuvv6sFIHVCawPSs3J4hPGrjGmCk3F6h2tUrYooXiEd64aI5PQjsILJP2hN/w4tQxvw7n2w+x20Sp4pCIr4rRLi4OvA73xO4GSMxkL8Yl9nnYbx2xOgszycmhDefrkoVdlETkJiFiNkFP7pCvLEi79J6ORUw0E5xDdrp5Sa2fag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755205327; c=relaxed/relaxed;
	bh=kK6P3KWGQuNc4SOK5Ugkl+YMaWtANy/HqG6R+xDa7y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=K3z3RCgFf4a4WE8Jt8uqNMsD/DP2YNbn5ZATQ/0UoMKEX+M2N0P47tU7+JIUiSEbGDO3HcXvvCBSa0y7dqwxhnJyYBV2DV/v8VtPllWkS1KQ8QS6JTphqlVLkuRUzlpEjWsIlC3Fc2LPiAGe/gAOcV3ro1+4GV929FbComa8trHS3hxFbXP5KJYBhoqIh97oIlRS/M2Po+CEASnM33DrjKdw3tAgmbq8ahJ4xwvX4GN3uBKoORC6PoaADlT3h2gmUK+9/i2oFAjeeQ/5C9f+M+EBhQIIXh/fFyc6Fjx5EbLmOJUJDyFGGt3BrxM6Zn/igIkk6ZO0rG7entmNBn3h2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=luVafUmX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=luVafUmX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2yNZ4Z5Rz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 07:02:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAEB95C6710;
	Thu, 14 Aug 2025 21:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583E0C4CEED;
	Thu, 14 Aug 2025 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205323;
	bh=SPIR3Nsw+5J3K3Ewb8jiZA+vLOjaQGkkApcnPTOLSPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=luVafUmXkK48Wbx3zLnbSoF++g69YJbKIO9NYmamezJOm9eb4seLzVQstBzNGEtfO
	 2tb9MfDmu2ynxCaA8bwbD9IExbjzQSMabId7s0712YeNhMxdWjH11pFUEJVLj6fcZI
	 PYZpHRCxxZGGO6WQ0VCvNFklMxQy/fnGkg1YHVtZ4ESyVP3vj7FQqbHEQaKHizFt4h
	 WU2uj6tLEHQADpYMtia9+/VAmUYTWr8mxEvS4reD6sbcqOagJfNaEOiD+2Y/uvUe0z
	 oHCe5NsVJe6CKIN+T13DhExo8jvcSQm927JqZRTxj9O5L5zoLZNN5esXiur6Bo+T/m
	 OooBs0t1hXnJQ==
Date: Thu, 14 Aug 2025 16:02:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v5 0/3] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Message-ID: <20250814210201.GA348169@bhelgaas>
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
In-Reply-To: <20250807-add_err_uevents-v5-0-adf85b0620b0@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 07, 2025 at 03:55:37PM +0200, Niklas Schnelle wrote:
> Hi Bjorn, Lukas, Mahesh,
> 
> This series adds issuing of uevents during PCI recovery on s390. In
> developing this I noticed that pci_uevent_ers() ignores
> PCI_ERS_RESULT_NEED_RESET. I think this will result in AER not generating a uevent
> at the beginning of recovery if drivers request a reset via the voting
> on error_detected() returns. This is fixed in the first patch and relied
> upon by the s390 recovery code as it also uses the result of
> error_detected() though with one device/driver at a time.
> 
> Thanks,
> Niklas
> 
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Changes in v5:
> - Add R-b from Lukas Wunner for EEH
> - Improve commit message for EEH (Lukas Wunner)
> - Move the EEH patch to the end so the reference to s390 relies on the
>   as is and not future state ;)
> - Link to v4: https://lore.kernel.org/r/20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com
> 
> Changes in v4:
> - Add change in EEH to use the return of error_detected() in the uevent
>   just like AER and the new s390 code
> - Add R-b from Lukas
> - Link to v3: https://lore.kernel.org/r/20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com
> 
> Changes in v3:
> - Reworded cover letter
> - Rebase on v6.16
> - Link to v2: https://lore.kernel.org/r/20250623-add_err_uevents-v2-0-a3a2cf8e711d@linux.ibm.com
> 
> Changes in v2:
> - Add a patch fixing pci_uevent_ers() mistakenly ignoring PCI_ERS_RESULT_NEED_RESET
> - Use the result of error_detected() for initial pci_uevent_ers()
> - Drop fixes tag in s390 patch
> - Rebase and re-test on current master
> - Link to v1: https://lore.kernel.org/r/20250424-add_err_uevents-v1-1-3384d6b779c6@linux.ibm.com
> 
> ---
> Niklas Schnelle (3):
>       PCI/AER: Fix missing uevent on recovery when a reset is requested
>       PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery
>       powerpc/eeh: Use result of error_detected() in uevent
> 
>  arch/powerpc/kernel/eeh_driver.c | 2 +-
>  arch/s390/pci/pci_event.c        | 3 +++
>  drivers/pci/pci-driver.c         | 3 ++-
>  include/linux/pci.h              | 2 +-
>  4 files changed, 7 insertions(+), 3 deletions(-)

Applied on pci/aer for v6.18, thanks!  This on top of Lukas's series:

  https://lore.kernel.org/all/cover.1755008151.git.lukas@wunner.de/

Expect the whole branch to be rebased to add Reviewed-by, etc.

