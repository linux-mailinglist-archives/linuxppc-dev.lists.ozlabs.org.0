Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A016E3C4A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 09:04:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLb60cmZzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:04:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.78; helo=9.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 39480 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 16:57:09 AEST
Received: from 9.mo69.mail-out.ovh.net (9.mo69.mail-out.ovh.net [46.105.56.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NLQs2tjMzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:57:08 +1000 (AEST)
Received: from player746.ha.ovh.net (unknown [10.108.35.131])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id CBB295D5E7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 08:48:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 9AF906C746E9;
 Tue, 11 Jun 2019 06:48:43 +0000 (UTC)
Subject: Re: [PATCH v2] powerpc: Add force enable of DAWR on P9 option
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190401060312.22670-1-mikey@neuling.org>
 <68f4f99d-4bb7-7d25-1e68-96c65dfbfbe9@kaod.org>
 <287ab7092cc6128e1c0d25f6245eb5f1706c6cb0.camel@neuling.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dc9106e8-422f-5582-e463-def38902f03a@kaod.org>
Date: Tue, 11 Jun 2019 08:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <287ab7092cc6128e1c0d25f6245eb5f1706c6cb0.camel@neuling.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5678757657942854447
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehfedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Cc: linuxppc-dev@lists.ozlabs.org, Cameron Kaiser <spectre@floodgap.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/06/2019 08:44, Michael Neuling wrote:
> 
>>>  2:
>>> -BEGIN_FTR_SECTION
>>> -	/* POWER9 with disabled DAWR */
>>> +	LOAD_REG_ADDR(r11, dawr_force_enable)
>>> +	lbz	r11, 0(r11)
>>> +	cmpdi	r11, 0
>>>  	li	r3, H_HARDWARE
>>> -	blr
>>> -END_FTR_SECTION_IFCLR(CPU_FTR_DAWR)
>>> +	beqlr
>>
>> Why is this a 'beqlr' ? Shouldn't it be a blr ? 
> 
> I believe it's right and should be a beqlr.  It's to replace the FTR section to
> make it dynamic based on the dawr_force_enable bit.

hmm, see the crash below on a L1 running a nested guest. r3 is set
to -1 (H_HARDWARE) but a vpcu pointer was expected. How can we fix
this ? 

C.


[   44.374746] BUG: Kernel NULL pointer dereference at 0x000013bf
[   44.374848] Faulting instruction address: 0xc00000000010b044
[   44.374906] Oops: Kernel access of bad area, sig: 11 [#1]
[   44.374951] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   44.375018] Modules linked in: vhost_net vhost tap xt_CHECKSUM iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter vmx_crypto crct10dif_vpmsum crc32c_vpmsum kvm_hv kvm sch_fq_codel ip_tables x_tables autofs4 virtio_net net_failover virtio_scsi failover
[   44.375401] CPU: 8 PID: 1771 Comm: qemu-system-ppc Kdump: loaded Not tainted 5.2.0-rc4+ #3
[   44.375500] NIP:  c00000000010b044 LR: c0080000089dacf4 CTR: c00000000010aff4
[   44.375604] REGS: c00000179b397710 TRAP: 0300   Not tainted  (5.2.0-rc4+)
[   44.375691] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42244842  XER: 00000000
[   44.375815] CFAR: c00000000010aff8 DAR: 00000000000013bf DSISR: 42000000 IRQMASK: 0 
[   44.375815] GPR00: c0080000089dd6bc c00000179b3979a0 c008000008a04300 ffffffffffffffff 
[   44.375815] GPR04: 0000000000000000 0000000000000003 000000002444b05d c0000017f11c45d0 
[   44.375815] GPR08: 078000003e018dfe 0000000000000028 0000000000000001 0000000000000075 
[   44.375815] GPR12: c00000000010aff4 c000000007ff6300 0000000000000000 0000000000000000 
[   44.375815] GPR16: 0000000000000000 c0000017f11d0000 00000000ffffffff c0000017f11ca7a8 
[   44.375815] GPR20: c0000017f11c42ec ffffffffffffffff 0000000000000000 000000000000000a 
[   44.375815] GPR24: fffffffffffffffc 0000000000000000 c0000017f11c0000 c000000001a77ed8 
[   44.375815] GPR28: c00000179af70000 fffffffffffffffc c0080000089ff170 c00000179ae88540 
[   44.376673] NIP [c00000000010b044] kvmppc_h_set_dabr+0x50/0x68
[   44.376754] LR [c0080000089dacf4] kvmppc_pseries_do_hcall+0xa3c/0xeb0 [kvm_hv]
[   44.376849] Call Trace:
[   44.376886] [c00000179b3979a0] [c0000017f11c0000] 0xc0000017f11c0000 (unreliable)
[   44.376982] [c00000179b397a10] [c0080000089dd6bc] kvmppc_vcpu_run_hv+0x694/0xec0 [kvm_hv]
[   44.377084] [c00000179b397ae0] [c0080000093f8bcc] kvmppc_vcpu_run+0x34/0x48 [kvm]
[   44.377185] [c00000179b397b00] [c0080000093f522c] kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
[   44.377286] [c00000179b397b90] [c0080000093e3618] kvm_vcpu_ioctl+0x460/0x850 [kvm]
[   44.377384] [c00000179b397d00] [c0000000004ba6c4] do_vfs_ioctl+0xe4/0xb40
[   44.377464] [c00000179b397db0] [c0000000004bb1e4] ksys_ioctl+0xc4/0x110
[   44.377547] [c00000179b397e00] [c0000000004bb258] sys_ioctl+0x28/0x80
[   44.377628] [c00000179b397e20] [c00000000000b888] system_call+0x5c/0x70
[   44.377712] Instruction dump:
[   44.377765] 4082fff4 4c00012c 38600000 4e800020 e96280c0 896b0000 2c2b0000 3860ffff 
[   44.377862] 4d820020 50852e74 508516f6 78840724 <f88313c0> f8a313c8 7c942ba6 7cbc2ba6 
