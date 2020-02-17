Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B51BE16079A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 02:08:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LQqD0xLjzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 12:08:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LQnc0QJfzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 12:07:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=R7SjS+hb; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48LQnb69zTz9sRR;
 Mon, 17 Feb 2020 12:07:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581901651;
 bh=WEcfIDVJGfgJza321c+Rz8OPuNVAg2LyKvpfwGHblIw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=R7SjS+hbI1lLJju7KtVeEZiKINXq2oLRXVIUuFuSLQfUL2C1k9bFsPGg+wCDyF4aC
 H8rr4U6P2Phdl/R6Yqt2ggMduNWb5UQWAIR4pinwQj3cQgvQcWQVm3zxvLEz/1qy8p
 O7MWRtAa5GTF3b5I3YwdKJrVGb/X2cNpLB8g5a5JAEtNd/Uf19B4SUzlYPCaH0Lorr
 mDxCqiNUt49a78sVZCqVhBpOewW5BsSWz/BfQzooOrHqzEy7k5DWuk/71J5bS1UEB9
 nc9cShomC3gOFQe1kX9q3wO2c8NtTly2KNymH+X0D3XREITosA2ppwFVdblffoLaYO
 OBNNoZMpPS3dQ==
Received: by neuling.org (Postfix, from userid 1000)
 id CA23F2C01FE; Mon, 17 Feb 2020 12:07:31 +1100 (AEDT)
Message-ID: <29b136e15c2f04f783b54ec98552d1a6009234db.camel@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
From: Michael Neuling <mikey@neuling.org>
To: Gustavo Romero <gromero@linux.ibm.com>, kvm-ppc@vger.kernel.org, 
 paulus@ozlabs.org
Date: Mon, 17 Feb 2020 12:07:31 +1100
In-Reply-To: <20200213151532.12559-1-gromero@linux.ibm.com>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-13 at 10:15 -0500, Gustavo Romero wrote:
> On P9 DD2.2 due to a CPU defect some TM instructions need to be emulated =
by
> KVM. This is handled at first by the hardware raising a softpatch interru=
pt
> when certain TM instructions that need KVM assistance are executed in the
> guest. Some TM instructions, although not defined in the Power ISA, might
> raise a softpatch interrupt. For instance, 'tresume.' instruction as
> defined in the ISA must have bit 31 set (1), but an instruction that
> matches 'tresume.' OP and XO opcodes but has bit 31 not set (0), like
> 0x7cfe9ddc, also raises a softpatch interrupt, for example, if a code
> like the following is executed in the guest it will raise a softpatch
> interrupt just like a 'tresume.' when the TM facility is enabled:
>=20
> int main() { asm("tabort. 0; .long 0x7cfe9ddc;"); }
>=20
> Currently in such a case KVM throws a complete trace like the following:
>=20
> [345523.705984] WARNING: CPU: 24 PID: 64413 at arch/powerpc/kvm/book3s_hv=
_tm.c:211 kvmhv_p9_tm_emulation+0x68/0x620 [kvm_hv]
> [345523.705985] Modules linked in: kvm_hv(E) xt_conntrack ipt_REJECT nf_r=
eject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat
> iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_i=
pv4 ebtable_filter ebtables ip6table_filter
> ip6_tables iptable_filter bridge stp llc sch_fq_codel ipmi_powernv at24 v=
mx_crypto ipmi_devintf ipmi_msghandler
> ibmpowernv uio_pdrv_genirq kvm opal_prd uio leds_powernv ib_iser rdma_cm =
iw_cm ib_cm ib_core iscsi_tcp libiscsi_tcp
> libiscsi scsi_transport_iscsi ip_tables x_tables autofs4 btrfs blake2b_ge=
neric zstd_compress raid10 raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx libcrc32c xor =
raid6_pq raid1 raid0 multipath linear tg3
> crct10dif_vpmsum crc32c_vpmsum ipr [last unloaded: kvm_hv]
> [345523.706030] CPU: 24 PID: 64413 Comm: CPU 0/KVM Tainted: G        W   =
E     5.5.0+ #1
> [345523.706031] NIP:  c0080000072cb9c0 LR: c0080000072b5e80 CTR: c0080000=
085c7850
> [345523.706034] REGS: c000000399467680 TRAP: 0700   Tainted: G        W  =
 E      (5.5.0+)
