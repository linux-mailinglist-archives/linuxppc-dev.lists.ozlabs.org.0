Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F42248A592A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:33:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=pqvMZje2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wwhNsH/P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJDmg5WSmz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=pqvMZje2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wwhNsH/P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJDlr2zn8z3d2m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 03:33:11 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id C7AC513800CA;
	Mon, 15 Apr 2024 13:33:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Apr 2024 13:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713202387;
	 x=1713288787; bh=W5R5rszo1QzxL1sqz3FpOQFoy1Aj3LIoq927ETUHN74=; b=
	pqvMZje2B43dfN4fMbSEVagAMxvQa07Y1euBAzrUc0P/DC8Emr8V4n2v7JyycJkF
	KivkfEjWLxYx2MFmiWcvAH7/Qjyv9uQhLM4pR1UUaFWZrC+oNhI+wsSPjy1LPDeF
	gMOV3Ya7g/djCEacdxTbnh9a50Jt2dFnyNrrccd+rhswjH67l8M8h9Pd7EBQI1Hy
	ZHXKEKSzMObzS8KTdF3XuuJlJfQJ97jCh4UEMABwsTa6PR2gxJaQWLfo7hV+ODip
	yJEVQIuoAZjmGfnOxFk82Uq9svtloPwMPlpx/+NQ6MAGNcphlJepcWSYl9PPQ++8
	2CkfBKdZ1SdIW9mIi8Knnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713202387; x=
	1713288787; bh=W5R5rszo1QzxL1sqz3FpOQFoy1Aj3LIoq927ETUHN74=; b=w
	whNsH/PiMTDFxh5zch+/WibhMWbq7S0NtdAPd0Fz8/5+8bstWyXFeglHomdKoo22
	rERtppVHP9EShB6gy0PEOjIIxG7K5moDFvkna6NIUevTWXMwAPP3ckBNliXOHMwb
	MUnBjEOSjt7e0i5SnxeE8QapqzgnD8zPdeKQVNfy+tLbm/s0nmgV3PVjM0msxSFp
	fMkWeuYEg/nmTqN2wnLkYRy9D2zcwda3RkgnBIuvTc+NZyldmCLrme7fHHWkiIm1
	E8RgL/WZWT4qRBQzdK499MuEctlGF3ceuj3mnSZjyvVeZUhLSJKL74kqNeFLTMK4
	FEs81aZgR/S5bWhAiFZEg==
X-ME-Sender: <xms:0WQdZi_3ls4J_vzAUIV8I7VNu4KJegZNr1xTFeAmDBFilBoJKwT6-A>
    <xme:0WQdZiuVpYHG6VdG-fYbkcS1s7xSURDeYi1InjHkDda-Yt9XL7Xvn92-FXhzE48fj
    kCoi8FYkhvbuHh8GOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejvddgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:0WQdZoB9ibxW7fXa24NyLZIfQER2IkKCfYVGb9j3Ae9SwsF9yowXqg>
    <xmx:0WQdZqfbLsQYN__KTAivLuxpMWKy7d2ZVONFqEKFSSdnX4iWiJfATw>
    <xmx:0WQdZnNUgy1ugPHqcJqnJCcbk1R67E-XOwqAFA-YcWxmX7GMNNYOxQ>
    <xmx:0WQdZknjtHMP2lwmWzWpMlwXWt3df68wyHmuEHb5FOhmudR8WWIBxA>
    <xmx:02QdZkZANasghWtywFqfCjw-aakwo47jErW8NHt1-ndbcsNTQsRwdTaC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2F88AB60092; Mon, 15 Apr 2024 13:33:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <fcc44b2a-4540-435f-aa93-8e36903ccc2b@app.fastmail.com>
