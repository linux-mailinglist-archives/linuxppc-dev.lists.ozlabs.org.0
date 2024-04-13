Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D68A3BEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 11:28:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BRz/xMje;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VGp5J63Mmz3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 19:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BRz/xMje;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VGp4Y0wknz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Apr 2024 19:27:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713000459;
	bh=3aewD2oJ5lCGPTd/q9AbSX1ze3K0D7ZipcutTcBOOjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BRz/xMjewXr7BMy3kMWgkeZJOsjd+wKW1GyUv4bUGLosF97Jk7ABL1DhG7HQ9+Hop
	 all7poKtpvnaLLCkzwXzF3QqmcT//I4w88f5Y0uuSF4Qtgvj6fxNSiI7IIqkhfgWKA
	 XVR2eRlygS8QCiNLOSJujhnLiHqR9Bd/9aGwlflun9+VojsvezdzXrMXjXstI0ufYz
	 eJmsRV64sfSRlHpd+Q4JbhyAbrR+pQknoEdCEHAzOrmCqyYARIFBUseRZebMjOWIyV
	 4PxwPqpeeWnR01lcwV9em2FoQpBmjoayJYUYNLDRMTuXfnpUB6VBHGTFajRBMht3fC
	 5drB7aG9b+pmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VGp4T3FZBz4wyV;
	Sat, 13 Apr 2024 19:27:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sean Christopherson
 <seanjc@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default
 for SPECULATION_MITIGATIONS=n
In-Reply-To: <20240413115324.53303a68@canb.auug.org.au>
References: <20240409175108.1512861-1-seanjc@google.com>
 <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au>
Date: Sat, 13 Apr 2024 19:27:36 +1000
Message-ID: <87edb9d33r.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>, Daniel Sneddon <daniel.sneddon@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Sean,
>
> I noticed this commit in linux-next.
>
> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@google.com=
> wrote:
>>
>> Initialize cpu_mitigations to CPU_MITIGATIONS_OFF if the kernel is built
>> with CONFIG_SPECULATION_MITIGATIONS=3Dn, as the help text quite clearly
>> states that disabling SPECULATION_MITIGATIONS is supposed to turn off all
>> mitigations by default.
>>=20
>>   =E2=94=82 If you say N, all mitigations will be disabled. You really
>>   =E2=94=82 should know what you are doing to say so.
>>=20
>> As is, the kernel still defaults to CPU_MITIGATIONS_AUTO, which results =
in
>> some mitigations being enabled in spite of SPECULATION_MITIGATIONS=3Dn.
>>=20
>> Fixes: f43b9876e857 ("x86/retbleed: Add fine grained Kconfig knobs")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  kernel/cpu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>> index 8f6affd051f7..07ad53b7f119 100644
>> --- a/kernel/cpu.c
>> +++ b/kernel/cpu.c
>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
>>  };
>>=20=20
>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
>> -	CPU_MITIGATIONS_AUTO;
>> +	IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
>> +						     CPU_MITIGATIONS_OFF;
>>=20=20
>>  static int __init mitigations_parse_cmdline(char *arg)
>>  {
>> --=20
>> 2.44.0.478.gd926399ef9-goog
>>=20
>
> I noticed because it turned off all mitigations for my PowerPC qemu
> boot tests - probably because CONFIG_SPECULATION_MITIGATIONS only
> exists in arch/x86/Kconfig ... thus for other architectures that have
> cpu mitigations, this will always default them to off, right?

Yep.

The patch has the effect of changing the default for non-x86 arches from
auto to off.

I see at least powerpc, arm64 and s390 use cpu_mitigations_off() and
will be affected.

cheers
