Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E410B3B5495
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 19:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCdT13jf2z3bSt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 03:46:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M5zGOnOU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M5zGOnOU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCdST43xsz2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 03:45:45 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id E8042619A5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624815941;
 bh=4YPsKEuBVc1ORf1Uzg9JIGHGhlQQk+PinvtrU7Wv02k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M5zGOnOUJkbvPo9n19cLMvG8zXP19pzn1eRd28qmDRySxnAP5bn6mfZD8/vR1eaMn
 XnrpFjCmH2Yjz6sWk16aUunABH+ZCntcXC0463Q7UEosdL7Nz2m75NKMSEgx5ze37k
 xwgZ7N4WuCX7UPOVYwIEk1/GsF+1ExaFrAo5L9E98RXi5MdzXHrribVE6Ao2XkYgU4
 82eE3G11H44ojF8TT0HfOOnI6WKskpakTEdffhRpBSlFtbGjtEXLkdP8xm648fQif+
 ta01b5KlV/EHX6tijAhIqFs8PyGDvKTeSdF3OWv+KkCPHmIWjxTl4uk8liuPjVzGBJ
 cViy5Affon2zw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D36B061210; Sun, 27 Jun 2021 17:45:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 195755] rcu_sched detected stalls on CPUs/tasks: (detected by
 0, t=6302 jiffies, g=11405, c=11404, q=1880), ppc64, G5
Date: Sun, 27 Jun 2021 17:45:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rudi@heitbaum.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-195755-206035-5Lkac2Qwa6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195755-206035@https.bugzilla.kernel.org/>
References: <bug-195755-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D195755

rudi@heitbaum.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rudi@heitbaum.com

--- Comment #31 from rudi@heitbaum.com ---
Same error on RK3399pro (Radxa N10) with kernel 5.13.0-rc7

