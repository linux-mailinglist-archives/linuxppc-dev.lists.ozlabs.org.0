Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0B7F0491
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 07:40:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SY1Gw0036z3dRT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 17:40:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 1902 seconds by postgrey-1.37 at boromir; Sun, 19 Nov 2023 17:39:55 AEDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SY1GM75fkz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 17:39:54 +1100 (AEDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r4ayP-0008P5-IK; Sun, 19 Nov 2023 07:08:01 +0100
Message-ID: <cf3f1056-a0fa-4799-9827-08df8aae1184@leemhuis.info>
Date: Sun, 19 Nov 2023 07:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec register
 save
Content-Language: en-US, de-DE
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700375996;1bc5560e;
X-HE-SMSGID: 1r4ayP-0008P5-IK
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.11.23 00:45, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
> [...]
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>

Many thx for this, good to see you finally found the problem.

FWIW, you might want to add a

 Closes:
https://lore.kernel.org/all/480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com/

here. Yes, I care about those tags because of regression tracking. But
it only relies on Link:/Closes: tags because they were meant to be used
in the first place to link to backstories and details of a change[1].

And you and Jens did such good debugging in that thread, which is why
it's IMHO really worth linking here in case anyone ever needs to look
into the backstory later.

> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> [..]

Thx again for all your work you put into this.

Ciao, Thorsten

[1] see Documentation/process/submitting-patches.rst
(http://docs.kernel.org/process/submitting-patches.html) and
Documentation/process/5.Posting.rst
(https://docs.kernel.org/process/5.Posting.html)

See also these mails from Linus:
https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/
