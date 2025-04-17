Return-Path: <linuxppc-dev+bounces-7748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B590A920EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 17:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdhCv5jJbz3btJ;
	Fri, 18 Apr 2025 01:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744902635;
	cv=none; b=f262sBV3IsKEFk5vHY2EDR91DjZIV8OUIHd5sF15vhaG8aE0UmJOMNiNSelntbwfUvMtxMUji7s7uvzsQv07cbTziGn9zKYjx7GbpWIbMMilOqkmmqKasIKi4RrivMPQevAl3EL8GDzFsPIJem/qCowEYempm78OMz8cWQqGPap9dDacEKMplAWito6DVWb29M835WOnXo/sQLNazP76ncsF+OfuI20faqT20clnPYN5rlEsJY4hXrRoRkQ6JnhoDqb0RjOn4Q3yjLFEq+PCQ0mS6o3V+AfJajyaJRQrSMVwTga0NyjRXZr4KqYLE9vXs9BhimoLm4nkyTF3cwh0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744902635; c=relaxed/relaxed;
	bh=nSeryclcNxc6DvD7a/Ycu5ZJhheOtnPJCKW7nNCnYmw=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=KNJwLA1wu7L14uSbtmK4GmWd2OKvzf95arjoz8SRG3qAR6A37e2DLXHOeOdfu6Ilqc7beOihZT8oneB6RPgm3QkjgGplIbRA+XVjLXCji4GrTUo3141V+6grXTM+PKTcFN2jlsLoeGZp472c7VIx0VsRtI5HiBGTtpgZ/BilMQGd6xItx/PdpgV37RTz2Bvd/roPc19LhaNPSmDOIvgh29FdnovzYUD0sxxx/Kl66M3CJA4CCtlQAnEt6kjmSKiHpEYVOFfEPjMxyyppU0JmQccVAUzJx5JOzzsfRPDK8vzRTilWLBdPOpAgYEGkLAZfX3/VN37Pat+Qc310mopFXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdhCr530hz3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 01:10:31 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 9B5DA6B;
	Thu, 17 Apr 2025 17:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 9B5DA6B
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 62C5A15E001;
	Thu, 17 Apr 2025 17:10:26 +0200 (CEST)
Date: Thu, 17 Apr 2025 17:10:26 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: linuxppc-dev@lists.ozlabs.org, linux-nvme@lists.infradead.org, Hannes
 Reinecke <hare@kernel.org>
Subject: frozen PHB on IBM Power9 system in 6.15-rc2 (bisected)
Message-Id: <20250417171026.b4474b4e2d0b528411c0e508@danny.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I am seeing "frozen PHB" on Power9 bare-metal (PowerNV ppc64le) system
leading to non-accessible nvme drives (they are behind a switch) in the
6.15-rc2 kernel (originally with kernel-6.15.0-0.rc2.22.fc43). I was
able to bisect the issue to commit
62baf70c327444338c34703c71aa8cc8e4189bd6 [1].

Please see [2] for full console log and other details. Please ignore
the "soft-lockup" messages, they are unrelated and going to be resolved
with [3]. We are building the kernel with CONFIG_NVME_MULTIPATH=y

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62baf70c327444338c34703c71aa8cc8e4189bd6
[2] https://fedora.danny.cz/ppc/rdsosreport.txt
[3] https://lore.kernel.org/all/20250410125110.1232329-1-gshan@redhat.com/

