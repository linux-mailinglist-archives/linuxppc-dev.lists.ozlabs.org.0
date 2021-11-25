Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9845D3F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 05:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J04v22k5Xz2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 15:40:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kMmEciTC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=hurricos@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kMmEciTC; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J04SG6TMNz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 15:21:00 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id bi37so12906608lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1BJtHCCY9G3E1sfZMPHG2DaRPAvcmGSHXzzpanPe5c8=;
 b=kMmEciTCvceVq3mnLjwbyTZFVgh3eJTGkcDfssstvhmgXroKSWwbkByvBLv6o2XBWP
 K8udpwgk4KWSDCVrkurmiGnhvxvjgeHNudEOjRkxdU3oEp/myaKXe71RcrWoAJjKxos3
 OEjPSV9zEFr1rSXSOfVehccc489x9SoeKbf77epTNpuVw16sORDqc04qgqAAzVooSvcU
 xRMo5hdo6gS1fMMrttQbxyE9Tw+Z9gVU5wWK0Az5mjqc7sE5i/81jH8DWhiVCI+g7aem
 gTd4Tq4L1LrbSt4e3GvjLcNU+yhcKv6OGLkWnqbya1IRzxz4xQwSSnnkrja3KOzhHV1x
 Xyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1BJtHCCY9G3E1sfZMPHG2DaRPAvcmGSHXzzpanPe5c8=;
 b=TEgbwSXLj7n7B5xC2wXDR4aCF8T8qBra3tu7OtqsuYkFmHcOLer4i2ylOwCjqsO/6b
 4AUuXlkY2OMyVMsdX/UAAp2bdavnhns8V6wT+Z09wt357FWTIU1tIkXGfMhWQxP6qTdT
 ldSctfFgwIpYRAqUM4BKZfdwlWgx//ifa4fTyt2dcujuApq3JXAjih7cCkziHcWozEzq
 6FL0epctkSFEbcQd5oYDroE20039BVokrN9RIOaYIpzCDVb4aF3vTGFAbRlLYIXvwvm6
 jYTqdMXxOsfRL3dHF3eP/UAuEAVQ/2a/WfgAUIWgYfJYRL79F4tyXdG1lzfb83cue45O
 a/KA==
X-Gm-Message-State: AOAM533iGCFa1sL7MtuDIS1HTb7gkrWMhSSkPG1CGLtRmPSqro/qGhpm
 GxBcqHw6e0rwTRlOzPukmDky3hUNj2xoHT/PPTE=
X-Google-Smtp-Source: ABdhPJwIUVOssHp4RJMjyoSr68KBMRojUjNHwX3vpvilFt42LJ1Vj3q8MPELBB+vaW00fTUs5ywW7Nl/+MJVK3l9gww=
X-Received: by 2002:a05:6512:310e:: with SMTP id
 n14mr21359864lfb.475.1637814052533; 
 Wed, 24 Nov 2021 20:20:52 -0800 (PST)
MIME-Version: 1.0
From: Martin Kennedy <hurricos@gmail.com>
Date: Wed, 24 Nov 2021 23:20:41 -0500
Message-ID: <CANA18Uxu5dUYOkDmXpYtLc8iQuAYMv1UujkmEo1bkhm3CqxMAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc:85xx: fix timebase sync issue when
 CONFIG_HOTPLUG_CPU=n
To: nixiaoming@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Nov 2021 15:40:12 +1100
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
Cc: chenjianguo3@huawei.com, wangle6@huawei.com, chenhui.zhao@freescale.com,
 Christian Lamparter <chunkeey@gmail.com>, oss@buserror.net,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Yuantian.Tang@feescale.com, paul.gortmaker@windriver.com, paulus@samba.org,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 liuwenliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi there,

I have bisected OpenWrt master, and then the Linux kernel down to this
change, to confirm that this change causes a kernel panic on my
P1020RDB-based, dual-core Aerohive HiveAP 370, at initialization of
the second CPU:

:
[    0.000000] Linux version 5.10.80 (labby@lobon)
(powerpc-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0
r18111+1-ebb6f9287e) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Thu
Nov 25 02:49:35 2021
[    0.000000] Using P1020 RDB machine description
:
[    0.627233] smp: Bringing up secondary CPUs ...
[    0.681659] kernel tried to execute user page (0) - exploit attempt? (uid: 0)
[    0.766618] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
[    0.848899] Faulting instruction address: 0x00000000
[    0.908273] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.972851] BE PAGE_SIZE=4K SMP NR_CPUS=2 P1020 RDB
[    1.031179] Modules linked in:
[    1.067640] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.80 #0
[    1.139507] NIP:  00000000 LR: c0021d2c CTR: 00000000
[    1.199921] REGS: c1051cf0 TRAP: 0400   Not tainted  (5.10.80)
[    1.269705] MSR:  00021000 <CE,ME>  CR: 84020202  XER: 00000000
[    1.340534]
[    1.340534] GPR00: c0021cb8 c1051da8 c1048000 00000001 00029000
00000000 00000001 00000000
[    1.340534] GPR08: 00000001 00000000 c08b0000 00000040 22000208
00000000 c00032c4 00000000
[    1.340534] GPR16: 00000000 00000000 00000000 00000000 00000000
00000000 00029000 00000001
[    1.340534] GPR24: 1ffff240 20000000 dffff240 c080a1f4 00000001
c08ae0a8 00000001 dffff240
[    1.758220] NIP [00000000] 0x0
[    1.794688] LR [c0021d2c] smp_85xx_kick_cpu+0xe8/0x568
[    1.856126] Call Trace:
[    1.885295] [c1051da8] [c0021cb8] smp_85xx_kick_cpu+0x74/0x568 (unreliable)
[    1.968633] [c1051de8] [c0011460] __cpu_up+0xc0/0x228
[    2.029038] [c1051e18] [c0031bbc] bringup_cpu+0x30/0x224
[    2.092572] [c1051e48] [c0031f3c] cpu_up.constprop.0+0x180/0x33c
[    2.164443] [c1051e88] [c00322e8] bringup_nonboot_cpus+0x88/0xc8
[    2.236326] [c1051eb8] [c07e67bc] smp_init+0x30/0x78
[    2.295698] [c1051ed8] [c07d9e28] kernel_init_freeable+0x118/0x2a8
[    2.369641] [c1051f18] [c00032d8] kernel_init+0x14/0x124
[    2.433176] [c1051f38] [c0010278] ret_from_kernel_thread+0x14/0x1c
[    2.507125] Instruction dump:
[    2.542541] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX XXXXXXXX
[    2.635242] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX XXXXXXXX
[    2.727952] ---[ end trace 9b796a4bafb6bc14 ]---
[    2.783149]
[    3.800879] Kernel panic - not syncing: Fatal exception
[    3.862353] Rebooting in 1 seconds..
[    5.905097] System Halted, OK to turn off power

Without this patch, the kernel no longer panics:

[    0.627232] smp: Bringing up secondary CPUs ...
[    0.681857] smp: Brought up 1 node, 2 CPUs

Here is the kernel configuration for this built kernel:
https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/mpc85xx/config-5.10;hb=HEAD

In case a force-push is needed for the source repository
(https://github.com/Hurricos/openwrt/commit/ad19bdfc77d60ee1c52b41bb4345fdd02284c4cf),
here is the device tree for this board:
https://paste.c-net.org/TrousersSliced

Martin
