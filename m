Return-Path: <linuxppc-dev+bounces-17787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLgII7wYqmlfLAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 00:58:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C7219948
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 00:58:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRmhm2jN1z3c9D;
	Fri, 06 Mar 2026 10:58:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772755128;
	cv=none; b=Y3KTS8VTj0JZduJA4/j0bOg4kzEgTHpaO1ZuDiAsIXh/vzidS+sQ4yYFLwSRiva+98U+Asu3yxn0SscBtgcNE6oOb4xqDC9Oio5ynqEQIdvRfyLZgwkQ8VhJwRL5L4pkSujEElwGqdmamQVYLhLssrG+D8ld5e37Fnc+9lul9yArfmfKz9kAAYDNvr+22v/sZ+ilsHyqQYx07/aN/c0fZxFJAH7/jnnpySEJQk7Cy0QuBD1s4Xg5C+g8984AixirtzNGL0mmBUkAUJHree2JaGYzszW3Tz2QPrNRj2XHox45NMLvPRk2g1RqlA64TNv9g3QrkjpB+q8to1Qkc59MZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772755128; c=relaxed/relaxed;
	bh=qJtO9dV/a12LOlMN5IETBh0hhQHpj32DpsR053nFryw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hdn+fSj+D8p2P/wiVH4zHxIVdHYq9hjMt8+vAn2gvq4vpW2eJ0qkc+bqbQQbfRQsqduDDOIwmMUSb6OeP8Ju5Jt5kjDD07bXE83jDdaxPO+/zcvphzdX5Xhqvkk9qCu214RNCJTcSa5/42pWYlgl+/1n9pVNjEIIGrMTBdWeS3p2AY47p3RaFqFhvDEBGn1bbsTx2/nYRBVbvBnJ7ZQHK9lGfQmvjBIws8oW1yq1xEFQ9OVlFP8LrqFtpY+RXLm6qws4vFuJTF+2TaH9Mf7WVga+RFr8+9pNTLJD7ZZkPcRFqGjUpEsDq5XnvG1ZyQ3f8WcxtZLaDWz0kbZtDAjx3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=Tvl2j1qU; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=Tvl2j1qU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRmhl3Xjmz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 10:58:47 +1100 (AEDT)
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Nw4w04152111
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 15:58:06 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Nw4w04152111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772755088;
	bh=qJtO9dV/a12LOlMN5IETBh0hhQHpj32DpsR053nFryw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tvl2j1qUAzEOzpzYcXQS0HDWX3adrrEh8wGU4v6g3BKySEWm3C2C7N7KAEslkCD/E
	 j0mWPPahQcrnUpYonuB/XqRZBRARS5nEmqhvWuzwTipZgTaSbKeFgyWaowiUd42153
	 W7MStsBNkxFELd7Ua0ug4CAdu1aF7aWnHPLKAnKGLgvygP3YPLayYTvsiXAb3FaFZT
	 JKrUtuYJyk4iWE4XrNI9xqZLO4q9kEtp3+p0jqjDQ721IZmuf1wgsaxQhQozEAFd76
	 RGAdRJL6GAk2KUvF8L9JrLDfa7jSFNoyWL3JroGMHmBAm94WVUO71tOQTKh8CZxiYj
	 iqR+oML2O5VlA==
Message-ID: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
Date: Thu, 5 Mar 2026 15:57:59 -0800
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
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
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 892C7219948
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
	TAGGED_FROM(0.00)[bounces-17787-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On 2026-03-05 01:24, Thomas Weißschuh wrote:
> 
>> Weak references would be a way to work around the link failures. 
> 
> I am still not sure where "the link failures" should be coming from.
> The only sense I can make out of it, is if somebody manually and directly links
> to vdso.so. Like in the following example:
> 
> $ cat test.c 
> #include <stdio.h>
> 
> #include <linux/time.h>
> 
> int __vdso_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts);
> 
> int main(void)
> {
> 	struct __kernel_timespec ts;
> 	int ret;
> 
> 	printf("__vdso_clock_gettime=%p\n", __vdso_clock_gettime);
> 
> 	ret = __vdso_clock_gettime(CLOCK_REALTIME, &ts);
> 	printf("ret=%d\n", ret);
> }
> $ gcc test.c /lib/modules/$(uname -r)/vdso/vdso64.so
> $ ./a.out 
> __vdso_clock_gettime=0x7ff6ba2eeb80
> ret=0
> 
> This actually works on glibc (not on musl). But it is highly non-standard and
> relies on multiple implementation details. Furthermore it can fail to run on
> systems without a vDSO, as mentioned before.
> 
> Is this the usage pattern you have in mind?
> Do you know of anybody doing things this way?
> 

Yes, and yes, I do.

	-hpa


