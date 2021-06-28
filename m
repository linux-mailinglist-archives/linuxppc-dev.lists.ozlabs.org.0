Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8603B61E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD9FX6QV8z3bbC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 00:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YWw9FwOV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YWw9FwOV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD9F43kqbz30B4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:37:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SEX8WU051443
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=iyIlRUJV/wAI5Wp4hPuSKkIgVQiCnZ6lQKRlGRrQep0=;
 b=YWw9FwOVWO5YP6w1bf8fmQp9FMj3wrXt/otXFn6apq6CSF/dhY3Z4mvCrv6FySVs8w+V
 z5ImtUSpKqeqghYvn9pmy0EonjBQEwsU2x5F6UfhTVHxszi1S0Ie0+Tx/n5ACRENP2G1
 9VZJgboWGb0Kn7mpWBBZe1XvAZwg+cK3ovgZwMIFLMuRKh3Ly6n5dwwEWpTEG+s5hjgE
 f3YOykQ0V56Cw1DRu4rBve+uG3fOAvdDARE/ddp2Smmk0XJUdWhxHqWTvQ3SaBqAmU3q
 7dmfzT0Vwra9oQJgZ7pLIC+bkxbAJ0jVCC4NdIXx1WEXauRQQQnxmF12DhcOAjwdlXdk eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fg2k8mt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:37:41 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SEXC1K051848
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 10:37:41 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fg2k8mrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:37:40 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SEaPAE023314;
 Mon, 28 Jun 2021 14:37:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39dughguu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:37:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15SEa2OT27590942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 14:36:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E15511C077;
 Mon, 28 Jun 2021 14:37:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78E0611C08E;
 Mon, 28 Jun 2021 14:37:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.88.152])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 14:37:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 5/8] powerpc/64: enable MSR[EE] in irq replay pt_regs
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20210628074932.1499554-6-npiggin@gmail.com>
Date: Mon, 28 Jun 2021 20:07:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DCB27B7-04A8-461E-B6EA-1E6161CCDA3F@linux.vnet.ibm.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
 <20210628074932.1499554-6-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pJihh6j6V2exQOBEEWBUYa_zCmwAHcFu
X-Proofpoint-ORIG-GUID: dL7yjCkTB4BWLJJG3FlWleHKD0OuO9cN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=976 mlxscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280098
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


> On 28-Jun-2021, at 1:19 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Similar to 2b48e96be2f9f ("powerpc/64: fix irq replay pt_regs->softe
> value"), enable MSR_EE in pt_regs->msr, which makes the regs look a
> bit more normal and allows the extra debug checks to be added to
> interrupt handler entry.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/include/asm/interrupt.h | 4 ++++
> arch/powerpc/kernel/irq.c            | 1 +
> 2 files changed, 5 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/interrupt.h =
b/arch/powerpc/include/asm/interrupt.h
> index 789311d1e283..d4bdf7d274ac 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -173,6 +173,8 @@ static inline void interrupt_enter_prepare(struct =
pt_regs *regs, struct interrup
> 			BUG_ON(search_kernel_restart_table(regs->nip));
> #endif
> 	}
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & =
MSR_EE));
> #endif

I think this BUG_ON was triggered while running selftests =
(powerpc/mm/pkey_exec_prot)

