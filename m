Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45994480C1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HntBc5W56z3bmx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 01:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jGfpwYs0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jGfpwYs0; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnt9x6g58z2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 01:03:15 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id r28so15242916pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=vfKWO8T5GZBGCrDfYUdrnOtGOmW0SuMF01lP0DpObiQ=;
 b=jGfpwYs08KKxrd7D08rE9LOqvG/ixeTYRPjNh+t46FPhGEgPfVRb1rKcuW/6eF5np3
 r0k0/ToM450hxcXkIhE81k32btTnALSo0IXALeS44gqNdQ1rkekZbdM1RIv5t3q9nmCc
 FR9XfC3+VTQl0boI8hBDEjnxLqCYJ7RQGKlhGPjdpBqtfXWnmTqsGvqFxaoea8PbQlok
 dGFu1EQ5HCqSO39di2brROkq3Z0GTqS22JOZgoyCy15+617xGxke7MW6IdQlfh/jyKks
 TcNqHOybH0QAU8m2dgcL8oWdLbB5MGyGjMSIv3GOHRFB6BSpz2i2aG8QgluB3fm4Xns5
 32mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vfKWO8T5GZBGCrDfYUdrnOtGOmW0SuMF01lP0DpObiQ=;
 b=UjodrWFRpfm7d1d4aNBmTbPwsoM+NK3mQOE6EelWQBJe8sI10zc6Nu9HMmdwcTgDKx
 F0/Yi7x9ouzS1o7xDJrNZNVFOo8M3YvCWfXszbbN0GRCKMcNEl6QEeZ0+/tmAtBey6U+
 tSm/4OxNqzFUU7R5AlE9aAvBWreZedtTISumF58/JtHeLJKjDmKkCutKfsZhEmjSmLtn
 QRY6+LpOrrKRJN4iShwZsipIyloUS73+kgUwkimIN29xwZ+mb4Z8Ot2JJjIodxIP8GUH
 gMRZRr+18UMaWwd13sANMmS7FLv1r+QJaoR+JASKEubxlDGu8Kg58rwQ3L0IVe44i2oY
 6rhQ==
X-Gm-Message-State: AOAM532L3xs5iqspv2z7eea5xpk87I0T81rOdw2S+xVYFn8zqvy1wUKE
 6VwmmuQYZleSXKYG/VDF4RJ2JiGjw0k=
X-Google-Smtp-Source: ABdhPJwnxiSm9/+HFHpLjV0HJxXxAauulQWBQNAwpwvgGf5jyx+Cojv+R3sw/shoJUn8tWo+i3z8Qg==
X-Received: by 2002:a63:e755:: with SMTP id j21mr64357pgk.235.1636380192518;
 Mon, 08 Nov 2021 06:03:12 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id e15sm15621744pfc.134.2021.11.08.06.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:03:11 -0800 (PST)
Date: Tue, 09 Nov 2021 00:03:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: introduce CONFIG_MAXSMP to test very large
 SMP
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211105041132.1443767-1-npiggin@gmail.com>
 <87pmrb6ws6.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmrb6ws6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1636379634.t1oqdo5jl5.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of November 8, 2021 3:28 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Similarly to x86, add MAXSMP that should help flush out problems with
>> vary large SMP and other values associated with very big systems.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/Kconfig                   | 8 ++++++++
>>  arch/powerpc/platforms/Kconfig.cputype | 5 +++--
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index b8f6185d3998..d585fcfa456f 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
>>  config NEED_PER_CPU_PAGE_FIRST_CHUNK
>>  	def_bool y if PPC64
>> =20
>> +config MAXSMP
>> +	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
>> +	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
>> +	help
>> +	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
>> +	  If unsure, say N.
>=20
> As evidenced by the kernel robot report, I think we need to exclude this
> from allyesconfig.
>=20
> Because our max is 16K, larger than the 8K on x86, we are going to be
> constantly hitting stack usage errors in driver code. Getting those
> fixed tends to take time, because the driver authors don't see the
> warnings when they build for other arches, and because the fixes go via
> driver trees.

Yeah I realised after I hit send. Surprisingly there weren't too many
but agree going ahead of x86 would always come with annoyances and at
least would have to fix existing tree.

> Making MAXSMP depend on !COMPILE_TEST should do the trick.

I'll do that. Or maybe make it 8192 if COMPILE_TEST otherwise 16384.

The reason for 16K is if we bump the deault at some point we might go to=20
8K, in which case it would be good to have a test above it to catch
marginal cases.

Thanks,
Nick
