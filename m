Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D098A5235A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 16:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyyC64cM1z3cBS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 00:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E6Uzd+bJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E6Uzd+bJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyyBL1nTFz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 00:35:37 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BESlKj030703;
 Wed, 11 May 2022 14:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/RhSBzw+sRTlHspPoLa1gTznLHsi6spQDcfp8fP2hTo=;
 b=E6Uzd+bJj/jIMrFvF8JXgJ8dngUZKGKNUjm/YEhN+i9z0YdXL2+3n1DlCuW8oKhqSHSE
 OTV4sR7LnuRt5LZOXJwR6uzCeAJMRvYWCMFBTnD4+g/wfQVrqu8QROK4BHCMA4R/LyRn
 w7Jf0XMoJ/TMA46YfflPXpmkVh5TxRfKX3JTukulQ6izwe+eLgnHAVgwjd2MQmrPpgdO
 Vo3JEz+S/FL5/VuOofoNVa/KQtT7qHVYHGkYK97qU+xOptLz7fJp125vCAaZ0dUDIoaK
 vxoSPiXZBp7fhcBoPLcJmM55JwzkBNwI6wtzqekBDEJCMj8VjXz3ogewP0BjUYGLcIGj ng== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0cmdujb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 14:35:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BELJwq015114;
 Wed, 11 May 2022 14:35:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3fyrkk1h13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 14:35:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BEZUaP46530868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 14:35:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 044C84204B;
 Wed, 11 May 2022 14:35:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B56D342047;
 Wed, 11 May 2022 14:35:28 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.17.157])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 May 2022 14:35:28 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [powerpc] Kernel oops while running xfstests w/ext4
 (5.18-rc6-next-20220510)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <849697D9-0BF2-435F-B4F0-BC971269A9AA@linux.ibm.com>
Date: Wed, 11 May 2022 20:05:27 +0530
Message-Id: <78688136-AE1B-4D57-8E94-C18AE8C4E006@linux.ibm.com>
References: <849697D9-0BF2-435F-B4F0-BC971269A9AA@linux.ibm.com>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GgflpWSNvIX723aeUyAJzrWtCF6-IETZ
X-Proofpoint-GUID: GgflpWSNvIX723aeUyAJzrWtCF6-IETZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205110068
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 riteshh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-May-2022, at 2:56 PM, Sachin Sant <sachinp@linux.ibm.com> wrote:
>=20
> While running xfstests (specifically ext4/032) w/ext4 on a POWER9 LPAR ru=
nning
> linux-next version 5.18.0-rc6-next-20220510 following crash is seen:
>=20
> [  472.486440] EXT4-fs (loop0): resized filesystem to 41943040
> [  472.760888] BUG: Kernel NULL pointer dereference at 0x0000002c
> [  472.760891] Faulting instruction address: 0xc0000000007729f4
> [  472.760894] Oops: Kernel access of bad area, sig: 11 [#1]
> [  472.760913] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSer=
ies
> [  472.760921] Modules linked in: loop(E) dm_mod(E) nft_fib_inet(E) nft_f=
ib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) =
nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_con=
ntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) ip_set(E) bonding(E) rfkill(E=
) tls(E) nf_tables(E) libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vm=
x_crypto(E) ext4(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) sg(E) l=
pfc(E) nvmet_fc(E) nvmet(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) nv=
me_fc(E) nvme(E) nvme_fabrics(E) nvme_core(E) t10_pi(E) scsi_transport_fc(E=
) crc64_rocksoft(E) crc64(E) tg3(E) ipmi_devintf(E) ipmi_msghandler(E) fuse=
(E)
> [  472.761006] CPU: 8 PID: 5139 Comm: kworker/u193:0 Tainted: G          =
  E     5.18.0-rc6-next-20220510 #2
