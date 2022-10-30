Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79365612BEA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 18:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0jxL2VFYz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 04:31:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
X-Greylist: delayed 2648 seconds by postgrey-1.36 at boromir; Mon, 31 Oct 2022 04:30:32 AEDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0jwm05TKz2ywY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 04:30:31 +1100 (AEDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1opBRw-0005y7-8Z; Sun, 30 Oct 2022 17:46:16 +0100
Message-ID: <28bb92a2-851d-cccc-2c1b-2f5a21fc49c1@leemhuis.info>
Date: Sun, 30 Oct 2022 17:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
 #forregzbot
Content-Language: en-US, de-DE
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667151032;edd23d9b;
X-HE-SMSGID: 1opBRw-0005y7-8Z
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

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 12.10.22 08:51, Christian Zigotzky wrote:
> Hi All,
> 
> I use the Nemo board with a PASemi PA6T CPU and have some issues since the first PowerPC updates for the kernel 6.1.
> 
> I successfully compiled the git kernel with the first PowerPC updates two days ago.
> 
> Unfortunately this kernel is really dangerous. Many things for example Network Manager and LightDM don't work anymore and produced several gigabyte of config files till the partition has been filled.
> 
> I deleted some files like the resolv.conf that had a size over 200 GB!
> 
> Unfortunately, MintPPC was still damaged. For example LightDM doesn't work anymore and the MATE desktop doesn't display any icons anymore because Caja wasn't able to reserve memory anymore.
> 
> In this case, bisecting isn't an option and I have to wait some weeks. It is really difficult to find the issue if the userland will damaged again and again.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced c2e7a19827eec443a7cb
#regzbot title ppc: PASemi PA6T CPU: Network Manager and LightDM and
fill volume with data
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
