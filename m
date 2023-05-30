Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC6715575
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 08:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVj3J32k2z3f7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 16:21:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XnXZe+ze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XnXZe+ze;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVj1h3nCjz3f7R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 16:20:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85DA8624B9;
	Tue, 30 May 2023 06:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC4CC433D2;
	Tue, 30 May 2023 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685427619;
	bh=7JM6TIUzSDHaVXANRPkAejHNCYBvQS4uGfO38hSUPUI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=XnXZe+ze3R6nJR3EpLWGj/LJGEUu8mnI4vZe8ObqjTykxsHeJTLSyQL+G7TvE4Hjc
	 62xQ4wKCG500kjdyYdnuslCcrMxjWaYamBiDvQKiuvcmhjDNUIn5BoDNoej1p8MRwG
	 H4N+OgabzjP+J+oGbM/2WGegIppJaxCB/V26xEzKmtTABpcnO2Txy+l3ImonzEF5z1
	 5LVAggsJu2BgqDIEiYw101xGYtBG0L9s2CApwgCdka7P4vFcoV7mbxJNrvokmtYjYD
	 hrAsLPj+xP3s0BPypxIL5DFLpUNFPW8XX/j9z3qQyavu+In2IPxzpsgZgTrGReHdeF
	 MVqh5iM847slQ==
Date: Tue, 30 May 2023 11:48:46 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc: Fail build if using recordmcount with binutils
 v2.37
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230529134512.51749-1-naveen@kernel.org>
	<877csqu1qe.fsf@mail.lhotse>
In-Reply-To: <877csqu1qe.fsf@mail.lhotse>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1685427286.zhdwej6x5c.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> Naveen N Rao <naveen@kernel.org> writes:
>> binutils v2.37 drops unused section symbols, which prevents recordmcount
>> from capturing mcount locations in sections that have no non-weak
>> symbols. This results in a build failure with a message such as:
>> 	Cannot find symbol for section 12: .text.perf_callchain_kernel.
>> 	kernel/events/callchain.o: failed
>>
>> The change to binutils was reverted for v2.38, so this behavior is
>> specific to binutils v2.37:
>> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc09c8b42=
021180eee9495bd50d8b35e683d3901b
>>
>> Objtool is able to cope with such sections, so this issue is specific to
>> recordmcount.
>>
>> Fail the build and print a warning if binutils v2.37 is detected and if
>> we are using recordmcount.
>>
>> Cc: stable@vger.kernel.org
>> Suggested-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>> ---
>>  arch/powerpc/Makefile | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index dca73f673d7046..f0540c1f1377c8 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -409,3 +409,11 @@ checkbin:
>>  		echo -n '*** Please use a different binutils version.' ; \
>>  		false ; \
>>  	fi
>> +	@if test "x${CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT}" =3D "xy" -a \
>> +		"x${CONFIG_LD_IS_BFD}" =3D "xy" -a \
>> +		"x$(call ld-ifversion, -eq, 23700, y)" =3D "xy" ; then \
>> +		echo -n '*** binutils 2.37 drops unused section symbols, which record=
mcount ' ; \
>> +		echo 'is unable to handle.' ; \
>> +		echo '*** Please use a different binutils version.' ; \
>> +		false ; \
>> +	fi
>=20
> Thanks for doing this.
>=20
> Masahiro wanted to remove ld-ifversion, he suggested to just check
> CONFIG_LD_VERSION directly instead. Mind doing a v2 with that change?
>=20
> https://lore.kernel.org/all/CAK7LNAQWtDHOs=3DK+qznt5U1WiDv86tChkj4zOer4wt=
VRB974OA@mail.gmail.com/

I have posted a v2 with just that change. Let me know if you are=20
planning to pick up Masahiro's patch above and if you want me to base my=20
changes atop that (just have to add back archprepare/checkbin).


- Naveen

