Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1076FB09A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFLkC1pDLz3ckZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 22:50:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JtiLlBI0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFLjL4HzHz3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 22:49:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JtiLlBI0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFLjH4B1pz4x1R;
	Mon,  8 May 2023 22:49:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683550197;
	bh=eO5q3it3xvvYdSrNIsevKUBw8GnvvPHh7AKieuy9aNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JtiLlBI0TQGn5mQMQvePVg2mc44sEVMrRTGjYF+fJQL6AJHXUYXN+m/DA4C4IEo8i
	 m8hRfR3lPGeHWmMfPLt4OS5/O5EgnAiVjnyAbe6Il921BcbxKt0jtTwwRuQ0yjGJf3
	 ezLZXT2YlIdc39MB679D/Qa1+nC/7KaV0wSVjFK2K7CRIyU1xELiZqSApXRb0Akf4J
	 ofbHNTMGF/O1cwfBQUaxEkJrdYsqhsNH4l3W+pETpK47jKrDqLXzRzBWTulbUnqB4K
	 LuTrVU6Pm+yw592Us13k3yKhuf1aYU3n75gwjqYn8OaEA9bqgpf6cXfTf97ldYQPua
	 TuQ0FsI/cfJOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
In-Reply-To: <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
Date: Mon, 08 May 2023 22:49:54 +1000
Message-ID: <87ttwn56od.fsf@mail.lhotse>
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
Cc: Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, Linux kernel regressions list <regressions@lists.linux.dev>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Linux regression tracking #adding (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]

Patch is in testing.

https://lore.kernel.org/linuxppc-dev/20230505171816.3175865-1-robh@kernel.org/

cheers

> On 02.05.23 04:22, Christian Zigotzky wrote:
>> Hello,
>> 
>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1 [2].
>> 
>> The kernel hangs right after the booting Linux via __start() @
>> 0x0000000000000000 ...
>> 
>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>> 
>> After a re-compiling, the kernel boots without any problems without the
>> PowerPC updates 6.4-1 [2].
>> 
>> Could you please explain me, what you have done in the boot area?
>> 
>> Please find attached the kernel config.
>
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
>
> #regzbot ^introduced e4ab08be5b4902e5
> #regzbot title powerpc: boot issues on PASEMI Nemo board
> #regzbot ignore-activity
>
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
>
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
