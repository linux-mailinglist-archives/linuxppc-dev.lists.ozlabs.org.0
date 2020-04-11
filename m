Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D21A4D13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 02:55:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zbym12MgzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 10:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nYQkCG/t; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zbx45q7vzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 10:53:59 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id v2so3480722oto.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 17:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JBgJASJfnDwkgMQN4l8ATKxMtMfeF+zEyoNKOHKE83k=;
 b=nYQkCG/ti640vRtcezUMJVNuMoGNsLDw8w6PT0V+CXcWtPB3/HQFcNIKbKmknkuBBz
 Zofh1dEhSC74JMh72cRNqoa3OKBx6lHVX/K2/kS6zHCu/AnDQ4R7/G6WXVO7lPCDiZLU
 4rsx/lAdAvspZwBYXnWZLOexDP9fZ1/0x+SBnjRuSvCWELSgv24OJbSCUb9UPfISoUft
 ySGX5aWPez0up/TOEUO9eeyW2F8aMJ6v26OWVfP4wSgFYh8Gqf/o3L9h4e6YeIZeuoWG
 5hjwjGGqQVdfpFYk/xJEASCnPyauQ/zLpjNuU+gSrX0lBRZwl1PQeYckB944IKEaKQWj
 YmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JBgJASJfnDwkgMQN4l8ATKxMtMfeF+zEyoNKOHKE83k=;
 b=R1/icspbtnxBHY+iiPhxQmSk5piET8yM3MwwV3Vjoy/WiYuP3iRSt128qR9HBU0ubY
 UdhTrDTkkZvkwZaPqMmuECE/korrXpf49LZWlwA3wtmlW/RDrdXGw0D3xETG9QgYXoiE
 7NAKcWxl+lMB2dOshuGeP0ycicLVZa4EffNwS8VtNmhmrKVjweLbeNTQXMtJIPL6Ut+3
 hpof+tOtEqUPnx+OKMgmABIO1CuKtMhh3g+0/FKreDc6OBYi9yZU+WEmq6aVMMD9QfN4
 DwHoKLssyduVSrZktvhJrjPoZ0QjDsLws5He/qB/7e4kftiP222W/XBSLLylA+lfC+IQ
 0nSg==
X-Gm-Message-State: AGi0Pubq43AAI7RC96ZiWkSSmXBcOYrnFh6cPdBUST+eDGVXNh2JDuIt
 zjXj9xOMsX6nXaLIT9h8R1c=
X-Google-Smtp-Source: APiQypLDAEhSETIXlzLU6WzXLBcY+sUXjHrz2R1aeSf3vBMpkOt+L5RZLyld93TbHn/1ei7SAFva0g==
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr5945804otb.90.1586566435854; 
 Fri, 10 Apr 2020 17:53:55 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id q187sm2109546oih.48.2020.04.10.17.53.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 17:53:55 -0700 (PDT)
Date: Fri, 10 Apr 2020 17:53:54 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586564375.zt8lm9finh.astroid@bobo.none>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Hi Nicholas,

On Sat, Apr 11, 2020 at 10:29:45AM +1000, Nicholas Piggin wrote:
> Nathan Chancellor's on April 11, 2020 6:59 am:
> > Hi all,
> > 
> > Recently, our CI started running into several hangs when running the
> > spinlock torture tests during a boot with QEMU 3.1.0 on
> > powernv_defconfig and pseries_defconfig when compiled with Clang.
> > 
> > I initially bisected Linux and came down to commit 3282a3da25bd
> > ("powerpc/64: Implement soft interrupt replay in C") [1], which seems to
> > make sense. However, I realized I could not reproduce this in my local
> > environment no matter how hard I tried, only in our Docker image. I then
> > realized my environment's QEMU version was 4.2.0; I compiled 3.1.0 and
> > was able to reproduce it then.
> > 
> > I bisected QEMU down to two commits: powernv_defconfig was fixed by [2]
> > and pseries_defconfig was fixed by [3].
> 
> Looks like it might have previously been testing power8, now power9?
> -cpu power8 might get it reproducing again.

