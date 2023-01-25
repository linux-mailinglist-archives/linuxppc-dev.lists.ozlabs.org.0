Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2F67ABC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 09:32:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1xt022mLz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 19:32:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oSCu283I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1xs45c6jz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 19:31:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oSCu283I;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1xs33lGPz4xZb;
	Wed, 25 Jan 2023 19:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674635511;
	bh=RijxhIRRoJPT60iN7+sO/FMf5qceHAshwUEPvlc0unI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oSCu283IAi1f/b8+XX/irxWfR02z3kE2hV8HUJBZ4WOFfChIAHCsZ2BdLtIN5rTdF
	 QhxChafOYGqg344/ccP6Rewg66ECzdPYzPYj/1apU8wLPvKrEH02pFXscMMr50PiJw
	 x1C60vUKuDt4/oJ8ufhNLzazm8cBHPAGEHBaNK2+fuTO8px0Ba8m9LgDXNan9EZ72S
	 BgCgyWk5xdbYckG9Lblhq9t5hF/wI3C7vWyN3FJepus0iMusQsDIgklya0IAQWBHZd
	 eQaFw9fU0PFUaFoxAgDvHXGoqFQCUPVB5PQz0E0ZTvKmf/9a0v3tEoK/DKnD2Vev8Q
	 rTsPf04LcJJaQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, kernel test robot
 <lkp@intel.com>, Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: arch/powerpc/kernel/head_85xx.o: warning: objtool:
 .head.text+0x1a6c: unannotated intra-function call
In-Reply-To: <1674631223.9e09lbzzb6.naveen@linux.ibm.com>
References: <202301161955.38kK6ksW-lkp@intel.com>
 <b2273730-f885-7658-7ec4-12fb5bfc515b@linux.ibm.com>
 <1674631223.9e09lbzzb6.naveen@linux.ibm.com>
Date: Wed, 25 Jan 2023 19:31:46 +1100
Message-ID: <87v8kvow0d.fsf@mpe.ellerman.id.au>
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
Cc: npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Sathvika Vasireddy wrote:
>>=20
>>>>> arch/powerpc/kvm/booke.o: warning: objtool: kvmppc_fill_pt_regs+0x30:=
 unannotated intra-function call
>>=20
>> As an attempt to fix it, I tried expanding ANNOTATE_INTRA_FUNCTION_CALL=
=20
>> macro to indicate that the branch target is valid. It then threw another=
=20
>> warning (arch/powerpc/kvm/booke.o: warning: objtool:=20
>> kvmppc_fill_pt_regs+0x38: intra_function_call not a direct call). The=20
>> below diff just removes the warnings for me, but I'm not very sure if=20
>> this is the best way to fix the objtool warnings seen with this=20
>> particular file. Please let me know if there are any better ways to fix =
it.
>>=20
>> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
>> index 0dce93ccaadf..b6a413824b98 100644
>> --- a/arch/powerpc/kvm/booke.c
>> +++ b/arch/powerpc/kvm/booke.c
>> @@ -917,7 +917,9 @@ static void kvmppc_fill_pt_regs(struct pt_regs *regs)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mr %0, 1" : "=3Dr"(r1));
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mflr %0" : "=3Dr"(lr));
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mfmsr %0" : "=3Dr"(msr)=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm(".pushsection .discard.intra_f=
unction_calls; .long 999f;=20
>> .popsection; 999:");
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("bl 1f; 1: mflr %0" : "=
=3Dr"(ip));
>
> I don't think you can assume that there won't be anything in between two=
=20
> asm statements.

Yeah, compiler could interleave something theoretically.

> Even if that works, I don't think it is good to expand the macro here.=20=
=20
> That asm statement looks to be trying to grab the current nip. I don't=20
> know enough about that code, and someone who knows more about KVM may be=
=20
> able to help, but it looks like we should be able to simply set 'ip' to=20
> the address of kvmppc_fill_pt_regs()?

There is _THIS_IP_ which should be sufficient.

cheers
