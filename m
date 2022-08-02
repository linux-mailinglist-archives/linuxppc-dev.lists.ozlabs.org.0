Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4F587BA4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxtBC674Hz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:32:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fRhktcCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fRhktcCE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxt9b5y1Vz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:31:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21CAD611D9;
	Tue,  2 Aug 2022 11:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C69C433D6;
	Tue,  2 Aug 2022 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659439887;
	bh=5eUBN1oDyS/mh3RPaTBceZGqPzXCSKcp0EmwAvpNVdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRhktcCEIU/R5xXhHYMsOW8l6lm+2oqyXtiEPoYdyOgKOerXzJZOUCb1KTAftfoeC
	 oiFoWHQ7RVZGpT9VtwdAOciZHfKf4o7LkhcLgsXYo3OvVO7LThgnHdT0BSag1y/Vug
	 FUxiBYqNqrLkTgVTRgVr8JPfIB55JkkIuXVjHY4TCvFudt+83PvQkEqyHys0KM1wlr
	 BEUpbXP8FMr3NKq3KhMA4ajJRCeZv7y56iZChV1w9Pf++ELcvt51UyG18jDDNXRZPu
	 Vdlyx/DdGBa+lbwCRX/XtVokUoJ787veXWSUpz8IfCXTioJMmIkalO8U3cYnKW8jpy
	 j352tACN4TJfQ==
Received: by pali.im (Postfix)
	id 4AC66F81; Tue,  2 Aug 2022 13:31:24 +0200 (CEST)
Date: Tue, 2 Aug 2022 13:31:24 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Fix PHB numbering when using opal-phbid
Message-ID: <20220802113124.ztbctjjz4sbo2mxo@pali>
References: <20220802105723.1055178-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802105723.1055178-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 02 August 2022 20:57:23 Michael Ellerman wrote:
> The recent change to the PHB numbering logic has a logic error in the
> handling of "ibm,opal-phbid".
> 
> When an "ibm,opal-phbid" property is present, &prop is written to and
> ret is set to zero.
> 
> The following call to of_alias_get_id() is skipped because ret == 0.
> 
> But then the if (ret >= 0) is true, and the body of that if statement
> sets prop = ret which throws away the value that was just read from
> "ibm,opal-phbid".

Now I see, I wrote logic incorrectly.

> Fix the logic by only doing the ret >= 0 check in the of_alias_get_id()
> case.
> 
> Fixes: 0fe1e96fef0a ("powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Your change should fix this issue, so:

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  arch/powerpc/kernel/pci-common.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index 8ce36aba42da..bdd3332200c5 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -91,11 +91,13 @@ static int get_phb_number(struct device_node *dn)
>  	}
>  	if (ret)
>  		ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
> -	if (ret)
> +
> +	if (ret) {
>  		ret = of_alias_get_id(dn, "pci");
> -	if (ret >= 0) {
> -		prop = ret;
> -		ret = 0;
> +		if (ret >= 0) {
> +			prop = ret;
> +			ret = 0;
> +		}
>  	}
>  	if (ret) {
>  		u32 prop_32;
> -- 
> 2.35.3
> 
