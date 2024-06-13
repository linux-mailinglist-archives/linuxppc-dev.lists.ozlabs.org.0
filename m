Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE92906A88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 12:56:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CcTrZmH2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0K9B5N54z3cVs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 20:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CcTrZmH2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0K8R12jnz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 20:56:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718276167;
	bh=aeaFWlKbMkYQWJHoJBHcj/gpPULZP3g/VUesCefZyL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CcTrZmH2G4VorT9I1SUm21UKRDH2lB0KXeAK1y0H/yiEQAFuGwVNQAvQ4gW6h6neu
	 qqEgq6E90iW/xTX3pX1XkfZTXrYIq+8+OobzCactVht7N6eYUZbRnudM0EsraHQNDA
	 yOTzMIS+DapgJBkPUnukjl2zSucfbKv08jpgjuCO7jxqasekj7pZG4TbwN/NutZ6WR
	 f3PFPtLNfnRXM8iyCiSnePU+uuEHcvi9a+WMYggr3Q6pPF9CAZsiy8/OAazlbrpC+2
	 oI2Hf5HLHSS3FGztDx77VOrVIywoSDSBoY/8rzjHoVJdzmljaZd0E4W0OMFbG0pl0f
	 6KSdZwLTo959Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0K8Q2XSRz4wbr;
	Thu, 13 Jun 2024 20:56:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>
Subject: Re: [RFC] potential UAF in kvm_spapr_tce_attach_iommu_group() (was
 Re: [PATCH 11/19] switch simple users of fdget() to CLASS(fd, ...))
In-Reply-To: <CAHk-=wgf4yN4gGsGQOTBR_xE0q-9fB04omufZk2gnBRZ0Ywbiw@mail.gmail.com>
References: <20240607015656.GX1629371@ZenIV>
 <20240607015957.2372428-1-viro@zeniv.linux.org.uk>
 <20240607015957.2372428-11-viro@zeniv.linux.org.uk>
 <20240607-gelacht-enkel-06a7c9b31d4e@brauner>
 <20240607161043.GZ1629371@ZenIV> <20240607210814.GC1629371@ZenIV>
 <20240610024437.GA1464458@ZenIV>
 <CAHk-=wgf4yN4gGsGQOTBR_xE0q-9fB04omufZk2gnBRZ0Ywbiw@mail.gmail.com>
Date: Thu, 13 Jun 2024 20:56:03 +1000
Message-ID: <878qz9p0vw.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Alexey Kardashevskiy <aik@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sun, 9 Jun 2024 at 19:45, Al Viro <viro@zeniv.linux.org.uk> wrote:
>>
>> Unless I'm misreading that code (entirely possible), this fdput() shouldn't
>> be done until we are done with stt.
>
> Ack. That looks right to me.
>
> If I follow it right, the lifetime of stt is tied to the lifetime of
> the file (plus RCU), so doing fdput early and then dropping the RCU
> lock means that stt may not be valid any more later.

Yep. I added a sleep after the fdput and was able to get KASAN to catch
it (below).

I'll send a fix patch tomorrow, just using fdput(), and then the CLASS
conversion can go on top later.

cheers


==================================================================
BUG: KASAN: slab-use-after-free in kvm_spapr_tce_attach_iommu_group+0x298/0x720 [kvm]
Read of size 4 at addr c000200027552c30 by task kvm-vfio/2505

