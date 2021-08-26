Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A93F8A5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 16:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwQdC1zFBz3053
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 00:45:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qDsBtAzZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qDsBtAzZ; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwQcY126jz2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 00:45:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwQcM4Fs8z9sRN;
 Fri, 27 Aug 2021 00:45:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629989108;
 bh=Yvgj96P8jzO/WLiA4Ma9vFBhwR9wArqJyFIIgyBaX3M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qDsBtAzZB9ndvP6w1gYwkh+onugWDBys9e0m0BNwCeKlsy6MnYnmIQdyBm2Wi4PQd
 ZOzjnls36pav9GyXqEeRdNoGRV+NXoJiJdPicxY/T4cznhnXXj71PArYIQ0Bbx4Go0
 XdETWyj/wjgQP/HUftqrudx0GMibRMfO2iJL162jg9CGpx5TCAth1jc7NCMSoI2hSP
 cd/GSi9Aqzfc1QbbwWpEcNcYzHQ/HANNL/H710UYAGrHci2pLI+rxKHNEVt5DDzeV2
 frs5+hy1EG0FLNS1G8/md1omEXUdDEOqRpHQmfy/2cj7f83HM6DmekpQ2N+4ROhibr
 wVJ1ebH90Qrqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
In-Reply-To: <3fad8702-278a-d9f9-1882-6958ce570bcc@csgroup.eu>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
 <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain>
 <87h7fcc2m4.fsf@mpe.ellerman.id.au>
 <3fad8702-278a-d9f9-1882-6958ce570bcc@csgroup.eu>
Date: Fri, 27 Aug 2021 00:45:06 +1000
Message-ID: <87sfyw9sel.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 26/08/2021 =C3=A0 05:21, Michael Ellerman a =C3=A9crit=C2=A0:
>> Nathan Chancellor <nathan@kernel.org> writes:
>>> On Tue, Apr 13, 2021 at 04:38:10PM +0000, Christophe Leroy wrote:
>>>> Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
>>>> flexibility to GCC.
>> ...
>>>
>>> This patch as commit 1e688dd2a3d6 ("powerpc/bug: Provide better
>>> flexibility to WARN_ON/__WARN_FLAGS() with asm goto") cause a WARN_ON in
>>> klist_add_tail to trigger over and over on boot when compiling with
>>> clang:
>
> ...
>
>>=20
>> This patch seems to fix it. Not sure if that's just papering over it tho=
ugh.
>>=20
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/b=
ug.h
>> index 1ee0f22313ee..75fcb4370d96 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -119,7 +119,7 @@ __label_warn_on:						\
>>   								\
>>   			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
>>   				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
>> -				   __label_warn_on, "r" (x));	\
>> +				   __label_warn_on, "r" (!!(x))); \
>>   			break;					\
>>   __label_warn_on:						\
>>   			__ret_warn_on =3D true;			\
>
> But for a simple WARN_ON() call:
>
> void test(unsigned long b)
> {
> 	WARN_ON(b);
> }
>
> Without your change with GCC you get:
>
> 00000000000012d0 <.test>:
>      12d0:	0b 03 00 00 	tdnei   r3,0
>      12d4:	4e 80 00 20 	blr
>
>
> With the !! change you get:
>
> 00000000000012d0 <.test>:
>      12d0:	31 23 ff ff 	addic   r9,r3,-1
>      12d4:	7d 29 19 10 	subfe   r9,r9,r3
>      12d8:	0b 09 00 00 	tdnei   r9,0
>      12dc:	4e 80 00 20 	blr

Yeah that's a pity.

We could do something like below, which is ugly, but would be better
than having to revert the whole thing.

Although this doesn't fix the strange warning in drivers/net/ethernet/sfc.

So possibly we need a CLANG ifdef around the whole thing, and use the
old style warn for clang.

cheers


diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1ee0f22313ee..d978d9004d0d 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -106,6 +106,12 @@ __label_warn_on:						\
 	}							\
 } while (0)
=20
+#ifdef CONFIG_CC_IS_CLANG
+#define __clang_warn_hack(x)	(!!(x))
+#else
+#define __clang_warn_hack(x)	(x)
+#endif
+
 #define WARN_ON(x) ({						\
 	bool __ret_warn_on =3D false;				\
 	do {							\
@@ -119,7 +125,8 @@ __label_warn_on:						\
 								\
 			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-				   __label_warn_on, "r" (x));	\
+				   __label_warn_on,		\
+				   "r" __clang_warn_hack(x));	\
 			break;					\
 __label_warn_on:						\
 			__ret_warn_on =3D true;			\


