Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FD6D6553
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 16:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrVWr1rw1z3cjT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 00:29:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
X-Greylist: delayed 2382 seconds by postgrey-1.36 at boromir; Wed, 05 Apr 2023 00:28:59 AEST
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrVWH3FsJz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 00:28:58 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pjh25-0000W9-9N; Tue, 04 Apr 2023 15:49:09 +0200
Message-ID: <906d4d0e-b487-00a5-9399-7d1edc5e20a4@leemhuis.info>
Date: Tue, 4 Apr 2023 15:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Probing nvme disks fails on Upstream kernels on powerpc Maxconfig
Content-Language: en-US, de-DE
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230323095333.GI1005120@linux.vnet.ibm.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230323095333.GI1005120@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680618539;6623636a;
X-HE-SMSGID: 1pjh25-0000W9-9N
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: sachinp@linux.vnet.ibm.com, Linux kernel regressions list <regressions@lists.linux.dev>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 23.03.23 10:53, Srikar Dronamraju wrote:
> 
> I am unable to boot upstream kernels from v5.16 to the latest upstream
> kernel on a maxconfig system. (Machine config details given below)
> 
> At boot, we see a series of messages like the below.
> 
> dracut-initqueue[13917]: Warning: dracut-initqueue: timeout, still waiting for following initqueue hooks:
> dracut-initqueue[13917]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2f93dc0767-18aa-467f-afa7-5b4e9c13108a.sh: "if ! grep -q After=remote-fs-pre.target /run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
> dracut-initqueue[13917]:     [ -e "/dev/disk/by-uuid/93dc0767-18aa-467f-afa7-5b4e9c13108a" ]
> dracut-initqueue[13917]: fi"

Alexey, did you look into this? This is apparently caused by a commit of
yours (see quoted part below) that Michael applied. Looks like it fell
through the cracks from here, but maybe I'm missing something.

Anyway, for the rest of this mail:

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 387273118714
#regzbot title powerps/pseries/dma: Probing nvme disks fails on powerpc
Maxconfig
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

