Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032F514A82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 15:28:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqYGd0KQFz3bdR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:28:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WT46O3gg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WT46O3gg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqYFt1xXcz2xn8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 23:28:01 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TBlS74009535;
 Fri, 29 Apr 2022 13:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=7r4w4PY9pYOwvErJ6NiHwBl+Ju9uMGEOFmGd1VkXeVA=;
 b=WT46O3ggPnADFY5771pVECIM30CUh7IoSznsyb0CsBreFgecuFr4nMjN4c0fNWjQ2Niz
 k1vsUTjD4a6944mm3HbrDIe+p1n0LBxqxMgTaVZu6Ml5GbuNLlX6VkMmeYbFyuB/oHcU
 hLvqb4R7OsfpevDFxqI/ZoXroWLJZYYB7/J+dua3ltCTyhJKxfQ6k5wrC3Xin5gzO89r
 IaWcxcNQWQjY4HSYnKkTHKI/5XS5fW2lenIq3TgQ54L3Qdr5+TyuqLsTd/G/qcymfw2n
 If3IphpRr9TGfcYWVDS74qbroVTWiqldKAfgxYMU6DkAUIZgVggjAZt7/G5skobbAhL+ Iw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fque1c42d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 13:27:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23TDQr63014269;
 Fri, 29 Apr 2022 13:27:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3fm939160v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 13:27:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23TDRr0a52625862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 13:27:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF6B4C044;
 Fri, 29 Apr 2022 13:27:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DD8E4C046;
 Fri, 29 Apr 2022 13:27:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.68.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 13:27:52 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [powerpc] kernel BUG at mm/mmap.c:3164! w/ltp(mmapstress03)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <B5C26080-14D5-4B16-ABDA-FCB040E7503A@linux.ibm.com>
