Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A4F65ADD6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 08:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NlpDN3ry1z3cFL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 18:59:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NlpCn6KPpz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jan 2023 18:59:00 +1100 (AEDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pCFie-0001Qg-Be; Mon, 02 Jan 2023 08:58:52 +0100
Message-ID: <3a5f08ed-65dc-c6ff-5da5-b9ce6880c6fd@leemhuis.info>
Date: Mon, 2 Jan 2023 08:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [FSL P50x0] DPAA Ethernet issue
Content-Language: en-US, de-DE
To: Christian Zigotzky <chzigotzky@xenosoft.de>, sean.anderson@seco.com,
 davem@davemloft.net, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Matthew Leaman <matthew@a-eon.biz>
References: <0bfc8f3d-cb62-25f4-2590-ff424adbe48a@xenosoft.de>
From: "Linux kernel regression tracking (#info)" <regressions@leemhuis.info>
In-Reply-To: <0bfc8f3d-cb62-25f4-2590-ff424adbe48a@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672646342;6394c0b5;
X-HE-SMSGID: 1pCFie-0001Qg-Be
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
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; all text you find below is based on a few templates
paragraphs you might have encountered already already in similar form.
See link in footer if these mails annoy you.]

On 01.01.23 15:18, Christian Zigotzky wrote:
> 
> The DPAA Ethernet doesn’t work anymore on our FSL P5020/P5040 boards [1]
> since the first updates after the final kernel 6.1 [2].
> We bisected yesterday [3] and found the problematic commit [4]. I was
> able to revert it. After that the DPAA Ethernet works again. I created a
> patch for reverting the commit [4]. After patching and compiling, the
> DPAA Ethernet also works again.
> 
> It seems, that the new driver doesn’t work with our onboard DPAA network
> interfaces.
> 
> Could you please check your commit? [4]
> 
> Thanks,
> Christian
> 
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=56326#p56326
> [3] https://forum.hyperion-entertainment.com/viewtopic.php?p=56334#p56334
> [4] lnet: dpaa: Convert to phylink:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=5d93cfcf7360eac9903774fe94f626c9ead2049d

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 5d93cfcf7360
#regzbot title lnet: dpaa: Ethernet issues
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (see page linked in footer for details).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
-- 
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr

Annoyed by mails like this? Feel free to send them to /dev/null:
https://linux-regtracking.leemhuis.info/about/#infomails
