Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862A8A46DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 04:20:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wfh3cBf0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHrVv2251z3dVr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 12:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wfh3cBf0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHrV852hFz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 12:20:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713147597;
	bh=8o4K5dRyl8sIUjU0EgivmjJC3lGXyfUukYQCR3Ov8pA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wfh3cBf0QS/1UiJCGd9wNTsg4Z3JgU/S53A7sXuE66QjWbiVD9T5UErj+qdU+566N
	 hjbiVLnV+ds0WJ+Ev+xRCLWWsYkNs/ydYleOUGiOgEvXor3j+0XD5ZTGMx7r9XyYx5
	 jn2svY0f1Sry8eWSJqE0BMCHAzNMPGqqW0t7XdRo/lDxhdZw7wJ9e8/OC/PSiEPyk7
	 59A2AycixIle915lKXR/ZEVvbbDPyQIwTiMKuZDpZGbvMmBz2pFKC82F8PzOQcpTbi
	 j7+dgyBZn3vKLSDfhQN2vQw0ZU/QKf2x+gGzusuyAGdNvKz8OxQs5aM4xz/lfB0l96
	 UWGlHWQT/t0iQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VHrV23GDlz4wcr;
	Mon, 15 Apr 2024 12:19:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
In-Reply-To: <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
 <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
 <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
Date: Mon, 15 Apr 2024 12:19:50 +1000
Message-ID: <875xwjcqpl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Thu, Apr 11, 2024, at 11:27, Adrian Hunter wrote:
>> On 11/04/24 11:22, Christophe Leroy wrote:
>>> Le 11/04/2024 =C3=A0 10:12, Christophe Leroy a =C3=A9crit=C2=A0:
>>>>
>>>> Looking at the report, I think the correct fix should be to use=20
>>>> BUILD_BUG() instead of BUG()
>>>=20
>>> I confirm the error goes away with the following change to next-2024041=
1=20
>>> on powerpc tinyconfig with gcc 13.2
>>>=20
>>> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
>>> index 4e18db1819f8..3d5ac0cdd721 100644
>>> --- a/kernel/time/timekeeping.c
>>> +++ b/kernel/time/timekeeping.c
>>> @@ -282,7 +282,7 @@ static inline void timekeeping_check_update(struct=
=20
>>> timekeeper *tk, u64 offset)
>>>   }
>>>   static inline u64 timekeeping_debug_get_ns(const struct tk_read_base =
*tkr)
>>>   {
>>> -	BUG();
>>> +	BUILD_BUG();
>>>   }
>>>   #endif
>>>=20
>>
>> That is fragile because it depends on defined(__OPTIMIZE__),
>> so it should still be:
>
> If there is a function that is defined but that must never be
> called, I think we are doing something wrong.

It's a pretty inevitable result of using IS_ENABLED(), which the docs
encourage people to use.

In this case it could easily be turned into a build error by just making
it an extern rather than a static inline.

But I think Christophe's solution is actually better, because it's more
explicit, ie. this function should not be called and if it is that's a
build time error.

cheers
