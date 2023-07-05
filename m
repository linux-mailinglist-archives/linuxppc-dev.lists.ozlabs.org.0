Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69830748022
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 10:52:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwthp2YmWz3c03
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 18:52:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwthH3thBz301T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 18:52:14 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qGyF1-0002O0-Fp; Wed, 05 Jul 2023 10:52:03 +0200
Message-ID: <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
Date: Wed, 5 Jul 2023 10:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Content-Language: en-US, de-DE
To: Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
 <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh>
 <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh>
 <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <2023070509-undertow-pulverize-5adc@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688547135;c9955e32;
X-HE-SMSGID: 1qGyF1-0002O0-Fp
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.07.23 09:08, Greg KH wrote:
> On Tue, Jul 04, 2023 at 01:22:54PM -0700, Suren Baghdasaryan wrote:
>> On Tue, Jul 4, 2023 at 9:18 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>>> On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>>>>> Thanks! I'll investigate this later today. After discussing with
>>>>>>>> Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
>>>>>>>> the issue is fixed. I'll post a patch shortly.
>>>>>>>
>>>>>>> Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
>>>>>>
>>>>>> As that change fixes something in 6.4, why not cc: stable on it as well?
>>>>>
>>>>> Sorry, I thought since per-VMA locks were introduced in 6.4 and this
>>>>> patch is fixing 6.4 I didn't need to send it to stable for older
>>>>> versions. Did I miss something?
>>>>
>>>> 6.4.y is a stable kernel tree right now, so yes, it needs to be included
>>>> there :)
>>>
>>> I'm in wait-a-few-days-mode on this.  To see if we have a backportable
>>> fix rather than disabling the feature in -stable.

Andrew, how long will you remain in "wait-a-few-days-mode"? Given what
Greg said below and that we already had three reports I know of I'd
prefer if we could fix this rather sooner than later in mainline --
especially as Arch Linux and openSUSE Tumbleweed likely have switched to
6.4.y already or will do so soon.

>> Ok, I think we have a fix posted at [2]  and it's cleanly applies to
>> 6.4.y stable branch as well. However fork() performance might slightly
>> regress, therefore disabling per-VMA locks by default for now seems to
>> be preferable even with this fix (see discussion at
>> https://lore.kernel.org/all/54cd9ffb-8f4b-003f-c2d6-3b6b0d2cb7d9@google.com/).
>> IOW, both [1] and [2] should be applied to 6.4.y stable. Both apply
>> cleanly and I CC'ed stable on [2]. Greg, should I send [1] separately
>> to stable@vger?
> 
> We can't do anything for stable until it lands in Linus's tree, so if
> you didn't happen to have the stable@ tag in the patch, just email us
> the git SHA1 and I can pick it up that way.
> 
> thanks,
> 
> greg k-h

Ciao, Thorsten
