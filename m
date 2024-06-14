Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54B908270
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 05:19:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjIl8oUx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0kz2715Mz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 13:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjIl8oUx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0kyJ2CW2z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 13:18:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718335129; x=1749871129;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bfC7ZFdSGlt/iPNEFIyEnRVpEJMH7HcVEFcs2hs1+I4=;
  b=gjIl8oUx2UXrC2fUbQcfyh/zPYFUEg4s7JM6IaACieddkaOkH0RHkaP2
   HYMvxNK4m7aEO+cr5CUXG2oo9Tx0eGFRugc4qsf5d2cWcRFfBUeJs6jhg
   LyJH9EX5D8Ggdqezm/bQtmZjBTPtlu56eqyY2/x7B+pKNdNbgDk+yVuZ5
   RHwiAq7oJ4ZzWNk049/yGeY4IwqXgM5IRs8/8h/AkhL29cTUQnEZ8osk0
   6hK16Vv9YFlPkGh2CR9brP95qcnnmM0WfngSBjzXgTxzWNR/sXo/QHaRN
   CKBw6gCH2hIvWylan4nnmHMJpH2TJtYX9Z+2CuVx4wPm3ZTDUQfZsXS34
   g==;
X-CSE-ConnectionGUID: Hh+H/VjvTByEZBecn5pnuQ==
X-CSE-MsgGUID: RGN2r6LRTayYTwR0mh/e/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26604015"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26604015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 20:18:46 -0700
X-CSE-ConnectionGUID: CB/YVIa+RBajDCpGR50kBQ==
X-CSE-MsgGUID: qmQSFax3S4GrkcYS5R16Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="71142877"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO [10.124.223.37]) ([10.124.223.37])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 20:18:44 -0700
Message-ID: <1e04a69d-225d-4e62-9ca9-fb7fbbc16f67@linux.intel.com>
Date: Thu, 13 Jun 2024 20:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
 <20240509084833.2147767-4-zhenzhong.duan@intel.com>
 <9ce06552-79d9-4bd9-9a3e-2ffd72c4cf4a@intel.com>
 <SJ0PR11MB674404B356BFEB3E3E099CFC92C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <SJ0PR11MB674404B356BFEB3E3E099CFC92C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield, Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.com>, "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/13/24 7:40 PM, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Kuppuswamy, Sathyanarayanan
>> Subject: Re: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might
>> be ANFE
>>
>>
>> On 5/9/24 1:48 AM, Zhenzhong Duan wrote:
>>> When processing an ANFE, ideally both correctable error(CE) status and
>>> uncorrectable error(UE) status should be cleared. However, there is no
>>> way to fully identify the UE associated with ANFE. Even worse, Non-Fatal
>>> Error(NFE) may set the same UE status bit as ANFE. Treating an ANFE as
>>> NFE will bring some issues, i.e., breaking softwore probing; treating
>> /s/softwore/software
> Good catch, will fix. It's strange 'checkpatch --codespell' doesn't catch this.
>
>> May be this is already discussed. But can you explain why treating
>> AFNE as non-fatal error will bring probing issues?
> Copied below from spec 6.1, 6.2.3.2.4, says it can results in a System Error.
>
> In some cases the detector of a non-fatal error is not the most appropriate agent to determine whether the error is
> recoverable or not, or if it even needs any recovery action at all. For example, if software attempts to perform a
> configuration read from a non-existent device or Function, the resulting UR Status in the Completion will signal the error
> to software, and software does not need for the Completer in addition to signal the error by sending an ERR_NONFATAL
> Message. In fact, on some platforms, signaling the error with ERR_NONFATAL results in a System Error, which breaks
> normal software probing.
>
>>> NFE as ANFE will make us ignoring some UEs which need active recover
>> /s/ignoring/ignore
> Will fix.
>
>>> operation. To avoid clearing UEs that are not ANFE by accident, the
>>> most conservative route is taken here: If any of the NFE Detected bits
>>> is set in Device Status, do not touch UE status, they should be cleared
>>> later by the UE handler. Otherwise, a specific set of UEs that may be
>>> raised as ANFE according to the PCIe specification will be cleared if
>>> their corresponding severity is Non-Fatal.
>>>
>>> For instance, previously when kernel receives an ANFE with Poisoned TLP
>>> in OS native AER mode, only status of CE will be reported and cleared:
>>>
>>>   AER: Correctable error message received from 0000:b7:02.0
>>>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>>>     device [8086:0db0] error status/mask=00002000/00000000
>>>      [13] NonFatalErr
>>>
>>> If the kernel receives a Malformed TLP after that, two UEs will be
>>> reported, which is unexpected. Malformed TLP Header is lost since
>>> the previous ANFE gated the TLP header logs:
>>>
>>>   PCIe Bus Error: severity="Uncorrectable (Fatal), type=Transaction Layer,
>> (Receiver ID)
>>>     device [8086:0db0] error status/mask=00041000/00180020
>>>      [12] TLP                    (First)
>>>      [18] MalfTLP
>>>
>>> Now, for the same scenario, both CE status and related UE status will be
>>> reported and cleared after ANFE:
>>>
>>>   AER: Correctable error message received from 0000:b7:02.0
>>>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>>>     device [8086:0db0] error status/mask=00002000/00000000
>>>      [13] NonFatalErr
>>>     Uncorrectable errors that may cause Advisory Non-Fatal:
>>>      [18] TLP
>>>
>>> Tested-by: Yudong Wang <yudong.wang@intel.com>
>>> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
>>> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>> ---
>>>  drivers/pci/pcie/aer.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index ed435f09ac27..6a6a3a40569a 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -1115,9 +1115,14 @@ static void pci_aer_handle_error(struct
>> pci_dev *dev, struct aer_err_info *info)
>>>  		 * Correctable error does not need software intervention.
>>>  		 * No need to go through error recovery process.
>>>  		 */
>>> -		if (aer)
>>> +		if (aer) {
>>>  			pci_write_config_dword(dev, aer +
>> PCI_ERR_COR_STATUS,
>>>  					info->status);
>>> +			if (info->anfe_status)
>>> +				pci_write_config_dword(dev,
>>> +						       aer +
>> PCI_ERR_UNCOR_STATUS,
>>> +						       info->anfe_status);
>>> +		}
>> Why split the handling part and storing part into two patches? Why not
>> merge
>> this part of patch 1/3.
> This is based on Bjorn's suggestion at https://www.spinics.net/lists/linux-pci/msg149012.html,
> clearing UNCOR_STATUS might be more important, deserve to raise out.

I think Bjorn's suggestion is to divide it into two logical patches.
One for printing the error and another to clear the UNCOR_STATUS
properly. But currently you have split the UNCOR_STATUS status caching and
clearing process into two patches. IMO, your first patch can store ANFE
status and clear it. You can add print support in the second patch. 


Code wise it looks fine to me. You can add my Reviewed-by after fixing
the typos

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>
> Thanks
> Zhenzhong

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

