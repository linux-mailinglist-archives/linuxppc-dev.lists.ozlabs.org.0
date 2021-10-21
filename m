Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AB436868
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZtqf2Yn9z3c87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 03:54:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F5RVO766;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=F5RVO766; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZtpy3Db6z2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:53:45 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id r2so836177pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OlNOkFhzU3j5XM9ZPcyVDkeJMjH142Uqr0gwlxi3bRA=;
 b=F5RVO766FluIl4AToZJDQXmFsz16TOfeR7UbrhvTAIJUkO7hxlIfOQUoMjb75kUCJF
 MVbV3rFlfwOn1fWzB0kel2RZgGB/ug+w5h+EIcUOPxTxWZ6XhPPcT1fUzRqdTP0sc3YH
 pa7f0k1fokCzZ2ATX4pPZcjGocYjRUCljb0rUvMrEEP8CTZZalHAsXJDfsPhKUaWF74f
 U/m1gMCbv69Ob6kvEGgWZg/gweXrLoUpz06n9Y/VbKNdLNh3WueHuiokW2ubnPnkiyem
 AoyYHComkiqxLJRMIz0fXglYOOTvJArUNTKaoNTd2PWGFggTyJ0Iq1UVo3kqPVowRlMS
 Sing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OlNOkFhzU3j5XM9ZPcyVDkeJMjH142Uqr0gwlxi3bRA=;
 b=NBlpg5V+peF9dYz/z73yJvKnqVFG1ycVGCUAftvlF1pGqP9V/uqO2qZB0v8Cd3ZmCD
 HZZkWoGoIUvmGdSii/tzae1Rinkqi2+k0WwywErD+cM67Dua6Hw0b2HxlX3rM4iSssGm
 PLw6ik6pjbn5ocYaAerdPsn7piBzkkqCMX/+1KfgRbqscXMRPZUuj/O5kHgTCHVFSFar
 xjuXMOM5EN84Tqa+UsS5wmTLbygpurXbsghdsS9v5Z4JM1e4mN7q41a2a+wFxlr6xHG6
 fsnh603Cp0oZ7mdz1IXLGRb7fH1UGwMOa0kDE8Ney27SpSm1OCqUhk5TtdOugA8wOTxl
 h/+Q==
X-Gm-Message-State: AOAM530mtYjJTTTRuuJMgiblFS1hCA2CFp4Uog+ozQ7W1JnFLEw9beml
 ah/Tt/emPAcow3yImtWao8E=
X-Google-Smtp-Source: ABdhPJzmj35HHVG/6CI1U59JcAVVWqK32Kb2AQrdfLKvvjhRvJ2S69LK41LYA5SFNSc3yXRLlJ4kTQ==
X-Received: by 2002:a63:b007:: with SMTP id h7mr5193594pgf.443.1634835222405; 
 Thu, 21 Oct 2021 09:53:42 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id r31sm10005050pjg.28.2021.10.21.09.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:53:41 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:23:30 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing
 AER registers
Message-ID: <20211021165330.lcqajtwej4s7oadt@theprophet>
References: <0a443323ab64ba8c0fc6caa03ca56ecd4d038ea3.1633453452.git.naveennaidu479@gmail.com>
 <20211021020934.GA2658296@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021020934.GA2658296@bhelgaas>
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
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, oohall@gmail.com, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/10, Bjorn Helgaas wrote:
> [+cc Keith, Sinan, Oza]
> 
> On Tue, Oct 05, 2021 at 10:48:12PM +0530, Naveen Naidu wrote:
> > In the EDR path, AER registers are cleared *after* DPC error event is
> > processed. The process stack in EDR is:
> > 
> >   edr_handle_event()
> >     dpc_process_error()
> >     pci_aer_raw_clear_status()
> >     pcie_do_recovery()
> > 
> > But in DPC path, AER status registers are cleared *while* processing
> > the error. The process stack in DPC is:
> > 
> >   dpc_handler()
> >     dpc_process_error()
> >       pci_aer_clear_status()
> >     pcie_do_recovery()
> 
> These are accurate but they both include dpc_process_error(), so we
> need a hint to show why the one here is different from the one in the
> EDR path, e.g.,
> 
>   dpc_handler
>     dpc_process_error
>       if (reason == 0)
>         pci_aer_clear_status    # uncorrectable errors only
>     pcie_do_recovery
> 
> > In EDR path, AER status registers are cleared irrespective of whether
> > the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
> > AER status registers are cleared only when it's an unmasked uncorrectable
> > error.
> > 
> > This leads to two different behaviours for the same task (handling of
> > DPC errors) in FFS systems and when native OS has control.
> 
> FFS?
>

Firmware First Systems

> I'd really like to have a specific example of how a user would observe
> this difference.  I know you probably don't have two systems to
> compare like that, but maybe we can work it out manually.
> 

Apologies again! Reading through the code again and the specification, I
realize that my understanding was very incorrect at the time of making
this patch. I grossly oversimplified EDR and DPC when I was learning
about it.

I'll drop this patch when I send the v5 for the series.

Apologies again ^^'

> I guess you're saying the problem is in the native DPC handling, and
> we don't clear the AER status registers for ERR_NONFATAL,
> ERR_NONFATAL, etc., right?
> 

But yes, I did have this question though (I wasn't able to find the
answers to it when reading the spec). Why do we not clear the entire
ERR_NONFATAL and ERR_FATAL registers in the DPC path just like EDR does
using the pci_aer_raw_clear_status() before going to pcie_do_recovery()

I am sure I might have missed something in the spec. I guess I'll
look/re-read these bits again.

Thanks for the review :)

> I think the current behavior is from 8aefa9b0d910 ("PCI/DPC: Print AER
> status in DPC event handling"), where Keith explicitly mentions those
> cases.  The commit log here should connect back to that and explain
> whether something has changed.
> 
> I cc'd Keith and the reviewers of that change in case any of them have
> time to dig into this again.
> 
> > Bring the same semantics for clearing the AER status register in EDR
> > path and DPC path.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index faf4a1e77fab..68899a3db126 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -288,7 +288,6 @@ void dpc_process_error(struct pci_dev *pdev)
> >  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
> >  		 aer_get_device_error_info(pdev, &info)) {
> >  		aer_print_error(pdev, &info);
> > -		pci_aer_clear_status(pdev);
> >  	}
> >  }
> >  
> > @@ -297,6 +296,7 @@ static irqreturn_t dpc_handler(int irq, void *context)
> >  	struct pci_dev *pdev = context;
> >  
> >  	dpc_process_error(pdev);
> > +	pci_aer_clear_status(pdev);
> >  
> >  	/* We configure DPC so it only triggers on ERR_FATAL */
> >  	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
