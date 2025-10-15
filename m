Return-Path: <linuxppc-dev+bounces-12911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33370BDDCFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 11:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmmGj6S8tz3d97;
	Wed, 15 Oct 2025 20:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760521085;
	cv=none; b=aSAkD30HdSDO/dl8R3I2g4W8MmneWpzxXiciOGSC4dDHsmUJBu9vgnWmFTEmsCgYFff3XBGEZjoxORbeUc/YF1SjIRZ/qM0ileK4ycw8YjOz3SXyp8d9RZZ8ZEyv184FvG4T/FaM+r1hB8zTtMilynhY1/SDhEqiEyl510lJFIveMPtaV/z1fTNI4efWZfOyDODzZU/aAvGMWwss+G+bjHaeqnmFlaOnKtuBafQQDiqfD3blSY0kWZWYEJg5h8FJse57JXDk9CiuW2bx59QEvF3b15tsyJB+xzxvdJ9AjeBbgSxquwB9thAsAzKQaOF1yPtxIzYDkdZ/p4HPBY4ZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760521085; c=relaxed/relaxed;
	bh=JvzsfQTSDtQaC7t5oa6u6D3sSXuBAsirytWy/69/Cyg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=ev/suV6Mu4AJFPfcEL0U8irTHaNWJ2WKGFXFs5kR0l+1Mzq7hjhEkR0v32U4yRfzvwq4WoFB6adxY3ZbY+Pt6Tdj5AcFHkynjdVY6mE3SXDVZ1RFHHrdJagy0ANj9iytX9gEgjJGokdZYYHAvn8oKJTwGfrEGyZJTvy4J1UcZkySVSZ5xvm8bxn/3TIcD4XkyLw3GdBN1hDKW36ZpVqrpyjgH3JJKDiD8lG8eGIfeBUpa82g5BHx42fzbrW5ZTqYiFeNVNqHGzkW5CDxTQ0etJvsKrnANyKOrPAvH2QNGk8UiT3zj4VjNZT3jw091966Dw/nSEyOe5yhWlhm6/QfSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3XgwcPK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3XgwcPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmmGh24qKz3d8t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 20:38:03 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso5890419f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521080; x=1761125880; darn=lists.ozlabs.org;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JvzsfQTSDtQaC7t5oa6u6D3sSXuBAsirytWy/69/Cyg=;
        b=X3XgwcPKc6uGTsJHNpQW7zkPs1JIN9UAh62i2i7WpfWrm9u1WOrgMpMfKNkU1wmeD2
         jJdYpE2DfASmfWMgFEBIrLPD5MMgzRFhNz62aem84MDjmShfwhsiLpc3xxPkwhWAbIwd
         JHzdoL3iskJhtdR2d327WuZvZi1LW/mnhDlQFJgl6bO1x3u25kgq91YXiq5U7iys23/p
         8kPBAkKRUqiIyiZvbZvi4sRrI5nGzwDCw6pcJh0qnCxf11X93Thgy+axU01zaLJsvQiK
         +JWB67IUlTha+kjPq+GQ/FlEPytSc8pb8vwB1NE8LH4YYfUrlxLmdUAbHNUBOD6jmrj+
         WenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521080; x=1761125880;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvzsfQTSDtQaC7t5oa6u6D3sSXuBAsirytWy/69/Cyg=;
        b=awJuEMGlNwqTbY1rrPI11Le+7hobq+q/voKAtXLt5DgTUh/mvjx4bq+Lup3n2oL4/M
         ElMv/e4QgOF/XxCicyjraSjNK+hJGrmTK8tXq9/i/4xS7sOBY4Ou1YkoD9k5ZW5JV5Ot
         bF1AkwLMas5LBjDwqt2U7EF7fEZWoEzQYgZDxQfsMcXu2IfegVLBxSpQPCh9XSYWub5z
         pnI/rRv/q5KvAwwmzqd2CplNMXpguhE6v7irN14NUNQgjLwOQ/rS7x7nydjjRM3DU1wX
         p5OFbZJpNmaFl9VRak34co9uS6J4buFzJD2Qau6oaYD2n0WyAxJzcwqAPuSqfdSqJu5a
         sUBg==
X-Gm-Message-State: AOJu0YysQPC09uqqDUn+9wm+IwR8Jw9iHdVoX0ItwXY1X7fhH0hBF9XK
	kPK3L3NsFUOXeBjjN3Qrc+K6qJrBQjwshkrGsNqCxL27eqLlw6V6zXEnk6QFTCkJD2w=
