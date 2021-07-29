Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574643D9FA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 10:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb3hg1VLbz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 18:33:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb3hK6Dnhz2xWT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 18:33:20 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeda3.dynamic.kabel-deutschland.de
 [95.90.237.163])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F412061E5FE02;
 Thu, 29 Jul 2021 10:33:17 +0200 (CEST)
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO to
 generic C implementation.)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
 <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
 <875ywt1s9r.fsf@mpe.ellerman.id.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <99ce2761-ba84-72a3-caaa-5281296fdbc7@molgen.mpg.de>
Date: Thu, 29 Jul 2021 10:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <875ywt1s9r.fsf@mpe.ellerman.id.au>
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
Cc: Derek Parker <parkerderek86@gmail.com>, Dmitrii Okunev <xaionaro@gmail.com>,
 murp@ibm.com, linuxppc-dev@lists.ozlabs.org, laboger@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michael,


Am 29.07.21 um 09:41 schrieb Michael Ellerman:
> Paul Menzel <pmenzel@molgen.mpg.de> writes:

>> Am 28.07.21 um 14:43 schrieb Michael Ellerman:
>>> Paul Menzel <pmenzel@molgen.mpg.de> writes:
>>>> Am 28.07.21 um 01:14 schrieb Benjamin Herrenschmidt:
>>>>> On Tue, 2021-07-27 at 10:45 +0200, Paul Menzel wrote:
>>>>
>>>>>> On ppc64le Go 1.16.2 from Ubuntu 21.04 terminates with a segmentation
>>>>>> fault [1], and it might be related to *[release-branch.go1.16] runtime:
>>>>>> fix crash during VDSO calls on PowerPC* [2], conjecturing that commit
>>>>>> ab037dd87a2f (powerpc/vdso: Switch VDSO to generic C implementation.)
>>>>>> added in Linux 5.11 causes this.
>>>>>>
>>>>>> If this is indeed the case, this would be a regression in userspace. Is
>>>>>> there a generic fix or should the change be reverted?
>>>>>
>>>>>   From the look at the links you posted, this appears to be completely
>>>>> broken assumptions by Go that some registers don't change while calling
>>>>> what essentially are external library functions *while inside those
>>>>> functions* (ie in this case from a signal handler).
>>>>>
>>>>> I suppose it would be possible to build the VDSO with gcc arguments to
>>>>> make it not use r30, but that's just gross...
>>>>
>>>> Thank you for looking into this. No idea, if it falls under Linux’ no
>>>> regression policy or not.
>>>
>>> Reluctantly yes, I think it does. Though it would have been good if it
>>> had been reported to us sooner.
>>>
>>> It looks like that Go fix is only committed to master, and neither of
>>> the latest Go 1.16 or 1.15 releases contain the fix? ie. there's no way
>>> for a user to get a working version of Go other than building master?
>>
>> I heard it is going to be in Go 1.16.7, but I do not know much about Go.
>> Maybe the folks in Cc can chime in.
>>
>>> I'll see if we can work around it in the kernel. Are you able to test a
>>> kernel patch if I send you one?
>>
>> Yes, I could test a Linux kernel patch on ppc64le (POWER 8) running
>> Ubuntu 21.04.
> 
> Thanks, would be great if you can test on your setup. Patch below.
> 
> I haven't been able to reproduce the crash by following the instructions
> in your bug report, I have go1.13.8, I guess the crash is only in newer
> versions?

I only used go version 1.16.2 packaged in Ubuntu 21.04 (1.16~0ubuntu1).

> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 2813e3f98db6..3c5baaa6f1e7 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -27,6 +27,13 @@ KASAN_SANITIZE := n
>   
>   ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>   	-Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
> +
> +# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That used to be true

Probably that needs to be 1.16.7.

> +# by accident when the VDSO was hand-written asm code, but may not be now that the VDSO is
> +# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact on code
> +# generation is minimal, it will just use r29 instead.
> +ccflags-y += $(call cc-option, -ffixed-r30)
> +
>   asflags-y := -D__VDSO64__ -s
>   
>   targets += vdso64.lds

With this applied to Linux, go does not crash with a segmentation fault 
anymore.

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>

(Probably the commit should be tagged for the stable series too.)


Kind regards,

Paul
