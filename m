Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED3216B95
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:33:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1L0h536qzDqBX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=rPEakt1n; dkim-atps=neutral
X-Greylist: delayed 340 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Jul 2020 21:30:47 AEST
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Kxg6H3czDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:30:47 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id E13D22A69;
 Tue,  7 Jul 2020 07:25:01 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id k3YImSe-riiC; Tue,  7 Jul 2020 07:25:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 8940A2B49;
 Tue,  7 Jul 2020 07:25:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 8940A2B49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594121101;
 bh=TlBdJNeyeSn9XfCxZcoZaJA/3ADyLlwuwfztjgTSa7k=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=rPEakt1n6vbv0sBLqUYM4HSUzmbQnz0ds7b5EY4BOpcYgTE6MDlCvme6FaMD2EcaZ
 3/4HPRlk3tsVNmKsQW3LzDtIySkA07Noif6VhtnN/kdZ7XEc+cEbMp0h0mMYuT0EXj
 ncT7zh7D+4JeBZqpBk7Dcmc7bE3VpFV1YopOTFx1ggSLOvK9GcwoyN/LFmzMMZGacu
 sRJi+fWGBrKaZVDRfQRhqVPSHTyJBoWCdkvT04cuR2LZwgI6EF66JdYZXbH5tARlLd
 aJ85ckAIUWMAR/7fTg1IuVAA8QxOi0iPrObSAme4YXFEY2FpcjK2uLUOsdK7NmNotf
 YcGJxo4edOYyQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tpfUPIRxxZFi; Tue,  7 Jul 2020 07:25:01 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 7C4382C6F;
 Tue,  7 Jul 2020 07:25:01 -0400 (EDT)
Date: Tue, 7 Jul 2020 07:25:01 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
In-Reply-To: <1594098302.nadnq2txti.astroid@bobo.none>
References: <20200706021822.1515189-1-npiggin@gmail.com>
 <cf10b0bc-de79-1b2b-8355-fc7bbeec47c3@csgroup.eu>
 <1594098302.nadnq2txti.astroid@bobo.none>
Subject: Re: [PATCH] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
Thread-Index: MNbpaRSW9cIGgxQzDjC98QqVXDKt7w==
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 7, 2020, at 1:50 AM, Nicholas Piggin npiggin@gmail.com wrote:

> Excerpts from Christophe Leroy's message of July 6, 2020 7:53 pm:
>>=20
>>=20
>> Le 06/07/2020 =C3=A0 04:18, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> diff --git a/arch/powerpc/include/asm/exception-64s.h
>>> b/arch/powerpc/include/asm/exception-64s.h
>>> index 47bd4ea0837d..b88cb3a989b6 100644
>>> --- a/arch/powerpc/include/asm/exception-64s.h
>>> +++ b/arch/powerpc/include/asm/exception-64s.h
>>> @@ -68,6 +68,10 @@
>>>    *
>>>    * The nop instructions allow us to insert one or more instructions t=
o flush the
>>>    * L1-D cache when returning to userspace or a guest.
>>> + *
>>> + * powerpc relies on return from interrupt/syscall being context synch=
ronising
>>> + * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_S=
YNC_CORE
>>> + * without additional additional synchronisation instructions.
>>=20
>> This file is dedicated to BOOK3S/64. What about other ones ?
>>=20
>> On 32 bits, this is also valid as 'rfi' is also context synchronising,
>> but then why just add some comment in exception-64s.h and only there ?
>=20
> Yeah you're right, I basically wanted to keep a note there just in case,
> because it's possible we would get a less synchronising return (maybe
> unlikely with meltdown) or even return from a kernel interrupt using a
> something faster (e.g., bctar if we don't use tar register in the kernel
> anywhere).
>=20
> So I wonder where to add the note, entry_32.S and 64e.h as well?
>=20

For 64-bit powerpc, I would be tempted to either place the comment in the h=
eader
implementing the RFI_TO_USER and RFI_TO_USER_OR_KERNEL macros or the .S fil=
es
using them, e.g. either:

arch/powerpc/include/asm/exception-64e.h
arch/powerpc/include/asm/exception-64s.h

or

arch/powerpc/kernel/exceptions-64s.S
arch/powerpc/kernel/entry_64.S

And for 32-bit powerpc, AFAIU

arch/powerpc/kernel/entry_32.S

uses SYNC + RFI to return to user-space. RFI is defined in

arch/powerpc/include/asm/ppc_asm.h

So a comment either near the RFI define and its uses should work.

> I should actually change the comment for 64-bit because soft masked
> interrupt replay is an interesting case. I thought it was okay (because
> the IPI would cause a hard interrupt which does do the rfi) but that
> should at least be written.

Yes.

> The context synchronisation happens before
> the Linux IPI function is called, but for the purpose of membarrier I
> think that is okay (the membarrier just needs to have caused a memory
> barrier + context synchronistaion by the time it has done).

Can you point me to the code implementing this logic ?

Thanks,

Mathieu

>=20
> Thanks,
> Nick

--=20
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
