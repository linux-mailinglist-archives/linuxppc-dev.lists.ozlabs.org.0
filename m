Return-Path: <linuxppc-dev+bounces-9499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBEADF695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMtQB2ZhGz3c85;
	Thu, 19 Jun 2025 05:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750273314;
	cv=none; b=V+edn0T2gAPce3M0/eRwjL31XXLKBfzYhOWoJgn/Q9+bTgSTKYAPFFvPRvwkR/M5k8NkGAxOz/OxbJndc0i4pHHuqsAyJ3KcLoZKxjmZksseJxAV0XWwebduBa5sHwFIHdlm/ltMyRh57Uevh6faWnrTur81fFp7vn1QBMaEKW1h35pZcVbzRgKeYwxKM4g2h/uUXxrNd8ZQW/Xiq9Dzp8YqVAVAGOilArtE8d6PJMfN3go8H7vnoka8JcbeYLqQ09G0BzSsKMjbCJXVBPckUtaGT/bizJ4jpg1GmlYR+vnJ2EOCSVQz1MDFRllzAk9RlP7duQIu+umjH5xEuQ3iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750273314; c=relaxed/relaxed;
	bh=iiv+lJfA/N+4rek31TiwxyVNzPAGaWDD84STdig6oIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=B/Vsr2QVb5Zm48NJVpT72be3ePe/ZcV7/KxKIjRozdayrsjR8R7rS+U8qgntUHQkS2+6T+bcRtunaBPKyl+4IeRP9RXuAzETuWPTXfgDF0kCO2HF9P0eu6InH/HzVjf7VkCToA29z6m220R8tpIpSQlJw+3kzXOGTBZwgGiD9tDxXBfKOIl6UrDp4eoCvdawq/+iUqKiTHruVQANsrzapAwmTL26u/BtRtYCy7c6f/WD0UWwj/0iJwpIWivOkJyw/nLRhwh7jlqwKOC9MQUSwu13kIvS9zvAEkKilZYqm4Tgx3DwnGFZR0AAQlXSSmwofkG02i5ZCI6S9rcshnUXGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aIUbZUIf; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aIUbZUIf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMtQ726Yjz3c7j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:01:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FF6061F1F;
	Wed, 18 Jun 2025 19:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8753C4CEE7;
	Wed, 18 Jun 2025 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750273307;
	bh=+KcHMYRo/RJ8EBPeL+YSCOGo7cPihC08cm5ZqMYgQMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aIUbZUIfrIdiBvY7idLtRJUkaYJ/xfiqwwQy1OIAx52V25PKkcPJxJguQWRzuJpqj
	 ZNkzWYcW1f3fbhWO2Ifn4bIqQ3Qc0WSETv37uz/c6+kReljDLKiRamHSOzWV7NoBwr
	 yM0rznDrbbdHO4p8NdjbNFaZ2IkKFuFze+Iv3Symvxv0E9OqhZyhx99BFyxVL7iuP9
	 R64qMpQuljf5g6JkieRXZRRtqJrl4SuGUMJNMnfm/PVWMRTKx+QBO2LizPLw5AJYqz
	 RGDkV2KIFBK0hXOskyjmT6FsqVAMyalrPDSyK+RXe0Zv2DKjNee4pwjVrpykcIQeFF
	 wtNZo2r7FTkCg==
Date: Wed, 18 Jun 2025 14:01:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
Message-ID: <20250618190146.GA1213349@bhelgaas>
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
In-Reply-To: <300098407.1310656.1750265939231.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 11:58:59AM -0500, Timothy Pearson wrote:
>  state

Weird wrapping of last word of subject to here.

> The PCIe specification allows three attention indicator states,
> on, off, and blink.  Enable all three states instead of basic
> on / off control.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 0ceb4a2c3c79..c3005324be3d 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -440,10 +440,23 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
>  	return ret;
>  }
>  
> +static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8 *state)
> +{
> +	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
> +	struct pci_dev *bridge = php_slot->pdev;
> +	u16 status;
> +
> +	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
> +	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;

Should be able to do this with FIELD_GET().

Is the PCI_EXP_SLTCTL_PIC part needed?  It wasn't there before, commit
log doesn't mention it, and as far as I can tell, this would be the
only driver to do that.  Most expose only the attention status (0=off,
1=on, 2=identify/blink).

> +	return 0;
> +}
> +
> +
>  static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
>  {
>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>  
> +	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);

This is a change worth noting.  Previously we didn't read the AIC
state from PCI_EXP_SLTCTL at all; we used php_slot->attention_state to
keep track of whatever had been previously set via
pnv_php_set_attention_state().

Now we read the current state from PCI_EXP_SLTCTL.  It's not clear
that php_slot->attention_state is still needed at all.

Previously, the user could write any value at all to the sysfs
"attention" file and then read that same value back.  After this
patch, the user can still write anything, but reads will only return
values with PCI_EXP_SLTCTL_AIC and PCI_EXP_SLTCTL_PIC.

>  	*state = php_slot->attention_state;
>  	return 0;
>  }
> @@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot *slot, u8 state)
>  	mask = PCI_EXP_SLTCTL_AIC;
>  
>  	if (state)
> -		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
> +		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);

This changes the behavior in some cases:

  write 0: previously turned indicator off, now writes reserved value
  write 2: previously turned indicator on, now sets to blink
  write 3: previously turned indicator on, now turns it off

>  	else
>  		new = PCI_EXP_SLTCTL_ATTN_IND_OFF;
>  
> -- 
> 2.39.5

