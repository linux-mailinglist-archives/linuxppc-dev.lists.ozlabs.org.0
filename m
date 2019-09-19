Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C09B880E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 01:29:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZCjh1bsQzF57c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 09:29:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iTuCc0OT"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZCgq6zmqzF56t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:27:51 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id r26so11867077ioh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 16:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2LDWW67l8rsaIp1vkKXtIfJA9WB1xQTna8zvtVp6Pz0=;
 b=iTuCc0OT88qEpt6/r9UFPi3DbCBMu2jCF2qdzbmTvn2yTzMi1ExCIWaUREx4bq7ig0
 Ea6+/vf/jXCea+sIgkGAJ5wYyIdJT9KTIu7DDPRO5Sl8hQ1YqMCpGdu/AH62MMDbYEan
 f4D/U8IvyAds3c7Iaq3ilTsPKA814p6c4AInlZPiUdLHDnGQtAd1R2yczp3NdYKiHWnJ
 k+de+/cWl2JtVu2tdqI+2lEctR3sLZwDwiRhCS+8Gr3hCxMKORRgRsyQ6Lj/pEPQkacI
 rP3dkLQ8Q/BDwBd4A+nlwefo7DDIHG+00+OOxAR4ZzuHbj2OXKrhLMblPUydJoFMQiou
 Qm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2LDWW67l8rsaIp1vkKXtIfJA9WB1xQTna8zvtVp6Pz0=;
 b=n9159w718xHh7T2oKRP26u57qLoGZ+eE/dGI/A0nOAOPxifRr304+hN/pIyRD7APIQ
 8D0rygkIF/1z2gEBqe3j72ocEIywcvJuBqErQFYtMQmGU5/xIxB/gvS6FcNFpeOarCPJ
 j8JATrggLHLznu29eB2bfpKweGSxbZjL2zAZ9P9BYW1fj0MQqIApKufWpBuiuT6Icbbm
 FPUazEeDLdn5BTG6YrOHGkvf35Gi7eSH/QikNkQdWtOqYTzUS/8/HX+vjWuzbBnGezrM
 r5HouXsO9mHidp+CGY708zXJEhwgxHDEBbZwk9nR4cyF0vpqBj/NYuqDVi/TTpF7OAht
 ULKQ==
X-Gm-Message-State: APjAAAUSyv6+P489CViKNKi1+O4jhFr41lXISTkWky1MzNDOOpzcjMMn
 vdQjd9TDnMb9TqHSvkjca8qSfatC7njs1r3BXd0=
X-Google-Smtp-Source: APXvYqxVSVGsoHQsT2lpCnMlJXVKkXKUhPKanIBxkjY32EWvhobWD7MzdT/bcl9Hy29L7IhjyqPznBEP3aZIZo+9hFc=
X-Received: by 2002:a5e:df04:: with SMTP id f4mr2102371ioq.192.1568935667808; 
 Thu, 19 Sep 2019 16:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
 <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
 <871rwcqbd3.fsf@linux.ibm.com>
In-Reply-To: <871rwcqbd3.fsf@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 20 Sep 2019 09:27:36 +1000
Message-ID: <CAOSf1CEjNd3HJ8OGwPn1sBs7NEJme-+oPFu5EAG5NQaHw1ampQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] powerpc/eeh: EEH for pSeries hot plug
To: Nathan Lynch <nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 6:28 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> Hello Sam,
>
> Sam Bobroff <sbobroff@linux.ibm.com> writes:
>
> With this change, I get a crash (use after free by the looks of it) when
> I remove and then add a pci device in qemu:
>
> $ qemu-system-ppc64 -M pseries -append 'debug console=hvc0' \
>   -nographic -vga none -m 1G,slots=32,maxmem=1024G -smp 2 \
>   -kernel vmlinux -initrd ~/b/br/ppc64le-initramfs/images/rootfs.cpio \
>   -nic model=e1000

is there anything special in your kernel config? I tested this with
pseries_le_defconfig and couldn't hit the crash.

