Return-Path: <linuxppc-dev+bounces-17732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB3uCaN6qGl0uwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 19:32:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDCC20662B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 19:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR1V73yTRz3c1T;
	Thu, 05 Mar 2026 05:31:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772649119;
	cv=none; b=NgjKdrGiV/wUELRIT91g/vpaB00yp+shBHAghuHKb/9jUDVZhtiquhDIsj+oJbUgt2OLQlMoMw22+Ubad0ZsADnfaHfElSR2ux2zi50j+YEL2OY1yGNSuGCvOEoLAwlV7saUQgvvwOETxb0Su2GcdTYJphhf7PxDOXvXtrs9Af9w56vSl1jjz90DANw6sNhRyIL9xpYmgpaBMIryigZseblZeyr40r4IqbjJaiPI3XVodLnHQEJZzXR8WXRFCdE/Kku9e0xSSrNMXgEZG9qD+NzDaqsqBMnFOTCQYb5Idwpt2IuCjujq87IhcGksMlKnYL1l7KUmBVGo7rP4n3MuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772649119; c=relaxed/relaxed;
	bh=ljHNVjrQPTeL1smxXsNRDrNvvI88tAHz0REgyCrUbZE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VKo63dXakamT6LsWpWFL8+O92xp26LKo+t7DAYzpuCWt0sTTK5oMrJcj2J1L7vGpSDymk2R4Kh36OoP/+/HzGptWSv7FY0Ix+Isfnpw1eu3GQaZPowWeK4XvQABlI37jeIW1WHoEsH4eDvTtm6RA/Zmgv+N9mAoruvnLaHGZPDAc4uokL+yqfNhpFUQ2/AKEhRFs2h1QCwrjgbhrEwOqT2bxaKqU3XO/hdzwsx+TVVNcliTIDZUPDQ8WWNrmFeByEpi/8wh5Hig1TRf7w8bFQRFDsUSNUHDhgKobcG/ahUDBHs9D8qR31d5vHR8r1vSUegINty+UvWvb4OLM2QhKOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=UBcPyiSj; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=UBcPyiSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fR1V60vCHz30hq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 05:31:57 +1100 (AEDT)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 624IUfCb1282071
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Mar 2026 10:30:41 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 624IUfCb1282071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772649044;
	bh=ljHNVjrQPTeL1smxXsNRDrNvvI88tAHz0REgyCrUbZE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UBcPyiSjjdnc8u1gNm87gwC/Er0xhMwNBV1m2zZ+o+XgCspHTxXnYoyIzHym2/l4v
	 LAMVfwfC9TEBHNfDK3cZDDckk6EZTO3c4wMWGYx+aIeWu3wwSMTg1BF2mr0c9hua9m
	 hhochLIfnTPq4UNrw53Y3+7EdXSR8kyrwSdK2afFrW0Cgn8gQjyS1qCvj+mlcEDaIL
	 skh1+MAfpYjdw6H15iV6N/LRGfuX+6a6/KXr6dR+//0WTs35oexlXE6fzobAf7zMuO
	 prQ2ReLjhkk0x5duyIKv/HxPQuZFYCs8H7lVT7hdsyqeAsQ0nhyDT+NmofYCM9ChyA
	 jIXH41IMvCKGw==
Date: Wed, 04 Mar 2026 10:30:34 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
Message-ID: <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2DDCC20662B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17732-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,zytor.com:dkim,zytor.com:mid,linutronix.de:email]
X-Rspamd-Action: no action

On March 3, 2026 11:35:52 PM PST, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssc=
huh@linutronix=2Ede> wrote:
>On Tue, Mar 03, 2026 at 10:11:52AM -0800, H=2E Peter Anvin wrote:
>> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>> >>>
>> >> The thing about gettimeofday() and time() is that they don't have
>> >> a 64-bit version and libc implementations are expected to call
>> >> clock_gettime() instead=2E The result was that there was never a
>> >> patch to turn the off either=2E
>> >=20
>> > gettimeofday() is currently the only way to get the timezone of the k=
ernel=2E
>> > But I guess this is a legacy thing anyways=2E If you say we should dr=
op it,
>> > let's drop it=2E
>> >=20
>>=20
>> The time zone in the kernel has never worked anyway, as it would requir=
e the
>> kernel to contain at least the forward portion of the zoneinfo/tzdata t=
able in
>> order to actually work correctly=2E The only plausible use of it would =
be for
>> local time-based filesystems like FAT, but I don't think we bother=2E
>
>sys_tz is currently used by a bunch of drivers and filesystems (including=
 FAT)=2E
>It is also used when writing to the RTC=2E
>
>> A bigger question is whether or not we should omit these from the vDSO
>> completely (potentially causing link failures) or replace them with stu=
bs
>> returning -ENOSYS=2E
>
>I am a bit confused here=2E You mention 'link failures' and in another ma=
il
>'weak references as fallback'=2E Both are things that happen during linki=
ng
>('link failures' could also be interpreted as failures during loading)=2E
>Somewhere else someone also mentioned the vDSO to be 'linkable'=2E
>But as far as I understand, only libc interprets the vDSO, it completely
>bypasses both the linker and the loader=2E And libc already does graceful
>fallbacks to the regular systemcalls if the vDSO is missing completely or
>lacks one of the functions, as both cases may happen on normal systems=2E
>
>What am I missing?
>
>
>Thomas

Weak references would be a way to work around the link failures=2E=20

At least in practice the RTC timezone should be managed from user space=2E=
=20

As I said, managing time zone information in the kernel correctly (beyond =
"right now", which can be dealt with by an external daemon on discontinuiti=
es; maybe systemd does that) would require far more than settimeofday() pro=
vides=2E

Downloading a binary zoneinfo (TZif2) blob into the kernel certainly isn't=
 out of the question and would solve this issue correctly once and for all;=
 a single zoneinfo blob is (currently) slightly below 4K in size, and the s=
tock interpreter is about 14K, which, even if we can't strip out any additi=
onal functionality we don't need, is more or less a drop in the bucket thes=
e days=2E

    -hpa