CPU: 54 PID: 2505 Comm: kvm-vfio Not tainted 6.10.0-rc3-next-20240612-dirty #1
Hardware name: 8335-GTH POWER9 0x4e1202 opal:skiboot-v6.5.3-35-g1851b2a06 PowerNV
Call Trace:
[c00020008c2a7860] [c0000000027d4d50] dump_stack_lvl+0xb4/0x108 (unreliable)
[c00020008c2a78a0] [c00000000072dfa8] print_report+0x2b4/0x6ec
[c00020008c2a7990] [c00000000072d898] kasan_report+0x118/0x2b0
[c00020008c2a7aa0] [c00000000072ff38] __asan_load4+0xb8/0xd0
[c00020008c2a7ac0] [c00800001b343140] kvm_spapr_tce_attach_iommu_group+0x298/0x720 [kvm]
[c00020008c2a7b90] [c00800001b31d61c] kvm_vfio_set_attr+0x524/0xac0 [kvm]
[c00020008c2a7c60] [c00800001b3083ec] kvm_device_ioctl+0x144/0x240 [kvm]
[c00020008c2a7cd0] [c0000000007e052c] sys_ioctl+0x62c/0x1810
[c00020008c2a7df0] [c000000000038d90] system_call_exception+0x190/0x440
[c00020008c2a7e50] [c00000000000d15c] system_call_vectored_common+0x15c/0x2ec
--- interrupt: 3000 at 0x7fff8af5bedc
NIP:  00007fff8af5bedc LR: 00007fff8af5bedc CTR: 0000000000000000
REGS: c00020008c2a7e80 TRAP: 3000   Not tainted  (6.10.0-rc3-next-20240612-dirty)
MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002482  XER: 00000000
IRQMASK: 0 
GPR00: 0000000000000036 00007fffda53b1f0 00007fff8b066d00 0000000000000006 
GPR04: 000000008018aee1 00007fffda53b270 0000000000000008 00007fff8ac0e9e0 
GPR08: 0000000000000006 0000000000000000 0000000000000000 0000000000000000 
GPR12: 0000000000000000 00007fff8b2ca540 0000000000000000 0000000000000000 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000000 0000000000000000 0000000000000000 00000000100101c0 
GPR24: 00007fff8b2bf840 00007fff8b2c0000 00007fffda53b728 0000000000000001 
GPR28: 00007fffda53b838 0000000000000006 0000000000000001 0000000000000005 
NIP [00007fff8af5bedc] 0x7fff8af5bedc
LR [00007fff8af5bedc] 0x7fff8af5bedc
--- interrupt: 3000

Allocated by task 2505:
 kasan_save_stack+0x48/0x80
 kasan_save_track+0x2c/0x50
 kasan_save_alloc_info+0x44/0x60
 __kasan_kmalloc+0xd0/0x120
 __kmalloc_noprof+0x214/0x670
 kvm_vm_ioctl_create_spapr_tce+0x10c/0x420 [kvm]
 kvm_arch_vm_ioctl+0x5fc/0x890 [kvm]
 kvm_vm_ioctl+0xa54/0x13d0 [kvm]
 sys_ioctl+0x62c/0x1810
 system_call_exception+0x190/0x440
 system_call_vectored_common+0x15c/0x2ec

Freed by task 0:
 kasan_save_stack+0x48/0x80
 kasan_save_track+0x2c/0x50
 kasan_save_free_info+0xac/0xd0
 __kasan_slab_free+0x120/0x210
 kfree+0xec/0x3e0
 release_spapr_tce_table+0xd4/0x11c [kvm]
 rcu_core+0x568/0x16a0
 handle_softirqs+0x23c/0x920
 do_softirq_own_stack+0x6c/0x90
 do_softirq_own_stack+0x58/0x90
 __irq_exit_rcu+0x218/0x2d0
 irq_exit+0x30/0x80
 arch_local_irq_restore+0x128/0x230
 arch_local_irq_enable+0x1c/0x30
 cpuidle_enter_state+0x134/0x5cc
 cpuidle_enter+0x6c/0xb0
 call_cpuidle+0x7c/0x100
 do_idle+0x394/0x410
 cpu_startup_entry+0x60/0x70
 start_secondary+0x3fc/0x410
 start_secondary_prolog+0x10/0x14

Last potentially related work creation:
 kasan_save_stack+0x48/0x80
 __kasan_record_aux_stack+0xcc/0x130
 __call_rcu_common.constprop.0+0x8c/0x8e0
 kvm_spapr_tce_release+0x29c/0xbc10 [kvm]
 __fput+0x22c/0x630
 sys_close+0x70/0xe0
 system_call_exception+0x190/0x440
 system_call_vectored_common+0x15c/0x2ec

The buggy address belongs to the object at c000200027552c00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 48 bytes inside of
 freed 256-byte region [c000200027552c00, c000200027552d00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xc000200027551800 pfn:0x20002755
flags: 0x83ffff800000000(node=8|zone=0|lastcpupid=0x7ffff)
page_type: 0xfdffffff(slab)
raw: 083ffff800000000 c000000007010d80 5deadbeef0000122 0000000000000000
raw: c000200027551800 0000000080800078 00000001fdffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c000200027552b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 c000200027552b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>c000200027552c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 c000200027552c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 c000200027552d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
Disabling lock debugging due to kernel taint
