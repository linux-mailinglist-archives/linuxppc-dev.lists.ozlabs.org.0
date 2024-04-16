Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7968A69FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:57:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TZBJaeaO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YWD6x8Ms;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJjFT0Pxjz3vfd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=TZBJaeaO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YWD6x8Ms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.144; helo=fout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJjDj3rvbz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 21:56:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id C71911380923;
	Tue, 16 Apr 2024 07:56:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 16 Apr 2024 07:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713268577; x=1713354977; bh=h7Ln9pZ+NP
	UuES0mE7CzS9ETsJon3TNjqsNEMWr/MVg=; b=TZBJaeaOb0soz5m3pqRKVJFAZ6
	6izkxtQ1BDmlqo+a9lvABlWI6XZmJM8qlnZKzuMq8rea5riO39xA3OBN4tiahpGW
	efy9MR+77P2HzmVYrevSldIlU9fc5UEECnXiCA6U7pFSY12n2/ebCjTlIAHLy9DP
	EEPbqNrUOkIeFJxdPC4KEZRDMRcHw5ggujpkUUwlm/y4yZal8urYAuMTYcrewhm4
	8pDsV2/teineypM1QjXrEmEV9etIThOBOBxYp77YVf/8DD/pzewhdiWREj7z8+MX
	8jtSqPRqyYZDdE8wqobU8M1wwApTNcd7Pclztq2XxPE2C+eA4C/iGbND+icQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713268577; x=1713354977; bh=h7Ln9pZ+NPUuES0mE7CzS9ETsJon
	3TNjqsNEMWr/MVg=; b=YWD6x8MsxAjQlo1yywyXxb3v/kbjviAjfzyzz5IMQX7Y
	VJaaE3UTITJwIXJ6e52Eq+zWeAinVDNBWRenMLn64W1dv1iQRd1FWWW/xdy/s6nI
	c1gofNB7RhaIcHjYiqH69J9FJq8wtAKma0mcRbV/dJBAIGGouMFQWC1XemA4Dlyn
	BO2AwB4DkQEJ5tCLA3yoy4+vPOTBgEGWL6zlx5dOYkRuH1Pbjp/22Zy23hlo9n3L
	l5hZUk581ge5R5027gTa7CoEy53TD+Ew9pUYfslcEgC2kCO3NAziKb/agzg5XzCM
	wRNCSDhsIOjafW04RN2r7ImLnCApwjUCyIh21gqBUQ==
X-ME-Sender: <xms:YWceZtbf-_WHpoVzfU21gFsABKry4JZb8IitZfqUBfOJBKNMnPMpFw>
    <xme:YWceZkauljyiD1MeCrigtaDtBFFowPqi2BXKFolY-Z9QhxAKjZlJ4qTYbHAjYT8Tw
    bGneYsrH6C01xbIFLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YWceZv9vo4AHySWT_OZdZsnc4uBjJ-ictSJYEKgQwE-xwrvbmxaXqw>
    <xmx:YWceZro1LUIDNMKlrR6h-juc8AN9RAkY2cSftGwM78qGav_AI7CuXA>
    <xmx:YWceZorAQNt07Imz0vMyVoPhjdGGM53gL2IAbe4FDFglVKL9J0mejQ>
    <xmx:YWceZhSTrDOAKvkeiAbNO8_dDUy--R25lICa1a3kYAz4-ptVKWQBzg>
    <xmx:YWceZjBqMyo36wIOh3Ce_9N3NZFvSm46pPP3yKZ8KbhUmbY8xCDe6ibk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4441BB6008D; Tue, 16 Apr 2024 07:56:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <f7d8cd55-5a14-4391-884f-0b072790fa41@app.fastmail.com>
In-Reply-To: <3d139886-9549-4384-918a-2d18480eb758@app.fastmail.com>
References:  <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
 <3d139886-9549-4384-918a-2d18480eb758@app.fastmail.com>
Date: Tue, 16 Apr 2024 13:55:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on a null
 pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Niklas Schnelle <schnelle@linux.ibm.com>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jeff Xu <jeffxu@chromium.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024, at 13:01, Arnd Bergmann wrote:
> On Tue, Apr 16, 2024, at 11:32, Naresh Kamboju wrote:
>> The Powerpc clang builds failed due to following warnings / errors on the
>> Linux next-20240416 tag.
>>
>> Powerpc:
>>  - tqm8xx_defconfig + clang-17 - Failed
>>  - allnoconfig + clang-17 - Failed
>>  - tinyconfig + clang-17 - Failed
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> I'm not sure why this showed up now, but there is a series from
> in progress that will avoid this in the future, as the same
> issue is present on a couple of other architectures.
>

I see now, it was introduced by my patch to turn on -Wextra
by default. I had tested that patch on all architectures
with allmodconfig and defconfig, but I did not test any
powerpc configs with PCI disabled.

     Arnd
