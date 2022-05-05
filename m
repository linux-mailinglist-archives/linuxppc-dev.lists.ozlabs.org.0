Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6051CBEE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 00:10:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvSZQ2X6sz3bd7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 08:10:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IeOL0OKC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IeOL0OKC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvSYf0WCQz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 08:10:13 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Kj2dZ017268;
 Thu, 5 May 2022 22:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MrU29fcn14GDRfr2Wf0nuMab2K7bMjsFzwPUGCuHLms=;
 b=IeOL0OKC1v1S8AboEcKHTeG1Y/8yZ0RxeBiJAUASflulOXG0vaFQWhRDTarIP4uU9+gA
 TpFq/fJ3UQQzHWhU0NiDWS7JBfxQ875zib9fpRWTI2GrrDPf2FyXtGid1LFbTwjUzmO6
 V76xshUe3NENMzJ/3PEsdCRFplqrua5Gs813jRY3RdquaOjEzMDdGNK3Hrl2Sha6PzPG
 MT3s5KZ7w7yjbpjn69MMWkdyCF2IMq2Gvud9Q67pWPAFBdjsAbUUeQOl5dqPs4cQ40lV
 F2vZ9sGgO9hZ4aAqE+vvTaLgxY/I9kjERAPYrJ7QihSI+u26p6yPIDshGx0MqCVRpg2R pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvnvrs8ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 22:10:05 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 245Lu081027541;
 Thu, 5 May 2022 22:10:05 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvnvrs8wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 22:10:04 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245M8KcJ015766;
 Thu, 5 May 2022 22:10:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3frvra4e00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 22:10:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245MA3uN24248682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 22:10:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FA8C78060;
 Thu,  5 May 2022 22:10:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38FE57806A;
 Thu,  5 May 2022 22:10:02 +0000 (GMT)
Received: from [9.77.154.170] (unknown [9.77.154.170])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 22:10:02 +0000 (GMT)
Message-ID: <2cfb2cd8-3bad-3c66-b8ee-918d615f7719@linux.ibm.com>
Date: Thu, 5 May 2022 15:10:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for PCI
 domain
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220504175718.29011-1-pali@kernel.org>
 <8ffa0287-de5e-4308-07d8-204ac2e7f63a@csgroup.eu>
 <20220505093132.45ehu6pdfzmvt2xw@pali>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20220505093132.45ehu6pdfzmvt2xw@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eVQaPeDakQnT_t-afYqfmdwiYNj6v_v0
X-Proofpoint-ORIG-GUID: F3tBA_U-4THprWI2NEKcngu3WBWHsgrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_09,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050142
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
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/5/22 02:31, Pali Rohár wrote:
> Hello!
> 
> On Thursday 05 May 2022 07:16:40 Christophe Leroy wrote:
>> Le 04/05/2022 à 19:57, Pali Rohár a écrit :
>>> Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
>>> device-tree properties"), powerpc kernel always fallback to PCI domain
>>> assignment from OF / Device Tree 'reg' property of the PCI controller.
>>>
>>> PCI code for other Linux architectures use increasing assignment of the PCI
>>> domain for individual controllers (assign the first free number), like it
>>> was also for powerpc prior mentioned commit.
>>>
>>> Upgrading powerpc kernels from LTS 4.4 version (which does not contain
>>> mentioned commit) to new LTS versions brings a regression in domain
>>> assignment.
>>
>> Can you elaborate why it is a regression ?
>>63a72284b159
>> That commit says 'no functionnal changes', I'm having hard time 
>> understanding how a nochange can be a regression.
> 
> It is not 'no functional change'. That commit completely changed PCI
> domain assignment in a way that is incompatible with other architectures
> and also incompatible with the way how it was done prior that commit.

I agree that the "no functional change" statement is incorrect. However, for
most powerpc platforms it ended up being simply a cosmetic behavior change. As
far as I can tell there is nothing requiring domain ids to increase montonically
from zero or that each architecture is required to use the same domain numbering
scheme. Its hard to call this a true regression unless it actually broke
something. The commit in question has been in the kernel since 4.8 which was
released over 5 1/2 years ago.

With all that said looking closer at the code in question I think it is fair to
assume that the author only intended this change for powernv and pseries
platforms and not every powerpc platform. That change was done to make
persistent naming easier to manage in userspace. Your change defaults back to
the old behavior which will now break both powernv and pseries platforms with
regard to hotplugging and persistent naming.

We could properly limit it to powernv and pseries by using ibm,fw-phb-id instead
of reg property in the look up that follows a failed ibm,opal-phbid lookup. I
think this is acceptable as long as no other powerpc platforms have started
using this behavior for persistent naming.

-Tyrel

