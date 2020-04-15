Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274D1A9ABC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 12:36:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492JgY6PvKzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 20:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BhWVWiAe; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Jcw2KqgzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 20:34:23 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B263206D9;
 Wed, 15 Apr 2020 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586946861;
 bh=IHqqRCjhVBsUTEchewJ/pAejrwW+WhG7x9QAN25LdmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BhWVWiAeDOhuzU7dodyD0vEl/3+4NxYeUF+ORusBf+CHRqZhYHl26LYmEMIJg5JB6
 STAK8u1dDScC0DYtX0Llr97ZkbDftkTdMBSsL7zzThK0L24WRl0KCcd6plNY7VnOxz
 /fDZBUQCai7PYETmqCO1RD4hlIFzWWCqk4BuXoTA=
Date: Wed, 15 Apr 2020 12:34:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: andrew@daynix.com
Subject: Re: [PATCH v2] Fix: buffer overflow during hvc_alloc().
Message-ID: <20200415103418.GA2645546@kroah.com>
References: <20200414191503.3471783-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414191503.3471783-1-andrew@daynix.com>
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
Cc: jslaby@suse.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 10:15:03PM +0300, andrew@daynix.com wrote:
> From: Andrew Melnychenko <andrew@daynix.com>
> 
> If there is a lot(more then 16) of virtio-console devices
> or virtio_console module is reloaded
> - buffers 'vtermnos' and 'cons_ops' are overflowed.
> In older kernels it overruns spinlock which leads to kernel freezing:
> https://bugzilla.redhat.com/show_bug.cgi?id=1786239
> 
> To reproduce the issue, you can try simple script that
> loads/unloads module. Something like this:
> while [ 1 ]
> do
>   modprobe virtio_console
>   sleep 2
>   modprobe -r virtio_console
>   sleep 2
> done
> 
> Description of problem:
> Guest get 'Call Trace' when loading module "virtio_console"
> and unloading it frequently - clearly reproduced on kernel-4.18.0:
> 
> [   81.498208] ------------[ cut here ]------------
> [   81.499263] pvqspinlock: lock 0xffffffff92080020 has corrupted value 0xc0774ca0!
> [   81.501000] WARNING: CPU: 0 PID: 785 at kernel/locking/qspinlock_paravirt.h:500 __pv_queued_spin_unlock_slowpath+0xc0/0xd0
> [   81.503173] Modules linked in: virtio_console fuse xt_CHECKSUM ipt_MASQUERADE xt_conntrack ipt_REJECT nft_counter nf_nat_tftp nft_objref nf_conntrack_tftp tun bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_tables_set nft_chain_nat_ipv6 nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 nft_chain_route_ipv6 nft_chain_nat_ipv4 nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack nft_chain_route_ipv4 ip6_tables nft_compat ip_set nf_tables nfnetlink sunrpc bochs_drm drm_vram_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm i2c_piix4 pcspkr crct10dif_pclmul crc32_pclmul joydev ghash_clmulni_intel ip_tables xfs libcrc32c sd_mod sg ata_generic ata_piix virtio_net libata crc32c_intel net_failover failover serio_raw virtio_scsi dm_mirror dm_region_hash dm_log dm_mod [last unloaded: virtio_console]
> [   81.517019] CPU: 0 PID: 785 Comm: kworker/0:2 Kdump: loaded Not tainted 4.18.0-167.el8.x86_64 #1
> [   81.518639] Hardware name: Red Hat KVM, BIOS 1.12.0-5.scrmod+el8.2.0+5159+d8aa4d83 04/01/2014
> [   81.520205] Workqueue: events control_work_handler [virtio_console]
> [   81.521354] RIP: 0010:__pv_queued_spin_unlock_slowpath+0xc0/0xd0
> [   81.522450] Code: 07 00 48 63 7a 10 e8 bf 64 f5 ff 66 90 c3 8b 05 e6 cf d6 01 85 c0 74 01 c3 8b 17 48 89 fe 48 c7 c7 38 4b 29 91 e8 3a 6c fa ff <0f> 0b c3 0f 0b 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 48
> [   81.525830] RSP: 0018:ffffb51a01ffbd70 EFLAGS: 00010282
> [   81.526798] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
> [   81.528110] RDX: ffff9e66f1826480 RSI: ffff9e66f1816a08 RDI: ffff9e66f1816a08
> [   81.529437] RBP: ffffffff9153ff10 R08: 000000000000026c R09: 0000000000000053
> [   81.530732] R10: 0000000000000000 R11: ffffb51a01ffbc18 R12: ffff9e66cd682200
> [   81.532133] R13: ffffffff9153ff10 R14: ffff9e6685569500 R15: ffff9e66cd682000
> [   81.533442] FS:  0000000000000000(0000) GS:ffff9e66f1800000(0000) knlGS:0000000000000000
> [   81.534914] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   81.535971] CR2: 00005624c55b14d0 CR3: 00000003a023c000 CR4: 00000000003406f0
> [   81.537283] Call Trace:
> [   81.537763]  __raw_callee_save___pv_queued_spin_unlock_slowpath+0x11/0x20
> [   81.539011]  .slowpath+0x9/0xe
> [   81.539585]  hvc_alloc+0x25e/0x300
> [   81.540237]  init_port_console+0x28/0x100 [virtio_console]
> [   81.541251]  handle_control_message.constprop.27+0x1c4/0x310 [virtio_console]
> [   81.542546]  control_work_handler+0x70/0x10c [virtio_console]
> [   81.543601]  process_one_work+0x1a7/0x3b0
> [   81.544356]  worker_thread+0x30/0x390
> [   81.545025]  ? create_worker+0x1a0/0x1a0
> [   81.545749]  kthread+0x112/0x130
> [   81.546358]  ? kthread_flush_work_fn+0x10/0x10
> [   81.547183]  ret_from_fork+0x22/0x40
> [   81.547842] ---[ end trace aa97649bd16c8655 ]---
> [   83.546539] general protection fault: 0000 [#1] SMP NOPTI
> [   83.547422] CPU: 5 PID: 3225 Comm: modprobe Kdump: loaded Tainted: G        W        --------- -  - 4.18.0-167.el8.x86_64 #1
> [   83.549191] Hardware name: Red Hat KVM, BIOS 1.12.0-5.scrmod+el8.2.0+5159+d8aa4d83 04/01/2014
> [   83.550544] RIP: 0010:__pv_queued_spin_lock_slowpath+0x19a/0x2a0
> [   83.551504] Code: c4 c1 ea 12 41 be 01 00 00 00 4c 8d 6d 14 41 83 e4 03 8d 42 ff 49 c1 e4 05 48 98 49 81 c4 40 a5 02 00 4c 03 24 c5 60 48 34 91 <49> 89 2c 24 b8 00 80 00 00 eb 15 84 c0 75 0a 41 0f b6 54 24 14 84
> [   83.554449] RSP: 0018:ffffb51a0323fdb0 EFLAGS: 00010202
> [   83.555290] RAX: 000000000000301c RBX: ffffffff92080020 RCX: 0000000000000001
> [   83.556426] RDX: 000000000000301d RSI: 0000000000000000 RDI: 0000000000000000
> [   83.557556] RBP: ffff9e66f196a540 R08: 000000000000028a R09: ffff9e66d2757788
> [   83.558688] R10: 0000000000000000 R11: 0000000000000000 R12: 646e61725f770b07
> [   83.559821] R13: ffff9e66f196a554 R14: 0000000000000001 R15: 0000000000180000
> [   83.560958] FS:  00007fd5032e8740(0000) GS:ffff9e66f1940000(0000) knlGS:0000000000000000
> [   83.562233] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   83.563149] CR2: 00007fd5022b0da0 CR3: 000000038c334000 CR4: 00000000003406e0
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  drivers/tty/hvc/hvc_console.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

What changed from v1?  Always  put this below the --- line.

v3 please?

thanks,

greg k-h
