Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA84367CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:31:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZtJw5pfqz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 03:31:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KuDBSYgs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KuDBSYgs; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZtJC513pz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:30:34 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so3524825pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lc2V8kW9DWjIh5PwTRqiTR+Qdm9DCZ56d3CfgkVtsAg=;
 b=KuDBSYgshNz9/GCM1Jkbz7X3nsWyxLk7hvxcjDbgj2f+N3J2vjdaq7KVZsGcSNocHf
 pMaNHrJ5ZwHL38XdgC6QleKmA2D81frhRfhI9iPcj9GYH78bb1Nlt2LXE6s4eakmlC1C
 YY2KiZqTVXORECOLw0be0vs2dOsf2m1cyKFZB9E5TJvohcma/0P8dxtyYEikqf591vPp
 X4fBU35cfhcGSzdmFwJnJgWcj03FLgViEoeTO3fzri7jaHSUdzlZtW6qkhhEmFtYWPcp
 ApO6iqy1iDToJt+y0rvB5+29nVoGOieKLQJYFCO7E6YzBy5afnoHSPUxsk03JZHQSjIT
 +2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lc2V8kW9DWjIh5PwTRqiTR+Qdm9DCZ56d3CfgkVtsAg=;
 b=jtj7jru/vRb5MVhrP2Etpf40Nzao5yLX86RHaZcZHkQgU9mu6zC0MuPa18ZbUGfxxl
 evP/Nf3OhRAZJuYlnLuuPHKT8emw9pN7TY2VfpA9R7Dj0wkmXkOY6BQ7TPhOgoWaUqLM
 RRu8y/QZpXDJ1/YL54c0pMgjGsvA2icRMvKGt6OqNYlMAxgI+jWa/AZsN+Dxz3K5/6oN
 cDMjxxzzffv5hmZT4n1bQ6wYhKz73T1YT1QI52LI1PzilshLqAYGxTtAEfgQDaM5i6Sr
 wCjVQ4Mk05Ng8+qqiJLFKz9HzlWpjoyDP9mB48Lxw+GNAfulJWVooAloYuMAjZGqK9eG
 80UA==
X-Gm-Message-State: AOAM530QbL7Uhm4Lp87fZo0Nden6HNPw8dr7fjlGB2+NaErgVXrcGZGl
 dA9wEeiVKD2yQnnYwR9kEkW59uT8cKgrfLFp
X-Google-Smtp-Source: ABdhPJxOnUbbOM9WGG3ZOvhQwiI9j78jVo97pCwncL8rKO/wgLLb9naCikt2yiq01L3UPck2/PDSEA==
X-Received: by 2002:a17:90a:9bca:: with SMTP id
 b10mr7852273pjw.133.1634833832448; 
 Thu, 21 Oct 2021 09:30:32 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id d60sm9876076pjk.49.2021.10.21.09.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:31 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:00:21 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
Message-ID: <20211021163021.r4ekhfol42ftw5zw@theprophet>
References: <22b2dae2a6ac340d9d45c28481d746ec1064cd6c.1633453452.git.naveennaidu479@gmail.com>
 <20211021012826.GA2655655@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021012826.GA2655655@bhelgaas>
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
> On Tue, Oct 05, 2021 at 10:48:08PM +0530, Naveen Naidu wrote:
> > Currently, we do not print the "id" field in the AER error logs. Yet the
> > aer_agent_string[] has the word "id" in it. The AER error log looks
> > like:
> > 
> >   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
> > 
> > Without the "id" field in the error log, The aer_agent_string[]
> > (eg: "Receiver ID") does not make sense. A user reading the
> > aer_agent_string[] in the log, might inadvertently look for an "id"
> > field and not finding it might lead to confusion.
> > 
> > Remove the "ID" from the aer_agent_string[].
> > 
> > The following are sample dummy errors inject via aer-inject.
> 
> I like this, and the problem it fixes was my fault because
> these "ID" strings should have been removed by 010caed4ccb6.
> 
> If it's straightforward enough, it would be nice to have the
> aer-inject command line here in the commit log to make it easier
> for people to play with this.
>

Thank you for the review. Do you mean something like:

The following sample dummy errors are injected via aer-inject via the
following steps:

  1. The steps to compile the aer-inject tool is mentioned in (Section
     4. Software error inject) of the document [1]

     [1]: https://www.kernel.org/doc/Documentation/PCI/pcieaer-howto.txt

     Make sure to place the aer-inject executable at the home directory
     of the qemu system or at any other place.

  2. Emulate a PCIE architecture using qemu, A sample looks like
     following:
     
		qemu-system-x86_64 -kernel ../linux/arch/x86_64/boot/bzImage \
        -initrd  buildroot-build/images/rootfs.cpio.gz \
        -append "console=ttyS0"  \
        -enable-kvm -nographic \
        -M q35 \
        -device pcie-root-port,bus=pcie.0,id=rp1,slot=1 \
        -device pcie-pci-bridge,id=br1,bus=rp1 \
        -device e1000,bus=br1,addr=8
       
    Note that the PCIe features are available only when using the 
    'q35' Machine [2]
    [2]: https://github.com/qemu/qemu/blob/master/docs/pcie.txt

  3. Once the qemu system starts up, create a sample aer-file or use any
     example aer file from [3]

     [3]:
     https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git/tree/examples

  4. Inject any aer-error using
      
      ./aer-inject aer-file

This does look a tad bit longer for a commit log so I am unsure if you
would like to have it there. If you are okay with it, I would be happy
to add it to that :)

> > Before
> > =======
> > 
> > In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
> > the "id" field was removed from the AER error logs, so currently AER
> > logs look like:
> > 
> >   pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
> >   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID) <--- no id field
> >   pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
> >   pcieport 0000:00:03.0:    [ 6] BadTLP
> > 
> > After
> > ======
> > 
> >   pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
> >   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
> >   pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
> >   pcieport 0000:00:03.0:    [ 6] BadTLP
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/aer.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 9784fdcf3006..241ff361b43c 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
> >  };
> >  
> >  static const char *aer_agent_string[] = {
> > -	"Receiver ID",
> > -	"Requester ID",
> > -	"Completer ID",
> > -	"Transmitter ID"
> > +	"Receiver",
> > +	"Requester",
> > +	"Completer",
> > +	"Transmitter"
> >  };
> >  
> >  #define aer_stats_dev_attr(name, stats_array, strings_array,		\
> > @@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> >  	const char *level;
> >  
> >  	if (!info->status) {
> > -		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
> > +		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
> >  			aer_error_severity_string[info->severity]);
> >  		goto out;
> >  	}
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
