Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D511713223B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:26:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sRpS2jB8zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 20:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=rong.a.chen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sQPW5mftzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 19:23:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 00:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,405,1571727600"; 
 d="scan'208,217";a="211055728"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by orsmga007.jf.intel.com with ESMTP; 07 Jan 2020 00:23:15 -0800
Subject: Re: [LKP] Re: [mm/debug] 87c4696d57: kernel_BUG_at_include/linux/mm.h
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20191227142255.GD2760@shao2-debian>
 <490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <d001a2dd-5651-9520-7c8e-47bfebc6d0ff@intel.com>
Date: Tue, 7 Jan 2020 16:22:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com>
Content-Type: multipart/alternative;
 boundary="------------F2192ED820780A63D2DD35AC"
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Jan 2020 20:25:05 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, lkp@lists.01.org,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "Dav id S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------F2192ED820780A63D2DD35AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/7/20 2:46 PM, Anshuman Khandual wrote:
> On 12/27/2019 07:52 PM, kernel test robot wrote:
>> [    9.781974] kernel BUG at include/linux/mm.h:592!
>> [    9.782810] invalid opcode: 0000 [#1] PTI
>> [    9.783443] CPU: 0 PID: 1 Comm: swapper Not tainted 5.5.0-rc3-00001-g87c4696d57b5e #1
>> [    9.784528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
>> [    9.785756] EIP: __free_pages+0x14/0x40
>> [    9.786442] Code: 0c 9c 5e fa 89 d8 e8 5b f3 ff ff 56 9d 5b 5e 5d c3 8d 74 26 00 90 8b 48 1c 55 89 e5 85 c9 75 16 ba b4 b6 84 d6 e8 ac 49 fe ff <0f> 0b 8d b4 26 00 00 00 00 8d 76 00 ff 48 1c 75 10 85 d2 75 07 e8
>> [    9.789697] EAX: d68761f7 EBX: ea52f000 ECX: ea4f8520 EDX: d684b6b4
>> [    9.790850] ESI: 00000000 EDI: ef45e000 EBP: ea501f08 ESP: ea501f08
>> [    9.791879] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
>> [    9.792783] CR0: 80050033 CR2: ffffffff CR3: 16d00000 CR4: 000406b0
>> [    9.792783] Call Trace:
>> [    9.792783]  free_pages+0x3c/0x50
>> [    9.792783]  pgd_free+0x5a/0x170
>> [    9.792783]  __mmdrop+0x42/0xe0
>> [    9.792783]  debug_vm_pgtable+0x54f/0x567
>> [    9.792783]  kernel_init_freeable+0x90/0x1e3
>> [    9.792783]  ? rest_init+0xf0/0xf0
>> [    9.792783]  kernel_init+0x8/0xf0
>> [    9.792783]  ret_from_fork+0x19/0x24
>> [    9.792783] Modules linked in:
>> [    9.792803] ---[ end trace 91b7335adcf0b656 ]---
>>
>>
>> To reproduce:
>>
>>          # build kernel
>> 	cd linux
>> 	cp config-5.5.0-rc3-00001-g87c4696d57b5e .config
>> 	make HOSTCC=gcc-7 CC=gcc-7 ARCH=i386 olddefconfig prepare modules_prepare bzImage
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in this email
> Hello,
>
> As the failure might be happening during boot when the test executes,
> do we really need to run these LKP based QEMU environment in order to
> reproduce the problem ? Could not this be recreated on a standalone
> system.
>
> - Anshuman

Hi Anshuman,

Thanks for your advice, we provided another reproduce method which is in 
the end of dmesg.xz file attached in original report:
but the initrd file need to be supplied.

qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-0 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-1 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-2 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-3 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-4 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-5 256G
qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-6 256G

kvm=(
›   qemu-system-x86_64
›   -enable-kvm
›   -cpu SandyBridge
›   -kernel $kernel
›   -initrd initrd-vm-snb-89942dcb126f
›   -m 8192
›   -smp 2
›   -device e1000,netdev=net0
›   -netdev user,id=net0,hostfwd=tcp::32032-:22
›   -boot order=nc
›   -no-reboot
›   -watchdog i6300esb
›   -watchdog-action debug
›   -rtc base=localtime
›   -drive file=disk-vm-snb-89942dcb126f-0,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-1,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-2,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-3,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-4,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-5,media=disk,if=virtio
›   -drive file=disk-vm-snb-89942dcb126f-6,media=disk,if=virtio
›   -serial stdio
›   -display none
›   -monitor null
)

append=(
›   ip=::::vm-snb-89942dcb126f::dhcp
›   root=/dev/ram0
›   user=lkp
›   job=/job-script
› ARCH=i386
›   kconfig=i386-randconfig-h001-20191225
›   branch=linux-devel/devel-hourly-2019122518
›   commit=87c4696d57b5e380bc2720fdff0772b042462b7d
› 
BOOT_IMAGE=/pkg/linux/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e380bc2720fdff0772b042462b7d/vmlinuz-5.5.0-rc3-00001-g87c4696d57b5e
›   max_uptime=1500
› 
RESULT_ROOT=/result/trinity/300s/vm-snb/yocto-minimal-i386-2019-05-20.cgz/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e380bc2720fdff0772b042462b7d/8
›   result_service=tmpfs
›   debug
›   apic=debug
›   sysrq_always_enabled
›   rcupdate.rcu_cpu_stall_timeout=100
›   net.ifnames=0
›   printk.devkmsg=on
›   panic=-1
›   softlockup_panic=1
›   nmi_watchdog=panic
›   oops=panic
›   load_ramdisk=2
›   prompt_ramdisk=0
›   drbd.minor_count=8
›   systemd.log_level=err
›   ignore_loglevel
›   console=tty0
›   earlyprintk=ttyS0,115200
›   console=ttyS0,115200
›   vga=normal
›   rw
›   rcuperf.shutdown=0
›   watchdog_thresh=60
)

"${kvm[@]}" -append "${append[*]}"


We will definitely give serious thought to your suggestion.

Best Regards,
Rong Chen

--------------F2192ED820780A63D2DD35AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/7/20 2:46 PM, Anshuman Khandual
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com">
      <pre class="moz-quote-pre" wrap="">On 12/27/2019 07:52 PM, kernel test robot wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[    9.781974] kernel BUG at include/linux/mm.h:592!
[    9.782810] invalid opcode: 0000 [#1] PTI
[    9.783443] CPU: 0 PID: 1 Comm: swapper Not tainted 5.5.0-rc3-00001-g87c4696d57b5e #1
[    9.784528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
[    9.785756] EIP: __free_pages+0x14/0x40
[    9.786442] Code: 0c 9c 5e fa 89 d8 e8 5b f3 ff ff 56 9d 5b 5e 5d c3 8d 74 26 00 90 8b 48 1c 55 89 e5 85 c9 75 16 ba b4 b6 84 d6 e8 ac 49 fe ff &lt;0f&gt; 0b 8d b4 26 00 00 00 00 8d 76 00 ff 48 1c 75 10 85 d2 75 07 e8
[    9.789697] EAX: d68761f7 EBX: ea52f000 ECX: ea4f8520 EDX: d684b6b4
[    9.790850] ESI: 00000000 EDI: ef45e000 EBP: ea501f08 ESP: ea501f08
[    9.791879] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
[    9.792783] CR0: 80050033 CR2: ffffffff CR3: 16d00000 CR4: 000406b0
[    9.792783] Call Trace:
[    9.792783]  free_pages+0x3c/0x50
[    9.792783]  pgd_free+0x5a/0x170
[    9.792783]  __mmdrop+0x42/0xe0
[    9.792783]  debug_vm_pgtable+0x54f/0x567
[    9.792783]  kernel_init_freeable+0x90/0x1e3
[    9.792783]  ? rest_init+0xf0/0xf0
[    9.792783]  kernel_init+0x8/0xf0
[    9.792783]  ret_from_fork+0x19/0x24
[    9.792783] Modules linked in:
[    9.792803] ---[ end trace 91b7335adcf0b656 ]---


To reproduce:

        # build kernel
	cd linux
	cp config-5.5.0-rc3-00001-g87c4696d57b5e .config
	make HOSTCC=gcc-7 CC=gcc-7 ARCH=i386 olddefconfig prepare modules_prepare bzImage

        git clone <a class="moz-txt-link-freetext" href="https://github.com/intel/lkp-tests.git">https://github.com/intel/lkp-tests.git</a>
        cd lkp-tests
        bin/lkp qemu -k &lt;bzImage&gt; job-script # job-script is attached in this email
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hello,

As the failure might be happening during boot when the test executes,
do we really need to run these LKP based QEMU environment in order to
reproduce the problem ? Could not this be recreated on a standalone
system.

- Anshuman
</pre>
    </blockquote>
    <br>
    Hi Anshuman,<br>
    <br>
    Thanks for your advice, we provided another reproduce method which
    is in the end of dmesg.xz file attached in original report:<br>
    but the initrd file need to be supplied.<br>
    <br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-0 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-1 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-2 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-3 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-4 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-5 256G<br>
    qemu-img create -f qcow2 disk-vm-snb-89942dcb126f-6 256G<br>
    <br>
    kvm=(<br>
    ›   qemu-system-x86_64<br>
    ›   -enable-kvm<br>
    ›   -cpu SandyBridge<br>
    ›   -kernel $kernel<br>
    ›   -initrd initrd-vm-snb-89942dcb126f<br>
    ›   -m 8192<br>
    ›   -smp 2<br>
    ›   -device e1000,netdev=net0<br>
    ›   -netdev user,id=net0,hostfwd=tcp::32032-:22<br>
    ›   -boot order=nc<br>
    ›   -no-reboot<br>
    ›   -watchdog i6300esb<br>
    ›   -watchdog-action debug<br>
    ›   -rtc base=localtime<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-0,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-1,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-2,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-3,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-4,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-5,media=disk,if=virtio<br>
    ›   -drive file=disk-vm-snb-89942dcb126f-6,media=disk,if=virtio<br>
    ›   -serial stdio<br>
    ›   -display none<br>
    ›   -monitor null<br>
    )<br>
    <br>
    append=(<br>
    ›   ip=::::vm-snb-89942dcb126f::dhcp<br>
    ›   root=/dev/ram0<br>
    ›   user=lkp<br>
    ›   job=/job-script<br>
    ›  
ARCH=i386                                                                                                                                                                                                                                                                                                                                                              
    <br>
    ›   kconfig=i386-randconfig-h001-20191225<br>
    ›   branch=linux-devel/devel-hourly-2019122518<br>
    ›   commit=87c4696d57b5e380bc2720fdff0772b042462b7d<br>
    ›  
BOOT_IMAGE=/pkg/linux/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e380bc2720fdff0772b042462b7d/vmlinuz-5.5.0-rc3-00001-g87c4696d57b5e<br>
    ›   max_uptime=1500<br>
    ›  
RESULT_ROOT=/result/trinity/300s/vm-snb/yocto-minimal-i386-2019-05-20.cgz/i386-randconfig-h001-20191225/gcc-7/87c4696d57b5e380bc2720fdff0772b042462b7d/8<br>
    ›   result_service=tmpfs<br>
    ›   debug<br>
    ›   apic=debug<br>
    ›   sysrq_always_enabled<br>
    ›   rcupdate.rcu_cpu_stall_timeout=100<br>
    ›   net.ifnames=0<br>
    ›   printk.devkmsg=on<br>
    ›   panic=-1<br>
    ›   softlockup_panic=1<br>
    ›   nmi_watchdog=panic<br>
    ›   oops=panic<br>
    ›   load_ramdisk=2<br>
    ›   prompt_ramdisk=0<br>
    ›   drbd.minor_count=8<br>
    ›   systemd.log_level=err<br>
    ›   ignore_loglevel<br>
    ›   console=tty0<br>
    ›   earlyprintk=ttyS0,115200<br>
    ›   console=ttyS0,115200<br>
    ›   vga=normal<br>
    ›   rw<br>
    ›   rcuperf.shutdown=0<br>
    ›   watchdog_thresh=60<br>
    )<br>
    <br>
    "${kvm[@]}" -append "${append[*]}"<br>
    <br>
    <br>
    We <span style="color: rgb(51, 51, 51); font-family: -apple-system,
      &quot;PingFang SC&quot;, &quot;Helvetica Neue&quot;, STHeiti,
      &quot;Microsoft Yahei&quot;, Tahoma, sans-serif; font-size: 16px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">will definitely give serious thought to
      your suggestion.</span><br>
    <br>
    Best Regards,<br>
    Rong Chen<br>
  </body>
</html>

--------------F2192ED820780A63D2DD35AC--
