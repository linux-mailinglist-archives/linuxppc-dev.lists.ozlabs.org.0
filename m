Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C57F3EDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 08:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZt9P4svVz3dVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 18:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=ke.zhao@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZt8v2CXpz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 18:26:38 +1100 (AEDT)
X-QQ-mid: bizesmtp90t1700637925tzulhvmw
Received: from [127.0.0.1] ( [121.8.34.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Nov 2023 15:25:23 +0800 (CST)
X-QQ-SSF: 01400000000000409000000A0000000
X-QQ-FEAT: 3M0okmaRx3gWbAZsppbqFXOgd+ASBlrd9OFaP+k9ueK1HKF7gWC1foXGe+EqS
	5s6Lqk4gZyRfovsWbuSJZ6iEmY9Q/CaPZofkp99N4oOXlUK89nrxiSjyNQAgFazULJvGX7j
	WNKx9qE+yZGk5Afi+kgu5gMhqPbVkXoE2DPLtYXbABX997agyfD7UySSnu67oRaaB6ExlVX
	2oS0xrlmTAcMOPt/uR0/Vyv9jXSIIfqit/lEYZ9gUPAyXn/5bqIwe9I7NRDi+N2egMU3LTq
	0iplZfUmlVo6VOWXkHddbWDdro4A/RdLH/uc4J5tu9zuSc0Lg0keAOuWdD+2ABk9RzXvnd0
	VxQ2lGVdQaaHhztyAecc7vztzu4Ve7h6jy9E1cIKWok0n69pqWqlf090A7zV+Ue8lcHGPCh
	JRbJJGS63Zc=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 9463445068661459453
Message-ID: <52743BC52E07B486+dcb66331-0993-462b-ac03-6de69a3e1fac@shingroup.cn>
Date: Wed, 22 Nov 2023 15:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Add PVN support for HeXin C2000 processor
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
References: <20231117075215.647-1-ke.zhao@shingroup.cn>
 <87sf4yk19w.fsf@mail.lhotse>
Content-Language: en-US
From: =?UTF-8?B?WmhhbyBLZSDotbUg5Y+v?= <ke.zhao@shingroup.cn>
In-Reply-To: <87sf4yk19w.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
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
Cc: luming.yu@shingroup.cn, kvm@vger.kernel.org, dawei.li@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 2023/11/22 9:46, Michael Ellerman wrote:
> Zhao Ke <ke.zhao@shingroup.cn> writes:
>> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
>> for its new processor C2000. The OpenPower has assigned a new PVN
>> and this newly assigned PVN is 0x0066, add pvr register related
>> support for this PVN.
>>
>> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
>> Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10
>   
> Hi Zhao Ke,
>
> Thanks for the patch. Just a few questions.
>
> Are you able to provide any further detail on the processor?
>
> Your cputable entry claims that it's identical to the original Power8
> core, can you comment at all on how true that is in practice?

Basically, we made lots of design change for the new processor.

For example:

     1. redesign the interconnect of the fabric, from crossbar to mesh

     2. redesign the memory subsystem, including the modification of L2 
and L3 architecture

     3. redesign the SMP bus

     4. upgrade PCIe to gen5 and increase the number of lanes

     5. upgrade ddr to DDR5, dimm direct connected, and the number of 
channels

     6. redesign the pervasive architecture, including debug/trace, 
clock&power management, etc.


> Unfortunately the kernel has some hard-coded knowledge of various
> non-architected features, which are not controlled via the CPU table,
> and are instead controlled by firmware. So you'll need to make sure you
> set those correctly, see init_fw_feat_flags() for details.

Thanks for telling me, we have a firmware team and we will work together

on this.

> One other comment below ...
>
>> diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> index c370c1b804a9..4f604934da7c 100644
>> --- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> +++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> @@ -238,6 +238,21 @@ static struct cpu_spec cpu_specs[] __initdata = {
>>   		.machine_check_early	= __machine_check_early_realmode_p8,
>>   		.platform		= "power8",
>>   	},
>> +	{	/* 2.07-compliant processor, HeXin C2000 processor */
>> +		.pvr_mask		= 0xffffffff,
>> +		.pvr_value		= 0x00660000,
>> +		.cpu_name		= "POWER8 (architected)",
>   
> Using "(architected)" here is not right. That's reserved for the
> 0x0f00000x range of PVRs.
>
> You should use "POWER8 (raw)", or you could actually use the marketing
> name there if you want to, eg. "HeXin C2000" or whatever.
I will update this asap.
> cheers
>

