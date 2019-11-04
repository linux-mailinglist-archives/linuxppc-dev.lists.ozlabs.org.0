Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB9EE2D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:47:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Fyc2dQ5zF3Xj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 01:47:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::9;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="td1cOibC"; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476FwH2WYhzF3yb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 01:45:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572878744;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BB2ap7qMcOQPaAUjvQiQp65120KVs8wsApOjC50LPr8=;
 b=td1cOibCTStmRJufqdGDL5t+2hU3h5oDGYEe8YVCDmUE1GoYEe6aY6mCrOgnkALI5j
 KdMCwSJQ8IvXg0wqVf/cEwK3aIowbV+78ErERikDxJd4ToOIO97SXx9EsvQbB4bwPK2y
 d55h1X+8lbjIN14dWyy99YZ6F7vZo1Ot+SBn6fgTRoG0dS4y7x+3ko+PvS6vozdP4UeG
 uLDUMm4fI/JxHih0oZsUwnI/g498woer3aX1Bc6kNDaDQNfXBQL03sOyfRp1bf1mLez5
 IYE6DnA6yhw06jeyxQQDeOazND+QuB87vWJshfB4/089f7Ennm9gx7S8H/josLAnIgg8
 c4GA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhRLvD1C7gwmlA7f0DygmF7yo72KQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:2873:af5c:c097:9730]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vA4EiadWs
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 4 Nov 2019 15:44:36 +0100 (CET)
Subject: Re: Onboard SD card doesn't work anymore after the 'mmc-v5.4-2'
 updates
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <7b549219-a2e1-08c7-331b-9c3e4fdb8a8f@xenosoft.de>
 <3aeae0d8-e9be-2585-cbbd-70263cb495f1@xenosoft.de>
 <20191015125105.GU25745@shell.armlinux.org.uk>
 <5611f3bc-68aa-78ec-182a-1cb414202314@xenosoft.de>
 <20191015131750.GV25745@shell.armlinux.org.uk>
 <87muds586t.fsf@mpe.ellerman.id.au>
 <AD53973C-4491-4114-9CEE-81F516EF6249@xenosoft.de>
Message-ID: <668ae8d5-f9f9-6304-d389-a854da53c2d2@xenosoft.de>
Date: Mon, 4 Nov 2019 15:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <AD53973C-4491-4114-9CEE-81F516EF6249@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: ulf.hansson@linaro.org, mad skateman <madskateman@gmail.com>,
 linux-mmc@vger.kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev@lists.ozlabs.org, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

FYI: The onboard SD card works also with the RC6 of kernel 5.4 with the 
patch below.

-- Christian

On 23 October 2019 at 4:20pm, Christian Zigotzky wrote:
> Hello,
>
> The patch below works. I compiled the RC4 of kernel 5.4 with this patch today and the onboard SD card works without any problems.
>
> Thanks!
>
> Christian
>
>> On 23. Oct 2019, at 07:42, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Russell King - ARM Linux admin <linux@armlinux.org.uk> writes:
>>>> On Tue, Oct 15, 2019 at 03:12:49PM +0200, Christian Zigotzky wrote:
>>>> Hello Russell,
>>>>
>>>> You asked me about "dma-coherent" in the Cyrus device tree. Unfortunately I
>>>> don't find the property "dma-coherent" in the dtb source files.
>>>>
>>>> Output of "fdtdump cyrus_p5020_eth_poweroff.dtb | grep dma":
>>>>
>>>> dma0 = "/soc@ffe000000/dma@100300";
>>>>          dma1 = "/soc@ffe000000/dma@101300";
>>>>          dma@100300 {
>>>>              compatible = "fsl,eloplus-dma";
>>>>              dma-channel@0 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@80 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@100 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@180 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>          dma@101300 {
>>>>              compatible = "fsl,eloplus-dma";
>>>>              dma-channel@0 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@80 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@100 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>>>              dma-channel@180 {
>>>>                  compatible = "fsl,eloplus-dma-channel";
>>> Hmm, so it looks like PowerPC doesn't mark devices that are dma
>>> coherent with a property that describes them as such.
>>>
>>> I think this opens a wider question - what should of_dma_is_coherent()
>>> return for PowerPC?  It seems right now that it returns false for
>>> devices that are DMA coherent, which seems to me to be a recipe for
>>> future mistakes.
>> Right, it seems of_dma_is_coherent() has baked in the assumption that
>> devices are non-coherent unless explicitly marked as coherent.
>>
>> Which is wrong on all or at least most existing powerpc systems
>> according to Ben.
>>
>>> Any ideas from the PPC maintainers?
>> Fixing it at the source seems like the best option to prevent future
>> breakage.
>>
>> So I guess that would mean making of_dma_is_coherent() return true/false
>> based on CONFIG_NOT_COHERENT_CACHE on powerpc.
>>
>> We could do it like below, which would still allow the dma-coherent
>> property to work if it ever makes sense on a future powerpc platform.
>>
>> I don't really know any of this embedded stuff well, so happy to take
>> other suggestions on how to handle this mess.
>>
>> cheers
>>
>>
>> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
>> index 25aaa3903000..b96c9010acb6 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -760,6 +760,22 @@ static int __init check_cache_coherency(void)
>> late_initcall(check_cache_coherency);
>> #endif /* CONFIG_CHECK_CACHE_COHERENCY */
>>
>> +#ifndef CONFIG_NOT_COHERENT_CACHE
>> +/*
>> + * For historical reasons powerpc kernels are built with hard wired knowledge of
>> + * whether or not DMA accesses are cache coherent. Additionally device trees on
>> + * powerpc do not typically support the dma-coherent property.
>> + *
>> + * So when we know that DMA is coherent, override arch_of_dma_is_coherent() to
>> + * tell the drivers/of code that all devices are coherent regardless of whether
>> + * they have a dma-coherent property.
>> + */
>> +bool arch_of_dma_is_coherent(struct device_node *np)
>> +{
>> +    return true;
>> +}
>> +#endif
>> +
>> #ifdef CONFIG_DEBUG_FS
>> struct dentry *powerpc_debugfs_root;
>> EXPORT_SYMBOL(powerpc_debugfs_root);
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 978427a9d5e6..3a4b2949a322 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -993,6 +993,14 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>> }
>> EXPORT_SYMBOL_GPL(of_dma_get_range);
>>
>> +/*
>> + * arch_of_dma_is_coherent - Arch hook to determine if device is coherent for DMA
>> + */
>> +bool __weak arch_of_dma_is_coherent(struct device_node *np)
>> +{
>> +    return false;
>> +}
>> +
>> /**
>>   * of_dma_is_coherent - Check if device is coherent
>>   * @np:    device node
>> @@ -1002,8 +1010,12 @@ EXPORT_SYMBOL_GPL(of_dma_get_range);
>>   */
>> bool of_dma_is_coherent(struct device_node *np)
>> {
>> -    struct device_node *node = of_node_get(np);
>> +    struct device_node *node;
>> +
>> +    if (arch_of_dma_is_coherent(np))
>> +        return true;
>>
>> +    np = of_node_get(np);
>>     while (node) {
>>         if (of_property_read_bool(node, "dma-coherent")) {
>>             of_node_put(node);