from the console log
...
[  145.996408] talos.danny.cz kernel: Adaptec aacraid driver 1.2.1[50983]-custom
[  145.996732] talos.danny.cz kernel: aacraid 0002:01:00.0: enabling device (0140 -> 0142)
[  146.010113] talos.danny.cz kernel: nvme nvme0: pci function 0030:0d:00.0
[  146.010160] talos.danny.cz kernel: nvme 0030:0d:00.0: enabling device (0140 -> 0142)
[  146.010517] talos.danny.cz kernel: nvme nvme1: pci function 0030:0e:00.0
[  146.010551] talos.danny.cz kernel: nvme 0030:0e:00.0: enabling device (0140 -> 0142)
[  146.017051] talos.danny.cz kernel: nvme nvme0: D3 entry latency set to 8 seconds
[  146.017199] talos.danny.cz kernel: nvme nvme1: D3 entry latency set to 8 seconds
[  146.034341] talos.danny.cz kernel: aacraid: Comm Interface type3 enabled
[  146.041633] talos.danny.cz kernel: usb 1-2.2: New USB device found, idVendor=046d, idProduct=c077, bcdDevice=72.00
[  146.041659] talos.danny.cz kernel: usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  146.041682] talos.danny.cz kernel: usb 1-2.2: Product: USB Optical Mouse
[  146.041693] talos.danny.cz kernel: usb 1-2.2: Manufacturer: Logitech
[  146.046181] talos.danny.cz kernel: nvme nvme1: 32/0/0 default/read/poll queues
[  146.048195] talos.danny.cz kernel: nvme nvme0: 32/0/0 default/read/poll queues
[  146.051730] talos.danny.cz kernel:  nvme1n1: p1
[  146.053390] talos.danny.cz kernel:  nvme0n1: p1
[  146.053905] talos.danny.cz systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[  146.054112] talos.danny.cz kernel: input: Logitech USB Optical Mouse as /devices/pci0003:00/0003:00:00.0/0003:01:00.0/usb1/1-2/1-2.2/1-2.2:1.0/0003:046D:C077.0002/input/input1
[  146.054201] talos.danny.cz kernel: AAC0: kernel 3.2-0[0] Apr 24 2017
[  146.054239] talos.danny.cz kernel: AAC0: monitor 0.0-0[0]
[  146.054261] talos.danny.cz kernel: AAC0: bios 0.13-209[32000]
[  146.054285] talos.danny.cz kernel: AAC0: serial 10F447
[  146.054307] talos.danny.cz kernel: AAC0: Non-DASD support enabled.
[  146.054331] talos.danny.cz kernel: aacraid 0002:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
[  146.054361] talos.danny.cz kernel: AAC0: 64bit support enabled.
[  146.054385] talos.danny.cz kernel: aacraid 0002:01:00.0: 64 Bit DAC enabled
[  146.054587] talos.danny.cz kernel: hid-generic 0003:046D:C077.0002: input,hidraw1: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-0003:01:00.0-2.2/input0
[  146.054701] talos.danny.cz systemd[1]: Finished systemd-udev-trigger.service - Coldplug All udev Devices.
[  146.057858] talos.danny.cz kernel: scsi host8: aacraid
[  146.059886] talos.danny.cz systemd[1]: modprobe@configfs.service: Deactivated successfully.
[  146.060225] talos.danny.cz systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[  146.064530] talos.danny.cz kernel: scsi 8:2:0:0: Direct-Access     ATA      WDC WD5000AAKX-0 1H19 PQ: 0 ANSI: 6
[  146.083800] talos.danny.cz kernel: sd 8:2:0:0: Attached scsi generic sg3 type 0
[  146.084962] talos.danny.cz kernel: sd 8:2:0:0: [sdb] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[  146.086117] talos.danny.cz kernel: scsi 8:2:1:0: Direct-Access     ATA      WDC WD5000AAKS-0 1D05 PQ: 0 ANSI: 6
[  146.086715] talos.danny.cz kernel: sd 8:2:0:0: [sdb] Write Protect is off
[  146.086735] talos.danny.cz kernel: sd 8:2:0:0: [sdb] Mode Sense: 46 00 10 08
[  146.088650] talos.danny.cz kernel: sd 8:2:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
[  146.109852] talos.danny.cz kernel: sd 8:2:1:0: Attached scsi generic sg4 type 0
[  146.110789] talos.danny.cz kernel: scsi 8:3:123:0: Enclosure         ADAPTEC  Smart Adapter    3.02 PQ: 0 ANSI: 5
[  146.111055] talos.danny.cz kernel: sd 8:2:1:0: [sdc] 976773168 512-byte logical blocks: (500 GB/466 GiB)
[  146.111521] talos.danny.cz kernel: scsi 8:3:123:0: Attached scsi generic sg5 type 13
[  146.112133] talos.danny.cz kernel: sd 8:2:1:0: [sdc] Write Protect is off
[  146.112151] talos.danny.cz kernel: sd 8:2:1:0: [sdc] Mode Sense: 46 00 10 08
[  146.114638] talos.danny.cz kernel: sd 8:2:1:0: [sdc] Write cache: enabled, read cache: enabled, supports DPO and FUA
[  146.127940] talos.danny.cz systemd[1]: Mounting sys-kernel-config.mount - Kernel Configuration File System...
[  146.128927] talos.danny.cz systemd[1]: Starting dracut-initqueue.service - dracut initqueue hook...
[  146.129025] talos.danny.cz systemd[1]: systemd-vconsole-setup.service: Deactivated successfully.
[  146.129101] talos.danny.cz systemd[1]: Stopped systemd-vconsole-setup.service - Virtual Console Setup.
[  146.129272] talos.danny.cz systemd[1]: Stopping systemd-vconsole-setup.service - Virtual Console Setup...
[  146.130235] talos.danny.cz systemd[1]: Starting systemd-vconsole-setup.service - Virtual Console Setup...
[  146.132522] talos.danny.cz systemd[1]: Mounted sys-kernel-config.mount - Kernel Configuration File System.
[  146.166186] talos.danny.cz systemd[1]: Reloading requested from client PID 1225 ('systemctl') (unit dracut-initqueue.service)...
[  146.166230] talos.danny.cz systemd[1]: Reloading...
[  146.253661] talos.danny.cz kernel: usb 1-2.1.3: new low-speed USB device number 7 using xhci_hcd
[  146.289125] talos.danny.cz kernel:  sdb: sdb1 sdb2 sdb3 sdb4
[  146.289537] talos.danny.cz kernel: sd 8:2:0:0: [sdb] Attached SCSI disk
[  146.380101] talos.danny.cz systemd[1]: Reloading finished in 213 ms.
[  147.119656] talos.danny.cz kernel: usb 1-2.1.3: New USB device found, idVendor=0463, idProduct=ffff, bcdDevice= 0.01
[  147.119687] talos.danny.cz kernel: usb 1-2.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  147.119718] talos.danny.cz kernel: usb 1-2.1.3: Product: 5S
[  147.119730] talos.danny.cz kernel: usb 1-2.1.3: Manufacturer: EATON
[  147.945736] talos.danny.cz kernel: [drm] amdgpu kernel modesetting enabled.
[  147.945864] talos.danny.cz kernel: amdgpu: DSDT table not found for OEM information
[  147.945892] talos.danny.cz kernel: amdgpu: IO link not available for non x86 platforms
[  147.945906] talos.danny.cz kernel: amdgpu: IO link not available for non x86 platforms
[  147.945932] talos.danny.cz kernel: amdgpu: Virtual CRAT table created for CPU
[  147.945979] talos.danny.cz kernel: amdgpu: Topology: Add CPU node
[  147.946287] talos.danny.cz kernel: amdgpu 0000:01:00.0: enabling device (0540 -> 0542)
[  147.946319] talos.danny.cz kernel: [drm] initializing kernel modesetting (POLARIS11 0x1002:0x67E3 0x1002:0x0B0D 0x00).
[  147.946359] talos.danny.cz kernel: [drm] register mmio base: 0x00000000
[  147.946383] talos.danny.cz kernel: [drm] register mmio size: 262144
[  147.946579] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 0 <vi_common>
[  147.946599] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 1 <gmc_v8_0>
[  147.946618] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 2 <tonga_ih>
[  147.946637] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 3 <gfx_v8_0>
[  147.946676] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 4 <sdma_v3_0>
[  147.946705] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 5 <powerplay>
[  147.946724] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 6 <dm>
[  147.946740] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 7 <uvd_v6_0>
[  147.946759] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: detected ip block number 8 <vce_v3_0>
[  147.966292] talos.danny.cz kernel:  sdc: sdc1 sdc2 sdc3 sdc4
[  147.966699] talos.danny.cz kernel: sd 8:2:1:0: [sdc] Attached SCSI disk
[  148.294421] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ROM BAR
[  148.294444] talos.danny.cz kernel: amdgpu: ATOM BIOS: 113-D0150600-103
[  148.295816] talos.danny.cz kernel: [drm] UVD is enabled in VM mode
[  148.295831] talos.danny.cz kernel: [drm] UVD ENC is enabled in VM mode
[  148.295842] talos.danny.cz kernel: [drm] VCE enabled in VM mode
[  148.295852] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[  148.295878] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
[  148.295893] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: PCI CONFIG reset
[  148.296033] talos.danny.cz kernel: [drm] GPU posting now...
[  148.680650] talos.danny.cz systemd[1]: Finished systemd-vconsole-setup.service - Virtual Console Setup.
[  148.767932] talos.danny.cz kernel: [drm] vm size is 256 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[  148.769652] talos.danny.cz kernel: amdgpu 0000:01:00.0: BAR 2 [mem 0x6000010000000-0x60000101fffff 64bit pref]: releasing
[  148.769677] talos.danny.cz kernel: amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x600000fffffff 64bit pref]: releasing
[  148.769709] talos.danny.cz kernel: pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]: releasing
[  148.769730] talos.danny.cz kernel: pci 0000:00:00.0: bridge window [mem 0x6000000000000-0x600017fffffff 64bit pref]: assigned
[  148.769747] talos.danny.cz kernel: amdgpu 0000:01:00.0: BAR 0 [mem 0x6000000000000-0x60000ffffffff 64bit pref]: assigned
[  148.769779] talos.danny.cz kernel: amdgpu 0000:01:00.0: BAR 2 [mem 0x6000100000000-0x60001001fffff 64bit pref]: assigned
[  148.769802] talos.danny.cz kernel: pci 0000:00:00.0: PCI bridge to [bus 01]
[  148.769815] talos.danny.cz kernel: pci 0000:00:00.0:   bridge window [mem 0x600c000000000-0x600c07fefffff]
[  148.769829] talos.danny.cz kernel: pci 0000:00:00.0:   bridge window [mem 0x6000000000000-0x6003fbff0ffff 64bit pref]
[  148.769849] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[  148.769865] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[  148.769882] talos.danny.cz kernel: [drm] Detected VRAM RAM=4096M, BAR=4096M
[  148.769892] talos.danny.cz kernel: [drm] RAM width 128bits GDDR5
[  148.769901] talos.danny.cz kernel: amdgpu 0000:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
[  148.770903] talos.danny.cz kernel: hid-generic 0003:0463:FFFF.0003: hiddev96,hidraw2: USB HID v1.10 Device [EATON 5S] on usb-0003:01:00.0-2.1.3/input0
[  148.771257] talos.danny.cz kernel: [drm] amdgpu: 4096M of VRAM memory ready
[  148.771279] talos.danny.cz kernel: [drm] amdgpu: 32600M of GTT memory ready.
[  148.771352] talos.danny.cz kernel: [drm] GART: num cpu pages 4096, num gpu pages 65536
[  148.772018] talos.danny.cz kernel: [drm] PCIE GART of 256M enabled (table at 0x000000F4FFF80000).
[  148.774684] talos.danny.cz kernel: [drm] Chained IB support enabled!
[  148.787973] talos.danny.cz kernel: amdgpu: hwmgr_sw_init smu backed is polaris10_smu
[  148.813569] talos.danny.cz kernel: [drm] Found UVD firmware Version: 1.130 Family ID: 16
[  148.826195] talos.danny.cz kernel: [drm] Found VCE firmware Version: 53.26 Binary ID: 3
[  148.842658] talos.danny.cz kernel: [drm] Display Core v3.2.325 initialized on DCE 11.2
[  148.843782] talos.danny.cz systemd[1]: Starting plymouth-start.service - Show Plymouth Boot Screen...
[  148.846228] talos.danny.cz systemd[1]: Received SIGRTMIN+20 from PID 1344 (plymouthd).
[  148.998163] talos.danny.cz kernel: usb 1-2.1.4: new full-speed USB device number 8 using xhci_hcd
[  148.998776] talos.danny.cz kernel: [drm] UVD and UVD ENC initialized successfully.
[  149.099708] talos.danny.cz kernel: [drm] VCE initialized successfully.
[  149.107051] talos.danny.cz kernel: kfd kfd: amdgpu: skipped device 1002:67e3, PCI rejects atomics 730<0
[  149.107085] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 8, active_cu_number 16
[  149.110945] talos.danny.cz kernel: amdgpu 0000:01:00.0: amdgpu: Using BACO for runtime pm
[  149.111687] talos.danny.cz kernel: [drm] Initialized amdgpu 3.63.0 for 0000:01:00.0 on minor 0
[  149.129106] talos.danny.cz systemd[1]: systemd-vconsole-setup.service: Deactivated successfully.
[  149.129315] talos.danny.cz systemd[1]: Stopped systemd-vconsole-setup.service - Virtual Console Setup.
[  149.146843] talos.danny.cz kernel: Console: switching to colour frame buffer device 240x75
[  149.160686] talos.danny.cz kernel: md/raid1:md127: active with 2 out of 2 mirrors
[  149.172981] talos.danny.cz kernel: md127: detected capacity change from 0 to 940836864
[  149.173957] talos.danny.cz kernel: amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[  149.174099] talos.danny.cz systemd[1]: Stopping systemd-vconsole-setup.service - Virtual Console Setup...
[  149.278744] talos.danny.cz kernel: md/raid1:md126: active with 2 out of 2 mirrors
[  149.292981] talos.danny.cz kernel: md126: detected capacity change from 0 to 2095104
[  149.331567] talos.danny.cz kernel: usb 1-2.1.4: New USB device found, idVendor=0403, idProduct=6015, bcdDevice=10.00
[  149.331574] talos.danny.cz kernel: usb 1-2.1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  149.331579] talos.danny.cz kernel: usb 1-2.1.4: Product: FT230X Basic UART
[  149.331582] talos.danny.cz kernel: usb 1-2.1.4: Manufacturer: FTDI
[  149.331584] talos.danny.cz kernel: usb 1-2.1.4: SerialNumber: DM02XLCC
[  149.353523] talos.danny.cz systemd-journald[629]: Journal started
[  149.353582] talos.danny.cz systemd-journald[629]: Runtime Journal (/run/log/journal/d94ac98ea91043d3892dab218d99209d) is 8.0M, max 1.2G, 1.2G free.
[  149.360328] talos.danny.cz systemd-vconsole-setup[632]: /usr/bin/setfont failed with a "system error" (EX_OSERR), ignoring.
[  149.360817] talos.danny.cz systemd-modules-load[631]: Inserted module 'fuse'
[  149.361170] talos.danny.cz systemd-modules-load[631]: Inserted module 'i2c_dev'
[  149.361370] talos.danny.cz systemd-modules-load[631]: Inserted module 'ip_tables'
[  149.361419] talos.danny.cz systemd-vconsole-setup[640]: setfont: ERROR kdfontop.c:183 put_font_kdfontop: Unable to load such font with such kernel version
[  149.361697] talos.danny.cz systemd-modules-load[631]: Inserted module 'ip6_tables'
[  149.361983] talos.danny.cz systemd-modules-load[631]: Failed to find module 'scsi_dh_alua'
[  149.362176] talos.danny.cz systemd-modules-load[631]: Failed to find module 'scsi_dh_emc'
[  149.362453] talos.danny.cz systemd-modules-load[631]: Failed to find module 'scsi_dh_rdac'
[  149.362539] talos.danny.cz dracut-cmdline[659]: dracut-102-2.fc40
[  149.362539] talos.danny.cz dracut-cmdline[659]: Using kernel command line parameters:    root=/dev/mapper/Linux-Root ro rd.lvm.lv=Linux/Root rd.md.uuid=60936c65:08d9f6bc:b191c895:332a4d53 rd.md.uuid=06128381:0df3ab4b:02ebd84d:84921066 rd.md.uuid=3c52d341:6485ed32:9da81f4c:706b231f console=tty1 console=hvc0
[  149.362878] talos.danny.cz systemd-sysusers[650]: Creating group 'nobody' with GID 65534.
[  149.363123] talos.danny.cz systemd-sysusers[650]: Creating group 'users' with GID 100.
[  149.363316] talos.danny.cz systemd-sysusers[650]: Creating group 'systemd-journal' with GID 190.
[  149.363503] talos.danny.cz systemd-vconsole-setup[632]: Setting source virtual console failed, ignoring remaining ones.
[  149.363694] talos.danny.cz systemd-udevd[753]: Using default interface naming scheme 'v255'.
[  149.366236] talos.danny.cz systemd-vconsole-setup[1224]: setfont: ERROR kdfontop.c:183 put_font_kdfontop: Unable to load such font with such kernel version
[  149.414053] talos.danny.cz systemd[1]: Starting systemd-vconsole-setup.service - Virtual Console Setup...
[  149.415317] talos.danny.cz systemd[1]: Started systemd-journald.service - Journal Service.
[  149.384617] talos.danny.cz systemd-vconsole-setup[1199]: /usr/bin/setfont failed with a "system error" (EX_OSERR), ignoring.
[  149.384730] talos.danny.cz systemd-vconsole-setup[1199]: Setting source virtual console failed, ignoring remaining ones.
[  149.419101] talos.danny.cz systemd[1]: Starting systemd-tmpfiles-setup.service - Create System Files and Directories...
[  149.449593] talos.danny.cz systemd-tmpfiles[1510]: /usr/lib/tmpfiles.d/var.conf:14: Duplicate line for path "/var/log", ignoring.
[  149.464643] talos.danny.cz systemd[1]: Finished systemd-tmpfiles-setup.service - Create System Files and Directories.
[  149.774957] talos.danny.cz systemd[1]: Started plymouth-start.service - Show Plymouth Boot Screen.
[  149.775823] talos.danny.cz systemd[1]: systemd-ask-password-console.path - Dispatch Password Requests to Console Directory Watch was skipped because of an unmet condition check (ConditionPathExists=!/run/plymouth/pid).
[  149.776071] talos.danny.cz systemd[1]: Started systemd-ask-password-plymouth.path - Forward Password Requests to Plymouth Directory Watch.
[  149.776506] talos.danny.cz systemd[1]: Reached target paths.target - Path Units.
[  149.860914] talos.danny.cz systemd[1]: Finished systemd-vconsole-setup.service - Virtual Console Setup.
[  149.861277] talos.danny.cz systemd[1]: Reached target sysinit.target - System Initialization.
[  149.862051] talos.danny.cz systemd[1]: Reached target basic.target - Basic System.
[  149.950478] talos.danny.cz systemd[1]: Started rngd.service - Hardware RNG Entropy Gatherer Daemon.
[  149.957295] talos.danny.cz rngd[1525]: Disabling 7: PKCS11 Entropy generator (pkcs11)
[  149.957295] talos.danny.cz rngd[1525]: Disabling 5: NIST Network Entropy Beacon (nist)
[  149.957295] talos.danny.cz rngd[1525]: Initializing available sources
[  149.957880] talos.danny.cz rngd[1525]: [hwrng ]: Initialization Failed
[  149.960647] talos.danny.cz rngd[1525]: [darn  ]: Enabling power DARN rng support
[  149.960647] talos.danny.cz rngd[1525]: [darn  ]: Initialized
[  149.960647] talos.danny.cz rngd[1525]: [jitter]: JITTER timeout set to 5 sec
[  150.069593] talos.danny.cz rngd[1525]: [jitter]: Initializing AES buffer
[  155.000031] talos.danny.cz rngd[1525]: [jitter]: Unable to obtain AES key, disabling JITTER source
[  155.000886] talos.danny.cz rngd[1525]: [jitter]: Initialization Failed
[  155.008927] talos.danny.cz rngd[1525]: [rtlsdr]: Initialization Failed
[  155.008927] talos.danny.cz rngd[1525]: [namedpipe]: Initialization Failed
[  159.883963] talos.danny.cz kernel: pci 0032:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.884630] talos.danny.cz kernel: pci 0033:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.885271] talos.danny.cz kernel: pci 0000:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.885892] talos.danny.cz kernel: pci 0001:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.886511] talos.danny.cz kernel: pci 0002:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.887129] talos.danny.cz kernel: pci 0003:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.887742] talos.danny.cz kernel: pci 0004:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.888355] talos.danny.cz kernel: pci 0005:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.888958] talos.danny.cz kernel: pci 0005:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.889557] talos.danny.cz kernel: pci 0030:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.890176] talos.danny.cz kernel: pci 0030:01:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.890762] talos.danny.cz kernel: pci 0030:02:04.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.891344] talos.danny.cz kernel: pci 0030:02:05.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.891946] talos.danny.cz kernel: pci 0030:02:06.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.892538] talos.danny.cz kernel: pci 0030:02:07.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  159.893121] talos.danny.cz kernel: pci 0031:00:00.0: deferred probe pending: pci: wait for supplier /interrupt-controller@0
[  176.682101] talos.danny.cz kernel: EEH: Recovering PHB#30-PE#1fb
[  176.682114] talos.danny.cz kernel: EEH: PE location: N/A, PHB location: N/A
[  176.682116] talos.danny.cz kernel: EEH: Frozen PHB#30-PE#1fb detected
[  176.682118] talos.danny.cz kernel: EEH: Call Trace:
[  176.682119] talos.danny.cz kernel: EEH: [0000000043837525] __eeh_send_failure_event+0x78/0x150
[  176.682129] talos.danny.cz kernel: EEH: [00000000ca9d8fff] eeh_dev_check_failure+0x2e0/0x6d0
[  176.682136] talos.danny.cz kernel: EEH: [000000000896f909] nvme_timeout+0x264/0x670 [nvme]
[  176.682145] talos.danny.cz kernel: EEH: [000000002faff0a8] blk_mq_handle_expired+0xb0/0x130
[  176.682151] talos.danny.cz kernel: EEH: [00000000014f13c7] bt_iter+0xf8/0x140
[  176.682156] talos.danny.cz kernel: EEH: [0000000072f9f2ba] blk_mq_queue_tag_busy_iter+0x384/0x680
[  176.682160] talos.danny.cz kernel: EEH: [00000000449486be] blk_mq_timeout_work+0x198/0x1f0
[  176.682164] talos.danny.cz kernel: EEH: [00000000a8845314] process_one_work+0x1f8/0x510
[  176.682170] talos.danny.cz kernel: EEH: [00000000a19f763f] worker_thread+0x33c/0x510
[  176.682173] talos.danny.cz kernel: EEH: [00000000786c4402] kthread+0x150/0x160
[  176.682178] talos.danny.cz kernel: EEH: [00000000393b9885] start_kernel_thread+0x14/0x18
[  176.682182] talos.danny.cz kernel: EEH: This PCI device has failed 1 times in the last hour and will be permanently disabled after 5 failures.
[  176.682185] talos.danny.cz kernel: EEH: Notify device drivers to shutdown
[  176.682187] talos.danny.cz kernel: EEH: Beginning: 'error_detected(IO frozen)'
[  176.682191] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: Invoking nvme->error_detected(IO frozen)
[  176.682198] talos.danny.cz kernel: nvme nvme0: frozen state error detected, reset controller
[  176.934877] talos.danny.cz kernel: nvme0n1: I/O Cmd(0x2) @ LBA 1875384832, 128 blocks, I/O Error (sct 0x3 / sc 0x71) 
[  176.934893] talos.danny.cz kernel: I/O error, dev nvme0n1, sector 1875384832 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[  176.954198] talos.danny.cz kernel: nvme nvme0: Failed to get ANA log: -4
[  176.973671] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: nvme driver reports: 'need reset'
[  176.973677] talos.danny.cz kernel: EEH: Finished:'error_detected(IO frozen)' with aggregate recovery state:'need reset'
[  176.973683] talos.danny.cz kernel: EEH: Collect temporary log
[  176.973712] talos.danny.cz kernel: EEH: of node=0030:0d:00.0
[  176.973716] talos.danny.cz kernel: EEH: PCI device/vendor: a808144d
[  176.973719] talos.danny.cz kernel: EEH: PCI cmd/status register: 00100142
[  176.973721] talos.danny.cz kernel: EEH: PCI-E capabilities and status follow:
[  176.973732] talos.danny.cz kernel: EEH: PCI-E 00: 0002b010 10648fc1 00002830 00437043 
[  176.973742] talos.danny.cz kernel: EEH: PCI-E 10: 10430000 00000000 00000000 00000000 
[  176.977408] talos.danny.cz kernel: EEH: PCI-E 20: 00000000 
[  176.977409] talos.danny.cz kernel: EEH: PCI-E AER capability register set follows:
[  176.977421] talos.danny.cz kernel: EEH: PCI-E AER 00: 14820001 00000000 00400000 00462030 
[  176.978606] talos.danny.cz kernel: EEH: PCI-E AER 10: 00000000 0000e000 000003e0 00000000 
[  176.978615] talos.danny.cz kernel: EEH: PCI-E AER 20: 00000000 00000000 00000000 00000000 
[  176.978618] talos.danny.cz kernel: EEH: PCI-E AER 30: 00000000 00000000 
[  176.979843] talos.danny.cz kernel: PHB4 PHB#48 Diag-data (Version: 1)
[  176.979845] talos.danny.cz kernel: brdgCtl:    00000002
[  176.979847] talos.danny.cz kernel: RootSts:    00060020 00402000 a0830008 00100107 00000800
[  176.979849] talos.danny.cz kernel: PhbSts:     0000001c00000000 0000001c00000000
[  176.981515] talos.danny.cz kernel: Lem:        0000000100000080 0000000000000000 0000000000000080
[  176.981517] talos.danny.cz kernel: PhbErr:     0000028000000000 0000020000000000 2148000098000240 a008400000000000
[  176.981520] talos.danny.cz kernel: RxeTceErr:  2000000000000000 2000000000000000 c0000000000001fa 0000000000000000
[  176.981522] talos.danny.cz kernel: PblErr:     0000000000020000 0000000000020000 0000000000000000 0000000000000000
[  176.981524] talos.danny.cz kernel: RegbErr:    0000004000000000 0000004000000000 8800000c00000000 0000000007011000
[  176.981529] talos.danny.cz kernel: PE[1fa] A/B: 8300b03800000000 8000000000000000
[  176.981532] talos.danny.cz kernel: PE[..1fb] A/B: as above
[  176.981533] talos.danny.cz kernel: EEH: Reset without hotplug activity
[  180.403658] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 1023ms after bus reset; waiting
[  181.483654] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 2047ms after bus reset; waiting
[  183.563680] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 4095ms after bus reset; waiting
[  187.723654] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 8191ms after bus reset; waiting
[  196.364131] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 16383ms after bus reset; waiting
[  213.004161] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 32767ms after bus reset; waiting
[  246.283652] talos.danny.cz kernel: nvme 0030:0d:00.0: not ready 65535ms after bus reset; giving up
[  246.235672] talos.danny.cz systemd-udevd[753]: nvme0n1: Worker [958] processing SEQNUM=1898 is taking a long time
[  246.236577] talos.danny.cz systemd-udevd[753]: nvme1n1: Worker [921] processing SEQNUM=1893 is taking a long time
[  246.552477] talos.danny.cz kernel: EEH: Beginning: 'slot_reset'
[  246.553820] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: Invoking nvme->slot_reset()
[  246.553838] talos.danny.cz kernel: nvme nvme0: restart after slot reset
[  246.629560] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: nvme driver reports: 'recovered'
[  246.629565] talos.danny.cz kernel: EEH: Finished:'slot_reset' with aggregate recovery state:'recovered'
[  246.630292] talos.danny.cz kernel: EEH: Notify device driver to resume
[  246.630659] talos.danny.cz kernel: EEH: Beginning: 'resume'
[  246.633097] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: Invoking nvme->resume()
[  246.683699] talos.danny.cz kernel: nvme 0030:0d:00.0: Unable to change power state from D3cold to D0, device inaccessible
[  246.684963] talos.danny.cz kernel: nvme nvme0: Disabling device after reset failure: -19
[  246.744271] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211552, async page read
[  246.745010] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384848, nr_sectors = 16 limit=0
[  246.746281] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211553, async page read
[  246.746929] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384864, nr_sectors = 16 limit=0
[  246.748195] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211554, async page read
[  246.748838] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384880, nr_sectors = 16 limit=0
[  246.750125] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211555, async page read
[  246.750778] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384896, nr_sectors = 16 limit=0
[  246.752076] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211556, async page read
[  246.752725] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384912, nr_sectors = 16 limit=0
[  246.754025] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211557, async page read
[  246.754792] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: nvme driver reports: 'none'
[  246.754800] talos.danny.cz kernel: EEH: Finished:'resume'
[  246.754804] talos.danny.cz kernel: EEH: Recovery successful.
[  246.754809] talos.danny.cz kernel: EEH: Recovering PHB#30-PE#1fb
[  246.754820] talos.danny.cz kernel: EEH: PE location: N/A, PHB location: N/A
[  246.754823] talos.danny.cz kernel: EEH: Frozen PHB#30-PE#1fb detected
[  246.754827] talos.danny.cz kernel: EEH: Call Trace:
[  246.754829] talos.danny.cz kernel: EEH: [0000000043837525] __eeh_send_failure_event+0x78/0x150
[  246.754842] talos.danny.cz kernel: EEH: [00000000ca9d8fff] eeh_dev_check_failure+0x2e0/0x6d0
[  246.754853] talos.danny.cz kernel: EEH: [000000007534829c] pnv_pci_read_config+0x148/0x180
[  246.754859] talos.danny.cz kernel: EEH: [000000006db2aa5c] pci_bus_read_config_dword+0x90/0xf0
[  246.754866] talos.danny.cz kernel: EEH: [00000000ed12774a] pci_find_next_ext_capability+0x5c/0x150
[  246.754874] talos.danny.cz kernel: EEH: [000000003a1ec347] pci_restore_ltr_state+0x40/0xa0
[  246.754882] talos.danny.cz kernel: EEH: [000000000c3c04be] pci_restore_state.part.0+0x2c/0x3b0
[  246.754888] talos.danny.cz kernel: EEH: [000000005a69e2f4] nvme_slot_reset+0x48/0x90 [nvme]
[  246.754899] talos.danny.cz kernel: EEH: [00000000efdedb77] eeh_report_reset+0xd0/0x100
[  246.754905] talos.danny.cz kernel: EEH: [00000000bdb52d8d] eeh_pe_report+0x2bc/0x548
[  246.754911] talos.danny.cz kernel: EEH: [0000000039694420] eeh_handle_normal_event+0x89c/0x9c0
[  246.754918] talos.danny.cz kernel: EEH: [00000000bbf75c7c] eeh_event_handler+0xfc/0x170
[  246.754924] talos.danny.cz kernel: EEH: [00000000786c4402] kthread+0x150/0x160
[  246.754932] talos.danny.cz kernel: EEH: [00000000393b9885] start_kernel_thread+0x14/0x18
[  246.754939] talos.danny.cz kernel: EEH: This PCI device has failed 2 times in the last hour and will be permanently disabled after 5 failures.
[  246.754942] talos.danny.cz kernel: EEH: Notify device drivers to shutdown
[  246.754945] talos.danny.cz kernel: EEH: Beginning: 'error_detected(IO frozen)'
[  246.754949] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: Invoking nvme->error_detected(IO frozen)
[  246.754956] talos.danny.cz kernel: nvme nvme0: frozen state error detected, reset controller
[  246.756867] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384928, nr_sectors = 16 limit=0
[  246.775171] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211558, async page read
[  246.775177] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme0n1: rw=0, sector=1875384944, nr_sectors = 16 limit=0
[  246.775181] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1, logical block 117211559, async page read
[  246.778998] talos.danny.cz kernel: Buffer I/O error on dev nvme0n1p1, logical block 8191999, async page read
[  246.853703] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: nvme driver reports: 'disconnect'
[  246.853709] talos.danny.cz kernel: EEH: Finished:'error_detected(IO frozen)' with aggregate recovery state:'disconnect'
[  246.855030] talos.danny.cz kernel: EEH: Unable to recover from failure from PHB#30-PE#1fb.
                                      Please try reseating or replacing it
