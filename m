Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB454DE28C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 21:30:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKwcQ2p1gz30R8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 07:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSxagLLR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eSxagLLR; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKwbQ1FdVz30NC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 07:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647635362; x=1679171362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bYWaejF1aAGMIe6zGaNynSygYXsQ9N7J6Zt5R6d87uw=;
 b=eSxagLLR4giQ7M6jrpW+0b7P/2sB4hHTCi/GohufgZ28wd9PE8sEm8aq
 qVg+IGc73oE7JHtC7sWSvOZhBZXz6Ls7/uEoZxLmiWSrfGb7/tq/NaKdZ
 qx9JpsmWaJLKmESuDDwi1D9/PFug7kubJefyRuUUMYVZ1Zd+A+QcPDR48
 TkFrJWUQ5KZdOjIJQ7QK1tHjrE4vy6ZZAyengzY510Ww3gn1jhqJD7Ek7
 TmVGQf7lV1GsgGtOaYnXusrLDFZX6K7Y1OjTm8XEP57frAckNWqxpay+q
 W+fC8EKKHf30N7iS1gxB7adnCJeRPWsXhgeQ0cbeD21GsdpdfO4g0myFV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257167957"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="257167957"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 13:28:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558633118"
Received: from reaganlo-mobl.amr.corp.intel.com (HELO [10.212.159.210])
 ([10.212.159.210])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 13:28:17 -0700
Message-ID: <fca6704b-686a-e478-03bb-091337162e02@linux.intel.com>
Date: Fri, 18 Mar 2022 13:28:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v1] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Eric Badger <ebadger@purestorage.com>
References: <20220317225944.GA765564@bhelgaas>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220317225944.GA765564@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver OHalloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/22 3:59 PM, Bjorn Helgaas wrote:
> Thanks for the additional details!
> 
> After this patch, I guess aer_irq() still reads 0x2
> (PCI_ERR_ROOT_MULTI_COR_RCV), but now it writes 0x2 back which clears
> PCI_ERR_ROOT_MULTI_COR_RCV.
> 
> In addition, aer_irq() will continue on to read PCI_ERR_ROOT_ERR_SRC,
> which probably contains either 0 or junk left over from being captured
> when PCI_ERR_ROOT_COR_RCV was set.
> 
> And aer_irq() will queue an e_src record with status ==
> PCI_ERR_ROOT_MULTI_COR_RCV.  But since PCI_ERR_ROOT_COR_RCV is not set
> in status, aer_isr_one_error() will do nothing, right?
> 
> That might not be*terrible*  and is definitely better than not being
> able to handle future interrupts.  But we basically threw away the
> information that multiple errors occurred, and we queued an e_src
> record that occupies space without being used for anything.

Yes, you are correct.  One other way to minimize this race window is to
clear the Root status register as soon as possible. Maybe we can move
it before source ID read as below.

--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1204,8 +1204,8 @@ static irqreturn_t aer_irq(int irq, void *context)
         if (!(e_src.status & AER_ERR_STATUS_MASK))
                 return IRQ_NONE;

-       pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id);
         pci_write_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, 
e_src.status);
+       pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
