Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79C7F5DD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 12:29:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ElbVb754;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbbVJ00V7z3vd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 22:29:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ElbVb754;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbbTR0xf8z3dBn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 22:28:26 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANAoEhC027162;
	Thu, 23 Nov 2023 11:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=uo0NIuBjfr6ElKSFBxreR1Le+VzpSHbxCgo6QVeZ0Io=;
 b=ElbVb754wlavBHay8yJVcMX3JgE+yXkCZsksxrUUt4NmzkDkwYOOaQJuNULaHLAcesys
 nmK95ASUvLzizyh1n2X/Ymh3QkjsXknScKwgWzMayTRyKPk8GF8xCrFe0lHeOy/BXAxI
 mtmrHzOQHj6c9+XtVTq2GdIp1EefrbW8DJqgWy/dhhf9hua3qLEwG6uRYyVOeOSlNFS+
 djVSsMJgp7uYG44XoK/Ecipyszk1pbqXWqckXIhqMzqTOaehvjFIp/QHo3EbTDmnqe30
 QysuwqfI6Zfgxbzdnu+odJN7fKlWQSEugy/Ul3ED6N51ULw08B88sc2+GHTpUlJoJihY +A== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uj5axs0dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:28:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANBIxRf021383;
	Thu, 23 Nov 2023 11:28:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ufaa2e8bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:28:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ANBS85i16908858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Nov 2023 11:28:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E2F720049;
	Thu, 23 Nov 2023 11:28:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49AAF20040;
	Thu, 23 Nov 2023 11:28:07 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.66.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Nov 2023 11:28:07 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: [powerpc] Lockups seen during/just after boot (bisected)
Message-Id: <5F8DAEC7-E815-40A5-AD4A-B01296F5165F@linux.ibm.com>
Date: Thu, 23 Nov 2023 16:57:56 +0530
To: linux-mm@kvack.org, zhouchengming@bytedance.com
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zddTT_0uIcfID3TurDt3mmvEoFNCJorT
X-Proofpoint-ORIG-GUID: zddTT_0uIcfID3TurDt3mmvEoFNCJorT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxscore=0 adultscore=0 mlxlogscore=598 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311230082
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting recent -next kernel on IBM Power server, I have observed lock=
ups
either during boot or just after.

[ 3631.015775] watchdog: CPU 3 self-detected hard LOCKUP @ __update_freelis=
t_slow+0x74/0x90
[ 3631.015783] watchdog: CPU 3 TB:7766577908812231, last heartbeat TB:77665=
72528409444 (10508ms ago)
[ 3631.015784] Modules linked in: rpadlpar_io(E) rpaphp(E) xsk_diag(E) nft_=
fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) n=
f_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E)=
 nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) bonding(E) t=
