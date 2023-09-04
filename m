Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DA791C15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 19:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfbXr06tQz3btq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 03:41:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfbXH45q9z303l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 03:40:49 +1000 (AEST)
X-QQ-mid: bizesmtpipv601t1693849204tj3l
Received: from [IPV6:2001:da8:c000:3005:b045:d ( [255.215.175.9])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Sep 2023 01:40:02 +0800 (CST)
X-QQ-SSF: 00200000000000907000000A0000000
X-QQ-FEAT: DQ0OCu3gog332B5EbRVImgzcowyQN9LD7dD52UAWS8C7Inf9cu8kOhxm7cdHS
	WXKoJqe+YyRmEKKYZw4GYzjLNTv98IPNpEEtuxgXBVdcV744/Js4rYxrhcT1XOOwTR8mDkr
	nxs0jzm7vT9hk6iBsfEH8SnIcpKqlIY0ysKUFlO/O5QGfdUcL8Eyjm2COKmJsDFJsd/QO70
	9HgobAmEohizPYZQ3AeIEjdJqDuwAXOQJh58rcTCI2oZyJu19olr6xFZfJJBKUQN4/hONS+
	gl3gvsrDaPX7wDWcHs2O7I7cQvoaZFGlziCE8rQ4cXeTxIrHcGKzVSsAtBrW+2gW8vnBevS
	d6+Z5SONIIPWgb4diE=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11219486753922426849
Message-ID: <8464A5F00EFC8C59+502c989a-3814-4686-8c6f-0a8f814e1c39@tinylab.org>
Date: Tue, 5 Sep 2023 01:40:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kconfig: add dependencies of POWER_RESET for mips
 malta
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <1c17f017d6c837ef887d08bd2f85102df3fbc17c.1693535514.git.tanyuan@tinylab.org>
 <915a9e2d-36ea-4a74-7b1b-9688f215b6f1@linaro.org>
 <55C9BDEDAB4E0B76+838dbd4f-425d-4f2e-94ee-f2bc3092ae13@tinylab.org>
 <c001c34b-e20c-f32e-f247-722d34a8db3d@linaro.org>
 <54da2376-dc65-0a96-55df-7a5acfbb9bff@csgroup.eu>
Content-Language: en-GB
From: Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <54da2376-dc65-0a96-55df-7a5acfbb9bff@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>, "falcon@tinylab.org" <falcon@tinylab.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "w@1wt.eu" <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/4/2023 6:58 PM, Christophe Leroy wrote:
>
> Le 04/09/2023 à 12:51, Philippe Mathieu-Daudé a écrit :
>> On 4/9/23 11:24, Yuan Tan wrote:
>>> Hi,
>>>
>>> On 9/4/2023 3:40 PM, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> On 1/9/23 04:42, Yuan Tan wrote:
>>>>> MIPS Malta's power off depends on PCI, PCI_QUIRKS, and
>>>>> POWER_RESET_PIIX4_POWEROFF to work. Enable them when POWER_RESET is set
>>>>> for convenience.
>>>>>
>>>>> Suggested-by: Zhangjin Wu <falcon@tinylab.org>
>>>>> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
>>>>> ---
>>>>>    arch/mips/Kconfig | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>>>> index bc8421859006..13bacbd05125 100644
>>>>> --- a/arch/mips/Kconfig
>>>>> +++ b/arch/mips/Kconfig
>>>>> @@ -547,6 +547,9 @@ config MIPS_MALTA
>>>>>        select MIPS_L1_CACHE_SHIFT_6
>>>>>        select MIPS_MSC
>>>>>        select PCI_GT64XXX_PCI0
>>>>> +    select PCI if POWER_RESET
>>>>> +    select PCI_QUIRKS if POWER_RESET
>>>>> +    select POWER_RESET_PIIX4_POWEROFF if POWER_RESET
>>>>>        select SMP_UP if SMP
>>>>>        select SWAP_IO_SPACE
>>>>>        select SYS_HAS_CPU_MIPS32_R1
>>>> Shouldn't we also update the _defconfig files?
>>>>
>>> Sorry, in my last email, I forgot to reply to all. So I am now
>>> resending this email.
>>>
>>> In malta_defconfig, PCI and POWER_RESET_PIIX4_POWEROFF have already
>>> been set and PCI_QUIRKS is also selected by FSL_PCI [=n].
>>>
>>> So shutdown and reboot with malta_defconfig is working and there is no
>>> need to update the malta_defconfig 🙂
>> Since the dependency is now enforced by Kconfig, the defconfig can
>> be simplified:
>>
>> --- a/arch/mips/configs/malta_defconfig
>> +++ b/arch/mips/configs/malta_defconfig
>> @@ -306,3 +306,2 @@ CONFIG_SERIAL_8250_CONSOLE=y
>>    CONFIG_POWER_RESET=y
>> -CONFIG_POWER_RESET_PIIX4_POWEROFF=y
>>    CONFIG_POWER_RESET_SYSCON=y
>>
>> But maybe we don't care, I don't know.
> I understand from what you say that you update malta_defconfig manually ?
>
> defconfigs shouldn't be updated manually.
>
> Once you have the new .config you should use "make savedefconfig" then
> replace your file by the newly generated defconfig file.
>
> Christophe

To do so, I just unset CONFIG_POWER_RESET and set it again in 
menuconfig, then "make savedefconfig". The POWER_RESET part is simplified.

  CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_PIIX4_POWEROFF=y
-CONFIG_POWER_RESET_SYSCON=y

  However, I found that there's other changes in this new 
malta_defconfig, for example

CONFIG_NLS_KOI8_U=m CONFIG_CRYPTO_CRYPTD=m -CONFIG_CRYPTO_LRW=m 
-CONFIG_CRYPTO_PCBC=m -CONFIG_CRYPTO_HMAC=y -CONFIG_CRYPTO_XCBC=m 
-CONFIG_CRYPTO_MD4=m -CONFIG_CRYPTO_SHA512=m -CONFIG_CRYPTO_WP512=m 
-CONFIG_CRYPTO_ANUBIS=m CONFIG_CRYPTO_BLOWFISH=m CONFIG_CRYPTO_CAMELLIA=m

Should I import all these changes in a commit? Or only POWER_RESET part.

