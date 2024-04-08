Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836B89B71E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:20:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NtwXaEjq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCcr21rnrz3dXZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:20:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NtwXaEjq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCcqK0DlFz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:20:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712553612;
	bh=XZu26WoVj+aYiP2HgRzxMGfR6mT0EhwCcY1NLc0eUAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NtwXaEjqDnzFWsb+68xwuVHgjWc8ce+M8o1K/NSpjV0/oHq/uhFonP/RqANt0LSZ+
	 CuUt5MniSq6tM1ytEtlx5S6twMM/2+tjnQJSLhJfrJ0dvlkBRJCznN5ukPiOpVeTf6
	 IMsULyM2pdA+EvT500NoWRT01y/0oUsOsjqPltol8pAMS+JeT7mGykB+er9ATz30Fu
	 YD/jvCbeLTDZfBd3kmG+piRw1lIyteeFq+lAKQF2UwNC8DKShMbiF46v/OLuF++nt1
	 gnF49PuVw8b1dyJLf+PEBkd4pSxzDkghJ1UjzocPyOZqCUyxufHbpOUklWxfVtLRHF
	 gd5UfzxksZ2JA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCcqJ0WXPz4wcR;
	Mon,  8 Apr 2024 15:20:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Nicholas Piggin
 <npiggin@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC
 exception
In-Reply-To: <cb038940-63fd-4348-bed2-13e1b2844b92@leemhuis.info>
References: <20240313072625.76804-1-vaibhav@linux.ibm.com>
 <CZYME80BW9P7.3SC4GLHWCDQ9K@wheely>
 <a4f022e8-1f84-4bbb-b00d-00f1eba1f877@leemhuis.info>
 <87sf007ax6.fsf@mail.lhotse>
 <cb038940-63fd-4348-bed2-13e1b2844b92@leemhuis.info>
Date: Mon, 08 Apr 2024 15:20:11 +1000
Message-ID: <87y19obfck.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, Linux kernel regressions list <regressions@lists.linux.dev>, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thorsten Leemhuis <regressions@leemhuis.info> writes:
> On 05.04.24 05:20, Michael Ellerman wrote:
>> "Linux regression tracking (Thorsten Leemhuis)"
>> <regressions@leemhuis.info> writes:
>>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>>> for once, to make this easily accessible to everyone.
>>>
>>> Was this regression ever resolved? Doesn't look like it, but maybe I
>>> just missed something.
>> 
>> I'm not sure how it ended up on the regression list.
>
> That is easy to explain: I let lei search for mails containing words
> like regress, bisect, and revert to become aware of regressions that
> might need tracking. And...
>
>> IMHO it's not really a regression.
>
> ...sometimes I misjudge or misinterpret something and add it to the
> regression tracking. Looks like that happened here.
>
> Sorry for that and the noise it caused!

No worries.

cheers
