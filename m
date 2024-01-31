Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA9843D74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 11:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzYl5Kzcz3cX1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 21:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 551 seconds by postgrey-1.37 at boromir; Wed, 31 Jan 2024 21:58:46 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzYL0p8Nz3bmq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 21:58:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59443DA7;
	Wed, 31 Jan 2024 02:49:45 -0800 (PST)
Received: from [10.57.88.75] (unknown [10.57.88.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16D293F762;
	Wed, 31 Jan 2024 02:48:59 -0800 (PST)
Message-ID: <01234ac0-f96d-4a18-8dfa-557020818215@arm.com>
Date: Wed, 31 Jan 2024 10:48:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline] [linux-next] [6.8-rc1] [FC] [DLPAR] OOps kernel crash
 after performing dlpar remove test
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <b7e18415-c04d-412e-8129-22a144d736b9@linux.vnet.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <b7e18415-c04d-412e-8129-22a144d736b9@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, joro@8bytes.org, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, iommu@lists.linux.dev, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-01-31 9:19 am, Tasmiya Nalatwad wrote:
> Greetings,
> 
> [mainline] [linux-next] [6.8-rc1] [DLPAR] OOps kernel crash after 
> performing dlpar remove test
> 
> --- Traces ---
> 
> [58563.146236] BUG: Unable to handle kernel data access at 
> 0x6b6b6b6b6b6b6b83
> [58563.146242] Faulting instruction address: 0xc0000000009c0e60
> [58563.146248] Oops: Kernel access of bad area, sig: 11 [#1]
> [58563.146252] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=8192 NUMA pSeries
> [58563.146258] Modules linked in: isofs cdrom dm_snapshot dm_bufio 
> dm_round_robin dm_queue_length exfat vfat fat btrfs blake2b_generic xor 
> raid6_pq zstd_compress loop xfs libcrc32c raid0 nvram rpadlpar_io rpaphp 
> nfnetlink xsk_diag bonding tls rfkill sunrpc dm_service_time 
> dm_multipath dm_mod pseries_rng vmx_crypto binfmt_misc ext4 mbcache jbd2 
> sd_mod sg ibmvscsi scsi_transport_srp ibmveth lpfc nvmet_fc nvmet 
> nvme_fc nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 
> scsi_transport_fc fuse
> [58563.146326] CPU: 0 PID: 1071247 Comm: drmgr Kdump: loaded Not tainted 
> 6.8.0-rc1-auto-gecb1b8288dc7 #1
> [58563.146332] Hardware name: IBM,9009-42A POWER9 (raw) 0x4e0202 
> 0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
> [58563.146337] NIP:  c0000000009c0e60 LR: c0000000009c0e28 CTR: 
> c0000000009c1584
> [58563.146342] REGS: c00000007960f260 TRAP: 0380   Not tainted 
> (6.8.0-rc1-auto-gecb1b8288dc7)
> [58563.146347] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
> 24822424  XER: 20040006
> [58563.146360] CFAR: c0000000009c0e74 IRQMASK: 0
> [58563.146360] GPR00: c0000000009c0e28 c00000007960f500 c000000001482600 
> c000000003050540
> [58563.146360] GPR04: 0000000000000000 c00000089a6870c0 0000000000000001 
> fffffffffffe0000
> [58563.146360] GPR08: c000000002bac020 6b6b6b6b6b6b6b6b 6b6b6b6b6b6b6b6b 
> 0000000000000220
> [58563.146360] GPR12: 0000000000002000 c000000003080000 0000000000000000 
> 0000000000000000
> [58563.146360] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000001
> [58563.146360] GPR20: c000000001281478 0000000000000000 c000000001281490 
> c000000002bfed80
> [58563.146360] GPR24: c00000089a6870c0 0000000000000000 0000000000000000 
> c000000002b9ffb8
> [58563.146360] GPR28: 0000000000000000 c000000002bac0e8 0000000000000000 
> 0000000000000000
> [58563.146421] NIP [c0000000009c0e60] iommu_ops_from_fwnode+0x68/0x118
> [58563.146430] LR [c0000000009c0e28] iommu_ops_from_fwnode+0x30/0x118

This implies that iommu_device_list has become corrupted. Looks like 
spapr_tce_setup_phb_iommus_initcall() registers an iommu_device which 
pcibios_free_controller() could free if a PCI controller is removed, but 
there's no path anywhere to ever unregister any of those IOMMUs. 
Presumably this also means that is a PCI controller is dynamically added 
after init, its IOMMU won't be set up properly either.

Thanks,
Robin.

> [58563.146437] Call Trace:
> [58563.146439] [c00000007960f500] [c00000007960f560] 0xc00000007960f560 
> (unreliable)
> [58563.146446] [c00000007960f530] [c0000000009c0fd0] 
> __iommu_probe_device+0xc0/0x5c0
> [58563.146454] [c00000007960f5a0] [c0000000009c151c] 
> iommu_probe_device+0x4c/0xb4
> [58563.146462] [c00000007960f5e0] [c0000000009c15d0] 
> iommu_bus_notifier+0x4c/0x8c
> [58563.146469] [c00000007960f600] [c00000000019e3d0] 
> notifier_call_chain+0xb8/0x1a0
> [58563.146476] [c00000007960f660] [c00000000019eea0] 
> blocking_notifier_call_chain+0x64/0x94
> [58563.146483] [c00000007960f6a0] [c0000000009d3c5c] bus_notify+0x50/0x7c
> [58563.146491] [c00000007960f6e0] [c0000000009cfba4] device_add+0x774/0x9bc
> [58563.146498] [c00000007960f7a0] [c0000000008abe9c] 
> pci_device_add+0x2f4/0x864
> [58563.146506] [c00000007960f850] [c00000000007d5a0] 
> of_create_pci_dev+0x390/0xa08
> [58563.146514] [c00000007960f930] [c00000000007de68] 
> __of_scan_bus+0x250/0x328
> [58563.146520] [c00000007960fa10] [c00000000007a680] 
> pcibios_scan_phb+0x274/0x3c0
> [58563.146527] [c00000007960fae0] [c000000000105d58] 
> init_phb_dynamic+0xb8/0x110
> [58563.146535] [c00000007960fb50] [c0080000217b0380] 
> dlpar_add_slot+0x170/0x3b4 [rpadlpar_io]
> [58563.146544] [c00000007960fbf0] [c0080000217b0ca0] 
> add_slot_store+0xa4/0x140 [rpadlpar_io]
> [58563.146551] [c00000007960fc80] [c000000000f3dbec] 
> kobj_attr_store+0x30/0x4c
> [58563.146559] [c00000007960fca0] [c0000000006931fc] 
> sysfs_kf_write+0x68/0x7c
> [58563.146566] [c00000007960fcc0] [c000000000691b2c] 
> kernfs_fop_write_iter+0x1c8/0x278
> [58563.146573] [c00000007960fd10] [c000000000599f54] vfs_write+0x340/0x4cc
> [58563.146580] [c00000007960fdc0] [c00000000059a2bc] ksys_write+0x7c/0x140
> [58563.146587] [c00000007960fe10] [c000000000035d74] 
> system_call_exception+0x134/0x330
> [58563.146595] [c00000007960fe50] [c00000000000d6a0] 
> system_call_common+0x160/0x2e4
> [58563.146602] --- interrupt: c00 at 0x200004470cb4
> [58563.146606] NIP:  0000200004470cb4 LR: 00002000043e7d04 CTR: 
> 0000000000000000
> [58563.146611] REGS: c00000007960fe80 TRAP: 0c00   Not tainted 
> (6.8.0-rc1-auto-gecb1b8288dc7)
> [58563.146616] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24000282  XER: 00000000
> [58563.146632] IRQMASK: 0
> [58563.146632] GPR00: 0000000000000004 00007fffd3993420 0000200004557300 
> 0000000000000007
> [58563.146632] GPR04: 000001000d8a5270 0000000000000006 fffffffffbad2c80 
> 000001000d8a02a0
> [58563.146632] GPR08: 0000000000000001 0000000000000000 0000000000000000 
> 0000000000000000
> [58563.146632] GPR12: 0000000000000000 000020000422bb50 0000000000000000 
> 0000000000000000
> [58563.146632] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [58563.146632] GPR20: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [58563.146632] GPR24: 0000000106b41668 0000000000000000 0000000000000006 
> 000001000d8a5270
> [58563.146632] GPR28: 0000000000000006 000001000d8a02a0 000001000d8a5270 
> 0000000000000006
> [58563.146690] NIP [0000200004470cb4] 0x200004470cb4
> [58563.146694] LR [00002000043e7d04] 0x2000043e7d04
> [58563.146698] --- interrupt: c00
> [58563.146701] Code: e9299a20 3d020173 39089a20 7fa94000 419e0038 
> e9490018 7fbf5000 409e0020 48000070 60000000 60000000 60000000 
> <e9490018> 7faaf840 419e0058 e9290000
> [58563.146722] ---[ end trace 0000000000000000 ]---
> 
