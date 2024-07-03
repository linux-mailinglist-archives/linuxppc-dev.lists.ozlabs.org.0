Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB0924F89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 05:28:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZmBgDEjr;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Dc/RA1aj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDQGH3qXkz3cXB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:28:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZmBgDEjr;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Dc/RA1aj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDQFX5dJVz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 13:27:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1719977222; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rpAoQxXRn6t9vOdO0wp4FpxkDyY6ZEl5vrtBSHEeiQSQeAHNZyo0jwFjTB2gEfX0Va
    ljAWHUsjqBqf2PvfeB5JXqgnprYpmWeAYjrTJrXIaKK5QExwCFBuFis1jrB5uTCvkIVg
    FgG/Nx4V9jxkf7wBepmNLV/5Sniz5uDNu+QouwtGwOMQHc7sOBPWxyR9WcjVAivNFxPM
    ZG715mfEHTq1mPrXzqXw/ifd0HslqEqWb4UyjeaBtaxYrnctsIiTqDGlHtrQcnUIsPGS
    Ut18ezHvkuINRWnNlrVCLaxcoW9egXyS5ldEP7xGx5lj3K1ABjjO+sywhR7NRVjgEo7e
    zNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719977222;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4SP5h5Do7JPIQ+0cy5j+pVKxqlNOrxXKcSxL9POMDto=;
    b=Ke9J2fL2PntphxYJSJw70i/Y8AdJ4RZqGhVBZZPDG55vo6UDbdzS+oe8gKw+VgS0MS
    zTNqAT+XON52EA0Z8+Noe3JLnM7J0R70gVF8rjAG/W6dRj8N+935sUCBdlz6RrHNAgEy
    Bo5Hd7uKy4qUl5JadWrydCqx/6iJF4PEbj/DuxLZaSI+YxnM8W1bY5F60c2IXgjoYbny
    Zaac7Y7YxVRVGyyTqysMeNlMJAJ+gX26d9A6sFIWI3naHkFmf+a7vGXvQs8lpFIh/dw3
    K6cZXR166/pGRSrwW6pMUx/jWfgQjrIS/gPKvj+CjIyUqORg9yeDP55RCJNF0YO9xoky
    kTzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719977222;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4SP5h5Do7JPIQ+0cy5j+pVKxqlNOrxXKcSxL9POMDto=;
    b=ZmBgDEjroGl5Thkv00h9sjj2HTUFCjpAIEUeiiaV3ViNLohCGnDfW5FsyFzuTlIE5l
    oaJWo7K2fyTr/FbGQohlK4jxnsbE+J3zhb8cFRZFMWC73QE+lyK+iogpqLUNgNesdNay
    aI1PdBSazld3vVqyg4EVazBhcvq80RDuYbBXoGADsUVDmMT1VyymKJD41JblYT0cEOQ9
    Mw/EmQCRJlNq92oI0INJeo52speN+Pg3scdwiYn5OLeV1oJEIWB89GxpnO5xa8FRdtMZ
    KrXU25A6E7sd7MhvcAng8TKWErGSg0uqvUs+2u+Dn2B/AHb8drv1TO5HRyuALeFFLqSa
    t0wA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719977222;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=4SP5h5Do7JPIQ+0cy5j+pVKxqlNOrxXKcSxL9POMDto=;
    b=Dc/RA1ajfn2nhMk1LNDqqP3Ye6P9115kx3TGG5pF5FN29MvIG3uASqsoyC0Idz2fRA
    qpnHI+PLR2lB4IU3j3AA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwnbX6uY2qFStl/aCni1Nc81TAvUiF9uCdWDcE="
Received: from [IPV6:2a01:599:806:4825:5b9f:b248:3889:7da0]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e083890633R1MpB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 Jul 2024 05:27:01 +0200 (CEST)
Message-ID: <5e44f1be-f626-4bcb-b1b0-583462c1a930@xenosoft.de>
Date: Wed, 3 Jul 2024 05:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <86zfqzhgys.wl-maz@kernel.org>
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

Hello Marc,

On 02.07.24 18:54, Marc Zyngier wrote:
> On Sun, 30 Jun 2024 11:21:55 +0100,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> Hello,
>>
>> There is an issue with the identification of ATA drives with our
>> P.A. Semi Nemo boards [1] after the
>> commit "of/irq: Factor out parsing of interrupt-map parent
>> phandle+args from of_irq_parse_raw()" [2].
> [snip]
>
> My earlier request for valuable debug information still stands. But
> while you're at it, can you please give the following hack a go?
>
> 	M.
>
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>   
>   			oldimap = imap;
>   			imap = of_irq_parse_imap_parent(oldimap, imaplen, out_irq);
> -			if (!imap)
> -				goto fail;
> +			if (!imap) {
> +				match = 0;
> +				break;
> +			}
>   
>   			match &= of_device_is_available(out_irq->np);
>   			if (match)
>
> This may not be the final workaround even if it solves your boot
> problem, but will at least give us a hint at what is going wrong.
>
> I have the fuzzy feeling that we may be able to lob this broken system
> as part of the of_irq_imap_abusers[] array, which would solve things
> pretty "neatly".
>
> 	M.
>
I saw that you may already have a solution. Do you still need the test 
with this patch?

Cheers,
Christian