> journalctl shows the below warning.
> 
>  WARNING: CPU: 242 PID: 1219 at /home/srikar/work/linux.git/arch/powerpc/kernel/iommu.c:227 iommu_range_alloc+0x3d4/0x450
>  Modules linked in: lpfc(E+) nvmet_fc(E) nvmet(E) configfs(E) qla2xxx(E+) nvme_fc(E) nvme_fabrics(E) vmx_crypto(E) gf128mul(E) xhci_pci(E) xhci_pci_renesas(E) xhci_hcd(E) ipr(E+) nvme(E) usbcore(E) libata(E) nvme_core(E) t10_pi(E) scsi_transport_fc(E) usb_common(E) btrfs(E) blake2b_generic(E) libcrc32c(E) crc32c_vpmsum(E) xor(E) raid6_pq(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) scsi_common(E)
>  CPU: 242 PID: 1219 Comm: kworker/u3843:0 Tainted: G        W   EL    5.15.0-sp4+ #33 91e1c36ffe385108bbe4a3834506a047dc78552d
>  Workqueue: nvme-reset-wq nvme_reset_work [nvme]
>  NIP:  c00000000005a134 LR: c00000000005a128 CTR: 0000000000000000
>  REGS: c00007fd4c7eb580 TRAP: 0700   Tainted: G        W   EL     (5.15.0-sp4+)
>  MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002424  XER: 00000000
>  CFAR: c00000000020972c IRQMASK: 0
>  GPR00: c00000000005a128 c00007fd4c7eb820 c000000002aa4b00 0000000000000001
>  GPR04: c00000000273d648 0000000000000003 00000bfbcb210000 c000000002d88390
>  GPR08: 0000000000000000 0000000000000000 00000000000000f2 c000000002b05240
>  GPR12: 0000000000002000 c0000bfbdfffcb00 0000000000000000 c00007fd4c9d1c40
>  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>  GPR20: 0000000000000000 0000000000000000 c000000002bab580 0000000000000000
>  GPR24: c0000000073b30c8 0000000000000000 0000000000000000 0000000000000000
>  GPR28: c00007fd71330000 0000000000000000 0000000000000001 0000000000010000
>  NIP [c00000000005a134] iommu_range_alloc+0x3d4/0x450
>  LR [c00000000005a128] iommu_range_alloc+0x3c8/0x450
>  Call Trace:
>  [c00007fd4c7eb820] [c00000000005a128] iommu_range_alloc+0x3c8/0x450 (unreliable)
>  [c00007fd4c7eb8e0] [c00000000005a580] iommu_alloc+0x60/0x170
>  [c00007fd4c7eb930] [c00000000005bd4c] iommu_alloc_coherent+0x11c/0x1d0
>  [c00007fd4c7eb9d0] [c0000000000597e8] dma_iommu_alloc_coherent+0x38/0x50
>  [c00007fd4c7eb9f0] [c000000000249ce8] dma_alloc_attrs+0x128/0x180
>  [c00007fd4c7eba60] [c0080001093210d8] nvme_alloc_queue+0x90/0x2b0 [nvme]
>  [c00007fd4c7ebac0] [c008000109326034] nvme_reset_work+0x44c/0x1870 [nvme]
>  [c00007fd4c7ebc30] [c0000000001870b8] process_one_work+0x388/0x730
>  [c00007fd4c7ebd10] [c0000000001874d8] worker_thread+0x78/0x5b0
>  [c00007fd4c7ebda0] [c0000000001945cc] kthread+0x1bc/0x1d0
>  [c00007fd4c7ebe10] [c00000000000cee4] ret_from_kernel_thread+0x5c/0x64
>  Instruction dump:
>  60000000 7b693e24 7d304a14 e9490100 f9490110 4bfffd44 3c62fe39 3863f0f8
>  481af5d5 60000000 2fa30000 419e0050 <0fe00000> f9c10030 f9e10038 fa010040
>  ---[ end trace 01e0ce48acf1df9b ]---
>  nvme nvme0: Removing after probe failure status: -12
> 
> Please note we are failing to probe nvme disks.
> 
> This corresponds to the below code in iommu_range_alloc() function.
> /* Sanity check */
> if (unlikely(npages == 0)) {
> 	if (printk_ratelimit())
> 		WARN_ON(1);
> 	return DMA_MAPPING_ERROR;
> }
> 
> So we are seeing npages to be 0.
> 
> We see similar messages for all the 4 nvme disks.  Now since the nvme probe
> is failing, the kernel fails to boot as all the root/boot and other
> partitions are carved out of nvme disks.
> 
> Do note, this problem happens only on cold boot or on reboot. There are no
> problems when kernels are kexeced.
> 
> git bisect shows Commit 387273118714 ("powerps/pseries/dma: Add support for
> 2M IOMMU page size") as the cause of the regression.
> 
> git bisect start
> # bad: [df0cc57e057f18e44dac8e6c18aba47ab53202f9] Linux 5.16
> git bisect bad df0cc57e057f18e44dac8e6c18aba47ab53202f9
> # good: [8bb7eca972ad531c9b149c0a51ab43a417385813] Linux 5.15
> git bisect good 8bb7eca972ad531c9b149c0a51ab43a417385813
> # good: [2219b0ceefe835b92a8a74a73fe964aa052742a2] Merge tag 'soc-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good 2219b0ceefe835b92a8a74a73fe964aa052742a2
> # bad: [206825f50f908771934e1fba2bfc2e1f1138b36a] Merge tag 'mtd/for-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> git bisect bad 206825f50f908771934e1fba2bfc2e1f1138b36a
> # good: [5cd4dc44b8a0f656100e3b6916cf73b1623299eb] Merge tag 'staging-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> git bisect good 5cd4dc44b8a0f656100e3b6916cf73b1623299eb
> # bad: [5af06603c4090617be216a9185193a7be3ca60af] Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
> git bisect bad 5af06603c4090617be216a9185193a7be3ca60af
> # good: [5c904c66ed4e86c31ac7c033b64274cebed04e0e] Merge tag 'char-misc-5.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> git bisect good 5c904c66ed4e86c31ac7c033b64274cebed04e0e
> # good: [7e113d01f5f9fe6ad018d8289239d0bbb41311d7] Merge tag 'iommu-updates-v5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
> git bisect good 7e113d01f5f9fe6ad018d8289239d0bbb41311d7
> # bad: [5c0b0c676ac2d84f69568715af91e45b610fe17a] Merge tag 'powerpc-5.16-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> git bisect bad 5c0b0c676ac2d84f69568715af91e45b610fe17a
> # bad: [fef071be57dc43679a32d5b0e6ee176d6f12e9f2] powerpc/dcr: Use cmplwi instead of 3-argument cmpli
> git bisect bad fef071be57dc43679a32d5b0e6ee176d6f12e9f2
> # bad: [a97dd9e2f760c6996a8f1385ddab0bfef325b364] powerpc/fsl_booke: Enable reloading of TLBCAM without switching to AS1
> git bisect bad a97dd9e2f760c6996a8f1385ddab0bfef325b364
> # bad: [983f9101740641434cea4f2e172175ff4b0276ad] powerpc/cpuhp: BUG -> WARN conversion in offline path
> git bisect bad 983f9101740641434cea4f2e172175ff4b0276ad
> # bad: [7eff9bc00ddf1e2281dff575884b7f676c85b006] powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prototype for 'create_section_mapping'
> git bisect bad 7eff9bc00ddf1e2281dff575884b7f676c85b006
> # bad: [494f238a3861863d908af7b98a369f6d8a986c85] powerpc/476: Fix sparse report
> git bisect bad 494f238a3861863d908af7b98a369f6d8a986c85
> # bad: [3c2172c1c47b4079c29f0e6637d764a99355ebcd] powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
> git bisect bad 3c2172c1c47b4079c29f0e6637d764a99355ebcd
> # bad: [3872731187141d5d0a5c4fb30007b8b9ec36a44d] powerps/pseries/dma: Add support for 2M IOMMU page size
> git bisect bad 3872731187141d5d0a5c4fb30007b8b9ec36a44d
> # first bad commit: [3872731187141d5d0a5c4fb30007b8b9ec36a44d] powerps/pseries/dma: Add support for 2M IOMMU page size
> 
> After reverting the commit, I am able to boot into the machine.
> 
> $ lscpu
> Architecture:                    ppc64le
> Byte Order:                      Little Endian
> CPU(s):                          1920
> On-line CPU(s) list:             0-1919
> Model name:                      POWER10 (architected), altivec supported
> Model:                           2.0 (pvr 0080 0200)
> Thread(s) per core:              8
> Core(s) per socket:              15
> Socket(s):                       16
> Hypervisor vendor:               pHyp
> Virtualization type:             para
> L1d cache:                       15 MiB (480 instances)
> L1i cache:                       22.5 MiB (480 instances)
> L2 cache:                        480 MiB (480 instances)
> L3 cache:                        1.9 GiB (480 instances)
> NUMA node(s):                    16
> NUMA node0 CPU(s):               0-119
> NUMA node1 CPU(s):               120-239
> NUMA node2 CPU(s):               240-359
> NUMA node3 CPU(s):               360-479
> NUMA node4 CPU(s):               480-599
> NUMA node5 CPU(s):               600-719
> NUMA node6 CPU(s):               720-839
> NUMA node7 CPU(s):               840-959
> NUMA node8 CPU(s):               960-1079
> NUMA node9 CPU(s):               1080-1199
> NUMA node10 CPU(s):              1200-1319
> NUMA node11 CPU(s):              1320-1439
> NUMA node12 CPU(s):              1440-1559
> NUMA node13 CPU(s):              1560-1679
> NUMA node14 CPU(s):              1680-1799
> NUMA node15 CPU(s):              1800-1919
> 
> $ lspci
> 0010:01:00.0 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
> 0010:01:00.1 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
> 0012:01:00.0 Fibre Channel: Emulex Corporation LPe31000/LPe32000 Series 16Gb/32Gb Fibre Channel Adapter (rev 01)
> 0012:01:00.1 Fibre Channel: Emulex Corporation LPe31000/LPe32000 Series 16Gb/32Gb Fibre Channel Adapter (rev 01)
> 0013:01:00.0 RAID bus controller: IBM PCI-E IPR SAS Adapter (ASIC) (rev 02)
> 0014:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 xHCI Host Controller (rev 02)
> 0016:01:00.0 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
> 0016:01:00.1 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
> 0016:01:00.2 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
> 0016:01:00.3 Fibre Channel: QLogic Corp. ISP2714-based 16/32Gb Fibre Channel to PCIe Adapter (rev 01)
> 0018:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
> 0023:01:00.0 RAID bus controller: IBM PCI-E IPR SAS Adapter (ASIC) (rev 02)
> 0028:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
> 0033:01:00.0 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
> 0033:01:00.1 Ethernet controller: Mellanox Technologies MT27710 Family [ConnectX-4 Lx]
> 0038:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
> 0043:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme II BCM57810 10 Gigabit Ethernet (rev 10)
> 0043:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme II BCM57810 10 Gigabit Ethernet (rev 10)
> 0048:01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO
> 
> $ df
> Filesystem       1K-blocks     Used   Available Use% Mounted on
> devtmpfs              4096        0        4096   0% /dev
> tmpfs          32511249472        0 32511249472   0% /dev/shm
> tmpfs          13004499840    19968 13004479872   1% /run
> tmpfs                 4096        0        4096   0% /sys/fs/cgroup
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /.snapshots
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /var
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /usr/local
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /srv
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /opt
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /root
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /tmp
> /dev/nvme0n1p2    41943040 18486848    23400448  45% /boot/grub2/powerpc-ieee1275
> /dev/nvme0n1p3   739098844 19459884   719638960   3% /home
> tmpfs           6502249856       64  6502249792   1% /run/user/1005
> 
