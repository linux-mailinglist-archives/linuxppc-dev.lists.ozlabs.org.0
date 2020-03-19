Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31B18C3D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 00:37:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k3Gl5q3lzDrR4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:37:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k3Cm2NMSzDr2g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:34:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=JLw5Bf2l; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48k3Cl6L5Pz9sRR; Fri, 20 Mar 2020 10:34:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1584660883; bh=bI5LvCGbrAoYB82LqosEezq49/UH4Fui+Pzf7o8WFTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JLw5Bf2l/qyIU24WY9TXwmdvzR7PvhZxlYTXC3AU9mAbTUMjhXHZkO6ty6SoOLICQ
 Xu/gS2IrlpSW1BvUgwD2NoWMami18Yb6+bXOdV7hTYzIM3d1OT7trwy/h+McaCykk9
 ylRyugYHTtPcaKdXJo3YqVj5ZFHwECpQ2QgcY/edgevrNF1vdeLvb1HuAw3nl/6Ds/
 9FLHwRXc+T8M+Iyux2No/2yoZS8BfjT03HEm7EeXai36NRTetOIb9UGRx3FE0wlN3F
 MPfyTkulJPOMKxDi8XwtgtgaVO3L4SwhHHktruzso6rG8ZmErKHiEILdL/X8hDeI4Q
 6Hlpc3ZlYCkjg==
Date: Fri, 20 Mar 2020 10:32:20 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Gustavo Romero <gromero@linux.ibm.com>
Subject: Re: [PATCH v3] KVM: PPC: Book3S HV: Treat TM-related invalid form
 instructions on P9 like the valid ones