> [345523.706034] MSR:  900000010282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,L=
E,TM[E]>  CR: 24022428  XER: 00000000
> [345523.706042] CFAR: c0080000072b5e7c IRQMASK: 0
>                 GPR00: c0080000072b5e80 c000000399467910 c0080000072db500=
 c000000375ccc720
>                 GPR04: c000000375ccc720 00000003fbec0000 0000a10395dda5a6=
 0000000000000000
>                 GPR08: 000000007cfe9ddc 7cfe9ddc000005dc 7cfe9ddc7c0005dc=
 c0080000072cd530
>                 GPR12: c0080000085c7850 c0000003fffeb800 0000000000000001=
 00007dfb737f0000
>                 GPR16: c0002001edcca558 0000000000000000 0000000000000000=
 0000000000000001
>                 GPR20: c000000001b21258 c0002001edcca558 0000000000000018=
 0000000000000000
>                 GPR24: 0000000001000000 ffffffffffffffff 0000000000000001=
 0000000000001500
>                 GPR28: c0002001edcc4278 c00000037dd80000 800000050280f033=
 c000000375ccc720
> [345523.706062] NIP [c0080000072cb9c0] kvmhv_p9_tm_emulation+0x68/0x620 [=
kvm_hv]
> [345523.706065] LR [c0080000072b5e80] kvmppc_handle_exit_hv.isra.53+0x3e8=
/0x798 [kvm_hv]
> [345523.706066] Call Trace:
> [345523.706069] [c000000399467910] [c000000399467940] 0xc000000399467940 =
(unreliable)
> [345523.706071] [c000000399467950] [c000000399467980] 0xc000000399467980
> [345523.706075] [c0000003994679f0] [c0080000072bd1c4] kvmhv_run_single_vc=
pu+0xa1c/0xb80 [kvm_hv]
> [345523.706079] [c000000399467ac0] [c0080000072bd8e0] kvmppc_vcpu_run_hv+=
0x5b8/0xb00 [kvm_hv]
> [345523.706087] [c000000399467b90] [c0080000085c93cc] kvmppc_vcpu_run+0x3=
4/0x48 [kvm]
> [345523.706095] [c000000399467bb0] [c0080000085c582c] kvm_arch_vcpu_ioctl=
_run+0x244/0x420 [kvm]
> [345523.706101] [c000000399467c40] [c0080000085b7498] kvm_vcpu_ioctl+0x3d=
0/0x7b0 [kvm]
> [345523.706105] [c000000399467db0] [c0000000004adf9c] ksys_ioctl+0x13c/0x=
170
> [345523.706107] [c000000399467e00] [c0000000004adff8] sys_ioctl+0x28/0x80
> [345523.706111] [c000000399467e20] [c00000000000b278] system_call+0x5c/0x=
68
> [345523.706112] Instruction dump:
> [345523.706114] 419e0390 7f8a4840 409d0048 6d497c00 2f89075d 419e021c 6d4=
97c00 2f8907dd
> [345523.706119] 419e01c0 6d497c00 2f8905dd 419e00a4 <0fe00000> 38210040 3=
8600000 ebc1fff0
>=20
> and then treats the executed instruction as 'nop' whilst it should actual=
ly
> be treated as an illegal instruction since it's not defined by the ISA.

The ISA has this:=20

   1.3.3 Reserved Fields, Reserved Values, and Reserved SPRs

   Reserved fields in instructions are ignored by the pro-
   cessor.

Hence the hardware will ignore reserved bits. For example executing your li=
ttle
program on P8 just exits normally with 0x7cfe9ddc being executed as a NOP.

Hence, we should NOP this, not generate an illegal.

Mikey

> This commit changes the handling of the case above by treating the
> unrecognized TM instructions that can raise a softpatch but are not
> defined in the ISA as illegal ones instead of as 'nop' and by gently
> reporting it to the host instead of throwing a trace.
>=20
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_tm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv=
_tm.c
> index 0db937497169..d342a9e11298 100644
> --- a/arch/powerpc/kvm/book3s_hv_tm.c
> +++ b/arch/powerpc/kvm/book3s_hv_tm.c
> @@ -3,6 +3,8 @@
>   * Copyright 2017 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
>   */
> =20
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kvm_host.h>
> =20
>  #include <asm/kvm_ppc.h>
> @@ -208,6 +210,8 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>  	}
> =20
>  	/* What should we do here? We didn't recognize the instruction */
> -	WARN_ON_ONCE(1);
> +	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
> +	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulat=
ion", instr);
> +
>  	return RESUME_GUEST;
>  }

