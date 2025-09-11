Return-Path: <linuxppc-dev+bounces-12046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D11B53EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 00:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNCYz5GsHz3cYk;
	Fri, 12 Sep 2025 08:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757631303;
	cv=none; b=DD0F9uutCYu2WrEohWpVJuRgSOoVYmA31SFPtS7L6K5O4fcChZmsUUQD2KkpUfgh6jSS1di063V8J8cs8vBwS2pZZFtaDVRSIcNM+fC1Rwg4B4sUeWnaW3AYNrRgiScke6Posoe6RiU9O4L/rn6aaZJI84C35BcChoC+whjzRUMqhl+sr0nxpMUxmNI1Bjc3ZcHbEET3g4YHMj7tHGr4UYqZIYAs+CWGT+po4iMwKk6XTwopG/VlChQen7RuEnTPJ3G+lQzF8QowsQUs15Wcj0CaHJycEjv2Dz88f/CaOhxANzghZL2Utu7tj4npzN39r9zAwZ008sOlgeYMsWtekA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757631303; c=relaxed/relaxed;
	bh=rChUncMRxCUs3BY/vvSKFIGYXvIYpJ5XglJH3D9SBCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RNSNn1p1qHZ1fMvmpZD5ByIMp7+sFcXV5xNPcHuO0csLUYm+jZpthLpdo+jAqbx+cKMRDGgexl/wC8JLH2jihAFJkP0G8i/vsYx5PNH8ApR+6t+T34jAnN2rkZWiuiurfa87XZS4QCRU71GnZtga55O3uQENa2Vwp33WLWNKJuLj/T4tJzwVHZWo/3hASfH88NLLA8EjSLrFNr+YFta/aQDzrkbDfuc8piF/S2tle54N9NgR6MS4Rna6p7HKmC+xqq2Eqs+C5xW4nBwkoOSkgossxqUZKSm4clhh0u9wo8+KCeatMumsyiIWiJYWPt01ZC/0EqFZivYke005ZWavgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IE3kYxL3; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IE3kYxL3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNCYz05MLz3cYV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 08:55:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCC8E600BB;
	Thu, 11 Sep 2025 22:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6991AC4CEF0;
	Thu, 11 Sep 2025 22:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757631298;
	bh=9wA1L6p2PKuguKMkeIHlsJ7+VV03bsUAvg+8nv3mAs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IE3kYxL3j5ylxA9XwchT2l/UJCmXRe7xcP+pSsmNkKbs9B0khvd6aAXnJYdRV4jv5
	 MIYAIa4DXhp1LhxJYplXrppof8YZEgFKXTfGUJOWbYhvQMwSRo+oGplW5L/9uPO+Ob
	 J1zmkFspz+G3t4gvkjatMQYdASc4LHFKt5boqHny3xeR/XKpEn+JapLaZkVe+1IKcC
	 h9X4Ui5auC75CbrBY2fGH6MfFlTOwCXdZ6/kYduefY11XhKV+x+gS+b9saQHIgmhUj
	 ImvnkQXASqmZppEdl0fCXggHM7BPhNIM4dTILDAzaVoLGy4Mh9LfiX7eNyQu9HtGI9
	 nKr6b3EPhtZWw==
Date: Thu, 11 Sep 2025 17:54:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: mahesh@linux.ibm.com, bhelgaas@google.com, oohall@gmail.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>,
	Terry Bowman <terry.bowman@amd.com>,
	Robert Richter <rrichter@amd.com>, linux-cxl@vger.kernel.org,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
	Dongdong Liu <liudongdong3@huawei.com>
Subject: Re: [PATCH] PCI/AER: Fix NULL pointer access by aer_info
Message-ID: <20250911225457.GA1596803@bhelgaas>
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
In-Reply-To: <20250904182527.67371-1-vernon2gm@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[+cc Terry, Robert, CXL list, Smita, Dongdong]

On Fri, Sep 05, 2025 at 02:25:27AM +0800, Vernon Yang wrote:
> From: Vernon Yang <yanglincheng@kylinos.cn>
> 
> The kzalloc(GFP_KERNEL) may return NULL, so all accesses to
> aer_info->xxx will result in kernel panic. Fix it.
> 
> Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>

Applied to pci/aer for v6.18, thanks, Vernon!

Not directly related to this patch, but I'm concerned about some users
of dev->aer_cap.

Most users of dev->aer_cap either (a) check that it's set before using
it or (b) are called in paths obviously only reachable via an AER
interrupt.

But there are a few users of dev->aer_cap that use it without checking
it for zero, and it's not obvious to me that it must be valid:

  - pci_aer_unmask_internal_errors(), added by b7e9392d5d46 ("PCI/AER:
    Unmask RCEC internal errors to enable RCH downstream port error
    handling")

  - dpc_get_aer_uncorrect_severity(), added by 9f08a5d896ce ("PCI/DPC:
    Fix print AER status in DPC event handling")

  - dpc_is_surprise_removal(), added by 2ae8fbbe1cd4 ("PCI/DPC: Ignore
    Surprise Down error on hot removal")

> ---
>  drivers/pci/pcie/aer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d716..aeb2534f50dd 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -383,6 +383,10 @@ void pci_aer_init(struct pci_dev *dev)
>  		return;
>  
>  	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
> +	if (!dev->aer_info) {
> +		dev->aer_cap = 0;
> +		return;
> +	}
>  
>  	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
>  			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
> -- 
> 2.51.0
> 

