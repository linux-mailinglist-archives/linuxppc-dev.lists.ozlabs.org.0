Return-Path: <linuxppc-dev+bounces-12559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AFB999C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 13:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWvtY5QVsz2yxN;
	Wed, 24 Sep 2025 21:36:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758713765;
	cv=none; b=G+AV8nxXgz/XHeKsX8JQicEeJJaLSTRI9bG9AxoibCGgPTfocMZsBnuDWjI/6IPMZuLXOj2q7pIo6QDeX4n9+6p47YKmFVUYzfj0EWAF4o2VQS4EFbCTtxiyJFnuNo8s+YWIHiDWiZ38CJkkwYPNr2aGYMDZbS9L9fkHcq7rK9iyuuCqOHtGLcG3j0I3crM6b1bfoSX5HJrGMI71dFFRRnmCnG+cRWtCuaOvaQmvz62oX2lqSfAZ31utlRjRX+jnD1i92Ye6U0P5XGokx+1RVppRlC+QFnidyTtzwOsaUwga1Ox00turS5HnLl5ySXLdsVzaCqMHXFoWcuQ6UWqf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758713765; c=relaxed/relaxed;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VXPE0/QoJS22Mfsu6TY9DqzA/s8uGRVGweb/IPEYmRqDN0RK4la5POO9BfTzh72lGBbohLl+K6dUPtdC+bYWL7g2dKfiBGI4XjPsIfln0vR2IyOyd9/oV7TytpGZPtXnZozXjMwxK0PDPPac3RrSJQB58LO4opNnHAx0rS3m1b2Tu40OjDZswoQBC3ZrYzjE6+0yNA8FFNQYOjwFPwBisJuYePVgoT0d4PoF51S49TLQ+/KFl562S4KMAm8ePvptnUsTVwM63590V53SEb6ReXEzHOCmjoD0JFKABojkk4tnAmu7l01XyArkmnXrvRexOToq8Tsk33hVtQAJYd+xgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QlOkXOk3; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9aYLxaYQ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QlOkXOk3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9aYLxaYQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWvtT0FYzz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 21:36:01 +1000 (AEST)
Date: Wed, 24 Sep 2025 13:35:22 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758713743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=;
	b=QlOkXOk3wDqFbbFYZsEnlgMHERzf96yJYS0jGCAx8XL84tsLn5ka3PYxS3tS6fRiz4EdFp
	hMUyAsiUILtR8JSw3OgT3Fy0mtO9V6+vyErIQ7UEqbgWogA4ThP02dZ7nQf1bcNUN6oc1E
	qIS9/nd74dV5DEbbsNthzLIIe0mNg8fHArZw72OWjj0HJx2y/wJcXKWq9tADPKUcw2oCa1
	MNgG8SaKpMW/kXFfHB3IGyN4KRzzDdYS8yZwV4AN2CdSs8O+lduKmgKTYpZGvoSsWu5yzJ
	vn9hc+ve1LqLnCQYSUPrJ8WxAuF+cXnlxVYaeRwKdflbaBdk98XsHYzpLwzheQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758713743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JGoQ4hmCfZ/TkMkG/taAm55rt5AIxt1SS2NLziKhmk=;
	b=9aYLxaYQfRDX5WwG1TPEXNPpaVf2pDqro4TeNjcbtq5rkULq+SlNuIn8W8JezYqbHJuTiS
	grPgu4XhzSRIaIAw==
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Message-ID: <c5e28d44-3480-4e28-aff0-5c5cfd1b0632@linutronix.de>
In-Reply-To: <ec0894011cb4403f45ad8b30095cc333edc1e5e6.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de> <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de> <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de> <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de> <ec0894011cb4403f45ad8b30095cc333edc1e5e6.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <c5e28d44-3480-4e28-aff0-5c5cfd1b0632@linutronix.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sep 24, 2025 10:29:00 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> Hi,
>
> On Wed, 2025-09-24 at 10:07 +0200, Thomas Wei=C3=9Fschuh wrote:
>> Sep 24, 2025 09:40:47 John Paul Adrian Glaubitz <glaubitz@physik.fu-berl=
in.de>:
>>
>>> Hi Thomas,
>>>
>>> On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
>>>>> Could you share a version of the series based on top of 6.17.0-rcN fo=
r
>>>>> testing purposes? I would like to test the series on a Sun Netra 240
>>>>> which is based on the UltraSPARC IIIi.
>>>>
>>>> Here is the git branch based on rc4:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linu=
x.git/log/?h=3Db4/vdso-sparc64-generic-2
>>>>
>>>> Does that work for you?
>>>
>>> I'm getting merge conflicts with "vdso/datastore: Allocate data pages d=
ynamically" and
>>> "vdso/datapage: Remove inclusion of gettimeofday.h".
>>>
>>> Can these be skipped?
>>
>> No, these are important.
>>
>> What are you trying to merge?
>> I can probably give you a merge.
>
> I'm using v6.17-rc7 plus all SPARC fixes in Andreas Larsson's linux-sparc=
 for-next branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git/=
log/?h=3Dfor-next

This merged cleanly for me:
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git=
/log/?h=3Dvdso-sparc64-merge


(Only compile-tested)


Thomas

