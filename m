Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCE847167
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 14:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRHGT6vKQz3dKX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 00:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRHG14GKyz3c9c
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 00:49:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB82ADA7;
	Fri,  2 Feb 2024 05:50:06 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2783F5A1;
	Fri,  2 Feb 2024 05:49:22 -0800 (PST)
Message-ID: <697da9bd-cfad-4219-905d-37cb770832cf@arm.com>
Date: Fri, 2 Feb 2024 13:49:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline] [linux-next] [6.8-rc1] [FC] [DLPAR] OOps kernel crash
 after performing dlpar remove test
Content-Language: en-GB
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 iommu@lists.linux.dev
References: <b7e18415-c04d-412e-8129-22a144d736b9@linux.vnet.ibm.com>
 <01234ac0-f96d-4a18-8dfa-557020818215@arm.com>
 <37666b87-0065-4717-b825-387a2bb96d82@linux.vnet.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <37666b87-0065-4717-b825-387a2bb96d82@linux.vnet.ibm.com>
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
Cc: "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, joro@8bytes.org, rafael.j.wysocki@intel.com, jsnitsel@redhat.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>, gregkh@linuxfoundation.org, will@kernel.org, hch@lst.de, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/02/2024 7:11 am, Tasmiya Nalatwad wrote:
> Greetings,
> 
> I have tried reverting some latest commits and tested the issue. I see
> reverting below commit hits to some other problem which was reported
> earlier and the patch for fixing that issue is under review
> 
> 1. Reverted commit :
> 
>       commit 17de3f5fdd35676b0e3d41c7c9bf4e3032eb3673
>       iommu: Retire bus ops
> 
> 2. Below are the traces of other issue that was seen after reverting
> above commit, And below is the patch which fixes this issue is that is 
> under review
> 
> Patch :
> https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg225210.html

Yes, it's the same fundamental issue (failing to manage the IOMMU state 
for dynamic addition/removal) that's been present since the commit cited 
in the fix patch; the bus ops change just makes us more sensitive to the 
lack of unregistration on remove, vs. the lack of registration on add. 
The fix should solve both aspects (although I'd be inlined to agree with 
factoring out the registration between both paths).

Thanks,
Robin.

