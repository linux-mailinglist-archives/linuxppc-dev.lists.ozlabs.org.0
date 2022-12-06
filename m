Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA1644E17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 22:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRYls24lyz3bhP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 08:42:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kBew9e0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kBew9e0Z;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRYky10Q0z2xml
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 08:41:13 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id a19so18815926ljk.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Dec 2022 13:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETysj4Bx8/q3Mbby4ydbR9t3cYQklYxkUNimuU0Mtik=;
        b=kBew9e0ZjRuvMB6VMb6kJBucF/HeULbCyoA3DL9XiESyqyRis4mPc4mvYcnZkEZFZU
         03oVFUEBQ+QQKKXg7zgfoxKrMva+9sSg/TpIShFlImKlenLRqVW+r6S5TSSJAbfzwIGB
         odE1wyD0V6XOo/JBdWREdcoYE9MlkuEZiwCQCKomLsB+mCsnWcLMig2jBGWYlSyTEJZx
         mpJXKTpYVFEhW7f8/TzOFmKUG4vlf3TRRFGOtYlIJYG8gggFPtVuh0IjaUQ7JPILI7SW
         /drTqQkoEs6yCtVPz2EVqJAru5ZRDcsIkQORJrNFzVP+/p2ewwZ+INGS78sQVFJfS2hH
         +pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETysj4Bx8/q3Mbby4ydbR9t3cYQklYxkUNimuU0Mtik=;
        b=q1t1EMhmNVDIV3iVEZKc7rTOlh32DV+cEl0MuWMYC15Js8qIGZmXquVB6gi8NOM7YF
         ej86tpZ//INt9yXIYQCDekT4bpIe00kBGDZxOZlJnNq6OiCQN1WcOUs9c5BgAs4zj5RR
         6iFFxvFAr2DfewqAK4FGDRx8ZDTcztg1EbyiUWb6WBMIDp1DZY+ATqprs7MBvT/pplVD
         OeswJhxSIsNUkbyghInysmJumifHLh5ACYD4y+I2CmQYQI8PEhGmG9zK4KrT9rTdEAAl
         8hbCB59ZzVJgj/14JxlVVsqwfAnTZeh8TmeRlX0F1oKj6Gvt+bl125JIYWuKTA6RDrVc
         sdYw==
X-Gm-Message-State: ANoB5pmD+NgpNGXBXUpgCBhd2q8AwqMfph5c8Gbad9UNgCn/oyJzSK8N
	YPaE0vvstgHbV3VD7WNaDzc=
X-Google-Smtp-Source: AA0mqf5lMZpEEacm4jO7QvN9SHNS5JS0rsnvTbY0LagzI/PlE2+ZIKHl43uMxZisCfadNoKGaNMuBA==
X-Received: by 2002:a2e:9941:0:b0:26d:fe34:6dc0 with SMTP id r1-20020a2e9941000000b0026dfe346dc0mr24018640ljj.477.1670362866932;
        Tue, 06 Dec 2022 13:41:06 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id a2-20020a19ca02000000b004946a1e045fsm2594803lfg.197.2022.12.06.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 13:41:06 -0800 (PST)
Date: Wed, 7 Dec 2022 00:41:03 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 3/9] NTB: Remove pci_aer_clear_nonfatal_status() call
Message-ID: <20221206214103.77duscgqjifsktxo@mobilestation>
References: <20220928110355.emf2nucmdmpb3vbu@mobilestation>
 <20221206180956.GA1361309@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206180956.GA1361309@bhelgaas>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, Zhuo Chen <chenzhuo.1@bytedance.com>, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn

On Tue, Dec 06, 2022 at 12:09:56PM -0600, Bjorn Helgaas wrote:
> On Wed, Sep 28, 2022 at 02:03:55PM +0300, Serge Semin wrote:
> > On Wed, Sep 28, 2022 at 06:59:40PM +0800, Zhuo Chen wrote:
> > > There is no need to clear error status during init code, so remove it.
> > 
> > Why do you think there isn't? Justify in more details.
> 
> Thanks for taking a look, Sergey!  I agree we should leave it or add
> the rationale here.
> 
> > > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > > ---
> > >  drivers/ntb/hw/idt/ntb_hw_idt.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > > index 0ed6f809ff2e..fed03217289d 100644
> > > --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
> > > +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > > @@ -2657,8 +2657,6 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
> > >  	ret = pci_enable_pcie_error_reporting(pdev);
> > >  	if (ret != 0)
> > >  		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
> > > -	else /* Cleanup nonfatal error status before getting to init */
> > > -		pci_aer_clear_nonfatal_status(pdev);
> 
> I do think drivers should not need to clear errors; I think the PCI
> core should be responsible for that.
> 
> And I think the core *does* do that in this path:
> 
>   pci_init_capabilities
>     pci_aer_init
>       pci_aer_clear_status
>         pci_aer_raw_clear_status
>           pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS)
>           pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS)
> 
> pci_aer_clear_nonfatal_status() clears only non-fatal uncorrectable
> errors, while pci_aer_init() clears all correctable and all
> uncorrectable errors, so the PCI core is already doing more than
> idt_init_pci() does.
> 
> So I think this change is good because it removes some work from the
> driver, but let me know if you think otherwise.

It's hard to remember now all the details but IIRC back when this
driver was developed the "Unsupported Request" flag was left uncleared
on our platform even after the probe completion. Most likely an
erroneous TLP was generated by some action performed on the device
probe stage. The forced cleanup of the AER status solved that problem.
On the other hand the problem of having the UnsupReq+ flag set was
solved some time after the driver was merged in into the kernel (it
was caused by a vendor-specific behavior of the IDT PCIe switch placed
on the path between a RP and PCIe NTB). So since the original reason
of having the pci_aer_clear_nonfatal_status() method called here was
platform specific and fixed now anyway, and the AER flags cleanup is
done by the core, then I have no reason to be against the patch. It
would be good to add your clarification to the commit message though.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> > >  
> > >  	/* First enable the PCI device */
> > >  	ret = pcim_enable_device(pdev);
> > > -- 
> > > 2.30.1 (Apple Git-130)
> > > 
