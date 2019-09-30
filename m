Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8AC1D78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 10:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hbnR3tbFzDqM1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 18:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="mPQ30gUr"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hblm34J5zDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 18:53:24 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9F0FA42EF7;
 Mon, 30 Sep 2019 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1569833597; x=1571647998; bh=bvq
 AspNSXAgm7+a1tixwXZ+YfzxRVIUDNVFojutkECQ=; b=mPQ30gUrZp5J37Gjnmu
 BIpO8rgw799IeQkWmFHi7Z/bTsRtOhMJChVKpSPm1kwYSKDJHU0ccoYYDRJhUrWg
 /RWqE/r1P17aZyuFgX62qkLImisWJAeQXo8Dpo4j/1+55er+ndg7QHzcK7YYxSj5
 qR1h1Vcp6ljRdGcu10CeNiM0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBEtCfK5zJw8; Mon, 30 Sep 2019 11:53:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 55057411F8;
 Mon, 30 Sep 2019 11:53:17 +0300 (MSK)
Received: from [172.17.15.60] (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Sep 2019 11:53:16 +0300
Subject: Re: [PATCH v5 01/23] PCI: Fix race condition in
 pci_enable/disable_device()
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20190927215919.GA54330@google.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Message-ID: <00e9de2a-25f1-32ad-601b-e0c4d29f9799@yadro.com>
Date: Mon, 30 Sep 2019 11:53:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927215919.GA54330@google.com>
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
Cc: Marta Rybczynska <mrybczyn@kalray.eu>, linux-pci@vger.kernel.org,
 Srinath Mannam <srinath.mannam@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Bjorn,

On 9/28/19 12:59 AM, Bjorn Helgaas wrote:
> On Fri, Aug 16, 2019 at 07:50:39PM +0300, Sergey Miroshnichenko wrote:
>> This is a yet another approach to fix an old [1-2] concurrency issue, when:
>>   - two or more devices are being hot-added into a bridge which was
>>     initially empty;
>>   - a bridge with two or more devices is being hot-added;
>>   - during boot, if BIOS/bootloader/firmware doesn't pre-enable bridges.
>>
>> The problem is that a bridge is reported as enabled before the MEM/IO bits
>> are actually written to the PCI_COMMAND register, so another driver thread
>> starts memory requests through the not-yet-enabled bridge:
>>
>>   CPU0                                        CPU1
>>
>>   pci_enable_device_mem()                     pci_enable_device_mem()
>>     pci_enable_bridge()                         pci_enable_bridge()
>>       pci_is_enabled()
>>         return false;
>>       atomic_inc_return(enable_cnt)
>>       Start actual enabling the bridge
>>       ...                                         pci_is_enabled()
>>       ...                                           return true;
>>       ...                                     Start memory requests <-- FAIL
>>       ...
>>       Set the PCI_COMMAND_MEMORY bit <-- Must wait for this
>>
>> Protect the pci_enable/disable_device() and pci_enable_bridge(), which is
>> similar to the previous solution from commit 40f11adc7cd9 ("PCI: Avoid race
>> while enabling upstream bridges"), but adding a per-device mutexes and
>> preventing the dev->enable_cnt from from incrementing early.
> 
> This isn't directly related to the movable BARs functionality; is it
> here because you see the problem more frequently when moving BARs?
> 

First two patches of this series (including this one) are fixes for
the boot and for the hotplug, not related to movable BARs.

Before these fixes, we were suffering from this issue on PowerNV until
commit db2173198b9513f7add8009f225afa1f1c79bcc6 "powerpc/powernv/pci:
Work around races in PCI bridge enabling" was backported to distros:
NVMEs randomly failed to start during system boot. So we've tested the
fixes with that commit reverted.

On x86 the BIOS does pre-enable the bridges, but they were still prone
to races when hot-added or was initially "empty".

Serge
