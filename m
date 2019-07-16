Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B35416AC8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 18:14:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p57t1qfLzDqck
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 02:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernelconcepts.de
 (client-ip=188.40.83.200; helo=mail.kernelconcepts.de;
 envelope-from=maik.nassauer@kernelconcepts.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernelconcepts.de
X-Greylist: delayed 1471 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Jul 2019 02:12:50 AEST
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [188.40.83.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p55t3LLrzDqcK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 02:12:49 +1000 (AEST)
Received: from [217.146.132.69] (helo=dhcp39.kc.loc)
 by mail.kernelconcepts.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <maik.nassauer@kernelconcepts.de>) id 1hnPga-0003mz-J3
 for linuxppc-dev@lists.ozlabs.org; Tue, 16 Jul 2019 17:48:12 +0200
Message-ID: <513a3742d2a3a932b4958dc1b5fd68342aa43e41.camel@kernelconcepts.de>
Subject: Non deterministic kernel crashes after minimal devicetree changes.
From: Maik Nassauer <maik.nassauer@kernelconcepts.de>
To: linuxppc-dev@lists.ozlabs.org
Date: Tue, 16 Jul 2019 17:50:52 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear everyone,

we are currently developing a kernel upgrade for an older hardware. The
system shall be upgraded from kernel 2.6.24 to the current stable
vanilla kernel (4.19).

With our new kernel we are facing strange and non deterministic kernel
crashes which occur more or less randomly when modifying our devicetree
(even small changes may lead to crashes).

The setup:
- CPU Platform: MPC5121 on a custom board, somewhat similar to ADS5121
eval board

- Bootloader: u-boot 1.3.2
    CPU:   MPC5121e rev. 2.0, Core e300c4 at 400 MHz, CSB at 200 MHz
    Board: CCS5121
    DRAM:  256 MB
    FLASH: 32 MB
    In:    serial
    Out:   serial
    Err:   serial
    I2C:   PMC KEY
    ETH:   (eeprom) 00:30:d6:00:00:00
    Net:   FEC ETHERNET

- Vanilla Kernel: 4.19 (based on git commit 84df9525) with custom
modifications, mostly devicetree and some drivers and board setup.

Kernel command line: root=/dev/nfs rw
nfsroot=192.168.2.85:/srv/nfs_rootfs,v3,tcp video=fslfb:800x480-32@68
ip=192.168.2.230:192.168.2.85:192.168.2.254:255.255.255.0:dhcp28.kc.loc
:eth0:off panic=1 console=ttyPSC0,115200 no_console_suspend
video=fslfb:800x480-32@68


We are currently building the kernel and devicetree using a power pc
cross toolchain:

powerpc-linux-gnu-gcc 9.1.0-1
https://aur.archlinux.org/packages/powerpc-linux-gnu-gcc/



In the u-boot code, we changed CFG_BOOTMAPSZ from 8 to 64 MB, because
the 4.19 kernel is way bigger than the old (2.6.x) one that we
previously bootet on our system.

However the CFG_BOOTMAPSZ setting does not seem to have any influence
on the problem itself.

We are also padding the devicetree with --space 131072, so that the
actual size of the (padded) device tree binary may not have any impact
on the kernel crashes.

It looks like these crashes may be caused by alignment error or similar
reasons, because when we e.g. add `a;` to node `usb@4000` it will boot,
but when we add an additional line like `b;` the kernel crashes. Also
it does matter where we put these lines. We can't put these a/b lines
at the top of the device tree, because this will also cause a crash,
even if I just put an `a;` on the top. Also the crashes differ if I add
more lines or may even dissapear.



Here is an example of what we changed:

Original:

/* USB0 using internal UTMI PHY */
usb@4000 {
	dr_mode = "otg";
	fsl,invert-drvvbus;
	fsl,invert-pwr-fault;
	ccs5121-front-and-back-port;
	ccs5121-otg-switch;
};

Modified, crashes:

/* USB0 using internal UTMI PHY */
usb@4000 {
	a;                                // "nonsense nodes" but these
lines cause the crash.
	b; 
	dr_mode = "otg";
	fsl,invert-drvvbus;
	fsl,invert-pwr-fault;
	ccs5121-front-and-back-port;
	ccs5121-otg-switch;
};

The actual node, where we apply these changes does not matter. And also
a and b are just examples. You can add, whatever you want, even "real"
properties may lead to crashes.

Further, it is not sure, that just two lines will cause the crash.
Sometimes, even single lines with longer property names or multiple
added lines may lead to crashes. And also removing nodes or just
properties may also lead to crashes.

In other words: modifying the devicetree in any kind may lead to
crashes.

If we boot multiple times, we may even get different crash reports...

I hope this, in conjunction with the attached logs, is detailed enough
to illustrate the problem. Does anyone of you have any idea what
exactly might cause this or how to debug this further?

A full bootlog of a _working_ boot is attached at the end of this mail.


Thanks and best regards,

Maik Nassauer





Attachments:

Some crashes:
=============


Faulting instruction address: 0x00000000
Oops: Kernel access of bad area, sig: 11 [#1]
BE MPC5121 CCS 0
Modules linked in:
CPU: 0 PID: 7 Comm: ksoftirqd/0 Not tainted 4.19.0-00023-g1077d91e4c12-
dirty #2
NIP:  00000000 LR: 00000000 CTR: c005cf30
REGS: cf837e50 TRAP: 0400   Not tainted  (4.19.0-00023-g1077d91e4c12-
dirty)
MSR:  20009032 <EE,ME,IR,DR,RI>  CR: 22000844  XER: 00000000

GPR00: c00248d8 cf837f00 cf822aa0 c0040430 00000002 00000005 00000000
00000000 
GPR08: c005cf30 00000000 00000000 00001032 42000842 00000000 00000004
00000100 
GPR16: cf836000 c07b55c4 c07b55c0 00000001 00000002 00000004 04208040
00000000 
GPR24: c07a0000 c060e4cc c06b5334 0000000a fffb7619 c076cfa0 c0770d10
c06b4f60 
NIP [00000000]   (null)
LR [00000000]   (null)
Call Trace:
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX 
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX 
---[ end trace 9de0a50b44704278 ]---

Kernel panic - not syncing: Fatal exception in interrupt
Rebooting in 1 seconds..


---------


Unrecoverable FP Unavailable Exception 801 at c005a6e8
Oops: Unrecoverable FP Unavailable Exception, sig: 6 [#1]
BE MPC5121 CCS 0
Modules linked in:
CPU: 0 PID: 430 Comm: kworker/u2:5 Not tainted 4.19.0-00023-
g1077d91e4c12-dirty #2
Workqueue: rpciod rpc_async_schedule
NIP:  c005a6e8 LR: c005e160 CTR: c000a890
REGS: cfa59c30 TRAP: 0801   Not tainted  (4.19.0-00023-g1077d91e4c12-
dirty)
MSR:  00001032 <ME,IR,DR,RI>  CR: 48004804  XER: 00000000

GPR00: c005e158 cfa59ce0 cfa41000 00000000 d47e2adc 00001032 0000000f
fffb7a0d 
GPR08: c0770000 00010000 00000001 805d8298 82004802 
NIP [c005a6e8] rcu_check_callbacks+0x0/0x3c
LR [c005e160] update_process_times+0x34/0x88
Call Trace:
[cfa59ce0] [c005e158] update_process_times+0x2c/0x88 (unreliable)
[cfa59cf0] [c006fc00] tick_nohz_handler+0xb8/0x188
[cfa59d10] [c000aa58] timer_interrupt+0xd8/0x1fc
[cfa59d30] [c0010460] ret_from_except+0x0/0x14
--- interrupt: 901 at nfs3_xdr_dec_read3res+0x50/0x19c
    LR = nfs3_xdr_dec_read3res+0x48/0x19c
[cfa59e10] [c055a0fc] rpcauth_unwrap_resp+0x78/0x94
[cfa59e50] [c054f970] call_decode+0x234/0x414
[cfa59e70] [c0558468] __rpc_execute+0xa0/0x2d8
[cfa59eb0] [c0036d28] process_one_work+0x298/0x3f0
[cfa59ed0] [c0036f10] worker_thread+0x90/0x4f8
[cfa59f10] [c003c8a0] kthread+0x138/0x13c
[cfa59f40] [c00101c4] ret_from_kernel_thread+0x14/0x1c
Instruction dump:
80690000 90a1000c 90810010 90810068 480c5f25 80810068 7c651b78
7fe3fb78 
4bffe911 4bffed65 d8210028 d8410030 <d8610038> d8810040 d8a10048
d8c10050 
---[ end trace 9d8434a1517f4bd5 ]---

Kernel panic - not syncing: Fatal exception in interrupt
Rebooting in 1 seconds..

------


Faulting instruction address: 0xc01239f4
Oops: Kernel access of bad area, sig: 11 [#1]
BE MPC5121 CCS 0
Modules linked in:
CPU: 0 PID: 1227 Comm: kworker/u3:3 Not tainted 4.19.0-00023-
g1077d91e4c12-dirty #2
Workqueue: xprtiod xs_tcp_data_receive_workfn
NIP:  c01239f4 LR: c005ceec CTR: c005cf30
REGS: cf27bb80 TRAP: 0300   Not tainted  (4.19.0-00023-g1077d91e4c12-
dirty)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 42002204  XER: 00000000
DAR: 04208070 DSISR: 20000000 
GPR00: c005cf4c cf27bc30 cf198560 c07b55c4 c076d5e0 80000000 00000000
00000000 
GPR08: c005cf30 00000001 c0770d14 00292090 ffffffff 00000000 00000004
00000100 
GPR16: cf27a000 c07b55c4 c07b55c0 00000001 00000000 00000004 04208060
00000000 
GPR24: c07a0000 c060e4cc c06b5334 0000000a 00000004 c076cfa0 c0770d10
c076d5e0 
NIP [c01239f4] load_elf_binary+0x3e0/0x118c
LR [c005ceec] expire_timers.isra.4+0x7c/0xc0
Call Trace:
[cf27bc30] [cf27bc30] 0xcf27bc30 (unreliable)
[cf27bc40] [c005cf4c] run_timer_softirq+0x1c/0x1a8
[cf27bc90] [c0024a48] irq_exit+0xd0/0x108
[cf27bca0] [c000aa70] timer_interrupt+0xf0/0x1fc
[cf27bcc0] [c0010460] ret_from_except+0x0/0x14
--- interrupt: 901 at memcpy+0x98/0x10c
    LR = skb_copy_bits+0x160/0x2a0
[cf27bd80] [0000008c] 0x8c (unreliable)
[cf27bdb0] [c05536b8] xdr_skb_read_bits+0x40/0x9c
[cf27bdc0] [c0553868] xdr_partial_copy_from_skb+0x154/0x2f8
[cf27bdf0] [c0555bac] xs_tcp_data_recv+0x2c8/0x3f4
[cf27be40] [c04ee48c] tcp_read_sock+0xb4/0x220
[cf27be80] [c0555148] xs_tcp_data_receive_workfn+0x9c/0x15c
[cf27beb0] [c0036d28] process_one_work+0x298/0x3f0
[cf27bed0] [c0036f10] worker_thread+0x90/0x4f8
[cf27bf10] [c003c8a0] kthread+0x138/0x13c
[cf27bf40] [c00101c4] ret_from_kernel_thread+0x14/0x1c
Instruction dump:
409e00f8 7f917040 3cc00010 419d0508 81350018 712a0002 553cf7fe
41820008 
639c0002 71290001 41820008 639c0004 <a1360010> 81950008 2b890002
419e0360 
---[ end trace 21569a5653593ec5 ]---

Kernel panic - not syncing: Fatal exception in interrupt
Rebooting in 1 seconds..

------

Freescale Display Interface Unit (DIU) framebuffer driver
Unable to handle kernel paging request for data at address 0xd080a1e4
Faulting instruction address: 0xc001d4e0
Oops: Kernel access of bad area, sig: 11 [#1]
BE MPC5121 CCS 0
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.19.0-00023-g1077d91e4c12-
dirty #1
NIP:  c001d4e0 LR: c02e6b50 CTR: c001d464
REGS: cf81daf0 TRAP: 0300   Not tainted  (4.19.0-00023-g1077d91e4c12-
dirty)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 24002228  XER: 00000000
DAR: d080a1e4 DSISR: 20000000 
GPR00: c02e6b50 cf81dba0 cf818aa0 fde00004 00000000 0000003e 00000001
00000000 
GPR08: c07b0000 00000001 c07db850 00000004 24000224 00000000 00000000
fde0002c 
GPR16: cfff9106 c0778a14 c0778e3c 00000000 000000c4 c07db2a8 c06dac30
01d00000 
GPR24: c07dbd48 00000001 c07af1e0 c07b2ce0 00a17d80 00000800 00a171e0
d080a1e0 
NIP [c001d4e0] mpc512x_release_bootmem+0x7c/0x118
LR [c02e6b50] fsl_diu_open+0x44/0x108
Call Trace:
[cf81dbd0] [c02e6b50] fsl_diu_open+0x44/0x108
[cf81dbf0] [c02dc378] fbcon_startup+0xb4/0x368
[cf81dc20] [c030fb30] do_take_over_console+0xa0/0x25c
[cf81dc50] [c02dd140] do_fbcon_takeover+0x78/0xfc
[cf81dc60] [c003dc78] notifier_call_chain+0x70/0xd8
[cf81dc80] [c003e5a8] blocking_notifier_call_chain+0x60/0x8c
[cf81dca0] [c02d5764] register_framebuffer+0x234/0x374
[cf81dd10] [c02e6054] fsl_diu_probe+0x390/0x6d0
[cf81dd80] [c032ac20] platform_drv_probe+0x64/0xd0
[cf81dda0] [c0328c3c] really_probe+0x21c/0x32c
[cf81ddd0] [c0328ef4] driver_probe_device+0x68/0x220
[cf81ddf0] [c03291d4] __driver_attach+0x128/0x12c
[cf81de10] [c0326888] bus_for_each_dev+0x80/0xc0
[cf81de40] [c0327f54] bus_add_driver+0x21c/0x250
[cf81de60] [c0329a98] driver_register+0x88/0x15c
[cf81de70] [c074e574] fsl_diu_init+0x1e4/0x22c
[cf81dea0] [c00043b4] do_one_initcall+0x74/0x1d4
[cf81df00] [c073926c] kernel_init_freeable+0x128/0x1e8
[cf81df30] [c00045c4] kernel_init+0x14/0x104
[cf81df40] [c00101c4] ret_from_kernel_thread+0x14/0x1c
Instruction dump:
57de2834 90010034 579c2834 93410018 3f40c07b 93210014 3b5af1e0
3b200001 
93a10024 3ba00800 83fa0000 7ffff214 <813f0004> 552907fe 0f090000
813f001c 
---[ end trace 6ce9d5437017efb6 ]---

    
    

The complete device tree in working state without crashes:
==========================================================

    
    
#include "mpc5121.dtsi"

/ {
	model = "mpc5121ccs";
	compatible = "fsl,mpc5121ccs", "fsl,mpc5121";

	nfc@40000000 { 
		/*
		 * ADS has two Hynix 512MB Nand flash chips in a single
		 * stacked package.
		 */
		chips = <1>;

		rootfs@0 {
			label = "rootfs";
			reg = <0x0 0x04000000>;
			//read-only;
		};
		app@1 {
			label = "app";
			reg = <0x04000000 0x04000000>;
		};
		data@2 {
			label = "data";
			reg = <0x08000000 0x18000000>;
		};
	};

	localbus@80000020 {
		ranges = <0x0 0x0 0xfe000000 0x02000000
			  0x2 0x0 0x82000000 0x00008000>;
		flash@0,0 {
			compatible = "cfi-flash";
			reg = <0x0 0x0 0x2000000>;
			#address-cells = <0x1>;
			#size-cells = <0x1>;
			bank-width = <0x2>;
			device-width = <0x2>;

			kernel@0 {
				label = "kernel";
				reg = <0x0 0x400000>;
				//read-only;
			};

			rescue@400000 {
				label = "rescue";
				reg = <0x400000 0x200000>;
				//read-only;
			};

			rescuefs@600000 {
				label = "rescuefs";
				reg = <0x600000 0x18c0000>;
				//read-only;
			};

			device-tree-kernel@1ec0000 {
				label = "device-tree-kernel";
				reg = <0x1ec0000 0x20000>;
				//read-only;
			};

			device-tree-rescue@1ee0000 {
				label = "device-tree-rescue";
				reg = <0x1ee0000 0x20000>;
				//read-only;
			};

			u-boot@1f00000 {
				label = "u-boot";
				reg = <0x1f00000 0x40000>; // 256kB
UBoot
				//read-only;
			};

			u-boot-env@1f40000 {
				label = "u-boot-env";
				reg = <0x1f40000 0x40000>;
				//read-only;
			};

			boot-logo@1f80000 {
				label = "boot-logo";
				reg = <0x1f80000 0x80000>;
				//read-only;
			};
		};

		board-control@2,0 {
			compatible = "fsl,mpc5121ads-cpld";
			reg = <0x2 0x0 0x8000>;
		};

		cpld_pic: pic@2,a {
			compatible = "fsl,mpc5121ads-cpld-pic";
			interrupt-controller;
			#interrupt-cells = <2>;
			reg = <0x2 0xa 0x5>;
			interrupts = <48 0x8>;
		};
	};

	soc@80000000 {
    
		sdhc@1500 {
			status = "disabled";
		};

		i2c@1700 {
			fsl,preserve-clocking;

			kbd@55 {
				device_type = "kbd";
				compatible = "ccs5121_kbd";
				reg = <0x55>;
			};

			pmc@5d {
				device_type = "pmc";
				compatible = "msc,pcm01";
				reg = <0x5d>;
			};
			rtc@68 {
				//device_type = "rtc";
				//compatible = "dallas,ds1337";
				//reg = <0x68>;
			};
		};
		
		i2c@1740 {
			fsl,preserve-clocking;
			
			at24@50 {
				device_type = "at24";
				compatible = "at24";
				reg = <0x50>;
			};
		};

		can@2300 {
			status = "disabled";
		};

		can@2380 {
			status = "disabled";
		};

		viu@2400 {
			status = "disabled";
		};

		eth0: ethernet@2800 {
			phy-handle = <&phy0>;
		};

		mdio@2800 {
			phy0: ethernet-phy@0 {
				reg = <2>;
			};
		};

		/* mpc5121ads only uses USB0 */
		usb@3000 {
			status = "disabled";
		};

		/* USB0 using internal UTMI PHY */
		usb@4000 {
			dr_mode = "otg";
			fsl,invert-drvvbus;
			fsl,invert-pwr-fault;
			ccs5121-front-and-back-port;
			ccs5121-otg-switch;
		};

		sclpc@10100 {
			status = "disabled";
		};

		psc@11100 {
			status = "disabled";
		};

		psc@11200 {
			status = "disabled";
		};

		/* PSC3 serial port A aka ttyPSC0 */
		psc@11300 {
			compatible = "fsl,mpc5121-psc-uart",
"fsl,mpc5121-psc";
			port-number = <0x0>;
			cell-index = <0x3>;
		};

		/* PSC4 spimode */
		psc@11400 {
			compatible = "fsl,mpc5121-psc-spi",
"fsl,mpc5121-psc";
			// dummy entry for testing spidev user land
spidev api
			
			spidev@0 {
				compatible = "linux,spidev";
				max_speed_hz = <100000>;
				chip_select = <1>;
			};
		};

		/* PSC5 in ac97 mode */
		ac97: psc@11500 {
			compatible = "fsl,mpc5121-psc-ac97",
"fsl,mpc5121-psc";
			fsl,mode = "ac97-slave";
			fsl,rx-fifo-size = <384>;
			fsl,tx-fifo-size = <384>;
		};
		
		psc@11600 {
			status = "disabled";
		};

		psc@11700 {
			status = "disabled";
		};
		
		psc@11800 {
			status = "disabled";
		};
		
		psc@11900 {
			status = "disabled";
		};
		
		psc@11a00 {
			status = "disabled";
		};
		
		psc@11b00 {
			status = "disabled";
		};
	};

	pci: pci@80008500 {
		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
		interrupt-map = <0xa800 0x0 0x0 0x1 0x3 0x0 0x8 
				 0xa800 0x0 0x0 0x2 0x3 0x1 0x8 
				 0xa800 0x0 0x0 0x3 0x3 0x2 0x8 
				 0xa800 0x0 0x0 0x4 0x3 0x3 0x8 

				 0xb000 0x0 0x0 0x1 0x3 0x4 0x8 
				 0xb000 0x0 0x0 0x2 0x3 0x5 0x8 

				 0xb800 0x0 0x0 0x1 0x3 0x6 0x8 
				 0xb800 0x0 0x0 0x2 0x3 0x7 0x8>;

		interrupt-parent = <0x1>;
		interrupts = <0x1 0x8>;
		bus-range = <0x0 0x0>;
		ranges = <0x42000000 0x0 0xa0000000 0xa0000000 0x0
0x10000000 
			  0x20000000 0x0 0xb0000000 0xb0000000 0x0
0x10000000 
			  0x10000000 0x0 0x00000000 0x84000000 0x0
0x10000000>;
		clock-frequency = <0x3f940aa>;
		#interrupt-cells = <0x1>;
		#size-cells = <0x2>;
		#address-cells = <0x3>;
		reg = <0x80008500 0x100>;
		compatible = "fsl,mpc5121-pci";
		device_type = "pci";

	};
};
    

    
    

Full bootlog of a working boot:
===============================
    
## Booting image at 03000000 ...
   Image Name:   Linux-4.19.0-00023-g1077d91e4c12
   Created:      2019-07-15  14:22:34 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    3899044 Bytes =  3.7 MB
   Load Address: 00000000
   Entry Point:  00000000
   Uncompressing Kernel Image ... OK
   Booting using the fdt at 0xc00000
Unable to update property /soc5121@80000000:bus-frequency,
err=FDT_ERR_NOTFOUND
Linux version 4.19.0-00023-g1077d91e4c12-dirty (smeik@smeik) (gcc
version 8.2.0 (GCC)) #1 Mon Jul 15 16:20:01 CEST 2019
Using MPC5121-CCS machine description
-----------------------------------------------------
Hash_size         = 0x0
phys_mem_size     = 0x10000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000010008
  possible        = 0x000000002f7ff049
  always          = 0x0000000000000000
cpu_user_features = 0x8c000000 0x00000000
mmu_features      = 0x00210000
-----------------------------------------------------
CCS5121 board from XXXXXXXXXXX
No pci config register base in dev tree, using default
Found FSL PCI host bridge at 0x0000000080008500. Firmware bus number:
0->0
PCI host bridge /pci@80008500 (primary) ranges:
 MEM 0x00000000a0000000..0x00000000afffffff -> 0x00000000a0000000
Prefetch
> > > > > FPGA init<<<<<<
Zone ranges:
  DMA      [mem 0x0000000000000000-0x000000000fffffff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000000fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
Built 1 zonelists, mobility grouping on.  Total pages: 65024
Kernel command line: root=/dev/nfs rw
nfsroot=192.168.2.85:/srv/nfs_rootfs,v3,tcp video=fslfb:800x480-32@68
ip=192.168.2.230:192.168.2.85:192.168.2.254:255.255.255.0:dhcp28.kc.loc
:eth0:off panic=1 console=ttyPSC0,115200 no_console_suspend
video=fslfb:800x480-32@68
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 251224K/262144K available (6192K kernel code, 284K rwdata,
1184K rodata, 200K init, 213K bss, 10920K reserved, 0K cma-reserved)
Kernel virtual memory layout:
  * 0xfffdf000..0xfffff000  : fixmap
  * 0xfde00000..0xfe000000  : consistent mem
  * 0xfddfb000..0xfde00000  : early ioremap
  * 0xd1000000..0xfddfb000  : vmalloc & ioremap
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
IPIC (128 IRQ sources) at (ptrval)
clocksource: timebase: mask: 0xffffffffffffffff max_cycles:
0xb8812736b, max_idle_ns: 440795202655 ns
clocksource: timebase mult[14000000] shift[24] registered
Console: colour dummy device 80x25
console [ttyPSC0] enabled
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
devtmpfs: initialized
random: get_random_u32 called from bucket_table_alloc.isra.7+0x9c/0x1f8
with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 1911260446275000 ns
futex hash table entries: 256 (order: -1, 3072 bytes)
NET: Registered protocol family 16
calc rate 132000000 != OF spec 100000000
PCI: Probing PCI hardware
PCI host bridge to bus 0100:00
pci_bus 0100:00: root bus resource [mem 0xa0000000-0xafffffff pref]
pci_bus 0100:00: root bus resource [bus 00-ff]
pci 0100:00:00.0: of_irq_parse_pci: failed with rc=-22
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
clocksource: Switched to clocksource timebase
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
TCP established hash table entries: 2048 (order: 1, 8192 bytes)
TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 2048 bind 2048)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=16 bucket_order=0
jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler noop registered
io scheduler deadline registered (default)
io scheduler mq-deadline registered (default)
io scheduler kyber registered
Freescale Display Interface Unit (DIU) framebuffer driver
Console: switching to colour frame buffer device 100x30
graphics fb0: Panel0 registered successfully
graphics fb1: Panel1 AOI0 registered successfully
graphics fb2: Panel1 AOI1 registered successfully
graphics fb3: Panel2 AOI0 registered successfully
graphics fb4: Panel2 AOI1 registered successfully
Serial: MPC52xx PSC UART driver
80011300.psc: ttyPSC0 at MMIO 0x80011300 (irq = 40, base_baud =
6250000) is a MPC5xxx PSC
brd: module loaded
fe000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer
ID 0x0000c2 Chip ID 0x00227e
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.3.
number of CFI chips: 1
8 fixed-partitions partitions found on MTD device fe000000.flash
Creating 8 MTD partitions on "fe000000.flash":
0x000000000000-0x000000400000 : "kernel"
0x000000400000-0x000000600000 : "rescue"
0x000000600000-0x000001ec0000 : "rescuefs"
0x000001ec0000-0x000001ee0000 : "device-tree-kernel"
0x000001ee0000-0x000001f00000 : "device-tree-rescue"
0x000001f00000-0x000001f40000 : "u-boot"
0x000001f40000-0x000001f80000 : "u-boot-env"
0x000001f80000-0x000002000000 : "boot-logo"
mpc5121_nfc 40000000.nfc: Configured for 8-bit NAND, page size 2048
with 64 spare.
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xdc
nand: Samsung NAND 512MiB 3,3V 8-bit
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
Bad block table found at page 261952, version 0x01
__nand_correct_data: uncorrectable ECC error
__nand_correct_data: uncorrectable ECC error
Bad block table found at page 261888, version 0x01
nand_read_bbt: bad block at 0x000004040000
nand_read_bbt: bad block at 0x000008e40000
nand_read_bbt: bad block at 0x00000f900000
nand_read_bbt: bad block at 0x00001c800000
nand_read_bbt: bad block at 0x00001e740000
nand_read_bbt: bad block at 0x00001ffc0000
nand_read_bbt: bad block at 0x00001ffe0000
3 fixed-partitions partitions found on MTD device MPC5121 NAND
Creating 3 MTD partitions on "MPC5121 NAND":
0x000000000000-0x000004000000 : "rootfs"
0x000004000000-0x000008000000 : "app"
0x000008000000-0x000020000000 : "data"
spi_master spi0: /soc@80000000/psc@11400/spidev@0 has no valid 'reg'
property (-22)
spi_master spi0: Failed to create SPI device for /soc@80000000
/psc@11400/spidev@0
libphy: Fixed MDIO Bus: probed
vcan: Virtual CAN interface driver
CAN device driver interface
mpc5xxx_can 80001300.can: MSCAN at 0x(ptrval), irq 17, clock 16000000
Hz
mpc5xxx_can 80001380.can: MSCAN at 0x(ptrval), irq 18, clock 16000000
Hz
eth0: fs_enet: 00:30:d6:00:00:00
libphy: FEC MII Bus: probed
usbcore: registered new interface driver rtl8192cu
usbcore: registered new interface driver rtl8xxxu
usbcore: registered new interface driver rtl8150
usbcore: registered new interface driver r8152
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-pci: EHCI PCI platform driver
ehci-platform: EHCI generic platform driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-pci: OHCI PCI platform driver
ehci-fsl: Freescale EHCI Host controller driver
fsl-ehci fsl-ehci.0: Freescale On-Chip EHCI Host Controller
fsl-ehci fsl-ehci.0: new USB bus registered, assigned bus number 1
fsl-ehci fsl-ehci.0: irq 44, io mem 0x80004000
fsl-ehci fsl-ehci.0: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002,
bcdDevice= 4.19
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: Freescale On-Chip EHCI Host Controller
usb usb1: Manufacturer: Linux 4.19.0-00023-g1077d91e4c12-dirty ehci_hcd
usb usb1: SerialNumber: fsl-ehci.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN
adapters
usbcore: registered new interface driver cdc_wdm
mousedev: PS/2 mouse device common for all mice
ccs5121_keys_probe()
input: ccs5121_keys as /devices/platform/ccs5121_keys/input/input0
ccs5121_keys_init: success
rtc rtc0: invalid alarm value: 1900-1-1 0:0:0
mpc5121-rtc 80000a00.rtc: rtc core: registered mpc5121-rtc as rtc0
i2c /dev entries driver
mpc-i2c 80001700.i2c: timeout 1000000 us
i2c i2c-0: of_i2c: modalias failure on /soc@80000000/i2c@1700/rtc@68
i2c i2c-0: Failed to create I2C device for /soc@80000000/i2c@1700
/rtc@68
mpc-i2c 80001720.i2c: timeout 1000000 us
mpc-i2c 80001740.i2c: timeout 1000000 us
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
NET: Registered protocol family 17
can: controller area network core (rev 20170425 abi 9)
NET: Registered protocol family 29
can: raw protocol (rev 20170425)
can: broadcast manager protocol (rev 20170425 t)
can: netlink gateway (rev 20170425) max_hops=1
drmem: No dynamic reconfiguration memory found
Loading compiled-in X.509 certificates
mpc5121-rtc 80000a00.rtc: setting system clock to 1970-01-01 19:39:41
UTC (70781)
IP-Config: Complete:
     device=eth0, hwaddr=00:30:d6:00:00:00, ipaddr=192.168.2.230,
mask=255.255.255.0, gw=192.168.2.254
     host=dhcp28, domain=, nis-domain=kc.loc
     bootserver=192.168.2.85, rootserver=192.168.2.85, rootpath=
cfg80211: Loading compiled-in X.509 certificates for regulatory
database
cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
cfg80211: failed to load regulatory.db
random: fast init done
VFS: Mounted root (nfs filesystem) on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 200K
This architecture does not have kernel memory protection.




--  
kernel concepts GmbH               Maik Nassauer
Hauptstraße 16                               
maik.nassauer@kernelconcepts.de
D-57074 Siegen                             Tel: +49 271-338857-21
http://www.kernelconcepts.de/      
HR Siegen, HR B 9613
Geschäftsführer: Ole Reinhardt
-- 
--
-- 
kernel concepts GmbH               Maik Nassauer
Hauptstraße 16                               
maik.nassauer@kernelconcepts.de
D-57074 Siegen                             Tel: +49 271-338857-21
http://www.kernelconcepts.de/      
HR Siegen, HR B 9613
Geschäftsführer: Ole Reinhardt