[  246.856319] talos.danny.cz kernel: EEH: of node=0030:0d:00.0
[  246.856938] talos.danny.cz kernel: EEH: PCI device/vendor: ffffffff
[  246.857564] talos.danny.cz kernel: EEH: PCI cmd/status register: ffffffff
[  246.858192] talos.danny.cz kernel: EEH: PCI-E capabilities and status follow:
[  246.858829] talos.danny.cz kernel: EEH: PCI-E 00: ffffffff ffffffff ffffffff ffffffff 
[  246.859465] talos.danny.cz kernel: EEH: PCI-E 10: ffffffff ffffffff ffffffff ffffffff 
[  246.860081] talos.danny.cz kernel: EEH: PCI-E 20: ffffffff 
[  246.860727] talos.danny.cz kernel: EEH: PCI-E AER capability register set follows:
[  246.861354] talos.danny.cz kernel: EEH: PCI-E AER 00: ffffffff ffffffff ffffffff ffffffff 
[  246.862027] talos.danny.cz kernel: EEH: PCI-E AER 10: ffffffff ffffffff ffffffff ffffffff 
[  246.862849] talos.danny.cz kernel: EEH: PCI-E AER 20: ffffffff ffffffff ffffffff ffffffff 
[  246.863450] talos.danny.cz kernel: EEH: PCI-E AER 30: ffffffff ffffffff 
[  246.864068] talos.danny.cz kernel: PHB4 PHB#48 Diag-data (Version: 1)
[  246.864682] talos.danny.cz kernel: brdgCtl:    00000002
[  246.864685] talos.danny.cz kernel: RootSts:    00000020 00402000 a0830008 00100107 00002000
[  246.864689] talos.danny.cz kernel: PhbSts:     0000001c00000000 0000001c00000000
[  246.864692] talos.danny.cz kernel: Lem:        0000000100280000 0000000000000000 0000000100000000
[  246.864696] talos.danny.cz kernel: PhbErr:     0000088000000000 0000008000000000 2148000098000240 a008400000000000
[  246.864700] talos.danny.cz kernel: RxeArbErr:  4000200000000000 0000200000000000 02409fde30000000 0000000000000000
[  246.864703] talos.danny.cz kernel: PblErr:     0000000001000000 0000000001000000 0000000000000000 0000000000000000
[  246.864707] talos.danny.cz kernel: RegbErr:    0000004000000000 0000004000000000 61000c4800000000 0000000000000000
[  246.864714] talos.danny.cz kernel: PE[1fa] A/B: 8300b03800000000 8000000000000000
[  246.870066] talos.danny.cz kernel: PE[1fb] A/B: b740002a02300000 8000000000000000
[  246.870071] talos.danny.cz kernel: EEH: Beginning: 'error_detected(permanent failure)'
[  246.873646] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: Invoking nvme->error_detected(permanent failure)
[  246.873656] talos.danny.cz kernel: nvme nvme0: failure state error detected, request disconnect
[  246.873701] talos.danny.cz kernel: PCI 0030:0d:00.0#01fb: EEH: nvme driver reports: 'disconnect'
[  246.873708] talos.danny.cz kernel: EEH: Finished:'error_detected(permanent failure)'
[  247.204789] talos.danny.cz kernel: pci 0030:0d     : [PE# 1fb] Releasing PE
[  247.205905] talos.danny.cz kernel: pci 0030:0d     : [PE# 1fb] Removing DMA window #0
[  247.206466] talos.danny.cz kernel: pci 0030:0d     : [PE# 1fb] Disabling 64-bit DMA bypass
[  247.211359] talos.danny.cz kernel: EEH: Recovering PHB#30-PE#1fa
[  247.211909] talos.danny.cz kernel: EEH: PE location: N/A, PHB location: N/A
[  247.212456] talos.danny.cz kernel: EEH: Frozen PHB#30-PE#1fa detected
[  247.213000] talos.danny.cz kernel: EEH: Call Trace:
[  247.213792] talos.danny.cz kernel: EEH: [0000000043837525] __eeh_send_failure_event+0x78/0x150
[  247.214363] talos.danny.cz kernel: EEH: [00000000ca9d8fff] eeh_dev_check_failure+0x2e0/0x6d0
[  247.214373] talos.danny.cz kernel: EEH: [000000000896f909] nvme_timeout+0x264/0x670 [nvme]
[  247.214382] talos.danny.cz kernel: EEH: [000000002faff0a8] blk_mq_handle_expired+0xb0/0x130
[  247.214389] talos.danny.cz kernel: EEH: [00000000014f13c7] bt_iter+0xf8/0x140
[  247.216598] talos.danny.cz kernel: EEH: [0000000072f9f2ba] blk_mq_queue_tag_busy_iter+0x384/0x680
[  247.216605] talos.danny.cz kernel: EEH: [00000000449486be] blk_mq_timeout_work+0x198/0x1f0
[  247.216610] talos.danny.cz kernel: EEH: [00000000a8845314] process_one_work+0x1f8/0x510
[  247.218312] talos.danny.cz kernel: EEH: [00000000a19f763f] worker_thread+0x33c/0x510
[  247.218318] talos.danny.cz kernel: EEH: [00000000786c4402] kthread+0x150/0x160
[  247.218325] talos.danny.cz kernel: EEH: [00000000393b9885] start_kernel_thread+0x14/0x18
[  247.219962] talos.danny.cz kernel: EEH: This PCI device has failed 1 times in the last hour and will be permanently disabled after 5 failures.
[  247.219965] talos.danny.cz kernel: EEH: Notify device drivers to shutdown
[  247.219968] talos.danny.cz kernel: EEH: Beginning: 'error_detected(IO frozen)'
[  247.223662] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->error_detected(IO frozen)
[  247.224563] talos.danny.cz kernel: nvme nvme1: frozen state error detected, reset controller
[  247.455003] talos.danny.cz kernel: nvme1n1: I/O Cmd(0x2) @ LBA 1875384832, 128 blocks, I/O Error (sct 0x3 / sc 0x71) 
[  247.455611] talos.danny.cz kernel: I/O error, dev nvme1n1, sector 1875384832 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[  247.484222] talos.danny.cz kernel: nvme nvme1: Failed to get ANA log: -4
[  247.513681] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'need reset'
[  247.513686] talos.danny.cz kernel: EEH: Finished:'error_detected(IO frozen)' with aggregate recovery state:'need reset'
[  247.515019] talos.danny.cz kernel: EEH: Collect temporary log
[  247.515659] talos.danny.cz kernel: EEH: of node=0030:0e:00.0
[  247.516286] talos.danny.cz kernel: EEH: PCI device/vendor: a808144d
[  247.516920] talos.danny.cz kernel: EEH: PCI cmd/status register: 00100142
[  247.517567] talos.danny.cz kernel: EEH: PCI-E capabilities and status follow:
[  247.518224] talos.danny.cz kernel: EEH: PCI-E 00: 0002b010 10648fc1 00002830 00437043 
[  247.518883] talos.danny.cz kernel: EEH: PCI-E 10: 10430000 00000000 00000000 00000000 
[  247.519526] talos.danny.cz kernel: EEH: PCI-E 20: 00000000 
[  247.520166] talos.danny.cz kernel: EEH: PCI-E AER capability register set follows:
[  247.520810] talos.danny.cz kernel: EEH: PCI-E AER 00: 14820001 00000000 00400000 00462030 
[  247.521440] talos.danny.cz kernel: EEH: PCI-E AER 10: 00000000 0000e000 000003e0 00000000 
[  247.522068] talos.danny.cz kernel: EEH: PCI-E AER 20: 00000000 00000000 00000000 00000000 
[  247.522692] talos.danny.cz kernel: EEH: PCI-E AER 30: 00000000 00000000 
[  247.523340] talos.danny.cz kernel: PHB4 PHB#48 Diag-data (Version: 1)
[  247.523977] talos.danny.cz kernel: brdgCtl:    00000002
[  247.524824] talos.danny.cz kernel: RootSts:    00060020 00402000 a0830008 00100107 00000800
[  247.524828] talos.danny.cz kernel: PhbSts:     0000001c00000000 0000001c00000000
[  247.524830] talos.danny.cz kernel: Lem:        0000000100000080 0000000000000000 0000000000000080
[  247.524833] talos.danny.cz kernel: PhbErr:     0000028000000000 0000020000000000 2148000098000240 a008400000000000
[  247.524836] talos.danny.cz kernel: RxeTceErr:  2000000000000000 2000000000000000 c0000000000001fa 0000000000000000
[  247.524838] talos.danny.cz kernel: PblErr:     0000000000020000 0000000000020000 0000000000000000 0000000000000000
[  247.524841] talos.danny.cz kernel: RegbErr:    0000004000000000 0000004000000000 8800000c00000000 0000000007011000
[  247.524846] talos.danny.cz kernel: PE[1fa] A/B: 8300b03800000000 8000000000000000
[  247.524849] talos.danny.cz kernel: PE[..1fb] A/B: as above
[  247.524851] talos.danny.cz kernel: EEH: Reset without hotplug activity
[  250.964186] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 1023ms after bus reset; waiting
[  252.044182] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 2047ms after bus reset; waiting
[  254.124189] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 4095ms after bus reset; waiting
[  258.284197] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 8191ms after bus reset; waiting
[  266.764192] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 16383ms after bus reset; waiting
[  283.404208] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 32767ms after bus reset; waiting
[  316.684204] talos.danny.cz kernel: nvme 0030:0e:00.0: not ready 65535ms after bus reset; giving up
[  316.638265] talos.danny.cz dracut-initqueue[1340]: Timed out for waiting the udev queue being empty.
[  316.952931] talos.danny.cz kernel: EEH: Beginning: 'slot_reset'
[  316.953821] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->slot_reset()
[  316.953841] talos.danny.cz kernel: nvme nvme1: restart after slot reset
[  317.026731] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'recovered'
[  317.026736] talos.danny.cz kernel: EEH: Finished:'slot_reset' with aggregate recovery state:'recovered'
[  317.027508] talos.danny.cz kernel: EEH: Notify device driver to resume
[  317.027891] talos.danny.cz kernel: EEH: Beginning: 'resume'
[  317.030352] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->resume()
[  317.083703] talos.danny.cz kernel: nvme 0030:0e:00.0: Unable to change power state from D3cold to D0, device inaccessible
[  317.085001] talos.danny.cz kernel: nvme nvme1: Disabling device after reset failure: -19
[  317.144264] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211552, async page read
[  317.144465] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'none'
[  317.144957] talos.danny.cz kernel: EEH: Finished:'resume'
[  317.144965] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384848, nr_sectors = 16 limit=0
[  317.144980] talos.danny.cz kernel: EEH: Recovery successful.
[  317.144989] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211553, async page read
[  317.145018] talos.danny.cz kernel: EEH: Recovering PHB#30-PE#1fa
[  317.145025] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384864, nr_sectors = 16 limit=0
[  317.145053] talos.danny.cz kernel: EEH: PE location: N/A, PHB location: N/A
[  317.145056] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211554, async page read
[  317.145102] talos.danny.cz kernel: EEH: Frozen PHB#30-PE#1fa detected
[  317.145131] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384880, nr_sectors = 16 limit=0
[  317.145171] talos.danny.cz kernel: EEH: Call Trace:
[  317.145191] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211555, async page read
[  317.145239] talos.danny.cz kernel: EEH: [0000000043837525] __eeh_send_failure_event+0x78/0x150
[  317.145266] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384896, nr_sectors = 16 limit=0
[  317.145297] talos.danny.cz kernel: EEH: [00000000ca9d8fff] eeh_dev_check_failure+0x2e0/0x6d0
[  317.145318] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211556, async page read
[  317.145322] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384912, nr_sectors = 16 limit=0
[  317.145362] talos.danny.cz kernel: EEH: [000000007534829c] pnv_pci_read_config+0x148/0x180
[  317.145392] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211557, async page read
[  317.145415] talos.danny.cz kernel: EEH: [000000006db2aa5c] pci_bus_read_config_dword+0x90/0xf0
[  317.145463] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384928, nr_sectors = 16 limit=0
[  317.145482] talos.danny.cz kernel: EEH: [00000000ed12774a] pci_find_next_ext_capability+0x5c/0x150
[  317.145514] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211558, async page read
[  317.145544] talos.danny.cz kernel: EEH: [000000003a1ec347] pci_restore_ltr_state+0x40/0xa0
[  317.145591] talos.danny.cz kernel: (udev-worker): attempt to access beyond end of device
                                      nvme1n1: rw=0, sector=1875384944, nr_sectors = 16 limit=0
[  317.145620] talos.danny.cz kernel: EEH: [000000000c3c04be] pci_restore_state.part.0+0x2c/0x3b0
[  317.145652] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1, logical block 117211559, async page read
[  317.145682] talos.danny.cz kernel: EEH: [000000005a69e2f4] nvme_slot_reset+0x48/0x90 [nvme]
[  317.148788] talos.danny.cz kernel: Buffer I/O error on dev nvme1n1p1, logical block 8191999, async page read
[  317.149262] talos.danny.cz kernel: EEH: [00000000efdedb77] eeh_report_reset+0xd0/0x100
[  317.164254] talos.danny.cz kernel: EEH: [00000000bdb52d8d] eeh_pe_report+0x2bc/0x548
[  317.164259] talos.danny.cz kernel: EEH: [0000000039694420] eeh_handle_normal_event+0x89c/0x9c0
[  317.164262] talos.danny.cz kernel: EEH: [00000000bbf75c7c] eeh_event_handler+0xfc/0x170
[  317.164264] talos.danny.cz kernel: EEH: [00000000786c4402] kthread+0x150/0x160
[  317.164269] talos.danny.cz kernel: EEH: [00000000393b9885] start_kernel_thread+0x14/0x18
[  317.164271] talos.danny.cz kernel: EEH: This PCI device has failed 2 times in the last hour and will be permanently disabled after 5 failures.
[  317.164273] talos.danny.cz kernel: EEH: Notify device drivers to shutdown
[  317.164276] talos.danny.cz kernel: EEH: Beginning: 'error_detected(IO frozen)'
[  317.164278] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->error_detected(IO frozen)
[  317.164281] talos.danny.cz kernel: nvme nvme1: frozen state error detected, reset controller
[  317.153365] talos.danny.cz dracut-initqueue[1582]: Scanning devices md127 sda2  for LVM logical volumes Linux/Root
[  317.172717] talos.danny.cz dracut-initqueue[1603]:   WARNING: Couldn't find device with uuid MFWATY-ZceS-Qeub-HcO3-ZAv2-0Q2D-jDpFwj.
[  317.172717] talos.danny.cz dracut-initqueue[1603]:   WARNING: VG Linux is missing PV MFWATY-ZceS-Qeub-HcO3-ZAv2-0Q2D-jDpFwj (last written to /dev/md0).
[  317.283754] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'disconnect'
[  317.283760] talos.danny.cz kernel: EEH: Finished:'error_detected(IO frozen)' with aggregate recovery state:'disconnect'
[  317.285796] talos.danny.cz kernel: EEH: Unable to recover from failure from PHB#30-PE#1fa.
                                      Please try reseating or replacing it
[  317.287465] talos.danny.cz kernel: EEH: of node=0030:0e:00.0
[  317.287983] talos.danny.cz kernel: EEH: PCI device/vendor: ffffffff
[  317.288503] talos.danny.cz kernel: EEH: PCI cmd/status register: ffffffff
[  317.289009] talos.danny.cz kernel: EEH: PCI-E capabilities and status follow:
[  317.289538] talos.danny.cz kernel: EEH: PCI-E 00: ffffffff ffffffff ffffffff ffffffff 
[  317.290053] talos.danny.cz kernel: EEH: PCI-E 10: ffffffff ffffffff ffffffff ffffffff 
[  317.290550] talos.danny.cz kernel: EEH: PCI-E 20: ffffffff 
[  317.291068] talos.danny.cz kernel: EEH: PCI-E AER capability register set follows:
[  317.291574] talos.danny.cz kernel: EEH: PCI-E AER 00: ffffffff ffffffff ffffffff ffffffff 
[  317.292072] talos.danny.cz kernel: EEH: PCI-E AER 10: ffffffff ffffffff ffffffff ffffffff 
[  317.292554] talos.danny.cz kernel: EEH: PCI-E AER 20: ffffffff ffffffff ffffffff ffffffff 
[  317.293038] talos.danny.cz kernel: EEH: PCI-E AER 30: ffffffff ffffffff 
[  317.293501] talos.danny.cz kernel: PHB4 PHB#48 Diag-data (Version: 1)
[  317.293959] talos.danny.cz kernel: brdgCtl:    00000002
[  317.294510] talos.danny.cz kernel: RootSts:    00000020 00402000 a0830008 00100107 00002000
[  317.294512] talos.danny.cz kernel: PhbSts:     0000001c00000000 0000001c00000000
[  317.294514] talos.danny.cz kernel: Lem:        0000000100280000 0000000000000000 0000000100000000
[  317.294516] talos.danny.cz kernel: PhbErr:     0000088000000000 0000008000000000 2148000098000240 a008400000000000
[  317.294518] talos.danny.cz kernel: RxeArbErr:  4000200000000000 0000200000000000 02409fde30000000 0000000000000000
[  317.294519] talos.danny.cz kernel: PblErr:     0000000001000000 0000000001000000 0000000000000000 0000000000000000
[  317.294521] talos.danny.cz kernel: RegbErr:    0000004000000000 0000004000000000 61000c4800000000 0000000000000000
[  317.294525] talos.danny.cz kernel: PE[1fa] A/B: b740002a02380000 8000000000000000
[  317.294526] talos.danny.cz kernel: PE[1fb] A/B: af40000c00000000 800000000e000010
[  317.294529] talos.danny.cz kernel: EEH: Beginning: 'error_detected(permanent failure)'
[  317.297129] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: Invoking nvme->error_detected(permanent failure)
[  317.299703] talos.danny.cz kernel: nvme nvme1: failure state error detected, request disconnect
[  317.302102] talos.danny.cz kernel: PCI 0030:0e:00.0#01fa: EEH: nvme driver reports: 'disconnect'
[  317.340517] talos.danny.cz dracut-initqueue[1582]:   Linux/Root linear
[  317.353416] talos.danny.cz dracut-initqueue[1607]: WARNING: Couldn't find device with uuid MFWATY-ZceS-Qeub-HcO3-ZAv2-0Q2D-jDpFwj.
[  317.353877] talos.danny.cz dracut-initqueue[1607]: WARNING: VG Linux is missing PV MFWATY-ZceS-Qeub-HcO3-ZAv2-0Q2D-jDpFwj (last written to /dev/md0).
[  317.353877] talos.danny.cz dracut-initqueue[1607]: Refusing activation of partial LV Linux/Root.  Use '--activationmode partial' to override.
[  317.302106] talos.danny.cz kernel: EEH: Finished:'error_detected(permanent failure)'
[  317.664194] talos.danny.cz kernel: pci 0030:0e     : [PE# 1fa] Releasing PE
[  317.665913] talos.danny.cz kernel: pci 0030:0e     : [PE# 1fa] Removing DMA window #0
[  317.666648] talos.danny.cz kernel: pci 0030:0e     : [PE# 1fa] Disabling 64-bit DMA bypass


