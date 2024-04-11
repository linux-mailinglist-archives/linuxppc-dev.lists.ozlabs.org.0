Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C688A12EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 13:28:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=k16UMDS3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NPqmVCml;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFcrQ0Qbvz3vbB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 21:28:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=k16UMDS3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NPqmVCml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.150; helo=wfout7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFcqY2yn4z3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 21:27:20 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id ADBF71C00137;
	Thu, 11 Apr 2024 07:27:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Apr 2024 07:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712834834;
	 x=1712921234; bh=HHmF8u/Kgp0w2MiOBXchBKlXBDAOLG0zhFsdn3Q3LKU=; b=
	k16UMDS3YHupSnmwEP0/HA0z1W0kHE8mUnFxzHkqIsGKnqejihmaLKS+ydgZZHPZ
	4k/nfA6B8mGj6p0fe3q7vkhgn+Ft5kLluwBHTZbpzdSU+wi9oe2OfZfgF6nR1Q9w
	NUjaGTPYqJkI69McIYxvmOwMD2F0ZLmG8S/FwlNusmpA66o0fKNa0t574OQ+BNdb
	lmL7X2Qxx84toenW4EYPEQ7Gx6MHJfJBf/CxcVIavumaMnmIXMmgymZPtk2Q0p41
	DjITQCF+YdPpOoU9hHdWEilPrOwsBPfcblfDrRfoEKMVdmIuxootB8arnUUdGlKo
	AiSoKEveNjbKxJ04sRyWag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712834834; x=
	1712921234; bh=HHmF8u/Kgp0w2MiOBXchBKlXBDAOLG0zhFsdn3Q3LKU=; b=N
	PqmVCmlO8qu+ao6PmlZfi7Y24d44/jfZRx5qxQcAoXLlkiCUOasykG+E2JdPz3AZ
	nl5qHdIkvbM8XMASmY5PwAcjKoWD574XPtl7j2flIWHqTMOucjHbASYq9+JaNTXT
	V1t29oYeUFnYMkhjJPZoysmKH4tIkX24d/ciI2xBu6dUAfycWkl2gQD5vhP9jJzH
	BjZQtLLGTw6xJTY+IdtxafZ396fVFhLcz/cb2KCCGploBDTbAXH5WNtk/GXoGgTf
	UgfpTOJkURzvrYBdRLlN4pEl059sxLKC0h1YBsNYbYc5cic0wIeAfGw4rxjyST3t
	HQ1WLOIhvcuLROPRf/xhA==
X-ME-Sender: <xms:EckXZp_JMGVr04CcPO7Zi8vlSysZ4dGB6jHuu9Jmk78K0zYGeoRx-Q>
    <xme:EckXZtvOdPNfmi5oNB1_mZPSAusDzHoHjx5Qvf_oivfbtPfPFNBGAx-qxjaH_0SAX
    iLemeul88EkI1JrL38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EckXZnAt2S3P-B4UONMSL2sxDqEy28T02-OW3kU-0CtPKbnzG3Xzww>
    <xmx:EckXZtdkbuyl5tUZneukUa8ax4-H1O5f2yb3bjfdoHgsoQ2ofnTbqA>
    <xmx:EckXZuPdEX4JvNTAFe0W1u82Yp87aPaFB5jg8pNCdf7OKL_4LSvvsg>
    <xmx:EckXZvkHIKP5vqZVZF1sC-kRvHGTGAIQa3365tAcLRW-xAhSp0JmQw>
    <xmx:EskXZj-lCmKV2uVI2uldem5i9qYjtVjQscgpTn-bkl5DAOWQsRzSqHyn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 05606B60092; Thu, 11 Apr 2024 07:27:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
In-Reply-To: <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
 <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
Date: Thu, 11 Apr 2024 13:26:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Adrian Hunter" <adrian.hunter@intel.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
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

