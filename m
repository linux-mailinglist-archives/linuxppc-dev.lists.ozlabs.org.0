Return-Path: <linuxppc-dev+bounces-12625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356DBAA230
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 19:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cb7Hp6wFHz304x;
	Tue, 30 Sep 2025 03:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759166438;
	cv=none; b=lB+G/qUklI8kWFgYnhne30kzuITKvRe46LrBbf6Yn0Z9iYBHjd4MOX4H3vcuiUUGqkJRFd7ofXVL6OEuJ6fo13F3cnEpAxFNdq0fJXhicvyQb8FPi2/LIeE/9R2BvXnKbIOM8K1SA7yURjkcSx9SlcCiqWTaftsjCJEWBklvJFe7S7wvDSHaz8k93YkC96K5S+Sxr4cDGf2e5IHtuP6UJdH5TsmInEMs+WRL0x+ZdQVCNrUTBz6TmU5/FudtpCcrDuZOgnQeCkU1mDeHvIx5javajagx5BWE056iN96aQwRqWAdhX4WFpGpJ7Qo0f5+EbevPB7OYgxcA/CBVHiH6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759166438; c=relaxed/relaxed;
	bh=K8DYO70qUDkIDJBQpLmRqIUK7FlD5TrzihYMjefO29g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPABinmHhkeBw/padvSPTmjPIrGV+kXgCQHl5OR6MMoYpZf8WhFAoFB4LepWeycBODqBDCFkdcXoqPv015GHlhomIq4jOMIinUP60tlybKpHBjlGBkGvjvw7p+DTvH4YLEH+kKxd3Yl9QctVWgwd3ZnUlJcW+ZJPk4cq9xaWs1rVjMwEr6441Nj+uS6ddkTLDrH57lDGq0AuuvbnahoKG0PVOMiKiz7OS1Kw43hiNg+1097GTO5IJ2xEXrnF5EXriAUiiiGMBSkBJBrVhEx4SuT3J70ebb52/sS19gT/jlKh1ZwAeNJK0znP+PQMZbOA3ZOB39+yTe58Ojj5lvdmtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cb7Hn6bdMz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Sep 2025 03:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cb6t02VLnz9sS8;
	Mon, 29 Sep 2025 19:01:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjXqacDyzuvU; Mon, 29 Sep 2025 19:01:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cb6t01lRmz9sRs;
	Mon, 29 Sep 2025 19:01:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28E228B786;
	Mon, 29 Sep 2025 19:01:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LLWkJrEfX4ME; Mon, 29 Sep 2025 19:01:44 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96C498B783;
	Mon, 29 Sep 2025 19:01:43 +0200 (CEST)
Message-ID: <ea7cd581-d6cd-4b0d-986c-d0b43b613858@csgroup.eu>
Date: Mon, 29 Sep 2025 19:01:43 +0200
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
To: Breno Leitao <leitao@debian.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250929-aer_crash_2-v1-1-68ec4f81c356@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 29/09/2025 à 11:15, Breno Leitao a écrit :
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.
> 
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.
> 
> Cc: stable@vger.kernel.org
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> - This problem is still happening in upstream, and unfortunately no action
>    was done in the previous discussion.
> - Link to previous post:
>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250804-aer_crash_2-v1-1-fd06562c18a4%40debian.org&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cf48f0ae03ec542e13e5408ddff38d9d9%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638947341818450358%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ZzJDmrmyDpWh4JZQQzKFZVf%2BeYucLdNOr5L6tgytNPE%3D&reserved=0
> ---
>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d7167..55abc5e17b8b1 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   
>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>   {
> +	if (!dev->aer_info)
> +		return 1;
> +

This is a static function, it cannot be called from outside aer.c . Why 
do you need such a check ?

I a check was to be made it should be in pci_aer_init() and in fact if 
kmalloc fails then all the probe should be made to fail.

>   	switch (severity) {
>   	case AER_NONFATAL:
>   		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
> 
> ---
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
> 
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
> 
> 


