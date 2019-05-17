Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DB21611
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 11:14:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4552fW4RXFzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 19:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nu7BuclZ"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4552dB3vClzDq9m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 19:13:02 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f97so3073684plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=YBX3Ctf16/wbm4bS5USM6KccxnHVIrfjTiW7ZoQCbNI=;
 b=Nu7BuclZ81lu2fN5QpWHsZfmDyRmfHGUjMqjhxOJ0IV4dYZAatPzq/oKDvOJCaHYcx
 2wiaLp5/Daq4f7xSESP6pbfZ8axfMHVBa3IA97eMevPG6beaq/L4U2CcPGbFau1LtY0a
 9VOTB6NJsm85Pj/o6tz3GMCysAR5wU962vrOfFI5zY/DHy/5rkG9Z+2gY+qFJP6m43om
 bNn98WAuVytX+HP4fbhn60NM+PZ0W+K5ybRwG6YLRs6yA24LjbwItdQ3C74g1Z7CotQn
 AnQViPhUqxWFRS8K2qNQFOtNNqBEZc8KLXOgfLFWxNY4fNgry9IbAYkdhw2jq7ugKA00
 fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=YBX3Ctf16/wbm4bS5USM6KccxnHVIrfjTiW7ZoQCbNI=;
 b=KNDl0+09BfK0OSiBVlGrglHM2Ay9+FyDbLfwWJMbVYIDL2g1PVQiii9gZAL8ZjrsV6
 8+3RsHeb2TGvpkQo9xoneDrQrhRoY7/9Z7IHyokSfrn2eqmmV5F+IjQsaXr95w1nz8eI
 WBDz0rKxTGKfKW1Vl8eRVOI91R5ol1v0AbXRTfkidtzoiUfJHf+OLZCPXDmut5xnr/Kk
 C/a1tow/gG8uJj71tZdEz4BadTmKNIB5kKAqbhhwFRPr5HGdRrsr5am9+PlNPByFn7AN
 FOSWkhlcv1Pu3Z3knE5EELTh2fHVz/MZul9W0HXLg1650kPrdJdR094tFhlrkl1PYtRH
 eZMA==
X-Gm-Message-State: APjAAAXtQKiNOhD/SAxDThg4Bx+jIdAuKcA/u9kMZcS/CwF1wnv+d4SL
 7SfknM9hDXAMEnD+LOWtvFvZzCIMPXM=
X-Google-Smtp-Source: APXvYqySxMlW6Iwm3XD7qrIGnUEK4L88NESsGA4b6hjX/pckBuzT22A8d5nyIS3pmIrz2F1aeFEwdA==
X-Received: by 2002:a17:902:714e:: with SMTP id
 u14mr49494224plm.218.1558084379267; 
 Fri, 17 May 2019 02:12:59 -0700 (PDT)
Received: from localhost (61-68-212-131.tpgi.com.au. [61.68.212.131])
 by smtp.gmail.com with ESMTPSA id c2sm12941261pfa.18.2019.05.17.02.12.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 02:12:58 -0700 (PDT)
Date: Fri, 17 May 2019 19:12:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64/ftrace: mprofile-kernel patch out mflr
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <20190413015940.31170-1-npiggin@gmail.com>
 <871s13ujcf.fsf@concordia.ellerman.id.au>
 <1557729790.fw18xf9mdt.naveen@linux.ibm.com>
 <87tvdytwo0.fsf@concordia.ellerman.id.au>
 <1557821918.xbleq18bk2.naveen@linux.ibm.com>
 <1557985279.4o349j5g2i.astroid@bobo.none>
 <1557989161.cjlaryiij4.naveen@linux.ibm.com>
In-Reply-To: <1557989161.cjlaryiij4.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558084179.fz93ts375u.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on May 17, 2019 4:22 am:
> Nicholas Piggin wrote:
>> Naveen N. Rao's on May 14, 2019 6:32 pm:
>>> Michael Ellerman wrote:
>>>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>>>>> Michael Ellerman wrote:
>>>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>>>> The new mprofile-kernel mcount sequence is
>>>>>>>
>>>>>>>   mflr	r0
>>>>>>>   bl	_mcount
>>>>>>>
>>>>>>> Dynamic ftrace patches the branch instruction with a noop, but leav=
es
>>>>>>> the mflr. mflr is executed by the branch unit that can only execute=
 one
>>>>>>> per cycle on POWER9 and shared with branches, so it would be nice t=
o
>>>>>>> avoid it where possible.
>>>>>>>
>>>>>>> This patch is a hacky proof of concept to nop out the mflr. Can we =
do
>>>>>>> this or are there races or other issues with it?
>>>>>>=20
>>>>>> There's a race, isn't there?
>>>>>>=20
>>>>>> We have a function foo which currently has tracing disabled, so the =
mflr
>>>>>> and bl are nop'ed out.
>>>>>>=20
>>>>>>   CPU 0			CPU 1
>>>>>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>   bl foo
>>>>>>   nop (ie. not mflr)
>>>>>>   -> interrupt
>>>>>>   something else	enable tracing for foo
>>>>>>   ...			patch mflr and branch
>>>>>>   <- rfi
>>>>>>   bl _mcount
>>>>>>=20
>>>>>> So we end up in _mcount() but with r0 not populated.
>>>>>
>>>>> Good catch! Looks like we need to patch the mflr with a "b +8" simila=
r=20
>>>>> to what we do in __ftrace_make_nop().
>>>>=20
>>>> Would that actually make it any faster though? Nick?
>>>=20
>>> Ok, how about doing this as a 2-step process?
>>> 1. patch 'mflr r0' with a 'b +8'
>>>    synchronize_rcu_tasks()
>>> 2. convert 'b +8' to a 'nop'
>>=20
>> Good idea. Well the mflr r0 is harmless, so you can leave that in.
>> You just need to ensure it's not removed before the bl is. So nop
>> the bl _mcount, then synchronize_rcu_tasks(), then nop the mflr?
>=20
> The problem actually seems to be when we try to patch in the branch to=20
> _mcount(), rather than when we are patching in the nop instructions=20
> (i.e., the race is when we try to enable the function tracer, rather=20
> than while disabling it).
>=20
> When we disable ftrace, we only need to ensure we patch out the branch=20
> to _mcount() before patching out the preceding 'mflr r0'. I don't think=20
> we need a synchronize_rcu_tasks() in that case.

That's probably right.

> While enabling ftrace, we will first need to patch the preceding 'mflr=20
> r0' (which would now be a 'nop') with 'b +8', then use=20
> synchronize_rcu_tasks() and finally patch in 'bl _mcount()' followed by=20
> 'mflr r0'.
>=20
> I think that's what you meant, just that my reference to patching 'mflr=20
> r0' with a 'b +8' should have called out that the mflr would have been=20
> nop'ed out.

I meant that we don't need the b +8 anywhere, because the mflr r0
is harmless. Enabling ftrace just needs to patch in 'mflr r0', and
then synchronize_rcu_tasks(), and then patch in 'bl _mcount'. I think?

Thanks,
Nick

=
