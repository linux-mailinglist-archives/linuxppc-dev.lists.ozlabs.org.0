Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527D653FDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 12:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nd7ty0PMnz3c1p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 22:51:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
X-Greylist: delayed 1573 seconds by postgrey-1.36 at boromir; Thu, 22 Dec 2022 22:50:51 AEDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nd7tM4PT7z3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 22:50:50 +1100 (AEDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8Jge-0008CZ-3K; Thu, 22 Dec 2022 12:24:32 +0100
Message-ID: <d0119f9f-421c-069a-91f6-ff7a0187038d@leemhuis.info>
Date: Thu, 22 Dec 2022 12:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice" #forregzbot
Content-Language: en-US, de-DE
To: linux-input@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671709851;0189a5f6;
X-HE-SMSGID: 1p8Jge-0008CZ-3K
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

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 22.12.22 11:42, Christian Zigotzky wrote:
> 
> The Nemo board [1] doesn't reboot anymore since the final kernel 6.1.
> The reboot works with the RC8 of kernel 6.1.
> Actually, a reboot works but the CFE firmware is not loaded. Maybe there
> is still something in the memory after the reboot.
> 
> I bisected today. [2]

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced f6d910a89a23
#regzbot title hid: PASEMI Nemo board doesn't reboot anymore
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
