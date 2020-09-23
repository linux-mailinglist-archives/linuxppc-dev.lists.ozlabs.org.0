Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F1275224
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 09:08:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx8R41QSkzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 17:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx8PH4sPHzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 17:06:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 93D165DE1201;
 Wed, 23 Sep 2020 09:06:46 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 23 Sep
 2020 09:06:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00529529ff0-02cb-4b65-950e-d237f70daeaa,
 02880E72AE010FE39E8D16B72C25BF9AC4CDD967) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To: Qian Cai <cai@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
Date: Wed, 23 Sep 2020 09:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 765b801f-cc06-4411-87a5-595b37afd762
X-Ovh-Tracer-Id: 17583741795513961324
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffekffefvdfgtdduvefhveegjeevgffgjeehleeihfdvueegkeevkeduvdehfefhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptggrihesrhgvughhrghtrdgtohhm
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/20 2:33 AM, Qian Cai wrote:
> On Fri, 2020-08-07 at 12:18 +0200, Cédric Le Goater wrote:
>> When a passthrough IO adapter is removed from a pseries machine using
>> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
>> guest OS to clear all page table entries related to the adapter. If
>> some are still present, the RTAS call which isolates the PCI slot
>> returns error 9001 "valid outstanding translations" and the removal of
>> the IO adapter fails. This is because when the PHBs are scanned, Linux
>> maps automatically the INTx interrupts in the Linux interrupt number
>> space but these are never removed.
>>
>> To solve this problem, we introduce a PPC platform specific
>> pcibios_remove_bus() routine which clears all interrupt mappings when
>> the bus is removed. This also clears the associated page table entries
>> of the ESB pages when using XIVE.
>>
>> For this purpose, we record the logical interrupt numbers of the
>> mapped interrupt under the PHB structure and let pcibios_remove_bus()
>> do the clean up.
>>
>> Since some PCI adapters, like GPUs, use the "interrupt-map" property
>> to describe interrupt mappings other than the legacy INTx interrupts,
>> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
>> number of interrupt mappings is computed from the "interrupt-map"
>> property and the mapping array is allocated accordingly.
>>
>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Some syscall fuzzing will trigger this on POWER9 NV where the traces pointed to
> this patch.
> 
> .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config

OK. The patch is missing a NULL assignement after kfree() and that
might be the issue. 

I did try PHB removal under PowerNV, so I would like to understand 
how we managed to remove twice the PCI bus and possibly reproduce. 
Any chance we could grab what the syscall fuzzer (syzkaller) did ? 


Thanks,

C. 