Date: Fri, 29 Apr 2022 18:57:50 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F509FE1-46DC-451F-B743-0555CF6AB002@linux.ibm.com>
References: <B5C26080-14D5-4B16-ABDA-FCB040E7503A@linux.ibm.com>
To: "Liam.Howlett@oracle.com" <Liam.Howlett@Oracle.com>, linux-mm@kvack.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CzIqXApjn6HDdoTAV1EAtausG--j4mZX
X-Proofpoint-GUID: CzIqXApjn6HDdoTAV1EAtausG--j4mZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_06,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204290076
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 28-Apr-2022, at 10:26 PM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>=20
> While running LTP tests (mmapstress03 specifically) against =
5.18.0-rc4-next-20220428
> booted on IBM Power server mentioned BUG is encountered.
>=20
> # ./mmapstress03
> mmapstress03    0  TINFO  :  uname.machine=3Dppc64le kernel is 64bit
> mmapstress03: errno =3D 12: failed to fiddle with brk at the end
> mmapstress03    1  TFAIL  :  mmapstress03.c:212: Test failed
> [   32.396145] mmap: mmapstress03 (3023): VmData 18446744073706799104 =
exceed data ulimit 18446744073709551615. Update limits or use boot =
option ignore_rlimit_data.
> [   32.396192] ------------[ cut here ]------------
> [   32.396193] kernel BUG at mm/mmap.c:3164!
> [   32.396195] Oops: Exception in kernel mode, sig: 5 [#1]

This BUG_ON was introduced with following patch
commit d2367e383cf5
mm: remove the vma linked list


I tried removing the following three commits to see if it helps.
commit 49d281fa016f2906346f1707e5059b6f7674a948
commit e7ecf47d211aae50f3a1dd3dc75e5afd47745bb6
commit d2367e383cf5ecf93622e64a7b858f7034f3df62

Although I do not see the BUG_ON trace (as it is removed) but
the test still fails:

# ./mmapstress03
mmapstress03    0  TINFO  :  uname.machine=3Dppc64le kernel is 64bit
mmapstress03: errno =3D 12: failed to fiddle with brk at the end
mmapstress03    1  TFAIL  :  mmapstress03.c:212: Test failed
 [  579.877217] mmap: mmapstress03 (4287): VmData 18446744073706799104 =
exceed data ulimit 18446744073709551615. Update limits or use boot =
option ignore_rlimit_data.
[  579.970138] BUG: non-zero pgtables_bytes on freeing mm: 8192
#=20

> [   32.396210] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
> [   32.396213] Modules linked in: dm_mod mptcp_diag xsk_diag tcp_diag =
udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set bonding tls =
nf_tables nfnetlink sunrpc binfmt_misc pseries_rng drm =
drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sr_mod =
crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi =
scsi_transport_srp ibmveth xts vmx_crypto fuse
> [   32.396262] CPU: 5 PID: 3023 Comm: mmapstress03 Not tainted =
5.18.0-rc4-next-20220428 #16
> [   32.396267] NIP:  c0000000004c4750 LR: c0000000004c4730 CTR: =
c0000000004bf5d0
> [   32.396270] REGS: c00000001abeb810 TRAP: 0700   Not tainted  =
(5.18.0-rc4-next-20220428)
> [   32.396274] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
22002224  XER: 00000000
> [   32.396283] CFAR: c0000000008af740 IRQMASK: 0=20
> [   32.396283] GPR00: c0000000004c4730 c00000001abebab0 =
c000000002a71300 0000000000000000=20
> [   32.396283] GPR04: c000000079dcd000 ffffffffffffffff =
0000000000000008 ffffffffffffffff=20
> [   32.396283] GPR08: 0000000000000008 0000000000000001 =
0000000000000000 c000000079dcd040=20
> [   32.396283] GPR12: c000000079dcd008 c00000087fffa300 =
0000000000000000 0000000000000000=20
> [   32.396283] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
> [   32.396283] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 c000000002aaae85=20
> [   32.396283] GPR24: 0000000000000000 0000000000000000 =
00007fffaa5c1200 c000000020de3660=20
> [   32.396283] GPR28: 000000000000000c c000000020de3600 =
000000000000000d 0000000000000000=20
> [   32.396320] NIP [c0000000004c4750] exit_mmap+0x190/0x390
> [   32.396327] LR [c0000000004c4730] exit_mmap+0x170/0x390
> [   32.396332] Call Trace:
> [   32.396334] [c00000001abebab0] [c0000000004c4730] =
exit_mmap+0x170/0x390 (unreliable)
> [   32.396340] [c00000001abebbd0] [c0000000001700f4] =
__mmput+0x54/0x200
> [   32.396344] [c00000001abebc10] [c00000000017fe5c] =
exit_mm+0xfc/0x190
> [   32.396348] [c00000001abebc50] [c00000000018016c] =
do_exit+0x27c/0x5a0
> [   32.396352] [c00000001abebcf0] [c00000000018063c] =
do_group_exit+0x4c/0xd0
> [   32.396356] [c00000001abebd30] [c0000000001806e4] =
sys_exit_group+0x24/0x30
> [   32.396360] [c00000001abebd50] [c000000000037084] =
system_call_exception+0x254/0x550
> [   32.396364] [c00000001abebe10] [c00000000000bfe8] =
system_call_vectored_common+0xe8/0x278
> [   32.396369] --- interrupt: 3000 at 0x7fffaa318d04
> [   32.396374] NIP:  00007fffaa318d04 LR: 0000000000000000 CTR: =
0000000000000000
> [   32.396377] REGS: c00000001abebe80 TRAP: 3000   Not tainted  =
(5.18.0-rc4-next-20220428)
> [   32.396380] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42002222  XER: 00000000
> [   32.396389] IRQMASK: 0=20
> [   32.396389] GPR00: 00000000000000ea 00007fffe43f3420 =
00007fffaa457100 0000000000000001=20
> [   32.396389] GPR04: 0000000000000000 0000000011a602a0 =
00007fffaa5c1200 0000000000000000=20
> [   32.396389] GPR08: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
> [   32.396389] GPR12: 0000000000000000 00007fffaa5ca500 =
0000000000000000 0000000000000000=20
> [   32.396389] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
> [   32.396389] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000001=20
> [   32.396389] GPR24: 00007fffaa450938 0000000000000000 =
0000000000000001 00007fffaa4529f8=20
> [   32.396389] GPR28: 0000000000000001 00007fffaa5c3510 =
fffffffffffff000 0000000000000001=20
> [   32.396425] NIP [00007fffaa318d04] 0x7fffaa318d04
> [   32.396427] LR [0000000000000000] 0x0
> [   32.396429] --- interrupt: 3000
> [   32.396431] Instruction dump:
> [   32.396433] 60000000 3880ffff 38610020 483eff5d 60000000 7c7f1b79 =
4082ffb8 813d0058=20
> [   32.396439] 7d29f278 7d290034 5529d97e 69290001 <0b090000> 60000000 =
7fa3eb78 483e328d=20
> [   32.396447] ---[ end trace 0000000000000000 ]---
> [   32.398759]=20
> [   33.398760] Kernel panic - not syncing: Fatal exception
>=20
> This problem was introduced with 5.18.0-rc4-next-20220427. I am unable =
to
> complete the git bisect due to build failure related to =
mapletree-vs-khugepaged
> issue.
>=20
> Thanks
> -Sachin

