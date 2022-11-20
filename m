Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344766314A6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 15:18:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFXgW3YxCz3dxq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 01:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwWnIFg9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwWnIFg9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFXfW1yNDz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 01:17:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AKDKVFQ025901;
	Sun, 20 Nov 2022 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=gnutQR7hOoWC6FKmPPevnGWiiamdM5j9qEgpT0D6cYs=;
 b=TwWnIFg9v4bt0suDDYJrKMtdtBehG9UB5hugGWhSzk/DnBL9NcGNceQ1XgSwZkHsAyC5
 j2WcOpF/xRHfcobDI34QXEISy89PxuCMEzsOWCaZH56uhPJDPRg917E0uT+RN6yGPEMl
 LzLfdIKlceikMEy7oWtAgc6K7AQEMp8jY+VS5eDRwYk8YCpo5tDo6wS7cUNirFBvI3mK
 fgg56JWHOYVJ6fbQBf6YrenYfW737z5u2P65zAji8+hYJBaF/OY6BuFPcy7lKYYdN7YA
 4nMCrvcRicTnP+vHdPFEXbkuHJ3ct95Cyea9GsdpH1R1Zc94AdrANTYed8NpRXfQhb+O fg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9a1jpxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 14:17:32 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKE8Bun010818;
	Sun, 20 Nov 2022 14:17:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03fra.de.ibm.com with ESMTP id 3kxps911d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 14:17:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AKEHSnn39453424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Nov 2022 14:17:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B289AE045;
	Sun, 20 Nov 2022 14:17:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C803AE04D;
	Sun, 20 Nov 2022 14:17:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.20.12])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 20 Nov 2022 14:17:27 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: [6.1.0-rc5-next-20221118] Kernel crash (alloc_buddy_hugetlb_folio) -
 THP tests
Message-Id: <EA3E3887-24D7-4EA6-9F24-37979FDF1ECD@linux.ibm.com>
Date: Sun, 20 Nov 2022 19:47:16 +0530
To: linux-mm@kvack.org, sidhartha.kumar@oracle.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6WAwQuzjI8reJ4MOCHGyEOwUkt70W3Nd
X-Proofpoint-GUID: 6WAwQuzjI8reJ4MOCHGyEOwUkt70W3Nd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200120
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running transparent hugepage defragmentation test [1]
on Power10 server following crash was seen