> For example, prior that commit on P2020 RDB board were PCI domains 0, 1 and 2.
> 
> $ lspci
> 0000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> 0000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
> 0001:02:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> 0001:03:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
> 0002:04:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> 0002:05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
> 
> After that commit on P2020 RDB board are PCI domains 0x8000, 0x9000 and 0xa000.
> 
> $ lspci
> 8000:00:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> 8000:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
> 9000:02:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> 9000:03:00.0 Network controller: Qualcomm Atheros AR93xx Wireless Network Adapter (rev 01)
> a000:04:00.0 PCI bridge: Freescale Semiconductor Inc P2020E (rev 21)
> a000:05:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
> 
> It is somehow strange that PCI domains are not indexed one by one and
> also that there is no domain 0
> 
> With my patch when CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG is not set, then
> previous behavior used and PCI domains are again 0, 1 and 2.
> 
>> Usually we don't commit regressions to mainline ...
>>
>>
>>>
>>> Fix this issue by introducing a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG
>>> When this options is disabled then powerpc kernel would assign PCI domains
>>> in the similar way like it is doing kernel for other architectures and also
>>> how it was done prior that commit.
>>
>> You don't define CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG on by default, it 
>> means this commit will change the behaviour. Is that expected ?
>>
>> Is that really worth a user selectable option ? Is the user able to 
>> decide what he needs ?
> 
> Well, I hope that maintainers of that code answer to these questions.
> 
> In any case, I think that it could be a user selectable option as in
> that commit is explained that in some situation is makes sense to do
> PCI domain numbering based on DT reg.
> 
> But as I pointed above, upgrading from 4.4 TLS kernel to some new TLS
> kernel brings above regression, so I think that there should be a way to
> disable this behavior.
> 
> In my opinion, for people who are upgrading from 4.4 TLS kernel, this
> option should be turned off by default (= do not change behavior). For
> people who want same behaviour on powerpc as on other platforms, also it
> should be turned off by default.
> 
>>>
>>> Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
>>
>> Is that really a fix ? What is the problem really ?
> 
> Problem is that PCI domains were changed in a way that is not compatible
> neither with version prior that commit and neither with how other linux
> platforms assign PCI domains for controllers.
> 
>>> Signed-off-by: Pali Rohár <pali@kernel.org>
>>> ---
>>>   arch/powerpc/Kconfig             | 10 ++++++++++
>>>   arch/powerpc/kernel/pci-common.c |  4 ++--
>>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 174edabb74fa..4dd3e3acddda 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -375,6 +375,16 @@ config PPC_OF_PLATFORM_PCI
>>>   	depends on PCI
>>>   	depends on PPC64 # not supported on 32 bits yet
>>>   
>>> +config PPC_PCI_DOMAIN_FROM_OF_REG
>>> +	bool "Use OF reg property for PCI domain"
>>> +	depends on PCI
>>
>> Should it depend on PPC_OF_PLATFORM_PCI instead ?
> 
> No, PPC_OF_PLATFORM_PCI has line "depends on PPC64 # not supported on 32
> bits yet". But it is already used also for e.g. P2020 which is 32-bit
> platform.
> 
>>> +	help
>>> +	  By default PCI domain for host bridge during its registration is
>>> +	  chosen as the lowest unused PCI domain number.
>>> +
>>> +	  When this option is enabled then PCI domain is determined from
>>> +	  the OF / Device Tree 'reg' property.
>>> +
>>>   config ARCH_SUPPORTS_UPROBES
>>>   	def_bool y
>>>   
>>> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
>>> index 8bc9cf62cd93..8cb6fc5302ae 100644
>>> --- a/arch/powerpc/kernel/pci-common.c
>>> +++ b/arch/powerpc/kernel/pci-common.c
>>> @@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
>>>   static int get_phb_number(struct device_node *dn)
>>>   {
>>>   	int ret, phb_id = -1;
>>> -	u32 prop_32;
>>>   	u64 prop;
>>>   
>>>   	/*
>>> @@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
>>>   	 * reading "ibm,opal-phbid", only present in OPAL environment.
>>>   	 */
>>>   	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
>>
>> This looks like very specific, it is not reflected in the commit log.
> 
> I have not changed nor touched this "ibm,opal-phbid" setting. And it was
> not also touched in that mentioned patch. I see that no DTS file in
> kernel use this option (so probably only DTS files supplied by
> bootloader use it). So I thought that there is not reason to mention in
> commit message.
> 
> But if you think so, I can add some info to commit message about it.
> 
>>> -	if (ret) {
>>> +	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
>>> +		u32 prop_32;
>>>   		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
>>>   		prop = prop_32;
>>>   	}

