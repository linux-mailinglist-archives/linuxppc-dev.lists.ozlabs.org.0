Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31C35102C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 09:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9w4K593Wz3bvk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 18:37:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s9ImkgPM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s9ImkgPM; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9w3Q0Y6wz301L
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 18:36:16 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d8so577176plh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CjUH3AHJU1YQ0HR+iRrDx8JQ7g5nBiVeV7G+T4pGohY=;
 b=s9ImkgPM+VJAVEaUhMncDYm4Yo7zRKj2+/DNmOnXiMs5RpoHRJKYG4gZccb0hr7hn0
 9gwY3b7jBbjGjb0vwUmKB/QViob6S2B2QkN3ROnv7wfSDc+y9MxMXkAL3cMwL99WKql9
 hcCYY59KK1mdI38yy4vXIEy+41o6hQOEMpGhe3C/ElINLZaQ+bz9GmTM8MMEYn8MrfQE
 5r4H/IpRp51FhdoqH4B3LRrZVqiH5b39hr+iakcDPUxU1elhsEg/Dn1cNKxtRz+FJI9s
 o/UTYZnBzV5TKlWEnbYCGyTT1NOUK34u0hcckPVtbMSUJyjzWfAEMfh2NZInmY54mPVh
 6QZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CjUH3AHJU1YQ0HR+iRrDx8JQ7g5nBiVeV7G+T4pGohY=;
 b=FGcSDA+DiRGe/OUnEKuaGLD8hclcu4LZ/XbFbieU6My4BeTYSF1cdpZK5RJclqBM4P
 KjZR0jlWxZuhzjy5ZOAQqngeXLQgOiCkD9FrAjMETYhEB22BJhoA5RnURECBVzApqbsh
 qwiEFepLczTjMiKn/5t5Wpr7Soh+8411AbxVjJS15R40sF072a4r6yLaPo8gGLbyWmBK
 g7h3UasWGl53UkjtHs5PujyrpRFLkWBeuxP6DXo1cjhxuDLQGlCpnYABqWz8FxoZ0I+Q
 j1nPnPtj4eQLU7V7bPd4C4wegV1iIYOQ4YpYjufzId1o6RcEeW4WIuyzqMq/rsMDzgnv
 iPOw==
X-Gm-Message-State: AOAM531TCYaQd/vnqgPWV7+veWYkqtmgdzXz52B5eymEmWV8l7rR6/2C
 AVgJxrMnOL3DAXDfUWi2NonDUIFq1kXdpg==
X-Google-Smtp-Source: ABdhPJzJxRDtnoglOSwXYrKm886RBt283Rf5+McZVtbsWSjzCIvCBG6gb0Z5dJKhqhAKc/xmdTu1ZA==
X-Received: by 2002:a17:903:4106:b029:e7:49bd:4266 with SMTP id
 r6-20020a1709034106b02900e749bd4266mr6922120pld.56.1617262572176; 
 Thu, 01 Apr 2021 00:36:12 -0700 (PDT)
Received: from localhost ([1.132.246.127])
 by smtp.gmail.com with ESMTPSA id i10sm5328468pgo.75.2021.04.01.00.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 00:36:11 -0700 (PDT)
Date: Thu, 01 Apr 2021 17:36:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
To: Michael Ellerman <mpe@ellerman.id.au>, Andreas Schwab
 <schwab@linux-m68k.org>
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <87y2e6fu7v.fsf__9754.75274478725$1616992871$gmane$org@mpe.ellerman.id.au>
 <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
 <87r1jyj5e1.fsf@igel.home>
In-Reply-To: <87r1jyj5e1.fsf@igel.home>
MIME-Version: 1.0
Message-Id: <1617262357.w4yq2kiecw.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andreas Schwab's message of March 30, 2021 2:23 am:
> On M=C3=A4r 29 2021, Andreas Schwab wrote:
>=20
>> On M=C3=A4r 29 2021, Michael Ellerman wrote:
>>
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> There is no need for this to be in asm, use the new intrrupt entry wra=
pper.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>> Hopefully this works on a real G5 now, but I couldn't reproduce the
>>>> problem with QEMU.
>>>
>>> It still prevents my G5 from booting.
>>
>> I see differing failures.  What's common is that there is a pause of
>> about 60 seconds before the crash occurs.  It looks like the crash
>> occurs in power4_idle_nap+0x30/0x34.  Unfortuately, the BootX console is
>> too small to see enough.
>=20
> I was now able to see the messages on the VGA console, and the problem
> is actually that the cpus are starting to stall.

This is strange, I haven't been able to figure out what is wrong.

I've been looking at QEMU code and now I'll have to try find a POWER4/5
or PPC970 manual to see what exactly this MSR[POW] thing does and make=20
sure QEMU matches it.

Progress might be slow. Worst case I guess we revert if it can't
be fixed before next merge window.

Thanks,
Nick