>
> ...
>
> # echo 1 > /sys/devices/pci0000:00/0000:00:00.0/remove ; \
>   echo 1 > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
>
> pci 0000:00:00.0: Removing from iommu group 0
> pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
> pci 0000:00:00.0: reg 0x10: [mem 0x200080000000-0x20008001ffff]
> pci 0000:00:00.0: reg 0x14: [io  0x10040-0x1007f]
> pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
> pci 0000:00:00.0: Adding to iommu group 0
> pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
> pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
> e1000 0000:00:00.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> e1000 0000:00:00.0 eth0: Intel(R) PRO/1000 Network Connection
> pci 0000:00:00.0: Removing from iommu group 0
> pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
> pci 0000:00:00.0: reg 0x10: [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: reg 0x14: [io  0x10000-0x1003f]
> pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
> pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
> pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
> BUG: Unable to handle kernel data access at 0x6b6b6b6b6b6b6bfb
> Faulting instruction address: 0xc000000000597270
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 2464 Comm: pci-probe-vs-cp Not tainted 5.3.0-rc2-00092-gf381d5711f09 #76
> NIP:  c000000000597270 LR: c000000000599470 CTR: c0000000002030b0
> REGS: c00000003ee4f650 TRAP: 0380   Not tainted  (5.3.0-rc2-00092-gf381d5711f09)
> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002442  XER: 00000000
> CFAR: c00000000059946c IRQMASK: 0
> GPR00: c000000000599470 c00000003ee4f8e0 c000000003317a00 6b6b6b6b6b6b6b6b
> GPR04: c000000001d0fa38 0000000000000000 0000000000000000 221a64979a66f870
> GPR08: c00000000347b398 0000000000000000 c00000000336e070 ffffffffffffffff
> GPR12: 0000000000002000 c000000004060000 0000000000000000 0000000000000000
> GPR16: 00000000100a78d8 00007fffe9fdff96 00000000100a7898 0000000000000000
> GPR20: 0000000000000000 00000000100e0ff0 0000000000000000 00000000100e0fe8
> GPR24: 0000000000000000 000001002ae50260 c000000001d0fa38 6b6b6b6b6b6b6b6b
> GPR28: fffffffffffffff2 c000000001d0fa38 0000000000000000 c000000003118c18
> NIP [c000000000597270] kernfs_find_ns+0x50/0x3d0
> LR [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
> Call Trace:
> [c00000003ee4f8e0] [c00000000020950c] lockdep_hardirqs_on+0x10c/0x210 (unreliable)
> [c00000003ee4f970] [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
> [c00000003ee4fa00] [c00000000059ca08] sysfs_remove_file_ns+0x28/0x40
> [c00000003ee4fa20] [c000000000cbd70c] device_remove_file+0x2c/0x40
> [c00000003ee4fa40] [c000000000051480] eeh_sysfs_remove_device+0x50/0xf0
> [c00000003ee4fa80] [c00000000004a594] eeh_add_device_late.part.7+0x84/0x220
> [c00000003ee4fb00] [c0000000000e94f0] pseries_pcibios_bus_add_device+0x60/0xb0
> [c00000003ee4fb70] [c00000000006fc40] pcibios_bus_add_device+0x40/0x60
> [c00000003ee4fb90] [c000000000bc5220] pci_bus_add_device+0x30/0x100
> [c00000003ee4fc00] [c000000000bc5344] pci_bus_add_devices+0x54/0xb0
> [c00000003ee4fc40] [c000000000bca058] pci_rescan_bus+0x48/0x70
> [c00000003ee4fc70] [c000000000bd9adc] dev_bus_rescan_store+0xcc/0x100
> [c00000003ee4fcb0] [c000000000cbc9d8] dev_attr_store+0x38/0x60
> [c00000003ee4fcd0] [c00000000059c460] sysfs_kf_write+0x70/0xb0
> [c00000003ee4fd10] [c00000000059aa98] kernfs_fop_write+0xf8/0x280
> [c00000003ee4fd60] [c0000000004b3e5c] __vfs_write+0x3c/0x70
> [c00000003ee4fd80] [c0000000004b81f0] vfs_write+0xd0/0x220
> [c00000003ee4fdd0] [c0000000004b85ac] ksys_write+0x7c/0x140
> [c00000003ee4fe20] [c00000000000bc6c] system_call+0x5c/0x70
>
> FWIW during boot the EEH core reports:
>
>   EEH: No capable adapters found: recovery disabled.
>
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index ca8b0c58a6a7..87edac6f2fd9 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1272,7 +1272,7 @@ void eeh_add_device_late(struct pci_dev *dev)
> >       struct pci_dn *pdn;
> >       struct eeh_dev *edev;
> >
> > -     if (!dev || !eeh_enabled())
> > +     if (!dev)
> >               return;
> >
> >       pr_debug("EEH: Adding device %s\n", pci_name(dev));
>
> Reverting this hunk works around (fixes?) it.
