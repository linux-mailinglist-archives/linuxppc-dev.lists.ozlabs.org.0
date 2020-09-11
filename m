Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA5266003
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnx0b4SJqzDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 23:09:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnwyF0XhQzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 23:07:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HHWeIF9V; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bnwy94qSTz9ryj;
 Fri, 11 Sep 2020 23:06:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599829620;
 bh=x21mMNzQwjNVHC4uKxnhsEu5JP7jl+CQeVbbOvT5Dh4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HHWeIF9VPAbictf3mXnGeVXmoNLw1N0a1ATY9YMnkJr70ZwyBqpNNdJFt1xCYgWwS
 kNQYQEpwCFD85XBHQ+aRkhjFsGqJ1ZMMXTnvTlD2krX5svi9YVQK9Dl4HmWwVpkL+z
 34b1BvSHS8eGmS8RdbB/9Q98zzyg6gTItNiRtiHxh1btBlgbs2FfJ4OerP23S4FMiz
 0ZLkMLOc1ZaLc1hGN2BlANg5xBiv+uQHm8kX2kfKSF6HF53QP3ZKJvPUvdjANXXMc8
 N1W8IvQAGv+qV7KFY4JbXMRjOtCtaHVQ2SAEC/jJGzPqfqQrpKIy2P8YVZZycZ6a87
 esCjsZWe56AXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/powermac: Fix low_sleep_handler with KUAP and KUEP
In-Reply-To: <d56e42c0-0117-81bb-b583-4944e7bf0383@csgroup.eu>
References: <74472ea2a7e8698273643cde7d382bd9f31cd1dd.1598945727.git.christophe.leroy@csgroup.eu>
 <871rj9rxt1.fsf@mpe.ellerman.id.au>
 <d56e42c0-0117-81bb-b583-4944e7bf0383@csgroup.eu>
Date: Fri, 11 Sep 2020 23:06:53 +1000
Message-ID: <87v9gkqx76.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 11/09/2020 =C3=A0 01:56, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> low_sleep_handler() has an hardcoded restore of segment registers
>>> that doesn't take KUAP and KUEP into account.
>>>
>>> Use head_32's load_segment_registers() routine instead.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Fixes: a68c31fc01ef ("powerpc/32s: Implement Kernel Userspace Access Pr=
otection")
>>> Fixes: 31ed2b13c48d ("powerpc/32s: Implement Kernel Userspace Execution=
 Prevention.")
>>> Cc: stable@vger.kernel.org
>>> ---
>>>   arch/powerpc/platforms/powermac/sleep.S | 9 +--------
>>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>=20
>> Doesn't build? pmac32_defconfig, gcc 9.3.0:
>>=20
>> ld: arch/powerpc/platforms/powermac/sleep.o: in function `core99_wake_up=
':
>> (.text+0x25c): undefined reference to `load_segment_registers'
>>=20
>> Missing _GLOBAL() presumably?
>
> Oops .. :(
>
> v2 sent out.

Thanks.

cheers
