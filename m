Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABB5FCE41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 00:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mnn7q6L9Wz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:17:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fLycqik2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fLycqik2;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mnn6s6gm1z2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 09:16:19 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so332417pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 15:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcceU1SnNN9WxmhwpR7jvQXVmAOSHo4vqoVYcRh7uxw=;
        b=fLycqik2otARDGrY7ih6Yzrcy1ZkzLpukZGdimqpg7HXtPlwvps2fsMM7aJpnWWbgL
         QHTzrLraj5yOol98GgPCuaotebw1SEtOGQekbJUdOk7oX+ZlqplD4Fn0pRWHxQp10Iua
         CZLum6W2MO52qsYRh27dyKyEWVi29LRLascob1c1rw1dPGhMmNMAmnrGT2iLDmTRDv7B
         nfPKdCiJgb/dKM3jtS/9UD7+C+1YPSmnF7hfAFq2Kz/3li+rjiTqa9yF1Rbioq3uxU7n
         5xzlHjV9h+IFTHaIgOOmr9u4laDdV4d7cIHw07dS69TznGWkhjs4AlzpsF4eRmz4VFu1
         GBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcceU1SnNN9WxmhwpR7jvQXVmAOSHo4vqoVYcRh7uxw=;
        b=woVukrrr8R7fJwax7v+KYRsi6fsa9VM4foTFzu3gIbWPw3d7PNrEBzy0Gy2mU3uw3Y
         0f3XGivIPAtPZM4taJKJ7H5vdRh/txrAwYgV61v+wYspKvDJAtoNceQ6xve8dcqU0Sdp
         19oW3At1lthfzUvpW+c7F5wSMEuZdaKOrAGUueV/sxRoNYFSR84QAvtwExNHC7zQugMj
         QkOzo0Z09TSo+hVXHyYvnRlwVPXEK1BD+L1DvNXLa4AWFbGSgEcLdO+3g3klvMrQzbE/
         uE0rHtSRK+5TSo5E4gigY4O9rh+X+YFsl1C59ONFxspg55GOUfB27sSCgzHFEVISw0bh
         Q1Xg==
X-Gm-Message-State: ACrzQf0zzgzOVbEKHSfKgO5DREJFxh9r5i2ukelkFVN7mikLFkMOhQLn
	33uQ784/FX6teOveZ/94L34=
X-Google-Smtp-Source: AMsMyM6knrPCf9i6xOjmT2d6ZYKOxZ2Z1YUJG9HY0HExIw9QBlOBL9EqtFdYRkz7mR31+TeJCESQKQ==
X-Received: by 2002:a17:90a:4983:b0:20a:9509:8347 with SMTP id d3-20020a17090a498300b0020a95098347mr7456134pjh.101.1665612977610;
        Wed, 12 Oct 2022 15:16:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ecc200b001766a3b2a26sm11243466plh.105.2022.10.12.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:16:16 -0700 (PDT)
Date: Wed, 12 Oct 2022 15:16:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221012221615.GA364143@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net>
 <Y0b3ZsTRHWG6jGK8@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0b3ZsTRHWG6jGK8@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
> 
> I've also managed to not hit this bug a few times. When it triggers,
> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> optimized if possible.", there's a long hang - tens seconds before it
> continues. When it doesn't trigger, there's no hang at that point in the
> boot process.
> 

I managed to bisect the problem. See below for results. Reverting the
offending patch fixes the problem for me.

Guenter

---
# bad: [1440f576022887004f719883acb094e7e0dd4944] Merge tag 'mm-hotfixes-stable-2022-10-11' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
# good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
git bisect start 'HEAD' 'v6.0'
# good: [7171a8da00035e7913c3013ca5fb5beb5b8b22f0] Merge tag 'arm-dt-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 7171a8da00035e7913c3013ca5fb5beb5b8b22f0
# good: [f01603979a4afaad7504a728918b678d572cda9e] Merge tag 'gpio-updates-for-v6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
git bisect good f01603979a4afaad7504a728918b678d572cda9e
# bad: [8aeab132e05fefc3a1a5277878629586bd7a3547] Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
git bisect bad 8aeab132e05fefc3a1a5277878629586bd7a3547
# bad: [493ffd6605b2d3d4dc7008ab927dba319f36671f] Merge tag 'ucount-rlimits-cleanups-for-v5.19' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
git bisect bad 493ffd6605b2d3d4dc7008ab927dba319f36671f
# good: [0e470763d84dcad27284067647dfb4b1a94dfce0] Merge tag 'efi-next-for-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi
git bisect good 0e470763d84dcad27284067647dfb4b1a94dfce0
# bad: [110a58b9f91c66f743c01a2c217243d94c899c23] powerpc/boot: Explicitly disable usage of SPE instructions
git bisect bad 110a58b9f91c66f743c01a2c217243d94c899c23
# good: [fdfdcfd504933ed06eb6b4c9df21eede0e213c3e] powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
git bisect good fdfdcfd504933ed06eb6b4c9df21eede0e213c3e
# good: [c2e7a19827eec443a7cbe85e8d959052412d6dc3] powerpc: Use generic fallocate compatibility syscall
git bisect good c2e7a19827eec443a7cbe85e8d959052412d6dc3
# good: [56adbb7a8b6cc7fc9b940829c38494e53c9e57d1] powerpc/64/interrupt: Fix false warning in context tracking due to idle state
git bisect good 56adbb7a8b6cc7fc9b940829c38494e53c9e57d1
# bad: [754f611774e4b9357a944f5b703dd291c85161cf] powerpc/64: switch asm helpers from GOT to TOC relative addressing
git bisect bad 754f611774e4b9357a944f5b703dd291c85161cf
# bad: [f7bff6e7759b1abb59334f6448f9ef3172c4c04a] powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
git bisect bad f7bff6e7759b1abb59334f6448f9ef3172c4c04a
# bad: [e485f6c751e0a969327336c635ca602feea117f0] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
git bisect bad e485f6c751e0a969327336c635ca602feea117f0
# good: [799f7063c7645f9a751d17f5dfd73b952f962cd2] powerpc/64: mark irqs hard disabled in boot paca
git bisect good 799f7063c7645f9a751d17f5dfd73b952f962cd2
# first bad commit: [e485f6c751e0a969327336c635ca602feea117f0] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
