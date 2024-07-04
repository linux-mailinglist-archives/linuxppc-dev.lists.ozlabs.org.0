Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D628927D5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 20:55:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pr4IL2r7;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xOLsMFvL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFQnX5vMnz3fQb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 04:55:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pr4IL2r7;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xOLsMFvL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.81; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFQmq30wtz3dDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 04:54:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720119248; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Mc3stmrwc7ESbeLm9P4wa4lqI1JK1TgJLetRde4RCCKGaBgLN0fNz0PFR3vlVyzhH+
    bdynQ6h1o6peu5YWLh5FKbadmN61rXksjIuDaKQnGLs41X5CbZRuBdcNj9KTkZIbdwuT
    D5iropfjGOCLEqmmY5DnYd7nnqYJUYNqau1a+rkDgULH753bA1YUKl0r+z167gnskLOD
    Fkc1+qkboWcRJmWclAloGWwOdwqwTZyjeIiofvXpXMC6QnPqjVUAoNXxdY691MuwPTX1
    +EkIili3qDaIPz3i7WsEC1lIlZrQfn/RS8M5OWobYcCm0jwcYIm/WI3yWuW+AeJvgfk+
    1ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720119248;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=apTDHF46wlKCwkzD7joD6xmv+z0R4Z2m/26qnRUS808=;
    b=EpN/XM31U3/fqJJppaIY2ljQ8JDFvChPox/QxxrtaCNygzfvEDgbGvyuiWnDxTrq8R
    DmyP1SVVwT4c4XNjMJgnT/x+zSkNfPeGnZhgwdtxI82CNZCLWGI8BtsvDmosS2yad1C6
    mg8MduTl8EHopSimDZOsg81XYYBD84JAei5TGtLa8756fwS8JQCxusjDqH6+9fa1Bre3
    F1/Tb8FbwN/WJAFOJdcJ+NVBm8oYNgEE60rP9l2TuKi9kzGFJJ9cxcjyEDrtiBS/+50/
    HelHQ3fzmp9ukG+XOW4q3VusVCxudNlhpzfq1xjAhS3w4qN/AHIL/dlX75j5Zq09nTTY
    Hw2A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720119248;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=apTDHF46wlKCwkzD7joD6xmv+z0R4Z2m/26qnRUS808=;
    b=pr4IL2r70nT8nSo8PciLwb9V135tbNHG4OiTDxHMh0OIwlv9RMMJKjcgZY/r0LJy6B
    of5wWpKSlL8kLIPqTOPLS8U6vVmts4V74IUnSpXwJbZR6/Pc811+EXBdWkRRWBHud0Cs
    wro1AR1GU/2nGEuU3NiDnFOmQcBpnm5SrAd7e+tHRKrnLPugqiaurx/g7jxDuaqJQxKT
    9nTIBP+qnpZ92vE+hGWgXmi5q23BYjBKk16R4K+hkfr90/Ll4PQNFcc2szUXmXdD3xIH
    G0oQmFWzdrI418ZwjjMBVZXdvky8+qzKMJ3SgQXRd5EETRqwmXlD9kG2mdaWr/o5LP8B
    x7VQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720119248;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=apTDHF46wlKCwkzD7joD6xmv+z0R4Z2m/26qnRUS808=;
    b=xOLsMFvLt329BiX+R1cOs7xrsvzYlgnMKSFQj7dKC3jAL1jrgpW+OA49yjRxF4WTVY
    2xBcV9hEimqrLEd7RuDQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwnbXz/kFsuSUCat82PJROdEuWUwpcR8HY5"
Received: from [IPV6:2a01:599:806:6955:6d1:546c:8e64:4d8]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389064Is7UAd
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 4 Jul 2024 20:54:07 +0200 (CEST)
Message-ID: <3c045b0e-70da-48af-9196-2f4225477a32@xenosoft.de>
Date: Thu, 4 Jul 2024 20:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
 <86ed894l48.wl-maz@kernel.org>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <86ed894l48.wl-maz@kernel.org>
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

On 04.07.24 10:28, Marc Zyngier wrote:
> On Thu, 04 Jul 2024 05:10:46 +0100,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 02.07.24 18:54, Marc Zyngier wrote:
>>> On Sun, 30 Jun 2024 11:21:55 +0100,
>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>> Hello,
>>>>
>>>> There is an issue with the identification of ATA drives with our
>>>> P.A. Semi Nemo boards [1] after the
>>>> commit "of/irq: Factor out parsing of interrupt-map parent
>>>> phandle+args from of_irq_parse_raw()" [2].
>>> [snip]
>>>
>>> My earlier request for valuable debug information still stands. But
>>> while you're at it, can you please give the following hack a go?
>>>
>>> 	M.
>>>
>>> --- a/drivers/of/irq.c
>>> +++ b/drivers/of/irq.c
>>> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>>>      			oldimap = imap;
>>>    			imap = of_irq_parse_imap_parent(oldimap, imaplen, out_irq);
>>> -			if (!imap)
>>> -				goto fail;
>>> +			if (!imap) {
>>> +				match = 0;
>>> +				break;
>>> +			}
>>>      			match &= of_device_is_available(out_irq->np);
>>>    			if (match)
>>>
>>> This may not be the final workaround even if it solves your boot
>>> problem, but will at least give us a hint at what is going wrong.
>>>
>>> I have the fuzzy feeling that we may be able to lob this broken system
>>> as part of the of_irq_imap_abusers[] array, which would solve things
>>> pretty "neatly".
>>>
>>> 	M.
>>>
>> We tested this patch yesterday and it solves the boot problem.
> How about the other patch[1], which would be far preferable?
>
> 	M.
>
> [1] https://lore.kernel.org/all/86ed8ba2sp.wl-maz@kernel.org
>
Marc,

We will test the patch as soon as possible.

Christian
