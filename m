Return-Path: <linuxppc-dev+bounces-13220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DF5C02E9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 20:25:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csvbZ5g1Lz3bfF;
	Fri, 24 Oct 2025 05:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761243930;
	cv=none; b=RVKSyvSIVNynLj+ZY5Qivc5yWElIdcHIMZayZKsXU257kMmdwhPiq2eK1JJpAC1Ile1VhZdcy5vUxWZTzrQyO/fTL1bhpEJ5R9Q5cYKxC5pgZrjE3nQjzJ1oXPlHfqN799Ile1mil1fL9y6MJzLqS3yg/kUH0j7b2XsVV+e8f7EcZkXAsT0R4GrX9UvJ8A/7WIKaROf/jCYDBpZAynXnL0Sc7toxQwd8im11jkWaiUEFzznVJ/nay/AKpkB5ktSDThX7dGWO+MQE9RWxI68Npt2tUtIHbITBqal+EMJHPb8weBBz8XgCZ+xrCFEVWp9bmCSEBpYcvL3X2pHPpSSgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761243930; c=relaxed/relaxed;
	bh=4+62wyTCJyLAiYIDQNu3kvnegWQcawElkeVEBVHKlDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dkr9a1VlY2QZP8y/6uOsGOaVJSg81WcgYivy0fcQfm+/Qr/t1zJf3X0uPKzbUVxQc6XkTTdvIn4gFB5FhSxZdmOr0L8bnCZ2xgEzcZKxKwy2yGqilE8MJmD2fBHqjy0JWtFVCimrUgqHWC/D3HfM8pDT5FmxTxi6ITfh+wcKshRDmK4/tqVsp1s6zaL+/p+D0NI6Tf9hZhLbijEKNua/u1ZfnuSIW8F8zQlWhGzgjpMjsCqjo5ItM5DHYr65gEjGyuTXBohUMZs6R22slLBzLM2HEttha5xTsydJwuPtN3Zqkpns20YqtVVNGAOF9QX5Bmx291LY8JDW5IC08e+h4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o3bQddqm; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o3bQddqm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csvbY5H0bz3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 05:25:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C9EA61185;
	Thu, 23 Oct 2025 18:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23F9C4CEE7;
	Thu, 23 Oct 2025 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761243926;
	bh=mOBvJWsTb0vY1iyFfVuyBlLeVYQAHWLsWjtUccN/ADA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o3bQddqmlEUkUHxUG3lxTANhdQ3CzljYSwNiZ+aw9PrwVxuPEQ1VK1NjH6lSPvVgj
	 qYmBKwvUS0H/uIkSkZ/SxY1ue9eAEA+RHhnIhfII0JqwYt7whu4wIC0UAnoEvXkJmR
	 xYH77ZXgLn00Q+kGapHy5q1qyteK081AOWetYP5XE270E36LWDnEgRHAcyKV5ivYYz
	 10KMcwk98UI4QGwgIXVTzHtRQZI8BxHglr31GuDXx6XHYRNGzM4NnnAl1Rpunvg6gl
	 CSfbS5ZdJRzisTbKkDo8ORXc/RZjiUWxCpgYfKqPDscSeSsaBxrf72IDO2M+9o2+02
	 74WzG/ZfLnP/g==
Date: Thu, 23 Oct 2025 13:25:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <20251023182525.GA1306699@bhelgaas>
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
In-Reply-To: <20251023180645.1304701-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> platforms") enabled Clock Power Management and L1 PM Substates, but those
> features depend on CLKREQ# and possibly other device-specific
> configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
> blindly enable Clock PM and L1 PM Substates.
> 
> Enable only ASPM L0s and L1, and only when both ends of the link advertise
> support for them.
> 
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>

Provisionally applied to pci/for-linus, hoping to make v6.18-rc3.

Happy to add any testing reports or amend as needed.

> ---
> I intend this for v6.18-rc3.
> 
> I think it will fix the issues reported by Diederik and FUKAUMI Naoki (both
> on Rockchip).  I hope it will fix Christian's report on powerpc, but don't
> have confirmation.  I think the performance regression Herve reported is
> related, but this patch doesn't seem to fix it.
> 
> FUKAUMI Naoki's successful testing report:
> https://lore.kernel.org/r/4B275FBD7B747BE6+a3e5b367-9710-4b67-9d66-3ea34fc30866@radxa.com/
> ---
>  drivers/pci/pcie/aspm.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 7cc8281e7011..79b965158473 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -243,8 +243,7 @@ struct pcie_link_state {
>  	/* Clock PM state */
>  	u32 clkpm_capable:1;		/* Clock PM capable? */
>  	u32 clkpm_enabled:1;		/* Current Clock PM state */
> -	u32 clkpm_default:1;		/* Default Clock PM state by BIOS or
> -					   override */
> +	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
>  	u32 clkpm_disable:1;		/* Clock PM disabled */
>  };
>  
> @@ -376,18 +375,6 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
>  	pcie_set_clkpm_nocheck(link, enable);
>  }
>  
> -static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
> -						   int enabled)
> -{
> -	struct pci_dev *pdev = link->downstream;
> -
> -	/* For devicetree platforms, enable ClockPM by default */
> -	if (of_have_populated_dt() && !enabled) {
> -		link->clkpm_default = 1;
> -		pci_info(pdev, "ASPM: DT platform, enabling ClockPM\n");
> -	}
> -}
> -
>  static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
>  {
>  	int capable = 1, enabled = 1;
> @@ -410,7 +397,6 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
>  	}
>  	link->clkpm_enabled = enabled;
>  	link->clkpm_default = enabled;
> -	pcie_clkpm_override_default_link_state(link, enabled);
>  	link->clkpm_capable = capable;
>  	link->clkpm_disable = blacklist ? 1 : 0;
>  }
> @@ -811,19 +797,17 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
>  	struct pci_dev *pdev = link->downstream;
>  	u32 override;
>  
> -	/* For devicetree platforms, enable all ASPM states by default */
> +	/* For devicetree platforms, enable L0s and L1 by default */
>  	if (of_have_populated_dt()) {
> -		link->aspm_default = PCIE_LINK_STATE_ASPM_ALL;
> +		if (link->aspm_support & PCIE_LINK_STATE_L0S)
> +			link->aspm_default |= PCIE_LINK_STATE_L0S;
> +		if (link->aspm_support & PCIE_LINK_STATE_L1)
> +			link->aspm_default |= PCIE_LINK_STATE_L1;
>  		override = link->aspm_default & ~link->aspm_enabled;
>  		if (override)
> -			pci_info(pdev, "ASPM: DT platform, enabling%s%s%s%s%s%s%s\n",
> -				 FLAG(override, L0S_UP, " L0s-up"),
> -				 FLAG(override, L0S_DW, " L0s-dw"),
> -				 FLAG(override, L1, " L1"),
> -				 FLAG(override, L1_1, " ASPM-L1.1"),
> -				 FLAG(override, L1_2, " ASPM-L1.2"),
> -				 FLAG(override, L1_1_PCIPM, " PCI-PM-L1.1"),
> -				 FLAG(override, L1_2_PCIPM, " PCI-PM-L1.2"));
> +			pci_info(pdev, "ASPM: default states%s%s\n",
> +				 FLAG(override, L0S, " L0s"),
> +				 FLAG(override, L1, " L1"));
>  	}
>  }
>  
> -- 
> 2.43.0
> 

