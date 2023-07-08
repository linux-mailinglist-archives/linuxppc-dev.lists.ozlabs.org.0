Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57774BD64
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 13:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qyp9x3MYbz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:36:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qyp9R00y8z30Nn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 21:35:37 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qI6Dm-0004GA-MM; Sat, 08 Jul 2023 13:35:26 +0200
Message-ID: <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info>
Date: Sat, 8 Jul 2023 13:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Content-Language: en-US, de-DE
To: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
 <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688816139;f13f31f2;
X-HE-SMSGID: 1qI6Dm-0004GA-MM
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[adding Linus to the list of recipients to ensure the fix makes it into
-rc1 (and can finally be backported to -stable).

Linus, here is the backstory, as I assume you haven't seen this yet:

CONFIG_PER_VMA_LOCK (which defaults to Y; merged for v6.4-rc1 in
0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling first"))
sometimes causes memory corruption reported here:
https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org/
https://bugzilla.kernel.org/show_bug.cgi?id=217624

The plan since early this week is to mark CONFIG_PER_VMA_LOCK as broken;
latest patch that does this is this one afaics:
https://lore.kernel.org/all/20230706011400.2949242-3-surenb@google.com/

But that change or something similar hasn't reached you yet afaics;
note, this is the second patch of a series with two patches]

On 05.07.23 17:49, Andrew Morton wrote:
> On Wed, 5 Jul 2023 10:51:57 +0200 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> wrote:
> 
>>>>> I'm in wait-a-few-days-mode on this.  To see if we have a backportable
>>>>> fix rather than disabling the feature in -stable.
>>
>> Andrew, how long will you remain in "wait-a-few-days-mode"? Given what
>> Greg said below and that we already had three reports I know of I'd
>> prefer if we could fix this rather sooner than later in mainline --
>> especially as Arch Linux and openSUSE Tumbleweed likely have switched to
>> 6.4.y already or will do so soon.
> 
> I'll send today's 2-patch series to Linus today or tomorrow.

That afaics did not happen until now. :-(

This makes me regret that I did not CC Linus earlier. I always feel like
a snitcher when I do that. But in retrospective it seems it would have
been the right thing to do given the problem, as I suspect Linus would
have quickly applied the patch or marked the feature as broken himself.

So thx to this (and a handful of earlier, similar situations) I now
fully made my peace with feeling like a snitcher (I always knew that
it's kinda part of the position). When something in me says "Ick, this
looks bad to my untrained eyes" I'll immediately CC Linus.

Linus, if I take things to far just let me know. But I assume you get a
lot of mails and won't mind a few more.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
