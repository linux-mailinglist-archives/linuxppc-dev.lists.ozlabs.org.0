Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE77B30DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 12:51:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MDyWFAqd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxnG32DKzz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 20:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MDyWFAqd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxnF41rSfz30LM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 20:50:31 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38TAaGsV022424
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 10:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=f9nTrwdPk+D0avWUrCkVnMmy0vw2+qJExC8psqpsxsM=;
 b=MDyWFAqdjAoBXErrhx6PWmdeJH4V0itmeMAXRX/kiaMZJN1b5Ih8IQrwrn/DUbtxumKR
 qBMZbE7n+KlowMffHqmo3vMKIhJoLoof0Luu3lOATq/8VoDgvQqBAngxOHvq7KlEHzGd
 uo2vNHB+8NYe8oT3ZRzk2j5nGJW7ro9tXD9pi6il2zcoDNDGDlsbWYmHYprR7t9d6Av7
 k/C8rlqJR7wqZP0ICPAE1capNsubilxuS3h7wDsk+ryITgLsm4Z39Vks+Vd799p12LS5
 qWaFJ4/h0D6QluAvXa03gALYyv1PIb/yYFP38D8dqHshrplr2p8KTYedva26akBEXyqW ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdvm8gvpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 10:50:28 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38TAlIiU005481
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 10:50:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdvm8gvp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 10:50:27 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38TAGDZc011029;
	Fri, 29 Sep 2023 10:50:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabum3un0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 10:50:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38TAoOMD28508880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Sep 2023 10:50:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8F7F2004B;
	Fri, 29 Sep 2023 10:50:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B52020043;
	Fri, 29 Sep 2023 10:50:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.8.180])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Sep 2023 10:50:23 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: [6.6-rc3] WARNING at arch/powerpc/mm/book3s64/radix_tlb.c:1221
Message-Id: <A8E52547-4BF1-47CE-8AEA-BC5A9D7E3567@linux.ibm.com>
Date: Fri, 29 Sep 2023 16:20:12 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 61vj7gG31mlLoTS4iOd3WPhv2ckWjAgc
X-Proofpoint-GUID: NQy1p8aGJ4ZBT9xQUqAVw1gBkywAl7Dk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_09,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=305
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309290091
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running kernel selftests (powerpc/mce) following warning is =
triggered

