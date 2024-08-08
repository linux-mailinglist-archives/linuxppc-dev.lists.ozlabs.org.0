Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5994C2FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 18:46:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+NgWP9F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WftH51hYgz2yNf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 02:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+NgWP9F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WftGJ1ccMz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 02:45:58 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc5549788eso11443715ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135557; x=1723740357; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iS4FMchnREFWPCXR0AfnXAqNGlHQ0vvYX58exUAZSyo=;
        b=D+NgWP9F3BO3+gTAwXG+Wp6mSCs18l+2YqGNMofEERyxbFGfuOACeps6N+cjyV0C70
         lAl7osZZbziL+KkDK45cwO/I8UliYB3YlqsuhilKw45sewLnhwwmEPfHG4cUlg5ys/R1
         mA+0gsKNEGZtO1J9FdgnPJgMCCAZLPwphwflM1uzLIrgVJyxDIqIge4hH9VaQ8Aj11md
         srfFHocNEJ+wmII2FnipFvpPvkLmJN5ESBlaFD0oo8d1Wd1vopI8AxZUbroCW6w7nmAq
         f27XrRokJojwen1hmxQS7WglrY2vlDhX5VMaPYda/Ux+mJxwqmvdt6O+fOegLyR7zvl5
         it3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135557; x=1723740357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS4FMchnREFWPCXR0AfnXAqNGlHQ0vvYX58exUAZSyo=;
        b=aVJ7mZ+SMqy+EfGkNIajFGQzL94aLh2SHMU3RXx/9QT26S1b31Sblg1aRpH28osDRp
         0nLZibhVVZQ6QHfy0Qo55qkAI3a5XzjLpwyW7jJaLtQIU6qlZ7fi6ZW6TeND6EXMQtkL
         pt+1Bca4jViGAkJsLsvPMgaMWKczzLBBdPeiGPhOVWfuZgBGbS5ldiNtXgd2ff59gioZ
         bGCpWhyJWczrOMFJ3mVqkVJUYZB1RYQg+pyhWwNd9MiGaC9uvYit6vUqWWa9zjr2GIWS
         0/ago873j8SyKBm9Y/DaxAllYSruTWs7E60YI3oGlhcSz6qUxR6itmjyX/r+Nn+GHNwN
         YBIg==
X-Gm-Message-State: AOJu0YxaOrux4q3g4OM/YhfOjhy/gdnYgOhysBf6x75SYWzkPawRAEW6
	KwiYpV8YuygcUyXT0KW+P8Gqh7FlwY779V3hw4I3mbrOjl8/Crbh
X-Google-Smtp-Source: AGHT+IHI1dkfiHvwjRjvRVTgtFNrN4Mxb1bCTsgW5AxeEL0/shuTRi5+0pgviMfnnLQwQwhw83rMuQ==
X-Received: by 2002:a17:902:db0d:b0:1fc:3daf:8a0f with SMTP id d9443c01a7336-200952274a5mr28788425ad.7.1723135556500;
        Thu, 08 Aug 2024 09:45:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59179793sm126793415ad.200.2024.08.08.09.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:45:56 -0700 (PDT)
Date: Thu, 8 Aug 2024 09:45:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Backtrace in ppc SMP code after enabling security modules
Message-ID: <506a1b59-8680-44ae-9cc5-e2cccb32da78@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I recently enabled several security module options in my test system.

CONFIG_SECURITY=y
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
CONFIG_SECURITY_LANDLOCK=y
CONFIG_SECURITY_LANDLOCK_KUNIT_TEST=y
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_LOADPIN=y
CONFIG_SECURITY_SAFESETID=y
CONFIG_BPF_LSM=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"

When running ppc tests in qemu with the above enabled on top of SMP
configuratins such as corenet32_smp_defconfig or mpc85xx_smp_defconfig,
I get the following runtime warning.

...
LSM: initializing lsm=lockdown,capability,landlock,yama,loadpin,safesetid
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/smp.c:779 smp_call_function_many_cond+0x518/0x9d4
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.11.0-rc2-00127-g2e3e7093e9c8 #1
Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
NIP:  c0172ca8 LR: c01731b0 CTR: 00000000
REGS: c2669d60 TRAP: 0700   Not tainted  (6.11.0-rc2-00127-g2e3e7093e9c8)
MSR:  00021000 <CE,ME>  CR: 24004288  XER: 20000000
GPR00: c002255c c2669e50 c253b5c0 c267b484 00000000 00000000 00000001 c2680000
GPR08: 00000000 00000003 c2680000 00000000 44004288 020a1e18 00000000 00000000
GPR16: 00000000 00000000 00000001 00000000 c0000000 c01731b0 00000000 c267b484
GPR24: c00224fc c0773760 c0770b50 00000000 00000000 00029000 00000000 00000000
NIP [c0172ca8] smp_call_function_many_cond+0x518/0x9d4
LR [c01731b0] smp_call_function+0x3c/0x58
Call Trace:
[c2669eb0] [84000282] 0x84000282
[c2669ec0] [c002255c] flush_tlb_kernel_range+0x2c/0x50
[c2669ed0] [c0023b8c] patch_instruction+0x108/0x1b0
[c2669ef0] [c00188a4] arch_static_call_transform+0x104/0x148
[c2669f10] [c2033ebc] security_add_hooks+0x138/0x24c
[c2669f40] [c2032e24] capability_init+0x24/0x38
[c2669f50] [c203322c] initialize_lsm+0x48/0x90
[c2669f70] [c2033b68] security_init+0x31c/0x538
[c2669fa0] [c2001154] start_kernel+0x5d4/0x81c
[c2669ff0] [c0000478] set_ivor+0x150/0x18c
Code: 91220000 81620004 3d20c209 3929e478 556b103a 7c84582e 7c89202e 81220000 2c040000 3929ffff 91220000 40a2fbb8 <0fe00000> 4bfffbb0 80e20000 2c070000
irq event stamp: 1204
hardirqs last  enabled at (1203): [<c11d85f8>] _raw_spin_unlock_irqrestore+0x70/0xa8
hardirqs last disabled at (1204): [<c0023bcc>] patch_instruction+0x148/0x1b0
softirqs last  enabled at (50): [<c0064b4c>] handle_softirqs+0x348/0x508
softirqs last disabled at (43): [<c0006fd0>] do_softirq_own_stack+0x34/0x4c
---[ end trace 0000000000000000 ]---
landlock: Up and running.
Yama: becoming mindful.
LoadPin: ready to pin (currently not enforcing)
...

Any idea how that can be fixed ?

Thanks,
Guenter
