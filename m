Return-Path: <linuxppc-dev+bounces-12629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3ABB1DC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 01 Oct 2025 23:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccStl6sZZz3cfm;
	Thu,  2 Oct 2025 07:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759354623;
	cv=none; b=ZjeoX5/9mYqsls3qVmA97x/yK5iS3vRvesB8De8uwQCpNXVaaGsMruKYGBFUHynXhnyAXEjOV13RTM+HffDGHOAkmGCrQ7Qwk5IlQM8V/mfL/1jlJwAC/LtlgIj4yUog9YgB4AbITJM2OUQSKmt8bMHz0GGLl2lbID3SJC3RCu5GYfQGCvLzbn60mps+jmNVynJQukl4izawgDiiGVR2dwEvcmFK9jRMC+JTEdgakG9Hq1f5N4NpeWjNTVOktW5NM9jeFChz8YwBvMM9wW/g/E90fsDqANra8o7LmzZF5rEgeZS4NRQYrhZtBRIIt8CXIU3c/V17ya0WO7xQbzqGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759354623; c=relaxed/relaxed;
	bh=ICkzJc+hAEMwI4mNZzq1NX6ihaYrcmm+HzRlfUlUtQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P93nzBar1yffk6W2r3Q70QiRqIT+F8NNEcaDrVKjhSc6gynGLETeZ/SczX1GQPQkBOAyWg4hlg4D2r//KGiaX1Xr3Rv7DzLVWdXoNE09btqqxjOtNDM1WPsxPJ/YBS2b0Y+z7ArfoWp4aGgsML+Lr8J/KTu+W1uZzwoRnDBmcJ0/w8Zmw/HyPraoG5HQXjelGPQWxFmAnKfjsr5Zm3Jy593Yxzx0ILFdTpKkmh+d+k/y28CdvY+ggu9vCkGOSCAgcffbT57b2GiZlIQ/AfvXj6TnwjSdODbbBEcO1satJzsJOxA6phagWVdZ7+xlX66pY2sSovtaBqzr6dHmqytxrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=epLMtl+x; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=epLMtl+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccStk33zJz3cfW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 07:37:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5C8A454FC;
	Wed,  1 Oct 2025 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A74C4CEF1;
	Wed,  1 Oct 2025 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759354618;
	bh=l882ipq009bfLKB8e6Q2lXRfa0190MoH1YGIaQSesJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=epLMtl+xhETPWKTnxwZv67J+cv3OVQpeTmHQE2ZJCughJAVB6ShIUgR7CP8WRPx+O
	 G1U+nxtL79Y0BxZffm/M6mc4Y20fL/0tJLyd63Dg+KoD5b0rgjadiXWsgk/ru2wNrX
	 k9GIA//tusinr20t93XVPBoKeqg7hc/QoeWXuCB6oOyg1WRnUUzFw392s3yGGRRyLW
	 4H4lVTtH1mJTEo8heZwQmzWORNuI3nSH7R2M6hiA6t4YiAe1wb7b9Mza6pwe+iUiTQ
	 BuwWI1WZiufIN4q96XSQLI5lGR0xUiVIvwiA6VehO3oE08LdnIHXfIVfuTAzMei3vd
	 8rX/TBRr7TopA==
Date: Wed, 1 Oct 2025 16:36:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] PCI/AER: Check for NULL aer_info before
 ratelimiting in pci_print_aer()
Message-ID: <20251001213657.GA241794@bhelgaas>
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
In-Reply-To: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 29, 2025 at 02:15:47AM -0700, Breno Leitao wrote:
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.
> 
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.
> 
> Cc: stable@vger.kernel.org
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Thanks, Breno, I applied this to pci/aer for v6.18.  I added a little
more detail to the commit log because the path where we hit this is a
bit obscure.  Please take a look and see if it makes sense:

  https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=451f30b97807

> ---
> - This problem is still happening in upstream, and unfortunately no action
>   was done in the previous discussion.
> - Link to previous post:
>   https://lore.kernel.org/r/20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org
> ---
>  drivers/pci/pcie/aer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d7167..55abc5e17b8b1 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>  
>  static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>  {
> +	if (!dev->aer_info)
> +		return 1;
> +
>  	switch (severity) {
>  	case AER_NONFATAL:
>  		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
> 
> ---
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

