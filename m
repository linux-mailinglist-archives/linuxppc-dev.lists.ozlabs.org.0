Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A030F8D61B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 14:27:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EWPonKkM;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=lhCMJLco;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrMp6680cz3bdV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:27:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EWPonKkM;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=lhCMJLco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrMnM2ZFKz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 22:27:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1717158399; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bs6HxUeetj+EWaGyVxMKlJRXaAGTzs48IihGwjFViZWeV3ZeqL9yJAi5mK+Wxpw3oj
    4EHAfpDN7m9pUYMdkDWOERI72s7aWF2Ywl4cDBnzxrx4gi+LYlBiW8grsDH445EgnsS8
    wubqq0kh68a4+89H8U0Os35axlKirPDBaEzv1cs66xvyjy9h2Rv5Eidfpgp888kOhGLR
    01FRjL0ap6Pp2KhIqBJ0Dzi/hR5f1Dzp2c6M19wcl7k8BrNl/amMxnkckDdQ0CZiSfQx
    DNu6ciIGAGwu8aZ30oumH0PpwP7moRGf5wdn2bin7BHOQIrWxXeG2Og+lTpx2mt0FUq/
    Dh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=pg1Hnn1qIavy4PgRnzJ5CISH6PvLsSH8Rqef7z8hA5zQ+TwE7MDkPakzJePPTK+HsJ
    Kyc+h+oY9SKvh4Cj9uGhbQ9EZyT8tUuvj3+jFSAoNg6qkihBnlnC1CnJ+nI3p+xH7XvG
    P+humqPDG8UfWKA7F8vQaAg4foS6abbPC1ipTn6b1Bjv0GNhYWlbwN/SXe/GlKx2U405
    cLUNSVQ8S/d4ZV/23eFcxqdG9bYam6ZwSCR3efc21ZpTb5w7pkMmDuxl4lmY4tJpOULn
    ItRKBuhpfoiI461CcbJwpkmtj1d2xP46NIQwRrzOz+ySMpWT1DGzb4KclLBHUuPNCGYj
    XZGg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=EWPonKkMLWNGf1kND6YFKBRuv2xiuGIdL5/TgPqvYGmDzc2uX8ghg33Ac+V2wcUo7K
    KtphvyS5Q8hU8fceX14T9yc8jW9iSh7fseNsZZqNVWRxuNP2rYrmUivMw7ZwKQRaOOZk
    HIYM1+dqoh9EDLFbi+/OCWorK7XLR//+IxTnZTy5YmYLh7pDP3PDASJvjnwzrsuCF6Tb
    pd3OXGOu86fE277rM1TUMiJVqm/ncNaFybPzxziqfELfclRqUc8Xre+HXz6Q/UhO2FJp
    qzunQNvVdY4pcIOzSJd0DBOo+QTYIvzfmwwTJaVkZpZJwb/onyQQbMoUz2KWX7iVwZZ3
    m8kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1717158399;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=4fffa7HnfxrKlSrFwaE1xgg4P7hM9NiByDYj45gR3ec=;
    b=lhCMJLcojxrVP/ivV1ajKdqSc1h4bvGa8z5uE9T1FBgCzI/5EtBLgIjf+/lfsSphn9
    Gb/gh/NdW5FdRjrJa+AQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43J0lbSiPOfaY0XT9zGWI312LPn8wNt1+3JXo6M8="
Received: from [IPV6:2a01:599:814:b9bb:b156:e740:f15d:79cf]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae04VCQbzmr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 31 May 2024 14:26:37 +0200 (CEST)
Message-ID: <b307ad01-023e-4c78-b9d3-92bcb8403a0b@xenosoft.de>
Date: Fri, 31 May 2024 14:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Christian Zigotzky <info@xenosoft.de>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87zfs731jn.fsf@mail.lhotse>
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

On 30.05.24 14:51, Michael Ellerman wrote:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> On 28.05.24 22:00, Christian Zigotzky wrote:
>>> Hi All,
>>>
>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it
>>> with the VirtIO GPU and with some Radeon cards.
>>>
>>> Another error message: Failed to start Setup Virtual Console.
>>>
>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>>
>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>>
>>> Could you please test Xorg on your PowerPC machines?
>>>
>>> Thanks,
>>> Christian
>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA
>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>>
>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed
>> Inappropriate ioctl for device.
> That is presumably because of this:
>    https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
>
> cheers
Hello Michael,

Many thanks for the hint! :-)

I was able to revert this commit and Xorg works again. We tested it with 
a Radeon and a VirtIO-GPU.

@Skateman
I reduced the uImage. Please test it. Link: 
https://github.com/chzigotzky/kernels/releases/tag/v6.10.0-rc1-4

Have a nice weekend,

Christian
