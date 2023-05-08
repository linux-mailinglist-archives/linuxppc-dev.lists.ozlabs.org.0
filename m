Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AB6FB13D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 15:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFML40nRrz3fLr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:18:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFMKZ2XZBz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 23:17:54 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pw0kR-0006pa-64; Mon, 08 May 2023 15:17:51 +0200
Message-ID: <fa6de026-1444-7beb-197c-d6a637eef86e@leemhuis.info>
Date: Mon, 8 May 2023 15:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
 <ZFjx31Rw79GF+E7p@debian.me>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZFjx31Rw79GF+E7p@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683551874;981cc6da;
X-HE-SMSGID: 1pw0kR-0006pa-64
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
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08.05.23 14:58, Bagas Sanjaya wrote:
> On Mon, May 08, 2023 at 01:29:22PM +0200, Linux regression tracking #adding (Thorsten Leemhuis) wrote:
>> [CCing the regression list, as it should be in the loop for regressions:
>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>
>> [TLDR: I'm adding this report to the list of tracked Linux kernel
>> regressions; the text you find below is based on a few templates
>> paragraphs you might have encountered already in similar form.
>> See link in footer if these mails annoy you.]
>>
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
>> <snipped> ... 
>> Thanks for the report. To be sure the issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>> tracking bot:
>>
>> #regzbot ^introduced e4ab08be5b4902e5
> 
> Why and how can you conclude that the culprit is e4ab08be5b4902 ("powerpc/isa-bridge:
> Remove open coded "ranges" parsing") rather than powerpc PR merge commit
> 70cc1b5307e8ee ("Merge tag 'powerpc-6.4-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux")? 

I looked at the thread and noticed it was mentioned later (
https://lore.kernel.org/all/3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de/
).

Ciao, Thorsten
