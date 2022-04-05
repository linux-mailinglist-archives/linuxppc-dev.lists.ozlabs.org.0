Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECAF4F22EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 08:14:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXcm80svqz3bZq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 16:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X5L78gQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXclT2xyBz2xn8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 16:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X5L78gQU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KXclR2C6yz4xdB;
 Tue,  5 Apr 2022 16:13:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649139203;
 bh=Ywg9/TgCFPTUTPJnoCOtgBcbRDLSX7zy/xpw31fOzh8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X5L78gQU4Z8c5L+5iCPE+gUSpBtHUAf4OUACbcp/CV5KCCVY1KalTC0UOVqExUx+u
 vuNilFxPKlvhcDgdvROet3kt+KEaonabAlOTMYnl0Dv3SBwQQgqyxMrL4tlulg3oX9
 ztVKFA6jomYoTEY8mpBCBTKixy2ZkAGhRcPrtij2DPulgy+za4RinbbADsmZfdT9f+
 6AsCIydrcCa5ciMX9kMTjmylgaMJtgKOttE+ycaH6aG4VIg50lak/3Oc7fAzEPW4U7
 pmEr+aHS7owgNEEj51HyRy3ISYytb4V1DJxiFK6eCOmx8rKJQjltOe5T4TmcYUcoPa
 ZnEtZipb/f/Xw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
In-Reply-To: <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
References: <20220404101536.104794-1-ruscur@russell.cc>
 <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
Date: Tue, 05 Apr 2022 16:13:22 +1000
Message-ID: <874k3883ct.fsf@mpe.ellerman.id.au>
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
Cc: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <mopsfelder@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Mon, 4 Apr 2022 at 10:15, Russell Currey <ruscur@russell.cc> wrote:
>>
>> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
>> no-need-l1d-flush-kernel-on-user-access are the equivalents of
>> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
>> from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.
>>
>> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
>> check for entry and uaccess flushes") the condition for disabling the
>> L1D flush on kernel entry and user access was changed from any non-P9
>> CPU to only checking P7 and P8.  Without the appropriate device-tree
>> checks for newer processors on powernv, these flushes are unnecessarily
>> enabled on those systems.  This patch corrects this.
>>
>> Fixes: d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes")
>> Reported-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> I booted both patches in this series on a power10 powernv machine,
> applied on top of v5.18-rc1:
>
> $ dmesg |grep -i flush
> [    0.000000] rfi-flush: fallback displacement flush available
> [    0.000000] rfi-flush: patched 12 locations (no flush)
> [    0.000000] count-cache-flush: flush disabled.
> [    0.000000] link-stack-flush: flush disabled.
>
> $ grep . /sys/devices/system/cpu/vulnerabilities/*
> /sys/devices/system/cpu/vulnerabilities/itlb_multihit:Not affected
> /sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
> /sys/devices/system/cpu/vulnerabilities/mds:Not affected
> /sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
> /sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Not affected
> /sys/devices/system/cpu/vulnerabilities/spectre_v1:Mitigation: __user
> pointer sanitization, ori31 speculation barrier enabled
> /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation:
> Software count cache flush (hardware accelerated), Software link stack
> flush
> /sys/devices/system/cpu/vulnerabilities/srbds:Not affected
> /sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected
>
> Does that match what we expect?

AFAIK yes. Happy for ruscur to correct me though.

Can you also try running the kernel selftests under
tools/testing/selftests/powerpc/security/ ?

I suspect some of them might fail, because they have specific knowledge
of things and might need an update.

cheers
