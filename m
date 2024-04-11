Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842F8A0916
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:06:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nCoMyMQq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lWfIK3An;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFW263gNbz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:06:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nCoMyMQq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lWfIK3An;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.155; helo=wfhigh4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFW1G6NmKz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:05:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id B7F8C18000E8;
	Thu, 11 Apr 2024 03:05:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Apr 2024 03:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712819113;
	 x=1712905513; bh=0R8ETRF6202lFso/GqWWlr/9xraGDGSFm0XJFifGRw0=; b=
	nCoMyMQq0XWmXVKUNWJxBDvPSDAVJhd0HJr+9THx5qllv2piGTza6F6vc0lb7+Hh
	NOcfPv8+FkB5U1c1Xp2Zef/C1oRsybJz7Fue4j2TCCCtxTJxLW/Fr0XLziS+ofnM
	DzGqvPlcm5J4JgeC6ezccDjj1BYHUrudxEZbeTmBhoeUoLWrSfUTHsfylwbHu4cY
	CzlEXOCrFHrlqdYXYWBxTkjtoxjPTakGnaQHpq/lVoTof2OHQqzL0vbBxIVO1JXH
	0W2QsGe4bXf+u5q89ynFY4hljhg+ovqv8qKunly5D8CeW9RCLQjcTTPEb6+vQVWP
	ssARpsDZVMLTWg+Y3x3kxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712819113; x=
	1712905513; bh=0R8ETRF6202lFso/GqWWlr/9xraGDGSFm0XJFifGRw0=; b=l
	WfIK3Ani950kaPDZ76durVahYSqY9YXccfZ2GtEHt2QMNiQl0QzqpBZtsNg8La4O
	hrVE/UO8tDSkCcXHqHdZUvW+ku4yLwCUIskbeGS8qOCh7u3KWiEfFRffaruRiDVR
	CnEZKM17Zut8zhk61exiVcY66tEXYfDRT9Qt36uaFI/AWC2oHx3ag0IavcbfpMGU
	53jKQqtJk4FYs/7uwI9IEYT0F5wFXaCcWFxYbQ4ovjMgikfEa/MJwpYOsTR10vTU
	Yqb+nPD8aYCoRdNben2Ketdmx2W1FdeI253ZWdiUt1FswIpP9j930vxPUnSz7Cj+
	YsI3n40oan7Oc+ZN9dBRQ==
X-ME-Sender: <xms:qIsXZvxMzFs5hCeZ7qXfi1DutU_SrF5gY3brmqWyVO2mNissf6b9gg>
    <xme:qIsXZnRLbWscdvivXT060IG7Q4KEyYhtxSloItLQd_onIH0KibgRXHHryDdVo5RQT
    uyNXmTi2InWcOsT-x8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:qIsXZpWwow1-0VAoJat2Ec6LvVrv9B7RUkDR4Gd8unFGacMVlWY_ZA>
    <xmx:qIsXZph5lyMdDC90tD9tXDJG_Iyfj7O8dQn0uldYyW2VopR-BHw8Rw>
    <xmx:qIsXZhAaIWNvLUbsVUuEaU00lJNJPyrac_BMgayK57ZmQYmP2wvAYQ>
    <xmx:qIsXZiIVKVqs2W0zkVASfInAWs5AJ_RzZvAcj3v1WngXbbtDqe8DDw>
    <xmx:qYsXZisG0CYvxNoLsrKIzPiqrX8pCxuMrb75Al7-PoYIXvOdoy5-69JC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 18C03B60092; Thu, 11 Apr 2024 03:05:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
In-Reply-To: <20240410153212.127477-1-adrian.hunter@intel.com>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
Date: Thu, 11 Apr 2024 09:04:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Adrian Hunter" <adrian.hunter@intel.com>,
 "Thomas Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024, at 17:32, Adrian Hunter wrote:
> BUG() does not return, and arch implementations of BUG() use unreachab=
le()
> or other non-returning code. However with !CONFIG_BUG, the default
> implementation is often used instead, and that does not do that. x86 a=
lways
> uses its own implementation, but powerpc with !CONFIG_BUG gives a build
> error:
>
>   kernel/time/timekeeping.c: In function =E2=80=98timekeeping_debug_ge=
t_ns=E2=80=99:
>   kernel/time/timekeeping.c:286:1: error: no return statement in funct=
ion
>   returning non-void [-Werror=3Dreturn-type]
>
> Add unreachable() to default !CONFIG_BUG BUG() implementation.

I'm a bit worried about this patch, since we have had problems
with unreachable() inside of BUG() in the past, and as far as I
can remember, the current version was the only one that
actually did the right thing on all compilers.

One problem with an unreachable() annotation here is that if
a compiler misanalyses the endless loop, it can decide to
throw out the entire code path leading up to it and just
run into undefined behavior instead of printing a BUG()
message.

Do you know which compiler version show the warning above?

     Arnd
