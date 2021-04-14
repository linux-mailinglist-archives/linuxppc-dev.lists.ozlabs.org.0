Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3935EA8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 04:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKm1b3r3pz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 12:01:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aLI/RIRO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aLI/RIRO; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKm1865KXz2xYj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 12:01:31 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id a85so12246883pfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 19:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KdzJGtbQKMM6WovwoQdkjGUf5Ve7opMXsRdxXEuGt3o=;
 b=aLI/RIROmUMi3ydioh2HN1kPYgyUQiUlXEBvMHyruO5qAy6N5m2O081qsEqViXebn8
 mtoUBuWkBGyj8c7eyh/iJOtZzrBfQiq2tb1mpjka66qO4C6xCHNyngpEIfG8bcewB17+
 2lGeYWO6FfDybSD+5UcHlvn+SVtLyMJRq0rVQmmPgjliU43e/wk+eMdbWzbCNr2MQgP+
 VoYAT+b+h8x17t4uavo5BxEZVjMTdf6/mXLbLZDFQ/IVHnJyHZqlPqN7FHQeGpcs7kSC
 hJtZm7hzP1v23afXdJAuUnOVOi/XIXu5J3zkjBG02zq+JGAS7KW3ZqY0ihXHoTf0dGEB
 JoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KdzJGtbQKMM6WovwoQdkjGUf5Ve7opMXsRdxXEuGt3o=;
 b=VjwBH1J6772w6BRLqdbJivjJxcoW9WQaQkabvAqMuiXu4KQMd9EoxyD/wqM1P4Gu+R
 aN0e2XeR9lU0NDONO0vfKXPFvvQjl45V8LoiKt/qxdZIQOQFT1EWfxAd3Ab1ZB2jFK6L
 0INGgHOjMmLjiJCn7avtCUD5qP8T3+0zzM3OtjQfKxaeTkAQb3qQAvFBRE0J8LQgyjfL
 q1rVW1HkG3+BOVUGkKiKxGOfdiSR++bUT/rYOrAfTX3ajbYidb9+Btw4pzeGS83R6PLZ
 hXP9fwxGiy430fula5UDaC8aG2kcAaZeBMU9wvNh+5ZNPXpuQWM+27dz30vQrjQt86OP
 ghJw==
X-Gm-Message-State: AOAM530E+GI1gIihlbKca7H8B9za8Rv48s1/knu+chmakGbTZc5PiyG0
 eVqSIxNVtrkRpdEkW7N9Pq0=
X-Google-Smtp-Source: ABdhPJyjMTVIofFw6yPVpUTmU6h8P2cKeEpO2QgNpRYonh3f5mixQfrTzTRCIRkV9uYgNRuKaM1Ixw==
X-Received: by 2002:a63:30c1:: with SMTP id
 w184mr34535722pgw.230.1618365686734; 
 Tue, 13 Apr 2021 19:01:26 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id i18sm5039212pfq.168.2021.04.13.19.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 19:01:26 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:01:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <20210412215428.GM26583@gate.crashing.org>
 <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
 <20210413215803.GT26583@gate.crashing.org>
In-Reply-To: <20210413215803.GT26583@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1618365589.67fxh7cot9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of April 14, 2021 7:58 am:
> On Tue, Apr 13, 2021 at 06:33:19PM +0200, Christophe Leroy wrote:
>> Le 12/04/2021 =C3=A0 23:54, Segher Boessenkool a =C3=A9crit=C2=A0:
>> >On Thu, Apr 08, 2021 at 03:33:44PM +0000, Christophe Leroy wrote:
>> >>For clear bits, on 32 bits 'rlwinm' can be used instead or 'andc' for
>> >>when all bits to be cleared are consecutive.
>> >
>> >Also on 64-bits, as long as both the top and bottom bits are in the low
>> >32-bit half (for 32 bit mode, it can wrap as well).
>>=20
>> Yes. But here we are talking about clearing a few bits, all other ones m=
ust=20
>> remain unchanged. An rlwinm on PPC64 will always clear the upper part,=20
>> which is unlikely what we want.
>=20
> No, it does not.  It takes the low 32 bits of the source reg, duplicated
> to the top half as well, then rotated, then ANDed with the mask (which
> can wrap around).  This isn't very often very useful, but :-)
>=20
> (One useful operation is splatting 32 bits to both halves of a 64-bit
> register, which is just rlwinm d,s,0,1,0).
>=20
> If you only look at the low 32 bits, it does exactly the same as on
> 32-bit implementations.
>=20
>> >>For the time being only
>> >>handle the single bit case, which we detect by checking whether the
>> >>mask is a power of two.
>> >
>> >You could look at rs6000_is_valid_mask in GCC:
>> >   <https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/config/rs6000=
/rs6000.c;h=3D48b8efd732b251c059628096314848305deb0c0b;hb=3DHEAD#l11148>
>> >used by rs6000_is_valid_and_mask immediately after it.  You probably
>> >want to allow only rlwinm in your case, and please note this checks if
>> >something is a valid mask, not the inverse of a valid mask (as you
>> >want here).
>>=20
>> This check looks more complex than what I need. It is used for both rlw.=
..=20
>> and rld..., and it calculates the operants.  The only thing I need is to=
=20
>> validate the mask.
>=20
> It has to do exactly the same thing for rlwinm as for all 64-bit
> variants (rldicl, rldicr, rldic).
>=20
> One side effect of calculation the bit positions with exact_log2 is that
> that returns negative if the argument is not a power of two.
>=20
> Here is a simpler way, that handles all cases:  input in "u32 val":
>=20
> 	if (!val)
> 		return nonono;
> 	if (val & 1)
> 		val =3D ~val;	// make the mask non-wrapping
> 	val +=3D val & -val;	// adding the low set bit should result in
> 				// at most one bit set
> 	if (!(val & (val - 1)))
> 		return okidoki_all_good;
>=20
>> I found a way: By anding the mask with the complement of itself rotated =
by=20
>> left bits to 1, we identify the transitions from 0 to 1. If the result i=
s a=20
>> power of 2, it means there's only one transition so the mask is as expec=
ted.
>=20
> That does not handle all cases (it misses all bits set at least).  Which
> isn't all that interesting of course, but is a valid mask (but won't
> clear any bits, so not too interesting for your specific case :-) )

Would be nice if we could let the compiler deal with it all...

static inline unsigned long lr(unsigned long *mem)
{
        unsigned long val;

        /*
         * This doesn't clobber memory but want to avoid memory operations
         * moving ahead of it
         */
        asm volatile("ldarx     %0, %y1" : "=3Dr"(val) : "Z"(*mem) : "memor=
y");

        return val;
}

static inline bool stc(unsigned long *mem, unsigned long val)
{
        /*
         * This doesn't really clobber memory but same as above, also can't
         * specify output in asm goto.
         */
        asm volatile goto(
                "stdcx. %0, %y1 \n\t"
                "bne-   %l[fail]        \n\t"
                : : "r"(val), "Z"(*mem) : "cr0", "memory" : fail);

        return true;
fail: __attribute__((cold))
        return false;
}

static inline void atomic_add(unsigned long *mem, unsigned long val)
{
        unsigned long old, new;

        do {
                old =3D lr(mem);
                new =3D old + val;
        } while (unlikely(!stc(mem, new)));
}

