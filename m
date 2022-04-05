Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7E4F24B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 09:27:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXfPB3Z72z3fWT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 17:27:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OE6pHiCx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OE6pHiCx; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXfFg38vLz3cf8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 17:21:10 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id kd21so9385332qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Apr 2022 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPpAoyuBEdyoI7OKBC1Gj0JCWKJIkJvLzRzsQDCHLs0=;
 b=OE6pHiCxNkbKHRoG9G67M5ukrACvQOZtQV8X+4P5jXHiQ4VYmuQiXuremZZLnsHrbD
 vGXnkWrmqCsuPwkIfW2h9w0uwO+8kJC68dYR3NySyggWI0NP3kExRmnQjwm/iSu6HZ2r
 HJHeJINmucx18o886Nh0YICEw2egQlTnuoK6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPpAoyuBEdyoI7OKBC1Gj0JCWKJIkJvLzRzsQDCHLs0=;
 b=OnhBQVxG215FYinfd6dOuwLNoXmAJsJxmqOX9mujqHQ++VtI/uOUcHqeOzvRCIWAvc
 6Qe6iPv5fLxQIjDtFFET4lgehjvgqiWAebwV4pbDW5eLEOzZ1w6tmKrcrIqAjehR1X2z
 WUSTBtiy4xFcF70AKd7OcN8aC6CcFH26L447gZk+JMyBBJzYoaCPYradiEeuaf/yzfnJ
 hg5M6gavsD7TF5l8NE6/N5pGjr9aijK7HJ4BAhC8tKVgVyOd+d9P5MNCjNDfGGV42Muy
 uSUeYw8nz+Ll1ShYqbJvkO0Dawplofe3Lm1gsaozGB29oYCyuSIhb4h1PRVNDnBTLcQk
 1vww==
X-Gm-Message-State: AOAM531JhlH/O5VxC3XBJ+QICkcllzBVJa99m9oJK2KHpGTNio9KwtDS
 Rdgy3SsyK6FGI1XxBMsayqIQu3k0/q2fMU8wDKw=
X-Google-Smtp-Source: ABdhPJyv1Nj//+hWOplS07oOVUfcCgkUnREacKv6PdckKSwUJeiWKzlX7qiNH/YERIL1ND/VoEoVXj1adY4L670IK8s=
X-Received: by 2002:a05:6214:d42:b0:441:831b:fa1b with SMTP id
 2-20020a0562140d4200b00441831bfa1bmr1388187qvr.130.1649143266335; Tue, 05 Apr
 2022 00:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220404101536.104794-1-ruscur@russell.cc>
 <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
 <874k3883ct.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k3883ct.fsf@mpe.ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Apr 2022 07:20:54 +0000
