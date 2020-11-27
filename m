Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0EA2C5EA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 03:04:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chybd62xTzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 13:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=KVXsCq7A; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChyZ663WDzDrDg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 13:02:37 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id b63so3091731pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 18:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:date:message-id:mime-version;
 bh=kLRSiy0jW2k3T4Timgh74JclLsE8e709GGZ1X6Muygw=;
 b=KVXsCq7AbKDIGOfkPdNpAOiVoDAVuaCyIE1c4g9h3IZnuOBTU244SyyVExs3sPsPDL
 sedtdFGnLZuMgIt2LimDe2eDjQCvsnhhwvVyaG8I/a9Xua/D2wMLNNYgRl8STMgmA0s/
 i1J89qGS1s6Rbtf46aN0m0iPIrFXBHV6iiWYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
 bh=kLRSiy0jW2k3T4Timgh74JclLsE8e709GGZ1X6Muygw=;
 b=W/JUQP1Cv97MN05Jmz+U4f6+e0uQhXUfonPrOB4tFS40+nQiSM34ZAHsPeY1/rYUuK
 +QBdn9+34uRZNeVSAY8zdx6F/JExxh4mfdB9KcHKt2Av6i9S6B7Sv+2StuYr5yYtiBvm
 8Pyp/wMWJBL8dWaroNL5A73h2badxED0MfZypdIi8G/5kCXIIadfakAhqENSmIjkxKp1
 bWbrKgrNq9LxwNOr6EF92c5xI3Wcay0G1fUn6mxCJXwk7kKS3GPGE9zOUrFBYS+1rvsj
 XaMi1OiThseI5JQCZL9s3V0hr8u2q08kIzU0jD79qMssQTOKWtYOWmYkMsyaAYnLQsHZ
 XaOA==
X-Gm-Message-State: AOAM531wdpMw5oSg4IjqS0s56Abhg+FOH9w/AMYXtYIGBJhdmgzF1aTL
 W8QYXS3jy36lJ6oU0w1plgHe2A==
X-Google-Smtp-Source: ABdhPJzhXog8Ats0AhlIXNoSzCkWhbDuGymnfKdZ7SqnfIOKimnM/wqXIV6Ye9N1PBdd/pFtpOEW0g==
X-Received: by 2002:a17:90a:4405:: with SMTP id
 s5mr6813487pjg.219.1606442553908; 
 Thu, 26 Nov 2020 18:02:33 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f892-9c2d-d399-9d41.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f892:9c2d:d399:9d41])
 by smtp.gmail.com with ESMTPSA id ge21sm7733180pjb.5.2020.11.26.18.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 18:02:33 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Date: Fri, 27 Nov 2020 13:02:29 +1100
Message-ID: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

I'm having some difficulty tracking down a bug.

Some configurations of the powerpc kernel since somewhere in the 5.10
merge window fail to boot on some ppc64 systems. They hang while trying
to bring up SMP. It seems to depend on the RCU_SCALE/PERF_TEST option.
(It was renamed in the 5.10 merge window.)

I can reproduce it as follows with qemu tcg:

make -j64 pseries_le_defconfig
scripts/config -m RCU_SCALE_TEST
scripts/config -m RCU_PERF_TEST
make -j 64 vmlinux CC="ccache gcc"

qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel vmlinux

...
[    0.036284][    T0] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
[    0.036481][    T0] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
[    0.148168][    T1] POWER9 performance monitor hardware support registered
[    0.151118][    T1] rcu: Hierarchical SRCU implementation.
[    0.186660][    T1] smp: Bringing up secondary CPUs ...
<hangs>

I have no idea why RCU_SCALE/PERF_TEST would be causing this, but that
seems to be what does it: if I don't set that, the kernel boots fine.

I've tried to git bisect it, but I keep getting different results:
always a random merge of a seemingly-unrelated subsystem tree - things
like armsoc or integrity or input.

It appears to also depend on the way the kernel is booted. Testing with
a Canonical kernel, so a slightly different config but including
RCU_SCALE_TEST=m, I see:

Power8 host + KVM + grub         -> boots
Power9 host bare metal (kexec)   -> fails
Power9 host + KVM + grub         -> fails
Power9 host + KVM + qemu -kernel -> boots
qemu TCG + power9 cpu            -> fails
qemu TCG + power8 cpu            -> fails

Any ideas?

Kind regards,
Daniel

$ qemu-system-ppc64 -version
QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.9)

$ gcc --version
gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0

It also happens when compiling with GCC 7 and 10.


