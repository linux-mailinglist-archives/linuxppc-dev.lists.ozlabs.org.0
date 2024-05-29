Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2E18D3E70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:36:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bclxIrBT;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=U58/3pYd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqHyv1HTqz7B1Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 04:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bclxIrBT;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=U58/3pYd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.218; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 81027 seconds by postgrey-1.37 at boromir; Thu, 30 May 2024 04:30:54 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqHy65ghbz3vw3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:30:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1717007436; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ioi7KSaO7wuHzVA2nfnXH9Uqg1LMuE57RrkJGYws7mlBXig8Y37UFDC9J/KaHs6uON
    3xvxh1jpUBrD+Yu20Sd8+G3nWjSWWVyuKc7GuWbAGt65d6I3d15++dkOsP3DhR+wWtvj
    uZTwMBbuvzoGH10Ym1pRiM/OP0t7s6Yaz5F5N1jXnfv5yfMIUWVB7UtUI56LtUQKu+IK
    vlskf1vcWQuxcJWKBRjqEmRp+xHxvIYjdClcXyFgMERYRj+k9EHrcpIh3irF1bSj+o2B
    y0rzWoiXIeT+oaPblgNuphW9ZVybgW+/k301ykOjU7KnqB/hcngSryopVxBG+3in4B4y
    RWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1717007436;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=IPnC+VFjx7OcrlgkPRjNDSeBvc3ukzrTjDS4EKm0qSQ=;
    b=RKR5E0uwd9m72x6YSPLxGbsES8ogdZVyfauMigJ2aqirm3z9UJEwMX5V0OYIH5PKSR
    4tHTTG752XqoFedraaeg7mJ0AtvZl1FUXPKcQ31sH2VAAnunDY/KdkJLJJ7ihn3Wzddr
    8HI7mpFw7amzJuCnliTQnidOLvnikUjYWKPL0G/+BEGYjHZ/BN8XKbNY/uLdWAZfu/YH
    hq6kv9uHWMNySHo2ItxCTAZjVZv7/Vrdm2K28oBJjW1hRx3oRrVgvZdffkTGPL00vk9G
    3ypvBOsTSIyKKH3myCYl7kofUOgxwpOAl6wWdwe/tUOLH9voMo/1upj91L9n5A108nvt
    5Qvw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1717007436;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=IPnC+VFjx7OcrlgkPRjNDSeBvc3ukzrTjDS4EKm0qSQ=;
    b=bclxIrBT5fyI+yCqsTsJbuIPRVM8wYj0eV7pi4GzY6dDp54usjqsvdf1A2HsXl/ZrD
    PTdln97GkMW2NyGTZSho8HNKRgQh19MV5psf1GT3ivTRWZO9asaJTBiyTjIIrLR9qHb7
    5jli5hj3FOjvAe5LkfrrJ5gImQfI8pcWzlYQVdRPN21zXFig4lEuc/7fCTG7avAtHzhM
    GWMTYTbldf2F31l83nbE87gUN/i7wPxJIgNP8cdSy0jRcF/Mi1LSV/b431k5Sj9E915I
    JUlWqgKiXBE0ABQ5Af67ATorOVQyM1YwBYB9HuQL2F3l7y+3T1Y1vQD97H+nJLQHsfIQ
    MmZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1717007436;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=IPnC+VFjx7OcrlgkPRjNDSeBvc3ukzrTjDS4EKm0qSQ=;
    b=U58/3pYdjZMkRlfy0H/mKWE4KyXT3zfYer4Pmu26qCzphaWYhzuI/ifwdI/+JqpvK9
    XcL5uqG4cwUak4t0vFDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0nbX1JQQnlIu4Cn1alHGFSpTTKHuUkFL/T/1A="
Received: from [IPV6:2a01:599:816:7ace:6c4e:b789:62ef:67ed]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae04TIUavS6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 29 May 2024 20:30:36 +0200 (CEST)
Message-ID: <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
Date: Wed, 29 May 2024 20:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
Content-Language: en-US
In-Reply-To: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.05.24 22:00, Christian Zigotzky wrote:
> Hi All,
>
> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
> with the VirtIO GPU and with some Radeon cards.
>
> Another error message: Failed to start Setup Virtual Console.
>
> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>
> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>
> Could you please test Xorg on your PowerPC machines?
>
> Thanks,
> Christian
I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
(-device VGA,vgamem_mb=256) and Xorg doesn't start either.

Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
Inappropriate ioctl for device.

Please test the RC1 with Xorg on your PowerPC machine.

Thanks