> 
> [ 3574.564109][  T965] ata1.00: disabled
> [ 3574.580373][T151472] sd 0:0:0:0: [sdb] Synchronizing SCSI cache
> [ 3574.581180][T151472] sd 0:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=0x04 driverbyte=0x00
> [ 3574.581226][T151472] sd 0:0:0:0: [sdb] Stopping disk
> [ 3574.581289][T151472] sd 0:0:0:0: [sdb] Start/Stop Unit failed: Result: hostbyte=0x04 driverbyte=0x00
> [ 3574.611424][ T3019] Read-error on swap-device (254:1:849792)
> [ 3574.611685][ T3019] Read-error on swap-device (254:1:914944)
> [ 3574.611769][ T3019] Read-error on swap-device (254:1:915072)
> [ 3574.611838][ T3019] Read-error on swap-device (254:1:915200)
> [ 3574.611926][ T3019] Read-error on swap-device (254:1:915328)
> [ 3574.612268][ T3084] Read-error on swap-device (254:1:792576)
> [ 3574.612342][ T3084] Read-error on swap-device (254:1:792704)
> [ 3574.612757][ T2362] Read-error on swap-device (254:1:957440)
> [ 3574.612773][ T2905] Read-error on swap-device (254:1:784128)
> [ 3574.613015][ T2362] Read-error on swap-device (254:1:957568)
> [ 3574.613160][ T2905] Read-error on swap-device (254:1:784256)
> [ 3574.613241][ T2362] Read-error on swap-device (254:1:957696)
> [ 3574.613342][ T2362] Read-error on swap-device (254:1:957824)
> [ 3574.614448][ T3019] Core dump to |/usr/lib/systemd/systemd-coredump pipe failed
> [ 3574.614663][ T3019] Read-error on swap-device (254:1:961536)
> [ 3574.675330][T151844] Read-error on swap-device (254:1:128)
> [ 3574.675515][T151844] Read-error on swap-device (254:1:256)
> [ 3574.675700][T151844] Read-error on swap-device (254:1:384)
> [ 3574.703570][  T971] ata2.00: disabled
> [ 3574.710393][T151472] sd 1:0:0:0: [sda] Synchronizing SCSI cache
> [ 3574.710864][T151472] sd 1:0:0:0: [sda] Synchronize Cache(10) failed: Result: hostbyte=0x04 driverbyte=0x00
> [ 3574.710922][T151472] sd 1:0:0:0: [sda] Stopping disk
> [ 3574.711010][T151472] sd 1:0:0:0: [sda] Start/Stop Unit failed: Result: hostbyte=0x04 driverbyte=0x00
> [ 3574.826569][  T674] dm-0: writeback error on inode 68507862, offset 65536, sector 54281504
> [ 3575.117547][ T3366] dm-0: writeback error on inode 68507851, offset 0, sector 54378880
> [ 3575.140104][T151472] pci 0004:03:00.0: Removing from iommu group 3
> [ 3575.141778][T151472] pci 0004:03     : [PE# fb] Releasing PE
> [ 3575.141965][T151472] pci 0004:03     : [PE# fb] Removing DMA window #0
> [ 3575.142452][T151472] pci 0004:03     : [PE# fb] Disabling 64-bit DMA bypass
> [ 3575.149369][T151472] pci_bus 0004:03: busn_res: [bus 03] is released
> [ 3575.150574][T152037] Read-error on swap-device (254:1:35584)
> [ 3575.150713][T152037] Read-error on swap-device (254:1:35712)
> [ 3575.152632][T152037] Read-error on swap-device (254:1:915584)
> [ 3575.152706][T151472] pci_bus 0004:04: busn_res: [bus 04-08] is released
> [ 3575.152983][T151472] =============================================================================
> [ 3575.153937][T151472] BUG kmalloc-16 (Not tainted): Object already free
> [ 3575.153962][T151472] -----------------------------------------------------------------------------
> [ 3575.153962][T151472] 
> [ 3575.154020][T151472] Disabling lock debugging due to kernel taint
> [ 3575.154047][T151472] INFO: Allocated in pcibios_scan_phb+0x104/0x3e0 age=356904 cpu=4 pid=1
> [ 3575.154084][T151472] 	__slab_alloc+0xa4/0xf0
> [ 3575.154105][T151472] 	__kmalloc+0x294/0x330
> [ 3575.154127][T151472] 	pcibios_scan_phb+0x104/0x3e0
> [ 3575.154165][T151472] 	pcibios_init+0x84/0x124
> [ 3575.154209][T151472] 	do_one_initcall+0xac/0x528
> [ 3575.154241][T151472] 	kernel_init_freeable+0x35c/0x3fc
> [ 3575.154272][T151472] 	kernel_init+0x24/0x148
> [ 3575.154306][T151472] 	ret_from_kernel_thread+0x5c/0x80
> [ 3575.154352][T151472] INFO: Freed in pcibios_remove_bus+0x70/0x90 age=0 cpu=7 pid=151472
> [ 3575.154387][T151472] 	kfree+0x49c/0x510
> [ 3575.154406][T151472] 	pcibios_remove_bus+0x70/0x90
> [ 3575.154443][T151472] 	pci_remove_bus+0xe4/0x110
> [ 3575.154467][T151472] 	pci_remove_bus_device+0x74/0x170
> [ 3575.154503][T151472] 	pci_remove_bus_device+0x4c/0x170
> [ 3575.154524][T151472] 	pci_stop_and_remove_bus_device_locked+0x34/0x50
> [ 3575.154539][T151472] 	remove_store+0xc0/0xe0
> [ 3575.154551][T151472] 	dev_attr_store+0x30/0x50
> [ 3575.154573][T151472] 	sysfs_kf_write+0x68/0xb0
> [ 3575.154595][T151472] 	kernfs_fop_write+0x114/0x260
> [ 3575.154643][T151472] 	vfs_write+0xe4/0x260
> [ 3575.154667][T151472] 	ksys_write+0x74/0x130
> [ 3575.154692][T151472] 	system_call_exception+0xf8/0x1d0
> [ 3575.154728][T151472] 	system_call_common+0xe8/0x218
> [ 3575.154788][T151472] INFO: Slab 0x00000000cafdf25c objects=178 used=174 fp=0x0000000020a64b99 flags=0x7fff8000000201
> [ 3575.154848][T151472] INFO: Object 0x00000000af116201 @offset=5168 fp=0x0000000000000000
> [ 3575.154848][T151472] 
> [ 3575.154901][T151472] Redzone 00000000781d3b96: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
> [ 3575.154968][T151472] Object 00000000af116201: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
> [ 3575.155012][T151472] Redzone 000000007b8ec00f: bb bb bb bb bb bb bb bb                          ........
> [ 3575.155052][T151472] Padding 00000000df7d5e89: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> [ 3575.155107][T151472] CPU: 7 PID: 151472 Comm: trinity-c61 Tainted: G    B             5.9.0-rc6-next-20200922+ #2
> [ 3575.155147][T151472] Call Trace:
> [ 3575.155171][T151472] [c000001fefdef800] [c000000000644278] dump_stack+0xec/0x144 (unreliable)
> [ 3575.155204][T151472] [c000001fefdef840] [c00000000035e9a8] print_trailer+0x278/0x2a0
> [ 3575.155220][T151472] [c000001fefdef8d0] [c000000000355d9c] free_debug_processing+0x57c/0x600
> [ 3575.155236][T151472] [c000001fefdef9b0] [c000000000356234] __slab_free+0x414/0x5b0
> [ 3575.155251][T151472] [c000001fefdefa80] [c00000000035686c] kfree+0x49c/0x510
> [ 3575.155267][T151472] [c000001fefdefb10] [c000000000043260] pcibios_remove_bus+0x70/0x90
> pci_irq_map_dispose at arch/powerpc/kernel/pci-common.c:456
> (inlined by) pcibios_remove_bus at arch/powerpc/kernel/pci-common.c:461
> [ 3575.155282][T151472] [c000001fefdefb40] [c00000000066fee4] pci_remove_bus+0xe4/0x110
> [ 3575.155309][T151472] [c000001fefdefb70] [c000000000670084] pci_remove_bus_device+0x74/0x170
> [ 3575.155348][T151472] [c000001fefdefbb0] [c000000000670070] pci_remove_bus_device+0x60/0x170
> [ 3575.155377][T151472] [c000001fefdefbf0] [c0000000006701f4] pci_stop_and_remove_bus_device_locked+0x34/0x50
> [ 3575.155395][T151472] [c000001fefdefc20] [c00000000067f5e0] remove_store+0xc0/0xe0
> [ 3575.155431][T151472] [c000001fefdefc70] [c0000000006dccd0] dev_attr_store+0x30/0x50
> [ 3575.155457][T151472] [c000001fefdefc90] [c00000000049fae8] sysfs_kf_write+0x68/0xb0
> [ 3575.155507][T151472] [c000001fefdefcd0] [c00000000049ed14] kernfs_fop_write+0x114/0x260
> [ 3575.155553][T151472] [c000001fefdefd20] [c0000000003ab2d4] vfs_write+0xe4/0x260
> [ 3575.155592][T151472] [c000001fefdefd70] [c0000000003ab604] ksys_write+0x74/0x130
> [ 3575.155630][T151472] [c000001fefdefdc0] [c00000000002a458] system_call_exception+0xf8/0x1d0
> [ 3575.155671][T151472] [c000001fefdefe20] [c00000000000d0a8] system_call_common+0xe8/0x218
> [ 3575.155715][T151472] FIX kmalloc-16: Object at 0x00000000af116201 not freed
> [ 3575.156125][T151472] =============================================================================
> [ 3575.156170][T151472] BUG kmalloc-16 (Tainted: G    B            ): Wrong object count. Counter is 174 but counted were 176
> [ 3575.156204][T151472] -----------------------------------------------------------------------------
> [ 3575.156204][T151472] 
> [ 3575.156240][T151472] INFO: Slab 0x00000000cafdf25c objects=178 used=174 fp=0x0000000020a64b99 flags=0x7fff8000000201
> [ 3575.156296][T151472] CPU: 7 PID: 151472 Comm: trinity-c61 Tainted: G    B             5.9.0-rc6-next-20200922+ #2
> [ 3575.156348][T151472] Call Trace:
> [ 3575.156376][T151472] [c000001fefdef6f0] [c000000000644278] dump_stack+0xec/0x144 (unreliable)
> [ 3575.156439][T151472] [c000001fefdef730] [c00000000035e688] slab_err+0x78/0xb0
> [ 3575.156502][T151472] [c000001fefdef810] [c0000000003552a4] on_freelist+0x364/0x390
> [ 3575.156541][T151472] [c000001fefdef8b0] [c000000000355aa8] free_debug_processing+0x288/0x600
> [ 3575.156598][T151472] [c000001fefdef990] [c000000000356234] __slab_free+0x414/0x5b0
> [ 3575.156644][T151472] [c000001fefdefa60] [c00000000035686c] kfree+0x49c/0x510
> [ 3575.156701][T151472] [c000001fefdefaf0] [c0000000002b8a10] kfree_const+0x60/0x80
> [ 3575.156738][T151472] [c000001fefdefb10] [c00000000064d3bc] kobject_release+0x7c/0xd0
> [ 3575.156784][T151472] [c000001fefdefb50] [c0000000006de0c0] put_device+0x20/0x40
> [ 3575.156831][T151472] [c000001fefdefb70] [c00000000067015c] pci_remove_bus_device+0x14c/0x170
> [ 3575.156867][T151472] [c000001fefdefbb0] [c000000000670070] pci_remove_bus_device+0x60/0x170
> [ 3575.156923][T151472] [c000001fefdefbf0] [c0000000006701f4] pci_stop_and_remove_bus_device_locked+0x34/0x50
> [ 3575.156998][T151472] [c000001fefdefc20] [c00000000067f5e0] remove_store+0xc0/0xe0
> [ 3575.157058][T151472] [c000001fefdefc70] [c0000000006dccd0] dev_attr_store+0x30/0x50
> [ 3575.157114][T151472] [c000001fefdefc90] [c00000000049fae8] sysfs_kf_write+0x68/0xb0
> [ 3575.157169][T151472] [c000001fefdefcd0] [c00000000049ed14] kernfs_fop_write+0x114/0x260
> [ 3575.157215][T151472] [c000001fefdefd20] [c0000000003ab2d4] vfs_write+0xe4/0x260
> [ 3575.157256][T151472] [c000001fefdefd70] [c0000000003ab604] ksys_write+0x74/0x130
> [ 3575.157301][T151472] [c000001fefdefdc0] [c00000000002a458] system_call_exception+0xf8/0x1d0
> [ 3575.157352][T151472] [c000001fefdefe20] [c00000000000d0a8] system_call_common+0xe8/0x218
> [ 3575.157396][T151472] FIX kmalloc-16: Object count adjusted.
> [ 3575.157457][T151472] pci_bus 0004:09: busn_res: [bus 09-0d] is released
> 
> 
>> ---
>>
>>  Changes since v2:
>>
>>  - merged 2 patches.
>>  
>>  arch/powerpc/include/asm/pci-bridge.h |   6 ++
>>  arch/powerpc/kernel/pci-common.c      | 114 ++++++++++++++++++++++++++
>>  2 files changed, 120 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/pci-bridge.h
>> b/arch/powerpc/include/asm/pci-bridge.h
>> index b92e81b256e5..ca75cf264ddf 100644
>> --- a/arch/powerpc/include/asm/pci-bridge.h
>> +++ b/arch/powerpc/include/asm/pci-bridge.h
>> @@ -48,6 +48,9 @@ struct pci_controller_ops {
>>  
>>  /*
>>   * Structure of a PCI controller (host bridge)
>> + *
>> + * @irq_count: number of interrupt mappings
>> + * @irq_map: interrupt mappings
>>   */
>>  struct pci_controller {
>>  	struct pci_bus *bus;
>> @@ -127,6 +130,9 @@ struct pci_controller {
>>  
>>  	void *private_data;
>>  	struct npu *npu;
>> +
>> +	unsigned int irq_count;
>> +	unsigned int *irq_map;
>>  };
>>  
>>  /* These are used for config access before all the PCI probing
>> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-
>> common.c
>> index be108616a721..deb831f0ae13 100644
>> --- a/arch/powerpc/kernel/pci-common.c
>> +++ b/arch/powerpc/kernel/pci-common.c
>> @@ -353,6 +353,115 @@ struct pci_controller
>> *pci_find_controller_for_domain(int domain_nr)
>>  	return NULL;
>>  }
>>  
>> +/*
>> + * Assumption is made on the interrupt parent. All interrupt-map
>> + * entries are considered to have the same parent.
>> + */
>> +static int pcibios_irq_map_count(struct pci_controller *phb)
>> +{
>> +	const __be32 *imap;
>> +	int imaplen;
>> +	struct device_node *parent;
>> +	u32 intsize, addrsize, parintsize, paraddrsize;
>> +
>> +	if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
>> +		return 0;
>> +	if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
>> +		return 0;
>> +
>> +	imap = of_get_property(phb->dn, "interrupt-map", &imaplen);
>> +	if (!imap) {
>> +		pr_debug("%pOF : no interrupt-map\n", phb->dn);
>> +		return 0;
>> +	}
>> +	imaplen /= sizeof(u32);
>> +	pr_debug("%pOF : imaplen=%d\n", phb->dn, imaplen);
>> +
>> +	if (imaplen < (addrsize + intsize + 1))
>> +		return 0;
>> +
>> +	imap += intsize + addrsize;
>> +	parent = of_find_node_by_phandle(be32_to_cpup(imap));
>> +	if (!parent) {
>> +		pr_debug("%pOF : no imap parent found !\n", phb->dn);
>> +		return 0;
>> +	}
>> +
>> +	if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
>> +		pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
>> +		return 0;
>> +	}
>> +
>> +	if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
>> +		paraddrsize = 0;
>> +
>> +	return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
>> +}
>> +
>> +static void pcibios_irq_map_init(struct pci_controller *phb)
>> +{
>> +	phb->irq_count = pcibios_irq_map_count(phb);
>> +	if (phb->irq_count < PCI_NUM_INTX)
>> +		phb->irq_count = PCI_NUM_INTX;
>> +
>> +	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
>> +
>> +	phb->irq_map = kcalloc(phb->irq_count, sizeof(unsigned int),
>> +			       GFP_KERNEL);
>> +}
>> +
>> +static void pci_irq_map_register(struct pci_dev *pdev, unsigned int virq)
>> +{
>> +	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
>> +	int i;
>> +
>> +	if (!phb->irq_map)
>> +		return;
>> +
>> +	for (i = 0; i < phb->irq_count; i++) {
>> +		/*
>> +		 * Look for an empty or an equivalent slot, as INTx
>> +		 * interrupts can be shared between adapters.
>> +		 */
>> +		if (phb->irq_map[i] == virq || !phb->irq_map[i]) {
>> +			phb->irq_map[i] = virq;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (i == phb->irq_count)
>> +		pr_err("PCI:%s all platform interrupts mapped\n",
>> +		       pci_name(pdev));
>> +}
>> +
>> +/*
>> + * Clearing the mapped interrupts will also clear the underlying
>> + * mappings of the ESB pages of the interrupts when under XIVE. It is
>> + * a requirement of PowerVM to clear all memory mappings before
>> + * removing a PHB.
>> + */
>> +static void pci_irq_map_dispose(struct pci_bus *bus)
>> +{
>> +	struct pci_controller *phb = pci_bus_to_host(bus);
>> +	int i;
>> +
>> +	if (!phb->irq_map)
>> +		return;
>> +
>> +	pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
>> +		 pci_domain_nr(bus), bus->number);
>> +	for (i = 0; i < phb->irq_count; i++)
>> +		irq_dispose_mapping(phb->irq_map[i]);
>> +
>> +	kfree(phb->irq_map);
>> +}
>> +
>> +void pcibios_remove_bus(struct pci_bus *bus)
>> +{
>> +	pci_irq_map_dispose(bus);
>> +}
>> +EXPORT_SYMBOL_GPL(pcibios_remove_bus);
>> +
>>  /*
>>   * Reads the interrupt pin to determine if interrupt is use by card.
>>   * If the interrupt is used, then gets the interrupt line from the
>> @@ -401,6 +510,8 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>>  
>>  	pci_dev->irq = virq;
>>  
>> +	/* Record all interrut mappings for later removal of a PHB */
>> +	pci_irq_map_register(pci_dev, virq);
>>  	return 0;
>>  }
>>  
>> @@ -1554,6 +1665,9 @@ void pcibios_scan_phb(struct pci_controller *hose)
>>  
>>  	pr_debug("PCI: Scanning PHB %pOF\n", node);
>>  
>> +	/* Allocate interrupt mappings array */
>> +	pcibios_irq_map_init(hose);
>> +
>>  	/* Get some IO space for the new PHB */
>>  	pcibios_setup_phb_io_space(hose);
>>  
> 

