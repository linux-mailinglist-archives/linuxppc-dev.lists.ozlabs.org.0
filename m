Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB67BF922
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 13:04:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JjqLMU0x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Y1b22Rkz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JjqLMU0x;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Y0l3fqMz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 22:03:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696935799;
	bh=rRPSeJK6OkS6JARUt34pjYpoiqiV+aB1vXdSigvuq90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JjqLMU0xhKuyVkw24NR/+rV3NlOsjYHs+grr0sG18TaHy8pDII4wzxuXvtYESdk2/
	 suc2RdQMiJcJtqVVBfH1GrVJHpi78ku3YpIQTGqmCOI+shL3Zm4DaJXnrlvUR42vq/
	 rGo1INLEpj9lFSKaO2jGUAWeFOHc74jpEr87Wgky+IGFS0qL94UaAkEH4MQ7i2mL15
	 XCbZCban+rrprdv0sOVhFcwv45tYCalgHIS4WvSSyNJeUWevD361sNPBhtEUmADpCJ
	 fksExGky0XqHoTCzGo6abbrbEY8iCU1XXoFWZntNwI48riD4UWc20oBmFVcRleez4X
	 0LWMe9hN0aMSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4Y0l29NZz4xPM;
	Tue, 10 Oct 2023 22:03:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Eddie James
 <eajames@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: KUEP broken on FSP2?
In-Reply-To: <75905aa0-5c25-bff0-8ef9-4792b57f5f1a@csgroup.eu>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <87a5ssrl9c.fsf@mail.lhotse>
 <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
 <75905aa0-5c25-bff0-8ef9-4792b57f5f1a@csgroup.eu>
Date: Tue, 10 Oct 2023 22:03:18 +1100
Message-ID: <87wmvurb7t.fsf@mail.lhotse>
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
Cc: "paulus@samba.org" <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/10/2023 =C3=A0 17:12, Eddie James a =C3=A9crit=C2=A0:
>>=20
>> On 10/9/23 08:14, Michael Ellerman wrote:
>>> Eddie James <eajames@linux.ibm.com> writes:
>>>> Hi,
>>>>
>>>> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes
>>>> attempting to get into userspace. The init script works, but the first
>>>> binary (mount) I run results in oops. Can anyone help me to debug this
>>>> further or suggest anything?
>>> Hi Eddie,
>>>
>>> It looks like breakage in syscall_exit_finish.
>>> Can you test this? Patch is against v6.1.
>>=20
>>=20
>> That worked! Perfect. Thank you very much! Will you send it upstream?
>
> Well spotted Michael. Looks like I messed it up with commit 6f76a01173cc=
=20
> ("powerpc/syscall: implement system call entry/exit logic in C for PPC32")

I should have spotted it when applying ;)

That old asm code with all those unnamed labels was super fragile.

> Thanks for fixing.

No worries.

cheers
