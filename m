Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C936679FD38
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 09:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmTTl5gfbz3dRZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 17:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmTTB35HHz3dGp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 17:28:40 +1000 (AEST)
X-QQ-mid: bizesmtp79t1694676492t0544ov9
Received: from [192.168.70.112] ( [125.75.40.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 15:28:09 +0800 (CST)
X-QQ-SSF: 00200000000000907000000A0000000
X-QQ-FEAT: 3M0okmaRx3jQ9noJY66yaYJvkJXFnbgsdEZI1asK0MlB7FwsNXfv04+JHxl9F
	qs0x4AFc0pXcGQX2RaRC9LGWOjQVSd+u1WcU1GzlPWguyVZVaKtagorRMSFcrbcx1rjJmEQ
	38OzNXD4kXw1FAjkRhdjoJprmXw+v+HAY6BeQJOiP9rGf9crweakAwxw+on3mlIjPsuvZ/W
	IBq564arAmfC5Ch4sIrlfFbeRUBR1E7ZYFAulX7JmcdVvtvx00oEtDO+caDA5+0k04AbZMs
	t3F+UQEdG/20aJ91U2Vi+cm8w1wEzkwSAR6NOM2pgiBybRUBXVyURu9Yo/brhEbr4CKmYv9
	AjizP0Jl5Jk8KAbl2Ikly7GRHIc/+SZXrlei+Yr
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1315330674948568726
Message-ID: <CC0BEFC206BD350A+3248d7e5-8b0d-4d7e-a008-49ddaf8351ff@tinylab.org>
Date: Thu, 14 Sep 2023 15:28:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
Content-Language: en-GB
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, tglx@linutronix.de,
 mingo@redhat.com, tsbogend@alpha.franken.de, hdegoede@redhat.com
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
 <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
 <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
 <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
From: Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/4/2023 6:51 PM, Philippe Mathieu-Daudé wrote:
> On 4/9/23 11:24, Yuan Tan wrote:
>> Hi,
>>
>> On 9/4/2023 3:40 PM, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> On 1/9/23 04:42, Yuan Tan wrote:
>>>> MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
>>>> POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET is 
>>>> set
>>>> for convenience.
>>>>
>>>> Suggested-by: Zhangjin Wu <falcon@tinylab.org>
>>>> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
>>>> ---
>>>>   arch/mips/Kconfig | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>>> index bc8421859006..13bacbd05125 100644
>>>> --- a/arch/mips/Kconfig
>>>> +++ b/arch/mips/Kconfig
>>>> @@ -547,6 +547,9 @@ config MIPS_MALTA
>>>>       select MIPS_L1_CACHE_SHIFT_6
>>>>       select MIPS_MSC
>>>>       select PCI_GT64XXX_PCI0
>>>> +    select PCI if POWER_RESET
>>>> +    select PCI_QUIRKS if POWER_RESET
>>>> +    select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
>>>>       select SMP_UP if SMP
>>>>       select SWAP_IO_SPACE
>>>>       select SYS_HAS_CPU_MIPS32_R1
>>>
>>> Shouldn't we also update the _defconfig files?
>>>
>> Sorry, in my last email, I forgot to reply to all. So I am now 
>> resending this email.
>>
>> In malta_defconfig, PCI and POWER_RESET_PIIX4_POWEROFF have already 
>> been set and PCI_QUIRKS is also selected by FSL_PCI [=n].
>>
>> So shutdown and reboot with malta_defconfig is working and there is 
>> no need to update the malta_defconfig 🙂
>
> Since the dependency is now enforced by Kconfig, the defconfig can
> be simplified:
>
> --- a/arch/mips/configs/malta_defconfig
> +++ b/arch/mips/configs/malta_defconfig
> @@ -306,3 +306,2 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_POWER_RESET=y
> -CONFIG_POWER_RESET_PIIX4_POWEROFF=y
>  CONFIG_POWER_RESET_SYSCON=y
>
> But maybe we don't care, I don't know.
After testing, I found that "savedefconfig" will automatically generate 
the simplified configuration.

As I have to use "savedefconfig" on the latest branch of the three 
architectures, in v3, I will send a separate patch for each architecture.

Thanks to your advice.


