Return-Path: <linuxppc-dev+bounces-12635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF3BB39F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 12:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccnqp02Qyz30NF;
	Thu,  2 Oct 2025 20:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759400437;
	cv=none; b=iCa2P3gScN6H0YM48tkHkOPGzdkLhkgyBlGPAVk3t2yNn+50kPaS1KDFjFNhokqGPYGd9DddcjXXenBLTihZA9mwKB/p4bkVU3A6JZq6N3s3eSI+OlxhcNb0bHSU7AzkMEV28mlmlZhSaykdC8bRQf4RxsJNohzW9kJJ1DJUB3ITL/tVv0elLBf7sQaQaO5qTprVC6t/lYSBf2NsT1C+p3gZV3QDzfiYvsndOdkCtzX18/iQiAnZhtb6LutbLEKKHJa0XiCqUXc0xpOxR+tlhW4MZiOplYXhFGWQ8FEbUcuddl6NkIL31IRymPrPuCE2wKH/FvS1cNQRDEXOd72hMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759400437; c=relaxed/relaxed;
	bh=WjIFE/idUkT6XXZwLFo9QyAuxub6TBWaOGNmTvCpFYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjTuHNzLshWeqhddDDzZ7jEffVmylT/upk9IPV8OPU3W9Snl3vwfypb8JUBgZB3YBEqaJvGS64R9CrXFiPzevA3Z6865d7g/8fUarsL3itMxhQErC1L2zYIA2usy3D2GeV3a7KazbSC2a7t7gktKilc8bzfIkZ7GN9Mhw6/I8884yswzsBSbSobHvuiiuJtMUH29iwKCO4hwbm28OHhzTVb75EMOCGPRO+zheXPZHl4iQE/MQCbVzwn6dwTD8xxLRj4SGh1C985rtpWSjEns7pz9hSr1p6MHkzexhR81kpw8/Bb/MNnPidLQIz62+pepLwGwphXrhzyGOpqSxKTSEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccnqn1NMNz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 20:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ccnWf6vw3z9sSg;
	Thu,  2 Oct 2025 12:06:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj6qsATOgVWG; Thu,  2 Oct 2025 12:06:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ccnWf5Jssz9sSd;
	Thu,  2 Oct 2025 12:06:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87D8F8B773;
	Thu,  2 Oct 2025 12:06:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0QNfI8vOuITt; Thu,  2 Oct 2025 12:06:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0759F8B769;
	Thu,  2 Oct 2025 12:06:37 +0200 (CEST)
Message-ID: <a63012d4-0c98-4022-8183-5a3488ca66e9@csgroup.eu>
Date: Thu, 2 Oct 2025 12:06:37 +0200
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
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Breno Leitao <leitao@debian.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
 <7b5c1235-df92-4f18-936c-3d7c0d3a6cb3@linux.intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <7b5c1235-df92-4f18-936c-3d7c0d3a6cb3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 29/09/2025 à 17:10, Sathyanarayanan Kuppuswamy a écrit :
> 
> On 9/29/25 2:15 AM, Breno Leitao wrote:
>> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
>> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
>> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
>> does not rate limit, given this is fatal.
>>
>> This prevents a kernel crash triggered by dereferencing a NULL pointer
>> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
>> AER info. This change aligns pci_print_aer() with 
>> pci_dev_aer_stats_incr()
>> which already performs this NULL check.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal 
>> error logging")
>> Signed-off-by: Breno Leitao <leitao@debian.org>
>> ---
>> - This problem is still happening in upstream, and unfortunately no 
>> action
>>    was done in the previous discussion.
>> - Link to previous post:
>>    https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250804-aer_crash_2-v1-1- 
>> fd06562c18a4%40debian.org&data=05%7C02%7Cchristophe.leroy2%40cs- 
>> soprasteria.com%7Cfd3d2f1b4e8448a8e67608ddff6a4e70%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638947554250805439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6yTN1%2Fq%2Fy0VKX%2BXpE%2BiKxBrn19AkY4IPj01N2ZdxEkg%3D&reserved=0
>> ---
> 
> Although we haven't identified the path that triggers this issue, adding 
> this check is harmless.

Is it really harmless ?

The purpose of the function is to ratelimit logs. Here by returning 1 
when dev->aer_info is NULL it says: don't ratelimit. Isn't it an opened 
door to Denial of Service by overloading with logs ?

Christophe

> 
> Reviewed-by: Kuppuswamy Sathyanarayanan 
> <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> 
> 
>>   drivers/pci/pcie/aer.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index e286c197d7167..55abc5e17b8b1 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct 
>> pci_dev *pdev,
>>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>>   {
>> +    if (!dev->aer_info)
>> +        return 1;
>> +
>>       switch (severity) {
>>       case AER_NONFATAL:
>>           return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
>>
>> ---
>> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
>> change-id: 20250801-aer_crash_2-b21cc2ef0d00
>>
>> Best regards,
>> -- 
>> Breno Leitao <leitao@debian.org>
>>