Yes, that is what it looks like. I can reproduce the hang with both
pseries-3.1 and powernv8 on QEMU 4.2.0.

> > I ran 100 boots with our boot-qemu.sh script [4] and QEMU 3.1.0 failed
> > approximately 80% of the time but 4.2.0 and 5.0.0-rc1 only failed 1% of
> > the time [5]. GCC 9.3.0 built kernels failed approximately 3% of time
> > [6].
> 
> Do they fail in the same way? Was the fail rate at 0% before upgrading
> kernels?

Yes, it just hangs after I see the print out that the torture tests are
running.

[    2.277125] spin_lock-torture: Creating torture_shuffle task
[    2.279058] spin_lock-torture: Creating torture_stutter task
[    2.280285] spin_lock-torture: torture_shuffle task started
[    2.281326] spin_lock-torture: Creating lock_torture_writer task
[    2.282509] spin_lock-torture: torture_stutter task started
[    2.283511] spin_lock-torture: Creating lock_torture_writer task
[    2.285155] spin_lock-torture: lock_torture_writer task started
[    2.286586] spin_lock-torture: Creating lock_torture_stats task
[    2.287772] spin_lock-torture: lock_torture_writer task started
[    2.290578] spin_lock-torture: lock_torture_stats task started

Yes, we never had any failures in our CI before that upgrade happened. I
will try to run a set of boot tests with a kernel built at the commit
right before 3282a3da25bd and at 3282a3da25bd to make triple sure I did
fall on the right commit.

> > Without access to real hardware, I cannot really say if there is a
> > problem here. We are going to upgrade to QEMU 4.2.0 to fix it. This is
> > more of an FYI so that there is some record of it outside of our issue
> > tracker and so people can be aware of it in case it comes up somewhere
> > else.
> 
> Thanks for this I'll try to reproduce. You're not running SMP guest?

No, not as far as I am aware at least. You can see our QEMU line in our
CI and the boot-qemu.sh script I have listed below:

https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/318260635

> Anything particular to run the lock torture test? This is just 
> powernv_defconfig + CONFIG_LOCK_TORTURE_TEST=y ?

We do enable some other configs, you can see those here:

https://github.com/ClangBuiltLinux/continuous-integration/blob/c02d2f008a64d44e62518bc03beb1126db7619ce/configs/common.config
https://github.com/ClangBuiltLinux/continuous-integration/blob/c02d2f008a64d44e62518bc03beb1126db7619ce/configs/tt.config

The tt.config values are needed to reproduce but I did not verify that
ONLY tt.config was needed. Other than that, no, we are just building
either pseries_defconfig or powernv_defconfig with those configs and
letting it boot up with a simple initramfs, which prints the version
string then shuts the machine down.

Let me know if you need any more information, cheers!
Nathan

> Thanks,
> Nick
> 
> > 
> > [1]: https://git.kernel.org/linus/3282a3da25bd63fdb7240bc35dbdefa4b1947005
> > [2]: https://git.qemu.org/?p=qemu.git;a=commit;h=f30c843ced5055fde71d28d10beb15af97fdfe39
> > [3]: https://git.qemu.org/?p=qemu.git;a=commit;h=34a6b015a98733a4b32881777dafd70156c5a322.
> > [4]: https://github.com/ClangBuiltLinux/boot-utils/blob/5f49a87e272fbe967a8d26cf405cec15b024702c/boot-qemu.sh
> > [5]: https://user-images.githubusercontent.com/11478138/78957618-b1842080-7a9a-11ea-8856-279c3dcc6c19.png
> > [6]: https://user-images.githubusercontent.com/11478138/78955535-62d38800-7a94-11ea-9e61-9e3d8c068ace.png
> > 
> > Cheers,
> > Nathan
> > 
