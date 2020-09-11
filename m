Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0A266025
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:25:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnxMm1HNczDqv4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 23:25:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnxKq2M1mzDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 23:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UrUsxTIn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BnxKp3lBvz9sTN;
 Fri, 11 Sep 2020 23:23:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599830639;
 bh=3GjkYcPqs3ZA/bSxg0wAn4yNJ8JMUPPVp+hwR5eSDBM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UrUsxTInpnbdHP6suY/Sb4wvknzIPRTNTvgIqQ+zndA/xjcMT7GPGScgVUp5ccamc
 N039a4XehE0CWxL5HWL0y9c3InE9AY0eEUPdRMcwyxmFKOvj3EH2WyUtnIJYXnDinV
 gc35uTczu1ha1go43Vy9RYxV4HT0Rpl7iIMZlc2vAz9m0ODBahme3oyu/Ni8htbL56
 7YfFEqcxrI0t4E0PGeEHjolK2MGvEEmjGF9UDP4yi5BS8l3Ho879N1y64TXrnWmOJe
 bPTpCfBXsdo9Ar3YyDAgpCe2z72rOad+OkXaTDtmFw4lbFMhvZZDMPdgyySgW2wSEx
 Jh+j/PQZbwnOA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Christophe Leroy
 <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/traps: fix recoverability of machine check
 handling on book3s/32
In-Reply-To: <20200911091542.GE29521@kitsune.suse.cz>
References: <1c804764d38fb084b420b12ca13e8c1b2dea075e.1548166189.git.christophe.leroy@c-s.fr>
 <20200911091542.GE29521@kitsune.suse.cz>
Date: Fri, 11 Sep 2020 23:23:57 +1000
Message-ID: <87pn6sqweq.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> does this logic apply to "Unrecoverable System Reset" as well?

Which logic do you mean?

We do call die() before checking MSR_RI in system_reset_exception():

  	/*
  	 * No debugger or crash dump registered, print logs then
  	 * panic.
  	 */
  	die("System Reset", regs, SIGABRT);
=20=20
  	mdelay(2*MSEC_PER_SEC); /* Wait a little while for others to print */
  	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
  	nmi_panic(regs, "System Reset");
=20=20
  out:
  #ifdef CONFIG_PPC_BOOK3S_64
  	BUG_ON(get_paca()->in_nmi =3D=3D 0);
  	if (get_paca()->in_nmi > 1)
  		die("Unrecoverable nested System Reset", regs, SIGABRT);
  #endif
  	/* Must die if the interrupt is not recoverable */
  	if (!(regs->msr & MSR_RI))
  		die("Unrecoverable System Reset", regs, SIGABRT);


So you should see the output from die("System Reset", ...) even if
MSR[RI] was clear when you took the system reset.

cheers

> On Tue, Jan 22, 2019 at 02:11:24PM +0000, Christophe Leroy wrote:
>> Looks like book3s/32 doesn't set RI on machine check, so
>> checking RI before calling die() will always be fatal
>> allthought this is not an issue in most cases.
>>=20
>> Fixes: b96672dd840f ("powerpc: Machine check interrupt is a non-maskable=
 interrupt")
>> Fixes: daf00ae71dad ("powerpc/traps: restore recoverability of machine_c=
heck interrupts")
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: stable@vger.kernel.org
>> ---
>>  arch/powerpc/kernel/traps.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 64936b60d521..c740f8bfccc9 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -763,15 +763,15 @@ void machine_check_exception(struct pt_regs *regs)
>>  	if (check_io_access(regs))
>>  		goto bail;
>>=20=20
>> -	/* Must die if the interrupt is not recoverable */
>> -	if (!(regs->msr & MSR_RI))
>> -		nmi_panic(regs, "Unrecoverable Machine check");
>> -
>>  	if (!nested)
>>  		nmi_exit();
>>=20=20
>>  	die("Machine check", regs, SIGBUS);
>>=20=20
>> +	/* Must die if the interrupt is not recoverable */
>> +	if (!(regs->msr & MSR_RI))
>> +		nmi_panic(regs, "Unrecoverable Machine check");
>> +
>>  	return;
>>=20=20
>>  bail:
>> --=20
>> 2.13.3
>>=20
