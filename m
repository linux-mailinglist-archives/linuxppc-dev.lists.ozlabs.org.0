Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49A1DC526
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 04:25:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SD4J4ThJzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 12:25:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IrnxyqvZ; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SD2P3FxKzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 12:23:57 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n11so2375991pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 19:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9wjmVCWaFtCwqRwQwYzqmxHvgYpUwusJj7shClMWz10=;
 b=IrnxyqvZ+CkgfUcMnsjjfRX3p1YhaOHF1jvmol/quHdHghpmkI7kQwKYf+DkaWkwln
 kWU9ZUJxZr8r4T9G0IH4TS/VbLDQiU45hzWihQvUkjc9I11DcKdqEzjuhTGEA4A72K71
 wZ3Kl9XR4s8d2nYNZSOQxRQyIpgbHU0HEh9AloQvybrbajXAlx8/D0zJrze3N29N3bu3
 ZAl0ggcZOQXEtYcksHX4un28rUC1PDvcnj8Ct01J19/TAI7ae8N2PEjlvGVh2YCeopJN
 VupUpk5EtSrj8ubMEaq+A+cpCX+vactmcgj+zG6f9Sk3fBfid+PyL9aRwY7yYgyaJgJY
 AYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9wjmVCWaFtCwqRwQwYzqmxHvgYpUwusJj7shClMWz10=;
 b=Gulw/I1YP7mygLYn6QLKPDOABCm0oaThHquFvyk9Z1LCt597xEJJW7cWprcqShScLG
 XcePU7P+tYRTq2XVU8pgVIXBuBtyl3UdkuxzH6H6Md25w/dQtQZxEAPJ6lBqRHneKJMX
 HTT515QkJZC4FMzRZxc7WOTeSVLMMWP4CTghfy4TD6dnuoJhlbC+y0hH7aRzOpjmMDkC
 /bpRoAwhedN/GqIux6Dx2sJPR3Q3Wk9SyOgGn6AJFydX2LhtE14oKF2TrcuTBmICm8u+
 LUZHuLXrOQv+Bhsf3BAY6gC4uh2/SP2GJpY2qJ4qN9L5bEtadpzyGRu3zJEJDqL8r4WL
 PmHQ==
X-Gm-Message-State: AOAM532WVP6jr5yAx0jRpveoCbBVIxliK1GvdoyxBeC8H31dCb2GSI/d
 Q2a2d6LvXy/Sl2hWEfUtcOuY87gv
X-Google-Smtp-Source: ABdhPJyf+1uHcrEIfunTDXpZrDaHu7GffakTFK9eMcy2Q8MeBuagKNT8VJlUQAhnjgHP67471O0d0w==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr6521813pgb.177.1590027833869; 
 Wed, 20 May 2020 19:23:53 -0700 (PDT)
Received: from localhost ([124.170.14.63])
 by smtp.gmail.com with ESMTPSA id 98sm3049301pjo.12.2020.05.20.19.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 19:23:53 -0700 (PDT)
Date: Thu, 21 May 2020 12:23:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELF V2 ABI for big-endian
 kernels
To: Michael Ellerman <mpe@ellerman.id.au>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <20200429011959.1423180-1-npiggin@gmail.com>
 <87eerhagyd.fsf@mpe.ellerman.id.au>
 <20200518121917.GJ31009@gate.crashing.org>
In-Reply-To: <20200518121917.GJ31009@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1590021606.pn09h4pdi3.astroid@bobo.none>
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

Excerpts from Segher Boessenkool's message of May 18, 2020 10:19 pm:
> Hi!
>=20
> On Mon, May 18, 2020 at 04:35:22PM +1000, Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> > Provide an option to build big-endian kernels using the ELF V2 ABI. Th=
is works
>> > on GCC and clang (since about 2014). it is is not officially supported=
 by the
>> > GNU toolchain, but it can give big-endian kernels  some useful advanta=
ges of
>> > the V2 ABI (e.g., less stack usage).
>=20
>> This doesn't build with clang:
>>=20
>>   /tmp/aesp8-ppc-dad624.s: Assembler messages:
>>   /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_set_encryp=
t_key does not evaluate to a constant
>=20
> What does this assembler code that clang doesn't swallow look like?  Is
> that valid code?  Etc.

The .size directive calculation is .text - .opd because the preprocessor=20
isn't passing -mabi=3Delfv2 which makes our _GLOBAL function entry macro=20
use the v1 convention. I guess I got the 64-bit vdso wrong as well, it=20
should remain in ELFv1.

Thanks,
Nick
