Return-Path: <linuxppc-dev+bounces-13697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C647C2CE9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 16:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0bjt0gpPz304H;
	Tue,  4 Nov 2025 02:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762185249;
	cv=none; b=iRGgm60o/VMS9gIWnDA/n/ytKTV3d0NYC+6f4qlEEsZN4vOqo5d+5nRDOxoJO+vUbZu8YDWdaEsYh67U9DdH58rYJpB6P1mAgwtsMH1Aa9Bp1XsRIlVFozKqeDN8MYCKfsRI2TcofeLT6NRdK21T6jvGJXFVcBCSgWFW5bo9yZftWXcRWptWhQmF1uHBKsh/ORWECH8S8zdJdVD2D+CS6eafSl9m4cz4Zpspg4dMszPLjMESt5Y9ApEDYlh7qAMvn4xNk1RqAwpDKeuq6xxk7riRIQAM9QY5B/ggLsMUN5kGNfjkC7DGoNRZX7iBv8nuvjHoGy6A4srOU4QPgE81vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762185249; c=relaxed/relaxed;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R3zWMh3FJkA/nZiYHPt3p44IOIEtmZiyCoUczILXp/zLnMez7Pwfn+W5fgxe87+9W2P/hd9CUn/N4iuTb9G5K+LGw7DA9RK/stno04Nu5zGo71zmvavvXpL874fk8QdxfvDItenKoTYeP3qZbbW2qRYaP3qb9bsvCCdn1r2XrfHzZ0Jy4daqG/DOon5TkJt+uDqFMRQMESYPIphG3+BkvbzHdlUfWb18Npf/P6Fz0ScKxKEkmlnlGY7DsHBzUk+MV3xVbj6CqihAc4azX7oOtdC6rVEbLtSzF6dWv4Cftum19Pz0k0eSZ+A4Q64k07DubqnDtEkw7pOJw5GmQGSj4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oCOt/yZx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78T2WGDD; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oCOt/yZx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78T2WGDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0bjr4bRTz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 02:54:08 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762185242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=;
	b=oCOt/yZx3kUvthyRmlZKqoqG4xaLxSanrqzjBuSuGMhK0ADOJIdwmXrgK+thqnkfGMOwZF
	biLdv5N50vZ7OQA9Wz1K+4DGiXnSE0ull+3W6DDwqsKRe7jGwo3hQ9O7xz3mEtCN5xYo6h
	oKBGIuzKxH13tMYYNk49J/fJ7dT9o6meaxM7EmmMHbxFgmenNBMJ4E4mcrA2csMybSs7Iy
	QoraOgR92lpDiilGZjyWrtNCDF7HVmygpfE3Pa7vyhH+DYWdwEfqljn3eAqtC/kr7T45il
	JZvVcxk08oTaX6KlR5tuWm+xg4CmWAC/CmBVVN36FauRUSGSCVviTzGlT01EIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762185242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txiU9nH6NDUg7uu142wjzcZ60uFEUV73O7o0Rd7dqYU=;
	b=78T2WGDDnkw1/Y9Zii0VTpZZRyUxTVak/Sn/59YxAiAkUqWJQ/81eLe+PFGzq/g7O/QzM+
	rkRtAnHeFhncC/CA==
To: Mark Brown <broonie@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nick
 Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson
 <sln@onemain.com>, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
In-Reply-To: <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
Date: Mon, 03 Nov 2025 16:54:01 +0100
Message-ID: <87bjljw1ra.ffs@tglx>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 03 2025 at 15:24, Mark Brown wrote:
> On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Wei=C3=9Fschuh wrote:
>
>> An upcoming change will allocate the datapages dynamically instead of as
>> part of the kernel image. Such pages can only be mapped through
>> 'struct page' and not through PFNs.
>
> I'm seeing some boot failures on some arm64 platforms in -next which are
> bisecting to this patch in -next.  Unfortunately the diagnostics aren't
> super useful, we seem to just stop making progress in userspace with no
> obvious output.  One sample log from the FVP is:
>
>    https://lava.sirena.org.uk/scheduler/job/2036229#L1268
>
> which isn't super instructive.  Not all platforms seem to be affected,
> I've seen this on at least the Arm FVP, Orion O6 and Libretech Renegade
> Elite.  The diagnostics aren't very clear here but given that I'm seeing
> the same issue and bisect result on multiple platforms it seemed worth
> mentioning.  Some platforms do seem fine.

Can you try

    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso

which is rc1 based and only contains the VDSO changes. That might give
us a better hint.

Thanks,

        tglx