[13081.586168] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13081.586749] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D2081=20
[13081.587613]  (detected by 1, t=3D6302 jiffies, g=3D1226929, q=3D7859)
[13081.588159] Task dump for CPU 5:
[13081.588462] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13081.589388] Call trace:
[13081.589619]  __switch_to+0xdc/0x130
[13081.589967]  0xffff800016db3bc8
[13144.605054] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13144.605636] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D8283=20
[13144.606501]  (detected by 1, t=3D25207 jiffies, g=3D1226929, q=3D8960)
[13144.607055] Task dump for CPU 5:
[13144.607358] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13144.608283] Call trace:
[13144.608513]  __switch_to+0xdc/0x130
[13144.608862]  0xffff800016db3bc8
[13207.623887] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13207.624453] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D14520=20
[13207.625307]  (detected by 1, t=3D44112 jiffies, g=3D1226929, q=3D9270)
[13207.625851] Task dump for CPU 5:
[13207.626146] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13207.627052] Call trace:
[13207.627278]  __switch_to+0xdc/0x130
[13207.627614]  0xffff800016db3bc8
[13270.642861] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13270.643441] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D20751=20
[13270.644314]  (detected by 1, t=3D63017 jiffies, g=3D1226929, q=3D9388)
[13270.644867] Task dump for CPU 5:
[13270.645170] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13270.646095] Call trace:
[13270.646326]  __switch_to+0xdc/0x130
[13270.646673]  0xffff800016db3bc8
[13333.661672] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13333.662238] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D26980=20
[13333.663092]  (detected by 1, t=3D81922 jiffies, g=3D1226929, q=3D9585)
[13333.663636] Task dump for CPU 5:
[13333.663931] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13333.664838] Call trace:
[13333.665063]  __switch_to+0xdc/0x130
[13333.665399]  0xffff800016db3bc8
[13396.680495] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13396.681062] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D33213=20
[13396.681917]  (detected by 1, t=3D100827 jiffies, g=3D1226929, q=3D9817)
[13396.682469] Task dump for CPU 5:
[13396.682765] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13396.683671] Call trace:
[13396.683896]  __switch_to+0xdc/0x130
[13396.684233]  0xffff800016db3bc8
[13459.699554] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13459.700120] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D39406=20
[13459.700974]  (detected by 1, t=3D119732 jiffies, g=3D1226929, q=3D10436)
[13459.701533] Task dump for CPU 5:
[13459.701829] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13459.702735] Call trace:
[13459.702961]  __switch_to+0xdc/0x130
[13459.703297]  0xffff800016db3bc8
[13522.718478] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13522.719049] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D45667=20
[13522.719902]  (detected by 1, t=3D138637 jiffies, g=3D1226929, q=3D10742)
[13522.720460] Task dump for CPU 5:
[13522.720755] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13522.721662] Call trace:
[13522.721888]  __switch_to+0xdc/0x130
[13522.722224]  0xffff800016db3bc8
[13585.737386] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13585.737953] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D51904=20
[13585.738807]  (detected by 1, t=3D157542 jiffies, g=3D1226929, q=3D10947)
[13585.739365] Task dump for CPU 5:
[13585.739661] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13585.740567] Call trace:
[13585.740793]  __switch_to+0xdc/0x130
[13585.741129]  0xffff800016db3bc8
[13648.756295] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13648.756862] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D58090=20
[13648.757715]  (detected by 1, t=3D176447 jiffies, g=3D1226929, q=3D12205)
[13648.758274] Task dump for CPU 5:
[13648.758570] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13648.759476] Call trace:
[13648.759701]  __switch_to+0xdc/0x130
[13648.760036]  0xffff800016db3bc8
[13711.775146] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13711.775715] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D64362=20
[13711.776569]  (detected by 1, t=3D195352 jiffies, g=3D1226929, q=3D12462)
[13711.777127] Task dump for CPU 5:
[13711.777423] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13711.778329] Call trace:
[13711.778555]  __switch_to+0xdc/0x130
[13711.778892]  0xffff800016db3bc8
[13774.793985] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13774.794553] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D70639=20
[13774.795408]  (detected by 1, t=3D214257 jiffies, g=3D1226929, q=3D12569)
[13774.795967] Task dump for CPU 5:
[13774.796262] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13774.797168] Call trace:
[13774.797394]  __switch_to+0xdc/0x130
[13774.797730]  0xffff800016db3bc8
[13837.813008] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13837.813575] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D76909=20
[13837.814429]  (detected by 1, t=3D233162 jiffies, g=3D1226929, q=3D12746)
[13837.814986] Task dump for CPU 5:
[13837.815281] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13837.816188] Call trace:
[13837.816414]  __switch_to+0xdc/0x130
[13837.816750]  0xffff800016db3bc8
[13900.831934] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13900.832514] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D83140=20
[13900.833387]  (detected by 1, t=3D252067 jiffies, g=3D1226929, q=3D12831)
[13900.833957] Task dump for CPU 5:
[13900.834260] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13900.835184] Call trace:
[13900.835416]  __switch_to+0xdc/0x130
[13900.835763]  0xffff800016db3bc8
[13963.850798] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13963.851365] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D89428=20
[13963.852219]  (detected by 1, t=3D270972 jiffies, g=3D1226929, q=3D12997)
[13963.852777] Task dump for CPU 5:
[13963.853072] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[13963.853978] Call trace:
[13963.854204]  __switch_to+0xdc/0x130
[13963.854539]  0xffff800016db3bc8
[14026.869692] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14026.870256] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D95711=20
[14026.871109]  (detected by 1, t=3D289877 jiffies, g=3D1226929, q=3D13189)
[14026.871669] Task dump for CPU 5:
[14026.871964] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14026.872870] Call trace:
[14026.873096]  __switch_to+0xdc/0x130
[14026.873432]  0xffff800016db3bc8
[14089.888567] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14089.889132] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D101977=20
[14089.889994]  (detected by 1, t=3D308782 jiffies, g=3D1226929, q=3D13301)
[14089.890552] Task dump for CPU 5:
[14089.890847] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14089.891753] Call trace:
[14089.891977]  __switch_to+0xdc/0x130
[14089.892312]  0xffff800016db3bc8
[14152.907476] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14152.908040] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D108248=20
[14152.908901]  (detected by 1, t=3D327687 jiffies, g=3D1226929, q=3D13583)
[14152.909459] Task dump for CPU 5:
[14152.909755] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14152.910661] Call trace:
[14152.910885]  __switch_to+0xdc/0x130
[14152.911221]  0xffff800016db3bc8
[14215.926397] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14215.926980] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D114520=20
[14215.927859]  (detected by 1, t=3D346592 jiffies, g=3D1226929, q=3D14824)
[14215.928430] Task dump for CPU 5:
[14215.928732] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14215.929657] Call trace:
[14215.929888]  __switch_to+0xdc/0x130
[14215.930235]  0xffff800016db3bc8
[14278.945254] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14278.945819] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D120755=20
[14278.946681]  (detected by 1, t=3D365497 jiffies, g=3D1226929, q=3D14953)
[14278.947240] Task dump for CPU 5:
[14278.947534] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14278.948441] Call trace:
[14278.948665]  __switch_to+0xdc/0x130
[14278.949001]  0xffff800016db3bc8
[14341.964082] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14341.964650] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D127008=20
[14341.965512]  (detected by 1, t=3D384402 jiffies, g=3D1226929, q=3D15207)
[14341.966069] Task dump for CPU 5:
[14341.966365] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14341.967271] Call trace:
[14341.967497]  __switch_to+0xdc/0x130
[14341.967832]  0xffff800016db3bc8
[14404.982988] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14404.983555] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D133228=20
[14404.984415]  (detected by 1, t=3D403307 jiffies, g=3D1226929, q=3D15393)
[14404.984974] Task dump for CPU 5:
[14404.985270] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14404.986176] Call trace:
[14404.986402]  __switch_to+0xdc/0x130
[14404.986738]  0xffff800016db3bc8
[14468.001845] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14468.002412] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D139490=20
[14468.003274]  (detected by 1, t=3D422212 jiffies, g=3D1226929, q=3D15648)
[14468.003833] Task dump for CPU 5:
[14468.004128] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14468.005035] Call trace:
[14468.005260]  __switch_to+0xdc/0x130
[14468.005594]  0xffff800016db3bc8
[14531.020589] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14531.021155] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D145729=20
[14531.022018]  (detected by 1, t=3D441117 jiffies, g=3D1226929, q=3D15794)
[14531.022577] Task dump for CPU 5:
[14531.022873] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14531.023779] Call trace:
[14531.024005]  __switch_to+0xdc/0x130
[14531.024341]  0xffff800016db3bc8
[14594.039456] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14594.040025] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D151980=20
[14594.040886]  (detected by 1, t=3D460022 jiffies, g=3D1226929, q=3D15878)
[14594.041446] Task dump for CPU 5:
[14594.041741] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14594.042647] Call trace:
[14594.042872]  __switch_to+0xdc/0x130
[14594.043207]  0xffff800016db3bc8
[14657.058389] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14657.058959] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D158250=20
[14657.059822]  (detected by 1, t=3D478927 jiffies, g=3D1226929, q=3D16066)
[14657.060381] Task dump for CPU 5:
[14657.060676] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14657.061583] Call trace:
[14657.061807]  __switch_to+0xdc/0x130
[14657.062141]  0xffff800016db3bc8
[14720.077324] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14720.077890] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D164517=20
[14720.078752]  (detected by 1, t=3D497832 jiffies, g=3D1226929, q=3D16282)
[14720.079312] Task dump for CPU 5:
[14720.079607] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14720.080513] Call trace:
[14720.080739]  __switch_to+0xdc/0x130
[14720.081075]  0xffff800016db3bc8
[14783.096138] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14783.096707] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D170813=20
[14783.097569]  (detected by 1, t=3D516737 jiffies, g=3D1226929, q=3D16500)
[14783.098129] Task dump for CPU 5:
[14783.098425] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14783.099331] Call trace:
[14783.099557]  __switch_to+0xdc/0x130
[14783.099892]  0xffff800016db3bc8
[14846.115081] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14846.115662] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D177083=20
[14846.116542]  (detected by 1, t=3D535642 jiffies, g=3D1226929, q=3D17790)
[14846.117111] Task dump for CPU 5:
[14846.117414] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14846.118339] Call trace:
[14846.118572]  __switch_to+0xdc/0x130
[14846.118919]  0xffff800016db3bc8
[14909.133891] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14909.134461] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D183326=20
[14909.135323]  (detected by 1, t=3D554547 jiffies, g=3D1226929, q=3D17940)
[14909.135882] Task dump for CPU 5:
[14909.136177] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14909.137084] Call trace:
[14909.137309]  __switch_to+0xdc/0x130
[14909.137644]  0xffff800016db3bc8
[14972.152771] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[14972.153341] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D189592=20
[14972.154203]  (detected by 1, t=3D573452 jiffies, g=3D1226929, q=3D18093)
[14972.154763] Task dump for CPU 5:
[14972.155058] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[14972.155964] Call trace:
[14972.156190]  __switch_to+0xdc/0x130
[14972.156525]  0xffff800016db3bc8
[15035.171590] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15035.172159] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D195867=20
[15035.173022]  (detected by 1, t=3D592357 jiffies, g=3D1226929, q=3D18270)
[15035.173583] Task dump for CPU 5:
[15035.173878] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15035.174785] Call trace:
[15035.175012]  __switch_to+0xdc/0x130
[15035.175347]  0xffff800016db3bc8
[15098.190534] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15098.191104] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D202159=20
[15098.191966]  (detected by 1, t=3D611262 jiffies, g=3D1226929, q=3D18399)
[15098.192524] Task dump for CPU 5:
[15098.192819] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15098.193726] Call trace:
[15098.193952]  __switch_to+0xdc/0x130
[15098.194288]  0xffff800016db3bc8
[15161.209414] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15161.209983] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D208429=20
[15161.210846]  (detected by 1, t=3D630167 jiffies, g=3D1226929, q=3D18573)
[15161.211404] Task dump for CPU 5:
[15161.211699] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15161.212606] Call trace:
[15161.212832]  __switch_to+0xdc/0x130
[15161.213168]  0xffff800016db3bc8
[15224.228338] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15224.228905] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D214694=20
[15224.229767]  (detected by 1, t=3D649072 jiffies, g=3D1226929, q=3D18750)
[15224.230326] Task dump for CPU 5:
[15224.230622] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15224.231527] Call trace:
[15224.231753]  __switch_to+0xdc/0x130
[15224.232088]  0xffff800016db3bc8
[15287.247240] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15287.247805] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D220945=20
[15287.248668]  (detected by 1, t=3D667977 jiffies, g=3D1226929, q=3D18876)
[15287.249226] Task dump for CPU 5:
[15287.249521] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15287.250427] Call trace:
[15287.250652]  __switch_to+0xdc/0x130
[15287.250987]  0xffff800016db3bc8
[15350.266060] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15350.266628] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D227219=20
[15350.267491]  (detected by 1, t=3D686882 jiffies, g=3D1226929, q=3D19238)
[15350.268050] Task dump for CPU 5:
[15350.268345] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15350.269252] Call trace:
[15350.269477]  __switch_to+0xdc/0x130
[15350.269812]  0xffff800016db3bc8
[15413.284937] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15413.285504] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D233484=20
[15413.286368]  (detected by 1, t=3D705787 jiffies, g=3D1226929, q=3D20770)
[15413.286926] Task dump for CPU 5:
[15413.287221] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15413.288128] Call trace:
[15413.288353]  __switch_to+0xdc/0x130
[15413.288689]  0xffff800016db3bc8
[15476.304113] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15476.304693] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D239734=20
[15476.305571]  (detected by 1, t=3D724692 jiffies, g=3D1226929, q=3D21025)
[15476.306141] Task dump for CPU 5:
[15476.306444] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15476.307370] Call trace:
[15476.307601]  __switch_to+0xdc/0x130
[15476.307949]  0xffff800016db3bc8
[15539.322826] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15539.323390] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D245985=20
[15539.324252]  (detected by 1, t=3D743597 jiffies, g=3D1226929, q=3D21217)
[15539.324812] Task dump for CPU 5:
[15539.325108] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15539.326014] Call trace:
[15539.326240]  __switch_to+0xdc/0x130
[15539.326578]  0xffff800016db3bc8
[15602.341877] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15602.342442] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D252236=20
[15602.343304]  (detected by 1, t=3D762502 jiffies, g=3D1226929, q=3D21374)
[15602.343864] Task dump for CPU 5:
[15602.344159] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15602.345065] Call trace:
[15602.345290]  __switch_to+0xdc/0x130
[15602.345625]  0xffff800016db3bc8
[15665.360673] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15665.361243] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D258527=20
[15665.362106]  (detected by 3, t=3D781407 jiffies, g=3D1226929, q=3D21533)
[15665.362666] Task dump for CPU 5:
[15665.362961] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15665.363867] Call trace:
[15665.364093]  __switch_to+0xdc/0x130
[15665.364430]  0xffff800016db3bc8
[15728.379714] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15728.380280] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D264799=20
[15728.381141]  (detected by 1, t=3D800312 jiffies, g=3D1226929, q=3D21623)
[15728.381699] Task dump for CPU 5:
[15728.381995] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15728.382901] Call trace:
[15728.383127]  __switch_to+0xdc/0x130
[15728.383462]  0xffff800016db3bc8
[15791.398498] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15791.399064] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D271031=20
[15791.399927]  (detected by 1, t=3D819217 jiffies, g=3D1226929, q=3D21803)
[15791.400486] Task dump for CPU 5:
[15791.400781] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15791.401687] Call trace:
[15791.401911]  __switch_to+0xdc/0x130
[15791.402247]  0xffff800016db3bc8
[15854.417401] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15854.417968] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D277248=20
[15854.418832]  (detected by 2, t=3D838122 jiffies, g=3D1226929, q=3D21993)
[15854.419391] Task dump for CPU 5:
[15854.419686] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15854.420593] Call trace:
[15854.420817]  __switch_to+0xdc/0x130
[15854.421153]  0xffff800016db3bc8
[15917.436445] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15917.437012] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D283509=20
[15917.437874]  (detected by 1, t=3D857027 jiffies, g=3D1226929, q=3D22214)
[15917.438434] Task dump for CPU 5:
[15917.438729] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15917.439634] Call trace:
[15917.439859]  __switch_to+0xdc/0x130
[15917.440195]  0xffff800016db3bc8
[15980.455269] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[15980.455839] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D289795=20
[15980.456702]  (detected by 1, t=3D875932 jiffies, g=3D1226929, q=3D22336)
[15980.457260] Task dump for CPU 5:
[15980.457555] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[15980.458462] Call trace:
[15980.458688]  __switch_to+0xdc/0x130
[15980.459024]  0xffff800016db3bc8
[16043.474210] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16043.474775] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D296074=20
[16043.475637]  (detected by 1, t=3D894837 jiffies, g=3D1226929, q=3D23604)
[16043.476197] Task dump for CPU 5:
[16043.476492] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16043.477398] Call trace:
[16043.477623]  __switch_to+0xdc/0x130
[16043.477959]  0xffff800016db3bc8
[16106.493004] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16106.493574] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D302355=20
[16106.494439]  (detected by 1, t=3D913742 jiffies, g=3D1226929, q=3D23693)
[16106.494998] Task dump for CPU 5:
[16106.495293] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16106.496200] Call trace:
[16106.496426]  __switch_to+0xdc/0x130
[16106.496763]  0xffff800016db3bc8
[16169.511966] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16169.512534] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D308617=20
[16169.513398]  (detected by 1, t=3D932647 jiffies, g=3D1226929, q=3D23881)
[16169.513958] Task dump for CPU 5:
[16169.514253] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16169.515160] Call trace:
[16169.515386]  __switch_to+0xdc/0x130
[16169.515720]  0xffff800016db3bc8
[16232.530953] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16232.531530] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D314840=20
[16232.532412]  (detected by 1, t=3D951552 jiffies, g=3D1226929, q=3D24168)
[16232.532981] Task dump for CPU 5:
[16232.533284] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16232.534208] Call trace:
[16232.534439]  __switch_to+0xdc/0x130
[16232.534786]  0xffff800016db3bc8
[16295.549694] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16295.550260] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D321100=20
[16295.551122]  (detected by 1, t=3D970457 jiffies, g=3D1226929, q=3D24344)
[16295.551682] Task dump for CPU 5:
[16295.551977] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16295.552883] Call trace:
[16295.553109]  __switch_to+0xdc/0x130
[16295.553444]  0xffff800016db3bc8
[16358.568692] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16358.569257] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D327311=20
[16358.570119]  (detected by 1, t=3D989362 jiffies, g=3D1226929, q=3D24453)
[16358.570677] Task dump for CPU 5:
[16358.570973] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16358.571878] Call trace:
[16358.572103]  __switch_to+0xdc/0x130
[16358.572438]  0xffff800016db3bc8
[16421.587636] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16421.588203] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D333593=20
[16421.589064]  (detected by 1, t=3D1008267 jiffies, g=3D1226929, q=3D24583)
[16421.589631] Task dump for CPU 5:
[16421.589926] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16421.590832] Call trace:
[16421.591058]  __switch_to+0xdc/0x130
[16421.591393]  0xffff800016db3bc8
[16484.606656] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16484.607238] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D339823=20
[16484.608120]  (detected by 1, t=3D1027172 jiffies, g=3D1226929, q=3D24800)
[16484.608697] Task dump for CPU 5:
[16484.609001] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16484.609926] Call trace:
[16484.610156]  __switch_to+0xdc/0x130
[16484.610503]  0xffff800016db3bc8
[16547.625618] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16547.626182] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D346004=20
[16547.627043]  (detected by 1, t=3D1046077 jiffies, g=3D1226929, q=3D24992)
[16547.627609] Task dump for CPU 5:
[16547.627905] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16547.628811] Call trace:
[16547.629035]  __switch_to+0xdc/0x130
[16547.629371]  0xffff800016db3bc8
[16610.644564] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16610.645128] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D352273=20
[16610.645990]  (detected by 1, t=3D1064982 jiffies, g=3D1226929, q=3D26024)
[16610.646556] Task dump for CPU 5:
[16610.646851] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16610.647758] Call trace:
[16610.647982]  __switch_to+0xdc/0x130
[16610.648318]  0xffff800016db3bc8
[16673.663533] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16673.664098] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D358540=20
[16673.664960]  (detected by 1, t=3D1083887 jiffies, g=3D1226929, q=3D27452)
[16673.665526] Task dump for CPU 5:
[16673.665822] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842539 flags:0x00000002[16673.666728] Call trace:
[16673.666954]  __switch_to+0xdc/0x130
[16673.667289]  0xffff800016db3bc8
[16736.682410] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[16736.682978] rcu: 5-...0: (1 GPs behind) idle=3Daaa/1/0x4000000000000000
softirq=3D981287/981290 fqs=3D364780=20
[16736.683840]  (detected by 1, t=3D1102792 jiffies, g=3D1226929, q=3D28629)
[16736.684407] Task dump for CPU 5:
[16736.684702] task:pkgjson         state:R  running task     stack:    0
pid:845641 ppid:842408 flags:0x00000003[16736.685608] Call trace:
[16736.685834]  __switch_to+0xdc/0x130
[16736.686169]  0xffff800016db3bc8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
