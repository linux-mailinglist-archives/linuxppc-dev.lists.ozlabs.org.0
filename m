Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88E1B51C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 03:22:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49700l5VDCzDql6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 11:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=kpsx=6h=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496zyx5pntzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:21:13 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 199471] [Bisected][Regression] windfarm_pm* no longer gets
 automatically loaded when CONFIG_I2C_POWERMAC=y is set
Date: Thu, 23 Apr 2020 01:21:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dclarke@blastwave.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199471-206035-GkhXqTVxvZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199471-206035@https.bugzilla.kernel.org/>
References: <bug-199471-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199471

--- Comment #20 from Dennis Clarke (dclarke@blastwave.org) ---


Possibly unrelated but there appears to be a small memory leak within
windfarm_* somewhere given that I see traffic in kmemleak :


enceladus#=20
enceladus# uname -a=20
Linux enceladus 5.7.0-rc2 #1 SMP Tue Apr 21 23:32:43 UTC 2020 ppc64 GNU/Lin=
ux

enceladus# lsmod | grep 'farm'=20
windfarm_cpufreq_clamp     4640  1
windfarm_smu_sensors     9548  1
windfarm_smu_controls     9078  8
windfarm_pm112         15935  0
windfarm_pid            4378  1 windfarm_pm112
windfarm_smu_sat        9802  9 windfarm_pm112
windfarm_max6690_sensor     5434  1
windfarm_lm75_sensor     6148  1
windfarm_core          16619  7
windfarm_cpufreq_clamp,windfarm_smu_controls,windfarm_max6690_sensor,windfa=
rm_smu_sat,windfarm_smu_sensors,windfarm_lm75_sensor,windfarm_pm112
enceladus#=20

enceladus# cat /sys/kernel/debug/kmemleak
unreferenced object 0xc00000000867a6a0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294894706 (age 1843.540s)
  hex dump (first 32 bytes):
    c8 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000002612a15a0 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294894926 (age 1842.660s)
  hex dump (first 16 bytes):
    c4 04 01 7f a0 12 20 5f ff 55 b8 14 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc00000000867ba20 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895089 (age 1842.008s)
  hex dump (first 32 bytes):
    c9 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061a8740 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294895309 (age 1841.128s)
  hex dump (first 16 bytes):
    c5 04 01 7f a0 12 20 5f ff 55 29 14 7b 12 00 00  ...... _.U).{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061ab6e0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895473 (age 1840.472s)
  hex dump (first 32 bytes):
    c8 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061a8b90 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294895693 (age 1839.600s)
  hex dump (first 16 bytes):
    c4 04 01 7f a0 12 20 5f ff 55 b8 14 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061aa9e0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895857 (age 1838.944s)
  hex dump (first 32 bytes):
    c9 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc00000025aacd2c0 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294896076 (age 1838.068s)
  hex dump (first 16 bytes):
    c5 04 01 7f a0 12 20 5f ff 55 d7 15 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
enceladus#=20
enceladus# cat /sys/kernel/debug/kmemleak
unreferenced object 0xc00000000867a6a0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294894706 (age 4736.636s)
  hex dump (first 32 bytes):
    c8 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000002612a15a0 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294894926 (age 4735.756s)
  hex dump (first 16 bytes):
    c4 04 01 7f a0 12 20 5f ff 55 b8 14 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc00000000867ba20 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895089 (age 4735.104s)
  hex dump (first 32 bytes):
    c9 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061a8740 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294895309 (age 4734.224s)
  hex dump (first 16 bytes):
    c5 04 01 7f a0 12 20 5f ff 55 29 14 7b 12 00 00  ...... _.U).{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061ab6e0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895473 (age 4733.568s)
  hex dump (first 32 bytes):
    c8 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061a8b90 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294895693 (age 4732.696s)
  hex dump (first 16 bytes):
    c4 04 01 7f a0 12 20 5f ff 55 b8 14 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc0000000061aa9e0 (size 32):
  comm "kwindfarm", pid 175, jiffies 4294895857 (age 4732.040s)
  hex dump (first 32 bytes):
    c9 06 02 7f ff 02 ff 01 fb bf 00 59 00 20 00 00  ...........Y. ..
    00 07 89 37 00 a0 00 00 6b 6b 6b 6b 6b 6b 6b a5  ...7....kkkkkkk.
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<00000000e6cc23fc>] .pm112_wf_notify+0x624/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
unreferenced object 0xc00000025aacd2c0 (size 16):
  comm "kwindfarm", pid 175, jiffies 4294896076 (age 4731.164s)
  hex dump (first 16 bytes):
    c5 04 01 7f a0 12 20 5f ff 55 d7 15 7b 12 00 00  ...... _.U..{...
  backtrace:
    [<00000000fce2b937>] .smu_sat_get_sdb_partition+0x150/0x2f0
[windfarm_smu_sat]
    [<0000000050e586af>] .pm112_wf_notify+0x66c/0x1460 [windfarm_pm112]
    [<000000008cdab940>] .notifier_call_chain+0x88/0xf0
    [<000000008f026422>] .__blocking_notifier_call_chain+0x6c/0xc0
    [<0000000045480c67>] .wf_thread_func+0xe4/0x1e0 [windfarm_core]
    [<0000000079c8bd6f>] .kthread+0x1b8/0x1d0
    [<0000000073e2b812>] .ret_from_kernel_thread+0x58/0x74
enceladus#=20

I will take a look into it and see what I can see.

--=20
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken
GreyBeard and suspenders optional

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
