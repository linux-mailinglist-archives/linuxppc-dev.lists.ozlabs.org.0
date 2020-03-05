Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381EF179E3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 04:24:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xx1D4qhXzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 14:24:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XwzZ3TT9zDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 14:22:34 +1100 (AEDT)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6A888FD62758167E30E6;
 Thu,  5 Mar 2020 11:22:25 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 5 Mar 2020 11:22:17 +0800
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
To: Scott Wood <oss@buserror.net>, Daniel Axtens <dja@axtens.net>,
 <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <87tv3drf79.fsf@dja-thinkpad.axtens.net>
 <d673649d6f371e82d4a94ba62bfd0d44efeca7b4.camel@buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <473e276e-ed72-b75b-9797-7845ee27db88@huawei.com>
Date: Thu, 5 Mar 2020 11:22:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d673649d6f371e82d4a94ba62bfd0d44efeca7b4.camel@buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/3/5 5:21, Scott Wood 写道:
> On Wed, 2020-02-26 at 18:16 +1100, Daniel Axtens wrote:
>> Hi Jason,
>>
>>> This is a try to implement KASLR for Freescale BookE64 which is based on
>>> my earlier implementation for Freescale BookE32:
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718
>>>
>>> The implementation for Freescale BookE64 is similar as BookE32. One
>>> difference is that Freescale BookE64 set up a TLB mapping of 1G during
>>> booting. Another difference is that ppc64 needs the kernel to be
>>> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
>>> it 64K-aligned. This can save some code to creat another TLB map at
>>> early boot. The disadvantage is that we only have about 1G/64K = 16384
>>> slots to put the kernel in.
>>>
>>>      KERNELBASE
>>>
>>>            64K                     |--> kernel <--|
>>>             |                      |              |
>>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>>          |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>>          |                         |                        1G
>>>          |----->   offset    <-----|
>>>
>>>                                kernstart_virt_addr
>>>
>>> I'm not sure if the slot numbers is enough or the design has any
>>> defects. If you have some better ideas, I would be happy to hear that.
>>>
>>> Thank you all.
>>>
>>
>> Are you making any attempt to hide kernel address leaks in this series?
>> I've just been looking at the stackdump code just now, and it directly
>> prints link registers and stack pointers, which is probably enough to
>> determine the kernel base address:
>>
>>                    SPs:               LRs:             %pS pointer
>> [    0.424506] [c0000000de403970] [c000000001fc0458] dump_stack+0xfc/0x154
>> (unreliable)
>> [    0.424593] [c0000000de4039c0] [c000000000267eec] panic+0x258/0x5ac
>> [    0.424659] [c0000000de403a60] [c0000000024d7a00]
>> mount_block_root+0x634/0x7c0
>> [    0.424734] [c0000000de403be0] [c0000000024d8100]
>> prepare_namespace+0x1ec/0x23c
>> [    0.424811] [c0000000de403c60] [c0000000024d7010]
>> kernel_init_freeable+0x804/0x880
>>
>> git grep \\\"REG\\\" arch/powerpc shows a few other uses like this, all
>> in process.c or in xmon.
>>
>> Maybe replacing the REG format string in KASLR mode would be sufficient?
> 
> Whatever we decide to do here, it's not book3e-specific so it should be
> considered separately from these patches.
> 

OK, I will continue to work with this series.

> -Scott
> 
> 
> 
> .
> 

