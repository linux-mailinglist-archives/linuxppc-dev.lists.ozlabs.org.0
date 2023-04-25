Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC56EDB6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 07:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5BCb3CJfz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHKBd466;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hHKBd466;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5BBh6Plmz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 15:58:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682402317; x=1713938317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=se7YPSlb4h1MC4CMmAIT2KU5ZaEL8RqWu41fI7ro+m0=;
  b=hHKBd466sQi1SOk72rO870Pi3jfteErDfQDoP0usNaPjRlC96+J1970Z
   2yvbHM+Et6x74G4X0dN5+WIYWZ+kpGopxIKFYwwnTGvjP2PlKFam9uw+h
   4XnNMdi+YtQF7oHQYq4UCvzFv3K9QXeZRyl5TnEgk3V8GLZWDDXRRM5+n
   x94PpFMO9Qkot4wVk61UqGGXc5nejFjM9L1/T7qa0+77rC7DiyAImtGGS
   UOEQbLNBx1aIvH1bRaKTqvAmEFQLUL3hA+otfmL+QpW93mBf/3SBVfL3F
   NFIx3f8f1sMkqJPNkMR519M0ClPlTGCBtQ6GMKAX5yReOM67xZccDo98e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="344147890"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="344147890"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 22:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867763728"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="867763728"
Received: from jsagoe-mobl1.amr.corp.intel.com (HELO [10.251.8.47]) ([10.251.8.47])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 22:58:30 -0700
Message-ID: <ba8a948f-d28e-d411-b00f-0a198d53ae47@linux.intel.com>
Date: Mon, 24 Apr 2023 22:58:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/3] PCI/AER: Disable AER interrupt on suspend
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20230424055249.460381-1-kai.heng.feng@canonical.com>
 <20230424055249.460381-2-kai.heng.feng@canonical.com>
 <97260e8b-1892-49a5-3792-0e3c28378fc0@linux.intel.com>
 <CAAd53p5nrTQOxLkv+e9gLu3R9iOLXz5taJuwaAO4_W7_y89vEw@mail.gmail.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <CAAd53p5nrTQOxLkv+e9gLu3R9iOLXz5taJuwaAO4_W7_y89vEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: mika.westerberg@linux.intel.com, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 4/24/23 10:55 PM, Kai-Heng Feng wrote:
> On Tue, Apr 25, 2023 at 7:47 AM Sathyanarayanan Kuppuswamy
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>>
>>
>>
>> On 4/23/23 10:52 PM, Kai-Heng Feng wrote:
>>> PCIe service that shares IRQ with PME may cause spurious wakeup on
>>> system suspend.
>>>
>>> PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
>>> that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
>>> (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
>>> much here to disable AER during system suspend.
>>>
>>> This is very similar to previous attempts to suspend AER and DPC [1],
>>> but with a different reason.
>>>
>>> [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
>>>
>>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>
>> IIUC, you encounter AER errors during the suspend/resume process, which
>> results in AER IRQ. Because AER and PME share an IRQ, it is regarded as a
>> spurious wake-up IRQ. So to fix it, you want to disable AER reporting,
>> right?
> 
> Yes. That's exactly what happened.
> 
>>
>> It looks like it is harmless to disable the AER during the suspend/resume
>> path. But, I am wondering why we get these errors? Did you check what errors
>> you get during the suspend/resume path? Are these errors valid?
> 
> I really don't know. I think it's similar to the reasoning in commit
> b07461a8e45b ("PCI/AER: Clear error status registers during
> enumeration and restore"): "AER errors might be recorded when
> powering-on devices. These errors can be ignored, ...".
> For this case, it happens when powering-off the device (D3cold) via
> turning off power resources.

Got it.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> 
> Kai-Heng
> 
>>
>>
>>>  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index 1420e1f27105..9c07fdbeb52d 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
>>>       return 0;
>>>  }
>>>
>>> +static int aer_suspend(struct pcie_device *dev)
>>> +{
>>> +     struct aer_rpc *rpc = get_service_data(dev);
>>> +     struct pci_dev *pdev = rpc->rpd;
>>> +
>>> +     aer_disable_irq(pdev);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int aer_resume(struct pcie_device *dev)
>>> +{
>>> +     struct aer_rpc *rpc = get_service_data(dev);
>>> +     struct pci_dev *pdev = rpc->rpd;
>>> +
>>> +     aer_enable_irq(pdev);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  /**
>>>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>>>   * @dev: pointer to Root Port, RCEC, or RCiEP
>>> @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
>>>       .service        = PCIE_PORT_SERVICE_AER,
>>>
>>>       .probe          = aer_probe,
>>> +     .suspend        = aer_suspend,
>>> +     .resume         = aer_resume,
>>>       .remove         = aer_remove,
>>>  };
>>>
>>
>> --
>> Sathyanarayanan Kuppuswamy
>> Linux Kernel Developer

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
