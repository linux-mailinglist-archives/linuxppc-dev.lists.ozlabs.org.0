Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986AE666728
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NskQQ2zp4z3cgx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 10:28:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afi72VSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afi72VSy;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NskPR4Gczz3c6s
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 10:27:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673479675; x=1705015675;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n4DiTA+fkM0MEW9fB8q/JyMf0tXVGfHCcAWyb5AraTs=;
  b=afi72VSy4W+QAUOOSb5yQzQoVK3q2OdR+6qT/C3ujgs/2yCietQqYWdc
   HxuidDhlNMJzBukEvoteaTzjoXUG3bn/MPO1aWvc4E+Zm+WpaK5WSKtnh
   Ky29ipoYUwtx1UodbqMG3hskXYnuN7gLwfur3zYxngNaKKXUkO8VlEYup
   +0qCX5X7OXsoIv7SpDMTLgtvHq0RpP6ZVI0ynZcTZkEUK3fDh4XJd6sL9
   ZHAWmKbSDc2CndKAIwcnc8kFu5B3L0nQWXtY17v9AJQE60FSLdHeyAmdj
   /K4lm0euK6maRqhuPZFRrnaLnAPW8QqizUYCeMVu1ET8cyW6hFZJiWRyw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303937918"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="303937918"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 15:27:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650918133"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="650918133"
Received: from mabir-mobl.amr.corp.intel.com (HELO [10.209.115.16]) ([10.209.115.16])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 15:27:51 -0800
Message-ID: <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
Date: Wed, 11 Jan 2023 15:27:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230111231033.GA1714672@bhelgaas>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230111231033.GA1714672@bhelgaas>
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 1/11/23 3:10 PM, Bjorn Helgaas wrote:
> On Wed, Jan 11, 2023 at 01:42:21PM -0800, Sathyanarayanan Kuppuswamy wrote:
>> On 1/11/23 12:31 PM, Vidya Sagar wrote:
>>> As the ECRC configuration bits are part of AER registers, configure
>>> ECRC only if AER is natively owned by the kernel.
>>
>> ecrc command line option takes "bios/on/off" as possible options. It
>> does not clarify whether "on/off" choices can only be used if AER is
>> owned by OS or it can override the ownership of ECRC configuration 
>> similar to pcie_ports=native option. Maybe that needs to be clarified.
> 
> Good point, what do you think of an update like this:
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..f7b40a439194 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4296,7 +4296,9 @@
>  				specified, e.g., 12@pci:8086:9c22:103c:198f
>  				for 4096-byte alignment.
>  		ecrc=		Enable/disable PCIe ECRC (transaction layer
> -				end-to-end CRC checking).
> +				end-to-end CRC checking).  Only effective
> +				if OS has native AER control (either granted by
> +				ACPI _OSC or forced via "pcie_ports=native").
>  				bios: Use BIOS/firmware settings. This is the
>  				the default.
>  				off: Turn ECRC off

Looks fine. But do we even need "bios" option? Since it is the default
value, I am not sure why we need to list that as an option again. IMO
this could be removed.

> 
> I don't know whether the "ecrc=" parameter is really needed.  If we
> were adding it today, I would ask "why not enable ECRC wherever it is
> supported?"  If there are devices where it's broken, we could always
> add quirks to disable it on a case-by-case basis.

Checking the original patch which added it, it looks like the intention
is to give option to boost performance over integrity.

commit 43c16408842b0eeb367c23a6fa540ce69f99e347
Author: Andrew Patterson <andrew.patterson@hp.com>
Date:   Wed Apr 22 16:52:09 2009 -0600

    PCI: Add support for turning PCIe ECRC on or off
    
    Adds support for PCI Express transaction layer end-to-end CRC checking
    (ECRC).  This patch will enable/disable ECRC checking by setting/clearing
    the ECRC Check Enable and/or ECRC Generation Enable bits for devices that
    support ECRC.
    
    The ECRC setting is controlled by the "pci=ecrc=<policy>" command-line
    option. If this option is not set or is set to 'bios", the enable and
    generation bits are left in whatever state that firmware/BIOS set them to.
    The "off" setting turns them off, and the "on" option turns them on (if the
    device supports it).
    
    Turning ECRC on or off can be a data integrity versus performance
    tradeoff.  In theory, turning it on will catch more data errors, turning
    it off means possibly better performance since CRC does not need to be
    calculated by the PCIe hardware and packet sizes are reduced.


> 
> But I think the patch below is the right thing to do for now.  Vidya,

Agree.

> did you trip over an issue because of this, e.g., a conflict between
> firmware use of AER and Linux use of it?  If so, maybe we could
> mention a symptom on the commit log.  But my guess is you probably
> found this by inspection.
> 
> Bjorn
> 
>>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>>> ---
>>>  drivers/pci/pcie/aer.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index e2d8a74f83c3..730b47bdcdef 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
>>>   */
>>>  void pcie_set_ecrc_checking(struct pci_dev *dev)
>>>  {
>>> +	if (!pcie_aer_is_native(dev))
>>> +		return;
>>> +
>>>  	switch (ecrc_policy) {
>>>  	case ECRC_POLICY_DEFAULT:
>>>  		return;
>>
>> -- 
>> Sathyanarayanan Kuppuswamy
>> Linux Kernel Developer

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
