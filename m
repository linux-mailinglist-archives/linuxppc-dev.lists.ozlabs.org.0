Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006F1ADB46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 12:41:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Xhd1rgNzDrg6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 20:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493XfS4z0MzDrfw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 20:40:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RVSNO9Gt; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 493XfS3x6Hz8swC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 20:40:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 493XfS3Z9Nz9sSM; Fri, 17 Apr 2020 20:40:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RVSNO9Gt; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 493XfR6xLdz9s71
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Apr 2020 20:39:57 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w65so867409pfc.12
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Apr 2020 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=PDFFH/n6LCWOFPs0x5NzukyfYZTVATY9DWCBcb7BHhk=;
 b=RVSNO9Gtf7jYBAASc6FsIckM8JfJXiiUpQWyYORz0RU9qh1XJZXqggkRQvr9v7ZiFH
 hacy4GYVa7DkdltZ84Q3G1++ozrn9Oj5oyfPmxIQUO1hNau+Q9Rty76uQfcTJiKLQMg+
 fecBRZYnBXp+02DiJ6PYYDV8pQFYg5wdYB5DpKeOmP5DgCo5Ko2V2uWBiquJCbHW6Lqc
 19JnXR0aJeCdUYehHbJ5SAn+gd8WE2EQxl0q77/YdD18aNM+iwPhplx5f0/RJNJUZLDH
 bCHzbl+TGa+yvWy6YemH0OB1Wp8xs8oNlf7yjw+tOC7x6A1KZa7aGBDPCSY2xIlFd/ez
 Xdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PDFFH/n6LCWOFPs0x5NzukyfYZTVATY9DWCBcb7BHhk=;
 b=ADoPM7SbdGO3NkPiHX2d5vD7U8HpoHiECTSV8cfmRcHubQtra9GRDdmxrH3CHTf49H
 1+uVWKHG4DbP7ouQEfLFNOsRtHMCHqG2B+OOJsuMzumkMlEQmZR18NmpdpZi1quqyojG
 g9yXEm4zNDI6CIDy5ZQ+zTKG8bvKEQHY864gBxkBUNyZpMNdFgzVQrYmu9Zk46eEdjYr
 F7hc79S2Fsc1uIVSdkq37YH+WhvE64Dy6T0+gQL7hTPNAs0hDLAtNA6aMfVpN4ocSsD+
 8fXYYL1y+gmklX/uFWFC+JrXJtKGfkWwGuAPhGI9rxi7BnTkM48UYFIU1yARCfhFHVXS
 zmWA==
X-Gm-Message-State: AGi0PuYGLpP86lf81QxVkJPOjh7k5gN00EWSSsZyKotYOWnAptWX2iUd
 d0oXcyBgsEpQxb3F9yakQfc=
X-Google-Smtp-Source: APiQypLlclbj8I8XJGALVYHOLRoNJzjlMUkY1aRZqRVsWdvNYiQO6zFVIGwmY6pZXVi+fGogPfakQA==
X-Received: by 2002:a63:545:: with SMTP id 66mr2401675pgf.66.1587119994226;
 Fri, 17 Apr 2020 03:39:54 -0700 (PDT)
Received: from localhost ([203.87.15.194])
 by smtp.gmail.com with ESMTPSA id e135sm14492116pfh.37.2020.04.17.03.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 03:39:53 -0700 (PDT)
Date: Fri, 17 Apr 2020 20:39:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 09/10] powerpc/64s: Implement KUAP for Radix MMU
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Russell Currey <ruscur@russell.cc>
References: <20190418065125.2687-1-mpe@ellerman.id.au>
 <20190418065125.2687-9-mpe@ellerman.id.au>
 <41c548be-e5f1-c8cb-4cdc-27bf360d3f70@c-s.fr>
In-Reply-To: <41c548be-e5f1-c8cb-4cdc-27bf360d3f70@c-s.fr>
MIME-Version: 1.0
Message-Id: <1587119526.51khzi2lop.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of April 17, 2020 8:10 pm:
>=20
>=20
> Le 18/04/2019 =C3=A0 08:51, Michael Ellerman a =C3=A9crit=C2=A0:
>> Kernel Userspace Access Prevention utilises a feature of the Radix MMU
>> which disallows read and write access to userspace addresses. By
>> utilising this, the kernel is prevented from accessing user data from
>> outside of trusted paths that perform proper safety checks, such as
>> copy_{to/from}_user() and friends.
>>=20
>> Userspace access is disabled from early boot and is only enabled when
>> performing an operation like copy_{to/from}_user(). The register that
>> controls this (AMR) does not prevent userspace from accessing itself,
>> so there is no need to save and restore when entering and exiting
>> userspace.
>>=20
>> When entering the kernel from the kernel we save AMR and if it is not
>> blocking user access (because eg. we faulted doing a user access) we
>> reblock user access for the duration of the exception (ie. the page
>> fault) and then restore the AMR when returning back to the kernel.
>>=20
>> This feature can be tested by using the lkdtm driver (CONFIG_LKDTM=3Dy)
>> and performing the following:
>>=20
>>    # (echo ACCESS_USERSPACE) > [debugfs]/provoke-crash/DIRECT
>>=20
>> If enabled, this should send SIGSEGV to the thread.
>>=20
>> We also add paranoid checking of AMR in switch and syscall return
>> under CONFIG_PPC_KUAP_DEBUG.
>>=20
>> Co-authored-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>=20
> [...]
>=20
>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_=
64.S
>> index 15c67d2c0534..7cc25389c6bd 100644
>> --- a/arch/powerpc/kernel/entry_64.S
>> +++ b/arch/powerpc/kernel/entry_64.S
>=20
> [...]
>=20
>> @@ -594,6 +606,8 @@ _GLOBAL(_switch)
>>   	std	r23,_CCR(r1)
>>   	std	r1,KSP(r3)	/* Set old stack pointer */
>>  =20
>> +	kuap_check_amr r9, r10
>> +
>>   	FLUSH_COUNT_CACHE
>>  =20
>>   	/*
>=20
> I'm having a problem with this check. As you know I implemented the=20
> exact same check in _switch() in entry_32.S. After adding some printk=20
> inside an user_access_begin()/user_access_end() section, I started to=20
> get valid user accesses blocked by KUAP. Then I activated=20
> CONFIG_PPC_KUAP_DEBUG which led me to WARNINGs on this check.
>=20
> This is due to schedule() being called by printk() inside the section=20
> where user access is unlocked. How is this supposed to work ? When=20

Unlocked user access sections are supposed to be very constrained,
I think x86's objtool has a checker to verify nothing much gets
called. Printk shouldn't be.

I was hitting the same assertion and it was because the uaccess
macros were pulling lots of things into the user access region.

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200407041245.6006=
51-1-npiggin@gmail.com/

If that doesn't solve your problem... then now is printk being
called with user access enabled?

Thanks,
Nick