ls(E) rfkill(E) ip_set(E) nf_tables(E) nfnetlink(E) sunrpc(E) binfmt_misc(E=
) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(=
E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic=
(E) cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_sr=
p(E) ibmveth(E) vmx_crypto(E) fuse(E)
[ 3631.015811] CPU: 3 PID: 167427 Comm: sed Kdump: loaded Tainted: G E 6.7.=
0-rc2-next-20231122 #1
[ 3631.015813] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006=
 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[ 3631.015814] NIP: c000000000561f34 LR: c00000000056b108 CTR: c0000000004f=
4c50
[ 3631.015816] REGS: c000000e87743d60 TRAP: 0900 Tainted: G E (6.7.0-rc2-ne=
xt-20231122)
[ 3631.015817] MSR: 8000000000009033 <SF,EE,ME,IR,DR,RI,LE> CR: 42042222 XE=
R: 20040000
[ 3631.015822] CFAR: 0000000000000000 IRQMASK: 1=20
[ 3631.015822] GPR00: c000000000096968 c000000e87b43ca0 c000000001522100 c0=
0c00000001d700=20
[ 3631.015822] GPR04: c0000000075f2000 0000000000200009 c0000000075f0000 00=
00000000200008=20
[ 3631.015822] GPR08: 0000000000001000 0000000000000001 003ffff800000a41 c0=
000000b189d000=20
[ 3631.015822] GPR12: c0000000004f4c50 c000000effffcb00 0000000000000000 00=
00000000000000=20
[ 3631.015822] GPR16: 0000000000000001 c000000002b82a80 0000000000000000 00=
00000000000000=20
[ 3631.015822] GPR20: c000000003016c00 0000000000000000 0000000000210d00 c0=
00000e81273978=20
[ 3631.015822] GPR24: 0000000000000000 0000000000000001 c0000000075f0000 c0=
000000075f0000=20
[ 3631.015822] GPR28: c000000e81273900 0000000000200008 c00c00000001d700 c0=
000000075f2000=20
[ 3631.015840] NIP [c000000000561f34] __update_freelist_slow+0x74/0x90
[ 3631.015842] LR [c00000000056b108] __slab_free+0x138/0x4a0
[ 3631.015845] Call Trace:
[ 3631.015845] [c000000e87b43ca0] [c00c00000001d700] 0xc00c00000001d700 (un=
reliable)
[ 3631.015849] [c000000e87b43d80] [c000000000096968] __tlb_remove_table+0xe=
8/0x150
[ 3631.015853] [c000000e87b43db0] [c0000000004f4cac] tlb_remove_table_rcu+0=
x5c/0xa0
[ 3631.015856] [c000000e87b43de0] [c000000000243314] rcu_do_batch+0x234/0x6=
80
[ 3631.015859] [c000000e87b43e90] [c000000000247a80] rcu_core+0x170/0x2d0
[ 3631.015862] [c000000e87b43ee0] [c00000000102054c] __do_softirq+0x15c/0x3=
c0
[ 3631.015866] [c000000e87b43fe0] [c0000000000182d0] do_softirq_own_stack+0=
x40/0x60
[ 3631.015869] [c0000000672f7610] [c000000000170668] __irq_exit_rcu+0x128/0=
x150
[ 3631.015872] [c0000000672f7640] [c0000000001711a0] irq_exit+0x20/0x40
[ 3631.015874] [c0000000672f7660] [c00000000002bb58] timer_interrupt+0x128/=
0x310
[ 3631.015876] [c0000000672f76c0] [c000000000009ffc] decrementer_common_vir=
t+0x28c/0x290
[ 3631.015879] --- interrupt: 900 at smp_call_function_many_cond+0x1d4/0x6a0
[ 3631.015883] NIP: c000000000298a34 LR: c0000000002989e4 CTR: c0000000000c=
9f50
[ 3631.015884] REGS: c0000000672f76f0 TRAP: 0900 Tainted: G E (6.7.0-rc2-ne=
xt-20231122)
[ 3631.015885] MSR: 8000000000009033 <SF,EE,ME,IR,DR,RI,LE> CR: 44042822 XE=
R: 20040000
[ 3631.015888] CFAR: 0000000000000000 IRQMASK: 0=20
[ 3631.015888] GPR00: c000000000298eb0 c0000000672f7990 c000000001522100 00=
00000000000012=20
[ 3631.015888] GPR04: 0000000000000012 0000000000000000 0000000000000000 00=
00000000000012=20
[ 3631.015888] GPR08: c000000002b92058 0000000000000001 c000000e81bdc060 c0=
000000070d0c88=20
[ 3631.015888] GPR12: c0000000000c9f50 c000000effffcb00 0000000000000000 00=
00000000000000=20
[ 3631.015888] GPR16: 0000000000000000 0000000000000003 0000000000000000 c0=
00000008270ff0=20
[ 3631.015888] GPR20: c000000002b961f8 c0000000000a8270 60000000000000e0 c0=
000000070d0680=20
[ 3631.015888] GPR24: 0000000000000000 0000000000000090 c000000e81273d88 c0=
000000070d0680=20
[ 3631.015888] GPR28: c000000e81273d80 c0000000000a9470 c000000e81273d88 c0=
00000002b968b0=20
[ 3631.015906] NIP [c000000000298a34] smp_call_function_many_cond+0x1d4/0x6=
a0
[ 3631.015908] LR [c0000000002989e4] smp_call_function_many_cond+0x184/0x6a0
[ 3631.015911] --- interrupt: 900
[ 3631.015912] [c0000000672f7990] [c000000000298eb0] smp_call_function_many=
_cond+0x650/0x6a0 (unreliable)
[ 3631.015915] [c0000000672f7a50] [c0000000000a8270] flush_type_needed+0x1d=
0/0x260
[ 3631.015917] [c0000000672f7a90] [c0000000000a94ec] radix__flush_tlb_page_=
psize+0x5c/0x300
[ 3631.015919] [c0000000672f7b00] [c0000000004fd7f4] ptep_clear_flush+0xa4/=
0x160
[ 3631.015921] [c0000000672f7b50] [c0000000004d9218] wp_page_copy+0x348/0xa=
40
[ 3631.015924] [c0000000672f7c00] [c0000000004e55b0] __handle_mm_fault+0x47=
0/0x8a0
[ 3631.015927] [c0000000672f7d10] [c0000000004e5af4] handle_mm_fault+0x114/=
0x3b0
[ 3631.015929] [c0000000672f7d60] [c0000000000900ac] ___do_page_fault+0x3ec=
/0x8c0
[ 3631.015931] [c0000000672f7e20] [c000000000090670] do_page_fault+0x30/0xc0
[ 3631.015933] [c0000000672f7e50] [c000000000008be0] data_access_common_vir=
t+0x210/0x220
[ 3631.015935] --- interrupt: 300 at 0x7fff98f81c18
[ 3631.015936] NIP: 00007fff98f81c18 LR: 00007fff98f81c08 CTR: 00007fff98c5=
3380
[ 3631.015937] REGS: c0000000672f7e80 TRAP: 0300 Tainted: G E (6.7.0-rc2-ne=
xt-20231122)
[ 3631.015938] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> C=
R: 24002422 XER: 20040000
[ 3631.015943] CFAR: 00007fff98f81b0c DAR: 00007fff98fa0000 DSISR: 0a000000=
 IRQMASK: 0=20
[ 3631.015943] GPR00: 00007fff98ff7d44 00007fffe2816a10 00007fff98fa7f00 00=
007fff98fa0000=20
[ 3631.015943] GPR04: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[ 3631.015943] GPR08: 0000000000000000 0000000000000001 0000000000000001 00=
00000000002000=20
[ 3631.015943] GPR12: 00007fff98c53380 00007fff9905bdc0 0000000000000000 00=
00000000000000=20
[ 3631.015943] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
007fff98f9fb30=20
[ 3631.015943] GPR20: 00007fffe2816aa8 00007fffe2816a80 00007fffe2816a50 00=
007fff99050000=20
[ 3631.015943] GPR24: 0000000000000000 00007fff9904f668 0000000000000000 00=
007fff99050988=20
[ 3631.015943] GPR28: 00007fff99052040 0000000000000000 00007fff99050000 00=
007fffe2816a50=20
[ 3631.015958] NIP [00007fff98f81c18] 0x7fff98f81c18
[ 3631.015959] LR [00007fff98f81c08] 0x7fff98f81c08
[ 3631.015960] --- interrupt: 300
[ 3631.015960] Code: 60000000 60000000 60000000 e9230028 7c292800 4082ffd4 =
39400001 f8c30020 f8e30028 4bffffc4 60000000 7c40003c <60000000> e9230000 7=
1290001 4082fff0

Git bisect points to following patch

commit c8d312e039030edab25836a326bcaeb2a3d4db14
    slub: Delay freezing of partial slabs

Bisect log:

git bisect start
# status: waiting for both good and bad commits
# bad: [288736c822de7fd3b69be317c11eaa8dfb78bf6f] Add linux-next specific f=
iles for 20231122
git bisect bad 288736c822de7fd3b69be317c11eaa8dfb78bf6f
# status: waiting for good commit(s), bad commit known
# good: [98b1cc82c4affc16f5598d4fa14b1858671b2263] Linux 6.7-rc2
git bisect good 98b1cc82c4affc16f5598d4fa14b1858671b2263
# good: [9540131d5721e24c00b118ce852c761285515b26] Merge branch 'main' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 9540131d5721e24c00b118ce852c761285515b26
# good: [99444230e9595fc7050292ce284003d7e7d4b53e] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git bisect good 99444230e9595fc7050292ce284003d7e7d4b53e
# good: [a95502fad0ab45767b263f46719bba3885e9597c] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
git bisect good a95502fad0ab45767b263f46719bba3885e9597c
# good: [5317edbc82dbfac690f2ff720667291ecf6ccee0] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
git bisect good 5317edbc82dbfac690f2ff720667291ecf6ccee0
# good: [602bf18307981f3bfd9ebf19921791a4256d3fd1] Merge branch 'for-6.7' i=
nto for-next
git bisect good 602bf18307981f3bfd9ebf19921791a4256d3fd1
# good: [d5bf2252dd17fa9fa87206862500884e9a342c9b] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
git bisect good d5bf2252dd17fa9fa87206862500884e9a342c9b
# good: [48b10dee6a7a26cc695bf4932f091d423b94b429] Merge branch 'zstd-next'=
 of https://github.com/terrelln/linux.git
git bisect good 48b10dee6a7a26cc695bf4932f091d423b94b429
# good: [f6a4a72703c035882d7595198ce83d021b6b1c96] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git
git bisect good f6a4a72703c035882d7595198ce83d021b6b1c96
# bad: [dd374e220ba492f95344a638b1efe5b2744fdd73] slub: Update frozen slabs=
 documentations in the source
git bisect bad dd374e220ba492f95344a638b1efe5b2744fdd73
# good: [a3058965bb35490454953aa2c87ea51004839f2f] slub: Prepare __slab_fre=
e() for unfrozen partial slab out of node partial list
git bisect good a3058965bb35490454953aa2c87ea51004839f2f
# bad: [c8d312e039030edab25836a326bcaeb2a3d4db14] slub: Delay freezing of p=
artial slabs
git bisect bad c8d312e039030edab25836a326bcaeb2a3d4db14
# good: [00b15a19ee543f0117cb217fcbab8b7b3fd50677] slub: Introduce freeze_s=
lab()
git bisect good 00b15a19ee543f0117cb217fcbab8b7b3fd50677
# first bad commit: [c8d312e039030edab25836a326bcaeb2a3d4db14] slub: Delay =
freezing of partial slabs

- Sachin

