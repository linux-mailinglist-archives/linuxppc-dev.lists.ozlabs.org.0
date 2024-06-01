Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707938D6E8B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:46:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=t7q/GrB9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vrr9v2rgpz30TB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=t7q/GrB9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vrr9806jLz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:45:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=M3VbKv/Z7RsHsd6+54TQ3z6DsAp7eyx6ax81hSXAgsU=;
	t=1717224348; x=1717656348; b=t7q/GrB9CF4/obEWjsUNhvKNjJFn5jKrr9KugOnWHDQAXlX
	E1Wo9T57C8q8AfyOr9D5uXd7XeDLRQJ/MZC/8b8fLAz9UM1U0omIhZy6Sr3dLpKlguN2TtST+o+1O
	aqmghqEXo6biTeNDRmai0vF94sk0vJh5gYECCPSO2itMcaVo23ZnrAxMOsuqzOlWZ1yboP28eet/2
	1cV+S+MAklPCfhRbMwhaZ2q9gAtRP575guQprZ772usPghDTRYA2cQDKJrYs+SvAcW72Y/AmL/S30
	gXxotpyhiPRbya7USZIz85O5oE2dhxurPqFYpHMzor4FMNqOi41F0mOztf0OvMOw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sDIUm-0000AT-9X; Sat, 01 Jun 2024 08:45:40 +0200
Message-ID: <e98cd7fa-0845-4de9-998c-96a0cf884f6c@leemhuis.info>
Date: Sat, 1 Jun 2024 08:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xorg doesn't start and some other issues with the RC1 of kernel
 6.10
To: Greg KH <gregkh@linuxfoundation.org>
References: <34d848f4-670b-4493-bf21-130ef862521b@xenosoft.de>
 <93f42bc8-f0ae-4f7f-8f25-a4e9faf8664b@xenosoft.de>
 <87zfs731jn.fsf@mail.lhotse> <87plt22w1k.fsf@mail.lhotse>
 <f4559641-2a64-4a1d-a00c-0f5ed85f3354@leemhuis.info>
 <2024053128-pueblo-skid-585e@gregkh> <2024053145-tapered-kleenex-d647@gregkh>
 <2024060155-chemicals-carrot-ea58@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <2024060155-chemicals-carrot-ea58@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717224348;25c4044e;
X-HE-SMSGID: 1sDIUm-0000AT-9X
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01.06.24 08:34, Greg KH wrote:
> On Fri, May 31, 2024 at 12:16:50PM +0200, Greg KH wrote:
>> On Fri, May 31, 2024 at 12:02:15PM +0200, Greg KH wrote:
>>> On Fri, May 31, 2024 at 11:19:34AM +0200, Thorsten Leemhuis wrote:
>>>> Thx, I already had an eye on this, but thought tracking would not be
>>>> needed, as Greg (now CCed) wanted to revert 8c467f3300591a ("VT: Use
>>>> macros to define ioctls") two days ago:
>>>> https://lore.kernel.org/all/2024052901-police-trash-e9f9@gregkh/
>>>>
>>>> But that commit is not yet in -next afaics. :-/
>>>>
>>>> /me meanwhile wonders if it would be wise to fix this before -rc2
>>>
>>> I do, sorry, been traveling this week with geen vrije tijd.  Will get to
>>> it tomorrow.
>>
>> Ugh, sorry for the dutch, I have "no free time" because I am studying
>> the language this week.  It is bleeding over here into my emails now...

:-D

> Pull request now sent:
> 	https://lore.kernel.org/r/Zlq8yMiUBTOisuWp@kroah.com

Dank u wel![1, 2] And good luck with your studies! Ciao, Thorsten

[1] "Many thx!"

[2] I understand some dutch (more than enough for "geen vrije tijd"),
but do not really speak it; but it was enough to get that simple phrase
right on the first attempt.

#regzbot fix: 7bc4244c882a7d7d
