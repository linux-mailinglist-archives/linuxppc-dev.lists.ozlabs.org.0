Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50080240650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 15:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQGPl2pdszDqSq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 23:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.83;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=QdpluJT/; 
 dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQGMD43rWzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 23:01:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597064511;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=yJsfFRYEYncKngPmrRo1yN2ETj+4dm5E3ISQAEvIFJo=;
 b=QdpluJT/bVdeSJ6gxZZkYSNQV+1vne6qPsz4eSffkhOfgZWPEXXj1t/jF2Ao0H71S0
 N+zhLB+GnyrAjggqGxmtVD/jJudCTBHhsrrdqMbh8Tij+CudWQcqb2AGlpRzUfKrbL6r
 XxX6bRzaprcV5W/YV+Tcm+vg4NOWEr9/5o8iPmojOpP79XwhIKIRGM9O2Qednpp5DpXR
 D5g/9/Ke6MePgHqasuaR8hmsxbYRd91X6aRtE58039+QUeckgZJGLjsrapjGQCBdVbrw
 RdndiCk+L08Ci0ePezoxl3D6LwuX473adPQQi/7eMqRLLyrBwO0O41PKLSQ7zG2Wa3VK
 oAXQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCLsrqQWk+qtZcuUigJMcXTkNE2Q=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:a81d:5dee:2e9a:9f90]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew7AD1bVlt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 10 Aug 2020 15:01:37 +0200 (CEST)
Subject: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
Date: Mon, 10 Aug 2020 15:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Just for info. The latest git kernel doesn't work with a virtio_gpu anymore.

QEMU command: qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 
1024 -kernel uImage -drive 
format=raw,file=fienix-soar_3.0-2020608-net.img,index=0,if=virtio -nic 
user,model=e1000 -append "rw root=/dev/vda2" -device virtio-vga -device 
virtio-mouse-pci -device virtio-keyboard-pci -device pci-ohci,id=newusb 
-device usb-audio,bus=newusb.0 -smp 4

Error messages:

virtio_gpu virtio0: swiotlb buffer is full (sz: 4096 bytes), total 0 
(slots), used 0 (slots)
BUG: Kernel NULL pointer dereference on read at 0x00000010
Faulting instruction address: 0xc0000000000c7324
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K PREEMPT SMP NR_CPUS=4 QEMU e500
Modules linked in:
CPU: 2 PID: 1678 Comm: kworker/2:2 Not tainted 
5.9-a3_A-EON_X5000-11735-g06a81c1c7db9-dirty #1
Workqueue: events .virtio_gpu_dequeue_ctrl_func
NIP:  c0000000000c7324 LR: c0000000000c72e4 CTR: c000000000462930
REGS: c00000003dba75e0 TRAP: 0300   Not tainted 
(5.9-a3_A-EON_X5000-11735-g06a81c1c7db9-dirty)
MSR:  0000000090029000 <CE,EE,ME>  CR: 24002288  XER: 00000000
DEAR: 0000000000000010 ESR: 0000000000000000 IRQMASK: 0
GPR00: c0000000000c6188 c00000003dba7870 c0000000017f2300 c00000003d893010
GPR04: 0000000000000000 0000000000000001 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 7f7f7f7f7f7f7f7f
GPR12: 0000000024002284 c00000003fff9200 c00000000008c3a0 c0000000061566c0
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 0000000000000001 0000000000110000 0000000000000000 0000000000000000
GPR28: c00000003d893010 0000000000000000 0000000000000000 c00000003d893010
NIP [c0000000000c7324] .dma_direct_unmap_sg+0x4c/0xd8
LR [c0000000000c72e4] .dma_direct_unmap_sg+0xc/0xd8
Call Trace:
[c00000003dba7870] [c00000003dba7950] 0xc00000003dba7950 (unreliable)
[c00000003dba7920] [c0000000000c6188] .dma_unmap_sg_attrs+0x5c/0x98
[c00000003dba79d0] [c0000000005cd438] .drm_gem_shmem_free_object+0x98/0xcc
[c00000003dba7a50] [c0000000006af5b4] .virtio_gpu_cleanup_object+0xc8/0xd4
[c00000003dba7ad0] [c0000000006ad3bc] .virtio_gpu_cmd_unref_cb+0x1c/0x30
[c00000003dba7b40] [c0000000006adab8] 
.virtio_gpu_dequeue_ctrl_func+0x208/0x28c
[c00000003dba7c10] [c000000000086b70] .process_one_work+0x1a4/0x258
[c00000003dba7cb0] [c0000000000870f4] .worker_thread+0x214/0x284
[c00000003dba7d70] [c00000000008c4f0] .kthread+0x150/0x158
[c00000003dba7e20] [c00000000000082c] .ret_from_kernel_thread+0x58/0x60
Instruction dump:
f821ff51 7cb82b78 7cdb3378 4e000000 7cfa3b78 3bc00000 7f9ec000 41fc0014
382100b0 81810008 7d808120 48bc1ba8 <e93d0010> ebfc0248 833d0018 7fff4850
---[ end trace f28d194d9f0955a8 ]---

virtio_gpu virtio0: swiotlb buffer is full (sz: 4096 bytes), total 0 
(slots), used 0 (slots)
virtio_gpu virtio0: swiotlb buffer is full (sz: 16384 bytes), total 0 
(slots), used 0 (slots)

----

The kernel 5.8 works without any problems in this virtual machine.

Could you please check the latest updates?

Thanks,
Christian