Message-ID: <CACPK8XfM-odZm=AvjsmfB7fdK+3xc7gcwZX97H_1f8=ZOCAx4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Murilo_Opsfelder_Ara=C3=BAjo?= <mopsfelder@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 5 Apr 2022 at 06:13, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Joel Stanley <joel@jms.id.au> writes:
> > On Mon, 4 Apr 2022 at 10:15, Russell Currey <ruscur@russell.cc> wrote:
> >>
> >> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
> >> no-need-l1d-flush-kernel-on-user-access are the equivalents of
> >> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
> >> from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.
> >>
> >> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
> >> check for entry and uaccess flushes") the condition for disabling the
> >> L1D flush on kernel entry and user access was changed from any non-P9
> >> CPU to only checking P7 and P8.  Without the appropriate device-tree
> >> checks for newer processors on powernv, these flushes are unnecessarily
> >> enabled on those systems.  This patch corrects this.
> >>
> >> Fixes: d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes")
> >> Reported-by: Joel Stanley <joel@jms.id.au>
> >> Signed-off-by: Russell Currey <ruscur@russell.cc>
> >
> > I booted both patches in this series on a power10 powernv machine,
> > applied on top of v5.18-rc1:
> >
> > $ dmesg |grep -i flush
> > [    0.000000] rfi-flush: fallback displacement flush available
> > [    0.000000] rfi-flush: patched 12 locations (no flush)
> > [    0.000000] count-cache-flush: flush disabled.
> > [    0.000000] link-stack-flush: flush disabled.
> >
> > $ grep . /sys/devices/system/cpu/vulnerabilities/*
> > /sys/devices/system/cpu/vulnerabilities/itlb_multihit:Not affected
> > /sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
> > /sys/devices/system/cpu/vulnerabilities/mds:Not affected
> > /sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
> > /sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Not affected
> > /sys/devices/system/cpu/vulnerabilities/spectre_v1:Mitigation: __user
> > pointer sanitization, ori31 speculation barrier enabled
> > /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation:
> > Software count cache flush (hardware accelerated), Software link stack
> > flush
> > /sys/devices/system/cpu/vulnerabilities/srbds:Not affected
> > /sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected
> >
> > Does that match what we expect?
>
> AFAIK yes. Happy for ruscur to correct me though.
>
> Can you also try running the kernel selftests under
> tools/testing/selftests/powerpc/security/ ?

Here's the results when booted with no_spectrev2 (which I keep on
doing by accident, as this machine has it in it's nvram):

make[1]: Entering directory
'/home/joel/dev/kernels/linus/tools/testing/selftests/powerpc/security'
TAP version 13
1..5
# selftests: powerpc/security: rfi_flush
# test: rfi_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with rfi_flush=0: 63101900 < 95000000) [10/10 pass]
# PASS (L1D misses with rfi_flush=1: 196001003 > 190000000) [10/10 pass]
# success: rfi_flush_test
ok 1 selftests: powerpc/security: rfi_flush
# selftests: powerpc/security: entry_flush
# test: entry_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with entry_flush=0: 52766044 < 95000000) [10/10 pass]
# PASS (L1D misses with entry_flush=1: 196082833 > 190000000) [10/10 pass]
# success: entry_flush_test
ok 2 selftests: powerpc/security: entry_flush
# selftests: powerpc/security: uaccess_flush
# test: uaccess_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with uaccess_flush=0: 68646267 < 95000000) [10/10 pass]
# PASS (L1D misses with uaccess_flush=1: 194177355 > 190000000) [10/10 pass]
# success: uaccess_flush_test
ok 3 selftests: powerpc/security: uaccess_flush
# selftests: powerpc/security: spectre_v2
# test: spectre_v2
# tags: git_version:v5.18-rc1-0-g312310928417
# sysfs reports: 'Vulnerable'
#  PM_BR_PRED_CCACHE: result          0 running/enabled 2090650862
# PM_BR_MPRED_CCACHE: result          1 running/enabled 2090648016
# Miss percent 0 %
# OK - Measured branch prediction rates match reported spectre v2 mitigation.
# success: spectre_v2
ok 4 selftests: powerpc/security: spectre_v2
# selftests: powerpc/security: mitigation-patching.sh
# Spawned threads enabling/disabling mitigations ...
# Waiting for timeout ...
# OK
ok 5 selftests: powerpc/security: mitigation-patching.sh


Here's the same thing without the command line option set:

make[1]: Entering directory
'/home/joel/dev/kernels/linus/tools/testing/selftests/powerpc/security'
TAP version 13
1..5
# selftests: powerpc/security: rfi_flush
# test: rfi_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with rfi_flush=0: 47289780 < 95000000) [10/10 pass]
# PASS (L1D misses with rfi_flush=1: 195001301 > 190000000) [10/10 pass]
# success: rfi_flush_test
ok 1 selftests: powerpc/security: rfi_flush
# selftests: powerpc/security: entry_flush
# test: entry_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with entry_flush=0: 63510274 < 95000000) [10/10 pass]
# PASS (L1D misses with entry_flush=1: 195093006 > 190000000) [10/10 pass]
# success: entry_flush_test
ok 2 selftests: powerpc/security: entry_flush
# selftests: powerpc/security: uaccess_flush
# test: uaccess_flush_test
# tags: git_version:v5.18-rc1-0-g312310928417
# PASS (L1D misses with uaccess_flush=0: 62184912 < 95000000) [10/10 pass]
# PASS (L1D misses with uaccess_flush=1: 196018163 > 190000000) [10/10 pass]
# success: uaccess_flush_test
ok 3 selftests: powerpc/security: uaccess_flush
# selftests: powerpc/security: spectre_v2
# test: spectre_v2
# tags: git_version:v5.18-rc1-0-g312310928417
# sysfs reports: 'Mitigation: Software count cache flush (hardware
accelerated), Software link stack flush'
#  PM_BR_PRED_CCACHE: result          0 running/enabled 2016985490
# PM_BR_MPRED_CCACHE: result          1 running/enabled 2016981520
# Miss percent 0 %
# OK - Measured branch prediction rates match reported spectre v2 mitigation.
# success: spectre_v2
ok 4 selftests: powerpc/security: spectre_v2
# selftests: powerpc/security: mitigation-patching.sh
# Spawned threads enabling/disabling mitigations ...
# Waiting for timeout ...
# OK
ok 5 selftests: powerpc/security: mitigation-patching.sh




>
> I suspect some of them might fail, because they have specific knowledge
> of things and might need an update.
>
> cheers