X-Gm-Gg: ASbGncs3zKOERYtdJKxFiwZk7JsScOSWGg+fv4H6nPL+K03az/6lNMZCHovVtUV1GYP
	RSd6u+/TTfoVodkgcSXyGV8Qs8XjcrH0ZU510Vl1bmvceA/oj6odgv3G7xaCIRFdYGrwrtwSP3e
	YTY+CPD13PviSguSMoEA+HQWxiA0PIsQ/3Gd3aBP5hVsOHEWtCuqRUitsU+YQSmPMZxPztDyP14
	N13bWjxU7OE5QJdPVJs8r/LHbqRvd0t1UwG0jM5cKsPsgKQtwB0Qmrcz6idX4dATQpPwNxYXaWA
	M6Rsj5tMrcPE+utMWyqZIQIW+xD7ZXmFQy2tfZVzbCKQ0ldDbirHQDxDxtkvRb6juFk5kINgRsn
	vrf8Z52XPCUxFoFx+Tm9VFdz/uouTvKDk9zncoMD9ClZBqDblePo/o3p1Wz8Ss6jXRB7lRA/+vT
	jiKw==
X-Google-Smtp-Source: AGHT+IFDiJRvObvolQL86xK8Ky80uc00BGpXp/bh1HjV2QFKrNTGVpwo2+WV6HccWddpKwYdOdepNQ==
X-Received: by 2002:a05:6000:461b:b0:426:f40a:7179 with SMTP id ffacd0b85a97d-426f40a729dmr3260449f8f.26.1760521080060;
        Wed, 15 Oct 2025 02:38:00 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426dac8691fsm19569623f8f.50.2025.10.15.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:37:58 -0700 (PDT)
Message-ID: <68ef6b76.5d0a0220.39b228.4064@mx.google.com>
X-Google-Original-Message-ID: <87347kcxou.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,  maddy@linux.ibm.com,  mpe@ellerman.id.au,
  npiggin@gmail.com,  christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc: kgdb: Remove OUTBUFMAX constant
In-Reply-To: <68da3e7e.050a0220.8efdc.f1ab@mx.google.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Mon, 29 Sep 2025
 10:08:29 +0200")
References: <20250915141808.146695-1-mikisabate@gmail.com>
	<68da3e7e.050a0220.8efdc.f1ab@mx.google.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Wed, 15 Oct 2025 11:37:53 +0200
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
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2025-09-29 10:08 +02:

> Miquel Sabat=C3=A9 Sol=C3=A0 @ 2025-09-15 16:18 +02:
>
>> This constant was introduced in commit 17ce452f7ea3 ("kgdb, powerpc:
>> arch specific powerpc kgdb support"), but it is no longer used anywhere
>> in the source tree.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kgdb.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/=
kgdb.h
>> index 715c18b75334..4c0afde87e97 100644
>> --- a/arch/powerpc/include/asm/kgdb.h
>> +++ b/arch/powerpc/include/asm/kgdb.h
>> @@ -25,7 +25,6 @@
>>
>>  #define BREAK_INSTR_SIZE	4
>>  #define BUFMAX			((NUMREGBYTES * 2) + 512)
>> -#define OUTBUFMAX		((NUMREGBYTES * 2) + 512)
>>
>>  #define BREAK_INSTR		0x7d821008	/* twge r2, r2 */
>
> Gently ping :)

Ping again :)

Does anyone have some time to review this patch?

Thanks!
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJlBAEBCgBPFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmjva3EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyFRxtaWtpc2FiYXRlQGdtYWlsLmNvbQAKCRCWvoxv
2J1lZRmOD/4jxbp88nyoKaaxZMI6jdfSN11ofX87AZ1bdwZE6H8xOvz9bSRo+qAn
p50yfjHziWTH+YvrOpLASuhBrsFL0xUPU5ehBiau7tacspdE3q77sp3MjnYVpzNT
nHdg7L6vmxByORA+t6UzDAu8pC0ssfwhTCw7O4Hnu+oLGzEr3n3oRWzgYoJSquOQ
c7DvR78hNvqrH5dViaImr4/tsX3tP8PKQx1y67e2uxhPGZWi0hz465AgYpLHrLyb
lYy1WAZP8FD8tSgz19DXfnQjZDeXy0737PFNaEOocPtLdKuOmvYOAgEFBwKCeGNx
1bYwwOjqcpW+EjgzV9Hho7kIj9S9Tg8IJJB85WUENsOcoB09CpXWotUE1VoSL9gX
2RLR59z3dwha5hAEKn4f8ZEmv6vDqZJzwj7WQYKz/YjhVeviNwNAd34sYpKfs3n2
EIp5BsVjo3K58zQu2Il8EF/5Swb7HyBAPu+kZlFHINIhaKkVIlFba8WVZXkhR71V
/BmOstaniK09rulEOUSUPqzB2oi5gXDaQm0F/D1M9gVAX0J9/QkM0kGyBFi0gDD3
Yp18dXsPmRrUoIDGGyoBZKcdY0cSVLyqnBCWdZCNPj7qwE8Th7hYkVVR2WSAEYli
cNsn/5OLRubHJVTNLo9VCEUhzYJBeDPRlIYrJvi1Lhg+i4onWWQQgg==
=XSBL
-----END PGP SIGNATURE-----
--=-=-=--

