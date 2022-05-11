Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C30524127
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:41:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzBJ93G24z3c7p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:41:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Re+nssaR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Re+nssaR; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzBH30ctfz3bxH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 09:40:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8EA6B82642;
 Wed, 11 May 2022 23:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA7BC340EE;
 Wed, 11 May 2022 23:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652312426;
 bh=BcJUboTaUZoL2am5X6SCUpWDDgK1oDr15p8F92dFBuk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Re+nssaRjnexpOCMoYquJSp2d4EXRkZ9id1SfJXDfgOm7quJkAH/GX7EfWXjz1pwQ
 PxuG+scSUVN1f4jUQITeJGass9vxshOdI90aUk5+B42Orkv7em+IrzeNzxja8GCDQ2
 qcrxBfkYllmfGFr4VdXKAmDOEgXJKTGRmxH5VKLjQ4quuahihsYCl/m7PkOXbPCWGC
 ro9WYcopCpPItPSlLhnE5fPLx/SyATbMAFpm5AeNKV/dypO2QPZzNC7U00A7KTehPx
 fM0qrMqbds2rMVX8mN21jJYczHYh3J904YufGJOsMoox/UMBC2lxmrT96tlMzPr40f
 EUzEGzwduIotw==
Date: Wed, 11 May 2022 18:40:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220511234024.GA831116@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 18, 2022 at 03:02:37PM +0000, Kuppuswamy Sathyanarayanan wrote:
> Currently the aer_irq() handler returns IRQ_NONE for cases without bits
> PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
> assumption is incorrect.
> 
> Consider a scenario where aer_irq() is triggered for a correctable
> error, and while we process the error and before we clear the error
> status in "Root Error Status" register, if the same kind of error
> is triggered again, since aer_irq() only clears events it saw, the
> multi-bit error is left in tact. This will cause the interrupt to fire
> again, resulting in entering aer_irq() with just the multi-bit error
> logged in the "Root Error Status" register.
> 
> Repeated AER recovery test has revealed this condition does happen
> and this prevents any new interrupt from being triggered. Allow to
> process interrupt even if only multi-correctable (BIT 1) or
> multi-uncorrectable bit (BIT 3) is set.
> 
> Also note that, for cases with only multi-bit error is set, since this
> is not the first occurrence of the error, PCI_ERR_ROOT_ERR_SRC may have
> zero or some junk value. So we cannot cleanly process this error
> information using aer_isr_one_error(). All we are attempting with this
> fix is to make sure error interrupt processing can continue in this
> scenario.
> 
> This error can be reproduced by making following changes to the
> aer_irq() function and by executing the given test commands.
> 
>  static irqreturn_t aer_irq(int irq, void *context)
>          struct aer_err_source e_src = {};
> 
>          pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
> 				&e_src.status);
>  +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
>  +		e_src.status);
>          if (!(e_src.status & AER_ERR_STATUS_MASK))

Do you mean

  if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))

here?  AER_ERR_STATUS_MASK would be after this fix.

>                  return IRQ_NONE;
> 
>  +       mdelay(5000);
