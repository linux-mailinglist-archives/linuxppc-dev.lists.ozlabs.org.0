Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B511214B8D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 11:32:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B03Pn5g8QzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 19:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=molgen.mpg.de
X-Greylist: delayed 457 seconds by postgrey-1.36 at bilbo;
 Sun, 05 Jul 2020 19:30:41 AEST
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B03N12tNwzDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jul 2020 19:30:41 +1000 (AEST)
Received: from [192.168.0.6] (ip5f5af298.dynamic.kabel-deutschland.de
 [95.90.242.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E3583206442E0;
 Sun,  5 Jul 2020 11:22:53 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Using Firefox hangs system
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <673619a2-74d7-105b-dacb-bec15bc37872@molgen.mpg.de>
Date: Sun, 5 Jul 2020 11:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


With an IBM S822LC with Ubuntu 20.04, after updating to Firefox 78.0, 
using Firefox seems to hang the system. This happened with self-built 
Linux 5.7-rc5+ and now with 5.8-rc3+.

(At least I believe the Firefox update is causing this.)

Log in is impossible, and using the Serial over LAN over IPMI shows the 
messages below.

> [ 2620.579187] watchdog: BUG: soft lockup - CPU#125 stuck for 22s! [swapper/125:0]
> [ 2620.579378] Modules linked in: tcp_diag inet_diag unix_diag xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs kvm_hv kvm joydev binfmt_misc uas usb_storage vmx_crypto ofpart cmdlinepart bnx2x powernv_flash mtd mdio crct10dif_vpmsum at24 ibmpowernv ipmi_powernv ipmi_devintf powernv_rng ipmi_msghandler opal_prd sch_fq_codel parport_pc nfsd ppdev lp auth_rpcgss nfs_acl parport lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm drm_panel_orientation_quirks ahci libahci usbhid hid crc32c_vpmsum uio_pdrv_genirq uio
> [ 2620.579537] CPU: 125 PID: 0 Comm: swapper/125 Tainted: G      D W    L    5.8.0-rc3+ #1
> [ 2620.579552] NIP:  c0000000010dad38 LR: c0000000010dad30 CTR: c000000000237830
> [ 2620.579568] REGS: c00000ffcb8c7600 TRAP: 0900   Tainted: G      D W    L     (5.8.0-rc3+)
> [ 2620.579582] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44004228  XER: 00000000
> [ 2620.579599] CFAR: c0000000010dad44 IRQMASK: 0 
> [ 2620.579599] GPR00: c00000000023718c c00000ffcb8c7890 c000000001f9a900 0000000000000000 
> [ 2620.579599] GPR04: c000000001fce438 0000000000000078 000000010008c1f2 0000000000000000 
> [ 2620.579599] GPR08: 000000ffd96a0000 0000000080000087 0000000000000000 c000000001fd25e0 
> [ 2620.579599] GPR12: 0000000000004400 c00000ffff72f680 c000000001ea36d8 c00000ffcb859800 
> [ 2620.579599] GPR16: c00000000166c880 c0000000016f8e00 000000000000000a c00000ffcb859800 
> [ 2620.579599] GPR20: 0000000000000100 c00000000166c918 c000000001fd21e8 c00000ffcb859800 
> [ 2620.579599] GPR24: 000000ffd96a0000 c000000001d44b80 c000000001d53780 0000000000000008 
> [ 2620.579599] GPR28: c000000001fd21e0 0000000000000001 0000000000000000 c000000001d44b80 
> [ 2620.579711] NIP [c0000000010dad38] _raw_spin_lock_irqsave+0x98/0x120
> [ 2620.579724] LR [c0000000010dad30] _raw_spin_lock_irqsave+0x90/0x120
> [ 2620.579737] Call Trace:
> [ 2620.579746] [c00000ffcb8c7890] [c0000000013c84a0] ncsi_ops+0x209f50/0x2dc1d8 (unreliable)
> [ 2620.579763] [c00000ffcb8c78d0] [c00000000023718c] rcu_core+0xfc/0x7a0
> [ 2620.579777] [c00000ffcb8c7970] [c0000000010db81c] __do_softirq+0x17c/0x534
> [ 2620.579791] [c00000ffcb8c7aa0] [c0000000001786f4] irq_exit+0xd4/0x130
> [ 2620.579805] [c00000ffcb8c7ad0] [c000000000025eec] timer_interrupt+0x13c/0x370
> [ 2620.579821] [c00000ffcb8c7b40] [c0000000000165c0] replay_soft_interrupts+0x320/0x3f0
> [ 2620.579837] [c00000ffcb8c7d30] [c0000000000166d8] arch_local_irq_restore+0x48/0xa0
> [ 2620.579853] [c00000ffcb8c7d50] [c000000000de2fe0] cpuidle_enter_state+0x100/0x780
> [ 2620.579869] [c00000ffcb8c7dd0] [c000000000de36fc] cpuidle_enter+0x4c/0x70
> [ 2620.579883] [c00000ffcb8c7e10] [c0000000001c6bb4] do_idle+0x3c4/0x590
> [ 2620.579896] [c00000ffcb8c7ee0] [c0000000001c6fcc] cpu_startup_entry+0x3c/0x50
> [ 2620.579911] [c00000ffcb8c7f10] [c0000000000615f4] start_secondary+0x2d4/0x3b0
> [ 2620.579927] [c00000ffcb8c7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
> [ 2620.579941] Instruction dump:
> [ 2620.579950] 60000000 60000000 7c0802a6 fba10028 fbe10038 7c7f1b78 f8010050 8bad0988 
> [ 2620.579967] 7fc3f378 4af3b96d 60000000 7c210b78 <60000000> 813f0000 2c290000 4082fff0 
> [ 2645.907192] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2660.067201] watchdog: CPU 0 detected hard LOCKUP on other CPUs 113
> [ 2660.067385] watchdog: CPU 0 TB:1390608252047, last SMP heartbeat TB:1382840188990 (15171ms ago)
> [ 2708.927190] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2724.067205] watchdog: CPU 0 detected hard LOCKUP on other CPUs 87
> [ 2724.067396] watchdog: CPU 0 TB:1423376252137, last SMP heartbeat TB:1415618427864 (15152ms ago)
> [ 2771.947188] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> 5:0]
> [ 2620.579378] Modules linked in: tcp_diag inet_diag unix_diag xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs kvm_hv kvm joydev binfmt_misc uas usb_storage vmx_crypto ofpart cmdlinepart bnx2x powernv_flash mtd mdio crct10dif_vpmsum at24 ibmpowernv ipmi_powernv ipmi_devintf powernv_rng ipmi_msghandler opal_prd sch_fq_codel parport_pc nfsd ppdev lp auth_rpcgss nfs_acl parport lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm drm_panel_orientation_quirks ahci libahci usbhid hid crc32c_vpmsum uio_pdrv_genirq uio
> [ 2620.579537] CPU: 125 PID: 0 Comm: swapper/125 Tainted: G      D W    L    5.8.0-rc3+ #1
> [ 2620.579552] NIP:  c0000000010dad38 LR: c0000000010dad30 CTR: c000000000237830
> [ 2620.579568] REGS: c00000ffcb8c7600 TRAP: 0900   Tainted: G      D W    L     (5.8.0-rc3+)
> [ 2620.579582] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44004228  XER: 00000000
> [ 2620.579599] CFAR: c0000000010dad44 IRQMASK: 0 
> [ 2620.579599] GPR00: c00000000023718c c00000ffcb8c7890 c000000001f9a900 0000000000000000 
> [ 2620.579599] GPR04: c000000001fce438 0000000000000078 000000010008c1f2 0000000000000000 
> [ 2620.579599] GPR08: 000000ffd96a0000 0000000080000087 0000000000000000 c000000001fd25e0 
> [ 2620.579599] GPR12: 0000000000004400 c00000ffff72f680 c000000001ea36d8 c00000ffcb859800 
> [ 2620.579599] GPR16: c00000000166c880 c0000000016f8e00 000000000000000a c00000ffcb859800 
> [ 2620.579599] GPR20: 0000000000000100 c00000000166c918 c000000001fd21e8 c00000ffcb859800 
> [ 2620.579599] GPR24: 000000ffd96a0000 c000000001d44b80 c000000001d53780 0000000000000008 
> [ 2620.579599] GPR28: c000000001fd21e0 0000000000000001 0000000000000000 c000000001d44b80 
> [ 2620.579711] NIP [c0000000010dad38] _raw_spin_lock_irqsave+0x98/0x120
> [ 2620.579724] LR [c0000000010dad30] _raw_spin_lock_irqsave+0x90/0x120
> [ 2620.579737] Call Trace:
> [ 2620.579746] [c00000ffcb8c7890] [c0000000013c84a0] ncsi_ops+0x209f50/0x2dc1d8 (unreliable)
> [ 2620.579763] [c00000ffcb8c78d0] [c00000000023718c] rcu_core+0xfc/0x7a0
> [ 2620.579777] [c00000ffcb8c7970] [c0000000010db81c] __do_softirq+0x17c/0x534
> [ 2620.579791] [c00000ffcb8c7aa0] [c0000000001786f4] irq_exit+0xd4/0x130
> [ 2620.579805] [c00000ffcb8c7ad0] [c000000000025eec] timer_interrupt+0x13c/0x370
> [ 2620.579821] [c00000ffcb8c7b40] [c0000000000165c0] replay_soft_interrupts+0x320/0x3f0
> [ 2620.579837] [c00000ffcb8c7d30] [c0000000000166d8] arch_local_irq_restore+0x48/0xa0
> [ 2620.579853] [c00000ffcb8c7d50] [c000000000de2fe0] cpuidle_enter_state+0x100/0x780
> [ 2620.579869] [c00000ffcb8c7dd0] [c000000000de36fc] cpuidle_enter+0x4c/0x70
> [ 2620.579883] [c00000ffcb8c7e10] [c0000000001c6bb4] do_idle+0x3c4/0x590
> [ 2620.579896] [c00000ffcb8c7ee0] [c0000000001c6fcc] cpu_startup_entry+0x3c/0x50
> [ 2620.579911] [c00000ffcb8c7f10] [c0000000000615f4] start_secondary+0x2d4/0x3b0
> [ 2620.579927] [c00000ffcb8c7f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
> [ 2620.579941] Instruction dump:
> [ 2620.579950] 60000000 60000000 7c0802a6 fba10028 fbe10038 7c7f1b78 f8010050 8bad0988 
> [ 2620.579967] 7fc3f378 4af3b96d 60000000 7c210b78 <60000000> 813f0000 2c290000 4082fff0 
> [ 2645.907192] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2660.067201] watchdog: CPU 0 detected hard LOCKUP on other CPUs 113
> [ 2660.067385] watchdog: CPU 0 TB:1390608252047, last SMP heartbeat TB:1382840188990 (15171ms ago)
> [ 2708.927190] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2724.067205] watchdog: CPU 0 detected hard LOCKUP on other CPUs 87
> [ 2724.067396] watchdog: CPU 0 TB:1423376252137, last SMP heartbeat TB:1415618427864 (15152ms ago)
> [ 2771.947188] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2784.067210] watchdog: CPU 0 detected hard LOCKUP on other CPUs 93
> [ 2784.067394] watchdog: CPU 0 TB:1454096254111, last SMP heartbeat TB:1446338425134 (15152ms ago)
> [ 2796.291190] watchdog: BUG: soft lockup - CPU#84 stuck for 23s! [migration/84:432]
> [ 2796.291353] Modules linked in: tcp_diag inet_diag unix_diag xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs kvm_hv kvm joydev binfmt_misc uas usb_storage vmx_crypto ofpart cmdlinepart bnx2x powernv_flash mtd mdio crct10dif_vpmsum at24 ibmpowernv ipmi_powernv ipmi_devintf powernv_rng ipmi_msghandler opal_prd sch_fq_codel parport_pc nfsd ppdev lp auth_rpcgss nfs_acl parport lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm drm_panel_orientation_quirks ahci libahci usbhid hid crc32c_vpmsum uio_pdrv_genirq uio
> [ 2796.291703] CPU: 84 PID: 432 Comm: migration/84 Tainted: G      D W    L    5.8.0-rc3+ #1
> [ 2796.291721] NIP:  c000000000231260 LR: c0000000002b4a24 CTR: c0000000002b48b0
> [ 2796.291738] REGS: c00000ffcbc4f980 TRAP: 0900   Tainted: G      D W    L     (5.8.0-rc3+)
> [ 2796.291754] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28002208  XER: 20000000
> [ 2796.291778] CFAR: c0000000002b4a20 IRQMASK: 0 
> [ 2796.291778] GPR00: c0000000002b4a24 c00000ffcbc4fc10 c000000001f9a900 c000000001115278 
> [ 2796.291778] GPR04: c000000001fce318 c000007f2e80fe90 0000000000000000 c00000ffd849a4d8 
> [ 2796.291778] GPR08: 0000000000000004 c00000ffd849a400 000000ffd6da0000 c00000ffd8499680 
> [ 2796.291778] GPR12: 0000000000000000 c00000ffff75ea00 c0000000001a9198 c000007fd904d700 
> [ 2796.291778] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 2796.291778] GPR20: 0000000000000000 c0000000002b48b0 0000000000000000 0000000000000001 
> [ 2796.291778] GPR24: 0000000000000002 0000000000000003 0000000000000000 c000000001115278 
> [ 2796.291778] GPR28: c000007f2e80f860 0000000000000001 c000007f2e80f884 0000000000000001 
> [ 2796.292066] NIP [c000000000231260] rcu_momentary_dyntick_idle+0x40/0x70
> [ 2796.292085] LR [c0000000002b4a24] multi_cpu_stop+0x174/0x230
> [ 2796.292099] Call Trace:
> [ 2796.292108] [c00000ffcbc4fc80] [c0000000002b4618] cpu_stopper_thread+0xd8/0x280
> [ 2796.292127] [c00000ffcbc4fd40] [c0000000001afefc] smpboot_thread_fn+0x1fc/0x2a0
> [ 2796.292146] [c00000ffcbc4fdb0] [c0000000001a9334] kthread+0x1a4/0x1b0
> [ 2796.292162] [c00000ffcbc4fe20] [c00000000000cca8] ret_from_kernel_thread+0x5c/0x74
> [ 2796.292179] Instruction dump:
> [ 2796.292190] e8ed0030 38c00000 3d42ff76 394afbdc 3d22ff76 7cc751ae 3929fb00 e94d0030 
> [ 2796.292210] 7d295214 38e900d8 7c0004ac 39000004 <7d403828> 7d485214 7d40392d 40c2fff4 
> [ 2834.967193] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2848.067204] watchdog: CPU 0 detected hard LOCKUP on other CPUs 45
> [ 2848.067353] watchdog: CPU 0 TB:1486864251150, last SMP heartbeat TB:1479106427744 (15151ms ago)

I have to warm reset the system to get it working again.


Kind regards,

Paul
