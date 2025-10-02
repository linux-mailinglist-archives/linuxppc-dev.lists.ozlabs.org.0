Return-Path: <linuxppc-dev+bounces-12636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE6BB4D8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 20:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd0GD2GyJz30NF;
	Fri,  3 Oct 2025 04:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759428644;
	cv=none; b=KRUQlfChFxXNT4QzAFBw719UqUuS9FHvWqibaWT/IWMUok69NJQeyz+EhDXB3OWwdPzfao7DfhGVYOzqJzBaYBbmRGNzLlebdLDqSBXT62l3CxP+5QwsSpst8BMh9XF1emp4AWzRHXud14KeHBjHLM6BDqK20RayxFKRzyXmvjPRmgWy84nh6pyDLBVYyeCa1/O2vNYewKUIeuzuNkIi+vu1wsrRG2wfyVks5yx2krUnMYcLFkGzIKCcIwuJZvkvxijKNYIs8sc+arzdOyevuG1Ncohta3e2UTcsapaCXAKqQ1W1zIWr7fLlQG7WptwStlRADiE0M+1uf9KqpKeqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759428644; c=relaxed/relaxed;
	bh=v3TyYHpztLdEeh5TPS0rny6raIh7nGDnQVTNP/jiOLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ua5xTlSgrY+yt091QHkkfGpFn8X1Mgo7cCCfJh9/ICJKVfjpcJyKcJxcpifNunQGBSvrrDRWi/F6QQDKERf7XbR/HA1ivyQBU9OkSkM5m20tPvfZkok5irLyQ8WpQmEu4/+6nhhdqSVpHY7KyAe+ztayq7dbOiz/OTbMz2JFUqRCBAwXcrkQNsOQS06obGYLOYnEQnxyHSki6ACnRbdJEoAepdgXy7GP6SfjFQPrDIpJiFA7wvCk6tXeOAQntDdre+CprRwemEPLj4cCYN4udCtMY42fU0TRffG12VZnpZ27u/1mM/U/aczq7qMNc4wD6n6yFDBgzeRA5nngEXHvYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWjPPFjC; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWjPPFjC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd0G969SWz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 04:10:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759428642; x=1790964642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O5wkUwnKgBzNkysEWRRXmGZptZAllZh7UoEkd0clsMk=;
  b=lWjPPFjCj+aIGEJhMnslDsMOo0fIq3DQJ1MFUX1zQqagRxZKqfT81sAB
   3CUjUJKKO8rXfhFHjqDWKJNRjZdzoKPR2rJaMpLMekWVc121i+dl0idB5
   Gc7OUfSb/tyksEl99yXdVDIgd0NsxtZyT3g0OHi9zVZBgibkjTRDQe68w
   qVZm6DizlaFvAW1IQqIk/QaGzPyzD6KHboin+W6En5quqHWkY+gQ+gXQe
   y7cPmYG8odt32p8b81ncp8idAVwI+yyjEug/cxtT8ivvWcj5x+MCdfGnF
   IIjLxmV9mG74savzT0IZmBHGc8ETUXTG07eC36A3Gbm5UUL/Wpg4Ej2ri
   g==;
X-CSE-ConnectionGUID: YeHXMS/xQtWtrPBj10cUwQ==
X-CSE-MsgGUID: kQsItoJ9QqKkMDgXddMvWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84339493"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="84339493"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:10:36 -0700
X-CSE-ConnectionGUID: A7onqpwtRD2arq6ootLb8w==
X-CSE-MsgGUID: IW16ttgjTUiSWopAP8kd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="184394495"
Received: from skuppusw-desk2.jf.intel.com (HELO [10.165.154.101]) ([10.165.154.101])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 11:10:34 -0700
Message-ID: <9c4e25e4-c6c7-4c56-ba0a-006b40e64d78@linux.intel.com>
Date: Thu, 2 Oct 2025 11:10:34 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] PCI/AER: Check for NULL aer_info before
 ratelimiting in pci_print_aer()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Breno Leitao <leitao@debian.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
 <7b5c1235-df92-4f18-936c-3d7c0d3a6cb3@linux.intel.com>
 <a63012d4-0c98-4022-8183-5a3488ca66e9@csgroup.eu>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <a63012d4-0c98-4022-8183-5a3488ca66e9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/2/25 03:06, Christophe Leroy wrote:
>
>
> Le 29/09/2025 à 17:10, Sathyanarayanan Kuppuswamy a écrit :
>>
>> On 9/29/25 2:15 AM, Breno Leitao wrote:
>>> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
>>> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
>>> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
>>> does not rate limit, given this is fatal.
>>>
>>> This prevents a kernel crash triggered by dereferencing a NULL pointer
>>> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
>>> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
>>> which already performs this NULL check.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>> - This problem is still happening in upstream, and unfortunately no action
>>>    was done in the previous discussion.
>>> - Link to previous post:
>>>    https://eur01.safelinks.protection.outlook.com/? url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250804-aer_crash_2-v1-1- fd06562c18a4%40debian.org&data=05%7C02%7Cchristophe.leroy2%40cs- soprasteria.com%7Cfd3d2f1b4e8448a8e67608ddff6a4e70%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638947554250805439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6yTN1%2Fq%2Fy0VKX%2BXpE%2BiKxBrn19AkY4IPj01N2ZdxEkg%3D&reserved=0
>>> ---
>>
>> Although we haven't identified the path that triggers this issue, adding this check is harmless.
>
> Is it really harmless ?
>
> The purpose of the function is to ratelimit logs. Here by returning 1 when dev->aer_info is NULL it says: don't ratelimit. Isn't it an opened door to Denial of Service by overloading with logs ?

We only skip rate limiting when dev->aer_info is NULL, which happens for
devices without AER capability. In that case, I think the trade-off is reasonable:
generating more logs is better than triggering a NULL pointer exception.

Also, this approach is consistent with other functions (for example, the stat
collection helpers) that already perform similar checks before accessing
aer_info. So extending the same safeguard here seems acceptable to me.

>
> Christophe
>
>>
>> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>>
>>
>>>   drivers/pci/pcie/aer.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index e286c197d7167..55abc5e17b8b1 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>>>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>>>   {
>>> +    if (!dev->aer_info)
>>> +        return 1;
>>> +
>>>       switch (severity) {
>>>       case AER_NONFATAL:
>>>           return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
>>>
>>> ---
>>> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
>>> change-id: 20250801-aer_crash_2-b21cc2ef0d00
>>>
>>> Best regards,
>>> -- 
>>> Breno Leitao <leitao@debian.org>
>>>
>
>

