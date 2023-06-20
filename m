Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66795736BB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:13:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sj45kfVs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QllsC2LVjz3bVv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:13:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sj45kfVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QllrD74NTz30XN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:12:28 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KCAvFS010296;
	Tue, 20 Jun 2023 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=fH00DEX/zhStgHwFOeldVK5n39+6PGUN5wEGcoQsxJg=;
 b=sj45kfVsnFu8VuNmGg2ONwxTmDGqAPu2n7RNXjVBW7x6PKOTiQa++PzDe8pwuTbKuKlp
 lVDfbByNg4wdxPGIWLWywA9P1J+XKvj2Xq31hK0C02S2T9dPIBSCDxLMsHqPU0vuTRhb
 es7wXJT4WiwK2K0QZKfupufbW+C3f1TlOGfvEXwmqfy28ZMKBRNDZGwq5yOV28pYj6Pp
 hwItB3M+lsP9W9b41waCBkiqTZ6bjKz0a/L/FwhcifoIiWW9xfu/8vSTSbIZ5TIzVkYZ
 VuVE2f80YyA+t6mv314AQs+SMmIx/lRPn4jYttm9ts5c/9KxhtsvnOQnFBy8YhJnwktS 3Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbb8u18t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 12:12:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35K3MOhV006755;
	Tue, 20 Jun 2023 12:12:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r94f51j1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 12:12:11 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35KCC8IN32965140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 12:12:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C954120043;
	Tue, 20 Jun 2023 12:12:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 263A52004B;
	Tue, 20 Jun 2023 12:12:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Jun 2023 12:12:07 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: [6.4.0-rc7-next-20230620] Boot failure on IBM Power LPAR
Message-Id: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
Date: Tue, 20 Jun 2023 17:41:57 +0530
To: linux-mm@kvack.org
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a4IRcmzYJKqQasBWQC65lfr3_uaCDaf6
X-Proofpoint-ORIG-GUID: a4IRcmzYJKqQasBWQC65lfr3_uaCDaf6
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306200108
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.4.0-rc7-next-20230620 fails to boot on IBM Power LPAR with following

