Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ACB6F7C11
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 06:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCJC109q8z3fDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 14:50:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jEx4gN3G;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VjbE2S8h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jEx4gN3G;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VjbE2S8h;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCJB445H3z3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 14:49:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1683262139; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YiQraUEi+DSbCYDgnxdkd1NGH2KkUgx/maRKMPR6LLkyTEuVdOJrl/xaYTvPodfiLR
    zvs/ew8x45cK/nkmfW7TglZS+J1bujiVHHqy56Z1VPRWQB60Qo+q3WVYxsfDu26bdCKK
    Y2GTls2mt8HDpMpfQycb3bsmuhxTnNN00229clmQg/En5n9WjYvUQlT9Pcp4Ib65WCXT
    56Tw+FCfXtlm5eZ2ojh413hjylqBSWGqL3Phfv9qnnhw0d3CVmPfWnP4yj1UTNMBL5Px
    ATdT9Lp95x8DG6G73kARCHdsaOT1iK7/H81B3kOUYt00sGfpwi/GrNNRmwPpSwFfmM9H
    w83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683262139;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hhTdBGYNSPhD8+JJVweFb7fRCgzzpRjGQZFEXgkdE1U=;
    b=BTOmVo8CMD4w2MU+KhWxA0ikL9QNQmDOdhfsJCEOQZ8FAvkCvU9ru4L5GShcJszzLy
    KgdL5hDbLoc8C31NhcPaifXJvnyc+AliYRqQJMc+2kq7/SXy52/nqacITRIpNGUOVj78
    v5N9elzNxVIUh7r5A0Xj3Qd8brNseKtKZDwF2PrljCyPzZdVo+dIP8WMKj5ztOIw/lP3
    XaC8fupJ9fcg35cHpCi/KThtoB7jbFkwvLkmQhRYW0Y0U551X+/3KOxJd+FMyR/NonhF
    KQBMBQMfWGtH9F0a+qPQXE9f2vTDwcdcDoHs0ZlGILB1fURaxE5i9YKoNPAKSqZp+mBB
    jXqQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683262139;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hhTdBGYNSPhD8+JJVweFb7fRCgzzpRjGQZFEXgkdE1U=;
    b=jEx4gN3Gnc78A1y3aVUJh1eMhl7wFA73fXqDI3JvVz7ELgEt48kTbwjSGh5biJAK+p
    RC4jaZJJ4c1zMI052BGLOdcdTXwppApYl0VB0dQ7KUG4RfFpEr9Lve4Wp206j/VCyL5v
    6BFps5STQCwkc5dYKmoK9FcaQFEcTH7xhcKJa7sZ9zymx3n6YPoP75oYPG+ND9JzM6fg
    +pm4+7sNhREbE1pOYqQmv12U0lRzATK8v16Di9yMRH0dHPGpjMG9JCOq2zqo2Cri8m8D
    FcJzbOK/hNvFvpF2F23CvADsXIp9SnB7pJ3LBUVzj5Gx3hVF5aTX+JSy0NaNi9LzMth9
    6eug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683262139;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hhTdBGYNSPhD8+JJVweFb7fRCgzzpRjGQZFEXgkdE1U=;
    b=VjbE2S8hxwaEPw6KRP/VOIWm+jkfLdsv8vfKIEbDsVOMWSSlyifuuJYSk/N5XFQu/z
    B+QEWcPkaqGgyeeqVEBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiE4ZAdALisHfRENTOMogMbqr1scA=="
Received: from [IPV6:2a02:8109:8980:4474:a839:1eae:dbf4:9f32]
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez454mwT4g
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 5 May 2023 06:48:58 +0200 (CEST)
Message-ID: <cc227ae6-262c-dea5-f181-db5d6828cc90@xenosoft.de>
Date: Fri, 5 May 2023 06:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
To: Rob Herring <robh@kernel.org>
References: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
 <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
 <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03 May 2023 at 08:15 pm, Rob Herring wrote:
> On Wed, May 3, 2023 at 12:40 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>>
>>> On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
>>>
>>> ﻿On Wed, May 3, 2023 at 11:27 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>> +Rob as he's the commit's Author.
>>>>
>>>>> Le 03/05/2023 à 17:46, Christian Zigotzky a écrit :
>>>>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
>>>>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>>>>>>> Hello,
>>>>>>>
>>>>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1
>>>>>>> [2].
>>>>>>>
>>>>>>> The kernel hangs right after the booting Linux via __start() @
>>>>>>> 0x0000000000000000 ...
>>>>>>>
>>>>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
>>>>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>>>>>>>
>>>>>>> After a re-compiling, the kernel boots without any problems without the
>>>>>>> PowerPC updates 6.4-1 [2].
>>>>>>>
>>>>>>> Could you please explain me, what you have done in the boot area?
>>>>>> There's a few possibilities, but nothing obvious.
>>>>>>
>>>>>> To begin with can you please test the following commits?
>>>>>>
>>>>>> 77e69ee7ce07
>>>>>> e4ab08be5b49
>>>>>> eeac8ede1755
>>>>>>
>>>>>> cheers
>>>>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
>>>>>
>>>>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
>>>>> "ranges" parsing"
>>>>>   1 file changed, 129 insertions(+), 37 deletions(-)
>>>>>
>>>>> After a recompiling it boots without any problems.
>>>>>
>>>>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsing
>>>>> is the bad commit.
>>> Could I get a DT file for this board?
>>>
>>> In the meantime, just revert this commit. I don't think I'll be able
>>> to fix it before I'm out on sabbatical.
>>>
>>> Rob
>> FYI:
>>
>> Darren Stevens wrote:
>>
>> The dtb passed by the CFE firmware has a number of issues, which up till
>> now have been fixed by use of patches applied to the mainline kernel.
>> This occasionally causes problems with changes made to mainline.
> Changing the firmware is not the only way to modify the DT. Perhaps a
> DT overlay would work better than carrying patches if the patches
> aren't upstreamable. It kind of depends on how early you'd need to
> apply the overlay and whether you'd need external phandles (aka
> __symbols__ node, which the base DTB wouldn't support).
>
> Looking at the DT, I think this change might fix it. Can you test this change:
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index e692809ff822..475b74413fdd 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -284,7 +284,7 @@ EXPORT_SYMBOL(of_range_to_resource);
>
>   static int of_bus_isa_match(struct device_node *np)
>   {
> -       return of_node_name_eq(np, "isa");
> +       return of_node_is_type(np, "isa") || of_node_name_eq(np, "isa");
>   }
>
>   static void of_bus_isa_count_cells(struct device_node *child,
I tested this patch today but unfortunately the Nemo board doesn't boot.

- Christian
