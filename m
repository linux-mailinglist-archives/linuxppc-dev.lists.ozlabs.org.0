Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7E41E20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 09:45:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NzRb2G8zzDqs2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 17:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QPGCJG2G"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NzPG5qsCzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 17:42:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NzP753MWz9tyxR;
 Wed, 12 Jun 2019 09:42:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QPGCJG2G; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J0zPHlOSij9q; Wed, 12 Jun 2019 09:42:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NzP739J3z9tyxM;
 Wed, 12 Jun 2019 09:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560325371; bh=HElML/UWfN6T8anmsc+Fv8qPf09dL66P6udYYldsNmg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QPGCJG2GKSJOLCz3svcJkGrUJ75QXLUoTDxHdS+s/LO3zH2siXvv1z2qsj+N9QqOl
 SwwWDwSxE7/+PONK0cxnfatWCHweCoA5RrBRcMPzqtHWox1N8NzLUG8cIop4J6JQ4M
 t5rEM7hxcoEkE7bU1wJSPffQlmmaZC0ehhR4oDvg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 713048B804;
 Wed, 12 Jun 2019 09:42:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GRYvQn68m7uE; Wed, 12 Jun 2019 09:42:52 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 493808B75A;
 Wed, 12 Jun 2019 09:42:52 +0200 (CEST)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190612072229.15832-1-mikey@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1ee1cc67-d342-6610-4865-8c52a85e67c1@c-s.fr>
Date: Wed, 12 Jun 2019 09:42:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612072229.15832-1-mikey@neuling.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/06/2019 à 09:22, Michael Neuling a écrit :
> In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> option") I screwed up some assembler and corrupted a pointer in
> r3. This resulted in crashes like the below from Cédric:

Iaw Documentation/process/submitting-patches.rst:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

So you could rephrase as follows for instance:

Commit XXXX ("") screwed up some assembler ....

> 
>    [   44.374746] BUG: Kernel NULL pointer dereference at 0x000013bf
>    [   44.374848] Faulting instruction address: 0xc00000000010b044
>    [   44.374906] Oops: Kernel access of bad area, sig: 11 [#1]
>    [   44.374951] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>    [   44.375018] Modules linked in: vhost_net vhost tap xt_CHECKSUM iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter bpfilter vmx_crypto crct10dif_vpmsum crc32c_vpmsum kvm_hv kvm sch_fq_codel ip_tables x_tables autofs4 virtio_net net_failover virtio_scsi failover
>    [   44.375401] CPU: 8 PID: 1771 Comm: qemu-system-ppc Kdump: loaded Not tainted 5.2.0-rc4+ #3
>    [   44.375500] NIP:  c00000000010b044 LR: c0080000089dacf4 CTR: c00000000010aff4
>    [   44.375604] REGS: c00000179b397710 TRAP: 0300   Not tainted  (5.2.0-rc4+)
>    [   44.375691] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42244842  XER: 00000000
>    [   44.375815] CFAR: c00000000010aff8 DAR: 00000000000013bf DSISR: 42000000 IRQMASK: 0
>    [   44.375815] GPR00: c0080000089dd6bc c00000179b3979a0 c008000008a04300 ffffffffffffffff
>    [   44.375815] GPR04: 0000000000000000 0000000000000003 000000002444b05d c0000017f11c45d0
>    [   44.375815] GPR08: 078000003e018dfe 0000000000000028 0000000000000001 0000000000000075
>    [   44.375815] GPR12: c00000000010aff4 c000000007ff6300 0000000000000000 0000000000000000
>    [   44.375815] GPR16: 0000000000000000 c0000017f11d0000 00000000ffffffff c0000017f11ca7a8
>    [   44.375815] GPR20: c0000017f11c42ec ffffffffffffffff 0000000000000000 000000000000000a
>    [   44.375815] GPR24: fffffffffffffffc 0000000000000000 c0000017f11c0000 c000000001a77ed8
>    [   44.375815] GPR28: c00000179af70000 fffffffffffffffc c0080000089ff170 c00000179ae88540
>    [   44.376673] NIP [c00000000010b044] kvmppc_h_set_dabr+0x50/0x68
>    [   44.376754] LR [c0080000089dacf4] kvmppc_pseries_do_hcall+0xa3c/0xeb0 [kvm_hv]
>    [   44.376849] Call Trace:
>    [   44.376886] [c00000179b3979a0] [c0000017f11c0000] 0xc0000017f11c0000 (unreliable)
>    [   44.376982] [c00000179b397a10] [c0080000089dd6bc] kvmppc_vcpu_run_hv+0x694/0xec0 [kvm_hv]
>    [   44.377084] [c00000179b397ae0] [c0080000093f8bcc] kvmppc_vcpu_run+0x34/0x48 [kvm]
>    [   44.377185] [c00000179b397b00] [c0080000093f522c] kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
>    [   44.377286] [c00000179b397b90] [c0080000093e3618] kvm_vcpu_ioctl+0x460/0x850 [kvm]
>    [   44.377384] [c00000179b397d00] [c0000000004ba6c4] do_vfs_ioctl+0xe4/0xb40
>    [   44.377464] [c00000179b397db0] [c0000000004bb1e4] ksys_ioctl+0xc4/0x110
>    [   44.377547] [c00000179b397e00] [c0000000004bb258] sys_ioctl+0x28/0x80
>    [   44.377628] [c00000179b397e20] [c00000000000b888] system_call+0x5c/0x70
>    [   44.377712] Instruction dump:
>    [   44.377765] 4082fff4 4c00012c 38600000 4e800020 e96280c0 896b0000 2c2b0000 3860ffff
>    [   44.377862] 4d820020 50852e74 508516f6 78840724 <f88313c0> f8a313c8 7c942ba6 7cbc2ba6
> 
> This fixes the problem by only changing r3 when we are returning
> immediately.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Reported-by: Cédric Le Goater <clg@kaod.org>
> --
> mpe: This is for 5.2 fixes

Then your commit log should include the following:

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")

Christophe

> ---
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 139027c62d..f781ee1458 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -2519,8 +2519,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>   	LOAD_REG_ADDR(r11, dawr_force_enable)
>   	lbz	r11, 0(r11)
>   	cmpdi	r11, 0
> +	bne	3f
>   	li	r3, H_HARDWARE
> -	beqlr
> +	blr
> +3:
>   	/* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests */
>   	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
>   	rlwimi	r5, r4, 2, DAWRX_WT
> 
