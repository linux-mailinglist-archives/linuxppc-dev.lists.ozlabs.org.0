Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61081215222
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 07:22:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Ypc3FRYzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 15:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Yn03zvxzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 15:20:32 +1000 (AEST)
Received: from [192.168.178.35] (unknown [94.134.88.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 42A1E201A3C32;
 Mon,  6 Jul 2020 07:20:26 +0200 (CEST)
Subject: Re: Using Firefox hangs system
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <673619a2-74d7-105b-dacb-bec15bc37872@molgen.mpg.de>
 <2a86d85d-b51d-52c5-f84f-efea5a0ca628@molgen.mpg.de>
 <1593995628.78zg3dfzk8.astroid@bobo.none>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <de2c9ccd-a078-a2ca-e7c7-13a1032cbda3@molgen.mpg.de>
Date: Mon, 6 Jul 2020 07:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1593995628.78zg3dfzk8.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dear Nicholas,


Thank you for the quick response.


Am 06.07.20 um 02:41 schrieb Nicholas Piggin:
> Excerpts from Paul Menzel's message of July 5, 2020 8:30 pm:

>> Am 05.07.20 um 11:22 schrieb Paul Menzel:
>>
>>> With an IBM S822LC with Ubuntu 20.04, after updating to Firefox 78.0,
>>> using Firefox seems to hang the system. This happened with self-built
>>> Linux 5.7-rc5+ and now with 5.8-rc3+.
>>>
>>> (At least I believe the Firefox update is causing this.)
>>>
>>> Log in is impossible, and using the Serial over LAN over IPMI shows the
>>> messages below.
>>>
>>>> [ 2620.579187] watchdog: BUG: soft lockup - CPU#125 stuck for 22s!
>>>> [swapper/125:0]
>>>> [ 2620.579378] Modules linked in: tcp_diag inet_diag unix_diag
>>>> xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4
>>>> xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat
>>>> nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink
>>>> ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs
>>>> kvm_hv kvm joydev binfmt_misc uas usb_storage vmx_crypto ofpart
>>>> cmdlinepart bnx2x powernv_flash mtd mdio crct10dif_vpmsum at24
>>>> ibmpowernv ipmi_powernv ipmi_devintf powernv_rng ipmi_msghandler
>>>> opal_prd sch_fq_codel parport_pc nfsd ppdev lp auth_rpcgss nfs_acl
>>>> parport lockd grace sunrpc ip_tables x_tables autofs4 btrfs
>>>> blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds
>>>> mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit
>>>> ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm
>>>> drm_panel_orientation_quirks ahci libahci usbhid hid crc32c_vpmsum
>>>> uio_pdrv_genirq uio
>>>> [ 2620.579537] CPU: 125 PID: 0 Comm: swapper/125 Tainted: G      D
>>>> W    L    5.8.0-rc3+ #1
>>>> [ 2620.579552] NIP:  c0000000010dad38 LR: c0000000010dad30 CTR:
>>>> c000000000237830
>>>> [ 2620.579568] REGS: c00000ffcb8c7600 TRAP: 0900   Tainted: G      D
>>>> W    L     (5.8.0-rc3+)
>>>> [ 2620.579582] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:
>>>> 44004228  XER: 00000000
>>>> [ 2620.579599] CFAR: c0000000010dad44 IRQMASK: 0 [ 2620.579599] GPR00:
>>>> c00000000023718c c00000ffcb8c7890 c000000001f9a900 0000000000000000 [
>>>> 2620.579599] GPR04: c000000001fce438 0000000000000078 000000010008c1f2
>>>> 0000000000000000 [ 2620.579599] GPR08: 000000ffd96a0000
>>>> 0000000080000087 0000000000000000 c000000001fd25e0 [ 2620.579599]
>>>> GPR12: 0000000000004400 c00000ffff72f680 c000000001ea36d8
>>>> c00000ffcb859800 [ 2620.579599] GPR16: c00000000166c880
>>>> c0000000016f8e00 000000000000000a c00000ffcb859800 [ 2620.579599]
>>>> GPR20: 0000000000000100 c00000000166c918 c000000001fd21e8
>>>> c00000ffcb859800 [ 2620.579599] GPR24: 000000ffd96a0000
>>>> c000000001d44b80 c000000001d53780 0000000000000008 [ 2620.579599]
>>>> GPR28: c000000001fd21e0 0000000000000001 0000000000000000
>>>> c000000001d44b80 [ 2620.579711] NIP [c0000000010dad38]
>>>> _raw_spin_lock_irqsave+0x98/0x120
>>>> [ 2620.579724] LR [c0000000010dad30] _raw_spin_lock_irqsave+0x90/0x120
>>>> [ 2620.579737] Call Trace:
>>>> [ 2620.579746] [c00000ffcb8c7890] [c0000000013c84a0]
>>>> ncsi_ops+0x209f50/0x2dc1d8 (unreliable)
>>>> [ 2620.579763] [c00000ffcb8c78d0] [c00000000023718c] rcu_core+0xfc/0x7a0
>>>> [ 2620.579777] [c00000ffcb8c7970] [c0000000010db81c]
>>>> __do_softirq+0x17c/0x534
>>>> [ 2620.579791] [c00000ffcb8c7aa0] [c0000000001786f4] irq_exit+0xd4/0x130
>>>> [ 2620.579805] [c00000ffcb8c7ad0] [c000000000025eec]
>>>> timer_interrupt+0x13c/0x370
>>>> [ 2620.579821] [c00000ffcb8c7b40] [c0000000000165c0]
>>>> replay_soft_interrupts+0x320/0x3f0
>>>> [ 2620.579837] [c00000ffcb8c7d30] [c0000000000166d8]
>>>> arch_local_irq_restore+0x48/0xa0
>>>> [ 2620.579853] [c00000ffcb8c7d50] [c000000000de2fe0]
>>>> cpuidle_enter_state+0x100/0x780
> 
> [snip]
> 
>>> I have to warm reset the system to get it working again.
>>
>> I am unable to reproduce this with Ubuntu’s Linux
> 
> Okay, not sure what that would be from, looks like RCU perhaps. Anyway
> if it comes up again, let us know.

Ah, it’s a different trace. I think it’s just an effect of the first 
error (as below), as some CPUs lock up. I wasn’t able to capture the 
start of the trace above. In the attachment for the hang *below* you can 
also see

     [  664.705193] watchdog: BUG: soft lockup - CPU#134 stuck for 26s! 
[swapper/134:0]

after the first Oops.

>> With Linux 5.8-rc3+, I got now the beginning of the Linux messages.
>>
>>> [  572.253008] Oops: Exception in kernel mode, sig: 5 [#1]
>>> [  572.253198] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>>> [  572.253232] Modules linked in: tcp_diag inet_diag unix_diag xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs kvm_hv kvm binfmt_misc joydev uas usb_storage vmx_crypto bnx2x crct10dif_vpmsum ofpart cmdlinepart powernv_flash mtd mdio ibmpowernv at24 ipmi_powernv ipmi_devintf ipmi_msghandler opal_prd powernv_rng sch_fq_codel parport_pc ppdev lp nfsd parport auth_rpcgss nfs_acl lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm ahci drm_panel_orientation_quirks libahci usbhid hid crc32c_vpmsum uio_pdrv_genirq uio
>>> [  572.253639] CPU: 4 PID: 6728 Comm: Web Content Not tainted 5.8.0-rc3+ #1
>>> [  572.253659] NIP:  c00000000000ff5c LR: c00000000001a8f8 CTR: c0000000001d5f00
>>> [  572.253835] REGS: c000007f31f0f420 TRAP: 1500   Not tainted  (5.8.0-rc3+)
>>> [  572.253854] MSR:  900000000290b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28c48482  XER: 20000000
>>> [  572.253888] CFAR: c00000000000fecc IRQMASK: 1
>>> [  572.253888] GPR00: c00000000001b228 c000007f31f0f6b0 c000000001f9a900 c000007f351544d0
>>> [  572.253888] GPR04: 0000000000000000 c000007f31f0fe90 c000007f351544f0 c000007f32e522b0
>>> [  572.253888] GPR08: 0000000000000000 0000000000002000 9000000000009033 c000007fbcd85800
>>> [  572.253888] GPR12: 0000000000008800 c000007fffffb680 0000000000000005 0000000000000004
>>> [  572.253888] GPR16: c000007f35153800 c000007f35154130 0000000000000005 0000000000000001
>>> [  572.253888] GPR20: 0000000000000024 c000007f32e51e68 c000007f35154028 0000007fd8da0000
>>> [  572.253888] GPR24: 0000007fd8da0000 c000007f351544d0 c000007e9a4024d0 c000000001665f18
>>> [  572.253888] GPR28: c000007f351544d0 c000007f35153800 900000000290f033 c000007f35153800
>>> [  572.254079] NIP [c00000000000ff5c] save_fpu+0xa8/0x2ac
>>> [  572.254098] LR [c00000000001a8f8] __giveup_fpu+0x28/0x80
>>> [  572.254114] Call Trace:
>>> [  572.254128] [c000007f31f0f6b0] [c000007f35153980] 0xc000007f35153980 (unreliable)
>>> [  572.254156] [c000007f31f0f6e0] [c00000000001b228] giveup_all+0x128/0x150
>>> [  572.254327] [c000007f31f0f710] [c00000000001c124] __switch_to+0x104/0x490
>>> [  572.254352] [c000007f31f0f770] [c0000000010d2e34] __schedule+0x2e4/0xa10
>>> [  572.254374] [c000007f31f0f840] [c0000000010d35d4] schedule+0x74/0x140
>>> [  572.254397] [c000007f31f0f870] [c0000000010d9478] schedule_timeout+0x358/0x5d0
>>> [  572.254424] [c000007f31f0f980] [c0000000010d5638] wait_for_completion+0xc8/0x210
>>> [  572.254451] [c000007f31f0fa00] [c000000000608ed4] do_coredump+0x3a4/0xd60
>>> [  572.254625] [c000007f31f0fba0] [c00000000018d1cc] get_signal+0x1dc/0xd00
>>> [  572.254648] [c000007f31f0fcc0] [c00000000001f088] do_notify_resume+0x158/0x450
>>> [  572.254672] [c000007f31f0fda0] [c000000000037d04] interrupt_exit_user_prepare+0x1c4/0x230
>>> [  572.254699] [c000007f31f0fe20] [c00000000000f2b4] interrupt_return+0x14/0x1c0
>>> [  572.254720] Instruction dump:
>>> [  572.254882] dae60170 db060180 db260190 db4601a0 db6601b0 db8601c0 dba601d0 dbc601e0
>>> [  572.254912] dbe601f0 48000204 38800000 f0000250 <7c062798> f0000250 38800010 f0210a50
>>> [  572.254946] ---[ end trace ba4452ee5c77d58e ]---
>>
>> Please find all the messages attached.
> 
> "Oops: Exception in kernel mode, sig: 5 [#1]"
> 
> Unfortunately it's a very poor error message. I think it is a 0x1500
> exception triggering in the kernel FP register saving. Do you have the
> CONFIG_PPC_DENORMALISATION config option set?

Yes, as it’s set in the Ubuntu Linux kernel configuration, I have it set 
too.

     $ grep DENORMALI /boot/config-*
     /boot/config-4.15.0-23-generic:CONFIG_PPC_DENORMALISATION=y
     /boot/config-5.4.0-40-generic:CONFIG_PPC_DENORMALISATION=y
     /boot/config-5.7.0-rc5+:CONFIG_PPC_DENORMALISATION=y
     /boot/config-5.8.0-rc3+:CONFIG_PPC_DENORMALISATION=y


Kind regards,

Paul
