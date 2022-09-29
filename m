Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC045EECE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 06:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdLkg2zxDz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 14:59:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EHLSug7R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EHLSug7R;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdLk03vNnz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 14:59:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1664427535;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=jopaUjNmA5V4h+NSsWCafbPn045tA8bPu93bBudxtYg=;
    b=EHLSug7RBOws1aUADPR80DKtsP+dcn/yuMUUQ+NLfmzuU7GHJnBxl3PnUPbBzYUqk7
    Dmwhr3qsyjsbOXTi+HS5l55WTZL0CP8wjV5NcENBMDUgRn3hRRCfqMrFMpHHv8u7T28x
    JbEDI9+A6Razmy8vTh/UKmKdFyMWbcyKmMyep0xpmUTYVkvqh+dE137H+PCBAtfwlISM
    yCvtU2nKAvKd6y41q74fKTw4TS0jOL6H8ckW6ujc3sS+wiNx6RZ9nMhX5d5DyRDpd0Zc
    6v/sV+PD2zHH3MHcH+74aN1/uPczAdUhcspg1OGyf9xgZJhVVA23f1a56Zuc+Y/FqYcr
    EeMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2YgjLpixXbAYXiIdaxfw7+h6PZW8FJ/zzHPhet6"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.1.3 AUTH)
    with ESMTPSA id 4958bfy8T4wt1OO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 29 Sep 2022 06:58:55 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Date: Thu, 29 Sep 2022 06:58:54 +0200
Subject: Bug in the VirtIO GPU driver since the RC7 of kernel 6.0
Message-Id: <49394EF1-D13D-444E-99C3-9281C00BE4C4@xenosoft.de>
To: dri-devel@lists.freedesktop.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
X-Mailer: iPhone Mail (19H12)
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I have found the issue. I cross compiled this kernel with GCC 11.2.0 on Ubun=
tu 22.04.1.

I cross compiled the same kernel with GCC 9.4.0 again. This time on Ubuntu 2=
0.04.5.

KVM with the VirtIO GPU works with the GCC 9.4.0 compiled kernel.

=E2=80=94 Christian

I wrote:

Hello,

Xorg doesn't start anymore in a virtual e5500 QEMU KVM HV machine with=20
the VirtIO GPU [1] since the RC7 of kernel 6.0. [2]

Please find attached the kernel config.

Thanks,
Christian

[1] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage-6.0=20
-drive format=3Draw,file=3Dvoid-live-powerpc-20220129.img,index=3D0,if=3Dvir=
tio=20
-netdev user,id=3Dmynet0 -device virtio-net,netdev=3Dmynet0 -append "rw=20
root=3D/dev/vda2" -device virtio-gpu -device virtio-mouse-pci -device=20
virtio-keyboard-pci -device pci-ohci,id=3Dnewusb -audiodev=20
id=3Dsndbe,driver=3Dpa,server=3D/run/user/1000/pulse/native -device=20
usb-audio,bus=3Dnewusb.0 -enable-kvm -smp 4 -fsdev=20
local,security_model=3Dpassthrough,id=3Dfsdev0,path=3D/home/amigaone/Music=20=

-device virtio-9p-pci,id=3Dfs0,fsdev=3Dfsdev0,mount_tag=3Dhostshare