On Thu, Apr 11, 2024, at 11:27, Adrian Hunter wrote:
> On 11/04/24 11:22, Christophe Leroy wrote:
>> Le 11/04/2024 =C3=A0 10:12, Christophe Leroy a =C3=A9crit=C2=A0:
>>>
>>> Looking at the report, I think the correct fix should be to use=20
>>> BUILD_BUG() instead of BUG()
>>=20
>> I confirm the error goes away with the following change to next-20240=
411=20
>> on powerpc tinyconfig with gcc 13.2
>>=20
>> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
>> index 4e18db1819f8..3d5ac0cdd721 100644
>> --- a/kernel/time/timekeeping.c
>> +++ b/kernel/time/timekeeping.c
>> @@ -282,7 +282,7 @@ static inline void timekeeping_check_update(struc=
t=20
>> timekeeper *tk, u64 offset)
>>   }
>>   static inline u64 timekeeping_debug_get_ns(const struct tk_read_bas=
e *tkr)
>>   {
>> -	BUG();
>> +	BUILD_BUG();
>>   }
>>   #endif
>>=20
>
> That is fragile because it depends on defined(__OPTIMIZE__),
> so it should still be:

If there is a function that is defined but that must never be
called, I think we are doing something wrong. Before
e8e9d21a5df6 ("timekeeping: Refactor timekeeping helpers"),
the #ifdef made some sense, but now the #else is not really
that useful.

Ideally we would make timekeeping_debug_get_delta() and
timekeeping_check_update() just return in case of
!IS_ENABLED(CONFIG_DEBUG_TIMEKEEPING), but unfortunately
the code uses some struct members that are undefined then.

The patch below moves the #ifdef check into these functions,
which is not great, but it avoids defining useless
functions. Maybe there is a better way here. How about
just removing the BUG()?

     Arnd

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 4e18db1819f8..16c6dba64dd6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -195,12 +195,11 @@ static inline u64 tk_clock_read(const struct tk_re=
ad_base *tkr)
        return clock->read(clock);
 }
=20
-#ifdef CONFIG_DEBUG_TIMEKEEPING
 #define WARNING_FREQ (HZ*300) /* 5 minute rate-limiting */
=20
 static void timekeeping_check_update(struct timekeeper *tk, u64 offset)
 {
-
+#ifdef CONFIG_DEBUG_TIMEKEEPING
        u64 max_cycles =3D tk->tkr_mono.clock->max_cycles;
        const char *name =3D tk->tkr_mono.clock->name;
=20
@@ -235,12 +234,19 @@ static void timekeeping_check_update(struct timeke=
eper *tk, u64 offset)
                }
                tk->overflow_seen =3D 0;
        }
+#endif
 }
=20
 static inline u64 timekeeping_cycles_to_ns(const struct tk_read_base *t=
kr, u64 cycles);
=20
-static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *t=
kr)
+static u64 __timekeeping_get_ns(const struct tk_read_base *tkr)
+{
+       return timekeeping_cycles_to_ns(tkr, tk_clock_read(tkr));
+}
+
+static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
 {
+#ifdef CONFIG_DEBUG_TIMEKEEPING
        struct timekeeper *tk =3D &tk_core.timekeeper;
        u64 now, last, mask, max, delta;
        unsigned int seq;
@@ -275,16 +281,10 @@ static inline u64 timekeeping_debug_get_ns(const s=
truct tk_read_base *tkr)
=20
        /* timekeeping_cycles_to_ns() handles both under and overflow */
        return timekeeping_cycles_to_ns(tkr, now);
-}
 #else
-static inline void timekeeping_check_update(struct timekeeper *tk, u64 =
offset)
-{
-}
-static inline u64 timekeeping_debug_get_ns(const struct tk_read_base *t=
kr)
-{
-       BUG();
-}
+       return __timekeeping_get_ns(tkr);
 #endif
+}
=20
 /**
  * tk_setup_internals - Set up internals to use clocksource clock.
@@ -390,19 +390,6 @@ static inline u64 timekeeping_cycles_to_ns(const st=
ruct tk_read_base *tkr, u64 c
        return ((delta * tkr->mult) + tkr->xtime_nsec) >> tkr->shift;
 }
=20
-static __always_inline u64 __timekeeping_get_ns(const struct tk_read_ba=
se *tkr)
-{
-       return timekeeping_cycles_to_ns(tkr, tk_clock_read(tkr));
-}
-
-static inline u64 timekeeping_get_ns(const struct tk_read_base *tkr)
-{
-       if (IS_ENABLED(CONFIG_DEBUG_TIMEKEEPING))
-               return timekeeping_debug_get_ns(tkr);
-
-       return __timekeeping_get_ns(tkr);
-}
-
 /**
  * update_fast_timekeeper - Update the fast and NMI safe monotonic time=
keeper.
  * @tkr: Timekeeping readout base from which we take the update
