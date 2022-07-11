Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAF570DC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 01:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhfYQ6pghz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 09:02:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=X/5PcPYq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=mkhalfella@purestorage.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=X/5PcPYq;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhfXs7140z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 09:02:17 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id g4so6045599pgc.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zQXYkIpLa/jRv8ngkizdneaBLdDBpj/gCgWHugoncaE=;
        b=X/5PcPYqGqKuus1jat1z2VDjmGnFRlWFHPH2K9MAZocdY+pZKAu34y993HN6SNVKmS
         cDtn7l1Vyb7XKJpemTGBWS9vphxKWpKMdthKiM0nSLVjl9DPUQq7HKuRKW3b3nLFnjU8
         SBP0182OirwDB7BgZls6GFj1KXOhaFARIykUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zQXYkIpLa/jRv8ngkizdneaBLdDBpj/gCgWHugoncaE=;
        b=quvOXD4oMCkOs0C50NJdenSaLOFvDfaebm4TL+tIxzd5cuq6MkCQRgXlOiVFnXBB+v
         E+bGe7ZJ0wKeV8ziO/nwdTAwX4uSRx8xBjzB6Yc4ouj/SdezkRDtWKmVmh0qEQh+IMAi
         n/UlU5uSZoG1dSUnZDCz586+fb6/Cxdx5cJn/j6PJyFomug0c2Bls8BY2HogyN4Gp4o7
         kmSvsNBlDMUPX3GyVcMcqjyxdk/9tjB0ADuPS3q5Tbf13SUoOJk/v9vNk5kYG+huY9J4
         do/9TjwrYTjY4PnDlRMlkFIkI3o9JPSruIhhBpZB6hFv3pUMa8g5Zge5xNrrNkLA7lcK
         TmfA==
X-Gm-Message-State: AJIora8moBiBdwkS6Tjtl9+kn0lQDG5LFHwlLSMxH+R8ulAsezKagy2W
	08xH2Ay/wbQ6ofjo8iiUQ2uLHw==
X-Google-Smtp-Source: AGRyM1vd+YT28J4QtbEwB9SqrDW2ijRXinz1/hQByXl8qLxAh5tbMVtL1AGh7dMFvZN0PHy8+1tZ0g==
X-Received: by 2002:a65:49c5:0:b0:412:6e3e:bd91 with SMTP id t5-20020a6549c5000000b004126e3ebd91mr18068217pgs.221.1657580533320;
        Mon, 11 Jul 2022 16:02:13 -0700 (PDT)
Received: from medusa.lab.kspace.sh (c-98-207-191-243.hsd1.ca.comcast.net. [98.207.191.243])
        by smtp.googlemail.com with ESMTPSA id y15-20020a655b0f000000b0040d75537824sm4735325pgq.86.2022.07.11.16.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:02:12 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:02:11 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
 strings
Message-ID: <20220711230211.GD3182270@medusa>
References: <20220509181441.31884-1-mkhalfella@purestorage.com>
 <20220711225437.GA703490@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711225437.GA703490@bhelgaas>
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Meeta Saggi <msaggi@purestorage.com>, Eric Badger <ebadger@purestorage.com>, Oliver O'Halloran <oohall@gmail.com>, stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI ENHANCED ERROR HANDLING \(EEH\) FOR POWERPC" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-07-11 17:54:37 -0500, Bjorn Helgaas wrote:
> On Mon, May 09, 2022 at 06:14:41PM +0000, Mohamed Khalfella wrote:
> > PCI AER stats counters sysfs attributes need to iterate over
> > stats counters instead of stats names. Also, added a build
> > time check to make sure all counters have entries in strings
> > array.
> > 
> > Fixes: 0678e3109a3c ("PCI/AER: Simplify __aer_print_error()")
> > Cc: stable@vger.kernel.org
> > Reported-by: Meeta Saggi <msaggi@purestorage.com>
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > Reviewed-by: Meeta Saggi <msaggi@purestorage.com>
> > Reviewed-by: Eric Badger <ebadger@purestorage.com>
> 
> I added some info about why we need this to the commit log and applied
> to pci/err for v5.20.  Thank you!
That is good news! Thank you for helping out.
> 
> > ---
> >  drivers/pci/pcie/aer.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 9fa1f97e5b27..ce99a6d44786 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -533,7 +533,7 @@ static const char *aer_agent_string[] = {
> >  	u64 *stats = pdev->aer_stats->stats_array;			\
> >  	size_t len = 0;							\
> >  									\
> > -	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
> > +	for (i = 0; i < ARRAY_SIZE(pdev->aer_stats->stats_array); i++) {\
> >  		if (strings_array[i])					\
> >  			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
> >  					     strings_array[i],		\
> > @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
> >  	struct device *device = &dev->device;
> >  	struct pci_dev *port = dev->port;
> >  
> > +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
> > +		     AER_MAX_TYPEOF_COR_ERRS);
> > +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
> > +		     AER_MAX_TYPEOF_UNCOR_ERRS);
> > +
> >  	/* Limit to Root Ports or Root Complex Event Collectors */
> >  	if ((pci_pcie_type(port) != PCI_EXP_TYPE_RC_EC) &&
> >  	    (pci_pcie_type(port) != PCI_EXP_TYPE_ROOT_PORT))
> > -- 
> > 2.29.0
> > 
