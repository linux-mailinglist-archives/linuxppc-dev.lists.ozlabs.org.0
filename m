Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99438927CFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 20:28:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=l5Si8M9U;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=qBMcCXzG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFQBl2hJ6z3fT1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 04:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=l5Si8M9U;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=qBMcCXzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFQB071Q2z3cZx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 04:27:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720117643; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Fy80Yhj0x290kYEKrd1RQq5Ma4YrsvEuYkpH3LYU9DoorwUkKSLbMWAvJixniXyf5g
    yVC4srGT7gF1k+RLkH9bW3YN6L5wNbkjSEp9fzCOwqTCH4VJtr4otCsKv5epcDFCbOmC
    uI7Ntpymsr6rOrlXg/q0Con21LOV8yaMA1SfenfbFiDHQBX18wmyYDlCgtTdpd8qAoj2
    SMNKyehlaFcgbSy369A+C5icUBoE/w9pPV0QFmNjw7Bi+BeHBxocimWkNImqMF4Wp/pk
    w/GNQKJmEaAPEiorZmrAiAKUinkZrpdp4RqJrpOrNaFPffpX7PUCSxemxIfkGYRCLTR/
    fgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720117643;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=MF0O/2pT9UmMWAClfRsttShUZ9knD0aIZeQYuAUw6dU=;
    b=EHC56Dpn2gs6Skqy1ifHEIIlFMQaQI9TfG1ICcGuahMdnAon0fBmAmSqUe/ogSu9JB
    cElXLbZfbSiWIY6Yyn8W7lS7ojbTf4vx7qjAjbPIFjHMIrI8xHoYwPH7VClf0scPN2UO
    yzaPaqy6YTt25/IjANSsYlsSzcu8QsaOWnQWjU+4lW2MXwH3qTKOWs+vMeg7olTDzdQt
    2pYUo+mjowSdEGnCsKOHvgQw863GszbGGz5G7mpEFfNwLrvzGv2JAMVXORhIdlH1mwm6
    KzYTWoj/xDprxISEgXnqYUiJ9d0khPVrp+llDDh/v3zFTnCHNqqeLX4S0b+b66hs511s
    chMQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720117643;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=MF0O/2pT9UmMWAClfRsttShUZ9knD0aIZeQYuAUw6dU=;
    b=l5Si8M9UJxarFg/qgHvJFHeU7jTArtd5tKBk45N+PGvKPPeTbhOZWRLQ4OB7DCUPfc
    X+80A8ms55gD0Fb41YnWnJl1WN+cz030p5gzUvY2QaH+LqaL1lVTSJYMVw1+g5cGprO/
    4/qYGjuB5RJmWj/l3Dyra/k5LI1T4rCDxzpMhqeRIZQnGyEpjFsVDEdBQSdQI8CkFJa3
    djf5MYuSPZM2HgIQKAD1U6CBeDyfXQCchwWPnCLOYyrLRYwss6b4C6X2qqLLO8Rj/5ZL
    3vAG+lYfPuGayKYv/4phOz3m8H0fc09XNNFfXqR5RqrSLWlOTQJGYeUM65HNA1c+LDMk
    Y/Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720117643;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=MF0O/2pT9UmMWAClfRsttShUZ9knD0aIZeQYuAUw6dU=;
    b=qBMcCXzGHDJUBfTeFFb6gqTp2Nv7XFgLfH/4PCluveo1Sc4a7mTdMpfYKnUq3gXI2E
    eEtys1FZvCwUm2s8XsDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwnbXz/kFsuSUCat82PJROdEuWUwpcR8HY5"
Received: from [IPV6:2a01:599:806:6955:6d1:546c:8e64:4d8]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389064IRLU8S
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 4 Jul 2024 20:27:21 +0200 (CEST)
Message-ID: <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de>
Date: Thu, 4 Jul 2024 20:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Michael Ellerman <mpe@ellerman.id.au>, Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
 <874j95jrur.fsf@mail.lhotse>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <874j95jrur.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04.07.24 13:53, Michael Ellerman wrote:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> On 02.07.24 18:54, Marc Zyngier wrote:
>>> On Sun, 30 Jun 2024 11:21:55 +0100,
>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>> Hello,
>>>>
>>>> There is an issue with the identification of ATA drives with our
>>>> P.A. Semi Nemo boards [1] after the
>>>> commit "of/irq: Factor out parsing of interrupt-map parent
>>>> phandle+args from of_irq_parse_raw()" [2].
> ...
>>> --- a/drivers/of/irq.c
>>> +++ b/drivers/of/irq.c
>>> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>>>    
>>>    			oldimap = imap;
>>>    			imap = of_irq_parse_imap_parent(oldimap, imaplen, out_irq);
>>> -			if (!imap)
>>> -				goto fail;
>>> +			if (!imap) {
>>> +				match = 0;
>>> +				break;
>>> +			}
>>>    
>>>    			match &= of_device_is_available(out_irq->np);
>>>    			if (match)
>>>
>>>
>> We tested this patch yesterday and it solves the boot problem.
> Hi Christian,
>
> Instead of that patch, can you try the one below. AFAICS the device tree
> fixups done in early boot mean the interrupt-map is not needed, and also
> has the wrong content, so if we can remove it entirely that might avoid
> the problems in the parsing code.
>
> I don't know if your firmware actually implements those methods, I
> couldn't find anything online to confirm or deny it. Seems the only
> option is to test it.
>
> cheers
>
>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index fbb68fc28ed3..28fe082ede57 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -3138,6 +3138,14 @@ static void __init fixup_device_tree_pasemi(void)
>   
>   	prom_setprop(iob, name, "interrupt-controller", &val, 0);
>   
> +	prom_printf("nemo: deleting interrupt-map properties\n");
> +	rc = call_prom("interpret", 1, 1,
> +		      " s\" /pxp@0,e0000000\" find-device"
> +		      " s\" interrupt-map\" delete-property"
> +		      " s\" interrupt-map-mask\" delete-property"
> +		      " device-end");
> +	prom_printf("nemo: interpret returned %d\n", rc);
> +
>   	pci_name = "/pxp@0,e0000000/pci@11";
>   	node = call_prom("finddevice", 1, 1, ADDR(pci_name));
>   	parent = ADDR(iob);
Hi Michael,

Many thanks for your patch. We will test it as soon as possible.

Christian
