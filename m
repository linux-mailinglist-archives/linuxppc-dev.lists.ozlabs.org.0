Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6ED76DF7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 06:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGbv840Jhz3cQx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 14:48:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Thu, 03 Aug 2023 14:47:38 AEST
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGbtf5Y3Gz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 14:47:38 +1000 (AEST)
X-QQ-mid: bizesmtp71t1691037685tpxaqjs6
Received: from [192.168.2.11] ( [116.30.131.233])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Aug 2023 12:41:24 +0800 (CST)
X-QQ-SSF: 00200000000000904000000A0000000
X-QQ-FEAT: uSN+FHkLExbDiJTi143NrDb+JoCVhp+kkT70Y8vCNNWvRQRLSdThgIfID1eaO
	H667Uvy/u+Z89sv8YYl7it6N3hSoAoARRqFywMhchPN0PT0IxYpdOd9ODwkFwZKbJjk/TRm
	yz8yqD7o19abFNNgXGNQ3uukvzxXtbNMsQ7tM/7cnMCZ1gjJNcKxao+GJsY5V4IISXMWktD
	KyEoe+aloCRUV8IWNdUoYMz6nGCwBZM5XfEceE3BUFWMnPjuldvgq0D3zEQzQm6uNLhxMtm
	/r8lsMQ++5tBNarnmOdiOomtYNJ5Hf4EI+cH1VhfjOAuYmhMsaIMXfy9izYx2iNqe6vxJGW
	XWNDtWuCFytdbKBELMBBFhEM02MhMiGbVghGKC2i+vs3rLXgXw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9874323047209275138
Message-ID: <4CC3DEEB40C0DEC3+d4d7dfc3-0e9b-9185-d72a-419b36fc1f53@tinylab.org>
Date: Thu, 3 Aug 2023 12:41:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: pmac32: enable serial options by default in
 defconfig
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
 <88334e42-a3c2-dab5-fdcb-91305d672e5b@csgroup.eu>
From: Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <88334e42-a3c2-dab5-fdcb-91305d672e5b@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe

On 8/2/2023 9:58 PM, Christophe Leroy wrote:
>
> Le 02/08/2023 à 15:41, Yuan Tan a écrit :
>> [Vous ne recevez pas souvent de courriers de tanyuan@tinylab.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Serial is a critical feature for logging and debuging, and the other
>> architectures enable serial by default.
>>
>> Let's enable CONFIG_SERIAL_PMACZILOG and CONFIG_SERIAL_PMACZILOG_CONSOLE
>> by default.
>>
>> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Can this patch be merged into v6.6? There's another patch depends on it :)

Best regards,

Yuan Tan

>> ---
>>    arch/powerpc/configs/pmac32_defconfig | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
>> index 019163c2571e..3aae79afb9d9 100644
>> --- a/arch/powerpc/configs/pmac32_defconfig
>> +++ b/arch/powerpc/configs/pmac32_defconfig
>> @@ -176,8 +176,9 @@ CONFIG_MOUSE_APPLETOUCH=y
>>    # CONFIG_SERIO_I8042 is not set
>>    # CONFIG_SERIO_SERPORT is not set
>>    CONFIG_SERIAL_8250=m
>> -CONFIG_SERIAL_PMACZILOG=m
>> +CONFIG_SERIAL_PMACZILOG=y
>>    CONFIG_SERIAL_PMACZILOG_TTYS=y
>> +CONFIG_SERIAL_PMACZILOG_CONSOLE=y
>>    CONFIG_NVRAM=y
>>    CONFIG_I2C_CHARDEV=m
>>    CONFIG_APM_POWER=y
>> --
>> 2.34.1
>>
