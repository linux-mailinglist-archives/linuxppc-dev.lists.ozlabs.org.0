Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FF4D8E48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 21:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHSzF4fTJz3bYf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 07:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=H7D/n0Jb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=ebadger@purestorage.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=purestorage.com header.i=@purestorage.com
 header.a=rsa-sha256 header.s=google header.b=H7D/n0Jb; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHMHn5Pr4z2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 03:21:54 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 6so14328582pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qALLnaCSSKUHcfprNAAItch631Ge5KfRQPx2pUNLQTQ=;
 b=H7D/n0JbKj9EjOt8JtzKTXMQH0CNTpYB4I8wApB4Rmv61PHXEWj9mIPqgO05ZTyBRV
 gGQOTLYfGzzw1FdftrzkIh6XmORv26rbqjicyHqSgwyZQEb8kvdu+uMfyc1qS98htKOL
 qldzP/g9QTFXumZOPLV1iMBVFyiv24zQIs4wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qALLnaCSSKUHcfprNAAItch631Ge5KfRQPx2pUNLQTQ=;
 b=nmI/lgBfCpl5VEUaFB7NXvQ2em5AJ4FoNDK29IvasxCLrC1duBCEVYSCwWZDXo2xew
 p6c2+3wTA4sdVKvPX1QEhlRG+CXJ04FiqBjMY+lAla+TR6OTUDTFfwx84v/6BVzOpMcX
 kOU5Wcf5rTxCco/ZTywDU6RWQbYfPwkjPKY1j9Y3xSFxWUG6N+VfKb9/9381BOQDep4H
 UmSQwFKh2knRzNVVcdjCZ79J+inLoZMhDfKtyA4GWn4yrhmYCV/jxzAvVSUugFsnIvNj
 g2/R/jIcv5Ma52XNfqn3u3778r2oY/kThbKPHnBjmL4zIeESdHBufvCr2flpjBFt83Yj
 rYdQ==
X-Gm-Message-State: AOAM533P/zb07jsvKajaby5Wp/Ky9kuhkVuULL9Ia4L0uySmp7Aslz54
 UFr/XI6tyV8yOSTuOAkrjU60EQ==
X-Google-Smtp-Source: ABdhPJywlNfTDHCbCn7W5tk/3WvfHJOH4isiXUJsYK3fHzRwOBGDMLdgv9KHuQlVH/xNrUex2nFbYw==
X-Received: by 2002:a65:6091:0:b0:35e:d274:5f54 with SMTP id
 t17-20020a656091000000b0035ed2745f54mr20676714pgu.200.1647274910285; 
 Mon, 14 Mar 2022 09:21:50 -0700 (PDT)
Received: from ebps (cpe-75-80-179-40.san.res.rr.com. [75.80.179.40])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056a00248300b004f6f729e485sm21916449pfv.127.2022.03.14.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 09:21:49 -0700 (PDT)
Date: Mon, 14 Mar 2022 09:21:46 -0700
From: Eric Badger <ebadger@purestorage.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: [PATCH v1] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220314162146.GA1439451@ebps>
References: <20220311025807.14664-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220313195220.GA436941@bhelgaas>
 <20220313214314.GD182809@otc-nc-03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313214314.GD182809@otc-nc-03>
X-Mailman-Approved-At: Tue, 15 Mar 2022 07:37:33 +1100
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver OHalloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 13, 2022 at 02:43:14PM -0700, Raj, Ashok wrote:
> On Sun, Mar 13, 2022 at 02:52:20PM -0500, Bjorn Helgaas wrote:
> > On Fri, Mar 11, 2022 at 02:58:07AM +0000, Kuppuswamy Sathyanarayanan wrote:
> > > Currently the aer_irq() handler returns IRQ_NONE for cases without bits
> > > PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
> > > assumption is incorrect.
> > > 
> > > Consider a scenario where aer_irq() is triggered for a correctable
> > > error, and while we process the error and before we clear the error
> > > status in "Root Error Status" register, if the same kind of error
> > > is triggered again, since aer_irq() only clears events it saw, the
> > > multi-bit error is left in tact. This will cause the interrupt to fire
> > > again, resulting in entering aer_irq() with just the multi-bit error
> > > logged in the "Root Error Status" register.
> > > 
> > > Repeated AER recovery test has revealed this condition does happen
> > > and this prevents any new interrupt from being triggered. Allow to
> > > process interrupt even if only multi-correctable (BIT 1) or
> > > multi-uncorrectable bit (BIT 3) is set.
> > > 
> > > Reported-by: Eric Badger <ebadger@purestorage.com>
> > 
> > Is there a bug report with any concrete details (dmesg, lspci, etc)
> > that we can include here?
> 
> Eric might have more details to add when he collected numerous logs to get
> to the timeline of the problem. The test was to stress the links with an
> automated power off, this will result in some eDPC UC error followed by
> link down. The recovery worked fine for several cycles and suddenly there
> were no more interrupts. A manual rescan on pci would probe and device is
> operational again.

