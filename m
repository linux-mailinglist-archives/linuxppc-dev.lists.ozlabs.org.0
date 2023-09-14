Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D537A116E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmtLh71Xlz3dT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmg0y567Pz2yVg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 00:38:18 +1000 (AEST)
X-QQ-mid: bizesmtp67t1694702259t9udhzzs
Received: from [192.168.70.112] ( [125.75.40.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 22:37:37 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: 3M0okmaRx3hDlEzMIU7uSqErUQ9TeKNJWqroh3lGXB8lWHuCiOOCSNtHXao10
	uIy6MbO2eBWoV9qVfIhyoylKvVYM5N8reBL4zsiZKGDaP4P3xfmF66OLMNXbVRa3N42FxCb
	ntUPOnGvlYt4DZUJx68vqf2HN/DCVxXwp34LAyxVR34JMAEnlQOWw1O8tcvIkpy9sqaLmDS
	TwIJKjs2m+nS8DD7YKHZ0hYI8WnuhKtH3VdD7s7c16SuNrTGN1F7wRA/Eh5tVYVTg/pRZ7q
	oa4BRYf2SexgVRmtQct/iCdrpi/NEW947038ZgxglVPDfBeii8pn8fP3QgdF5t3Uw776tye
	ZUaDhG+CdVm86YbfhnDyXSi5ThxXp1bQzaiSbD22sv89FGeMcA=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1016913453215264975
Message-ID: <A81E00EBD697C30F+9c7a7721-e949-4ca6-a6b3-8eeb181718f2@tinylab.org>
Date: Thu, 14 Sep 2023 22:37:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] powerpc/config: Cleanup pmac32_defconfig
Content-Language: en-GB
To: Michael Ellerman <mpe@ellerman.id.au>, christophe.leroy@csgroup.eu
References: <cover.1694685860.git.tanyuan@tinylab.org>
 <23b30e8e9e31e7a6af4aa7d317699e1538ad89c2.1694685860.git.tanyuan@tinylab.org>
 <87y1h87vf3.fsf@mail.lhotse>
From: Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <87y1h87vf3.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Fri, 15 Sep 2023 09:07:30 +1000
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael

On 9/14/2023 9:10 PM, Michael Ellerman wrote:
> Yuan Tan <tanyuan@tinylab.org> writes:
>> Use 'make savedefconfig' to cleanup pmac32_defconfig, based on Linux
>> 7.6-rc1
> Thanks but I don't like doing these updates in a single commit like
> this, it's easy to accidentally lose a symbol.
Yeah I have the same concerns too.
>
> I prefer an explanation for what's changing for each symbol. See
> 1ce7fda142af ("powerpc/configs/64s: Drop IPV6 which is default y") and
> the commits leading up to it, to see what I mean.
>
> But I suspect you probably don't want to go to all that effort, which is
> fine :)

I am not familiar with other options, so I'd better not do that. :)

By the way, just to be cautious, since the defconfig can only be updated 
by 'savedefconfig'[1], how can we write an explanation for a single 
change in an option?

I mean, when I change one option, the value of the other undetermined 
option will be set just like in patch 1.

[1]: 
https://lore.kernel.org/all/54da2376-dc65-0a96-55df-7a5acfbb9bff@csgroup.eu/
>
> So I won't take patch 1, but patch 2 and 3 look fine. No need to resend,
> I'll deal with any merge fixup needed.
>
> cheers
Thank you :)
