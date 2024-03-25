Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91C8892F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 08:17:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WDuEF1IW;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=W25ZVRYK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V344n1TK8z3cM4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WDuEF1IW;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=W25ZVRYK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V343z46QGz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 18:16:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711350937; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MqsyFCBrWQsRqwfb+pA1AoqftD5s4/TN+wnfN7qu04E0mwZrboeaVYfJ5Pbd+BkE/v
    m2NCbdpfTlsC8euejDkYdgWbu/fpW/V71uIEJbkh4611rxYAggLf+xXQs3wB4rxvjYwx
    2GpspNOYELCbDi3FYHi/6aJpH58NC2pyRCo0MYtdgxCWOvSrSqVs/kW8/vbn+AwIz6Bx
    EVFIeCE+nTNVEDGvSz9rqtB94ENejP3DWICFCUczdJYxBbWAk3HTDgDi2nXYVBbclTum
    aRH9eSBEIOk7NxXVLnrKHRwGNYhr6uEMK9DvsgjHmjzFC7HMmq9lZfCOhWmp49/1ZcPz
    pAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711350937;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tKArQSzXZ2Cwwd1w922uoZ30+R9oVyIu4poxcjf8Wf0=;
    b=sEF/v1FjVHaY2KMwTNCp36ylq9+9CrCGx5SNh/LdeNZq3+vxUmbk5AhMXwkhs9dslj
    bkbvnw8mioHRrpz3XHAP7bBFNB7aIUHDWBPVua4nVLHv+lRD7btvoSeop9wx/A+efQ/G
    eihcLEJ/5mRyKx5ZXpXT3MGWspyyCVM2u4N0BQfUXgpr3AuHA3IBAhgbDxAR4PRrHZQo
    pHwSUDGktQwaUx0z8iG/L5IvQoukKO3FBYVjgAMQIQI11s44Wg9o5nUu8B+g3WxA/cnP
    Cjn5AXvPBObjvEN3/VzhXkM8jrDObpUmGUNSGq4zXMMUyFtXeYyahpyxfnD6q+GlPEGt
    7OJA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1711350937;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tKArQSzXZ2Cwwd1w922uoZ30+R9oVyIu4poxcjf8Wf0=;
    b=WDuEF1IWk/OJmQvQ2qEquP2KeCmapDLXCCqfopywZFFUwVJFDflvvhRDQNwapZezGW
    p4I9O+fvBCSz+y5ksJFR88QwuKyTOXPaq0VYJWQziXtl++1IGh5QhgwiYtmW2DPNIzXe
    SQEYo9/VF2/y+v/kpS2WQoaPy2EjMiycYqUyCVhTAmGmBm6Dzv+Afaori/lcxAQdsjEh
    AR3v3XTNKF1c3dd0cvj6v9UM5abrJZ9rTPE27u4m356rby6AfaGPx3eQqBfYi9SYrF8Z
    2XBPZLIv8i/2OdScO59sEYhIrJO+hDnf31hPU0ZfkQ6hQB49aUS6jIVCU1ps1EhsCXaw
    Z0HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1711350937;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tKArQSzXZ2Cwwd1w922uoZ30+R9oVyIu4poxcjf8Wf0=;
    b=W25ZVRYKoQo6W7MIIASmCwaBNwcUnrRVu74BdIoWfNgXP5exsLtYcCIqfFeXw4O45w
    bwEENur7GK2A3EY6woBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1xkHd0jCgCs4udHdhJKmTWY2xslQ=="
Received: from [IPV6:2a02:8109:8984:5d00:299c:b5cd:1d87:5681]
    by smtp.strato.de (RZmta 50.3.2 AUTH)
    with ESMTPSA id eaf61b02P7FZ4a5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 25 Mar 2024 08:15:35 +0100 (CET)
Message-ID: <1486b4f1-cb55-48c8-b492-ddbec495eef3@xenosoft.de>
Date: Mon, 25 Mar 2024 08:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [FSL P50x0] Kernel 6.9-rc1 compiling issue
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>
References: <fa247ae4-5825-4dbe-a737-d93b7ab4d4b9@xenosoft.de>
 <761e7864-4655-4b58-b0ad-60d716c5f321@xenosoft.de>
 <5c232ad9-c4d5-49fa-8434-fc5034b6c5da@csgroup.eu>
Content-Language: en-GB
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <5c232ad9-c4d5-49fa-8434-fc5034b6c5da@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks a lot for the hint.

Could you please add #include <asm/kexec.h> to 
arch/powerpc/platforms/85xx/smp.c for the next PowerPC fixes?

Christian


On 25 March 2024 at 07:43 am, Christophe Leroy wrote:
> Hi,
>
> Le 25/03/2024 à 06:18, Christian Zigotzky a écrit :
>> I have created a patch:
>>
>> --- a/arch/powerpc/platforms/85xx/smp.c 2024-03-25 06:14:02.201209476 +0100
>> +++ b/arch/powerpc/platforms/85xx/smp.c 2024-03-25 06:10:04.421425931 +0100
>> @@ -393,6 +393,7 @@ static void mpc85xx_smp_kexec_cpu_down(i
>>           int disable_threadbit = 0;
>>           long start = mftb();
>>           long now;
>> +       int crashing_cpu = -1;
> crashing_cpu is a global variable defined in
> arch/powerpc/kernel/setup-common.c and declared in
> arch/powerpc/include/asm/kexec.h
>
> So you can't redefine crashing_cpu as a local stub.
>
> All you need to do is to add #include <asm/kexec.h> just like
> arch/powerpc/platforms/powernv/smp.c I guess.
>
> Christophe
>
>
>
>>           local_irq_disable();
>>           hard_irq_disable();
>>
>> ---
>>
>> -- Christian
>>
>>
>> On 25 March 2024 at 05:48 am, Christian Zigotzky wrote:
>>> Hi All,
>>>
>>> Compiling of the RC1 of kernel 6.9 doesn’t work anymore for our FSL
>>> P5020/P5040 boards [1] since the PowerPC updates 6.9-2 [2].
>>>
>>> Error messages:
>>>
>>> arch/powerpc/platforms/85xx/smp.c: In function
>>> 'mpc85xx_smp_kexec_cpu_down':
>>> arch/powerpc/platforms/85xx/smp.c:401:13: error: 'crashing_cpu'
>>> undeclared (first use in this function); did you mean 'crash_save_cpu'?
>>>    401 |  if (cpu == crashing_cpu && cpu_thread_in_core(cpu) != 0) {
>>>        |             ^~~~~~~~~~~~
>>>        |             crash_save_cpu
>>> arch/powerpc/platforms/85xx/smp.c:401:13: note: each undeclared
>>> identifier is reported only once for each function it appears in
>>> make[5]: *** [scripts/Makefile.build:244:
>>> arch/powerpc/platforms/85xx/smp.o] Error 1
>>> make[4]: *** [scripts/Makefile.build:485: arch/powerpc/platforms/85xx]
>>> Error 2
>>> make[3]: *** [scripts/Makefile.build:485: arch/powerpc/platforms] Error 2
>>> make[2]: *** [scripts/Makefile.build:485: arch/powerpc] Error 2
>>>
>>> ---
>>>
>>> I was able to revert it. After that the compiling works again.
>>>
>>> Could you please check the PowerPC updates 6.9-2? [2]
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1] http://wiki.amiga.org/index.php?title=X5000
>>> [2]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.9-rc1&id=484193fecd2b6349a6fd1554d306aec646ae1a6a

