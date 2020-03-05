Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F92179E63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 04:46:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XxVc60CyzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 14:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rSfUMtia; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XxRt1MC0zDqrq;
 Thu,  5 Mar 2020 14:43:38 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t14so2006959plr.8;
 Wed, 04 Mar 2020 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=zdYFJAQYPzd2AzwPMN//sfZVEDTSJDcH/2PIJgEAvOI=;
 b=rSfUMtiaOCMIOC5yaJJiQ1t1bnNG+8muXDZAEm+gzxvZ7MiOWa/izYQecUOyuP6V58
 42cr708/nZGjs8z2R5F6NLadOXjjQv6KN9IavlpWpucQ6Ks8sIke3Nf1Aj/xZFBNvFBh
 3fZJh2u96lupgHU7iy0EonOGRfIB/kVPiVqAmapQwWsisJsMqR2NxqnmPHfg13THjw4K
 vi5WPxiVJ66rm53sOozlBQSO0+zEljLWTsU8kCPl7yYaROpuuxg5Z7HGYOFjP8rpJXt0
 UoCJGrbu+mYkJgWuUDn/uNYfByqFMYzUrRYrFAK/SWtS8Dn4HlV5wYRXIKhrjCLxD8nW
 bHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=zdYFJAQYPzd2AzwPMN//sfZVEDTSJDcH/2PIJgEAvOI=;
 b=hplNz4Q+8qkrmAKn8+E7uwsKH9uYQaUFfuPrwCCE4HDR6pd2tP36Rbo9ZsMc42uTjF
 QQy2KQXxbhTBcAGrh5xXVtJJ+HWy7upRTq09vJ339qizQ3EqpW81/VE69GMDBfCBoPiI
 H5KjNJTgeLW+PilsKBLRbeOJLUnUDi3cyD0ZS9JoA/7pfA45hdAag/sjk9YIHTlgvNfK
 TOiYmwHPWt6uPLJ5cnRpcSWyJ5NImffx9io47myNW7iNsigXYG5H5O67jQWA7UE2qEXU
 wlx9o1BQuRHP8yyDV6AgS0I/ZP4Xz9SSdVufxwnP+OXNAVBvy9AOy3lhhZA1d+jN3L8c
 uEUw==
X-Gm-Message-State: ANhLgQ2EnWQJ5ch+gA6lyvsC47Ym0D3xdZB/49ZZ1dU6+q1zM9raT/US
 GTl92m1e1gbIvHmUWxwz4xvKcZ1LEM4=
X-Google-Smtp-Source: ADFU+vu7M13B/N8Dmo/dVcVR2G4kV77llg3Zkn5pyYG1oXzz9m+PD5HGGAMe5buvRLqWxqg8hJhnzg==
X-Received: by 2002:a17:902:c085:: with SMTP id
 j5mr6025924pld.257.1583379814400; 
 Wed, 04 Mar 2020 19:43:34 -0800 (PST)
Received: from localhost (60-242-0-37.tpgi.com.au. [60.242.0.37])
 by smtp.gmail.com with ESMTPSA id w17sm29412738pfi.56.2020.03.04.19.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 19:43:33 -0800 (PST)
Date: Thu, 05 Mar 2020 13:43:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/powernv: Wire up OPAL address lookups
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200228031027.271510-1-npiggin@gmail.com>
 <20200228031027.271510-2-npiggin@gmail.com>
 <87v9nlr7dj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87v9nlr7dj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1583379277.x4nb7vp876.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, skiboot@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on March 3, 2020 9:43 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Use ARCH_HAS_ADDRESS_LOOKUP to look up the opal symbol table. This
>> allows crashes and xmon debugging to print firmware symbols.
>>
>>   Oops: System Reset, sig: 6 [#1]
>>   LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA PowerNV
>>   Modules linked in:
>>   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-dirty #903
>>   NIP:  0000000030020434 LR: 000000003000378c CTR: 0000000030020414
>>   REGS: c0000000fffc3d70 TRAP: 0100   Not tainted  (5.6.0-rc2-dirty)
>>   MSR:  9000000002101002 <SF,HV,VEC,ME,RI>  CR: 28022284  XER: 20040000
>>   CFAR: 0000000030003788 IRQMASK: 3
>>   GPR00: 000000003000378c 0000000031c13c90 0000000030136200 c0000000012c=
fa10
>>   GPR04: c0000000012cfa10 0000000000000010 0000000000000000 0000000031c1=
0060
>>   GPR08: c0000000012cfaaf 0000000030003640 0000000000000000 000000000000=
0001
>>   GPR12: 00000000300e0000 c000000001490000 0000000000000000 c00000000139=
c588
>>   GPR16: 0000000031c10000 c00000000125a900 0000000000000000 c00000000120=
76a8
>>   GPR20: c0000000012a3950 0000000000000001 0000000031c10060 c0000000012c=
faaf
>>   GPR24: 0000000000000019 0000000030003640 0000000000000000 000000000000=
0000
>>   GPR28: 0000000000000010 c0000000012cfa10 0000000000000000 000000000000=
0000
>>   NIP [0000000030020434] .dummy_console_write_buffer_space+0x20/0x64 [OP=
AL]
>>   LR [000000003000378c] opal_entry+0x14c/0x17c [OPAL]
>>
>> This won't unwind the firmware stack (or its Linux caller) properly if
>> firmware and kernel endians don't match, but that problem could be solve=
d
>> in powerpc's unwinder.
>=20
> How well does this work if we're tracing opal calls at the time we oops :=
)
>=20
> Though it looks like that's already fishy because we don't do anything
> to disable tracing of opal_console_write().

Yeah we don't do perfectly well in this case still. OPAL itself has
locks in its console paths and some issues with stack reentrancy.
We should do a bit better with cutting out more junk including tracing
from crash paths, so this doesn't fundamentally make things harder.

> I guess I'm a bit wary of adding numerous further opal calls in the oops
> path, I'm sure the opal symbol lookup code is bug free, but still.

There's a few, console write, event poll, reboot, and NMI IPI AFAIK,
so we have to make the opal call path itself robust (it's getting
there).

> Could we instead suck in the opal symbols early on, and search them in
> Linux? I suspect you've thought of that and rejected it, but it would be
> good to document why.

We could, I was thinking we might want OPAL to do something special
with them like add module annotations [OPAL] vs [HOMER] or whatever,
relocate itself after boot if we randomize where it's loaded etc.
but perhaps none of those things really prevent the symbols being
discovered at boot time. I don't know, it was easier? :)

>> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/=
asm/opal-api.h
>> index c1f25a760eb1..c3a2a797177a 100644
>> --- a/arch/powerpc/include/asm/opal-api.h
>> +++ b/arch/powerpc/include/asm/opal-api.h
>> @@ -214,7 +214,11 @@
>>  #define OPAL_SECVAR_GET				176
>>  #define OPAL_SECVAR_GET_NEXT			177
>>  #define OPAL_SECVAR_ENQUEUE_UPDATE		178
>> -#define OPAL_LAST				178
>> +#define OPAL_PHB_SET_OPTION			179
>> +#define OPAL_PHB_GET_OPTION			180
>=20
> Only pull in the calls you need for this patch.

Ah okay I didn't realise that was the policy, makes sense.

Thanks,
Nick
=
