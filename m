Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D70377C13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdrF86zMlz3046
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:07:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Uyv+Ky9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Uyv+Ky9Y; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdrDj4rgVz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 16:07:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FdrDc1W18z9vFs; Mon, 10 May 2021 16:07:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FdrDb1mY2z9vFm;
 Mon, 10 May 2021 16:07:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620626832;
 bh=Yzja3K7uRIUABi7GBIX5dL62HoAN6D1O9BQnvdraIZ4=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Uyv+Ky9Ypc+QjAGa7FmtzxRXPfO6bhbA5xeXTUbLMamBTDGAuZpCOxWxMA7I5vzbw
 t88XKIHDRelacp9MrKd2XYKLf1NqbVo6DixuBWaVpV9dDu6vSWwVJgzKrm9CBV2xms
 sVSDwuM7HuDZLP8S2E/K/B+IK/TceMMDD4Zega+T1buYDWL8SOsxxjmzLZo9Gq67tm
 xtUWIjBxa0pX4k7XjN0u+LF9zrxwdqVCQdT2br7RMt2G8hUxoQbz4VWzMSyqXUsyQb
 cN8PjturEjoUl/z0Q1MdLd940eXKEDkH6ochw9k+FYforGB42h5gsAz6w1tWyVe5eJ
 52lQOCJzP6ahQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Kernel crosscompilers
In-Reply-To: <1bf8523a-848a-7686-c179-7bedb18979ac@csgroup.eu>
References: <be7c92b2-43c2-0d8a-6e8c-ac92e7e07bfc@csgroup.eu>
 <CAK8P3a3OdcSQQGKxRob3A6qfh8tVD1JtLdcTp9i25SizqWpiXA@mail.gmail.com>
 <19e791d9-3226-4c13-b6e8-cdabdaaa0268@csgroup.eu>
 <1bf8523a-848a-7686-c179-7bedb18979ac@csgroup.eu>
Date: Mon, 10 May 2021 16:07:06 +1000
Message-ID: <87v97rxgtx.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 08/05/2021 =C3=A0 08:46, Christophe Leroy a =C3=A9crit=C2=A0:
>> Le 06/05/2021 =C3=A0 16:17, Arnd Bergmann a =C3=A9crit=C2=A0:
>>> On Thu, May 6, 2021 at 2:42 PM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>> Hello Arnd,
>>>>
>>>> May I ask you whether you plan to build cross compilers based on GCC 1=
1.1 at
>>>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?
>>>
>>> Hi Christophe,
>>>
>>> I've built a snapshot a few days before the release, that one is
>>> identical to 11.1
>>> except for the reported version number. I've tried to ask around for
>>> help testing
>>> this, but so far I have not heard from anyone.
>>>
>>> Building a new set of compilers takes around a day on my build box, so =
I want
>>> to make sure I don't have to do it more often than necessary. If you ar=
e able
>>> to give the binaries a spin, preferably on a ppc64le or arm64 host, ple=
ase let
>>> me know how it goes and I'll rebuilt them on the release tag.
>>>
>>=20
>> Hi Arnd,
>>=20
>> I don't have any ppc or arm host I can build on.
>> I'm building on x86 for powerpc embedded boards.
>>=20
>> I have tried your GCC 11 snapshot, I get something booting but it crashe=
s when launching init.
>>=20
>> [=C2=A0=C2=A0=C2=A0 7.368410] init[1]: bad frame in sys_sigreturn: 7fb2f=
d60 nip 001083cc lr 001083c4
>> [=C2=A0=C2=A0=C2=A0 7.376283] Kernel panic - not syncing: Attempted to k=
ill init! exitcode=3D0x0000000b
>> [=C2=A0=C2=A0=C2=A0 7.383680] CPU: 0 PID: 1 Comm: init Not tainted 5.12.=
0-s3k-dev-16316-g9e799d5df185 #5054
>> [=C2=A0=C2=A0=C2=A0 7.391767] Call Trace:
>> [=C2=A0=C2=A0=C2=A0 7.394174] [c9023db0] [c00211e8] panic+0x130/0x304 (u=
nreliable)
>> [=C2=A0=C2=A0=C2=A0 7.400112] [c9023e10] [c0024e68] do_exit+0x874/0x910
>> [=C2=A0=C2=A0=C2=A0 7.405104] [c9023e50] [c0024f80] do_group_exit+0x40/0=
xc4
>> [=C2=A0=C2=A0=C2=A0 7.410440] [c9023e60] [c0033334] get_signal+0x1d8/0x9=
3c
>> [=C2=A0=C2=A0=C2=A0 7.415689] [c9023ec0] [c0007f34] do_notify_resume+0x6=
c/0x314
>> [=C2=A0=C2=A0=C2=A0 7.421369] [c9023f20] [c000d580] syscall_exit_prepare=
+0x120/0x184
>> [=C2=A0=C2=A0=C2=A0 7.427479] [c9023f30] [c001101c] ret_from_syscall+0xc=
/0x28
>>=20
>> Something is going wrong with asm goto output. I implemented get_user() =
helpers with asm goto this=20
>> cycle (commit 5cd29b1fd3e8). I tested it with CLANG before submitting, i=
t was working.
>>=20
>> Seems like there is something wrong with it with GCC11. When forcing CON=
FIG_CC_HAS_ASM_GOTO_OUTPUT=20
>> to 'n', the kernel boots ok.
>>=20
>
> I found the problem, that's due to r10 register being reused by GCC in th=
e copy loop below:
>
>    10:	7d 09 03 a6 	mtctr   r8
>    14:	80 ca 00 00 	lwz     r6,0(r10)
>    18:	80 ea 00 04 	lwz     r7,4(r10)
>    1c:	90 c9 00 08 	stw     r6,8(r9)
>    20:	90 e9 00 0c 	stw     r7,12(r9)
>    24:	39 0a 00 08 	addi    r8,r10,8
>    28:	39 29 00 08 	addi    r9,r9,8
> =3D>2c:	81 4a 00 08 	lwz     r10,8(r10)
>    30:	81 6a 00 0c 	lwz     r11,12(r10)
>    34:	91 49 00 08 	stw     r10,8(r9)
>    38:	91 69 00 0c 	stw     r11,12(r9)
>    3c:	39 48 00 08 	addi    r10,r8,8
>    40:	39 29 00 08 	addi    r9,r9,8
>    44:	42 00 ff d0 	bdnz    14 <__unsafe_restore_general_regs+0x14>
>
> earlyclobber modifier is missing in the CONFIG_CC_HAS_ASM_GOTO_OUTPUT ver=
sion of __get_user_asm2_goto().

Thanks for tracking that down. I hit it last week when testing Arnd's
compilers but hadn't had time to find the root cause.

cheers
