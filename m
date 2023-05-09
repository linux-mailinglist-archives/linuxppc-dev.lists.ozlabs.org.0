Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2069F6FC047
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 09:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFqF603Szz3fLj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q3XVWzGp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFqDD3nZLz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 17:14:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q3XVWzGp;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFqD871kSz4x3g;
	Tue,  9 May 2023 17:14:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683616490;
	bh=EJL+b4IFYIDnLH/KjZVxUNhU6zoAzg6PBQ8Z7fO7HEk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q3XVWzGpjhGQvzL6H2clVvr7Ho+m3fMvADOpek1hOWkhz6ohMHwiOseQwYgckOTFt
	 2HzzZPR6KrlEh+fhca7llCprSpGD6vcb3xx0lcOfeiE8L0QxzAYwh+OrgXwPjCSlKr
	 kt0tYt2HizfTkPFXheJq/q66ADgx9VnUtLf5BeFyb5VBvTV6Ghi0jct94ku5fyOZjl
	 YuwX1TRE3cVS1hgL+1Pn/0bR+8tKr2uWnNXbbNswi6fpeqEzbs1hR5K7ZjVWmCgcyn
	 7Pvj9g8ylodpnhNLDDPnhNCQJAu/Ze53dBGImBykRjgS7yP+CYXEazPsYU6D5Jbz3x
	 z/YoP9vMpwxDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Sasha Levin <sashal@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.3 6/7] powerpc/fsl_uli1575: Allow to disable
 FSL_ULI1575 support
In-Reply-To: <62539831-1f8c-d908-bd7c-2a926702fa7f@infradead.org>
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-6-sashal@kernel.org>
 <62539831-1f8c-d908-bd7c-2a926702fa7f@infradead.org>
Date: Tue, 09 May 2023 17:14:48 +1000
Message-ID: <87jzxix9g7.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> Hi--
>
> Just a heads up. This patch can cause build errors.
> I sent a patch for these on 2023-APR-28:
>   https://lore.kernel.org/linuxppc-dev/20230429043519.19807-1-rdunlap@inf=
radead.org/
>
> Michael, I think this is your area if I'm not mistaken.

Yes. The fix is in my fixes branch as:
  536d948a8dee ("powerpc/fsl_uli1575: fix kconfig warnings and build errors=
")

But I don't think this commit (22fdf79171e8) really warrants going to
stable, it's a nice-to-have but doesn't fix any pressing bugs.

cheers

> On 5/8/23 20:54, Sasha Levin wrote:
>> From: Pali Roh=C3=A1r <pali@kernel.org>
>>=20
>> [ Upstream commit 22fdf79171e8509db54599fd2c05ef0022ee83f5 ]
>>=20
>> ULI1575 PCIe south bridge exists only on some Freescale boards. Allow to
>> disable CONFIG_FSL_ULI1575 symbol when it is not explicitly selected and
>> only implied. This is achieved by marking symbol as visible by providing
>> short description. Also adds dependency for this symbol to prevent enabl=
ing
>> it on platforms on which driver does not compile.
>>=20
>> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Link: https://msgid.link/20230409000812.18904-7-pali@kernel.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/powerpc/platforms/Kconfig | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kco=
nfig
>> index d41dad227de84..608ac0290e3aa 100644
>> --- a/arch/powerpc/platforms/Kconfig
>> +++ b/arch/powerpc/platforms/Kconfig
>> @@ -261,7 +261,9 @@ config CPM2
>>  	  on it (826x, 827x, 8560).
>>=20=20
>>  config FSL_ULI1575
>> -	bool
>> +	bool "ULI1575 PCIe south bridge support"
>> +	depends on FSL_SOC_BOOKE || PPC_86xx
>> +	select FSL_PCI
>>  	select GENERIC_ISA_DMA
>>  	help
>>  	  Supports for the ULI1575 PCIe south bridge that exists on some
>
> --=20
> ~Randy
