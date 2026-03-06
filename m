Return-Path: <linuxppc-dev+bounces-17844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF7XEc8+q2lnbgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 21:53:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECB227A26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 21:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSJXS0dJSz3c9j;
	Sat, 07 Mar 2026 07:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772830407;
	cv=none; b=Pm/tQgb/KANsPY7BoBAZisnkZpkjM5LwPX18CoUS+Qy9eIRHM7+PuBQ5OX6hzr855vYUSOtaedC3/nZCM9ixptnBjomxyd1ef/3e8UNmmqrYXrXpqwYkZfW4bHrlKOW3Ts4OjEj1bP0taffoZb1CDewCckiK5Tkt+vUPE8cuwfeF+iGBU+Rpdd4OEeKsE7WxmDeUIQqtrZt+905rYEWcQIFLGN5oAFsIVxqtbQSCyQ/pk3MPIf+w36B6+dMwyBOE4lYikmuSNwXsNjEsr5xX1yr4Nv2wjSAfqxLbex0TCMzrLXprLft4bSw7OA/G3CHPO2lgLp4eL4etLVWn55YPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772830407; c=relaxed/relaxed;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UdhX5treJYaVxAQuNrRUIVYMMcWcqDYQY2OUTEn+Fr2pp+86/Zna0nx2/vW3/H0+4U7AqPRxB24nqFwHl1e/rnYa1s96g0dfOL0110PZsWkC0iZx2Oyqmn1zWuv93K+NaLVeoNRvikqj0T6txVWgNmO+ReAcp2GsKiTfQsOu/49hBignCCOkYNQ4aahp6ZFyTXQJFZpx+Y/w1fnGrVFkQvxTJvT6EJ03tWmGcUlQNBsxLtKMnhXrDSZag7wkgyZemTCOLvMpnV2VCisJSqzaE9EAfJ+PhzBQX89E0X56Xb84Js1FOOitV8soLGfcx3tZvfP3tdEwjPQcSLW5zoBHUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=EQ2m+UyI; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=EQ2m+UyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSJXQ2xzFz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 07:53:25 +1100 (AEDT)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 626KqRb51958825
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 6 Mar 2026 12:52:28 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 626KqRb51958825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772830352;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EQ2m+UyIgHt4NPpBkDK9oDRl5sriE4QzwZICCF14NYbr9o9jnA4P5x6Ki7PI/c1Pq
	 MuB2CVSSZ1iN8/dlczEbnC0/V+ODW0STv+tMDFCGAqTNta3kvUwK3wx7igCIxtYepf
	 WP4Xgt2sBbl4oyXlo1NEh/P7iQ1F8nGYKsh0x45/4ix+F4yHgCtkuzJkzYrwYPKOfj
	 ZGBQDFMVCSRv3f1XvPA5D4Ut5gSR5N9/iNyb0omf0tkCFi13Z6kw+SSDHf0RObIZBO
	 eFidDjr3ZT6lb7idOI/GLFTlUAcnpNsbe7YnJMV2SZmCjXKy6cCOrXgsYEUmxi7GJ3
	 06pqSMGXttJhQ==
Date: Fri, 06 Mar 2026 12:52:21 -0800
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
In-Reply-To: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de> <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com> <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de> <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com> <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
Message-ID: <F10E5A68-4D63-41A5-B281-3AD52FF6F6D8@zytor.com>
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
X-Rspamd-Queue-Id: 2AECB227A26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17844-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid]
X-Rspamd-Action: no action

On March 6, 2026 1:42:25 AM PST, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssch=
uh@linutronix=2Ede> wrote:
>On Thu, Mar 05, 2026 at 03:57:59PM -0800, H=2E Peter Anvin wrote:
>> On 2026-03-05 01:24, Thomas Wei=C3=9Fschuh wrote:
>> >=20
>> >> Weak references would be a way to work around the link failures=2E=
=20
>> >=20
>> > I am still not sure where "the link failures" should be coming from=
=2E
>> > The only sense I can make out of it, is if somebody manually and dire=
ctly links
>> > to vdso=2Eso=2E Like in the following example:
>
>(=2E=2E=2E)
>
>> > This actually works on glibc (not on musl)=2E But it is highly non-st=
andard and
>> > relies on multiple implementation details=2E Furthermore it can fail =
to run on
>> > systems without a vDSO, as mentioned before=2E
>> >=20
>> > Is this the usage pattern you have in mind?
>> > Do you know of anybody doing things this way?
>> >=20
>>=20
>> Yes, and yes, I do=2E
>
>Thanks=2E
>
>Do you know why it is done this way? Are these applications public and
>if so, could you point me to them?
>In case we stub out the vDSO functions with ENOSYS, would these
>applications be able to handle that error gracefully?
>
>Personally I am still in favor of removing these functions completely
>when !COMPAT_32BIT_TIME=2E
>
>
>Thomas

I think I agree with you (and sadly, no, I can't point at them directly=2E=
)

