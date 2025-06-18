Return-Path: <linuxppc-dev+bounces-9504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE0ADF706
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMvLv3mD9z30T9;
	Thu, 19 Jun 2025 05:44:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750275847;
	cv=none; b=oDnC6jwRliPuQ4hDG0RcAk5d219I8YyUTkLOYOY0TfbdaJ/nz+dlRAowUCAGvGWHSuR4O7ugA2t92DgfQpIEaH+em1Zpy+IiGO/htPrmqZGiI0FFC93FCxt5Zlp3vCv5yGRxLc9aCnAka5pFkXSyFP0w3/t1z4K4C1yOgvfe/rtjSHx1wuJXmv1EShowvEAQdvRgj1AMmvHkBKcYjDDTrOJWD3bzxSYV8FXgpUg8shdJfvsstfQkpCn/AYBZ9E6WULbNKERaoLwW1QKM8ZYCza2NMKOfb4PhDauPK1qc3WX9o3A7+/kg92RIleEQyVbeKI17xs37nBUv1oRQR2WGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750275847; c=relaxed/relaxed;
	bh=twVhQ2epY2UsDg6xroRm42pUeT69vRdy7mfTXh+slI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HKO6dxeN6OkiK7wVqELMIPvH8W0lTogfO3hW7nmHAdHVKILSCqjlxJXlUF+V3ajIvtOnHEoUKGd0+8XpPFX+R/O5dxlA6948RejXksx63LcWQphk2/kmpiZ54r6dFwxL+DLMbd9Xi+tjFDPEcEPoK3tJQTXzi9qk0fj+gZv6eygQCa8/4FVIaQZU3NM5TTufWBhaSbVT7UqJGUgFlpixTIOITEow4ubb0zmoxdz7Ahh48wljWhvkLE+Rw+kAfqkp+kpQuQc8KfAG2YLvI46sWEkvtlOE6zNtFD2Q++MFy8yKrHLgoI99CzhArFjLPxuuvhZ8Hjca+bZ8kOW08OI9qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dZcEcIlx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dZcEcIlx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMvLr2rWbz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:44:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3412629CE;
	Wed, 18 Jun 2025 19:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8420CC4CEED;
	Wed, 18 Jun 2025 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750275841;
	bh=7eVewN673jHwQZJkWhF/hgscqK5uhDvpq3jqJohTquY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dZcEcIlxzmjGjevrwPL5VBRthst/bU56HrpDzV0SouXpQbvei7g5qbgCHWFqg9tow
	 c3HnRznLYYO682GbXkOGRxLgkAr6CMVtiRRQwP75W+ELUt7oooYVg4VW+sBh2jo8bj
	 bLZ1+/p7n0pz7i+b9I9A+djx9Oycqw8ovLsxM/nGFK60BCWmWZDiiygJ7eZwvrHX4N
	 cKL31BTq9sktKWJ04J0EYepoNYmjD+aO1i9ImxJaU3liXwbTPhC7conbfzRo/Oiu5w
	 awSotYZAfYhQZbmDH1Nz0X7wS4fZd6904++Xj/ENr+JJUZId4fQ1RyjCm/7sfK6yTP
	 MJ01+FAErk35Q==
Date: Wed, 18 Jun 2025 14:44:00 -0500
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
Message-ID: <20250618194400.GA1219576@bhelgaas>
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
In-Reply-To: <1741778252.1310636.1750265814430.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[+cc Lukas, pciehp expert]

On Wed, Jun 18, 2025 at 11:56:54AM -0500, Timothy Pearson wrote:
>  presence detection

(subject/commit wrapping seems to be on all of these patches)

> The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
> was observed to incorrectly assert the Presence Detect Set bit in its
> capabilities when tested on a Raptor Computing Systems Blackbird system,
> resulting in the hot insert path never attempting a rescan of the bus
> and any downstream devices not being re-detected.

Seems like this switch supports standard PCIe hotplug?  Quite a bit of
this driver looks similar to things in pciehp.  Is there some reason
we can't use pciehp directly?  Maybe pciehp could work if there were
hooks for the PPC-specific bits?

> Work around this by additionally checking whether the PCIe data link is
> active or not when performing presence detection on downstream switches'
> ports, similar to the pciehp_hpc.c driver.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index aec0a6d594ac..bac8af3df41a 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -391,6 +391,20 @@ static int pnv_php_get_power_state(struct hotplug_slot *slot, u8 *state)
>  	return 0;
>  }
>  
> +static int pcie_check_link_active(struct pci_dev *pdev)
> +{
> +	u16 lnk_status;
> +	int ret;
> +
> +	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
> +		return -ENODEV;
> +
> +	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
> +
> +	return ret;
> +}
> +
>  static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
>  {
>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
> @@ -403,6 +417,19 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
>  	 */
>  	ret = pnv_pci_get_presence_state(php_slot->id, &presence);
>  	if (ret >= 0) {
> +		if (pci_pcie_type(php_slot->pdev) == PCI_EXP_TYPE_DOWNSTREAM &&
> +			presence == OPAL_PCI_SLOT_EMPTY) {
> +			/*
> +			 * Similar to pciehp_hpc, check whether the Link Active
> +			 * bit is set to account for broken downstream bridges
> +			 * that don't properly assert Presence Detect State, as
> +			 * was observed on the Microsemi Switchtec PM8533 PFX
> +			 * [11f8:8533].
> +			 */
> +			if (pcie_check_link_active(php_slot->pdev) > 0)
> +				presence = OPAL_PCI_SLOT_PRESENT;
> +		}
> +
>  		*state = presence;
>  		ret = 0;
>  	} else {
> -- 
> 2.39.5

