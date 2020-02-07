Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465A15587B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:32:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DbnL5y5GzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 00:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ei80iH28; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Dbkr2n2jzDqfJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 00:29:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Dbkg1LJRz9txlx;
 Fri,  7 Feb 2020 14:29:47 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ei80iH28; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SjZWL34uWUg5; Fri,  7 Feb 2020 14:29:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Dbkg0JLNz9txlt;
 Fri,  7 Feb 2020 14:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581082187; bh=WbZrvX4J1zwsnajph8mEdej0+7vLwHvW5V7OoOSyTGs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ei80iH28Rp9bYh5yniuUuYYGRb7vwwcIxdrjLt7tPc3BOIg8tWkO8VuQTLNfrulXQ
 wXTWBiLslT4ohfpYAwjF/04oOmaf/jUfDrfkF7BQZKcBqOwkgiQQVF2gI69nTV5kAN
 isw0v5LpFHoPgvR63W02abrm7cW/IxezSM7pHdjA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A2258B8D3;
 Fri,  7 Feb 2020 14:29:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tFzuyeO9Yoiq; Fri,  7 Feb 2020 14:29:48 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 549388B8BA;
 Fri,  7 Feb 2020 14:29:48 +0100 (CET)
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
To: Guenter Roeck <linux@roeck-us.net>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
 <20200206203146.GA23248@roeck-us.net>
 <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
 <0f866131-4292-a66b-2637-c34139277486@c-s.fr>
 <551bad84-3e80-265b-93ab-25eae4aa9807@roeck-us.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <29bd8702-9b8f-6931-2bbc-db7e444907d5@c-s.fr>
Date: Fri, 7 Feb 2020 13:29:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <551bad84-3e80-265b-93ab-25eae4aa9807@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/07/2020 01:08 PM, Guenter Roeck wrote:
> On 2/7/20 12:28 AM, Christophe Leroy wrote:
>>
>>
>> On 02/07/2020 06:13 AM, Christophe Leroy wrote:
>>>
>>>
>>> Le 06/02/2020 à 21:31, Guenter Roeck a écrit :
>>>> On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
>>>>> A few changes to retrieve DAR and DSISR from struct regs
>>>>> instead of retrieving them directly, as they may have
>>>>> changed due to a TLB miss.
>>>>>
>>>>> Also modifies hash_page() and friends to work with virtual
>>>>> data addresses instead of physical ones. Same on load_up_fpu()
>>>>> and load_up_altivec().
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>>
>>>> This patch results in qemu boot failures (mac99 with pmac32_defconfig).
>>>> Images fail silently; there is no console output. Reverting the patch
>>>> fixes the problem. Bisect log is attached below.
>>>>
>>>> Assuming this was tested on real hardware, am I correct to assume 
>>>> that qemu
>>>> for ppc32 (more specifically, qemu's mac99 and g3beige machines) no 
>>>> longer
>>>> works with the upstream kernel ?
>>>
>>> Before submitting the series, I successfully tested:
>>> - Real HW with powerpc 8xx
>>> - Real HW with powerpc 832x
>>> - Qemu's mac99
>>>
>>> I'll re-check the upstream kernel.
>>>
>>
>> This is still working for me with the upstream kernel:
>>
> 
> Interesting. What is your kernel configuration, your qemu version, and
> your qemu command line ?

Config is pmac32_defconfig + CONFIG_DEVTMPFS (But kernel also boots 
without CONFIG_DEVTMPFS)

QEMU emulator version 2.11.2

qemu-system-ppc -kernel vmlinux -M mac99 -initrd rootfs.cpio.gz -s -m 1024

Works with both GCC 5.5 and GCC 8.1

Christophe
