Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA888742D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 21:32:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kM/Mma5t;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZEqFDuPW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1YsK41g3z3vgR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 07:32:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kM/Mma5t;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZEqFDuPW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 400 seconds by postgrey-1.37 at boromir; Sat, 23 Mar 2024 07:31:24 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1YrX2htcz3vYk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:31:24 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CA69732000CC;
	Fri, 22 Mar 2024 16:24:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 22 Mar 2024 16:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711139078; x=1711225478; bh=v/zZxMEUwy
	rsOu50oZW1RGy+/TjNPs8E2T2TvPN/4J4=; b=kM/Mma5taCEDtcFsIAKJ/4bAcV
	8csomuDgZ/yXneFO//9V/Ul8XlY0Tg5NLKjpkVe4UjrbfUvt52G6qUu4LIsCX5oa
	7U6y8K9eGoCTq1Y93ULqrt96Yrnr0XIbL4tVPN4CIXxZw78A2KYyuRKxb3n7MSqK
	Xdkv+rwKuvgQh+nuXX0nKrfeEt392iw+sPOuXPA+KQs5D0JHLq6pqUQnXLXZ/Pp1
	KfvXbHBoGgBtoD1S7RKrb9r8aXkHPQqdsQlAuZz3Ynsw5xlZVUUOiAlso1PZmxWT
	fwew/FTqYbDBAmz6hwf8s/8wXvFE5Qc2LH8+n3pvBNopWG67JAvYXFHheeLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711139078; x=1711225478; bh=v/zZxMEUwyrsOu50oZW1RGy+/TjN
	Ps8E2T2TvPN/4J4=; b=ZEqFDuPWXya0h9zVZrULnxwUduLk1b1Qmzy513+P3YBc
	u54DZDez4AYp0gY6Fic83TtGzegqn+2SXJqiWMknWD9/pRB/f6vvpW1eVcuGvN/t
	q1M0iuDfMDzWsmUWuLwTFpOxvNsm6M/dOygrMn/ALn9ifeyN6QpznZ5gXnM0Tk9u
	X+rVmGTuIV0OD2NP7uQ3l366kO/osRgQsPu6Kc55focmKsfKv8afVPnqLutai5gX
	yeUq081AQTdrl5GKLnO1/pwiuhDDN6IkXwjUI/kr4+lnyysbsa4PIXYxf52KsGIJ
	khoGrYmuPvCwMwqltpWj2gY0gzE2TVVWNPQaH5LyHA==
X-ME-Sender: <xms:Ben9ZaKQ8RKa-cyjhQ5WBzKAqA0HzQLdmh2pWGHC5HZSfTiPC5myAg>
    <xme:Ben9ZSI9GjJS9WoBW3Y4aqD9Kb1n8V_0oggHhutp5oqr34uV8dVC4qwDoId0tBaud
    Otfa46tg7F-T3SOG8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtvddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Ben9Zavr0LbgFgqow4rwvEpoh68ikn2AQGu0i33BYyA2zhQnfzx-wQ>
    <xmx:Ben9ZfZlN1uh0G5i0nlIVxxJNLivXNMJOPoNamxiMyjPJQyDkTXzgg>
    <xmx:Ben9ZRYyPSuXjZiPRBHryv62QeMpaHzJrTMtGdXCkpmrERi9Awfi3Q>
    <xmx:Ben9ZbCzPCX7E43sLRvVh_VpdJPl213YS8a8Uia44SF2TxwLI4MPAw>
    <xmx:Bun9ZVrQz6bwZlrVA9Ej5knBJLz21Rdcu5IflN_yY3GU4-O-DaghBg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 520FDB6008D; Fri, 22 Mar 2024 16:24:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <7f854130-e92f-488f-9c56-a65f86b95567@app.fastmail.com>
In-Reply-To: <87f6365f-a40e-4606-baff-170cb8fc48f3@infradead.org>
References: <20240320180333.151043-1-arnd@kernel.org>
 <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
 <87f6365f-a40e-4606-baff-170cb8fc48f3@infradead.org>
Date: Fri, 22 Mar 2024 21:24:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geoff Levand" <geoff@infradead.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for stack usage
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
Cc: Nathan Chancellor <nathan@kernel.org>, Kevin Hao <haokexin@gmail.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024, at 09:34, Geoff Levand wrote:
> On 3/21/24 17:32, Geert Uytterhoeven wrote:
>> --- a/arch/powerpc/platforms/ps3/device-init.c
>>> +++ b/arch/powerpc/platforms/ps3/device-init.c
>>> @@ -770,7 +770,7 @@ static struct task_struct *probe_task;
>>>
>>>  static int ps3_probe_thread(void *data)
>>>  {
>>> -       struct ps3_notification_device dev;
>>> +       static struct ps3_notification_device dev;
>>>         int res;
>>>         unsigned int irq;
>>>         u64 lpar;
>> 
>> Making it static increases kernel size for everyone.  So I'd rather
>> allocate it dynamically. The thread already allocates a buffer, which
>> can be replaced at no cost by allocating a structure containing both
>> the ps3_notification_device and the buffer.

I didn't think it mattered much, given that you would rarely
have a kernel with PS3 support along with other platforms.

I suppose it does increase the size for a PS3-only kernel
as well, while your version makes it smaller.

> Here's what I came up with.  It builds for me without warnings.
> I haven't tested it yet.  A review would be appreciated.

It seems a little complicated but looks all correct to
me and reduces both stack and .data size, so

Acked-by: Arnd Bergmann <arnd@arndb.de>