> --- Traces ---
> 
> [  981.124047] Kernel attempted to read user page (30) - exploit
> attempt? (uid: 0)
> [  981.124053] BUG: Kernel NULL pointer dereference on read at 0x00000030
> [  981.124056] Faulting instruction address: 0xc000000000689864
> [  981.124060] Oops: Kernel access of bad area, sig: 11 [#1]
> [  981.124063] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
> [  981.124067] Modules linked in: sit tunnel4 ip_tunnel rpadlpar_io
> rpaphp xsk_diag nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding
> tls ip_set rfkill nf_tables libcrc32c nfnetlink pseries_rng vmx_crypto
> binfmt_misc ext4 mbcache jbd2 dm_service_time sd_mod t10_pi
> crc64_rocksoft crc64 sg ibmvfc scsi_transport_fc ibmveth mlx5_core mlxfw
> psample dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
> [  981.124111] CPU: 24 PID: 78294 Comm: drmgr Kdump: loaded Not tainted
> 6.5.0-rc6-next-20230817-auto #1
> [  981.124115] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200
> 0xf000006 of:IBM,FW1030.30 (NH1030_062) hv:phyp pSeries
> [  981.124118] NIP:  c000000000689864 LR: c0000000009bd05c CTR:
> c00000000005fb90
> [  981.124121] REGS: c0000000a878b1e0 TRAP: 0300   Not tainted
> (6.5.0-rc6-next-20230817-auto)
> [  981.124125] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR:
> 44822422  XER: 20040006
> [  981.124132] CFAR: c0000000009bd058 DAR: 0000000000000030 DSISR:
> 40000000 IRQMASK: 0
> [  981.124132] GPR00: c0000000009bd05c c0000000a878b480 c000000001451400
> 0000000000000000
> [  981.124132] GPR04: c00000000128d510 0000000000000000 c00000000eeccf50
> c0000000a878b420
> [  981.124132] GPR08: 0000000000000001 c00000000eed76e0 c000000002c24c28
> 0000000000000220
> [  981.124132] GPR12: c00000000005fb90 c000001837969300 0000000000000000
> 0000000000000000
> [  981.124132] GPR16: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> [  981.124132] GPR20: c00000000125cef0 0000000000000000 c00000000125cf08
> c000000002bce500
> [  981.124132] GPR24: c0000000573e90c0 fffffffffffff000 c0000000573e93c0
> c0000000a877d2a0
> [  981.124132] GPR28: c00000000128d510 c00000000eeccf50 c0000000a877d2a0
> c0000000573e90c0
> [  981.124171] NIP [c000000000689864] sysfs_add_link_to_group+0x34/0x90
> [  981.124178] LR [c0000000009bd05c] iommu_device_link+0x5c/0x110
> [  981.124184] Call Trace:
> [  981.124186] [c0000000a878b480] [c00000000048d630]
> kmalloc_trace+0x50/0x140 (unreliable)
> [  981.124193] [c0000000a878b4c0] [c0000000009bd05c]
> iommu_device_link+0x5c/0x110
> [  981.124198] [c0000000a878b500] [c0000000009ba050]
> __iommu_probe_device+0x250/0x5c0
> [  981.124203] [c0000000a878b570] [c0000000009ba9e0]
> iommu_probe_device_locked+0x30/0x90
> [  981.124207] [c0000000a878b5a0] [c0000000009baa80]
> iommu_probe_device+0x40/0x70
> [  981.124212] [c0000000a878b5d0] [c0000000009baaf0]
> iommu_bus_notifier+0x40/0x80
> [  981.124217] [c0000000a878b5f0] [c00000000019aad0]
> notifier_call_chain+0xc0/0x1b0
> [  981.124221] [c0000000a878b650] [c00000000019b604]
> blocking_notifier_call_chain+0x64/0xa0
> [  981.124226] [c0000000a878b690] [c0000000009cd870] bus_notify+0x50/0x80
> [  981.124230] [c0000000a878b6d0] [c0000000009c8f04] device_add+0x744/0x9b0
> [  981.124235] [c0000000a878b790] [c00000000089f2ec]
> pci_device_add+0x2fc/0x880
> [  981.124240] [c0000000a878b840] [c00000000007ef90]
> of_create_pci_dev+0x390/0xa10
> [  981.124245] [c0000000a878b920] [c00000000007f858]
> __of_scan_bus+0x248/0x320
> [  981.124249] [c0000000a878ba00] [c00000000007c1f0]
> pcibios_scan_phb+0x2d0/0x3c0
> [  981.124254] [c0000000a878bad0] [c000000000107f08]
> init_phb_dynamic+0xb8/0x110
> [  981.124259] [c0000000a878bb40] [c008000002cc03b4]
> dlpar_add_slot+0x18c/0x380 [rpadlpar_io]
> [  981.124265] [c0000000a878bbe0] [c008000002cc0bec]
> add_slot_store+0xa4/0x150 [rpadlpar_io]
> [  981.124270] [c0000000a878bc70] [c000000000f2f800]
> kobj_attr_store+0x30/0x50
> [  981.124274] [c0000000a878bc90] [c000000000687368]
> sysfs_kf_write+0x68/0x80
> [  981.124278] [c0000000a878bcb0] [c000000000685d3c]
> kernfs_fop_write_iter+0x1cc/0x280
> [  981.124283] [c0000000a878bd00] [c0000000005909c8] vfs_write+0x358/0x4b0
> [  981.124288] [c0000000a878bdc0] [c000000000590cfc] ksys_write+0x7c/0x140
> [  981.124293] [c0000000a878be10] [c000000000036554]
> system_call_exception+0x134/0x330
> [  981.124298] [c0000000a878be50] [c00000000000d6a0]
> system_call_common+0x160/0x2e4
> [  981.124303] --- interrupt: c00 at 0x200013f21594
> [  981.124306] NIP:  0000200013f21594 LR: 0000200013e97bf4 CTR:
> 0000000000000000
> [  981.124309] REGS: c0000000a878be80 TRAP: 0c00   Not tainted
> (6.5.0-rc6-next-20230817-auto)
> [  981.124312] MSR:  800000000280f033
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22000282  XER: 00000000
> [  981.124321] IRQMASK: 0
> [  981.124321] GPR00: 0000000000000004 00007ffff3a55c70 0000200014007300
> 0000000000000007
> [  981.124321] GPR04: 000000013aff5750 0000000000000008 fffffffffbad2c80
> 000000013afd02a0
> [  981.124321] GPR08: 0000000000000001 0000000000000000 0000000000000000
> 0000000000000000
> [  981.124321] GPR12: 0000000000000000 0000200013b7bc30 0000000000000000
> 0000000000000000
> [  981.124321] GPR16: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> [  981.124321] GPR20: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
> [  981.124321] GPR24: 000000010ef61668 0000000000000000 0000000000000008
> 000000013aff5750
> [  981.124321] GPR28: 0000000000000008 000000013afd02a0 000000013aff5750
> 0000000000000008
> [  981.124356] NIP [0000200013f21594] 0x200013f21594
> [  981.124358] LR [0000200013e97bf4] 0x200013e97bf4
> [  981.124361] --- interrupt: c00
> [  981.124362] Code: 38427bd0 7c0802a6 60000000 7c0802a6 fba1ffe8
> fbc1fff0 fbe1fff8 7cbf2b78 38a00000 7cdd3378 f8010010 f821ffc1
> <e8630030> 4bff95d1 60000000 7c7e1b79
> [  981.124374] ---[ end trace 0000000000000000 ]---
> 
> 
> Thanks and Regards
> 
> On 1/31/24 16:18, Robin Murphy wrote:
>> On 2024-01-31 9:19 am, Tasmiya Nalatwad wrote:
>>> Greetings,
>>>
>>> [mainline] [linux-next] [6.8-rc1] [DLPAR] OOps kernel crash after 
>>> performing dlpar remove test
>>>
>>> --- Traces ---
>>>
>>> [58563.146236] BUG: Unable to handle kernel data access at 
>>> 0x6b6b6b6b6b6b6b83
>>> [58563.146242] Faulting instruction address: 0xc0000000009c0e60
>>> [58563.146248] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [58563.146252] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=8192 NUMA pSeries
>>> [58563.146258] Modules linked in: isofs cdrom dm_snapshot dm_bufio 
>>> dm_round_robin dm_queue_length exfat vfat fat btrfs blake2b_generic 
>>> xor raid6_pq zstd_compress loop xfs libcrc32c raid0 nvram rpadlpar_io 
>>> rpaphp nfnetlink xsk_diag bonding tls rfkill sunrpc dm_service_time 
>>> dm_multipath dm_mod pseries_rng vmx_crypto binfmt_misc ext4 mbcache 
>>> jbd2 sd_mod sg ibmvscsi scsi_transport_srp ibmveth lpfc nvmet_fc 
>>> nvmet nvme_fc nvme_fabrics nvme_core t10_pi crc64_rocksoft crc64 
>>> scsi_transport_fc fuse
>>> [58563.146326] CPU: 0 PID: 1071247 Comm: drmgr Kdump: loaded Not 
>>> tainted 6.8.0-rc1-auto-gecb1b8288dc7 #1
>>> [58563.146332] Hardware name: IBM,9009-42A POWER9 (raw) 0x4e0202 
>>> 0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
>>> [58563.146337] NIP:  c0000000009c0e60 LR: c0000000009c0e28 CTR: 
>>> c0000000009c1584
>>> [58563.146342] REGS: c00000007960f260 TRAP: 0380   Not tainted 
>>> (6.8.0-rc1-auto-gecb1b8288dc7)
>>> [58563.146347] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
>>> 24822424  XER: 20040006
>>> [58563.146360] CFAR: c0000000009c0e74 IRQMASK: 0
>>> [58563.146360] GPR00: c0000000009c0e28 c00000007960f500 
>>> c000000001482600 c000000003050540
>>> [58563.146360] GPR04: 0000000000000000 c00000089a6870c0 
>>> 0000000000000001 fffffffffffe0000
>>> [58563.146360] GPR08: c000000002bac020 6b6b6b6b6b6b6b6b 
>>> 6b6b6b6b6b6b6b6b 0000000000000220
>>> [58563.146360] GPR12: 0000000000002000 c000000003080000 
>>> 0000000000000000 0000000000000000
>>> [58563.146360] GPR16: 0000000000000000 0000000000000000 
>>> 0000000000000000 0000000000000001
>>> [58563.146360] GPR20: c000000001281478 0000000000000000 
>>> c000000001281490 c000000002bfed80
>>> [58563.146360] GPR24: c00000089a6870c0 0000000000000000 
>>> 0000000000000000 c000000002b9ffb8
>>> [58563.146360] GPR28: 0000000000000000 c000000002bac0e8 
>>> 0000000000000000 0000000000000000
>>> [58563.146421] NIP [c0000000009c0e60] iommu_ops_from_fwnode+0x68/0x118
>>> [58563.146430] LR [c0000000009c0e28] iommu_ops_from_fwnode+0x30/0x118
>>
>> This implies that iommu_device_list has become corrupted. Looks like 
>> spapr_tce_setup_phb_iommus_initcall() registers an iommu_device which 
>> pcibios_free_controller() could free if a PCI controller is removed, 
>> but there's no path anywhere to ever unregister any of those IOMMUs. 
>> Presumably this also means that is a PCI controller is dynamically 
>> added after init, its IOMMU won't be set up properly either.
>>
>> Thanks,
>> Robin.
>>
>>> [58563.146437] Call Trace:
>>> [58563.146439] [c00000007960f500] [c00000007960f560] 
>>> 0xc00000007960f560 (unreliable)
>>> [58563.146446] [c00000007960f530] [c0000000009c0fd0] 
>>> __iommu_probe_device+0xc0/0x5c0
>>> [58563.146454] [c00000007960f5a0] [c0000000009c151c] 
>>> iommu_probe_device+0x4c/0xb4
>>> [58563.146462] [c00000007960f5e0] [c0000000009c15d0] 
>>> iommu_bus_notifier+0x4c/0x8c
>>> [58563.146469] [c00000007960f600] [c00000000019e3d0] 
>>> notifier_call_chain+0xb8/0x1a0
>>> [58563.146476] [c00000007960f660] [c00000000019eea0] 
>>> blocking_notifier_call_chain+0x64/0x94
>>> [58563.146483] [c00000007960f6a0] [c0000000009d3c5c] 
>>> bus_notify+0x50/0x7c
>>> [58563.146491] [c00000007960f6e0] [c0000000009cfba4] 
>>> device_add+0x774/0x9bc
>>> [58563.146498] [c00000007960f7a0] [c0000000008abe9c] 
>>> pci_device_add+0x2f4/0x864
>>> [58563.146506] [c00000007960f850] [c00000000007d5a0] 
>>> of_create_pci_dev+0x390/0xa08
>>> [58563.146514] [c00000007960f930] [c00000000007de68] 
>>> __of_scan_bus+0x250/0x328
>>> [58563.146520] [c00000007960fa10] [c00000000007a680] 
>>> pcibios_scan_phb+0x274/0x3c0
>>> [58563.146527] [c00000007960fae0] [c000000000105d58] 
>>> init_phb_dynamic+0xb8/0x110
>>> [58563.146535] [c00000007960fb50] [c0080000217b0380] 
>>> dlpar_add_slot+0x170/0x3b4 [rpadlpar_io]
>>> [58563.146544] [c00000007960fbf0] [c0080000217b0ca0] 
>>> add_slot_store+0xa4/0x140 [rpadlpar_io]
>>> [58563.146551] [c00000007960fc80] [c000000000f3dbec] 
>>> kobj_attr_store+0x30/0x4c
>>> [58563.146559] [c00000007960fca0] [c0000000006931fc] 
>>> sysfs_kf_write+0x68/0x7c
>>> [58563.146566] [c00000007960fcc0] [c000000000691b2c] 
>>> kernfs_fop_write_iter+0x1c8/0x278
>>> [58563.146573] [c00000007960fd10] [c000000000599f54] 
>>> vfs_write+0x340/0x4cc
>>> [58563.146580] [c00000007960fdc0] [c00000000059a2bc] 
>>> ksys_write+0x7c/0x140
>>> [58563.146587] [c00000007960fe10] [c000000000035d74] 
>>> system_call_exception+0x134/0x330
>>> [58563.146595] [c00000007960fe50] [c00000000000d6a0] 
>>> system_call_common+0x160/0x2e4
>>> [58563.146602] --- interrupt: c00 at 0x200004470cb4
>>> [58563.146606] NIP:  0000200004470cb4 LR: 00002000043e7d04 CTR: 
>>> 0000000000000000
>>> [58563.146611] REGS: c00000007960fe80 TRAP: 0c00   Not tainted 
>>> (6.8.0-rc1-auto-gecb1b8288dc7)
>>> [58563.146616] MSR:  800000000280f033 
>>> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24000282  XER: 00000000
>>> [58563.146632] IRQMASK: 0
>>> [58563.146632] GPR00: 0000000000000004 00007fffd3993420 
>>> 0000200004557300 0000000000000007
>>> [58563.146632] GPR04: 000001000d8a5270 0000000000000006 
>>> fffffffffbad2c80 000001000d8a02a0
>>> [58563.146632] GPR08: 0000000000000001 0000000000000000 
>>> 0000000000000000 0000000000000000
>>> [58563.146632] GPR12: 0000000000000000 000020000422bb50 
>>> 0000000000000000 0000000000000000
>>> [58563.146632] GPR16: 0000000000000000 0000000000000000 
>>> 0000000000000000 0000000000000000
>>> [58563.146632] GPR20: 0000000000000000 0000000000000000 
>>> 0000000000000000 0000000000000000
>>> [58563.146632] GPR24: 0000000106b41668 0000000000000000 
>>> 0000000000000006 000001000d8a5270
>>> [58563.146632] GPR28: 0000000000000006 000001000d8a02a0 
>>> 000001000d8a5270 0000000000000006
>>> [58563.146690] NIP [0000200004470cb4] 0x200004470cb4
>>> [58563.146694] LR [00002000043e7d04] 0x2000043e7d04
>>> [58563.146698] --- interrupt: c00
>>> [58563.146701] Code: e9299a20 3d020173 39089a20 7fa94000 419e0038 
>>> e9490018 7fbf5000 409e0020 48000070 60000000 60000000 60000000 
>>> <e9490018> 7faaf840 419e0058 e9290000
>>> [58563.146722] ---[ end trace 0000000000000000 ]---
>>>
>>
