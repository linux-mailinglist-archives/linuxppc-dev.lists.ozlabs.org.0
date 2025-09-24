Return-Path: <linuxppc-dev+bounces-12557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A6B98BF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 10:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWqGF64CNz304f;
	Wed, 24 Sep 2025 18:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758701269;
	cv=none; b=La1C/dKxNKWXvq1dJ83TTa5IyalxW/ehpvYQ7eCqNWwtdndTkxGLuye95n76qPZqTn7OajEShwYxvXZviEAprw7UKHtimyCvWfOU/z31A9E5fTFsrInGSObBKy4XEHEKZRUrnAnBMvEisM+pe+8mXTHCM6t1nsIyeHuMpHHnIZiuzyOLSm7UU8EkNwsBirVyG5fE/n0iUTseXlvGoZCWjjVYTkhJzGVr+xga/BOKofTgr8AyETXPFC+zNBCRIJIUDouaCb4+keToJEBl4B5LO3SA4LOJ5mvjYg3g9R8Tb4brG7Jrd0sGvCP3LMEVSuq8yqdToDxnyh/GedVhKt73EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758701269; c=relaxed/relaxed;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MHvytSnce+kwdgpMrw+LnlKT9Q4Y1GUABSFM0z/o7XRaXKjJSpCwKvfAjM95uzMMUW7zKNzwj5z/8jL+/D0FJfuvJaMggDeylUol/D43Teom2NLp4AjplJSkwUilYYw3tvb6NjIG2ZywmyXZMJw6DdsTnhjxzR2QvbWPhu2Ll/fk9FXvgE+KSpIsxvnhEspkLiYL33Jj09FxQcjV4B5bOvHc4dJ6FdLYQhjyin7eQQRUrzraS5Unx2L3KK+PMkYqfgk4UYoRlFxec6PS9spxYJpVsAVVUSCNw6vytbYwwzICr54J5NDm0s07KK29PDnGJqsFhcyhUdw/zrplVMszfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=31Omeb15; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n9aMu2nr; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=31Omeb15;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=n9aMu2nr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWqGD586Jz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 18:07:48 +1000 (AEST)
Date: Wed, 24 Sep 2025 10:07:36 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758701262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=;
	b=31Omeb15YqChHkBBrePL7NG3JD983FRx11Q5uWT/69RIupuUYdoTYmGARAlJia6NlrrGQN
	5bccvQRhu9NcTZtmvjlgyrvdEj5A1CDs8zthnojoVFXb7nQgs5SpXbO8rV9L4e+rwnpaCO
	ua2jL9ZurCRzeQvEx0XtMCN7QuKSfAfEmHL2Y+sW7stPznDDzQHvTqbRTdGYko3+/T12ye
	j1+Ro5mKKD/7GFoBxJzLa4UvxffzbMiluz2XiPl0kMDb4Rznzr4zg9+LVFIMxv9nAN+P3+
	XSkEVbGVGFCipqBlQpFNsRbuwLO+4Us4XFeGg8YiuoKCqT4LwQxWTqtgvVs2Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758701262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgLVMteIPJ+pMUDeTmzYpa0Om88x4SzL6ygbBAQMfig=;
	b=n9aMu2nrfU7/A2LOU0ndnoE+3K8jSV2X1C4MQa1OTm1DcYDn9hSt6n0FuxlpuJtK/TUJKn
	tCL0hbarV8eUGJBg==
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
Message-ID: <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
In-Reply-To: <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de> <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de> <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
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
X-Correlation-ID: <bea9cc5c-7fc6-4c87-ab78-8232b2bee4dc@linutronix.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sep 24, 2025 09:40:47 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> Hi Thomas,
>
> On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
>>> Could you share a version of the series based on top of 6.17.0-rcN for
>>> testing purposes? I would like to test the series on a Sun Netra 240
>>> which is based on the UltraSPARC IIIi.
>>
>> Here is the git branch based on rc4:
>> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.=
git/log/?h=3Db4/vdso-sparc64-generic-2
>>
>> Does that work for you?
>
> I'm getting merge conflicts with "vdso/datastore: Allocate data pages dyn=
amically" and
> "vdso/datapage: Remove inclusion of gettimeofday.h".
>
> Can these be skipped?

No, these are important.

What are you trying to merge?
I can probably give you a merge.


Thomas

