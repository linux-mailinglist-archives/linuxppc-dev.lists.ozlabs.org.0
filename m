Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7A4367D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:32:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZtLD2F9Rz3c66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 03:32:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YQjnOjox;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YQjnOjox; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZtKX2DFwz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:31:44 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 a15-20020a17090a688f00b001a132a1679bso3578856pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IQdbcLoiSTUVND1y3yU1tj63RV90osj4TBuWtLbjx9w=;
 b=YQjnOjoxdmAAAhECuj0KPEKt27H/wOxmKMev/Jh3JFVzpa0cOV5dXDMot1AjIrEG5o
 wOgYSn95J/UqizuILvkc6+g5OAsT+ytgws2SQSx86fqrfx1zMQ8ub37GSDr+YFHAQWu7
 AiWqL+msiWD7SYSJShRzFd0h2Q5F/ABIdful5MVcYO6wioowEDKbPy6e7Sm+06weThUK
 Xui6felse6F+NGA1x77OkV/oukWj2d4a0wErt7nwUKfhe9DAWWStrAp+/vnrkZACqZG9
 zRSQApaprEZtWr6+t2qcRju9au7ZSuNDzMcfd3rLEbaYobAayt/iGBCC+2VoAJJnu/RG
 t0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQdbcLoiSTUVND1y3yU1tj63RV90osj4TBuWtLbjx9w=;
 b=3yopjkZw8JEOhjcuKSnRufPW6meBQQLv4FbCks93BBPxcvQgAQxjSO9iWaP8V5We6k
 Isg6pC/W5v/5wnC8uomiiUtOx83q4SbSfJL6dhnJgd0nugZjZeKi57A0Ppk1OdJukv8c
 l/IlMlgotKZwDmKgwd8PdKGJ/XO6SHXpsJfpH81M0O3vvbZ/lt6OIx1Uiod9LPZPMNls
 SCEwkFQAP64wShhZdaqnzAxxLASBUe+ZDrUfcPR7crOur2yawSOg3TOBDpKeZX9k/Su8
 2D0ZRk+NkK614rWR5w1nmEsLMMfN+tEUy+ZxTPOU0RHmpS6RXTHHOoWq1PQTzypMq5ZT
 hgNg==
X-Gm-Message-State: AOAM531onsno90tdwbXBVwMP2NqJFaYUX1NPm6gopfO373unwHfwqDsz
 tBhaP1Q+yphTjdJs3rFpRX8=
X-Google-Smtp-Source: ABdhPJy79KDoQD2rK1TbZ1HD9yKVRke6nSbvrV7cMQ1pA2KVnMKpIrwtRe7TAmT4oeznWwGCwsdqBw==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr7615497pjb.192.1634833899480; 
 Thu, 21 Oct 2021 09:31:39 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id c9sm5669933pgq.58.2021.10.21.09.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:31:39 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:01:28 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Message-ID: <20211021163128.rud3fv3jtnbi3ifp@theprophet>
References: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
 <20211021012800.GA2656128@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021012800.GA2656128@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/10, Bjorn Helgaas wrote:
> On Tue, Oct 05, 2021 at 10:48:10PM +0530, Naveen Naidu wrote:
> > In the dpc_process_error() path, info->id isn't initialized before being
> > passed to aer_print_error(). In the corresponding AER path, it is
> > initialized in aer_isr_one_error().
> > 
> > The error message shown during Coverity Scan is:
> > 
> >   Coverity #1461602
> >   CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
> >   8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.
> > 
> > Initialize the "info->id" before passing it to aer_print_error()
> > 
> > Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index c556e7beafe3..df3f3a10f8bc 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >  
> >  void dpc_process_error(struct pci_dev *pdev)
> >  {
> > -	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> > +	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
> >  	struct aer_err_info info;
> >  
> >  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> > -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> > +	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
> >  
> >  	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> > -		 status, source);
> > +		 status, info.id);
> >  
> >  	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
> 
> Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
> Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.  So I think we
> need to extract this reason before reading PCI_EXP_DPC_SOURCE_ID,
> e.g.,
> 
>   reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
>   if (reason == 1 || reason == 2)
>     pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
>   else
>     info.id = 0;
>

Thank you for the review, I'll make this change when I send a v5 for the
patch series.

> >  	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
