Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CE26239D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 01:34:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmM1H3Q3CzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 09:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmLzC09YyzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 09:32:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bQzdy8g6; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BmLzB5tp6z9sTR; Wed,  9 Sep 2020 09:32:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmLzB216gz9sTN;
 Wed,  9 Sep 2020 09:32:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599607942;
 bh=KGKOesVtPd6PDAQC1tAaZl1z6ab+oEPIGywREwf0LMM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bQzdy8g6LWmxHQo5c9bWtyivp3pTdGlRwX7kqQVPUQwaQxJIKNnxncEx2iwHjkUep
 BXw62H6f38O1j5q6FMEJ306cL+xWh/dWpdB0G9cTmRKoZZmOP/doVlkkqF+AESbU9f
 +1W6bYGd2AlfKxOxfvYUh5ruAzueYyt9K2hszwKyPUQdWmBu1JlxRN/knYPzYGDt2z
 y00MDpKfKdw43WUpfAT2marJjN4mHFaZCtTBXp3+L9uUjJWNVOMftkJ8IpQCxOuCBE
 920OCqkNpcoQxKe5UTKvdoltbTwG4QC91zisrFgSTRIzo/HR4QzEu8uMjvsccllIzK
 1GWCkSDrQqIQA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
In-Reply-To: <f5ca915b-81b5-aa7b-727e-e43681ab825f@csgroup.eu>
References: <20200908125850.407939-1-mpe@ellerman.id.au>
 <f5ca915b-81b5-aa7b-727e-e43681ab825f@csgroup.eu>
Date: Wed, 09 Sep 2020 09:32:21 +1000
Message-ID: <87h7s7sv3u.fsf@mpe.ellerman.id.au>
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
Cc: msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 08/09/2020 =C3=A0 14:58, Michael Ellerman a =C3=A9crit=C2=A0:
>> When we added the VDSO32 kconfig symbol, which controls building of
>> the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).
>>=20
>> That was because back then COMPAT was always enabled for 64-bit, so
>> depending on it would have left the 32-bit VDSO always enabled, which
>> we didn't want.
>>=20
>> But since then we have made COMPAT selectable, and off by default for
>> ppc64le, so VDSO32 should really depend on that.
>>=20
>> For most people this makes no difference, none of the defconfigs
>> change, it's only if someone is building ppc64le with COMPAT=3Dy, they
>> will now also get VDSO32. If they've enabled COMPAT in order to run
>> 32-bit binaries they presumably also want the 32-bit VDSO.
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Michael, please note that christophe.leroy@c-s.fr is a deprecated=20
> address that will one day not work anymore. Please use the new one=20
> whenever possible.

OK, I had the old one in my ~/.mailrc, fixed now.

cheers
