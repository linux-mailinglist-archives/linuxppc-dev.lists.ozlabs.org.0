Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEAC2500
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 18:19:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hnfW3h0zzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 02:19:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LOV43/nm"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hncN1DN9zDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 02:17:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 96250435D5;
 Mon, 30 Sep 2019 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1569860254; x=1571674655; bh=NWL
 ygga9rExfFZwxDh+/XNEofpiGFu+aCwixqG81NuI=; b=LOV43/nmmizxMT7CO5J
 Ymm9dG5qY6PcIs5tC4Bs8yyaSBh+bijXmj6kjUCrPGrtSHuxDXDLw9OO3e2ctdfz
 X75jetbGIw5NsOD56FhCaSQNgXcKABViKfV0Xp4SfogwdRoZR02bK8cGxvAWEV8o
 TDotQ1QfyNIiH+MCcVFeJ35E=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JIhTgMSQHxpV; Mon, 30 Sep 2019 19:17:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 076A54200A;
 Mon, 30 Sep 2019 19:17:32 +0300 (MSK)
Received: from [172.17.15.60] (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Sep 2019 19:17:31 +0300
Subject: Re: [PATCH v5 03/23] PCI: hotplug: Add a flag for the movable BARs
 feature
To: David Laight <David.Laight@ACULAB.COM>, 'Bjorn Helgaas'
 <helgaas@kernel.org>
References: <20190816165101.911-4-s.miroshnichenko@yadro.com>
 <20190927220219.GA57201@google.com>
 <16a86a9e4b464897acee0aeba34d9346@AcuMS.aculab.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Message-ID: <18a27e45-bcba-cdc5-e07e-e73efffce4d9@yadro.com>
Date: Mon, 30 Sep 2019 19:17:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <16a86a9e4b464897acee0aeba34d9346@AcuMS.aculab.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux@yadro.com" <linux@yadro.com>, Lukas Wunner <lukas@wunner.de>,
 Oliver O'Halloran <oohall@gmail.com>, Rajat Jain <rajatja@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello David,

On 9/30/19 11:44 AM, David Laight wrote:
> From: Bjorn Helgaas
>> Sent: 27 September 2019 23:02
>> On Fri, Aug 16, 2019 at 07:50:41PM +0300, Sergey Miroshnichenko wrote:
>>> When hot-adding a device, the bridge may have windows not big enough (or
>>> fragmented too much) for newly requested BARs to fit in. And expanding
>>> these bridge windows may be impossible because blocked by "neighboring"
>>> BARs and bridge windows.
>>>
>>> Still, it may be possible to allocate a memory region for new BARs with the
>>> following procedure:
>>>
>>> 1) notify all the drivers which support movable BARs to pause and release
>>>     the BARs; the rest of the drivers are guaranteed that their devices will
>>>     not get BARs moved;
>>>
>>> 2) release all the bridge windows except of root bridges;
>>>
>>> 3) try to recalculate new bridge windows that will fit all the BAR types:
>>>     - fixed;
>>>     - immovable;
>>>     - movable;
>>>     - newly requested by hot-added devices;
>>>
>>> 4) if the previous step fails, disable BARs for one of the hot-added
>>>     devices and retry from step 3;
>>>
>>> 5) notify the drivers, so they remap BARs and resume.
>>
>> You don't do the actual recalculation in *this* patch, but since you
>> mention the procedure here, are we confident that we never make things
>> worse?
>>
>> It's possible that a hot-add will trigger this attempt to move things
>> around, and it's possible that we won't find space for the new device
>> even if we move things around.  But are we certain that every device
>> that worked *before* the hot-add will still work *afterwards*?
>>
>> Much of the assignment was probably done by the BIOS using different
>> algorithms than Linux has, so I think there's some chance that the
>> BIOS did a better job and if we lose that BIOS assignment, we might
>> not be able to recreate it.
> 
> Yep, removing everything and starting again is probably OTT and most of the churn won't help.
> 
> I think you need to work out what can be moved in order to make the required resources available
> to each bus and then make the required changes.
> 
> In the simplest case you are trying to add resource below a bridge so need to 'shuffle'
> everything allocated after that bridge to later addresses (etc).
> 

Thank you for the review and suggestions!

But a bridge window may be fragmented: its total free space is enough
to fit everything, but no sufficient gaps for the new BARs. And this
bridge window may be jammed between two immovable/fixed BARs.

Or there may be lots of empty spaces in lower addresses after un-plugs,
but everything if fixed/immovable on higher addresses.

I've spent some time thinking on an optimization technique which can
be efficient enough (touch as few BARs as possible) with as high
success rate as calculating from scratch - and concluded that it is
not worth it: if only release the "obstructing" BARs and bridge
windows, a hotplug event will affect a half of (n+m) on average, which
is still O(n+m), where n is a number of endpoints, and m is a
number of bridges. But it's still need to resize windows of a root and
other common bridges.

Calculating bridge windows from scratch is relatively straightforward
and fast, so I have just added support for fixed/immovable BARs there
and reused.

> Many devices that support address reassignment might not need to be moved - so there is
> no point remmapping them.
> 

And it's the same algorithm that allocated BARs in first place, so it
will reassign the same BARs for the non-affected part of the topology.

> There is also the case when a device that is present but not currently is use could be taken
> through a remove+insert sequence in order to change its resources.
> Much easier to implement than 'remap while active'.
> This would require a call into the driver (than can sleep) to request whether it is idle.
> (and probably one at the end if the remove wasn't done).
> 

Unbind+rebind the "immovable" drivers of non-opened devices may
increase the probability of successful BAR allocation, but I'm afraid
this will produce some amount of false hotplug-like events in the logs.
Probably also some undesired effects like spikes in power consumption
because of driver initialization.

Best regards,
Serge

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