Message-ID: <20200319233220.GC3260@blackberry>
References: <20200221162950.132860-1-gromero@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221162950.132860-1-gromero@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: leonardo@linux.ibm.com, mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 21, 2020 at 11:29:50AM -0500, Gustavo Romero wrote:
> On P9 DD2.2 due to a CPU defect some TM instructions need to be emulated by
> KVM. This is handled at first by the hardware raising a softpatch interrupt
> when certain TM instructions that need KVM assistance are executed in the
> guest. Althought some TM instructions per Power ISA are invalid forms they
> can raise a softpatch interrupt too. For instance, 'tresume.' instruction
> as defined in the ISA must have bit 31 set (1), but an instruction that
> matches 'tresume.' PO and XO opcode fields but has bit 31 not set (0), like
> 0x7cfe9ddc, also raises a softpatch interrupt. Similarly for 'treclaim.'
> and 'trechkpt.' instructions with bit 31 = 0, i.e. 0x7c00075c and
> 0x7c0007dc, respectively. Hence, if a code like the following is executed
> in the guest it will raise a softpatch interrupt just like a 'tresume.'
> when the TM facility is enabled ('tabort. 0' in the example is used only
> to enable the TM facility):
> 
> int main() { asm("tabort. 0; .long 0x7cfe9ddc;"); }
> 
> Currently in such a case KVM throws a complete trace like:
> 
> [345523.705984] WARNING: CPU: 24 PID: 64413 at arch/powerpc/kvm/book3s_hv_tm.c:211 kvmhv_p9_tm_emulation+0x68/0x620 [kvm_hv]
> [345523.705985] Modules linked in: kvm_hv(E) xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat
> iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter
> ip6_tables iptable_filter bridge stp llc sch_fq_codel ipmi_powernv at24 vmx_crypto ipmi_devintf ipmi_msghandler
> ibmpowernv uio_pdrv_genirq kvm opal_prd uio leds_powernv ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp
> libiscsi scsi_transport_iscsi ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx libcrc32c xor raid6_pq raid1 raid0 multipath linear tg3
> crct10dif_vpmsum crc32c_vpmsum ipr [last unloaded: kvm_hv]
> [345523.706030] CPU: 24 PID: 64413 Comm: CPU 0/KVM Tainted: G        W   E     5.5.0+ #1
> [345523.706031] NIP:  c0080000072cb9c0 LR: c0080000072b5e80 CTR: c0080000085c7850
> [345523.706034] REGS: c000000399467680 TRAP: 0700   Tainted: G        W   E      (5.5.0+)
> [345523.706034] MSR:  900000010282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 24022428  XER: 00000000
> [345523.706042] CFAR: c0080000072b5e7c IRQMASK: 0
>                 GPR00: c0080000072b5e80 c000000399467910 c0080000072db500 c000000375ccc720
>                 GPR04: c000000375ccc720 00000003fbec0000 0000a10395dda5a6 0000000000000000
>                 GPR08: 000000007cfe9ddc 7cfe9ddc000005dc 7cfe9ddc7c0005dc c0080000072cd530
>                 GPR12: c0080000085c7850 c0000003fffeb800 0000000000000001 00007dfb737f0000
>                 GPR16: c0002001edcca558 0000000000000000 0000000000000000 0000000000000001
>                 GPR20: c000000001b21258 c0002001edcca558 0000000000000018 0000000000000000
>                 GPR24: 0000000001000000 ffffffffffffffff 0000000000000001 0000000000001500
>                 GPR28: c0002001edcc4278 c00000037dd80000 800000050280f033 c000000375ccc720
> [345523.706062] NIP [c0080000072cb9c0] kvmhv_p9_tm_emulation+0x68/0x620 [kvm_hv]
> [345523.706065] LR [c0080000072b5e80] kvmppc_handle_exit_hv.isra.53+0x3e8/0x798 [kvm_hv]
> [345523.706066] Call Trace:
> [345523.706069] [c000000399467910] [c000000399467940] 0xc000000399467940 (unreliable)
> [345523.706071] [c000000399467950] [c000000399467980] 0xc000000399467980
> [345523.706075] [c0000003994679f0] [c0080000072bd1c4] kvmhv_run_single_vcpu+0xa1c/0xb80 [kvm_hv]
> [345523.706079] [c000000399467ac0] [c0080000072bd8e0] kvmppc_vcpu_run_hv+0x5b8/0xb00 [kvm_hv]
> [345523.706087] [c000000399467b90] [c0080000085c93cc] kvmppc_vcpu_run+0x34/0x48 [kvm]
> [345523.706095] [c000000399467bb0] [c0080000085c582c] kvm_arch_vcpu_ioctl_run+0x244/0x420 [kvm]
> [345523.706101] [c000000399467c40] [c0080000085b7498] kvm_vcpu_ioctl+0x3d0/0x7b0 [kvm]
> [345523.706105] [c000000399467db0] [c0000000004adf9c] ksys_ioctl+0x13c/0x170
> [345523.706107] [c000000399467e00] [c0000000004adff8] sys_ioctl+0x28/0x80
> [345523.706111] [c000000399467e20] [c00000000000b278] system_call+0x5c/0x68
> [345523.706112] Instruction dump:
> [345523.706114] 419e0390 7f8a4840 409d0048 6d497c00 2f89075d 419e021c 6d497c00 2f8907dd
> [345523.706119] 419e01c0 6d497c00 2f8905dd 419e00a4 <0fe00000> 38210040 38600000 ebc1fff0
> 
> and then treats the executed instruction as a 'nop'.
> 
> However the POWER9 User's Manual, in section "4.6.10 Book II Invalid
> Forms", informs that for TM instructions bit 31 is in fact ignored, thus
> for the TM-related invalid forms ignoring bit 31 and handling them like the
> valid forms is an acceptable way to handle them. POWER8 behaves the same
> way too.
> 
> This commit changes the handling of the cases here described by treating
> the TM-related invalid forms that can generate a softpatch interrupt
> just like their valid forms (w/ bit 31 = 1) instead of as a 'nop' and by
> gently reporting any other unrecognized case to the host and treating it as
> illegal instruction instead of throwing a trace and treating it as a 'nop'.
> 
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> Acked-By: Michael Neuling <mikey@neuling.org>
> Reviewed-by: Leonardo Bras <leonardo@linux.ibm.com>

Thanks, applied to my kvm-ppc-next branch.

Paul.
