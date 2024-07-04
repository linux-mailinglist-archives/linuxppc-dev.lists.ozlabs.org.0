Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CECA927D64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 20:59:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mQxfqbiW;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PfbQKpq/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFQtl6vHvz3fSh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 04:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mQxfqbiW;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PfbQKpq/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFQt25Jqvz3dDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 04:59:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720119521; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=R2OKa8uar4LMLdXGcdJNgLtz/M2pzcV12YyN2a99fJazWGNB+oQS8R6X53/jwiqt6D
    lVv8/gjgvzdQMNj0oTdxwOBNN2ZMB4yAMNY38qFBqCZDWvd5AAq50Rdb4PpatJTbIEzg
    AM9emp5n9m/1gEwoMR8xGZIKF2wbv+4FifozK6a/F89nwf09HgmKY0lfDt/PbPsWD1sj
    /cx9ksb2jxL3G+k5jPQ/14tfWfE0pBwjzh2I5WpLnUxOVhEfnC1m63lr2FJct4tGr7Ba
    nwVcD50Hyu2NFIYHcu/4WERxKwHMbylkjiy9SNVXH9CbYQBZSA6P9BUDNdH41nZwnWnU
    l7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720119521;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=BslT/2fg7mlj0cn70yAR1at5reI4vwwa/29bm/p6uqU=;
    b=d9irVQE4EGOQoaZS0oVve+ubnoYzO6XoEvjM0TWxExpKT+zA9rcdu+3X4WLypfNNFQ
    PVZtooFBYMxkiyUGDUtuq/u7Gasjvd6KThOU7eEJx/bHLDIEVWmipHCcHhB65bEwYcQr
    zXSjstrIwWjedcTojYn99cGj/s3tcRoptG7ppkjswScJBoCZtTzY+kUne5qyZgFyOJr1
    OAfvtly6Sj+XrS4dzBb7JWuhcdk6IGCBiA5C8LxMQ2xCVn6lDdBGTBokPhiExH9oab5F
    DLG6mmERKHcQHAbxBdATKlNF5SWS9hk69rC4nwo1wtBmC490zjAmTNacJi3U5sfjVFno
    i3fQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720119521;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=BslT/2fg7mlj0cn70yAR1at5reI4vwwa/29bm/p6uqU=;
    b=mQxfqbiWoPlYiRW5yDXDyjwlMXq8Dbfyfm4b6S7p7ZI0P8Jcwem22SRu2/gUb2xKGK
    0c4iSZQrBDR01yMAYxcBeX8V/AUIC5IoIEMYuXMf5zB8igM3F0qstsxdmxy/HCBUp2K1
    lHW58SJy8JpesvcWl7kT+voYO8+qjRGmxi3IUGLbrbSjBj+Koj9Pat6tX/xdAxGa21aJ
    I0hjPdMyg2dOBjfuESKwyiSnV2iRPPNrWsrZ4oCHfv6hzfcqcCIIWeXXVi+DZKH4qlIT
    al6RcRQ6eLm8ibu6SyaED7boopjXGG2+Wa4FndtLqsYc9fSjQujz9bi7b2vVZPjan8sX
    0y3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720119521;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=BslT/2fg7mlj0cn70yAR1at5reI4vwwa/29bm/p6uqU=;
    b=PfbQKpq/Ofcrmk17ZZrVeSZH5Z6shH5tqBKS3UTGHKt84AXQFfULB5fc+/6+HHkwgL
    ONksLpEDqLwb4qB1QVBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwnbXz/kFsuSUCat82PJROdEuWUwpcR8HY5"
Received: from [IPV6:2a01:599:806:6955:6d1:546c:8e64:4d8]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389064IwfUB2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 4 Jul 2024 20:58:41 +0200 (CEST)
Message-ID: <dfc7ec00-5216-4590-9347-ee10cd1e8380@xenosoft.de>
Date: Thu, 4 Jul 2024 20:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>, Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
 <874j95jrur.fsf@mail.lhotse>
 <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de>
In-Reply-To: <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de>
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.07.24 20:27, Christian Zigotzky wrote:
> On 04.07.24 13:53, Michael Ellerman wrote:
>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>> On 02.07.24 18:54, Marc Zyngier wrote:
>>>> On Sun, 30 Jun 2024 11:21:55 +0100,
>>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>>> Hello,
>>>>>
>>>>> There is an issue with the identification of ATA drives with our
>>>>> P.A. Semi Nemo boards [1] after the
>>>>> commit "of/irq: Factor out parsing of interrupt-map parent
>>>>> phandle+args from of_irq_parse_raw()" [2].
>> ...
>>>> --- a/drivers/of/irq.c
>>>> +++ b/drivers/of/irq.c
>>>> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, 
>>>> struct of_phandle_args *out_irq)
>>>>                   oldimap = imap;
>>>>                imap = of_irq_parse_imap_parent(oldimap, imaplen, 
>>>> out_irq);
>>>> -            if (!imap)
>>>> -                goto fail;
>>>> +            if (!imap) {
>>>> +                match = 0;
>>>> +                break;
>>>> +            }
>>>>                   match &= of_device_is_available(out_irq->np);
>>>>                if (match)
>>>>
>>>>
>>> We tested this patch yesterday and it solves the boot problem.
>> Hi Christian,
>>
>> Instead of that patch, can you try the one below. AFAICS the device tree
>> fixups done in early boot mean the interrupt-map is not needed, and also
>> has the wrong content, so if we can remove it entirely that might avoid
>> the problems in the parsing code.
>>
>> I don't know if your firmware actually implements those methods, I
>> couldn't find anything online to confirm or deny it. Seems the only
>> option is to test it.
>>
>> cheers
>>
>>
>> diff --git a/arch/powerpc/kernel/prom_init.c 
>> b/arch/powerpc/kernel/prom_init.c
>> index fbb68fc28ed3..28fe082ede57 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -3138,6 +3138,14 @@ static void __init fixup_device_tree_pasemi(void)
>>         prom_setprop(iob, name, "interrupt-controller", &val, 0);
>>   +    prom_printf("nemo: deleting interrupt-map properties\n");
>> +    rc = call_prom("interpret", 1, 1,
>> +              " s\" /pxp@0,e0000000\" find-device"
>> +              " s\" interrupt-map\" delete-property"
>> +              " s\" interrupt-map-mask\" delete-property"
>> +              " device-end");
>> +    prom_printf("nemo: interpret returned %d\n", rc);
>> +
>>       pci_name = "/pxp@0,e0000000/pci@11";
>>       node = call_prom("finddevice", 1, 1, ADDR(pci_name));
>>       parent = ADDR(iob);
> Hi Michael,
>
> Many thanks for your patch. We will test it as soon as possible.
>
> Christian
Michael,

Unfortunately, the kernel 6.10-rc6 doesn't compile with your patch. "rc" 
is undeclared.

Error messages:

arch/powerpc/kernel/prom_init.c: In function ‘fixup_device_tree_pasemi’:
arch/powerpc/kernel/prom_init.c:3142:2: error: ‘rc’ undeclared (first 
use in this function); did you mean ‘rq’?
  3142 |  rc = call_prom("interpret", 1, 1,
       |  ^~
       |  rq

Christian