[ 9741.254969] ------------[ cut here ]------------
[ 9741.254978] kernel BUG at arch/powerpc/include/asm/interrupt.h:177!
[ 9741.254985] Oops: Exception in kernel mode, sig: 5 [#1]
[ 9741.254990] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA =
pSeries
[ 9741.254995] Modules linked in: rpadlpar_io rpaphp uinput =
sha512_generic vmac n_gsm pps_ldisc pps_core ppp_synctty ppp_async =
ppp_generic slcan slip slhc snd_hrtimer snd_seq snd_seq_device snd_timer =
snd soundcore authenc pcrypt crypto_user n_hdlc dummy veth nfsv3 nfs_acl =
nfs lockd grace fscache netfs tun brd overlay vfat fat btrfs =
blake2b_generic xor zstd_compress raid6_pq xfs loop sctp ip6_udp_tunnel =
udp_tunnel dm_mod bonding nft_ct nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetlink sunrpc =
pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables =
ext4 mbcache jbd2 sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth =
scsi_transport_srp fuse [last unloaded: test_cpuidle_latency]
[ 9741.255097] CPU: 17 PID: 3278920 Comm: pkey_exec_prot Tainted: G      =
  W  OE     5.13.0-rc7-next-20210625-dirty #4
[ 9741.255106] NIP:  c0000000000300d8 LR: c000000000009604 CTR: =
c000000000009330
[ 9741.255111] REGS: c0000000347536f0 TRAP: 0700   Tainted: G        W  =
OE      (5.13.0-rc7-next-20210625-dirty)
[ 9741.255117] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22004282  =
XER: 20040000
[ 9741.255130] CFAR: c00000000003007c IRQMASK: 3=20
[ 9741.255130] GPR00: c000000000093cd0 c000000034753990 c0000000029bbe00 =
c000000034753a30=20
[ 9741.255130] GPR04: 00007fff9ebb0000 0000000000200000 000000000000000a =
000000000000002d=20
[ 9741.255130] GPR08: 0000000000000000 0000000000000001 0000000000000000 =
7265677368657265=20
[ 9741.255130] GPR12: 8000000000021033 c00000001ec27280 0000000000000000 =
0000000000000000=20
[ 9741.255130] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 9741.255130] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010003c40=20
[ 9741.255130] GPR24: 0000000000000000 0000000000000000 0000000000200000 =
c00000005e89d200=20
[ 9741.255130] GPR28: 0000000000000300 00007fff9ebb0000 c000000034753e80 =
c000000034753a30=20
[ 9741.255191] NIP [c0000000000300d8] program_check_exception+0xe8/0x1c0
[ 9741.255202] LR [c000000000009604] =
program_check_common_virt+0x2d4/0x320
[ 9741.255209] Call Trace:
[ 9741.255212] [c000000034753990] [0000000000000008] 0x8 (unreliable)
[ 9741.255219] [c0000000347539c0] [c000000034753a80] 0xc000000034753a80
[ 9741.255225] --- interrupt: 700 at arch_local_irq_restore+0x1d0/0x200
[ 9741.255231] NIP:  c000000000016790 LR: c000000000093388 CTR: =
c000000000008780
[ 9741.255236] REGS: c000000034753a30 TRAP: 0700   Tainted: G        W  =
OE      (5.13.0-rc7-next-20210625-dirty)
[ 9741.255242] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 24004288  =
XER: 20040000
[ 9741.255253] CFAR: c0000000000165ec IRQMASK: 0=20
[ 9741.255253] GPR00: c000000000093cd0 c000000034753cd0 c0000000029bbe00 =
0000000000000000=20
[ 9741.255253] GPR04: 00007fff9ebb0000 0000000000200000 000000000000000a =
000000000000002d=20
[ 9741.255253] GPR08: 0000000000000000 0000000000000000 c0000000bd77d400 =
7265677368657265=20
[ 9741.255253] GPR12: 0000000044000282 c00000001ec27280 0000000000000000 =
0000000000000000=20
[ 9741.255253] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 9741.255253] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010003c40=20
[ 9741.255253] GPR24: 0000000000000000 0000000000000000 0000000000200000 =
c00000005e89d200=20
[ 9741.255253] GPR28: 0000000000000300 00007fff9ebb0000 c000000034753e80 =
0000000000000001=20
[ 9741.255313] NIP [c000000000016790] arch_local_irq_restore+0x1d0/0x200
[ 9741.255319] LR [c000000000093388] ___do_page_fault+0x438/0xb80
[ 9741.255325] --- interrupt: 700
[ 9741.255328] [c000000034753cd0] [c00000000009be74] =
hash_page_mm+0x5e4/0x800 (unreliable)
[ 9741.255335] [c000000034753d00] [000000000000002d] 0x2d
[ 9741.255340] [c000000034753db0] [c000000000093cd0] =
hash__do_page_fault+0x30/0x70
[ 9741.255348] [c000000034753de0] [c00000000009c438] =
do_hash_fault+0x78/0xb0
[ 9741.255354] [c000000034753e10] [c00000000000891c] =
data_access_common_virt+0x19c/0x1f0
[ 9741.255361] --- interrupt: 300 at 0x10001e8c
[ 9741.255365] NIP:  0000000010001e8c LR: 0000000010001e84 CTR: =
00007fff9ea4eb60
[ 9741.255370] REGS: c000000034753e80 TRAP: 0300   Tainted: G        W  =
OE      (5.13.0-rc7-next-20210625-dirty)
[ 9741.255376] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28000282  XER: 20040000
[ 9741.255391] CFAR: c00000000000ca44 DAR: 00007fff9ebb0000 DSISR: =
00200000 IRQMASK: 0=20
[ 9741.255391] GPR00: 0000000010001e84 00007fffd11fa7b0 0000000010027f00 =
0000000000000033=20
[ 9741.255391] GPR04: 0000000010003c3d 0000000000000001 000000000000000a =
000000000000002d=20
[ 9741.255391] GPR08: 0000000000000000 00007fff9ebb0000 0000000000000000 =
000001002ab20337=20
[ 9741.255391] GPR12: 0000000000000000 00007fff9ec4a270 0000000000000000 =
0000000000000000=20
[ 9741.255391] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 9741.255391] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010003c40=20
[ 9741.255391] GPR24: 0000000000000001 0000000010003c18 000000000000002d =
0000000010020160=20
[ 9741.255391] GPR28: 00c0000000000000 0000000010020230 0000000000000002 =
0000000000000004=20
[ 9741.255455] NIP [0000000010001e8c] 0x10001e8c
[ 9741.255459] LR [0000000010001e84] 0x10001e84
[ 9741.255463] --- interrupt: 300
[ 9741.255466] Instruction dump:
[ 9741.255470] 60000000 e8010040 7c6a1b78 7c0803a6 0b0a0000 e93f0138 =
71290001 4082004c=20
[ 9741.255481] e95f0108 39200001 714a8000 4082ff68 <0b090000> 38210030 =
7fe3fb78 ebe1fff8=20
[ 9741.255494] ---[ end trace c668c70ea0d5061f ]=E2=80=94

Thanks
-Sachin

>=20
> 	booke_restore_dbcr0();
> @@ -268,6 +270,8 @@ static inline void =
interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
> 		// arch_irq_disabled_regs(regs) behaves as expected.
> 		regs->softe =3D IRQS_ALL_DISABLED;
> 	}
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & =
MSR_EE));
>=20
> 	/* Don't do any per-CPU operations until interrupt state is =
fixed */
>=20
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 8428caf3194e..91e63eac4e8f 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -121,6 +121,7 @@ void replay_soft_interrupts(void)
>=20
> 	ppc_save_regs(&regs);
> 	regs.softe =3D IRQS_ENABLED;
> +	regs.msr |=3D MSR_EE;
>=20
> again:
> 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> --=20
> 2.23.0
>=20

