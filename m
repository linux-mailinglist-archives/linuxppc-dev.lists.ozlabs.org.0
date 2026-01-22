Return-Path: <linuxppc-dev+bounces-16142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EJGC8oCcmmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:58:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038656599B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxdMS5z4Rz2ySb;
	Thu, 22 Jan 2026 21:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769079492;
	cv=none; b=Q8/0HN8u3fo6kvxYPGN1XNJqWZqkP44dkagOcJOSOuwTFSHzb1wEbN+uaJg/tytgka4ViV6gOx51gJnBgCmObksRNqGDmZXLHFKPQjtaq7pMEzhFJ+sqWGA4szHOIdPcLNL6bbUqdsFMJ89frctx86wYtuHv7MRcNRpJ69g1S/MP+Owmz/AO+NRB/zSOlbvOjCcFFtQ2XzEL9qKZt3AgRKgxUbuZ95AuAcDOUmzVhuV0m/gVIzjcjLO2nsE4y6GSY+bgWagT7TtiLBZXYRcji83XXgT/e9+BxM5BkBw8Y7Rho/o+In8m9D3Tl/EyAhuPuc4zipauUTbTjCRRzjBAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769079492; c=relaxed/relaxed;
	bh=hA1fqrcZHqurJaeVygESj8hh0mC0mCysgsg7LEzjRmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5u/tM9DVee5Anikw3YB05PPfnYu48rOZPC66vqGhFhcC5sYWbcu08b5YZHYPUld2Zgk8AZrx6ltA3rNIW7Raq3VkfZHev4S2PaDWsJNCo5gIa3cShjaV8JQgwtk0ioq+WH7nKuV4Y5WeBAV7N6/EeOQdH3DUIpXKEGRw9YRj01JzGxu16tMoNJ4h8Wb+YMFeuCHTjxWaby4Z4HxGLtdE/OTnIMGmS/YriHHRU3uWqAgkJPq4j55+hiSbNwAWiMghtl/J9Ldlo9Ir4uYBerIg6dqPdiMTVz2tYRyYMUYGyxYGcI2IUa6OQOexdkI/ZNimrs0Cg1YKKNXTGyWWDQacA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jiVjYaHH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jiVjYaHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxdMR3kM6z2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 21:58:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AD9D60053;
	Thu, 22 Jan 2026 10:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B50BC116C6;
	Thu, 22 Jan 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769079489;
	bh=mlHWGTku+nmROG/IwYrYRxE/caYwAM8oVuKxSsjWjdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jiVjYaHHxqriVs2o8gdR+pdPefWkgZrI1J7SdIfgivu3IM8JY7WMToxD6Dqlbgggv
	 TcguLr6cCUZx1/jDarV8qtuzdLe+q9dPozHbFlXrbqsPgKM/XbEtZbLATenl5mJZyC
	 xWCNjbEVfQ1cPulMHJ8bRBb+JEEyqZX/Lva9OHwDXo4sBc7y9iHjv/meUeoTFdrWY3
	 kWVnub+4WAiUPBuwjV+cssojl79uZa+UlC42hrfj8t2p93JdQ5G4RLRXJYCg9MHvwg
	 5s1HOGpzWG3t/qbN+qJcLrcNrXJNjm5TB3Mgl8yNSJ2/4xCSJ73X/6srkr0geT8Otl
	 TpEXOQtQp7pQw==
Message-ID: <230c749f-ebd6-4829-93ee-601d88000a45@kernel.org>
Date: Thu, 22 Jan 2026 11:58:04 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org"
 <luto@kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com"
 <vincenzo.frascino@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
 <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
 <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16142-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 038656599B
X-Rspamd-Action: no action



Le 22/01/2026 à 11:49, Thomas Weißschuh a écrit :
> On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
>> Hi Thomas,
>>
>> Le 22/01/2026 à 10:50, Thomas Weißschuh a écrit :
>>> Hi Alexander,
>>>
>>> On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
>>>> Hi Thomas, Christophe,
>>>>
>>>> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weißschuh wrote:
>>>>> For consistency with __vdso_clock_gettime64() there should also be a
>>>>> 64-bit variant of clock_getres(). This will allow the extension of
>>>>> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
>>>>> time types from the kernel and UAPI.
>>>>>
>>>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>>
>>>> I've bisected this patch to cause the following build failure on my side:
>>>>
>>>>     LDS     arch/powerpc/kernel/vdso/vdso32.lds
>>>>     VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/note-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>>>>     VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>>>     VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>>>     VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>>>>     VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>>
>>> Thanks for the report!
>>>
>>>> Does it ring any bells? What could I try/test?
>>>
>>> Not immediately, but I'll look into it.
>>>
>>>> I'm using gcc-15.2.0 and binutils 2.45.1.
>>>
>>> Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C937051154ddf479721f708de59a3e01c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046757528646789%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=qkl4zNfg2j%2F24vZV7nQ7LLDtxG0WbgaJc30kjHQZqpk%3D&reserved=0 ?
>>> Could you also share your configuration?
>>
>> I've just been able to reproduce it with ppc64_defconfig +
>> CONFIG_CC_OPTIMIZE_FOR_SIZE
> 
> Thanks for the hint, no I can reproduce it, too.
>>
>>    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>> supported
>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
>> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>>
>> I'll investigate
> 
> It seems the compiler decides to call memset(), which is not valid from the
> vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
> fixes the issue. So I guess we should a) figure out why -ffreestanding does
> not seem to work here and b) exclude the vDSO from the stack initialization
> logic.
> 

Ah, ok.

Reminds me commit b91c8c42ffdd ("lib/vdso: Force inlining of 
__cvdso_clock_gettime_common()")

Problem fixed with:

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05ab..4399e143d43a5 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -421,7 +421,7 @@ static __maybe_unused __kernel_old_time_t 
__cvdso_time(__kernel_old_time_t *time
  #endif /* VDSO_HAS_TIME */

  #ifdef VDSO_HAS_CLOCK_GETRES
-static __maybe_unused
+static __always_inline
  bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, 
clockid_t clock,
  				 struct __kernel_timespec *res)
  {


Christophe

