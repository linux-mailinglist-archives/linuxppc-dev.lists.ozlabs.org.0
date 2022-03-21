Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A72804E1F5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 04:54:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMLMr494Nz306r
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 14:54:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjI1/3s/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mjI1/3s/; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMLM93vg0z2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 14:53:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647834821; x=1679370821;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+xVB4tejKj+jXZwnepYkpDsgaZslDPFHLemDy5ezqI8=;
 b=mjI1/3s/syf5R0ShrQ2Y6XvTk/kWtdYA9G4/bK9W20UMObmp/ajRm/EL
 3gYxaC3tmwUMOc354v3M+wmbSnOkZS4+pENtic6QkjJjX/u3gOLTqFzsN
 6PbxtW6Kwgr5agoRD0g9bz49M4Ii9Z+SWLNEh3PbRV1aBtajqNTdDXmqo
 CO3kaca5bOZjAiUiLyynS5h6yq1WjMQnEc+vbn+8fewkgqfi8oxZ2SdRk
 9RjExLKtRzYo2JlYqsK8Dy2Mf8YPTAsbo2D84WyW6wgF5bxAsDehvRbF/
 fT+bu5QUirEiAC3J30var70dDvv8anZYxOUU2QbRyIac5YZOJjJqThdu2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="255026694"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="255026694"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 20:52:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="600348464"
Received: from miahcroc-mobl.amr.corp.intel.com (HELO [10.212.144.180])
 ([10.212.144.180])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 20:52:35 -0700
Message-ID: <9d47ee80-1f92-4b52-1080-4d8325dc4a5e@linux.intel.com>
Date: Sun, 20 Mar 2022 20:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <427f19c6-32f0-684e-5fdd-2e5ed192b71d@linux.intel.com>
 <CAAd53p6ZrFNhtKk=9wz8SF68jBuNajKgOzZFgHgKgd57Zp3pHg@mail.gmail.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <CAAd53p6ZrFNhtKk=9wz8SF68jBuNajKgOzZFgHgKgd57Zp3pHg@mail.gmail.com>
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 mika.westerberg@linux.intel.com, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/20/22 7:38 PM, Kai-Heng Feng wrote:
> On Sun, Mar 20, 2022 at 4:38 AM Sathyanarayanan Kuppuswamy
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>>
>>
>>
>> On 1/26/22 6:54 PM, Kai-Heng Feng wrote:
>>> Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
>>> hint") enables ACS, and some platforms lose its NVMe after resume from
>>
>> Why enabling ACS makes platform lose NVMe? Can you add more details
>> about the problem?
> 
> I don't have a hardware analyzer, so the only detail I can provide is
> the symptom.
> I believe the affected system was sent Intel, and there wasn't any
> feedback since then.

Since your commit log refers to ACS, I think first we need to understand
following points.

1. Why we get ACSViol during S3 resume. Is this just a noise?
2. Why AER recovery fails?
3. Is this common for all platforms, or only happens in your test
    platform?

If you are not clear about above points, I think you can submit this
patch as adding suspend/resume support to AER/DPC driver and not include
the issue about ACS.

 From your commit log, the problem is not very clear.

> 
>>
>>> S3:
>>> [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
>>> [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
>>> [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
>>> [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
>>> [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
>>> [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
>>> [   50.947843] nvme nvme0: frozen state error detected, reset controller
>>>
>>> It happens right after ACS gets enabled during resume.
>>>
>>> There's another case, when Thunderbolt reaches D3cold:
>>> [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
>>> [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
>>> [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
>>> [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
>>> [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
>>> [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
>>
>> no callback message means one or more devices in the given port does not
>> support error handler. How is this related to ACS?
> 
> This case is about D3cold, not related to ACS.
> And no error_detected is just part of the message. The whole AER
> message is more important.
> 
> Kai-Heng
> 
>>
>>> [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
>>> [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
>>>
>>> So disable AER service to avoid the noises from turning power rails
>>> on/off when the device is in low power states (D3hot and D3cold), as
>>> PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
>>> transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
>>> with aux power) and L3 (D3cold).
>>>
>>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
>>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
>>> Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>> v2:
>>>    - Wording change.
>>>
>>>    drivers/pci/pcie/aer.c | 31 +++++++++++++++++++++++++------
>>>    1 file changed, 25 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index 9fa1f97e5b270..e4e9d4a3098d7 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -1367,6 +1367,22 @@ static int aer_probe(struct pcie_device *dev)
>>>        return 0;
>>>    }
>>>
>>> +static int aer_suspend(struct pcie_device *dev)
>>> +{
>>> +     struct aer_rpc *rpc = get_service_data(dev);
>>> +
>>> +     aer_disable_rootport(rpc);
>>> +     return 0;
>>> +}
>>> +
>>> +static int aer_resume(struct pcie_device *dev)
>>> +{
>>> +     struct aer_rpc *rpc = get_service_data(dev);
>>> +
>>> +     aer_enable_rootport(rpc);
>>> +     return 0;
>>> +}
>>> +
>>>    /**
>>>     * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>>>     * @dev: pointer to Root Port, RCEC, or RCiEP
>>> @@ -1433,12 +1449,15 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
>>>    }
>>>
>>>    static struct pcie_port_service_driver aerdriver = {
>>> -     .name           = "aer",
>>> -     .port_type      = PCIE_ANY_PORT,
>>> -     .service        = PCIE_PORT_SERVICE_AER,
>>> -
>>> -     .probe          = aer_probe,
>>> -     .remove         = aer_remove,
>>> +     .name                   = "aer",
>>> +     .port_type              = PCIE_ANY_PORT,
>>> +     .service                = PCIE_PORT_SERVICE_AER,
>>> +     .probe                  = aer_probe,
>>> +     .suspend                = aer_suspend,
>>> +     .resume                 = aer_resume,
>>> +     .runtime_suspend        = aer_suspend,
>>> +     .runtime_resume         = aer_resume,
>>> +     .remove                 = aer_remove,
>>>    };
>>>
>>>    /**
>>
>> --
>> Sathyanarayanan Kuppuswamy
>> Linux Kernel Developer

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
