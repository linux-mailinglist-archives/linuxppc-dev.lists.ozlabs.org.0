Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78D52418C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 02:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzCPp1KJJz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 10:31:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSDIJgwR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cSDIJgwR; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzCP638Msz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 10:30:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652315450; x=1683851450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QVmwNynkT04gSDeDkYvO4d7kGnKP1A1Q5Qz1j6zm5lk=;
 b=cSDIJgwRdYdodLSg+urzdu7diuzRwax0sQBFUXkYWPB+EMs2sksq61YZ
 QHXLw+Ns/6LAtwigPbKYBBwoKhqfb2hJkbMUL1kkVyPrgQQLViDJuwobQ
 5uEbhzEXAiRbeIuLGVAhw2zk8ylUXj/1IjWpI6nvhFGVLtJESCHRfq+UE
 ggbFTbZpdlPsOMO3hyR3AIXwQ8JA+h8UejF534d1Il/uYTW5E8mnQPpKX
 ONyc7xPmVgzJNYyuDtgw3aLGXUi2w4mRNHuZKay84hVFCQvs5UVDb7XBF
 EzcP1ebo51toLlb9VyOpAGSGrAyZWOZdijwNK3pStz0paAX4IbCbS206R Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267434087"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="267434087"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:29:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="572305211"
Received: from wancheny-mobl.amr.corp.intel.com (HELO [10.209.114.21])
 ([10.209.114.21])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 17:29:47 -0700
Message-ID: <54ab824c-44a9-239a-9380-2f051f26a079@linux.intel.com>
Date: Wed, 11 May 2022 17:29:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220511234024.GA831116@bhelgaas>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220511234024.GA831116@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver OHalloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/22 4:40 PM, Bjorn Helgaas wrote:
> On Mon, Apr 18, 2022 at 03:02:37PM +0000, Kuppuswamy Sathyanarayanan wrote:
>> Currently the aer_irq() handler returns IRQ_NONE for cases without bits
>> PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
>> assumption is incorrect.
>>
>> Consider a scenario where aer_irq() is triggered for a correctable
>> error, and while we process the error and before we clear the error
>> status in "Root Error Status" register, if the same kind of error
>> is triggered again, since aer_irq() only clears events it saw, the
>> multi-bit error is left in tact. This will cause the interrupt to fire
>> again, resulting in entering aer_irq() with just the multi-bit error
>> logged in the "Root Error Status" register.
>>
>> Repeated AER recovery test has revealed this condition does happen
>> and this prevents any new interrupt from being triggered. Allow to
>> process interrupt even if only multi-correctable (BIT 1) or
>> multi-uncorrectable bit (BIT 3) is set.
>>
>> Also note that, for cases with only multi-bit error is set, since this
>> is not the first occurrence of the error, PCI_ERR_ROOT_ERR_SRC may have
>> zero or some junk value. So we cannot cleanly process this error
>> information using aer_isr_one_error(). All we are attempting with this
>> fix is to make sure error interrupt processing can continue in this
>> scenario.
>>
>> This error can be reproduced by making following changes to the
>> aer_irq() function and by executing the given test commands.
>>
>>   static irqreturn_t aer_irq(int irq, void *context)
>>           struct aer_err_source e_src = {};
>>
>>           pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
>> 				&e_src.status);
>>   +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
>>   +		e_src.status);
>>           if (!(e_src.status & AER_ERR_STATUS_MASK))
> 
> Do you mean
> 
>    if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
> 
> here?  AER_ERR_STATUS_MASK would be after this fix.

Yes. You are correct. Do you want me to update it and Fixes tag
and send next version?

> 
>>                   return IRQ_NONE;
>>
>>   +       mdelay(5000);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
