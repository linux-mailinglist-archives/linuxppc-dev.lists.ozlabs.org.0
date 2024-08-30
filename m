Return-Path: <linuxppc-dev+bounces-833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B89F096692D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 20:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwS2N2d1Zz30Kd;
	Sat, 31 Aug 2024 04:52:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725043964;
	cv=none; b=GpLASLP1brV+n0isHuYpiTnBL8RBom+n2xs+XY6bmHK4o6WQGT58/TJyO3HVWb2OMiQZtqiYM0EFm6IWmFAcySTyQoo9aowGqgj35+oYxPp8QtRP2RIv2YiqpYDJ7ah2GaBlG3fm2NdIiBHZ73MnRex8mX83bwmFN8Pe1U6Byy1wZ0m2QjKUZm+3u9u18Yt/DU5I0ystDpp/owFHyhmmW9VOszKvhd40V0n+RJbym6OfoZPImA8TFaPcwSZQOtlUuaWWa0fT1E0LiXiChan7S/diIZ5/tE0dVN5rOZh34LVQfcUw1QB1YL1PcXeEGNZPrTrztBw3+P1jXzytAdo7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725043964; c=relaxed/relaxed;
	bh=ixFOCowLbihHuXZkkS8D+oetf/5p26hfwIgu6Bu4264=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=YAlzu0jOgQQxKiMxnl08N+IKu8MmzuokPGvsSvRcL7SngHurqT+ZYySJ0UQfjAz1jjNBS6VEMNi9AwndyFt/i6eQvNB3B0pQYk2jwZyhlnutdFLMyYN8m6M2uPqRDzwN8UTWc9NgBhHnrZ4XzLgoW1cW5jEonaD/h0UvwTSHOAp8k2fRXkqEuIAY4i40fSyUaomzg6KE8YF/PUpxyYZulAxqBerZMxk9nRVRz9uMBMf3qccYZmTaB9/F7SbyiuivVenkSgSnJYgDAfP6imRzrRLd4IfcwaaMq22TAEAUo17ydgQxP0mntLESxdB9uMcFuYvFWSZueXF+fxEl/byk5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwS2N08K9z30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 04:52:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwS2H2zdLz9sSN;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3f9-XC2A1YeT; Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwS2H1wnjz9sSK;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28C2A8B794;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id h0_TT9jQfciA; Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from [192.168.234.133] (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 428938B764;
	Fri, 30 Aug 2024 20:52:38 +0200 (CEST)
Message-ID: <ef38cd36-3e15-4608-8b72-87cf7621cce6@csgroup.eu>
Date: Fri, 30 Aug 2024 20:52:37 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC32
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
 <e7e4c6d36cf98229850c333f113bcea909564501.1725031952.git.christophe.leroy@csgroup.eu>
 <ZtHwnc4AZuRULkom@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtHwnc4AZuRULkom@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 18:17, Jason A. Donenfeld a écrit :
> On Fri, Aug 30, 2024 at 05:57:08PM +0200, Christophe Leroy wrote:
>> @@ -14,6 +14,10 @@ ifeq ($(uname_M),x86_64)
>>   TEST_GEN_PROGS += vdso_test_getrandom
>>   TEST_GEN_PROGS += vdso_test_chacha
>>   endif
>> +ifeq ($(ARCH),powerpc)
>> +TEST_GEN_PROGS += vdso_test_getrandom
>> +TEST_GEN_PROGS += vdso_test_chacha
>> +endif
> 
> FYI, as of [1], you should now be able to add powerpc to the filter list
> instead of having to duplicate a new stanza:
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fcrng%2Frandom.git%2Fcommit%2F%3Fid%3Dbbaae98172ed284fc0d5d39cc0d68f5d06164f06&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4f51736c027a44cc7df908dcc90f46d6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638606314665557021%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=UtLdKTuEaZVhsguKa7kX1TBJ%2BvvQtl7DmU9hSBeThWo%3D&reserved=0

I'm a bit sceptic with that commit. IIUC you are changing the meaning of 
$ARCH. How does that fit with the $ARCH we give when we cross-build or 
with the ARCH which is set by the top-level Makefile in 
tools/testing/selftests ?

Also, wouldn't there be a way to use scripts/subarch.include instead of 
opencoding ?

Afterall, would it be a problem to build it even for i386 ? It should 
now be ignored anyway with your new commit f78280b1a3ce ("selftests: 
vDSO: skip getrandom test if architecture is unsupported")

Christophe

