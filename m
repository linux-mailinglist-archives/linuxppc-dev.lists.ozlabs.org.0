Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8556C5EDB25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctx41tMQz3fVr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:07:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S4MsPIJV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S4MsPIJV;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctsb0zvtz3fCx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:04:03 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 10so19817436lfy.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=CLhAIIvy9Y2ruJAf9+yREPotjEO2NIAIDlqLdK6fCj8=;
        b=S4MsPIJVPO+68AA+mS05lXRQC4HVgjwJ18Vc/QUIEVxLoxPcUeof2CnaBJzMoDIYk8
         M+0qyGNpb9Ao1b8c/uPDjbouH/PWRh0M7CyODt4MMq+D6p1t9Bib4bOlYt75fthcpF9H
         PQptnubFI1DM8bmWsNON6U6pvQZHrzaZp54LJ8FxuXuOH0GuNjIfHruOlbixT0kcXJrx
         xUjTxARLE521qTa/R7nKswBdwb+OIFaEB6tEUKOzcGHf/wmA1RsUacAM0+lX1Ha7QATb
         IIF3HH+/f7NPdtnTcowx7IEbxm55j5n29Ohz485aiWwO/zm5RPs8Cv5m6EJBPxpbi2L8
         H7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CLhAIIvy9Y2ruJAf9+yREPotjEO2NIAIDlqLdK6fCj8=;
        b=CG1XSRfAPAdrQdyGtshRPdlUivnedguZpr1Tlj1mL4ioRfDKJgg+dg4UeIOmWVgFF6
         lm4nAoeQNq9A3DFz1uxvq/hukg9VY+GbLOGwFarP7S8AcW2WA50bjEvhD5rpckpBo2Pa
         9KX1wBsq7fk8FnapGEux4m9doqEQW0RbaPG4Q436c59FF7X+6x2gXZIL1mWzurqF+JnD
         bkjuWF4b86tsfu4udQSJdkskptqZ/U5KkDq6/tefVpHx/DYqumfwTPTqxAvHH2Hd9OW6
         Q1BQ4els3EOq+lngx6EvVqmz+WSVpspQnh+AtxjV1vI0cngkcy4z+0ZOmNRytFYP6zng
         uJTg==
X-Gm-Message-State: ACrzQf2M9Su9JGRFPCOxbtT6aeTtOqjA6DihJPCTLjNkcpJGrmpVrk0l
	4QB919IiPgFpL5KWJ07E/tQ=
X-Google-Smtp-Source: AMsMyM468iUduFFvtvCoOKe8j5rLxxlMzuyn20KnDLob97Sp2PgkxoG9AeKGHuYJJU8EdjFEAHHOOg==
X-Received: by 2002:ac2:4e09:0:b0:499:1e3a:54ab with SMTP id e9-20020ac24e09000000b004991e3a54abmr12665761lfr.170.1664363038738;
        Wed, 28 Sep 2022 04:03:58 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id v6-20020a197406000000b00499d70c0310sm446966lfe.3.2022.09.28.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 04:03:58 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:03:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v3 3/9] NTB: Remove pci_aer_clear_nonfatal_status() call
Message-ID: <20220928110355.emf2nucmdmpb3vbu@mobilestation>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
 <20220928105946.12469-4-chenzhuo.1@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-4-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 06:59:40PM +0800, Zhuo Chen wrote:
> There is no need to clear error status during init code, so remove it.

Why do you think there isn't? Justify in more details.

-Sergey

> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
>  drivers/ntb/hw/idt/ntb_hw_idt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
> index 0ed6f809ff2e..fed03217289d 100644
> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
> @@ -2657,8 +2657,6 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>  	ret = pci_enable_pcie_error_reporting(pdev);
>  	if (ret != 0)
>  		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
> -	else /* Cleanup nonfatal error status before getting to init */
> -		pci_aer_clear_nonfatal_status(pdev);
>  
>  	/* First enable the PCI device */
>  	ret = pcim_enable_device(pdev);
> -- 
> 2.30.1 (Apple Git-130)
> 