In-Reply-To: <a87bed5b-edb7-4ba2-bdd1-88fcd1da7b69@csgroup.eu>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
 <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
 <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
 <875xwjcqpl.fsf@mail.lhotse>
 <e0cf6827-06c2-4212-848c-10d275c75546@app.fastmail.com>
 <a87bed5b-edb7-4ba2-bdd1-88fcd1da7b69@csgroup.eu>
Date: Mon, 15 Apr 2024 19:32:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Adrian Hunter" <adrian.hunter@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Sch
 nelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024, at 19:07, Christophe Leroy wrote:
> Le 15/04/2024 =C3=A0 17:35, Arnd Bergmann a =C3=A9crit=C2=A0:
>>=20
>> I haven't seen a good solution here. Ideally we'd just define
>> the functions unconditionally and have IS_ENABLED() take care
>> of letting the compiler drop them silently, but that doesn't
>> build because of missing struct members.
>>=20
>> I won't object to either an 'extern' declaration or the
>> 'BUILD_BUG_ON()' if you and others prefer that, both are better
>> than BUG() here. I still think my suggestion would be a little
>> simpler.
>
> The advantage of the BUILD_BUG() against the extern is that the error=20
> gets detected at buildtime. With the extern it gets detected only at=20
> link-time.
>
> But agree with you, the missing struct members defeats the advantages =
of=20
> IS_ENABLED().
>
> At the end, how many instances of struct timekeeper do we have in the=20
> system ? With a quick look I see only two instances: tkcore.timekeeper=20
> and shadow_timekeeper. If I'm correct, wouldn't it just be simpler to=20
> have the three debug struct members defined at all time ?

Sure, this version looks fine to me, and passes a simple build
test without CONFIG_DEBUG_TIMEKEEPING.

    Arnd

diff --git a/include/linux/timekeeper_internal.h b/include/linux/timekee=
per_internal.h
index 84ff2844df2a..485677a98b0b 100644
--- a/include/linux/timekeeper_internal.h
+++ b/include/linux/timekeeper_internal.h
@@ -124,7 +124,6 @@ struct timekeeper {
        u32                     ntp_err_mult;
        /* Flag used to avoid updating NTP twice with same second */
        u32                     skip_second_overflow;
-#ifdef CONFIG_DEBUG_TIMEKEEPING
        long                    last_warning;
        /*
         * These simple flag variables are managed
@@ -135,7 +134,6 @@ struct timekeeper {
         */
        int                     underflow_seen;
        int                     overflow_seen;
-#endif
 };
=20
 #ifdef CONFIG_GENERIC_TIME_VSYSCALL
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 4e18db1819f8..17f7aed807e1 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -195,7 +195,6 @@ static inline u64 tk_clock_read(const struct tk_read=
_base *tkr)
        return clock->read(clock);
 }
=20
-#ifdef CONFIG_DEBUG_TIMEKEEPING
 #define WARNING_FREQ (HZ*300) /* 5 minute rate-limiting */
=20
 static void timekeeping_check_update(struct timekeeper *tk, u64 offset)
@@ -276,15 +275,6 @@ static inline u64 timekeeping_debug_get_ns(const st=
ruct tk_read_base *tkr)
        /* timekeeping_cycles_to_ns() handles both under and overflow */
        return timekeeping_cycles_to_ns(tkr, now);
 }
-#else
-static inline void timekeeping_check_update(struct timekeeper *tk, u64 =
offset)
-{
-}
-static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *t=
kr)
-{
-       BUG();
-}
-#endif
=20
 /**
  * tk_setup_internals - Set up internals to use clocksource clock.
@@ -2173,7 +2163,8 @@ static bool timekeeping_advance(enum timekeeping_a=
dv_mode mode)
                goto out;
=20
        /* Do some additional sanity checking */
-       timekeeping_check_update(tk, offset);
+       if (IS_ENABLED(CONFIG_DEBUG_TIMEKEEPING))
+               timekeeping_check_update(tk, offset);
=20
        /*
         * With NO_HZ we may have to accumulate many cycle_intervals
