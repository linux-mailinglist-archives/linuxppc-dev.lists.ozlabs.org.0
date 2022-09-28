Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD7E5EDB12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctsd64srz3fCf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B22A+5wg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B22A+5wg;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctnm4BRWz3bqY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:44 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id a3so19748194lfk.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=OcX91QSmfcORtUJuhjxsYlI4jDkm84+aPMTKqsh2mFg=;
        b=B22A+5wg/gpUg3toqo4rJeKFnUzSSnLoGxNGs8VRO3g0wdmQbtK6mgG/i3q14yO2vo
         gQKY919BK1PBejNcNheYfn98WzgaSHM15ncLgQfaiSv2DhBcSYTHuRUVylsKvh8oVAxq
         bAr9bG39yRRyRQIQG8hcT29xbgJhsghWNtUnP6zh6Nh2y3Y6R23E2SKY3OnbiNrlV9Hv
         vBzjNHfwCIT+m791PM9xrvBJbhxLMcthuomHcNynvO/4FmtiwC+48v2C+CtK/9rKShPn
         uZFVYF2G1sUIX2kXFCxThLI5i9YqGPzJtxXnhlK+hNJPnXFPNX51P8567jqadv01p1Cm
         ahoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OcX91QSmfcORtUJuhjxsYlI4jDkm84+aPMTKqsh2mFg=;
        b=rMLxI9PmKYyWHFA57fj4d2l2qdxqOQIAd/6kYGYvBvDMEDVopOWIVLJ5SxGVc5kolY
         VgXUG0h0XpaiZOpEZ1tINWKfYVOHP0NjhXcReneNMpBFQRLNX/ratowdtsQ3KxF2ENjd
         es+KSCQSWyvJDXtnOePsevBIKE0pM2TmktEgT1vo3F0EeD8BJXWu58NIHg4V4mQKoX91
         z1ZWQb8Ek8DkS/V8YefpsL+E8ehU7cCciXs8HpFCPvnnYmcCopi5UWuY9a+wfNIwG1y4
         jn894YFnzKqNNnHGZXzroP2HSe0eFPGIVIX0cV/4sHwsEWPvlQQeltwUnWLNX3ilwc/1
         15yg==
X-Gm-Message-State: ACrzQf1Wr71+bAkz8gqNqyBnKAuzVvqULXhsxKd4pC/k7Y7qAkXpG6JQ
	cRUsR+AHQROLdKcEPgvsrR8=
X-Google-Smtp-Source: AMsMyM7JGXbsNz0x5dE7UU8ItndkkQoelLZGntJ1miWPln8EohyuyG9V5ZZNjSRdJrKF5P6xSXVViQ==
X-Received: by 2002:a05:6512:12c8:b0:49b:8005:1d9d with SMTP id p8-20020a05651212c800b0049b80051d9dmr13713891lfg.489.1664362838099;
        Wed, 28 Sep 2022 04:00:38 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id z18-20020a19f712000000b00494a11c5f52sm442697lfe.256.2022.09.28.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 04:00:37 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:00:35 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v2 3/9] NTB: Change to use
 pci_aer_clear_uncorrect_error_status()
Message-ID: <20220928110035.ehbdxvpzkitbomoe@mobilestation>
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-4-chenzhuo.1@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927153524.49172-4-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 27, 2022 at 11:35:18PM +0800, Zhuo Chen wrote:
> Status bits for ERR_NONFATAL errors only are cleared in
> pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
> error status in idt_init_pci(), so we change to use
> pci_aer_clear_uncorrect_error_status().

Have the modification changed since:
https://lore.kernel.org/linux-pci/20220901181634.99591-2-chenzhuo.1@bytedance.com/
?
AFAICS it hasn't. Then my ab-tag should have been preserved on v2.
One more time:
Acked-by: Serge Semin <fancer.lancer@gmail.com>

Don't forget to add it should you have some more patchset re-spins.

-Sergey

> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/ntb/hw/idt/ntb_hw_idt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
> index 0ed6f809ff2e..d5f0aa87f817 100644
> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
> @@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>  	ret = pci_enable_pcie_error_reporting(pdev);
>  	if (ret != 0)
>  		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
> -	else /* Cleanup nonfatal error status before getting to init */
> -		pci_aer_clear_nonfatal_status(pdev);
> +	else /* Cleanup uncorrectable error status before getting to init */
> +		pci_aer_clear_uncorrect_error_status(pdev);
>  
>  	/* First enable the PCI device */
>  	ret = pcim_enable_device(pdev);
> -- 
> 2.30.1 (Apple Git-130)
> 
