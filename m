Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF535FCF29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 02:04:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnqWd1qZfz3dsh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 11:04:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZEqQSm3D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnqVk4t1Bz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 11:03:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZEqQSm3D;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MnqVc0j32z4x1D;
	Thu, 13 Oct 2022 11:03:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665619422;
	bh=zrHj0Im3XzEaXNXwkjAVIYfuVKt/SSQKPhuOxhwgClo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZEqQSm3Dp+p9JDjRFOTkZjDpD/YP9Aod5LwTZF6DETuMq4a8oc4j2reSkpnpCQErx
	 X17pBml+KFx6axYuvIlxdaLRL1zFiI48D/BQ4QDmwwawJk5Vdt5rbNmVZEt4ggEh1D
	 dtFCO1qP6M3bvx55RVvwFDUDGJoyR75BCPWHQPLNdKUeUExOy+4tU34twoRpb1wFS5
	 OMvIUqpayMN546BP5AlEmFqWgFB+AqS+6mTpGYb8PlrWxaMbqvKjMSSeShT0TjzuD5
	 s00H/qpoxEgVcur18rW76m20fFv/pu0LOMdIA3eoDmUVe53P56CaWX+Fh1VHgm/LRy
	 0hxrel/TCSM+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
In-Reply-To: <20221012221615.GA364143@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012221615.GA364143@roeck-us.net>
Date: Thu, 13 Oct 2022 11:03:34 +1100
Message-ID: <87bkqgmvxl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
>> 
>> I've also managed to not hit this bug a few times. When it triggers,
>> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
>> optimized if possible.", there's a long hang - tens seconds before it
>> continues. When it doesn't trigger, there's no hang at that point in the
>> boot process.
>> 
>
> I managed to bisect the problem. See below for results. Reverting the
> offending patch fixes the problem for me.

Thanks.

This is probably down to me/us not testing with PREEMPT enabled enough.

cheers

> ---
> # bad: [1440f576022887004f719883acb094e7e0dd4944] Merge tag 'mm-hotfixes-stable-2022-10-11' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> # good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
> git bisect start 'HEAD' 'v6.0'
> # good: [7171a8da00035e7913c3013ca5fb5beb5b8b22f0] Merge tag 'arm-dt-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good 7171a8da00035e7913c3013ca5fb5beb5b8b22f0
> # good: [f01603979a4afaad7504a728918b678d572cda9e] Merge tag 'gpio-updates-for-v6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
> git bisect good f01603979a4afaad7504a728918b678d572cda9e
> # bad: [8aeab132e05fefc3a1a5277878629586bd7a3547] Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
> git bisect bad 8aeab132e05fefc3a1a5277878629586bd7a3547
> # bad: [493ffd6605b2d3d4dc7008ab927dba319f36671f] Merge tag 'ucount-rlimits-cleanups-for-v5.19' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
> git bisect bad 493ffd6605b2d3d4dc7008ab927dba319f36671f
> # good: [0e470763d84dcad27284067647dfb4b1a94dfce0] Merge tag 'efi-next-for-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
> git bisect good 0e470763d84dcad27284067647dfb4b1a94dfce0
> # bad: [110a58b9f91c66f743c01a2c217243d94c899c23] powerpc/boot: Explicitly disable usage of SPE instructions
> git bisect bad 110a58b9f91c66f743c01a2c217243d94c899c23
> # good: [fdfdcfd504933ed06eb6b4c9df21eede0e213c3e] powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
> git bisect good fdfdcfd504933ed06eb6b4c9df21eede0e213c3e
> # good: [c2e7a19827eec443a7cbe85e8d959052412d6dc3] powerpc: Use generic fallocate compatibility syscall
> git bisect good c2e7a19827eec443a7cbe85e8d959052412d6dc3
> # good: [56adbb7a8b6cc7fc9b940829c38494e53c9e57d1] powerpc/64/interrupt: Fix false warning in context tracking due to idle state
> git bisect good 56adbb7a8b6cc7fc9b940829c38494e53c9e57d1
> # bad: [754f611774e4b9357a944f5b703dd291c85161cf] powerpc/64: switch asm helpers from GOT to TOC relative addressing
> git bisect bad 754f611774e4b9357a944f5b703dd291c85161cf
> # bad: [f7bff6e7759b1abb59334f6448f9ef3172c4c04a] powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
> git bisect bad f7bff6e7759b1abb59334f6448f9ef3172c4c04a
> # bad: [e485f6c751e0a969327336c635ca602feea117f0] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
> git bisect bad e485f6c751e0a969327336c635ca602feea117f0
> # good: [799f7063c7645f9a751d17f5dfd73b952f962cd2] powerpc/64: mark irqs hard disabled in boot paca
> git bisect good 799f7063c7645f9a751d17f5dfd73b952f962cd2
> # first bad commit: [e485f6c751e0a969327336c635ca602feea117f0] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