> [  472.761013] Workqueue: loop0 loop_rootcg_workfn [loop]
> [  472.761027] NIP:  c0000000007729f4 LR: c00000000077331c CTR: c00000000=
09e9ac0
> [  472.761032] REGS: c00000002d95b3a0 TRAP: 0380   Tainted: G            =
E      (5.18.0-rc6-next-20220510)
> [  472.761038] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24008822  XER: 00000000
> [  472.761057] CFAR: c000000000772b80 IRQMASK: 0=20
> [  472.761057] GPR00: c00000000077331c c00000002d95b640 c000000002a7cf00 =
c00000002d95b8e0=20
> [  472.761057] GPR04: c00000006fd58200 0000000000000001 0000000000000010 =
0000000000000040=20
> [  472.761057] GPR08: 0000000000000020 0000000000000000 0000000000010000 =
c0080000089570f8=20
> [  472.761057] GPR12: 0000000000008000 c00000001ec46300 0000000000000000 =
c000000054e32200=20
> [  472.761057] GPR16: 5deadbeef0000100 0000000000000000 0000000000000000 =
0000000000000000=20
> [  472.761057] GPR20: 000000007fffffff c009fffffc817a00 c00000002d95b748 =
c00000002d95b8e0=20
> [  472.761057] GPR24: 0000000000000001 0000000000000000 c0000000842b1c00 =
0000000000000000=20
> [  472.761057] GPR28: 0000000000000000 0000000000000000 c00000006fd58200 =
c00000002d95b8e0=20
> [  472.761126] NIP [c0000000007729f4] blk_add_rq_to_plug+0x74/0x1d0
> [  472.761135] LR [c00000000077331c] blk_mq_try_issue_list_directly+0x18c=
/0x1d0
> [  472.761141] Call Trace:
> [  472.761144] [c00000002d95b640] [c0000000842b1c00] 0xc0000000842b1c00 (=
unreliable)
> [  472.761153] [c00000002d95b680] [c000000000773244] blk_mq_try_issue_lis=
t_directly+0xb4/0x1d0
> [  472.761160] [c00000002d95b6d0] [c00000000077b38c] blk_mq_sched_insert_=
requests+0x13c/0x240
> [  472.761168] [c00000002d95b720] [c000000000772658] blk_mq_flush_plug_li=
st+0x118/0x440
> [  472.761175] [c00000002d95b7c0] [c00000000075ecbc] __blk_flush_plug+0x1=
7c/0x200
> [  472.761183] [c00000002d95b840] [c00000000075efe0] blk_finish_plug+0x50=
/0x70
> [  472.761190] [c00000002d95b870] [c00000000061a2a4] __iomap_dio_rw+0x444=
/0x960
> [  472.761200] [c00000002d95ba60] [c00000000061a7e0] iomap_dio_rw+0x20/0x=
90
> [  472.761208] [c00000002d95ba80] [c008000008c56424] ext4_file_read_iter+=
0x17c/0x2d0 [ext4]
> [  472.761237] [c00000002d95bac0] [c008000009822aa8] lo_rw_aio.isra.36+0x=
260/0x320 [loop]
> [  472.761245] [c00000002d95bb40] [c008000009824030] loop_process_work+0x=
448/0xb70 [loop]
> [  472.761253] [c00000002d95bc90] [c000000000183744] process_one_work+0x2=
b4/0x5b0
> [  472.761262] [c00000002d95bd30] [c000000000183ab8] worker_thread+0x78/0=
x600
> [  472.761269] [c00000002d95bdc0] [c0000000001901d4] kthread+0x124/0x130
> [  472.761276] [c00000002d95be10] [c00000000000ce04] ret_from_kernel_thre=
ad+0x5c/0x64
> [  472.761284] Instruction dump:
> [  472.761288] 893f0014 38e00040 39000020 2fa90000 7d283f9e 7e8a4840 4094=
00b4 e93e0000=20
> [  472.761300] e9290068 71290008 40820024 3d400001 <813d002c> 614affff 7e=
895040 41950090=20
> [  472.761314] ---[ end trace 0000000000000000 ]---
> [  472.769088]=20
> [  473.769091] Kernel panic - not syncing: Fatal exception
>=20
> 5.18.0-rc6-next-20220509 build did not exhibit this problem.
> Will try git bisect and report back with results.
>=20

