Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6350436803
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZtRb2Rlwz3cC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 03:36:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eJoLRrDv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eJoLRrDv; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZtQy3QHgz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:36:25 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id f11so1102169pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XNFBhpllu7nc0pkg33R5r5Fh+arwoYW9tTFMhQ1Vz/c=;
 b=eJoLRrDvU48OXdI618MEts9VQqMnTVB76rawrzqlvVDGPfrCSgIUDwEHOZ8QSxSWIv
 EaszjXlmCqa2H6DXfha+r226SxX5gFyR4qsqJB2WbKTaWkgnInRYHF64yFqPI2MzbmEI
 5W/n9GwIZmwg/eX2+cTXZCaCPtxIFHfxXxW9EDzgz9bWQ1EXXQK7TinoCr6eLWih3WPC
 lCbeVXY+rpVEt05S2vw3tSradrUM2PvQ0HGno8RAktXq9EKUyJ2rY41VedAVdueoZNFC
 9/a5Zlzv7pGcEYfJNEBoKGvGEyRyQ/briuUYMqUPB6glvIXjqzzKXbXAAJoNvmZm23no
 y8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XNFBhpllu7nc0pkg33R5r5Fh+arwoYW9tTFMhQ1Vz/c=;
 b=H+ARnp6qx4tI7uxydYA7ksj5a/D8UKBbbzmj2JJZcDKsXspL1Sj/zomaqHnRBPfY+c
 SYmG9CzRKPAzoZHzX5k+U5/jB/YmrcXQ2EPyMEjrWZrBaJS92dvXA3Ia5cJKAiBbeSii
 sRrr1kTH1tl9FtOJYNpad5PYVkW66yvTeKxtc8uGjAzxJ3nP1us/463ZxbVQqhpWIALO
 ERYy6kJ750A8R5ikLrXvMBvB7l3jxiXBqYOFxS+ywQHO9rXtCxAwwIAc6OzyCpDhjtIp
 gp52Dn2d8iYGOICotrqv0MtjAWu6IiOEDFi/YdUAIVDRUcJ3TnRui2NjJOj1DDgR7xZx
 9SoQ==
X-Gm-Message-State: AOAM531CAq09RaQ5KKFwz/C2AXEMDsvAxGhhl7pa6wzCjIfIfe8y8Rr6
 ssCf6gfc4Lqn5iEGa+YYfKM=
X-Google-Smtp-Source: ABdhPJzfdFTwCbjg+oVZZtmNG4pN1rAlF1kcmD/+Gu6plGnZ8j/KLnhiiXFySrksPZ8TcD1MU9P6vg==
X-Received: by 2002:aa7:8609:0:b0:44b:346a:7404 with SMTP id
 p9-20020aa78609000000b0044b346a7404mr6653842pfn.86.1634834183113; 
 Thu, 21 Oct 2021 09:36:23 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id m186sm6769249pfb.165.2021.10.21.09.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:36:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:06:11 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Message-ID: <20211021163611.rsfmberxw6dqn5gx@theprophet>
References: <f0d301cb1245a8e2fd9565426b87c22a97aa6de7.1633453452.git.naveennaidu479@gmail.com>
 <20211021014029.GA2657684@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021014029.GA2657684@bhelgaas>
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
> On Tue, Oct 05, 2021 at 10:48:11PM +0530, Naveen Naidu wrote:
> > dpc_process_error() clears both AER fatal and non fatal status
> > registers. Instead of clearing each status registers via a different
> > function call use pci_aer_clear_status().
> > 
> > This helps clean up the code a bit.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index df3f3a10f8bc..faf4a1e77fab 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
> >  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
> >  		 aer_get_device_error_info(pdev, &info)) {
> >  		aer_print_error(pdev, &info);
> > -		pci_aer_clear_nonfatal_status(pdev);
> > -		pci_aer_clear_fatal_status(pdev);
> > +		pci_aer_clear_status(pdev);
> 
> The commit log suggests that this is a simple cleanup that doesn't
> change any behavior, but that's not quite true:
> 
>   - The new code would clear PCI_ERR_ROOT_STATUS, but the old code
>     does not.
> 
>   - The old code masks the status bits with the severity bits before
>     clearing, but the new code does not.
> 
> The commit log needs to show why these changes are what we want.
>

Reading through the code again, I realize how wrong(stupid) I was when
making this patch. I was thinking that:

  pci_aer_clear_status() = pci_aer_clear_fatal_status() + pci_aer_clear_nonfatal_status()

Now I understand, that it is not at all the case. I apologize for the
mistake. I'll make sure to be meticulous while reading functions and not
just assume their behaviour just from their function names.

I'll drop this patch in the next version of the patch series I make.

Apologies again ^^'

> >  	}
> >  }
> >  
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
