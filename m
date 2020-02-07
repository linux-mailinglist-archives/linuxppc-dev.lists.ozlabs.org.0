Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 337711558BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:46:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Dc6M2kkKzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 00:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fVoyEgNH; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Dc4D4m6pzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 00:44:58 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id w21so1149895pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2020 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TmoRmsENHw/YgWCwWFkHSM2l2USy9CK+G0NuOZCqp44=;
 b=fVoyEgNH50TPz5iNwBF4sRHBoHE1P/Fw7CCX0Sp3ZONdUEmOoHEaiOLGk2/cytkHxU
 Z7Rwa5fJvZPUm8K2/YpZM2+H+zzM6YtEWjUZEZjNO7U+FuZylBqVF4nSajmiU65nkNwx
 K37RVgHdVvMxZcJOw2l1zweoGQL30NyhBzYHIDB95zytrKB80NDB47b8+2EYS5H3Gk7X
 YkxVdPmS/QfGvUZ6TWSBEy+suT1cJlsZF0rEVQ9us5OdBrfJUCB/t/0mRxfDtpTr/ANm
 Z/ZA2DCLgP6CiRQuVKWIp2hnxLHZlGorBLBB2eQ0QEgB4n00BIjT3UhzrRb+Vz2PDfTr
 My/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TmoRmsENHw/YgWCwWFkHSM2l2USy9CK+G0NuOZCqp44=;
 b=Z4QLSupOoI/NMEkksFaWu17o933ilSOwZ6bGLhyNBIImDNWRU1Kd3HlDIfqpMSZkgG
 8ktMrPa9arORiPvhCFk3i44Mhugmp8JfH5y1CXsv9FhE7ssQJeJd2Yhur6SfVoVq/Ph7
 RbwfSzOBL0t66kEZrIYyGKTE8HbKnrWLwOnsk4WUDOqqzJNxbxS7Wo3HwOzgc4kPZy3W
 grH9BccrQrEPSxhMFdpfnhjHHrhiUz0XwhsQOeKIQb3Y/925ntiDj9OCyNyVUEj48vpw
 3c4XTLJB5YD4MMCkXDIStHSZCXEHHIUZ3QZKkkjalVuRwr+jMjTqT6kJG2nBwmjbdc4z
 XdMg==
X-Gm-Message-State: APjAAAW4dyDuKxRbjoVJiee0YJrLWx0sU7BON8zVMmkBJcTjj3lCJIQf
 PH7Vlz+z5VzcgnoShA4xHyQ=
X-Google-Smtp-Source: APXvYqzLIjVfPMlPuGmcyhC+sTDXsk/8JGDtyYCCRAsN9lqcd65jI1rVjkgVAQAgkzbMz6DWgiLl5A==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr9887692pfo.145.1581083094993; 
 Fri, 07 Feb 2020 05:44:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z16sm3155140pff.125.2020.02.07.05.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 05:44:53 -0800 (PST)
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
 <20200206203146.GA23248@roeck-us.net>
 <c6285f2a-f8f5-0d97-2d80-061da1f1a7fc@c-s.fr>
 <0f866131-4292-a66b-2637-c34139277486@c-s.fr>
 <551bad84-3e80-265b-93ab-25eae4aa9807@roeck-us.net>
 <29bd8702-9b8f-6931-2bbc-db7e444907d5@c-s.fr>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d6158967-fde3-1a87-44b6-07638bd2b5b0@roeck-us.net>
Date: Fri, 7 Feb 2020 05:44:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <29bd8702-9b8f-6931-2bbc-db7e444907d5@c-s.fr>
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

On 2/7/20 5:29 AM, Christophe Leroy wrote:
> 
> 
> On 02/07/2020 01:08 PM, Guenter Roeck wrote:
>> On 2/7/20 12:28 AM, Christophe Leroy wrote:
>>>
>>>
>>> On 02/07/2020 06:13 AM, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 06/02/2020 à 21:31, Guenter Roeck a écrit :
>>>>> On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
>>>>>> A few changes to retrieve DAR and DSISR from struct regs
>>>>>> instead of retrieving them directly, as they may have
>>>>>> changed due to a TLB miss.
>>>>>>
>>>>>> Also modifies hash_page() and friends to work with virtual
>>>>>> data addresses instead of physical ones. Same on load_up_fpu()
>>>>>> and load_up_altivec().
>>>>>>
>>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>>>
>>>>> This patch results in qemu boot failures (mac99 with pmac32_defconfig).
>>>>> Images fail silently; there is no console output. Reverting the patch
>>>>> fixes the problem. Bisect log is attached below.
>>>>>
>>>>> Assuming this was tested on real hardware, am I correct to assume that qemu
>>>>> for ppc32 (more specifically, qemu's mac99 and g3beige machines) no longer
>>>>> works with the upstream kernel ?
>>>>
>>>> Before submitting the series, I successfully tested:
>>>> - Real HW with powerpc 8xx
>>>> - Real HW with powerpc 832x
>>>> - Qemu's mac99
>>>>
>>>> I'll re-check the upstream kernel.
>>>>
>>>
>>> This is still working for me with the upstream kernel:
>>>
>>
>> Interesting. What is your kernel configuration, your qemu version, and
>> your qemu command line ?
> 
> Config is pmac32_defconfig + CONFIG_DEVTMPFS (But kernel also boots without CONFIG_DEVTMPFS)
> 
> QEMU emulator version 2.11.2
> 
> qemu-system-ppc -kernel vmlinux -M mac99 -initrd rootfs.cpio.gz -s -m 1024
> 
> Works with both GCC 5.5 and GCC 8.1
> 
Actually, the problem is that I have locking selftest options enabled
in my tests. Everything works if I disable those. The "culprit" seems
to be CONFIG_PROVE_LOCKING. Can you retest with CONFIG_PROVE_LOCKING=y ?

Thanks,
Guenter

