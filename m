Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF718A5696
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 17:36:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nsCdW1U5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=s/cIWt86;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJB9Q3GPVz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 01:36:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nsCdW1U5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=s/cIWt86;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.148; helo=fout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJB8Y202Vz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 01:35:55 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id E4015138008C;
	Mon, 15 Apr 2024 11:35:51 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Apr 2024 11:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713195351; x=1713281751; bh=NKyHVd6O5G
	xyMIbK6qGm5hs8jJkIZEH0cqFINvkbpUA=; b=nsCdW1U51jfzeMkyZHn0Fbb0ao
	ikCGQ2m8sEt8IzFsf2Y91pKjA743pr4et54buHMJ18+wfoUyu3+1T7yMo0N3EMsh
	hWjPJIREZSzKTcUCEwZ+QOl5GTgcvtYkLYF8kUBxyhPLhWyBqgrc2SVV9U17rNDy
	uauUhhaFKZCVAoxZz5Ay8zxq6zC5i36nA5JnhbLa/v7qbxKR6I4MkRKkYjADdOwu
	4G7RGEeqWX6T097kMoVwWJ+r5PcR3IIsqplnh0PtQe2jVoqaDAISxlQPXrzetgBj
	MnxKIeEe20mYTZhOWN/bDJRJ7r8ycT0+eC4hE62WUXfgrQ1hKQQ03IJMXb5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713195351; x=1713281751; bh=NKyHVd6O5GxyMIbK6qGm5hs8jJkI
	ZEH0cqFINvkbpUA=; b=s/cIWt866OUPpq+SGeHRpY+cwbQKV7lcLczMsPVcaV/F
	EDnq1h1asCSMTzxemSxR94D2ne4gbYsHdeW+1AE4cLr13usIaEG1EmVhoxDB3rve
	7rnXELuXrBx6N01XziYoAIXPdiiVtB9/rEpj5wwnZEaUXRzeTtT3+8mjFrYxPvaf
	noJ0OL90mNlKaBMKarEqwh4VwXAIXzOaRS+a7BEvH4XRSIRd621Izyrg2gW8Elfo
	yj2nhZYxmIVYNuW5NkjZe5L1JDtE5GxMvxO1iDpmvKbT2qOwIJ4LwbFHFv10qZ3K
	Gcog4XGLOGqSWPm2WqhKCJYrtYPFK11WR1PuT62lLw==
X-ME-Sender: <xms:V0kdZl5-Ks5H4ZIMsueKvNzcseWUdcxlN1bHo3L0FXNmQAsoQ3hquA>
    <xme:V0kdZi5ePkAR-UV1hDdBO-DisyYak1ddjUBzwzTSUMNH0IoJtrRPE_mkO6L2fNfZk
    9Hx0bBdT-m6Ozfx9O8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejvddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:V0kdZsfF8xA-hXd_nvSYSobS20nFGN0x9XjtFi1OVnyGUtW02lPinQ>
    <xmx:V0kdZuJr02V0bjMWLu1OYgLN3jcRy0kJ6DD5ZaM4sJ1lo4Ma5OpIgA>
    <xmx:V0kdZpK_jfoTK42y2-Lb5lgs7xKkOdfc1q9LaoaXqDQWTjQuEfBrNw>
    <xmx:V0kdZnxZ9r8LEj0Ct9uR5wPh--IidebIgB3b5JmFA7rg4QgbW2ftZA>
    <xmx:V0kdZn2NOqZbkoIdGySo0kb7whsiu5YeDLfPLZVeDsnKGEuee0WQkEjg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E9918B6008D; Mon, 15 Apr 2024 11:35:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <e0cf6827-06c2-4212-848c-10d275c75546@app.fastmail.com>
In-Reply-To: <875xwjcqpl.fsf@mail.lhotse>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
 <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
 <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
 <875xwjcqpl.fsf@mail.lhotse>
Date: Mon, 15 Apr 2024 17:35:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Sch
 nelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024, at 04:19, Michael Ellerman wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>> On Thu, Apr 11, 2024, at 11:27, Adrian Hunter wrote:
>>> On 11/04/24 11:22, Christophe Leroy wrote:
>>>
>>> That is fragile because it depends on defined(__OPTIMIZE__),
>>> so it should still be:
>>
>> If there is a function that is defined but that must never be
>> called, I think we are doing something wrong.
>
> It's a pretty inevitable result of using IS_ENABLED(), which the docs
> encourage people to use.

Using IS_ENABLED() is usually a good idea, as it helps avoid
adding extra #ifdef checks and just drops static functions as
dead code, or lets you call extern functions that are conditionally
defined in a different file.

The thing is that here it does not do either of those and
adds more complexity than it avoids.

> In this case it could easily be turned into a build error by just making
> it an extern rather than a static inline.
>
> But I think Christophe's solution is actually better, because it's more
> explicit, ie. this function should not be called and if it is that's a
> build time error.

I haven't seen a good solution here. Ideally we'd just define
the functions unconditionally and have IS_ENABLED() take care
of letting the compiler drop them silently, but that doesn't
build because of missing struct members.

I won't object to either an 'extern' declaration or the
'BUILD_BUG_ON()' if you and others prefer that, both are better
than BUG() here. I still think my suggestion would be a little
simpler.

     Arnd