[11725.379229] Kernel attempted to read user page (8) - exploit attempt? (u=
id: 0)
[11725.379251] BUG: Kernel NULL pointer dereference on read at 0x00000008
[11725.379257] Faulting instruction address: 0xc0000000004da04c
[11725.379266] Oops: Kernel access of bad area, sig: 11 [#1]
[11725.379269] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeri=
es
[11725.379275] Modules linked in: nvram(E) rpadlpar_io(E) rpaphp(E) uinput(=
E) torture(E) vmac(E) poly1305_generic(E) chacha_generic(E) chacha20poly130=
5(E) n_gsm(E) pps_ldisc(E) ppp_synctty(E) ppp_async(E) ppp_generic(E) serpo=
rt(E) slcan(E) can_dev(E) slip(E) slhc(E) snd_hrtimer(E) snd_seq(E) snd_seq=
_device(E) snd_timer(E) snd(E) soundcore(E) pcrypt(E) crypto_user(E) n_hdlc=
(E) dummy(E) veth(E) nfsv3(E) nfs_acl(E) nfs(E) lockd(E) grace(E) fscache(E=
) netfs(E) tun(E) brd(E) overlay(E) exfat(E) vfat(E) fat(E) btrfs(E) blake2=
b_generic(E) xor(E) raid6_pq(E) zstd_compress(E) xfs(E) loop(E) sctp(E) ip6=
_udp_tunnel(E) udp_tunnel(E) dm_mod(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_=
fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(=
E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_de=
frag_ipv6(E) nf_defrag_ipv4(E) bonding(E) rfkill(E) tls(E) ip_set(E) nf_tab=
les(E) libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto(E) ext=
4(E) mbcache(E) jbd2(E)
[11725.379333] sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscs=
i(E) scsi_transport_srp(E) ibmveth(E) fuse(E) [last unloaded: ipistorm(OE)]
[11725.379371] CPU: 1 PID: 2273459 Comm: sysctl Tainted: G OE 6.1.0-rc5-nex=
t-20221118 #1
[11725.379376] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006=
 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[11725.379381] NIP: c0000000004da04c LR: c0000000004d9f94 CTR: 000000000000=
0000
[11725.379385] REGS: c00000000872b740 TRAP: 0300 Tainted: G OE (6.1.0-rc5-n=
ext-20221118)
[11725.379390] MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: =
24048224 XER: 00000001
[11725.379402] CFAR: c0000000004d9fa0 DAR: 0000000000000008 DSISR: 40000000=
 IRQMASK: 0=20
[11725.379402] GPR00: c0000000004d9f94 c00000000872b9e0 c0000000013bee00 00=
00000000000000=20
[11725.379402] GPR04: c000000002ac8ac0 c000000001218470 0000000000000005 c0=
00000471d7e280=20
[11725.379402] GPR08: 0000000000000000 0000000000000000 0000000000000002 00=
00000000000000=20
[11725.379402] GPR12: 0000000024048242 c000000efffff300 0000000000000000 00=
00000000000000=20
[11725.379402] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0=
0000000872bb18=20
[11725.379402] GPR20: 0000000000000001 0000000000000100 0000000000300cca 00=
00000000000001=20
[11725.379402] GPR24: c00000000872bb18 c000000002ac8ac0 0000000000000002 00=
00000000000000=20
[11725.379402] GPR28: 0000000000000001 0000000000000005 0000000000000001 00=
00000000346cca=20
[11725.379455] NIP [c0000000004da04c] alloc_buddy_hugetlb_folio+0x17c/0x250
[11725.379464] LR [c0000000004d9f94] alloc_buddy_hugetlb_folio+0xc4/0x250
[11725.379469] Call Trace:
[11725.379471] [c00000000872b9e0] [c0000000004dc004] alloc_fresh_hugetlb_fo=
lio.part.78+0x224/0x2f0 (unreliable)
[11725.379478] [c00000000872ba70] [c0000000004dfa38] alloc_pool_huge_page+0=
x118/0x190
[11725.379484] [c00000000872bac0] [c0000000004dff8c] __nr_hugepages_store_c=
ommon+0x4dc/0x610
[11725.379490] [c00000000872bba0] [c0000000004e036c] hugetlb_sysctl_handler=
_common+0x13c/0x180
[11725.379496] [c00000000872bc40] [c0000000006413b0] proc_sys_call_handler+=
0x210/0x350
[11725.379503] [c00000000872bcc0] [c00000000055da10] vfs_write+0x2e0/0x460
[11725.379508] [c00000000872bd80] [c00000000055dd6c] ksys_write+0x7c/0x140
[11725.379513] [c00000000872bdd0] [c000000000035220] system_call_exception+=
0x140/0x350
[11725.379519] [c00000000872be10] [c00000000000c6d4] system_call_common+0xf=
4/0x278
[11725.379525] --- interrupt: c00 at 0x7fff7fb20c34
[11725.379530] NIP: 00007fff7fb20c34 LR: 0000000134d554bc CTR: 000000000000=
0000
[11725.379533] REGS: c00000000872be80 TRAP: 0c00 Tainted: G OE (6.1.0-rc5-n=
ext-20221118)
[11725.379538] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> C=
R: 28002202 XER: 00000000
[11725.379548] IRQMASK: 0=20
[11725.379548] GPR00: 0000000000000004 00007fffedd64fc0 00007fff7fc07300 00=
00000000000003=20
[11725.379548] GPR04: 000000014eac37f0 0000000000000006 fffffffffffffff6 00=
00000000000000=20
[11725.379548] GPR08: 000000014eac37f0 0000000000000000 0000000000000000 00=
00000000000000=20
[11725.379548] GPR12: 0000000000000000 00007fff80000940 0000000000000000 00=
00000000000000=20
[11725.379548] GPR16: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[11725.379548] GPR20: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000=20
[11725.379548] GPR24: 0000000000000001 0000000000000010 0000000000000006 00=
0000014eac5800=20
[11725.379548] GPR28: 00007fff7fbfc2c8 000000014eac5800 0000000000000006 00=
0000014eac0fc0=20
[11725.379589] NIP [00007fff7fb20c34] 0x7fff7fb20c34
[11725.379593] LR [0000000134d554bc] 0x134d554bc
[11725.379596] --- interrupt: c00
[11725.379598] Instruction dump:
[11725.379601] 39400001 55283032 7d291ef4 7fc8f050 7f184a14 7d49f036 7d40c0=
a8 7d4a4b78=20
[11725.379609] 7d40c1ad 40c2fff4 39200000 382100b0 <e9490008> e8010010 8181=
0008 eae1ffb8=20
[11725.379616] ---[ end trace 0000000000000000 ]---
[11725.380328]=20
[11726.380333] Kernel panic - not syncing: Fatal exception
[11726.392564] Rebooting in 10 seconds..

Git bisect points to following patch
commit 7a410b1d773853d1d6ec522a871869541fe48c22 (refs/bisect/bad)
Date:   Thu Nov 17 13:15:01 2022 -0800
    mm/hugetlb: change hugetlb allocation functions to return a folio

Reverting this patch allows the test to run to completion.

- Sachin

[1]  https://github.com/avocado-framework-tests/avocado-misc-tests/blob/mas=
ter/memory/transparent_hugepages_defrag.py=
