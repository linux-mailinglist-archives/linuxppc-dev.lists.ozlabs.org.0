Return-Path: <linuxppc-dev+bounces-12493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DBB8ECF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 04:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVSB1234pz2yrr;
	Mon, 22 Sep 2025 12:44:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758509065;
	cv=none; b=dFGYNHG+W04KZmfRzk793tX2TNRcnMpEhv1AMbshA9/EfQ/8/ilKaBLd2WJO/FR/QGdLEcTAkU0TL5PwSeLM4vHM9SusMc4b/TmHAYVS6sfPdVJQ7gaBu4u2jxjwQCHTLpezwE7/7DzumJZ4pTIB08M40aQG5lo0nw0ooIY+THaR4mHaHzzxKl8OfMbWLLLCw0ADlPYyJPZMVuCs8nhtaPJje3uJ30wjXZVdFxMEudsOqe7IIr1HnYKVQ2B2wHxql8DBqFqjyt3NBBpp/E16hq3W/H8RBTZSTE9D9ngnbG8ZFGgpQLB+9pzVSyNXCjH6Yxf+LrRSJjJHKJ782m/puw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758509065; c=relaxed/relaxed;
	bh=i9vAa0AsWTqSQzz6uFyc7VXVf8ZJ7QlTL9Ja3Bg/hgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cBqoV6Ju0o3ogySJZ8tN/zCY6DZyjmPVn/VtC9V5+O37moiQuKmFJqH21LwoRj3wXczPgjzLzeiCPPsYTHeMZLbab/qxplJSTDM+PIBng6bRma/jHNUDQTCZYjmW9GKr+P0z9ZuANWh0ogKz+5/Anr826enuLHmCYXkTXz1yDC9rJnfxWUdJ/qgTrtXA/anhk+Qoc15vNMrOjAf1AebS0zcUAigVNh48pFc6NmFkNM2NtunMWcJOMG5QBQU8W2k1HVmMmvpB55NKtaSfXkQuN96HCiBMCQVWjJYKFhbq8nRvBWrfBtb/+YDyg5u1cSnnUutkSkraw7VyW+QhZTCmHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kgX4zQG9; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kgX4zQG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mpe@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVSB04D5zz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 12:44:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA674601DC;
	Mon, 22 Sep 2025 02:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8F6C4CEE7;
	Mon, 22 Sep 2025 02:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758509061;
	bh=i9vAa0AsWTqSQzz6uFyc7VXVf8ZJ7QlTL9Ja3Bg/hgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kgX4zQG9Ggek7o49bHXrtRIo5kLI9byQA1VGrO0g2NhIfgF+O7g3DmNB4VQlWu1RU
	 rvn5Ng1I/gwc6uqXQlAM/GSftBSoRv2cs1GgW98+sggq0LEaVHB/4xzRlQDOEBTq1V
	 1JYbrUBIXkWzk+Fxrb0Sh9GHTmuk2EE+mV4Erfh9IKaJWfsdSPKF2RmfatCJ5ey+OJ
	 pKeM2giE9tz2rFVxxjrnv7iaAggC9I9+OA/rkyeZeNdXzU1EZLtTCagulCOYZflJrI
	 fxVswkLQWeowr2MiQl8Ix33L2RboXxqNbIRe1zX9vbj1iHayNHW05Rw5FrDBFRHP5w
	 e32O7vOprApgQ==
From: Michael Ellerman <mpe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas =?utf-8?Q?Wei?=
 =?utf-8?Q?=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Nick
 Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, Stephen
 Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include
 asm/cputable.h and asm/feature-fixups.h
In-Reply-To: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
Date: Mon, 22 Sep 2025 12:44:18 +1000
Message-ID: <m1348fmcjh.fsf@mpe.ellerman.id.au>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 17/09/2025 =C3=A0 16:00, Thomas Wei=C3=9Fschuh a =C3=A9crit=C2=A0:
>> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
>> asm/feature-fixups.h. Currently these headers are included transitively,
>> but that transitive inclusion is about to go away.
>
> Hum ...
>
> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make=20
> POWER10 and later use pause_short in cpu_relax loops")
>
> In theory, vdso/ headers shouldn't include any headers outside of vdso/

Oops, looks like that was my fault.

It's expected that there can be feature fixups needed in the VDSO,
vdso_feature_fixups() handles them, so that's OK. But the headers
pulling from outside vdso is a pity.

Still this patch is fine as-is.

cheers

