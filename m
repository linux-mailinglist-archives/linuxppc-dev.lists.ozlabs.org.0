Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DC3C755
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 11:38:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NQ1Q6YkJzDqbl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 19:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NPzL1FWvzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 19:37:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="uL5paWsi"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45NPzK1RtZz9sDX;
 Tue, 11 Jun 2019 19:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1560245821;
 bh=QKFwgdieD6NDn1b6ANc4id5d+ZhAS5pp6dHmKguZogY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=uL5paWsi726mK1nmBT5BfoZsEBdB39Ydc/nCPSuFvsIl9hw0wvUvvgcsNoaPBesBI
 j0/w5BBZHAhi8wvGLj8pvYxvfRyLBq1Tpm15pwWWO30hsb3jQ1lTRhVn8To4SC8/F0
 jqiej6G+aaKk1dgu5hu59p5nXGcfrv8Z/bk3vM4NiIscDHslNoprbZu2exPlURm8wN
 ZmPAEEl2M4PGVHh4B3ALWZNgowXvAw77JhSauBRwY1Ygz/0SNulaROsA8mbKwrjhvZ
 Uf9NzjWuLrsxw1nCCevMZcPtwVLyewwB6GkAH0BspAdS2/vTKeefqt72JtrnoiiJfh
 ROzipwiSmUcjw==
Received: by neuling.org (Postfix, from userid 1000)
 id 125BC2A0E2F; Tue, 11 Jun 2019 19:37:01 +1000 (AEST)
Message-ID: <7f8b0ca2feeac035a36ef88291602bede72e213c.camel@neuling.org>
Subject: Re: [PATCH v2] powerpc: Add force enable of DAWR on P9 option
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>, mpe@ellerman.id.au
Date: Tue, 11 Jun 2019 19:37:00 +1000
In-Reply-To: <4ebaff61-2e7e-e038-71c3-a7ae662b56f4@c-s.fr>
References: <20190401060312.22670-1-mikey@neuling.org>
 <68f4f99d-4bb7-7d25-1e68-96c65dfbfbe9@kaod.org>
 <287ab7092cc6128e1c0d25f6245eb5f1706c6cb0.camel@neuling.org>
 <dc9106e8-422f-5582-e463-def38902f03a@kaod.org>
 <5d4cdec0f11e1d47b196b068fcd9fdb107f147b0.camel@neuling.org>
 <4ebaff61-2e7e-e038-71c3-a7ae662b56f4@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, Cameron Kaiser <spectre@floodgap.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-11 at 09:51 +0200, Christophe Leroy wrote:
