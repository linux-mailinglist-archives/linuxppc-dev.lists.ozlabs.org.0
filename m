Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E16125A31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 05:00:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ddSM0gtjzDqmT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 15:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="JSxWh4JN"; 
 dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ddQZ5DG0zDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 14:58:28 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id l12so3866530qtq.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 19:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=k4eq1tsjI4N+dCmP20F1GO1zoclUAiI9XzZa4bk41AM=;
 b=JSxWh4JNgDw5y5egNZ3/7bjSQC/JVAYkHHqX3nzDCX2424bAsFc3WRCe5E+oTj6DvQ
 j/K5JgLO3OYuPHWapJ2eb4D0a64qDY7uUSUseKMI096/91NwIqr2UCzJdIB10wCa820m
 NhRKA8m0DtklGVgLL1HEpMARh1k6cuv1dOrWMhDnXjacDCV4ipCI510PuivLPdRArxS8
 ezzWeSc/QTslhtIj0+ABHU7DSYU4wvVkYSSy6NhNRy3P9kdl9pwBEdUkuvLiydnsqP1B
 8bp1HulUQxpQh3ragXhXZBblRO/jz27Y90vxPcb8eLVuNqiQEho0fXo/dVjAyFcxRacE
 oaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=k4eq1tsjI4N+dCmP20F1GO1zoclUAiI9XzZa4bk41AM=;
 b=FPoOh0L1922ZxD41g/9aHHXgBLrZPwb0pW7TsqPMj7AY6JGgW50wPF/pvCznP7fPtj
 Kdz1CXmPnt2jc6PtPU4iscTmDoXZJT09VzUc4bxr11AnwbgTzU7sRVL6OVuhanT8PdME
 p2Yk9kMgP5mL0xHnj1TOBze/Fs/fPRvz1tp/nnTPIXuSw0H8oFKL8dgKAyWrYw3SPsfC
 ej+DilUWNezf5SfQclIiGZXMOReUeqgsToAA75EJadR57OT2OpBaQZHH4cz3yO+8/hnx
 Q8m/ANPx0baCUN2lKpsD082dh3eOZoAplt9M6MCwZjA7KZT6y2NSVI/0q9wQdgUZzxex
 GF4w==
X-Gm-Message-State: APjAAAWpsqI+TsqEzGfnhI7bzj96lk6QCHrXO/YjGQOdrYbtrNQKbZD/
 Nkq4TinERDbUJsXNo7eY/YcWLA==
X-Google-Smtp-Source: APXvYqwzAXwA84CQs9N+g8dkcmOZfbmLTVIwbfth/35AMLn7h9U9KE/Wnrx9F2pYBFTImam8NRcW8w==
X-Received: by 2002:aed:3e12:: with SMTP id l18mr5140425qtf.91.1576727905487; 
 Wed, 18 Dec 2019 19:58:25 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id j194sm1367615qke.83.2019.12.18.19.58.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 19:58:24 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: "ftrace: Rework event_create_dir()" triggers boot error messages
Message-Id: <0FA8C6E3-D9F5-416D-A1B0-5E4CD583A101@lca.pw>
Date: Wed, 18 Dec 2019 22:58:23 -0500
To: Peter Zijlstra <peterz@infradead.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Alexei Starovoitov <ast@kernel.org>, clang-built-linux@googlegroups.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The linux-next commit "ftrace: Rework event_create_dir()=E2=80=9D [1] =
triggers boot warnings
for Clang-build (Clang version 8.0.1) kernels (reproduced on both arm64 =
and powerpc).
Reverted it (with trivial conflict fixes) on the top of today=E2=80=99s =
linux-next fixed the issue.

configs:
https://raw.githubusercontent.com/cailca/linux-mm/master/arm64.config
https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config

[1] https://lore.kernel.org/lkml/20191111132458.342979914@infradead.org/

[  115.799327][    T1] Registered efivars operations
[  115.849770][    T1] clocksource: Switched to clocksource =
arch_sys_counter
[  115.901145][    T1] Could not initialize trace point =
events/sys_enter_rt_sigreturn
[  115.908854][    T1] Could not create directory for event =
sys_enter_rt_sigreturn
[  115.998949][    T1] Could not initialize trace point =
events/sys_enter_restart_syscall
[  116.006802][    T1] Could not create directory for event =
sys_enter_restart_syscall
[  116.062702][    T1] Could not initialize trace point =
events/sys_enter_getpid
[  116.069828][    T1] Could not create directory for event =
sys_enter_getpid
[  116.078058][    T1] Could not initialize trace point =
events/sys_enter_gettid
[  116.085181][    T1] Could not create directory for event =
sys_enter_gettid
[  116.093405][    T1] Could not initialize trace point =
events/sys_enter_getppid
[  116.100612][    T1] Could not create directory for event =
sys_enter_getppid
[  116.108989][    T1] Could not initialize trace point =
events/sys_enter_getuid
[  116.116058][    T1] Could not create directory for event =
sys_enter_getuid
[  116.124250][    T1] Could not initialize trace point =
events/sys_enter_geteuid
[  116.131457][    T1] Could not create directory for event =
sys_enter_geteuid
[  116.139840][    T1] Could not initialize trace point =
events/sys_enter_getgid
[  116.146908][    T1] Could not create directory for event =
sys_enter_getgid
[  116.155163][    T1] Could not initialize trace point =
events/sys_enter_getegid
[  116.162370][    T1] Could not create directory for event =
sys_enter_getegid
[  116.178015][    T1] Could not initialize trace point =
events/sys_enter_setsid
[  116.185138][    T1] Could not create directory for event =
sys_enter_setsid
[  116.269307][    T1] Could not initialize trace point =
events/sys_enter_sched_yield
[  116.276811][    T1] Could not create directory for event =
sys_enter_sched_yield
[  116.527652][    T1] Could not initialize trace point =
events/sys_enter_munlockall
[  116.535126][    T1] Could not create directory for event =
sys_enter_munlockall
[  116.622096][    T1] Could not initialize trace point =
events/sys_enter_vhangup
[  116.629307][    T1] Could not create directory for event =
sys_enter_vhangup
[  116.783867][    T1] Could not initialize trace point =
events/sys_enter_sync
[  116.790819][    T1] Could not create directory for event =
sys_enter_sync
[  117.723402][    T1] pnp: PnP ACPI init
[  117.736379][    T1] system 00:00: [mem 0x30000000-0x3fffffff window] =
could not be reserved
[  126.020353][    T1] pnp: PnP ACPI: found 1 devices
[  126.093919][    T1] NET: Registered protocol family 2
[  126.180007][    T1] tcp_listen_portaddr_hash hash table entries: =
65536 (order: 6, 4718592 bytes, vmalloc)
[  126.206510][    T1] TCP established hash table entries: 524288 =
(order: 6, 4194304 bytes, vmalloc)
[  126.227766][    T1] TCP bind hash table entries: 65536 (order: 6, =
4194304 bytes, vmalloc)
[  126.240146][    T1] TCP: Hash tables configured (established 524288 =
bind 65536)=