The problem was originally discovered while performing a looping hot plug
test. At hot remove time, one or more corrected errors usually appeared:

[256236.078151] pcieport 0000:89:02.0: AER: Corrected error received: 0000:89:02.0
[256236.078154] pcieport 0000:89:02.0: AER: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[256236.088606] pcieport 0000:89:02.0: AER:   device [8086:347a] error status/mask=00000001/00000000
[256236.097857] pcieport 0000:89:02.0: AER:    [ 0] RxErr                 
[256236.152622] pcieport 0000:89:02.0: pciehp: Slot(400): Link Down
[256236.152623] pcieport 0000:89:02.0: pciehp: Slot(400): Card not present
[256236.152631] pcieport 0000:89:02.0: DPC: containment event, status:0x1f01 source:0x0000
[256236.152632] pcieport 0000:89:02.0: DPC: unmasked uncorrectable error detected reason 0 ext_reason 0
[256236.152634] pcieport 0000:89:02.0: AER: PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, (Receiver ID)
[256236.164207] pcieport 0000:89:02.0: AER:   device [8086:347a] error status/mask=00000020/00100000
[256236.173464] pcieport 0000:89:02.0: AER:    [ 5] SDES                   (First)
[256236.278407] pci 0000:8a:00.0: Removing from iommu group 32
[256237.500837] pcieport 0000:89:02.0: Data Link Layer Link Active not set in 1000 msec
[256237.500842] pcieport 0000:89:02.0: link reset at upstream device 0000:89:02.0 failed
[256237.500865] pcieport 0000:89:02.0: AER: Device recovery failed

The problematic case arose when 2 corrected errors arrived in a sequence like this:

1. Correctable error triggered, bit 0 (ERR_COR) set in Root Error Status,
   which now has value 0x1.
2. aer_irq() triggered, reads Root Error Status, finds value 0x1.
3. Second correctable error triggered, bit 1 (multiple ERR_COR) set in Root
   Error Status, which now has value 0x3.
4. aer_irq() writes back 0x1 to Root Error Status, which now has value 0x2.
5. aer_irq() triggered again due to the second error, but, finding value 0x2
   in Root Error Status, takes no action. Future interrupts are now inhibited.
  
My observation on Intel Icelake is that a new AER interrupt will be generated
when one writes to Root Error Status but other bits remain set. I concluded
this based on testing with ACPI EINJ and a hack like this:

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9fa1f97e5b27..5c9bbbe7887b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1196,6 +1196,10 @@ static irqreturn_t aer_irq(int irq, void *context)
 	struct aer_err_source e_src = {};
 
 	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, &e_src.status);
+
+	pci_dbg(pdev->port, "Root Error Status: %04x\n", e_src.status);
+	return IRQ_NONE;
+
 	if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
 		return IRQ_NONE;
 
And then running these commands:

    # Prep injection data for a correctable error.
    $ cd /sys/kernel/debug/apei/einj
    $ echo 0x00000040 > error_type
    $ echo 0x4 > flags
    $ echo 0x891000 > param4
    
    # Root Error Status is initially clear
    $ setpci -s 89:02.0 ECAP0001+0x30.w
    0000
    
    # Inject one error
    $ echo 1 > error_inject
    
    # Interrupt received
    [  285.526275] pcieport 0000:89:02.0: AER: Root Error Status 0001
    
    # Inject another error
    $ echo 1 > error_inject
    
    # No interrupt received, but "multiple ERR_COR" is now set
    $ setpci -s 89:02.0 ECAP0001+0x30.w
    0003
    
    # Wait for a while, then clear ERR_COR. A new interrupt immediately fires.
    $ setpci -s 89:02.0 ECAP0001+0x30.w=0x1
    [  354.596748] pcieport 0000:89:02.0: AER: Root Error Status 0002


I've tried to track down some different hardware to confirm this behavior, but
haven't found any that can run this test.

My reading of the PCIe 5.0 spec, section "6.2.4.1.2 Interrupt Generation"
doesn't seem to describe the behavior I saw on Icelake.

	If a Root Port or Root Complex Event Collector is enabled for
	edge-triggered interrupt signaling using MSI or MSI-X, an interrupt
	message must be sent every time the logical AND of the following
	conditions transitions from FALSE to TRUE:
	...
    At least one Error Reporting Enable bit in the Root Error Command
    register and its associated error Messages Received bit in the Root
    Error Status register are both set to 1b.

This section of the spec seems to say that, if Root Error Status sees the
sequence of values described above (0x1->0x3->0x2), only one interrupt would
be generated, since there was no FALSE to TRUE transition at 0x3->0x2.  So you
would need something analogous to:

8edf5332c3934 ("PCI: pciehp: Fix MSI interrupt race")

However, this seems not to be the case for Icelake.

Cheers,
Eric
