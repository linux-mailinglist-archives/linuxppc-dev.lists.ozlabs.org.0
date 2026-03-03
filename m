Return-Path: <linuxppc-dev+bounces-17620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB8vH8ssp2mbfgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:47:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B931F5711
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:47:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQPtZ68nvz3bsC;
	Wed, 04 Mar 2026 05:47:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772563654;
	cv=none; b=V7O1Tb47UqDkhgURwfVneYL27mYtxL2RtdRu81FbPsAAxUDzCKwRd37/sMqfr9gBeZTDWSXSnrkXXrR/oVZLUvJfpscch23sU65oBJG3OwDVs689DFuqb3YXVH9SXjHj7oJjwamGkzg96vQ3uL8uIX0GJTex0to4tXAOsp3uBgv/CjTO4t3XGZV0/pPlpkoLBaDv33vs4nu8tOjBkTs2PQOdBNn/GN9jxbKEsdH4VLWEvJz9frEmpwdVAWL3MeuqmcuF7On8H1/Z+NUyIQYxnDtIVhBNrQH9vqV3Q2ISqLVyQeApXrAzWRL3YNBPzHm6eNoWkX5Lz9UZk6RUdu8Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772563654; c=relaxed/relaxed;
	bh=+zVA5SdbXqXmCBN/Z5gDUy/tneGY24otJLTMGQOtDJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euHZ+u2H9YVY0FgRO9emuHymM0BqBRb84hfyYRVg20lkLc8G0DrW6OiSMmLO9RFaPG8Gr18aWx8/DmAzsiJuvtcIOh6pNmqh7QANIYprGuoPZUUFll0RfAepSQ3D6sYodrAi95yM5IqZCVzgmyHXX+947m2DUWygnT2GdAK9Dr/VG5XaENe0c9s0FXHj54CSW0vln4hksWihBxUGxPiPUwlQP+OK3C4IWrRcay1GzxGZG/1hN0YaNyKwKyGy3M9cYsJdot0C0yMnjup6MbvJBK5GNIKrQkVER7NtSvVDD3f5W50N1uWImgOqszkScQHTFzSBIZNdwgKixPL6YTrNCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=UDipitNJ; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=UDipitNJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1078 seconds by postgrey-1.37 at boromir; Wed, 04 Mar 2026 05:47:32 AEDT
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQPtX4VQ1z3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 05:47:32 +1100 (AEDT)
Received: from [IPV6:2601:646:8081:9481:7d9f:6fce:330c:4416] ([IPv6:2601:646:8081:9481:7d9f:6fce:330c:4416])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623IBwxb3007270
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 10:12:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623IBwxb3007270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772561541;
	bh=+zVA5SdbXqXmCBN/Z5gDUy/tneGY24otJLTMGQOtDJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDipitNJ+TnURncz+4axXj5t727f1dxWqKkdtf58mQoedGdBe2o6JBVgdoP8CO7Ry
	 9CB3uFtQMRRW/yGu8Wm5Nr3ezlS0W7fWzd4ec6e+CvnVrSml2ZkMkpW+vdbh8cdE4A
	 UWnWgRW5FF9zmA6VgvCm+uj0SnRi673RqA2gPwRn/NJknbzRxdD/hYAo9y3Ucezhr6
	 yRzBTg3CHgnlPltD5GKLMqCzYLrOu80yOIJAODFtsiiesImNH+wMjPboHoThWc7fx9
	 1tt7EA7eKrLMpdA0tuDDV81GNoJTInNE2aLg9ZprcxHpNhQk18AhMWWmmMkbRDsUvm
	 OxPHbOmqHIh2g==
Message-ID: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Date: Tue, 3 Mar 2026 10:11:52 -0800
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
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: F3B931F5711
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
	TAGGED_FROM(0.00)[bounces-17620-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On 2026-02-27 01:34, Thomas Weißschuh wrote:
>>>
>> The thing about gettimeofday() and time() is that they don't have
>> a 64-bit version and libc implementations are expected to call
>> clock_gettime() instead. The result was that there was never a
>> patch to turn the off either.
> 
> gettimeofday() is currently the only way to get the timezone of the kernel.
> But I guess this is a legacy thing anyways. If you say we should drop it,
> let's drop it.
> 

The time zone in the kernel has never worked anyway, as it would require the
kernel to contain at least the forward portion of the zoneinfo/tzdata table in
order to actually work correctly. The only plausible use of it would be for
local time-based filesystems like FAT, but I don't think we bother.

A bigger question is whether or not we should omit these from the vDSO
completely (potentially causing link failures) or replace them with stubs
returning -ENOSYS.

	-hpa