[2] Error messages in a virtual Void PPC machine:
[drm] pci: virtio-gpu-pci detected at 0000:00:02.0
[drm] features: -virgl +edid -resource_blob -host_visible
[drm] features: -context_init
[drm] number of scanouts: 1
[drm] number of cap sets: 0
[drm] Initialized virtio_gpu 0.1.0 0 for virtio1 on minor 0
BUG: Kernel NULL pointer dereference on read at 0x00000000
Faulting instruction address: 0xc0000000000c9934
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=3D4K SMP NR_CPUS=3D4 QEMU e500
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc7_A-EON_X5000 #1
NIP:  c0000000000c9934 LR: c0000000000c9f58 CTR: 0000000000000000
REGS: c00000000208ab20 TRAP: 0300   Not tainted (6.0.0-rc7_A-EON_X5000)
MSR:  0000000090029002 <CE,EE,ME>  CR: 84008242  XER: 00000000
DEAR: 0000000000000000 ESR: 0000000000000000 IRQMASK: 0
GPR00: c0000000006f0060 c00000000208adc0 c000000001ac3500 c0000000025f0010
GPR04: 0000000000000000 0000000000000000 0000000000000000 c0000000019908b0
GPR08: 0000000000000105 0000000000000000 0000000000000000 0000000000000180
GPR12: 0000000024008242 c00000003fff9500 c000000000001384 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 c00000000169021f c00000000208b088
GPR24: 0000000000000000 c000000002336800 0000000000000000 0000000000000000
GPR28: c000000002a48000 c000000002336800 0000000000000000 c0000000025f0010
NIP [c0000000000c9934] .dma_map_direct+0x8/0x10
LR [c0000000000c9f58] .dma_max_mapping_size+0x24/0x78
Call Trace:
[c00000000208adc0] [c00000000208ae80] 0xc00000000208ae80 (unreliable)
[c00000000208ae40] [c0000000006f0060] .drm_prime_pages_to_sg+0xa0/0xb8
[c00000000208aed0] [c00000000070f96c] .drm_gem_shmem_get_sg_table+0x28/0x3c
[c00000000208af40] [c000000000808c8c] .virtio_gpu_object_create+0x134/0x3a8
[c00000000208b010] [c000000000804c34]=20
.virtio_gpu_mode_dumb_create+0xe4/0x15c
[c00000000208b110] [c0000000006ff7f4] .drm_mode_create_dumb+0xcc/0xec
[c00000000208b180] [c000000000707748]=20
.drm_client_framebuffer_create+0x98/0x1f0
[c00000000208b260] [c00000000071fb6c]=20
.drm_fb_helper_generic_probe+0x78/0x1a0
[c00000000208b320] [c00000000071ef08]=20
.__drm_fb_helper_initial_config_and_unlock+0x428/0x54c
[c00000000208b410] [c00000000071f9dc] .drm_fbdev_client_hotplug+0xec/0x128
[c00000000208b4a0] [c00000000071fdec] .drm_fbdev_generic_setup+0x158/0x198
[c00000000208b530] [c000000000803dc4] .virtio_gpu_probe+0x1ac/0x1e0
[c00000000208b5f0] [c00000000069e11c] .virtio_dev_probe+0x2d0/0x3d4
[c00000000208b690] [c000000000815f34] .really_probe+0x1a0/0x344
[c00000000208b720] [c0000000008161c8] .__driver_probe_device+0xf0/0x100
[c00000000208b7b0] [c00000000081620c] .driver_probe_device+0x34/0xac
[c00000000208b840] [c000000000816774] .__driver_attach+0x124/0x134
[c00000000208b8d0] [c000000000813974] .bus_for_each_dev+0x8c/0xd0
[c00000000208b980] [c0000000008154a4] .driver_attach+0x24/0x38
[c00000000208b9f0] [c000000000814dd4] .bus_add_driver+0xd8/0x210
[c00000000208baa0] [c000000000816fd4] .driver_register+0xe0/0x134
[c00000000208bb20] [c00000000069d8a8] .register_virtio_driver+0x40/0x54
hrtimer: interrupt took 4631040 ns
[c00000000208bb90] [c000000001954444] .virtio_gpu_driver_init+0x18/0x2c
[c00000000208bc00] [c000000000001044] .do_one_initcall+0x7c/0x1c0
[c00000000208bce0] [c000000001925710] .kernel_init_freeable+0x23c/0x240
[c00000000208bd90] [c0000000000013ac] .kernel_init+0x28/0x14c
[c00000000208be10] [c0000000000005a0] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
39200001 7c23f840 38210080 7d20485e 792307e0 48d551d8 7c9f2378 4bffffdc
792307e0 4e800020 e92301f8 7c852378 <e8890000> 4bffff7c 7c0802a6 28060003
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
Rebooting in 180 seconds..=

