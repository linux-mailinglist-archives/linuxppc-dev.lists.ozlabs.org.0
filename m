Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 078336FB120
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 15:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFMHK6kQSz3fHv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFMGp3Mmhz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 23:15:29 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pw0i5-0006C4-Dl; Mon, 08 May 2023 15:15:25 +0200
Message-ID: <dd6b09c3-4297-2f22-b89c-40583608261a@leemhuis.info>
Date: Mon, 8 May 2023 15:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Content-Language: en-US, de-DE
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
 <87ttwn56od.fsf@mail.lhotse>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <87ttwn56od.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683551730;31e408a2;
X-HE-SMSGID: 1pw0i5-0006C4-Dl
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
Cc: Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, Linux kernel regressions list <regressions@lists.linux.dev>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.05.23 14:49, Michael Ellerman wrote:
> "Linux regression tracking #adding (Thorsten Leemhuis)"
> <regressions@leemhuis.info> writes:
>> [CCing the regression list, as it should be in the loop for regressions:
>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>
>> [TLDR: I'm adding this report to the list of tracked Linux kernel
>> regressions; the text you find below is based on a few templates
>> paragraphs you might have encountered already in similar form.
>> See link in footer if these mails annoy you.]
> 
> Patch is in testing.
> https://lore.kernel.org/linuxppc-dev/20230505171816.3175865-1-robh@kernel.org/

Ahh, great, thx for letting me know.

Thanks to a proper Link tag regzbot would have noticed that fix once it
landed in next, but it's nevertheless good to know that the fix is
already under review. :-D

Fun fact: sometimes I wish we would not post fixes in new threads, as
that makes it hard to find the proposed fix for anybody that runs into
reported issues and also manages to find the report (e.g. this thread).
But whatever, that's just a detail.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot monitor:
https://lore.kernel.org/linuxppc-dev/20230505171816.3175865-1-robh@kernel.org/

>> On 02.05.23 04:22, Christian Zigotzky wrote:
>>> Hello,
>>>
>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1 [2].
>>>
>>> The kernel hangs right after the booting Linux via __start() @
>>> 0x0000000000000000 ...
>>>
>>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>>>
>>> After a re-compiling, the kernel boots without any problems without the
>>> PowerPC updates 6.4-1 [2].
>>>
>>> Could you please explain me, what you have done in the boot area?
>>>
>>> Please find attached the kernel config.
>>
>> Thanks for the report. To be sure the issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>> tracking bot:
>>
>> #regzbot ^introduced e4ab08be5b4902e5
>> #regzbot title powerpc: boot issues on PASEMI Nemo board
>> #regzbot ignore-activity
>>
>> This isn't a regression? This issue or a fix for it are already
>> discussed somewhere else? It was fixed already? You want to clarify when
>> the regression started to happen? Or point out I got the title or
>> something else totally wrong? Then just reply and tell me -- ideally
>> while also telling regzbot about it, as explained by the page listed in
>> the footer of this mail.
>>
>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>> to the report (the parent of this mail). See page linked in footer for
>> details.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> That page also explains what to do if mails like this annoy you.
> 