[ 5.548368] BUG: Unable to handle kernel data access at 0x95bdcf954bc34e73
[ 5.548380] Faulting instruction address: 0xc000000000548090
[ 5.548384] Oops: Kernel access of bad area, sig: 11 [#1]
[ 5.548387] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
[ 5.548391] Modules linked in: nf_tables(E) nfnetlink(E) sunrpc(E) binfmt_m=
isc(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_qu=
irks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_ge=
neric(E) cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transpo=
rt_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
[ 5.548413] CPU: 1 PID: 789 Comm: systemd-udevd Tainted: G E 6.4.0-rc7-next=
-20230620 #1
[ 5.548417] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of=
:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[ 5.548421] NIP: c000000000548090 LR: c000000000547fbc CTR: c0000000004206f0
[ 5.548424] REGS: c0000000afb536f0 TRAP: 0380 Tainted: G E (6.4.0-rc7-next-=
20230620)
[ 5.548427] MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 880=
28202 XER: 20040000
[ 5.548436] CFAR: c000000000547fc4 IRQMASK: 0=20
[ 5.548436] GPR00: c000000000547fbc c0000000afb53990 c0000000014b1600 00000=
00000000000=20
[ 5.548436] GPR04: 0000000000000cc0 00000000000034d8 0000000000000e6f ed5e0=
2cab43c21e0=20
[ 5.548436] GPR08: 0000000000000e6e 0000000000000058 0000001356ea0000 00000=
00000002000=20
[ 5.548436] GPR12: c0000000004206f0 c0000013fffff300 0000000000000000 00000=
00000000000=20
[ 5.548436] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000=
00092f43708=20
[ 5.548436] GPR20: c000000092f436b0 0000000000000000 fffffffffff7dfff c0000=
000afa80000=20
[ 5.548436] GPR24: c000000002b87aa0 00000000000000b8 c000000000159914 00000=
00000000cc0=20
[ 5.548436] GPR28: 95bdcf954bc34e1b c00000000a1fafc0 0000000000000000 c0000=
00003019800=20
[ 5.548473] NIP [c000000000548090] kmem_cache_alloc+0x1a0/0x420
[ 5.548480] LR [c000000000547fbc] kmem_cache_alloc+0xcc/0x420
[ 5.548485] Call Trace:
[ 5.548487] [c0000000afb53990] [c000000000547fbc] kmem_cache_alloc+0xcc/0x4=
20 (unreliable)
[ 5.548493] [c0000000afb53a00] [c000000000159914] vm_area_dup+0x44/0xf0
[ 5.548499] [c0000000afb53a40] [c00000000015a638] dup_mmap+0x298/0x8b0
[ 5.548504] [c0000000afb53bb0] [c00000000015acd0] dup_mm.constprop.0+0x80/0=
x180
[ 5.548509] [c0000000afb53bf0] [c00000000015bdc0] copy_process+0xc00/0x1510
[ 5.548514] [c0000000afb53cb0] [c00000000015c848] kernel_clone+0xb8/0x5a0
[ 5.548519] [c0000000afb53d30] [c00000000015ceb8] __do_sys_clone+0x88/0xd0
[ 5.548524] [c0000000afb53e10] [c000000000033bcc] system_call_exception+0x1=
3c/0x340
[ 5.548529] [c0000000afb53e50] [c00000000000d05c] system_call_vectored_comm=
on+0x15c/0x2ec
[ 5.548534] --- interrupt: 3000 at 0x7fff87f0c178
[ 5.548538] NIP: 00007fff87f0c178 LR: 0000000000000000 CTR: 0000000000000000
[ 5.548540] REGS: c0000000afb53e80 TRAP: 3000 Tainted: G E (6.4.0-rc7-next-=
20230620)
[ 5.548544] MSR: 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE> CR: 44004204=
 XER: 00000000
[ 5.548552] IRQMASK: 0=20
[ 5.548552] GPR00: 0000000000000078 00007ffffde8cb80 00007fff88637500 00000=
00001200011=20
[ 5.548552] GPR04: 0000000000000000 0000000000000000 0000000000000000 00007=
fff888bd490=20
[ 5.548552] GPR08: 0000000000000001 0000000000000000 0000000000000000 00000=
00000000000=20
[ 5.548552] GPR12: 0000000000000000 00007fff888c4c00 0000000000000002 00007=
ffffde95698=20
[ 5.548552] GPR16: 00007ffffde95690 00007ffffde95688 00007ffffde956a0 00000=
00000000028=20
[ 5.548552] GPR20: 0000000132bca308 0000000000000001 0000000000000001 00000=
00000000315=20
[ 5.548552] GPR24: 0000000000000003 0000000000000040 0000000000000000 00000=
00000000003=20
[ 5.548552] GPR28: 0000000000000000 0000000000000000 00007ffffde8cf24 00000=
00000000045=20
[ 5.548586] NIP [00007fff87f0c178] 0x7fff87f0c178
[ 5.548589] LR [0000000000000000] 0x0
[ 5.548591] --- interrupt: 3000
[ 5.548593] Code: e93f0000 7ce95214 e9070008 7f89502a e9270010 2e3c0000 419=
20258 2c290000 41820250 813f0028 e8ff00b8 38c80001 <7fdc482a> 7d3c4a14 7925=
0022 552ac03e=20
[ 5.548605] ---[ end trace 0000000000000000 ]---
[ 5.550849] pstore: backend (nvram) writing error (-1)
[ 5.550852]=20
Starting Network Manager...
[ 5.566384] BUG: Bad rss-counter state mm:00000000dc60f1c1 type:MM_ANONPAGE=
S val:36
[ 5.568784] BUG: Bad rss-counter state mm:000000008eb9341b type:MM_ANONPAGE=
S val:36
[ 5.689774] BUG: Bad rss-counter state mm:00000000edbda345 type:MM_ANONPAGE=
S val:36
[ 5.692187] BUG: Bad rss-counter state mm:000000003f7ec21f type:MM_ANONPAGE=
S val:36
[ 5.705947] BUG: Bad rss-counter state mm:00000000cdbb7cfd type:MM_ANONPAGE=
S val:36
[ 6.550855] Kernel panic - not syncing: Fatal exception
[ 6.568226] Rebooting in 10 seconds..

The problem was introduced in 6.4.0-rc7-next-20230619. I tried git bisect, =
but unsure of the
result reported by it. Bisect points to following patch

# git bisect bad
70c94cc2eefd4f98d222834cbe7512804977c2d4 is the first bad commit
commit 70c94cc2eefd4f98d222834cbe7512804977c2d4
Merge: 48f5ee5c48c3 3fe08f7d5e80
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue Jun 20 09:43:25 2023 +1000

    Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kern=
el/git/akpm/mm
         # Conflicts:
         #       mm/mmap.c


git bisect start
# status: waiting for both good and bad commits
# bad: [9dbf40840551df336c95ce2a3adbdd25ed53c0ef] Add linux-next specific f=
iles for 20230620
git bisect bad 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
# status: waiting for good commit(s), bad commit known
# good: [45a3e24f65e90a047bef86f927ebdc4c710edaa1] Linux 6.4-rc7
git bisect good 45a3e24f65e90a047bef86f927ebdc4c710edaa1
# bad: [175cde0dcc05c0905adeb55dff5ac49da96552b3] Merge branch 'master' of =
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 175cde0dcc05c0905adeb55dff5ac49da96552b3
# bad: [d16e40b24a7d258d166fbfe46f0f565a21204df7] Merge branch 'xtensa-for-=
next' of git://github.com/jcmvbkbc/linux-xtensa.git
git bisect bad d16e40b24a7d258d166fbfe46f0f565a21204df7
# bad: [2be5f21481bf5606654520c19bd016090522f5d4] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
git bisect bad 2be5f21481bf5606654520c19bd016090522f5d4
# bad: [1dfd9944d721bef26f49d00220ce86efeb77711d] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
git bisect bad 1dfd9944d721bef26f49d00220ce86efeb77711d
# good: [34fd86722257374f73bb6da13a60cc19b0344e99] mm: zswap: remove shrink=
 from zpool interface
git bisect good 34fd86722257374f73bb6da13a60cc19b0344e99
# good: [48f5ee5c48c342bd82fa04eefc8a41048a6165fc] Merge branch 'mm-nonmm-s=
table' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 48f5ee5c48c342bd82fa04eefc8a41048a6165fc
# good: [dfd058ab9bef3f6590fb349ae1a2dfa7fc3ee50e] mm/gup: do not return 0 =
from pin_user_pages_fast() for bad args
git bisect good dfd058ab9bef3f6590fb349ae1a2dfa7fc3ee50e
# good: [ec336aa83162fe0f3d554baed2d4e2589b69ec6e] scripts/mksysmap: Fix ba=
dly escaped '$'
git bisect good ec336aa83162fe0f3d554baed2d4e2589b69ec6e
# good: [b08e8297596bb6f80351dc50fc1b8c2250d3a318] modpost: show offset fro=
m symbol for section mismatch warnings
git bisect good b08e8297596bb6f80351dc50fc1b8c2250d3a318
# good: [14b17c0b28bbd853c43d1a815019091497b5b436] watchdog/hardlockup: sor=
t hardlockup detector related config values a logical way
git bisect good 14b17c0b28bbd853c43d1a815019091497b5b436
# good: [1e5db612cc70f3137aa48978b267afff17eb222d] watchdog/hardlockup: def=
ine HARDLOCKUP_DETECTOR_ARCH
git bisect good 1e5db612cc70f3137aa48978b267afff17eb222d
# good: [3fe08f7d5e80b3f822673b70fcc6be8dbee58f76] Merge branch 'mm-nonmm-u=
nstable' into mm-everything
git bisect good 3fe08f7d5e80b3f822673b70fcc6be8dbee58f76
# good: [9ac40f75debfcb20c93de71b434ae73add1f692d] linux/export.h: rename '=
sec' argument to 'license'
git bisect good 9ac40f75debfcb20c93de71b434ae73add1f692d
# bad: [70c94cc2eefd4f98d222834cbe7512804977c2d4] Merge branch 'mm-everythi=
ng' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect bad 70c94cc2eefd4f98d222834cbe7512804977c2d4
# first bad commit: [70c94cc2eefd4f98d222834cbe7512804977c2d4] Merge branch=
 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm


- Sachin=
