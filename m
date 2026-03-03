Return-Path: <linuxppc-dev+bounces-17635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID0XDhZMp2l2ggAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:01:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D691F70AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQSrf2PQZz2xS3;
	Wed, 04 Mar 2026 08:01:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772571666;
	cv=none; b=QUOU0Xb6O9OiKFlqnYvhRor4/9L/a0J944jENYfTTljV0scV0mHCigWOWgpvvwYyj0viQgzxcRNsDY7yqRulEtCW6GHs54OngUy5cqj3vEGXppkFG7leXxlbYMiiiqqag+2glORH8oEpZ1DLxJXq2KOF8JiZLqjq4t1S1m+sJXMCtqYJi7J+RJ1vDvimbz8gr9eYhGpSTVGykSuVCKuAdFS3JqjogitQ002nT10ncZzD7BLlKYCUU4GPqrbplmDxnLMgMON0NPm2Bmwz05IY8ni8ZRHngibLNNdziVu9H47MZyjvZIhsT0qb56wnIwofmZCi1kJmjKPJ9gas31bcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772571666; c=relaxed/relaxed;
	bh=VYCoMox874UkG41AFwcqLA/NfPlaOlGxygnVG+NrNEI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jjOnOEjiK0KI4pGto2EoGpRXogEloTcoQZObWJhF6t29IFnVoh7tyEZ5mr0E+Bwo8woEteuzBbEPbhh6plVxi3sKzxoIR+m2ko5kVzbBee6TsamKhKDtmhYwTYYo1QYo0t18Ii19d1gljWLTaOUOymEDEYTGV+oHwnfW+vYgb75Wg2NNB/xBFQ/CFgb3zVMqkdD7cupYXyC1i8QO1qn8BKYVhtbJkX9QFiVYELYl9QTKTLm4b42DrHwnoFMSNmMA5i0eOMH9E1QY0dfpFdch708dQY8n1VqG4YMTjYY6RRTIPmzMc3lo48pm88MsFyo2FKw31g1/r16pZXi/gbtaMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=J04tWHXJ; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=J04tWHXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQSrd1pPSz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 08:01:04 +1100 (AEDT)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623L07cW3276874
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:00:08 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623L07cW3276874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772571609;
	bh=VYCoMox874UkG41AFwcqLA/NfPlaOlGxygnVG+NrNEI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=J04tWHXJRQ4G1vgUJxAr5RbvTbGLR/cHWVslG2ysvgZVqum75IEoDC6dtGc3RlEKN
	 gUgGPOAd9MXe8CpG/crlLctiNQxJBMOT+cXYXjrFtYd/ntsm2/P8UIzdSo2DMS6ark
	 Vu3+lFth/GOPA8muhWjcE1ynqs1UpAoaFJpUajmj+BiMnuK0U4mSRCtSZ1GIIeuvIa
	 mZ97PzkWn/kLprWX0cl5Mi4+xj7F5yQHjWd+WIjcipqFzUiIDQhiPDGeAseJOqICmR
	 WDrvasLJ1NsDoRQE3mNCnwQHbwWCc38WW8I2ZcCDD1Zk0XtigDVyZiABIDdAPpUE/W
	 EQp9NarHAcRQQ==
Date: Tue, 03 Mar 2026 13:00:02 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
Message-ID: <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
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
X-Rspamd-Queue-Id: 47D691F70AF
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
	TAGGED_FROM(0.00)[bounces-17635-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,zytor.com:dkim,zytor.com:mid]
X-Rspamd-Action: no action

On March 3, 2026 12:50:33 PM PST, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Tue, Mar 3, 2026, at 19:11, H=2E Peter Anvin wrote:
>> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>>>>>
>>>> The thing about gettimeofday() and time() is that they don't have
>>>> a 64-bit version and libc implementations are expected to call
>>>> clock_gettime() instead=2E The result was that there was never a
>>>> patch to turn the off either=2E
>>>=20
>>> gettimeofday() is currently the only way to get the timezone of the ke=
rnel=2E
>>> But I guess this is a legacy thing anyways=2E If you say we should dro=
p it,
>>> let's drop it=2E
>>>=20
>>
>> The time zone in the kernel has never worked anyway, as it would requir=
e the
>> kernel to contain at least the forward portion of the zoneinfo/tzdata t=
able in
>> order to actually work correctly=2E The only plausible use of it would =
be for
>> local time-based filesystems like FAT, but I don't think we bother=2E
>>
>> A bigger question is whether or not we should omit these from the vDSO
>> completely (potentially causing link failures) or replace them with stu=
bs
>> returning -ENOSYS=2E
>
>I see no harm in keeping gettimeofday() in the vdso when
>COMPAT_32BIT_TIME is turned on, as existing code will call it
>no matter whether it's in the vdso or the syscall=2E
>
>Equally, I see no point in having either version of
>gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
>disabled, as clearly anything calling it would pass incorrect
>data for times past 2038=2E
>
>Neither glibc nor musl support actually returning the kernel
>timezone to callers of gettimeofday in modern versions that
>support time64 syscalls=2E
>
>      Arnd
>

That wasn't the point=2E The point was what kind of error behavior we want=
=2E