TAP version 13
1..1
# timeout set to 45
# selftests: powerpc/mce: inject-ra-err
[   37.851967] Disabling lock debugging due to kernel taint
[   37.851977] MCE: CPU19: machine check (Severe)  Real address =
Load/Store (foreign/control memory) [Not recovered]
[   37.851982] MCE: CPU19: PID: 5254 Comm: inject-ra-err NIP: =
[0000000010000e48]
[   37.851986] MCE: CPU19: Initiator CPU
[   37.851988] MCE: CPU19: Unknown
[   37.852082] ------------[ cut here ]------------
[   37.852086] WARNING: CPU: 19 PID: 5254 at =
arch/powerpc/mm/book3s64/radix_tlb.c:1221 radix__tlb_flush+0x160/0x180
[   37.852096] Modules linked in: rpadlpar_io(E) rpaphp(E) xsk_diag(E) =
nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) =
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) =
nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) nf_tables(E) =
nfnetlink(E) sunrpc(E) binfmt_misc(E) pseries_rng(E) =
aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) =
libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic(E) =
cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) =
scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
[   37.852146] CPU: 19 PID: 5254 Comm: inject-ra-err Kdump: loaded =
Tainted: G   M        E      6.6.0-rc3-00055-g9ed22ae6be81 #4
[   37.852153] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
[   37.852157] NIP:  c0000000000a9c30 LR: c0000000000a9bd4 CTR: =
c00000000010a2d0
[   37.852161] REGS: c000000227b8b860 TRAP: 0700   Tainted: G   M        =
E       (6.6.0-rc3-00055-g9ed22ae6be81)
[   37.852166] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
44002222  XER: 20040000
[   37.852177] CFAR: c0000000000a9bdc IRQMASK: 0
[   37.852177] GPR00: c0000000000a9bc4 c000000227b8bb00 c000000001902000 =
0000000000000041
[   37.852177] GPR04: 0000000000000002 0000000000000080 0000000000000000 =
0000000000000080
[   37.852177] GPR08: 0000000000000002 0000000000000001 c000000e81c73e90 =
0000000044002228
[   37.852177] GPR12: c00000000010a2d0 c000000e87bf6b00 0000000000000000 =
0000000000000000
[   37.852177] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   37.852177] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   37.852177] GPR24: 0000000000000000 0000000000000001 0000000000000000 =
c000000005533b00
[   37.852177] GPR28: c000000005533b60 0000000000000000 c000000227b8bbc0 =
c000000005533a80
[   37.852222] NIP [c0000000000a9c30] radix__tlb_flush+0x160/0x180
[   37.852227] LR [c0000000000a9bd4] radix__tlb_flush+0x104/0x180
[   37.852232] Call Trace:
[   37.852235] [c000000227b8bb00] [c0000000000a9bc4] =
radix__tlb_flush+0xf4/0x180 (unreliable)
[   37.852241] [c000000227b8bb30] [c0000000004e5dfc] =
tlb_finish_mmu+0x15c/0x1e0
[   37.852250] [c000000227b8bb60] [c0000000004e1840] =
exit_mmap+0x1a0/0x510
[   37.852256] [c000000227b8bc90] [c000000000158760] __mmput+0x60/0x1e0
[   37.852262] [c000000227b8bcc0] [c000000000168b0c] exit_mm+0xdc/0x170
[   37.852269] [c000000227b8bd00] [c000000000168e5c] do_exit+0x2bc/0x5a0
[   37.852280] [c000000227b8bdb0] [c00000000016938c] =
do_group_exit+0x4c/0xc0
[   37.852286] [c000000227b8bdf0] [c000000000169428] =
sys_exit_group+0x28/0x30
[   37.852291] [c000000227b8be10] [c000000000034258] =
system_call_exception+0x138/0x330
[   37.852298] [c000000227b8be50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
[   37.852305] --- interrupt: 3000 at 0x7fff8010c2c4
[   37.852312] NIP:  00007fff8010c2c4 LR: 0000000000000000 CTR: =
0000000000000000
[   37.852316] REGS: c000000227b8be80 TRAP: 3000   Tainted: G   M        =
E       (6.6.0-rc3-00055-g9ed22ae6be81)
[   37.852321] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002822  XER: 00000000
[   37.852332] IRQMASK: 0
[   37.852332] GPR00: 00000000000000ea 00007ffff243d010 00007fff803f7e00 =
0000000000000000
[   37.852332] GPR04: 0000000000000000 000000003a4602a0 0000000000000000 =
0000000000000000
[   37.852332] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   37.852332] GPR12: 0000000000000000 00007fff803fab60 0000000000000000 =
0000000000000000
[   37.852332] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
[   37.852332] GPR20: 0000000000000000 0000000000000000 0000000000000001 =
0000000000000001
[   37.852332] GPR24: 00007fff802423c0 0000000000000000 00007fff80240a38 =
0000000000000000
[   37.852332] GPR28: 0000000000000001 00007fff803f3b70 fffffffffffff000 =
0000000000000000
[   37.852374] NIP [00007fff8010c2c4] 0x7fff8010c2c4
[   37.852378] LR [0000000000000000] 0x0
[   37.852381] --- interrupt: 3000
[   37.852383] Code: 38210030 38e00001 ebe1fff8 4bfff46c 38210030 =
38800000 ebe1fff8 4bffe9ec 38c00007 4bffff38 60000000 60000000 =
<0fe00000> 38800001 7fe3fb78 4bffe9cd
[   37.852398] ---[ end trace 0000000000000000 ]---
# test: inject-ra-err

git bisect points to following patch
e43c0a0c3c2870e1ee29519dc249471adf19ab5
    powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown =
IPIs


- Sachin=
