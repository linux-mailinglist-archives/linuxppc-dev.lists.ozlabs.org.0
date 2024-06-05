Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C63AF8FD976
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:59:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jynu4bSk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvhFZ6sJ6z3brC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:59:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jynu4bSk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvhDr0fCNz2y70
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 07:58:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03FC2CE18F1;
	Wed,  5 Jun 2024 21:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E600C2BD11;
	Wed,  5 Jun 2024 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717624730;
	bh=LWOLMGrH5N2gPZ93B8pHBq6TnKvAfq2vS3ahIjsTjdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Jynu4bSkImO8IqHtm+3jiN9qiAD9ewBiRk0PE0yEZ+zElWILWk216XorAPgNDBENd
	 NK0xjtf8ROxwO028OP0/6en3xTOGj2EWTsNueN93OMfgH/nX30yWQpfMwg8FJgJtOw
	 PJJrsJ9uXVvTgWBO//SpM5MC9J3JF972AnDW2oKLutRHzj2o0zBip0u3fk4v6N41tm
	 muYZGCs//ESgvmeT84OzXxo3M8eQ+ea8ndE4mprl5Crie5PiA//dlMK+4SILrxQLcn
	 ksgT3rYoRj5moB9fkqk7UYLWqo4WQXSqu3JPaHgd5PSf7HpFL9qv4+CbblaY68VoFr
	 NJX9AO/b3s7SA==
Date: Wed, 5 Jun 2024 16:58:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Abhinav Jain <jain.abhinav177@gmail.com>
Subject: Re: [PATCH v2] PCI/AER: Print error message as per the TODO
Message-ID: <20240605215848.GA782210@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605212344.21808-1-jain.abhinav177@gmail.com>
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
Cc: javier.carrasco.cruz@gmail.com, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, skhan@linuxfoundation.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2024 at 09:23:44PM +0000, Abhinav Jain wrote:
> Print the add device error in find_device_iter()
> 
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
> 
> PATCH v1 link : https://lore.kernel.org/all/20240415161055.8316-1-jain.abhinav177@gmail.com/
> 
> Changes since v1:
>  - Replaced pr_err() with pr_notice()
>  - Removed unncessary whitespaces
> ---

Thanks for looking at this.

  - It doesn't apply to -rc1 (the TODO message is missing).  In PCI,
    we normally apply patches on topic branches based on -rc1.

  - The subject should be more specific so it makes sense all by
    itself, e.g., "Log note if we find too many devices with errors"

  - Add period at end of sentence in commit log.

  - Move historical notes (v1 URL, changes since v1) below the "---"
    line so they don't get included in the commit log.

  - __func__ is not relevant here -- that's generally a debugging
    thing.  We can find the function by searching for the message
    text.  In cases like this, I'd rather have something that helps
    identify a *device* that's related to the message, e.g., the
    pci_dev in this case.  So I'd suggest pci_err(dev, "...") here.

  - I'd keep pci_err() instead of switching to pr_notice().  If we get
    this message, we should re-think the way we collect this
    information, so I want to hear about it.

>  drivers/pci/pcie/aer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 0e1ad2998116..8b820a74dd6b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -885,8 +885,8 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>  		/* List this device */
>  		if (add_error_device(e_info, dev)) {
>  			/* We cannot handle more... Stop iteration */
> -			pr_err("find_device_iter: Cannot handle more devices.
> -					Stopping iteration");
> +			pr_notice("%s: Cannot handle more devices - iteration stopped\n",
> +					__func__);
>  			return 1;
>  		}
>  
> -- 
> 2.34.1
> 
