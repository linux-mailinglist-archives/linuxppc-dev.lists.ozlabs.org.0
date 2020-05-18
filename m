Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE81D717D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 09:07:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QVSf2ZHHzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 17:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::10;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=XK5v0ZdL; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QVQY6kstzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 17:05:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589785513;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bz2z+ezuAxQPlwd70d19s66rhuujkYph9UeNaliV0AI=;
 b=XK5v0ZdLA47bhoXZKEn5qhANNEBc9l4ZsihScLEIs+2vr79x0HxhmfjJMunWmcsxLY
 YmUkT8hs8fWgYfW5WzMM/0PwZ30+Ixot9K/s+TGYE5YfTF0y2LatU5JCkBSLnGni553t
 dTLian9nQecEnZ1wOuA4vimIhq2m0iFbC/y///Z94GCSUgdw3e0Af4X8KIT6PEYOp5hg
 /v95/YXxL8VY/QNdhdT9t0OepLtEP3O+5yCQon/cH7AiuU7C8PpJMQLyPZpABoKCdNuX
 xxJGZmzeVUCo8oNIS1ZkFLouua5jazmLilfy8VDtd495XNemlD5zjD9g9aJwnoUWGt5k
 daGQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdxibphwCTlp/FX3SMuy+SEPubIGtsTh3h66jM="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d002:44bc:4552:9145:af4:12ae]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w4I75BIob
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 18 May 2020 09:05:11 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] powerpc/64s: Fix early_init_mmu section mismatch
Date: Mon, 18 May 2020 09:05:11 +0200
Message-Id: <8849AD96-790A-4646-81F0-F6D2E33EC9D2@xenosoft.de>
References: <87mu669d9j.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mu669d9j.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (17E262)
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


OK, thanks.

> On 18. May 2020, at 04:40, Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> =EF=BB=BFChristian Zigotzky <chzigotzky@xenosoft.de> writes:
>> Hi All,
>>=20
>> This patch wasn't included in the PowerPC fixes 5.7-4. Please add it.
>=20
> It's not an important bug. I'll take the patch for v5.8
>=20
> cheers
>=20
>>> On 29 April 2020 at 09:02 am, Nicholas Piggin wrote:
>>> Christian reports:
>>>=20
>>>   MODPOST vmlinux.o
>>>   WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in=

>>>   reference from the function .early_init_mmu() to the function
>>>   .init.text:.radix__early_init_mmu()
>>>   The function .early_init_mmu() references
>>>   the function __init .radix__early_init_mmu().
>>>   This is often because .early_init_mmu lacks a __init
>>>   annotation or the annotation of .radix__early_init_mmu is wrong.
>>>=20
>>>   WARNING: modpost: vmlinux.o(.text.unlikely+0x1ac): Section mismatch in=

>>>   reference from the function .early_init_mmu() to the function
>>>   .init.text:.hash__early_init_mmu()
>>>   The function .early_init_mmu() references
>>>   the function __init .hash__early_init_mmu().
>>>   This is often because .early_init_mmu lacks a __init
>>>   annotation or the annotation of .hash__early_init_mmu is wrong.
>>>=20
>>> The compiler is uninlining early_init_mmu and not putting it in an init
>>> section because there is no annotation. Add it.
>>>=20
>>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>>> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>>> index bb3deb76c951..3ffe5f967483 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>>> @@ -208,7 +208,7 @@ void hash__early_init_devtree(void);
>>>  void radix__early_init_devtree(void);
>>>  extern void hash__early_init_mmu(void);
>>>  extern void radix__early_init_mmu(void);
>>> -static inline void early_init_mmu(void)
>>> +static inline void __init early_init_mmu(void)
>>>  {
>>>      if (radix_enabled())
>>>          return radix__early_init_mmu();
