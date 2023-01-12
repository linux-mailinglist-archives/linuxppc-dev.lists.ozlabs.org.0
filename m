Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3A667E21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 19:26:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtCgV1mj2z3fCZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 05:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rXcTrjNc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rXcTrjNc;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtCdz0mG9z3fBv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 05:25:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5662362134;
	Thu, 12 Jan 2023 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867E5C433EF;
	Thu, 12 Jan 2023 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673547923;
	bh=7E80cFZGxF2ybWEYKWVeToLIO7ZFtLVaNaJj6DWrgtE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rXcTrjNcq6AOHbgz725RLARmoWDfgUQOF4mZ1FavcoZeG+r/Ahb5BWnkvg2lrlD3M
	 xW/H2kQi+QifH3v7qlvSknWQs1ONJh/b3qZBjYPdekHFJplvzPuNm8a4fDBQWWWZBV
	 268pM833VrVzCS7stzhlbIvrmpsl9jgQhfq5Hjej0QtR/d1i+pyra6v4dvtncnGvim
	 12K9MDJKrqZ3+PWgeFHalHjtXjPA13RymwPO7QbnLvioyAJl4hx5J23sMiZJJdP8hA
	 xgdn6KKmmY9w6/2Xl+bhh5eHM4fr8CRZ4ED9TTI5o3QUXh+aX/0heczhPxd/N8B28U
	 RU0MXGL4cPOHQ==
Date: Thu, 12 Jan 2023 12:25:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V2] PCI/AER: Configure ECRC only AER is native
Message-ID: <20230112182522.GA1778254@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112072111.20063-1-vidyas@nvidia.com>
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 12:51:11PM +0530, Vidya Sagar wrote:
> As the ECRC configuration bits are part of AER registers, configure
> ECRC only if AER is natively owned by the kernel.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

Applied to pci/aer for v6.3, thanks!

> ---
> v2:
> * Updated kernel-parameters.txt document based on Bjorn's suggestion
> 
>  Documentation/admin-guide/kernel-parameters.txt | 4 +++-
>  drivers/pci/pcie/aer.c                          | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 426fa892d311..8f85a1230525 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4242,7 +4242,9 @@
>  				specified, e.g., 12@pci:8086:9c22:103c:198f
>  				for 4096-byte alignment.
>  		ecrc=		Enable/disable PCIe ECRC (transaction layer
> -				end-to-end CRC checking).
> +				end-to-end CRC checking). Only effective if
> +				OS has native AER control (either granted by
> +				ACPI _OSC or forced via "pcie_ports=native")
>  				bios: Use BIOS/firmware settings. This is the
>  				the default.
>  				off: Turn ECRC off
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e2d8a74f83c3..730b47bdcdef 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
>   */
>  void pcie_set_ecrc_checking(struct pci_dev *dev)
>  {
> +	if (!pcie_aer_is_native(dev))
> +		return;
> +
>  	switch (ecrc_policy) {
>  	case ECRC_POLICY_DEFAULT:
>  		return;
> -- 
> 2.17.1
> 
