Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126727F0BF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 07:42:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=knzWty0u;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DIQFr7qO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYdGR03C6z3clY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 17:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=knzWty0u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DIQFr7qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYdFT1SxZz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 17:41:15 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4DCF758099C;
	Mon, 20 Nov 2023 01:41:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 20 Nov 2023 01:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1700462471; x=1700469671; bh=GMBe4W7kCOnfw5jbBsNeYHAQJAqkSPPKMik
	1GPsLD4I=; b=knzWty0u7dMUHPJTocDO+Eyosbs6Z18rdAuAzLqdq5E2yHPCV85
	+vQ4FOwYamhMrvfA5/Ibk7GiCN+oYiXWfiBkwfeuPIlPrIRGgunncL8yHcqlF6kE
	4FRMvNyVm6MxScxOYwdx+exltyriSjV4jSn98n7hK7Nob7IoBP1itxUI37q7AI6j
	iWCVSf9cWLSSruPHJ3uzHLdegH4loKT/aQWWS9IuZ+QARoakKnDNG3K12jx4TQxA
	hPRZByfA2yOPSFHKapuPutwoFcwN0s0yMDIzi5VgtYm5wd7fTd1DSX27iME5eoy+
	W225qmrdUI9FdQZlh+P/+x3KOE2qcPsKHiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700462471; x=1700469671; bh=GMBe4W7kCOnfw5jbBsNeYHAQJAqkSPPKMik
	1GPsLD4I=; b=DIQFr7qOD9de0L1l0sywh3/FI3aPur9q6VhtZ5+JSBoeXMy6y34
	yGcFn7ZHXptMLGa3iS72pFLk7RIlx7HtgZbjVQ0fuYHoh66b0BYs9bRdU6dwxneV
	4BzaAxzZGlqMSbpdOuBZn/yp52KrYVHHJaq2IwAn5WFhX3HfZf+MCuMlhOMRA8qB
	l0Lor1vB9+LP3m8QjbGEasCOzSi80jCBPmY+TewJjDV0wPzAIUfxod6KvS1LN6Nq
	ns/efCREYSNvDhQFEOcdxigj0jW2muwFec6tj2107H2N9Wof7bsXXxty1o97SqhS
	Bw2kAim0dmT/rcNWBShihZ/OI/bqpE4WTIg==
X-ME-Sender: <xms:hP9aZZ1U71oF2cgUYhVYchu8FNZczJwzh9UlAGnW00FyUpiW8RMYuQ>
    <xme:hP9aZQExniwbK4jpTv410rcCd-dsfeczpBx4GlPdR8AnechJor6hXPuJWxeB-gsYb
    ymJ7iBMr9KpmnwI20Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeghedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:hP9aZZ4briH4EEkKNug8qHQ5sn82P8oeDj8QZYSL18Duk0lZ2Mwqug>
    <xmx:hP9aZW0ifYJHMTrFmCM8HhSUeARyHebnCbtY78k558t_HfTBxdECQA>
    <xmx:hP9aZcFa9XrPHqNcdJI-xhbAcxri1Vek6j2mkAWEMwerhvOfNqft7g>
    <xmx:h_9aZflqo8i0dundzmSNt0vmQryl4PCDBRvNNK2H53aYHAryo9b5-w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 73BB9B60089; Mon, 20 Nov 2023 01:41:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <2a7bff92-8e25-4cf7-acf1-8ed054691fd8@app.fastmail.com>
In-Reply-To: <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
 <CAMuHMdU+MMiogx6TcBwxFL7AODZYhiAZpVHiafEBfnRsDaXTog@mail.gmail.com>
 <c441db4c-1851-4b09-a344-377a1684e9b5@huawei.com>
Date: Mon, 20 Nov 2023 07:40:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kefeng Wang" <wangkefeng.wang@huawei.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Brian Cain <bcain@quicinc.com>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Russell King <linux@armlinux.org.uk>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023, at 01:39, Kefeng Wang wrote:
> On 2023/11/20 3:34, Geert Uytterhoeven wrote:
>> On Sat, Nov 18, 2023 at 11:09=E2=80=AFAM Kefeng Wang <wangkefeng.wang=
@huawei.com> wrote:
>>>
>>> -/*
>>> - * Convert a physical pointer to a virtual kernel pointer for /dev/=
mem
>>> - * access
>>> - */
>>> -#define xlate_dev_mem_ptr(p)   __va(p)
>>> -#define unxlate_dev_mem_ptr(p, v) do { } while (0)
>>> -
>>>   void __ioread64_copy(void *to, const void __iomem *from, size_t co=
unt);
>>=20
>> Missing #include <asm-generic/io.h>, according to the build bot repor=
t.
>
> Will check the bot report.

I had planned to pick up the series from=20

https://lore.kernel.org/lkml/20230921110424.215592-3-bhe@redhat.com/

for v6.7 but didn't make it in the end. I'll try to do it now
for v6.8 and apply your v1 patch with the Acks on top.

    Arnd
