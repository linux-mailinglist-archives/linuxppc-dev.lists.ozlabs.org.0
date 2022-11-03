Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1219617339
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:09:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2kd95HqGz3f67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 11:09:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxJ5g/+W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2kcH5t8yz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 11:08:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lxJ5g/+W;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N2kcH2x3gz4xG5;
	Thu,  3 Nov 2022 11:08:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667434095;
	bh=ILQg5VedcQfB/c4FWJNZPXpdNmrSSO0UgPGkvpbhvZI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=lxJ5g/+WcorWL00YxKGTRdVR9REcWq/V9G+TPTmOUGIy2H9QVTr0LTpYZ3UNCcfh9
	 wUYsciKGhQj9S58Tn2ImpwiCW0Zt54/7c1Fj26Pt4CbRF0moLr0gNn+ce3EzYEDzEA
	 32ctCg8eTAJELGjquaF0mESj032pYBlXrEWxYvfcQ1rIyFXB5VHp1br4B6KCysMTIb
	 JOs4UU1sRB7LnWzA0y7MCjSCSmPe5HsuBnHPho+Ekx/n13Ei6r4rntUWNtpnNKV07v
	 fl4lzq/sJa0yCaHInk+2PcVJ8OwU2pt23txRgRRcB9D6EugVeqR3DXLA944xXFUOtO
	 gt5LxK4/mKfQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thorsten Leemhuis <regressions@leemhuis.info>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
 #forregzbot
In-Reply-To: <28bb92a2-851d-cccc-2c1b-2f5a21fc49c1@leemhuis.info>
References: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
 <28bb92a2-851d-cccc-2c1b-2f5a21fc49c1@leemhuis.info>
Date: Thu, 03 Nov 2022 11:08:14 +1100
Message-ID: <87r0yksxw1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
>
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
>
> Hi, this is your Linux kernel regression tracker.
>
> On 12.10.22 08:51, Christian Zigotzky wrote:
>> Hi All,
>> 
>> I use the Nemo board with a PASemi PA6T CPU and have some issues since the first PowerPC updates for the kernel 6.1.
>> 
>> I successfully compiled the git kernel with the first PowerPC updates two days ago.
>> 
>> Unfortunately this kernel is really dangerous. Many things for example Network Manager and LightDM don't work anymore and produced several gigabyte of config files till the partition has been filled.
>> 
>> I deleted some files like the resolv.conf that had a size over 200 GB!
>> 
>> Unfortunately, MintPPC was still damaged. For example LightDM doesn't work anymore and the MATE desktop doesn't display any icons anymore because Caja wasn't able to reserve memory anymore.
>> 
>> In this case, bisecting isn't an option and I have to wait some weeks. It is really difficult to find the issue if the userland will damaged again and again.
>
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
>
> #regzbot ^introduced c2e7a19827eec443a7cb
> #regzbot title ppc: PASemi PA6T CPU: Network Manager and LightDM and
> fill volume with data
> #regzbot ignore-activity
>
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply -- ideally with also
> telling regzbot about it, as explained here:
> https://linux-regtracking.leemhuis.info/tracked-regression/

#regzbot fixed-by: 40ff21432883

cheers