>=20
> Le 11/06/2019 =C3=A0 09:24, Michael Neuling a =C3=A9crit :
> > On Tue, 2019-06-11 at 08:48 +0200, C=C3=A9dric Le Goater wrote:
> > > On 11/06/2019 08:44, Michael Neuling wrote:
> > > > > >   2:
> > > > > > -BEGIN_FTR_SECTION
> > > > > > -	/* POWER9 with disabled DAWR */
> > > > > > +	LOAD_REG_ADDR(r11, dawr_force_enable)
> > > > > > +	lbz	r11, 0(r11)
> > > > > > +	cmpdi	r11, 0
> > > > > >   	li	r3, H_HARDWARE
> > > > > > -	blr
> > > > > > -END_FTR_SECTION_IFCLR(CPU_FTR_DAWR)
> > > > > > +	beqlr
> > > > >=20
> > > > > Why is this a 'beqlr' ? Shouldn't it be a blr ?
> > > >=20
> > > > I believe it's right and should be a beqlr.  It's to replace the FT=
R
> > > > section to
> > > > make it dynamic based on the dawr_force_enable bit.
> > >=20
> > > hmm, see the crash below on a L1 running a nested guest. r3 is set
> > > to -1 (H_HARDWARE) but a vpcu pointer was expected. How can we fix
> > > this ?
> > >=20
> > > C.
> > >=20
> > >=20
> > > [   44.374746] BUG: Kernel NULL pointer dereference at 0x000013bf
> > > [   44.374848] Faulting instruction address: 0xc00000000010b044
> > > [   44.374906] Oops: Kernel access of bad area, sig: 11 [#1]
> > > [   44.374951] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=
=3D2048 NUMA
> > > pSeries
> > > [   44.375018] Modules linked in: vhost_net vhost tap xt_CHECKSUM
> > > iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_connt=
rack
> > > nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4
> > > xt_tcpudp bridge stp llc ebtable_filter ebtables ip6table_filter
> > > ip6_tables iptable_filter bpfilter vmx_crypto crct10dif_vpmsum
> > > crc32c_vpmsum kvm_hv kvm sch_fq_codel ip_tables x_tables autofs4
> > > virtio_net net_failover virtio_scsi failover
> > > [   44.375401] CPU: 8 PID: 1771 Comm: qemu-system-ppc Kdump: loaded N=
ot
> > > tainted 5.2.0-rc4+ #3
> > > [   44.375500] NIP:  c00000000010b044 LR: c0080000089dacf4 CTR:
> > > c00000000010aff4
> > > [   44.375604] REGS: c00000179b397710 TRAP: 0300   Not tainted  (5.2.=
0-
> > > rc4+)
> > > [   44.375691] MSR:  800000000280b033
> > > <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42244842  XER: 00000000
> > > [   44.375815] CFAR: c00000000010aff8 DAR: 00000000000013bf DSISR:
> > > 42000000 IRQMASK: 0
> > > [   44.375815] GPR00: c0080000089dd6bc c00000179b3979a0 c008000008a04=
300
> > > ffffffffffffffff
> > > [   44.375815] GPR04: 0000000000000000 0000000000000003 000000002444b=
05d
> > > c0000017f11c45d0
> > > [   44.375815] GPR08: 078000003e018dfe 0000000000000028 0000000000000=
001
> > > 0000000000000075
> > > [   44.375815] GPR12: c00000000010aff4 c000000007ff6300 0000000000000=
000
> > > 0000000000000000
> > > [   44.375815] GPR16: 0000000000000000 c0000017f11d0000 00000000fffff=
fff
> > > c0000017f11ca7a8
> > > [   44.375815] GPR20: c0000017f11c42ec ffffffffffffffff 0000000000000=
000
> > > 000000000000000a
> > > [   44.375815] GPR24: fffffffffffffffc 0000000000000000 c0000017f11c0=
000
> > > c000000001a77ed8
> > > [   44.375815] GPR28: c00000179af70000 fffffffffffffffc c0080000089ff=
170
> > > c00000179ae88540
> > > [   44.376673] NIP [c00000000010b044] kvmppc_h_set_dabr+0x50/0x68
> > > [   44.376754] LR [c0080000089dacf4] kvmppc_pseries_do_hcall+0xa3c/0x=
eb0
> > > [kvm_hv]
> > > [   44.376849] Call Trace:
> > > [   44.376886] [c00000179b3979a0] [c0000017f11c0000] 0xc0000017f11c00=
00
> > > (unreliable)
> > > [   44.376982] [c00000179b397a10] [c0080000089dd6bc]
> > > kvmppc_vcpu_run_hv+0x694/0xec0 [kvm_hv]
> > > [   44.377084] [c00000179b397ae0] [c0080000093f8bcc]
> > > kvmppc_vcpu_run+0x34/0x48 [kvm]
> > > [   44.377185] [c00000179b397b00] [c0080000093f522c]
> > > kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
> > > [   44.377286] [c00000179b397b90] [c0080000093e3618]
> > > kvm_vcpu_ioctl+0x460/0x850 [kvm]
> > > [   44.377384] [c00000179b397d00] [c0000000004ba6c4]
> > > do_vfs_ioctl+0xe4/0xb40
> > > [   44.377464] [c00000179b397db0] [c0000000004bb1e4] ksys_ioctl+0xc4/=
0x110
> > > [   44.377547] [c00000179b397e00] [c0000000004bb258] sys_ioctl+0x28/0=
x80
> > > [   44.377628] [c00000179b397e20] [c00000000000b888] system_call+0x5c=
/0x70
> > > [   44.377712] Instruction dump:
> > > [   44.377765] 4082fff4 4c00012c 38600000 4e800020 e96280c0 896b0000
> > > 2c2b0000 3860ffff
> > > [   44.377862] 4d820020 50852e74 508516f6 78840724 <f88313c0> f8a313c=
8
> > > 7c942ba6 7cbc2ba6
> >=20
> > Opps, it's because I corrupted r3 :-(
> >=20
> > Does this fix it?
> >=20
> >=20
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index 139027c62d..f781ee1458 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -2519,8 +2519,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >   	LOAD_REG_ADDR(r11, dawr_force_enable)
> >   	lbz	r11, 0(r11)
> >   	cmpdi	r11, 0
> > +	bne	3f
> >   	li	r3, H_HARDWARE
> > -	beqlr
> > +	blr
> > +3:
>=20
> Or you could copy r3 into another unused volatile register and use it=20
> instead of r3 below.

r3 is the vcpu pointer passed in. Changing to a different register will mak=
e the
code harder to follow IMHO.

Plus this is a much clearer fix.

So I don't think I'll do that.

Mikey

>=20
> Christophe
>=20
>=20
> >   	/* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests */
> >   	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
> >   	rlwimi	r5, r4, 2, DAWRX_WT
> >=20

