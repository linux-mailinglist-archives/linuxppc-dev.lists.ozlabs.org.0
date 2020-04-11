Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F71A4CF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 02:31:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zbRP2t2NzDrLZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 10:31:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RHKcRvaf; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zbPR1sqgzDrDm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 10:30:03 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id h11so1169164plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 17:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=aaKjpU9iJarIHkIt+wznu3DX79hsHU5tbzm52tqbQrE=;
 b=RHKcRvafcMmirS9Pal35Jg9r1NoEP4Vxczp3py0DRCPexVZvrQc5sGDxkvG/XKgVbW
 s52SM/yHkT0pBtYjfyR9TRwerpIKTUqya3Na84y7WfdZYD6jkvifPIdpl84SpCim7RQ+
 0cTlL0T5rDEr/FBwXuCV770x8DAU5WZYBfvdBpIifibbbCZ/YqkHOl3pOu9U3VzCQiT5
 LjDlrND28LqZHFesPJ2R/AlsHEAAVo+DSstweU+ZKYdBzMAby7oPB1odGacx7VajK/O4
 DuiOVJECYW9P5yWwtxOTj2OlUJ/O1PAYxZzym2CtfgAENPngIujM2jTY5MkZflGyXxJp
 jZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=aaKjpU9iJarIHkIt+wznu3DX79hsHU5tbzm52tqbQrE=;
 b=SMeMpOPxoCAD5MPV3CaAVI4wOVHGm6BelAKceCyPn6cGxEY88GYbdxUJqANvwZ5bVl
 4cKt5QdfLPBLD7ZCXtTif1g3XcFfPVthHhOJlnsujQ+kIVB/O2Ksv7HnZRxrLBdpYHBv
 ocKfE8svBN7zTCkRwYgssvJ2B0a63iGwjQKV0Y8dFfGQhAch2+wN2tFc/fVYydzo/vgq
 MhMgmwfdVoVXLhBvtz/p5zqtMRq1rec3HbnLja4Co8QW2mTbU+XU7iAMlqLhA9ehHCG4
 20T/c5Ysq5ANPCnkD2j6CAV0SA/gW3lgsQsOlw4DizTmSmaE3dma8SivXGQD8auYmclr
 DBuA==
X-Gm-Message-State: AGi0Pualv53LkXG3K5R8vXmp7pvScDF3wRcAp0bME0e7yJyjV+0WzO5N
 d0/UKmgPvhSwAZl0V8dNDeQ=
X-Google-Smtp-Source: APiQypLrucVZVSV1eVHZg2XUIsYNlVF8WEGhzm4ARaYfSfkmoIWykMPomAhL7oRfPnoYkvDjzNKH6A==
X-Received: by 2002:a17:90a:f30e:: with SMTP id
 ca14mr8263255pjb.134.1586564999264; 
 Fri, 10 Apr 2020 17:29:59 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y13sm2776027pfp.88.2020.04.10.17.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 17:29:58 -0700 (PDT)
Date: Sat, 11 Apr 2020 10:29:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
To: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 Nathan Chancellor <natechancellor@gmail.com>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586564375.zt8lm9finh.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor's on April 11, 2020 6:59 am:
> Hi all,
>=20
> Recently, our CI started running into several hangs when running the
> spinlock torture tests during a boot with QEMU 3.1.0 on
> powernv_defconfig and pseries_defconfig when compiled with Clang.
>=20
> I initially bisected Linux and came down to commit 3282a3da25bd
> ("powerpc/64: Implement soft interrupt replay in C") [1], which seems to
> make sense. However, I realized I could not reproduce this in my local
> environment no matter how hard I tried, only in our Docker image. I then
> realized my environment's QEMU version was 4.2.0; I compiled 3.1.0 and
> was able to reproduce it then.
>=20
> I bisected QEMU down to two commits: powernv_defconfig was fixed by [2]
> and pseries_defconfig was fixed by [3].

Looks like it might have previously been testing power8, now power9?
-cpu power8 might get it reproducing again.

> I ran 100 boots with our boot-qemu.sh script [4] and QEMU 3.1.0 failed
> approximately 80% of the time but 4.2.0 and 5.0.0-rc1 only failed 1% of
> the time [5]. GCC 9.3.0 built kernels failed approximately 3% of time
> [6].

Do they fail in the same way? Was the fail rate at 0% before upgrading
kernels?

>=20
> Without access to real hardware, I cannot really say if there is a
> problem here. We are going to upgrade to QEMU 4.2.0 to fix it. This is
> more of an FYI so that there is some record of it outside of our issue
> tracker and so people can be aware of it in case it comes up somewhere
> else.

Thanks for this I'll try to reproduce. You're not running SMP guest?
Anything particular to run the lock torture test? This is just=20
powernv_defconfig + CONFIG_LOCK_TORTURE_TEST=3Dy ?

Thanks,
Nick

>=20
> [1]: https://git.kernel.org/linus/3282a3da25bd63fdb7240bc35dbdefa4b194700=
5
> [2]: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Df30c843ced5055fde7=
1d28d10beb15af97fdfe39
> [3]: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D34a6b015a98733a4b3=
2881777dafd70156c5a322.
> [4]: https://github.com/ClangBuiltLinux/boot-utils/blob/5f49a87e272fbe967=
a8d26cf405cec15b024702c/boot-qemu.sh
> [5]: https://user-images.githubusercontent.com/11478138/78957618-b1842080=
-7a9a-11ea-8856-279c3dcc6c19.png
> [6]: https://user-images.githubusercontent.com/11478138/78955535-62d38800=
-7a94-11ea-9e61-9e3d8c068ace.png
>=20
> Cheers,
> Nathan
>=20
=
