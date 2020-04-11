Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBF1A4F2D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 11:33:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zqSv1SbzzDqll
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 19:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Da+d4aFr; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zqRC6YhfzDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 19:32:21 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w3so1490588plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=d3Tf2jlkAJhQezW/Lmoo2HtN3Pu6mLR5iQRSPNHGKn4=;
 b=Da+d4aFr538mgVxcd3J+3TKFc850yzV48CRkHfx17R2+GcEeCqcN0w2LlHhzS7ru7H
 arMa2JN8b0htvVISXczKpuaud/d0zNOPLIFVQdymL/NlT2akw1XMMVxccBJiBLm3Apy3
 60hg646wzWcTO6oVLVVwvnODw/FfURykN05A1QIWTX0rCgd6KwbsZn0T040Sf3cg64Kz
 Ua0d6ySLgsRyGikiSZSAiiF9idmDG4h1+pViQxRq2B8Sp4S1nQnRBlPqoT6Oes0hzQvb
 Ge30eUJIPC12CEuxln1KTtZOFjhC+wPSUqRiqql7Gp7Jky8BFA22OljHxhesgv5XqzcM
 8WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=d3Tf2jlkAJhQezW/Lmoo2HtN3Pu6mLR5iQRSPNHGKn4=;
 b=TEnd/6zgDXDGnF3Fn2L/hv9sDR4ShT4U3Ra4XqatddBuvxnkkSK8WhTimcdbxsE9P6
 nOfuLdraYiShv1vAQeksEj14sZhfZM0dgRVLnaUYxPkYMBHwa/G3A/6vzcEGdUAJ13QI
 fyCIw+jE8etLMbKW/6y0Zbee54rrRExB/rUXY05kSaPUcMIw3dRlrXK+MJNEsn39TIiA
 RFTvceteYM7Q/luYvTr664hLJgdiR3AEflnSY+qpyP9sUO4vF2RjsDXnh29URNSX5w9D
 2fC8rnw32tG7XFd3I754FOO7JxwiF8l3GDP/0yKUqcJxQ1DcLwgck1TY0Hdc4PP63hbX
 kMEw==
X-Gm-Message-State: AGi0PuYDSmsjjt2sk3zZGolDa5LsZdDa8ODddWyGq/0WiIJiMmxx5QQr
 AFUjmxarp6zYJmkX7/h9Ozk=
X-Google-Smtp-Source: APiQypLTE2jA6WUu6VvfL+YKj8+rwFeiAZYPDrICadhTwfrhJDueTfYS7rK3JO6bSr0DnscrfJev5A==
X-Received: by 2002:a17:902:8688:: with SMTP id
 g8mr8752120plo.268.1586597538072; 
 Sat, 11 Apr 2020 02:32:18 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id z8sm3781349pju.33.2020.04.11.02.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 02:32:17 -0700 (PDT)
Date: Sat, 11 Apr 2020 19:32:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586597161.xyshvdbjo6.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor's on April 11, 2020 10:53 am:
> Hi Nicholas,
>=20
> On Sat, Apr 11, 2020 at 10:29:45AM +1000, Nicholas Piggin wrote:
>> Nathan Chancellor's on April 11, 2020 6:59 am:
>> > Hi all,
>> >=20
>> > Recently, our CI started running into several hangs when running the
>> > spinlock torture tests during a boot with QEMU 3.1.0 on
>> > powernv_defconfig and pseries_defconfig when compiled with Clang.
>> >=20
>> > I initially bisected Linux and came down to commit 3282a3da25bd
>> > ("powerpc/64: Implement soft interrupt replay in C") [1], which seems =
to
>> > make sense. However, I realized I could not reproduce this in my local
>> > environment no matter how hard I tried, only in our Docker image. I th=
en
>> > realized my environment's QEMU version was 4.2.0; I compiled 3.1.0 and
>> > was able to reproduce it then.
>> >=20
>> > I bisected QEMU down to two commits: powernv_defconfig was fixed by [2=
]
>> > and pseries_defconfig was fixed by [3].
>>=20
>> Looks like it might have previously been testing power8, now power9?
>> -cpu power8 might get it reproducing again.
>=20
> Yes, that is what it looks like. I can reproduce the hang with both
> pseries-3.1 and powernv8 on QEMU 4.2.0.
>=20
>> > I ran 100 boots with our boot-qemu.sh script [4] and QEMU 3.1.0 failed
>> > approximately 80% of the time but 4.2.0 and 5.0.0-rc1 only failed 1% o=
f
>> > the time [5]. GCC 9.3.0 built kernels failed approximately 3% of time
>> > [6].
>>=20
>> Do they fail in the same way? Was the fail rate at 0% before upgrading
>> kernels?
>=20
> Yes, it just hangs after I see the print out that the torture tests are
> running.
>=20
> [    2.277125] spin_lock-torture: Creating torture_shuffle task
> [    2.279058] spin_lock-torture: Creating torture_stutter task
> [    2.280285] spin_lock-torture: torture_shuffle task started
> [    2.281326] spin_lock-torture: Creating lock_torture_writer task
> [    2.282509] spin_lock-torture: torture_stutter task started
> [    2.283511] spin_lock-torture: Creating lock_torture_writer task
> [    2.285155] spin_lock-torture: lock_torture_writer task started
> [    2.286586] spin_lock-torture: Creating lock_torture_stats task
> [    2.287772] spin_lock-torture: lock_torture_writer task started
> [    2.290578] spin_lock-torture: lock_torture_stats task started
>=20
> Yes, we never had any failures in our CI before that upgrade happened. I
> will try to run a set of boot tests with a kernel built at the commit
> right before 3282a3da25bd and at 3282a3da25bd to make triple sure I did
> fall on the right commit.
>=20
>> > Without access to real hardware, I cannot really say if there is a
>> > problem here. We are going to upgrade to QEMU 4.2.0 to fix it. This is
>> > more of an FYI so that there is some record of it outside of our issue
>> > tracker and so people can be aware of it in case it comes up somewhere
>> > else.
>>=20
>> Thanks for this I'll try to reproduce. You're not running SMP guest?
>=20
> No, not as far as I am aware at least. You can see our QEMU line in our
> CI and the boot-qemu.sh script I have listed below:
>=20
> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/=
318260635
>=20
>> Anything particular to run the lock torture test? This is just=20
>> powernv_defconfig + CONFIG_LOCK_TORTURE_TEST=3Dy ?
>=20
> We do enable some other configs, you can see those here:
>=20
> https://github.com/ClangBuiltLinux/continuous-integration/blob/c02d2f008a=
64d44e62518bc03beb1126db7619ce/configs/common.config
> https://github.com/ClangBuiltLinux/continuous-integration/blob/c02d2f008a=
64d44e62518bc03beb1126db7619ce/configs/tt.config
>=20
> The tt.config values are needed to reproduce but I did not verify that
> ONLY tt.config was needed. Other than that, no, we are just building
> either pseries_defconfig or powernv_defconfig with those configs and
> letting it boot up with a simple initramfs, which prints the version
> string then shuts the machine down.
>=20
> Let me know if you need any more information, cheers!

Okay I can reproduce it. Sometimes it eventually recovers after a long
pause, and some keyboard input often helps it along. So that seems like=20
it might be a lost interrupt.

POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
needed your other config with various other debug options.

Thanks for the very good report. I'll let you know what I find.

Thanks,
Nick
=
