Return-Path: <linuxppc-dev+bounces-16139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OzULav7cWmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:27:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C77653FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 11:27:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxchS1z9tz2ySb;
	Thu, 22 Jan 2026 21:27:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769077672;
	cv=none; b=i0fk7smnKFtqrz0D0avf/7dyR67fPzcMF42L2/WU6GEzk2MjeqkqRLsX5UuB+HrFHgiIyxtjyD6EXXHOk+J3T+BwhRkICZ6Ix5O0P5P1EBf0jUs9B7YMn7udo6ozrc/z99ec/lX8+iB0QmQMujNqqP7ENwwsYxjfeBTEgOKu2IZ5m66bMUflVJ09vQ4u8ludmBxC5/wRDqkDz8JYVwuPJADt50DxTq2dYrUEtaq38Xh+IXOlYE/i2QvXIR7h4potV7zSbhILFxPX98cYuAXVjhsOaa7INvKoHdCxNotEogxqoRtp+61fcpmWE55KFxZsURMG7W4sPvBqkEdH/I+zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769077672; c=relaxed/relaxed;
	bh=0sdJRuCZ434NsmYlLVeYacu7I3ECJfymgWe6ajqGYbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sb6zyvUh+pZDeuGeLly4g5xjdvYjbIOIM0BYdU7uDbIyOKAmnkF9m2LSMRMFj1HBe9kKkaIvaatEGsGNeWm0V646drCWX1WwFKQXIMtgGyRQ0rzV8wl8vryU/p/Fc22olihCQ83zG5xbeHFI5GGWfEqOMGxo43UYmyjAS6RWa453ZfxKHQFzAn/ZdcB6kQYAyEa7QcJ9GfNVQb53nl9CO7RAaxdl7vNq1ouzGpdDWs6pBCuVaf74sa9/K9y7GTL6Li3qaef/+Ma3FyxR0b8QKeoAD2XfptmXhKx/5cfgOq9lENPd4QllLrc67FgmaNiw07wEQBZJBpK7sNd4ymg1yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KoJzjRMG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KoJzjRMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxchR0jrbz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 21:27:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 573AD600C3;
	Thu, 22 Jan 2026 10:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6066C116C6;
	Thu, 22 Jan 2026 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769077668;
	bh=OeivXOaV30guu1PmajmK/XSeMsLGc9hAT6DOW3UEViw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KoJzjRMGMSQqjkZ80Vf0Sr+WbMWa3ustxr0TtvRX6IqT/yZEGklnfa0AuM763mcbQ
	 k5BSCrrFTmB8KgYQJg9/Wn1t0K4q0+RJBC3pw4kiG8h7k6/mMDeEBynKOGU3vN/VUl
	 QIROFCdDbbb0xY/vtPTaguBDkbQ7mKoyAXsXaWu9/9H5QWV/LeZ61czDkX1GHd0BRL
	 E1KyohSR4Ukmmg1Dz1pHx5qEztxa8rD1H9soC0it/eIQIhJ8I0LsCwlE4RkvRxgntA
	 psSdvhwOPygFQcvayV2mnxZ3Xk4HluqhO6R+ZcHnZFog9bLTgZ3uyIt1dSU1BToIfq
	 uBgkIfpPxOO8g==
Message-ID: <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
Date: Thu, 22 Jan 2026 11:27:43 +0100
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16139-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: C8C77653FC
X-Rspamd-Action: no action

Hi Thomas,

Le 22/01/2026 à 10:50, Thomas Weißschuh a écrit :
> Hi Alexander,
> 
> On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
>> Hi Thomas, Christophe,
>>
>> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weißschuh wrote:
>>> For consistency with __vdso_clock_gettime64() there should also be a
>>> 64-bit variant of clock_getres(). This will allow the extension of
>>> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
>>> time types from the kernel and UAPI.
>>>
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>
>> I've bisected this patch to cause the following build failure on my side:
>>
>>    LDS     arch/powerpc/kernel/vdso/vdso32.lds
>>    VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/note-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>>    VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>    VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>>    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 
> Thanks for the report!
> 
>> Does it ring any bells? What could I try/test?
> 
> Not immediately, but I'll look into it.
> 
>> I'm using gcc-15.2.0 and binutils 2.45.1.
> 
> Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C03b93d2aa659407b3e5a08de599bb85e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046722536758587%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=b9WoZvMR2V3RUpOwrJtm6kmXrpnLti%2BeMJ6zpyB%2Fv4k%3D&reserved=0 ?
> Could you also share your configuration?

I've just been able to reproduce it with ppc64_defconfig + 
CONFIG_CC_OPTIMIZE_FOR_SIZE

   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not 
supported
make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: 
arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I'll investigate

Christophe

> 
>>> ---
>>> Based on tip/timers/vdso.
>>>
>>> This was missed in the original vdso_getres_time64() series as powerpc
>>> does not use include/vdso/gettime.h.
>>> ---
>>>   arch/powerpc/include/asm/vdso/gettimeofday.h |  2 ++
>>>   arch/powerpc/kernel/vdso/gettimeofday.S      | 12 ++++++++++++
>>>   arch/powerpc/kernel/vdso/vdso32.lds.S        |  1 +
>>>   arch/powerpc/kernel/vdso/vgettimeofday.c     |  6 ++++++
>>>   4 files changed, 21 insertions(+)
> 
> (...)


