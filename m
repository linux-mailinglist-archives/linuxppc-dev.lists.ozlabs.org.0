Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 406198D5E12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 11:20:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=0qcsdGax;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrHf10Lg3z30Wm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 19:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=0qcsdGax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrHdD1vlCz30Tt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 19:19:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=XCfUSwwG38LbsorFibZSI1D3cUGb8T2kMLpzHOPARB4=; t=1717147184;
	x=1717579184; b=0qcsdGaxmQPiN6pgie7NVdEtIBPB292fiaH5RuP7VG68dE4CmC7vTmYu/iKL5
	WUqonr340Aj57+BOmMy4RhYrqYScrefk/ykKksGhtybaSlPlvZZMaL9k4DfHSwErO6hj9Cplp2GkC
	psF+dnWx8EQjGAQ5DO4S4jKXUH9SxDpxgIOIAOYOjVwqKbdeFEqcdmopXohmOFZlv78El/An5AB5b
	lSSLF1+7xRaQfj5cCI+eP6VgFEhr4Tv3b80OOTRMNGr98DRVccLWSuo6WG41+PaA/H0B/J8g3Oev/
	N87FSS0dCtsx/rQHGfrGDYf8qICyZYXNLDQJIYj5J96kzp7K2A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCyQB-0003ML-EJ; Fri, 31 May 2024 11:19:35 +0200
Message-ID: <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
Date: Fri, 31 May 2024 11:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse> <87plt22w1k.fsf@mail.lhotse>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <87plt22w1k.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717147184;5e41d3e4;
X-HE-SMSGID: 1sCyQB-0003ML-EJ
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

On 31.05.24 11:03, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>> On 28.05.24 22:00, Christian Zigotzky wrote:
>>>> Hi All,
>>>>
>>>> Xorg doesn't start anymore since the RC1 of kernel 6.10. We tested it 
>>>> with the VirtIO GPU and with some Radeon cards.
>>>>
>>>> Another error message: Failed to start Setup Virtual Console.
>>>>
>>>> Maybe this is the issue: + CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>>>
>>>> Tested with FSL P5040, FSL P5020, and PASEMI boards.
>>>>
>>>> Could you please test Xorg on your PowerPC machines?
>>>>
>>>> Thanks,
>>>> Christian
>>> I tested the RC1 in a virtual e5500 QEMU PowerPC machine with Bochs VGA 
>>> (-device VGA,vgamem_mb=256) and Xorg doesn't start either.
>>>
>>> Error message: xf86OpenConsole: KDSETMODE KD_GRAPHICS failed 
>>> Inappropriate ioctl for device.
>>
>> That is presumably because of this:
>>   https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/
> 
> Attempting to regzbot this.
> 
> #regzbot introduced: 8c467f330059
> #regzbot monitor: https://lore.kernel.org/all/0da9785e-ba44-4718-9d08-4e96c1ba7ab2@kernel.org/

Thx, I already had an eye on this, but thought tracking would not be
needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
macros to define ioctls") two days ago:
https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/

But that commit is not yet in -next afaics. :-/

/me meanwhile wonders if it would be wise to fix this before -rc2

Ciao, Thorsten