Unfortunately git bisect doesn=E2=80=99t seem to help.
first bad commit: [3aedd17333a514c6f2542ed305d940e7a970a6f2]=20
          Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/=
git/ulfh/mmc.git

# git bisect log
git bisect start
# bad: [3bf222d317a20170ee17f082626c1e0f83537e13] Add linux-next specific f=
iles for 20220510
git bisect bad 3bf222d317a20170ee17f082626c1e0f83537e13
# good: [c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a] Linux 5.18-rc6
git bisect good c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
# good: [5b0c7020c4bf2cfed914323a7d58777c47df6bf8] Merge branch 'drm-next' =
of git://git.freedesktop.org/git/drm/drm.git
git bisect good 5b0c7020c4bf2cfed914323a7d58777c47df6bf8
# bad: [d11e84253a18f5afa5bb6e7da8509ba249435c0c] Merge branch 'next' of gi=
t://git.kernel.org/pub/scm/virt/kvm/kvm.git
git bisect bad d11e84253a18f5afa5bb6e7da8509ba249435c0c
# good: [24f8d248db54c383b01e373355d8655810832192] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git bisect good 24f8d248db54c383b01e373355d8655810832192
# bad: [52be5c3c2431cb82789bd9cdb5169f7a2538a8af] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
git bisect bad 52be5c3c2431cb82789bd9cdb5169f7a2538a8af
# good: [020a5624b05bb35b24beb1e405ecf38a37c3c238] Merge branch 'pcmcia-nex=
t' of git://git.kernel.org/pub/scm/linux/kernel/git/brodo/linux.git
git bisect good 020a5624b05bb35b24beb1e405ecf38a37c3c238
# bad: [528beacf1e5a082c15738652115e8eed516e925d] Merge branch 'master' of =
https://scm.osdn.net/gitroot/tomoyo/tomoyo-test1.git
git bisect bad 528beacf1e5a082c15738652115e8eed516e925d
# bad: [e8f0eb6a4d1b9775d1ba3ed5b95bbb9cdbe663a0] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git
git bisect bad e8f0eb6a4d1b9775d1ba3ed5b95bbb9cdbe663a0
# good: [7a0587496a6233b9ffa8441573d38f8844751066] dt-bindings: mmc: sdhci-=
am654: Add flag to force setting of TESTCD bit
git bisect good 7a0587496a6233b9ffa8441573d38f8844751066
# good: [17a9f73d45ea74b2beb009c29ad38569990c3453] dt-bindings: mmc: sdhci-=
msm: Add compatible string for sm8150
git bisect good 17a9f73d45ea74b2beb009c29ad38569990c3453
# good: [3474b838f4204c21d108183d9268611d961a428f] dt-bindings: Drop undocu=
mented i.MX iomuxc-gpr bindings in examples
git bisect good 3474b838f4204c21d108183d9268611d961a428f
# good: [0c9ee5ba7555016afd1efc9598c3f83de5d83470] mmc: sdhci-brcmstb: Fix =
compiler warning
git bisect good 0c9ee5ba7555016afd1efc9598c3f83de5d83470
# good: [d96a89407e5f682d1cb22569d91784506c784863] power: supply: bq24190_c=
harger: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
git bisect good d96a89407e5f682d1cb22569d91784506c784863
# bad: [6d4c27440f59a40aa8df6ad5ed3ff8ae50048870] Merge branch 'for-mfd-nex=
t' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
git bisect bad 6d4c27440f59a40aa8df6ad5ed3ff8ae50048870
# bad: [3aedd17333a514c6f2542ed305d940e7a970a6f2] Merge branch 'next' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
git bisect bad 3aedd17333a514c6f2542ed305d940e7a970a6f2
# first bad commit: [3aedd17333a514c6f2542ed305d940e7a970a6f2] Merge branch=
 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git

-Sachin
