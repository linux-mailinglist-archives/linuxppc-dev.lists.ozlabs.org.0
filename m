Return-Path: <linuxppc-dev+bounces-9514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B3ADFA4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 02:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN1t43fZ7z2yqn;
	Thu, 19 Jun 2025 10:38:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750293484;
	cv=none; b=omIqrTvbc7d18CNtD+i5JcPTbeSTbTs1LDtBN7v9cZxXqtqn3wYCURAa8SAllZ1wfv7W11wxCbA+JreoK49g2/nf93Ct+FwI3pa2B1SVtiPQWR6fls41PlmyXqOis5Pt0bKH7Buig8WwF5oQ7XnHUYo+S6PO3CyWElu5tnfLlPJLXzQp9tS6mK2Ef1CO+dhBXMN+YBbjIInzrAC3HaPCG4icCFr4IPFjERzpl462wnXgFT+8qd9krDgV7fgdxFGHwQ7NwyCwK3iUqCypT1OPy3TgKvAs5JOC5hNY+bbJxw5Zrrv9briqz3sHhmUuxNsvKRcHBZIV86f/KHl9uPpZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750293484; c=relaxed/relaxed;
	bh=Q9w+b4fYJ33GmI5ccuzAIoUJBfCmv1gJrhUlRTyPCDg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bIObCZ2QdpSIhJmFRjHImBzsGpsBNrgSvUk4uvSZ6Fu1T46fcPpK0FRsuynhGUEFADnUaj4TWO8W+MGuDbt1hv1mm/9E8hYkLlmkFyydf0TKh3Z1pECJOv+UAbQqqJswnaWrkWC3ASpwAWl6pyLdP0lyTYM0aoaCTwidO7dpJqHbYKueKD1tZHLn7LDVUVx1isPtM2HPP3Wd6NlCJ254JDbo4MJRQ/qRMAYpYDfn2sfiS2bWxzttiSz/DlJUYcelkUjQuG4lglDyOgdjQAkif/o+DKYcopM39P3zCI/yPzaj1zFTuNHMm7GnTygSU2uiTkLd1h/X+URAb0jQC0cSWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=fCNQwZSN; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=fCNQwZSN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN1t30Rxjz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 10:38:02 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A29968287A6A;
	Wed, 18 Jun 2025 19:38:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yMleV-6kXUQY; Wed, 18 Jun 2025 19:37:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id CDFDB8288035;
	Wed, 18 Jun 2025 19:37:57 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CDFDB8288035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750293477; bh=Q9w+b4fYJ33GmI5ccuzAIoUJBfCmv1gJrhUlRTyPCDg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=fCNQwZSNHwvwQKBGcGpFbsyfRxDhvc9QAjlsE5UWR0Teasz5/r1ioK8ie6DjdfS28
	 Bi3zH1vVYMzHKBpxhNyPipsRHMwkeCODPv/GoflkA5rvNwsbMsimTTkBPh6m038/V+
	 9130BbtCYN8KH/YrwM1xX79qThIfY9aayg3bAal8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zOSsFrDhJwnk; Wed, 18 Jun 2025 19:37:57 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8A22E8287A6A;
	Wed, 18 Jun 2025 19:37:57 -0500 (CDT)
Date: Wed, 18 Jun 2025 19:37:54 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250618190146.GA1213349@bhelgaas>
References: <20250618190146.GA1213349@bhelgaas>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Enable third attention indicator
Thread-Index: yG5gRsIlLAjK/qBNlVwR8Z2oiwzhPw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Bjorn Helgaas" <helgaas@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Wednesday, June 18, 2025 2:01:46 PM
> Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention indicator

> On Wed, Jun 18, 2025 at 11:58:59AM -0500, Timothy Pearson wrote:
>>  state
> 
> Weird wrapping of last word of subject to here.

I'll need to see what's up with my git format-patch setup. Apologies for that across the multiple series.

>> The PCIe specification allows three attention indicator states,
>> on, off, and blink.  Enable all three states instead of basic
>> on / off control.
>> 
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>  drivers/pci/hotplug/pnv_php.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
>> index 0ceb4a2c3c79..c3005324be3d 100644
>> --- a/drivers/pci/hotplug/pnv_php.c
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -440,10 +440,23 @@ static int pnv_php_get_adapter_state(struct hotplug_slot
>> *slot, u8 *state)
>>  	return ret;
>>  }
>>  
>> +static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8
>> *state)
>> +{
>> +	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>> +	struct pci_dev *bridge = php_slot->pdev;
>> +	u16 status;
>> +
>> +	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
>> +	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
> 
> Should be able to do this with FIELD_GET().

I used the same overall structure as the pciehp_hpc driver here.  Do you want me to also fix up that driver with FIELD_GET()?

> Is the PCI_EXP_SLTCTL_PIC part needed?  It wasn't there before, commit
> log doesn't mention it, and as far as I can tell, this would be the
> only driver to do that.  Most expose only the attention status (0=off,
> 1=on, 2=identify/blink).
> 
>> +	return 0;
>> +}
>> +
>> +
>>  static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
>>  {
>>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>>  
>> +	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);
> 
> This is a change worth noting.  Previously we didn't read the AIC
> state from PCI_EXP_SLTCTL at all; we used php_slot->attention_state to
> keep track of whatever had been previously set via
> pnv_php_set_attention_state().
> 
> Now we read the current state from PCI_EXP_SLTCTL.  It's not clear
> that php_slot->attention_state is still needed at all.

It probably isn't.  It's unclear why IBM took this path at all, given pciehp's attention handlers predate pnv-php's by many years.

> Previously, the user could write any value at all to the sysfs
> "attention" file and then read that same value back.  After this
> patch, the user can still write anything, but reads will only return
> values with PCI_EXP_SLTCTL_AIC and PCI_EXP_SLTCTL_PIC.
> 
>>  	*state = php_slot->attention_state;
>>  	return 0;
>>  }
>> @@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot
>> *slot, u8 state)
>>  	mask = PCI_EXP_SLTCTL_AIC;
>>  
>>  	if (state)
>> -		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
>> +		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
> 
> This changes the behavior in some cases:
> 
>  write 0: previously turned indicator off, now writes reserved value
>  write 2: previously turned indicator on, now sets to blink
>  write 3: previously turned indicator on, now turns it off

If we're looking at normalizing with pciehp with an eye toward eventually deprecating / removing pnv-php, I can't think of a better time to change this behavior.  I suspect we're the only major user of this code path at the moment, with most software expecting to see pciehp-style handling.  Thoughts?

