Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B086C431F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 02:17:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PPT40RkmzDr7K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 10:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PPRL2dQrzDr1K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 10:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="KWKkF9TA"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45PPRK1d9lz9sBb;
 Thu, 13 Jun 2019 10:16:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560384973;
 bh=JMi7n0zVpbdlLtQDdpfoNOYAYLyXt+AvQEctm5CSw60=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KWKkF9TALnuQK57Suiq/HrpB9jDn794dBudyFDz+8+H3hLTVb84MCI6I9WOZaFlKs
 phQy8zb2xseMJG2SAMzSqDyAdwAB/OcKAjFp6cFoOAvGOukVuvMeqIAk9Ewd0z1g5v
 saK4ZcHJgUaND+jAjZ2r/4cksfjgz4ia3GWciracqEL2MEL2rTrkmYkIHbSfY5M6qi
 DsnjkwiH1YcrXMYDldsxHqU98+38fHbm1WqCqnuEM9sNm3wQKGyi6p2EhIXtY9hEQz
 kfT6ep7qhGrDWGhfBYKaI7WVwucqJ+BBdqjvdrwG59Zr0TRGAlizuBQZVeqkLxVwUg
 3/yUq1QsAVK9g==
Received: by neuling.org (Postfix, from userid 1000)
 id 2CA5F2A0E2F; Thu, 13 Jun 2019 10:16:13 +1000 (AEST)
Message-ID: <605bc6844ebb0ce2bf9dea906b707359500ceb4f.camel@neuling.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()
From: Michael Neuling <mikey@neuling.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, mpe@ellerman.id.au
Date: Thu, 13 Jun 2019 10:16:13 +1000
In-Reply-To: <c648ec86-8af6-c61f-b430-8e4f7f19225d@kaod.org>
References: <20190612072229.15832-1-mikey@neuling.org>
 <c648ec86-8af6-c61f-b430-8e4f7f19225d@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Suraj Jitindar Singh <surajjs@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 09:43 +0200, C=C3=A9dric Le Goater wrote:
> On 12/06/2019 09:22, Michael Neuling wrote:
> > In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> > option") I screwed up some assembler and corrupted a pointer in
> > r3. This resulted in crashes like the below from C=C3=A9dric:
> >=20
> >   [   44.374746] BUG: Kernel NULL pointer dereference at 0x000013bf
> >   [   44.374848] Faulting instruction address: 0xc00000000010b044
> >   [   44.374906] Oops: Kernel access of bad area, sig: 11 [#1]
> >   [   44.374951] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=
=3D2048 NUMA pSeries
> >   [   44.375018] Modules linked in: vhost_net vhost tap xt_CHECKSUM ipt=
able_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_d=
efrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp bri=
dge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filt=
er bpfilter vmx_crypto crct10dif_vpmsum crc32c_vpmsum kvm_hv kvm sch_fq_cod=
el ip_tables x_tables autofs4 virtio_net net_failover virtio_scsi failover
> >   [   44.375401] CPU: 8 PID: 1771 Comm: qemu-system-ppc Kdump: loaded N=
ot tainted 5.2.0-rc4+ #3
> >   [   44.375500] NIP:  c00000000010b044 LR: c0080000089dacf4 CTR: c0000=
0000010aff4
> >   [   44.375604] REGS: c00000179b397710 TRAP: 0300   Not tainted  (5.2.=
0-rc4+)
> >   [   44.375691] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,L=
E>  CR: 42244842  XER: 00000000
> >   [   44.375815] CFAR: c00000000010aff8 DAR: 00000000000013bf DSISR: 42=
000000 IRQMASK: 0
> >   [   44.375815] GPR00: c0080000089dd6bc c00000179b3979a0 c008000008a04=
300 ffffffffffffffff
> >   [   44.375815] GPR04: 0000000000000000 0000000000000003 000000002444b=
05d c0000017f11c45d0
> >   [   44.375815] GPR08: 078000003e018dfe 0000000000000028 0000000000000=
001 0000000000000075
> >   [   44.375815] GPR12: c00000000010aff4 c000000007ff6300 0000000000000=
000 0000000000000000
> >   [   44.375815] GPR16: 0000000000000000 c0000017f11d0000 00000000fffff=
fff c0000017f11ca7a8
> >   [   44.375815] GPR20: c0000017f11c42ec ffffffffffffffff 0000000000000=
000 000000000000000a
> >   [   44.375815] GPR24: fffffffffffffffc 0000000000000000 c0000017f11c0=
000 c000000001a77ed8
> >   [   44.375815] GPR28: c00000179af70000 fffffffffffffffc c0080000089ff=
170 c00000179ae88540
> >   [   44.376673] NIP [c00000000010b044] kvmppc_h_set_dabr+0x50/0x68
> >   [   44.376754] LR [c0080000089dacf4] kvmppc_pseries_do_hcall+0xa3c/0x=
eb0 [kvm_hv]
> >   [   44.376849] Call Trace:
> >   [   44.376886] [c00000179b3979a0] [c0000017f11c0000] 0xc0000017f11c00=
00 (unreliable)
> >   [   44.376982] [c00000179b397a10] [c0080000089dd6bc] kvmppc_vcpu_run_=
hv+0x694/0xec0 [kvm_hv]
> >   [   44.377084] [c00000179b397ae0] [c0080000093f8bcc] kvmppc_vcpu_run+=
0x34/0x48 [kvm]
> >   [   44.377185] [c00000179b397b00] [c0080000093f522c] kvm_arch_vcpu_io=
ctl_run+0x2f4/0x400 [kvm]
> >   [   44.377286] [c00000179b397b90] [c0080000093e3618] kvm_vcpu_ioctl+0=
x460/0x850 [kvm]
> >   [   44.377384] [c00000179b397d00] [c0000000004ba6c4] do_vfs_ioctl+0xe=
4/0xb40
> >   [   44.377464] [c00000179b397db0] [c0000000004bb1e4] ksys_ioctl+0xc4/=
0x110
> >   [   44.377547] [c00000179b397e00] [c0000000004bb258] sys_ioctl+0x28/0=
x80
> >   [   44.377628] [c00000179b397e20] [c00000000000b888] system_call+0x5c=
/0x70
> >   [   44.377712] Instruction dump:
> >   [   44.377765] 4082fff4 4c00012c 38600000 4e800020 e96280c0 896b0000 =
2c2b0000 3860ffff
> >   [   44.377862] 4d820020 50852e74 508516f6 78840724 <f88313c0> f8a313c=
8 7c942ba6 7cbc2ba6
> >=20
> > This fixes the problem by only changing r3 when we are returning
> > immediately.
> >=20
> > Signed-off-by: Michael Neuling <mikey@neuling.org>
> > Reported-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> On nested, I still see :=20
>=20
> [   94.609274] Oops: Exception in kernel mode, sig: 4 [#1]
> [   94.609432] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D20=
48 NUMA pSeries
> [   94.609596] Modules linked in: vhost_net vhost tap xt_CHECKSUM iptable=
_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defra=
g_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp bridge =
stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter b=
pfilter vmx_crypto kvm_hv crct10dif_vpmsum crc32c_vpmsum kvm sch_fq_codel i=
p_tables x_tables autofs4 virtio_net virtio_scsi net_failover failover
> [   94.610179] CPU: 12 PID: 2026 Comm: qemu-system-ppc Kdump: loaded Not =
tainted 5.2.0-rc4+ #6
> [   94.610290] NIP:  c00000000010b050 LR: c008000008bbacf4 CTR: c00000000=
010aff4
> [   94.610400] REGS: c0000017913d7710 TRAP: 0700   Not tainted  (5.2.0-rc=
4+)
> [   94.610493] MSR:  800000000284b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 42224842  XER: 00000000
> [   94.610671] CFAR: c00000000010b030 IRQMASK: 0=20
> [   94.610671] GPR00: c008000008bbd6bc c0000017913d79a0 c008000008be4300 =
c000001791376220=20
> [   94.610671] GPR04: 0000000000000000 0000000000000003 00000000f679892e =
c0000017911045d0=20
> [   94.610671] GPR08: 078000003e018dfe 0000000000000028 0000000000000001 =
0000000000000075=20
> [   94.610671] GPR12: c00000000010aff4 c000000007ff1300 0000000000000000 =
0000000000000000=20
> [   94.610671] GPR16: 0000000000000000 c000001791110000 00000000ffffffff =
c00000179110a7a8=20
> [   94.610671] GPR20: c0000017911042ec ffffffffffffffff 0000000000000000 =
000000000000000a=20
> [   94.610671] GPR24: fffffffffffffffc 0000000000000000 c000001791100000 =
c000000001a77ed8=20
> [   94.610671] GPR28: c0000017925d0000 fffffffffffffffc c008000008bdf170 =
c000001791376220=20
> [   94.611818] NIP [c00000000010b050] kvmppc_h_set_dabr+0x5c/0x6c
> [   94.611932] LR [c008000008bbacf4] kvmppc_pseries_do_hcall+0xa3c/0xeb0 =
[kvm_hv]
> [   94.612064] Call Trace:
> [   94.612115] [c0000017913d79a0] [c000001791100000] 0xc000001791100000 (=
unreliable)
> [   94.612252] [c0000017913d7a10] [c008000008bbd6bc] kvmppc_vcpu_run_hv+0=
x694/0xec0 [kvm_hv]
> [   94.612394] [c0000017913d7ae0] [c0080000091e8bcc] kvmppc_vcpu_run+0x34=
/0x48 [kvm]
> [   94.612536] [c0000017913d7b00] [c0080000091e522c] kvm_arch_vcpu_ioctl_=
run+0x2f4/0x400 [kvm]
> [   94.612674] [c0000017913d7b90] [c0080000091d3618] kvm_vcpu_ioctl+0x460=
/0x850 [kvm]
> [   94.612821] [c0000017913d7d00] [c0000000004ba6d4] do_vfs_ioctl+0xe4/0x=
b40
> [   94.612935] [c0000017913d7db0] [c0000000004bb1f4] ksys_ioctl+0xc4/0x11=
0
> [   94.613051] [c0000017913d7e00] [c0000000004bb268] sys_ioctl+0x28/0x80
> [   94.613160] [c0000017913d7e20] [c00000000000b888] system_call+0x5c/0x7=
0
> [   94.613267] Instruction dump:
> [   94.613335] 4e800020 e96280c0 896b0000 2c2b0000 4082000c 3860ffff 4e80=
0020 50852e74=20
> [   94.613470] 508516f6 78840724 f88313c0 f8a313c8 <7c942ba6> 7cbc2ba6 38=
600000 4e800020=20
>=20
>=20
> Here is the asm dump:
>=20
>=20
> 3:
>         /* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests =
*/
>         rlwimi  r5, r4, 5, DAWRX_DR | DAWRX_DW
> c00000000010b03c:       74 2e 85 50     rlwimi  r5,r4,5,25,26
>         rlwimi  r5, r4, 2, DAWRX_WT
> c00000000010b040:       f6 16 85 50     rlwimi  r5,r4,2,27,27
>         clrrdi  r4, r4, 3
> c00000000010b044:       24 07 84 78     rldicr  r4,r4,0,60
>         std     r4, VCPU_DAWR(r3)
> c00000000010b048:       c0 13 83 f8     std     r4,5056(r3)
>         std     r5, VCPU_DAWRX(r3)
> c00000000010b04c:       c8 13 a3 f8     std     r5,5064(r3)
>         mtspr   SPRN_DAWR, r4
> c00000000010b050:       a6 2b 94 7c     mtspr   180,r4
>         mtspr   SPRN_DAWRX, r5
> c00000000010b054:       a6 2b bc 7c     mtspr   188,r5
>         li      r3, 0
> c00000000010b058:       00 00 60 38     li      r3,0
>         blr
> c00000000010b05c:       20 00 80 4e     blr

It's the `mtspr   SPRN_DAWR, r4` as you're HV=3D0.  I'm not sure how nested=
 works
in that regard. Is the level above suppose to trap and emulate that? =20

I'm surprised that's changed by this patch.

Mikey


>=20
> C.
>=20
>=20
> > --
> > mpe: This is for 5.2 fixes
> > ---
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index 139027c62d..f781ee1458 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -2519,8 +2519,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >  	LOAD_REG_ADDR(r11, dawr_force_enable)
> >  	lbz	r11, 0(r11)
> >  	cmpdi	r11, 0
> > +	bne	3f
> >  	li	r3, H_HARDWARE
> > -	beqlr
> > +	blr
> > +3:
> >  	/* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests */
> >  	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
> >  	rlwimi	r5, r4, 2, DAWRX_WT
> >=20

