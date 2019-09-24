Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72DBD298
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:26:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dB5Q6W3gzDqB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 05:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.157.236; helo=10.mo6.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1798 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 04:03:36 AEST
Received: from 10.mo6.mail-out.ovh.net (10.mo6.mail-out.ovh.net
 [87.98.157.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d8FN6WPdzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 04:03:34 +1000 (AEST)
Received: from player695.ha.ovh.net (unknown [10.109.160.226])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 027E91E24B0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 19:26:26 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id EB4BDA143B89;
 Tue, 24 Sep 2019 17:26:15 +0000 (UTC)
Date: Tue, 24 Sep 2019 19:26:14 +0200
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already
 in use
Message-ID: <20190924192614.3b681165@bahia.lan>
In-Reply-To: <20190924053328.GB7950@oak.ozlabs.ibm.com>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925342885.974393.4930571278578115883.stgit@bahia.lan>
 <20190924053328.GB7950@oak.ozlabs.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5891271265187174843
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: kvm@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Sep 2019 15:33:28 +1000
Paul Mackerras <paulus@ozlabs.org> wrote:

> On Mon, Sep 23, 2019 at 05:43:48PM +0200, Greg Kurz wrote:
> > We currently prevent userspace to connect a new vCPU if we already have
> > one with the same vCPU id. This is good but unfortunately not enough,
> > because VP ids derive from the packed vCPU ids, and kvmppc_pack_vcpu_id()
> > can return colliding values. For examples, 348 stays unchanged since it
> > is < KVM_MAX_VCPUS, but it is also the packed value of 2392 when the
> > guest's core stride is 8. Nothing currently prevents userspace to connect
> > vCPUs with forged ids, that end up being associated to the same VP. This
> > confuses the irq layer and likely crashes the kernel:
> > 
> > [96631.670454] genirq: Flags mismatch irq 4161. 00010000 (kvm-1-2392) vs. 00010000 (kvm-1-348)
> 
> Have you seen a host kernel crash?

Yes I have.

[29191.162740] genirq: Flags mismatch irq 199. 00010000 (kvm-2-2392) vs. 00010000 (kvm-2-348)
[29191.162849] CPU: 24 PID: 88176 Comm: qemu-system-ppc Not tainted 5.3.0-xive-nr-servers-5.3-gku+ #38
[29191.162966] Call Trace:
[29191.163002] [c000003f7f9937e0] [c000000000c0110c] dump_stack+0xb0/0xf4 (unreliable)
[29191.163090] [c000003f7f993820] [c0000000001cb480] __setup_irq+0xa70/0xad0
[29191.163180] [c000003f7f9938d0] [c0000000001cb75c] request_threaded_irq+0x13c/0x260
[29191.163290] [c000003f7f993940] [c00800000d44e7ac] kvmppc_xive_attach_escalation+0x104/0x270 [kvm]
[29191.163396] [c000003f7f9939d0] [c00800000d45013c] kvmppc_xive_connect_vcpu+0x424/0x620 [kvm]
[29191.163504] [c000003f7f993ac0] [c00800000d444428] kvm_arch_vcpu_ioctl+0x260/0x448 [kvm]
[29191.163616] [c000003f7f993b90] [c00800000d43593c] kvm_vcpu_ioctl+0x154/0x7c8 [kvm]
[29191.163695] [c000003f7f993d00] [c0000000004840f0] do_vfs_ioctl+0xe0/0xc30
[29191.163806] [c000003f7f993db0] [c000000000484d44] ksys_ioctl+0x104/0x120
[29191.163889] [c000003f7f993e00] [c000000000484d88] sys_ioctl+0x28/0x80
[29191.163962] [c000003f7f993e20] [c00000000000b278] system_call+0x5c/0x68
[29191.164035] xive-kvm: Failed to request escalation interrupt for queue 0 of VCPU 2392
[29191.164152] ------------[ cut here ]------------
[29191.164229] remove_proc_entry: removing non-empty directory 'irq/199', leaking at least 'kvm-2-348'
[29191.164343] WARNING: CPU: 24 PID: 88176 at /home/greg/Work/linux/kernel-kvm-ppc/fs/proc/generic.c:684 remove_proc_entry+0x1ec/0x200
[29191.164501] Modules linked in: kvm_hv kvm dm_mod vhost_net vhost tap xt_CHECKSUM iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter squashfs loop fuse i2c_dev sg ofpart ocxl powernv_flash at24 xts mtd uio_pdrv_genirq vmx_crypto opal_prd ipmi_powernv uio ipmi_devintf ipmi_msghandler ibmpowernv ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables ext4 mbcache jbd2 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor xor async_tx raid6_pq libcrc32c raid1 raid0 linear sd_mod ast i2c_algo_bit drm_vram_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm ahci libahci libata tg3 drm_panel_orientation_quirks [last unloaded: kvm]
[29191.165450] CPU: 24 PID: 88176 Comm: qemu-system-ppc Not tainted 5.3.0-xive-nr-servers-5.3-gku+ #38
[29191.165568] NIP:  c00000000053b0cc LR: c00000000053b0c8 CTR: c0000000000ba3b0
[29191.165644] REGS: c000003f7f9934b0 TRAP: 0700   Not tainted  (5.3.0-xive-nr-servers-5.3-gku+)
[29191.165741] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 48228222  XER: 20040000
[29191.165939] CFAR: c000000000131a50 IRQMASK: 0 
[29191.165939] GPR00: c00000000053b0c8 c000003f7f993740 c0000000015ec500 0000000000000057 
[29191.165939] GPR04: 0000000000000001 0000000000000000 000049fb98484262 0000000000001bcf 
[29191.165939] GPR08: 0000000000000007 0000000000000007 0000000000000001 9000000000001033 
[29191.165939] GPR12: 0000000000008000 c000003ffffeb800 0000000000000000 000000012f4ce5a1 
[29191.165939] GPR16: 000000012ef5a0c8 0000000000000000 000000012f113bb0 0000000000000000 
[29191.165939] GPR20: 000000012f45d918 c000003f863758b0 c000003f86375870 0000000000000006 
[29191.165939] GPR24: c000003f86375a30 0000000000000007 c0002039373d9020 c0000000014c4a48 
[29191.165939] GPR28: 0000000000000001 c000003fe62a4f6b c00020394b2e9fab c000003fe62a4ec0 
[29191.166755] NIP [c00000000053b0cc] remove_proc_entry+0x1ec/0x200
[29191.166803] LR [c00000000053b0c8] remove_proc_entry+0x1e8/0x200
[29191.166874] Call Trace:
[29191.166908] [c000003f7f993740] [c00000000053b0c8] remove_proc_entry+0x1e8/0x200 (unreliable)
[29191.167022] [c000003f7f9937e0] [c0000000001d3654] unregister_irq_proc+0x114/0x150
[29191.167106] [c000003f7f993880] [c0000000001c6284] free_desc+0x54/0xb0
[29191.167175] [c000003f7f9938c0] [c0000000001c65ec] irq_free_descs+0xac/0x100
[29191.167256] [c000003f7f993910] [c0000000001d1ff8] irq_dispose_mapping+0x68/0x80
[29191.167347] [c000003f7f993940] [c00800000d44e8a4] kvmppc_xive_attach_escalation+0x1fc/0x270 [kvm]
[29191.167480] [c000003f7f9939d0] [c00800000d45013c] kvmppc_xive_connect_vcpu+0x424/0x620 [kvm]
[29191.167595] [c000003f7f993ac0] [c00800000d444428] kvm_arch_vcpu_ioctl+0x260/0x448 [kvm]
[29191.167683] [c000003f7f993b90] [c00800000d43593c] kvm_vcpu_ioctl+0x154/0x7c8 [kvm]
[29191.167772] [c000003f7f993d00] [c0000000004840f0] do_vfs_ioctl+0xe0/0xc30
[29191.167863] [c000003f7f993db0] [c000000000484d44] ksys_ioctl+0x104/0x120
[29191.167952] [c000003f7f993e00] [c000000000484d88] sys_ioctl+0x28/0x80
[29191.168002] [c000003f7f993e20] [c00000000000b278] system_call+0x5c/0x68
[29191.168088] Instruction dump:
[29191.168125] 2c230000 41820008 3923ff78 e8e900a0 3c82ff69 3c62ff8d 7fa6eb78 7fc5f378 
[29191.168221] 3884f080 3863b948 4bbf6925 60000000 <0fe00000> 4bffff7c fba10088 4bbf6e41 
[29191.168317] ---[ end trace b925b67a74a1d8d1 ]---
[29191.170904] BUG: Kernel NULL pointer dereference at 0x00000010
[29191.170925] Faulting instruction address: 0xc00800000d44fc04
[29191.170987] Oops: Kernel access of bad area, sig: 11 [#1]
[29191.171044] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
[29191.171132] Modules linked in: kvm_hv kvm dm_mod vhost_net vhost tap xt_CHECKSUM iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter squashfs loop fuse i2c_dev sg ofpart ocxl powernv_flash at24 xts mtd uio_pdrv_genirq vmx_crypto opal_prd ipmi_powernv uio ipmi_devintf ipmi_msghandler ibmpowernv ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables ext4 mbcache jbd2 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor xor async_tx raid6_pq libcrc32c raid1 raid0 linear sd_mod ast i2c_algo_bit drm_vram_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm ahci libahci libata tg3 drm_panel_orientation_quirks [last unloaded: kvm]
[29191.172045] CPU: 24 PID: 88176 Comm: qemu-system-ppc Tainted: G        W         5.3.0-xive-nr-servers-5.3-gku+ #38
[29191.172140] NIP:  c00800000d44fc04 LR: c00800000d44fc00 CTR: c0000000001cd970
[29191.172239] REGS: c000003f7f9938e0 TRAP: 0300   Tainted: G        W          (5.3.0-xive-nr-servers-5.3-gku+)
[29191.172337] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24228882  XER: 20040000
[29191.172439] CFAR: c0000000001cd9ac DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0 
[29191.172439] GPR00: c00800000d44fc00 c000003f7f993b70 c00800000d468300 0000000000000000 
[29191.172439] GPR04: 00000000000000c7 0000000000000000 0000000000000000 c000003ffacd06d8 
[29191.172439] GPR08: 0000000000000000 c000003ffacd0738 0000000000000000 fffffffffffffffd 
[29191.172439] GPR12: 0000000000000040 c000003ffffeb800 0000000000000000 000000012f4ce5a1 
[29191.172439] GPR16: 000000012ef5a0c8 0000000000000000 000000012f113bb0 0000000000000000 
[29191.172439] GPR20: 000000012f45d918 00007ffffe0d9a80 000000012f4f5df0 000000012ef8c9f8 
[29191.172439] GPR24: 0000000000000001 0000000000000000 c000003fe4501ed0 c000003f8b1d0000 
[29191.172439] GPR28: c0000033314689c0 c000003fe4501c00 c000003fe4501e70 c000003fe4501e90 
[29191.173262] NIP [c00800000d44fc04] kvmppc_xive_cleanup_vcpu+0xfc/0x210 [kvm]
[29191.173354] LR [c00800000d44fc00] kvmppc_xive_cleanup_vcpu+0xf8/0x210 [kvm]
[29191.173443] Call Trace:
[29191.173484] [c000003f7f993b70] [c00800000d44fc00] kvmppc_xive_cleanup_vcpu+0xf8/0x210 [kvm] (unreliable)
[29191.173640] [c000003f7f993bd0] [c00800000d450bd4] kvmppc_xive_release+0xdc/0x1b0 [kvm]
[29191.173737] [c000003f7f993c30] [c00800000d436a98] kvm_device_release+0xb0/0x110 [kvm]
[29191.173816] [c000003f7f993c70] [c00000000046730c] __fput+0xec/0x320
[29191.173908] [c000003f7f993cd0] [c000000000164ae0] task_work_run+0x150/0x1c0
[29191.173968] [c000003f7f993d30] [c000000000025034] do_notify_resume+0x304/0x440
[29191.174047] [c000003f7f993e20] [c00000000000dcc4] ret_from_except_lite+0x70/0x74
[29191.174136] Instruction dump:
[29191.174155] 3bff0008 7fbfd040 419e0054 847e0004 2fa30000 419effec e93d0000 8929203c 
[29191.174266] 2f890000 419effb8 4800821d e8410018 <e9230010> e9490008 9b2a0039 7c0004ac 
[29191.174348] ---[ end trace b925b67a74a1d8d2 ]---
[29191.372417] 
[29192.372502] Kernel panic - not syncing: Fatal exception


> How hard would it be to exploit
> this, 

I just had to run a guest (SMT1, stride 8, 300 vCPUs) with a patched QEMU
that turns the valid vCPU id 344 into 348 when calling KVM_CAP_IRQ_XICS.

> and would it just be a denial of service, or do you think it
> could be used to get a use-after-free in the kernel or something like
> that?
> 

This triggers a cascade of errors, the ultimate one being to pass
a NULL pointer to irq_data_get_irq_handler_data() during the
escalation irq cleanup if I get it right.

> Also, does this patch depend on the patch 2 in this series?
> 

No it doesn't.

> Paul.

