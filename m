Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CC740E77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 12:16:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=go17TU7p;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gu+CZY1l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrctS0xdJz3clc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:16:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=go17TU7p;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gu+CZY1l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 499 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 20:10:49 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qrcm95rdZz3cPR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 20:10:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CBDC43200065;
	Wed, 28 Jun 2023 06:02:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 28 Jun 2023 06:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687946541; x=1688032941; bh=jr
	26aMNCJW0isrXg6UfE/c6yGNQaJhjRzD6v2gyhJiU=; b=go17TU7pTv/88ZkN9V
	azy1f3TEVC4eh2cFjnlQc2THDkHBS+hRIb/NP5smWX8p6PlBu7xeOqAwlNdA81xY
	TUkBeDN7zTDh3o36eA21ZlUjbEU5candTuxAFq3YHskdZd/8uzhKvCwlBRFaGmdd
	aw1DR0kZe/ksoI20WFqSBO+gM8dqlB2IUHdEh7hlP+DT2hdznnJW574L5g0d9Vwg
	D5GtZjfLSEZm7snNwyXu0b74sIjEKF42ZMc7wLhJUDcHtrRk1pCpLasCCyCNEkNH
	gV3ANc4YxQxjgWGLghO3x/mfFHkqhgIEr6KQRrJWV7koAkLG/LAXcn4K1lzvyzUI
	urqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687946541; x=1688032941; bh=jr26aMNCJW0is
	rXg6UfE/c6yGNQaJhjRzD6v2gyhJiU=; b=gu+CZY1l55I1TAbIiJdtfb7gL+Up+
	PXTJtGjBdA7pyur7SHIEFhf45EIjdwgUuG47YxZDuzXjF4zqkDy4OiEdtckEj+KR
	hT3c4gY9Y8Zbs1P5SY8EHl0lfEF5tOTz1ibyRcHsSCjras6I5fLzCyyxANm9O9rU
	FVjvcx80F96DvBDGL+up2UfzkUD00xBJwSuVlTnkAORCl20tNBC0S4IY68yWazFd
	sRTsJIk0gTG0ZZ6ABFprGWXtT33+zqf8wgcxS5IQc5dg10rRJNJvCtnze0zHHTMT
	BP1xXByoUkKMsH9aQ8m1uEdksBkSYB7QcQVWzSEgMwfeR+G/jQ51lOkLA==
X-ME-Sender: <xms:LAWcZED4fNZxTlKrdjBmHxJP-sckGwx35hV9UkqQISEoQIfhRmo-JQ>
    <xme:LAWcZGhPNT2BfytOOn8bcbgj-iEhpLaDXkzpKrTalDsNK6BfgCbkrCcgQAl4ySoEj
    TpHsdXpmtJtJ4PC5BI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddvgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LAWcZHmXSlCpeeyNoZE7_0LnoPbJ74fdoPhH1-tEgZSeUBVdS7LK5g>
    <xmx:LAWcZKygSArf1RXeJy6o-saV1OnxLw5eXJf69NNMxU3YltpCM4robQ>
    <xmx:LAWcZJS1GiS98HbAAxa5aqyjTH6zrMIgmdtULLLD7yJ2KFbTG__paQ>
    <xmx:LQWcZIAyk7e_edqPJYxvNmmrL7ukerO_p8vou2sRrc2B0RKlJg_Qaw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2F7CEB6008D; Wed, 28 Jun 2023 06:02:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <afe5194e-fd49-4cc9-9a8c-e7671c55d664@app.fastmail.com>
In-Reply-To: <d9ffc44c-c4ae-4f01-bc0b-ee5359a24a0a@app.fastmail.com>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
 <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
 <d9ffc44c-c4ae-4f01-bc0b-ee5359a24a0a@app.fastmail.com>
Date: Wed, 28 Jun 2023 12:01:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source file
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, Helge Deller <deller@gmx.de>, x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-snps-arc@lists.infradead.org, ees Cook <keescook@chromium.org>, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 24, 2023, at 16:21, Arnd Bergmann wrote:
> On Sat, Jun 24, 2023, at 15:26, Guenter Roeck wrote:
>> On 6/24/23 02:27, Arnd Bergmann wrote:
>>> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>>>
>>>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>>>> undefined!
>>> 
>>> These all look like old bugs that would be trivially fixed if
>>> anyone cared about sparc.
>>> 
>>
>> Odd argument, given that this _is_ a sparc patch. Those may be old
>> bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.
>
> I think we clearly want to fix the fbdev regression you found, and
> maybe bisect the atomic64_test as well to see if that was caused by
> a recent patch to get it into a working state again.

I have bisected this as well now and sent a trivial fix, see
https://lore.kernel.org/lkml/20230628094938.2318171-1-arnd@kernel.org/

      Arnd
