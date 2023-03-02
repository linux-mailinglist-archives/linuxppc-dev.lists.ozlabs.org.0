Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A56A8B26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 22:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSPJN06bBz3ch8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 08:24:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2023020601 header.b=EoMqj2Nr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=198.137.202.136; helo=terminus.zytor.com; envelope-from=hpa@zytor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2023020601 header.b=EoMqj2Nr;
	dkim-atps=neutral
X-Greylist: delayed 3593 seconds by postgrey-1.36 at boromir; Fri, 03 Mar 2023 08:24:01 AEDT
Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSPHP3579z2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 08:23:59 +1100 (AEDT)
Received: from [127.0.0.1] ([73.223.221.228])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 322JolfB1654568
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 2 Mar 2023 11:50:48 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 322JolfB1654568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023020601; t=1677786658;
	bh=n/GRsm1pImWCPNm4dPoe5zec7Kp4K3JReb8gPrI8/mc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EoMqj2NrvtdnnKP1K3ZY31x6mzZLyhmRVv+AfJ7wKdoAJbCxWwA+q2O/5sMmJVAVH
	 CBl1NaM0Y8H4KZuzvQjbNwKYV6dXCiIfmDalzvbDgGVmn+bMayegSv6UvQXFNOV7kH
	 d/WVC69GzUYAENKo48YQjfv0/LuQNbAN20Le/uIDHGiGr9P8B8oHP2fS95eG5xB58F
	 uasUM1VqxwzDuwffGGAapL9uswmgoHxhnTzGnsDohaOFjOu2pxA/e5nnYVugsNl2zn
	 98XlC/4jazJIi0XM8kFrS6seI0EpKbWqSgJdlLGlfl4yBTPVtfQW74gM369HHmiIcn
	 4YRgUzYFXGcXg==
Date: Thu, 02 Mar 2023 11:50:45 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, hca@linux.ibm.com
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
User-Agent: K-9 Mail for Android
In-Reply-To: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
Message-ID: <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: linux-m68k@vger.kernel.org, ysato@users.osdn.me, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, dalias@libc.org, sparclinux@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net, linux-sh@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, gor@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, npiggin@gmail.com, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, tgl
 x@linutronix.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, svens@linux.ibm.com, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt=2Ecom> wrot=
e:
>On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux=2Eibm=2Ecom wrote:
>> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>>> Hi Heiko,
>>>=20
>>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux=2Eibm=2Ecom>=
 wrote:
>>> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>>> > > This all came up in the context of increasing COMMAND_LINE_SIZE in=
 the
>>> > > RISC-V port=2E  In theory that's a UABI break, as COMMAND_LINE_SIZ=
E is the
>>> > > maximum length of /proc/cmdline and userspace could staticly rely =
on
>>> > > that to be correct=2E
>>> > >
>>> > > Usually I wouldn't mess around with changing this sort of thing, b=
ut
>>> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LIN=
E_SIZE
>>> > > to 2048")=2E  There are also a handful of examples of COMMAND_LINE=
_SIZE
>>> > > increasing, but they're from before the UAPI split so I'm not quit=
e sure
>>> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE =
from
>>> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to ker=
nel
>>> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE=
"),
>>> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>>> > > asm-generic/setup=2Eh=2E")=2E
>>> > >
>>> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have b=
een
>>> > > part of the uapi to begin with, and userspace should be able to ha=
ndle
>>> > > /proc/cmdline of whatever length it turns out to be=2E  I don't se=
e any
>>> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Goo=
gle
>>> > > search, but that's not really enough to consider it unused on my e=
nd=2E
>>> > >
>>> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE r=
eally
>>> > > shouldn't be part of uapi, so this now touches all the ports=2E  I=
've
>>> > > tried to split this all out and leave it bisectable, but I haven't
>>> > > tested it all that aggressively=2E
>>> >
>>> > Just to confirm this assumption a bit more: that's actually the same
>>> > conclusion that we ended up with when commit 3da0243f906a ("s390: ma=
ke
>>> > command line configurable") went upstream=2E
>
>Thanks, I guess I'd missed that one=2E  At some point I think there was s=
ome discussion of making this a Kconfig for everyone, which seems reasonabl=
e to me -- our use case for this being extended is syzkaller, but we're sor=
t of just picking a value that's big enough for now and running with it=2E
>
>Probably best to get it out of uapi first, though, as that way at least i=
t's clear that it's not uABI=2E
>
>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>> I assume?
>>=20
>> Yes, sorry for that=2E I got distracted while writing and used the wron=
g
>> branch to look this up=2E
>
>Alex: Probably worth adding that to the list in the cover letter as it lo=
oks like you were planning on a v4 anyway (which I guess you now have to do=
, given that I just added the issue to RISC-V)=2E

The only use that is uapi is the *default* length of the command line if t=
he kernel header doesn't include it (in the case of x86, it is in the bzIma=
ge header, but that is atchitecture- or even boot format-specific=2E)
