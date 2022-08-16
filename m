Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED3595FC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 18:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6bWz4vgVz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 02:02:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5ZKmEkq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5ZKmEkq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6bWF0MhTz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 02:02:00 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GFklZN011853
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=+h4IjrNvLx1csnVHfMSToZ29rEQ/vMJugtEoz6DQe7s=;
 b=Q5ZKmEkqmPDtZzlHK9YbF5XsmEnRlOKKCSPEaiio6eddboJIg4pszBeodppm1M4e15x/
 iOJaNLQbbb9jSGd4HJZRlUlFttZEpC99fqYQFFPzBxJnTBpPeHccxNDY4+OLal8s6ZAv
 zKLdoAHDdplVFfHuVreZKcLqGFbhSq5c+yh7iXA66KgmC0/18nLqcwhvB4+4nwF6WM8e
 ZwWtQRlT4YGboOI68Duitr32UeJCg0mPviE/l2k7o4lfokwBFkNt9NKZuetAtk0yQNFJ
 QkUt1yQGs3Db7+UXTu/mWrRq/JxIEJkOJNKzzvLgpeYzFY6kWWsO07LZxlGiYXeWRJyh jQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0e66ges0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:01:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27GFoKhl032131
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:01:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8ue7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:01:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27GG1pU932768450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Aug 2022 16:01:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8949A405F;
	Tue, 16 Aug 2022 16:01:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50281A405B;
	Tue, 16 Aug 2022 16:01:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.6.158])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Aug 2022 16:01:50 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [6.0-rc1] Kernel crash while running MCE tests
Message-Id: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
Date: Tue, 16 Aug 2022 21:31:49 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: toITlT6o-v9iNhPDLiIkIDQhL68p0ols
X-Proofpoint-GUID: toITlT6o-v9iNhPDLiIkIDQhL68p0ols
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=717
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160061
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following crash is seen while running powerpc/mce subtest on
a Power10 LPAR.=20

1..1
# selftests: powerpc/mce: inject-ra-err
[  155.240591] BUG: Unable to handle kernel data access on read at =
0xc00e00022d55b503
[  155.240618] Faulting instruction address: 0xc0000000006f1f0c
[  155.240627] Oops: Kernel access of bad area, sig: 11 [#1]
[  155.240633] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA =
pSeries
[  155.240642] Modules linked in: dm_mod mptcp_diag xsk_diag tcp_diag =
udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set =
nf_tables nfnetlink sunrpc binfmt_misc pseries_rng drm =
drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sr_mod =
crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi ibmveth =
scsi_transport_srp xts vmx_crypto fuse
[  155.240750] CPU: 4 PID: 3645 Comm: inject-ra-err Not tainted =
6.0.0-rc1 #2
[  155.240761] NIP:  c0000000006f1f0c LR: c0000000000630d0 CTR: =
0000000000000000
[  155.240768] REGS: c0000000ff887890 TRAP: 0300   Not tainted  =
(6.0.0-rc1)
[  155.240776] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  XER: =
00000000
[  155.240792] CFAR: c0000000000630cc DAR: c00e00022d55b503 DSISR: =
40000000 IRQMASK: 3=20
[  155.240792] GPR00: c0000000000630d0 c0000000ff887b30 c0000000044afe00 =
c00000116aada818=20
[  155.240792] GPR04: 0000000000004d43 0000000000000008 c0000000000630d0 =
004d424900000000=20
[  155.240792] GPR08: 0000000000000001 180000022d55b503 a80e000000000000 =
0000000003000048=20
[  155.240792] GPR12: 0000000000000000 c0000000ffffb700 0000000000000000 =
0000000000000000=20
[  155.240792] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  155.240792] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010000b30=20
[  155.240792] GPR24: 00007fff8dad0000 00007fff8dacf6d8 00007fffd1551e98 =
000000001001fce8=20
[  155.240792] GPR28: c00000116aada888 c00000116aada800 0000000000004d43 =
c00000116aada818=20
[  155.240885] NIP [c0000000006f1f0c] __asan_load2+0x5c/0xe0
[  155.240898] LR [c0000000000630d0] pseries_errorlog_id+0x20/0x40
[  155.240910] Call Trace:
[  155.240914] [c0000000ff887b50] [c0000000000630d0] =
pseries_errorlog_id+0x20/0x40
[  155.240925] [c0000000ff887b80] [c0000000015595c8] =
get_pseries_errorlog+0xa8/0x110
[  155.240937] [c0000000ff887bc0] [c00000000014e080] =
pseries_machine_check_realmode+0x140/0x2d0
[  155.240949] [c0000000ff887ca0] [c00000000005e5b8] =
machine_check_early+0x68/0xc0
[  155.240959] [c0000000ff887cf0] [c000000000008364] =
machine_check_early_common+0x134/0x1f8
[  155.240971] --- interrupt: 200 at 0x10000e48
[  155.240978] NIP:  0000000010000e48 LR: 0000000010000e40 CTR: =
0000000000000000
[  155.240984] REGS: c0000000ff887d60 TRAP: 0200   Not tainted  =
(6.0.0-rc1)
[  155.240991] MSR:  8000000002a0f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 82002822  XER: 00000000
[  155.241015] CFAR: 000000000000021c DAR: 00007fff8da30000 DSISR: =
02000008 IRQMASK: 0=20
[  155.241015] GPR00: 0000000010000e40 00007fffd15517b0 0000000010027f00 =
00007fff8da30000=20
[  155.241015] GPR04: 0000000000001000 0000000000000003 0000000000000001 =
0000000000000005=20
[  155.241015] GPR08: 0000000000000000 fffffffffffff000 0000000000000000 =
0000000000000000=20
[  155.241015] GPR12: 0000000000000000 00007fff8dada5e0 0000000000000000 =
0000000000000000=20
[  155.241015] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[  155.241015] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010000b30=20
[  155.241015] GPR24: 00007fff8dad0000 00007fff8dacf6d8 00007fffd1551e98 =
000000001001fce8=20
[  155.241015] GPR28: 00007fffd1552020 0000000000000001 0000000000000005 =
0000000000000000=20
[  155.241104] NIP [0000000010000e48] 0x10000e48
[  155.241109] LR [0000000010000e40] 0x10000e40
[  155.241115] --- interrupt: 200
[  155.241119] Instruction dump:
[  155.241125] 6129ffff 792907c6 6529ffff 6129ffff 7c234840 40810058 =
39230001 71280007=20
[  155.241141] 41820034 3d40a80e 7929e8c2 794a07c6 <7d2950ae> 7d290775 =
4082006c 38210020=20
[  155.241160] ---[ end trace 0000000000000000 ]---
[  155.247904]=20

The crash is seen only with CONFIG_KASAN enabled.

After disabling KASAN the test runs to completion.

# cat .config | grep KASAN
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
CONFIG_ARCH_DISABLE_KASAN_INLINE=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
# CONFIG_KASAN is not set
#

1..1
# selftests: powerpc/mce: inject-ra-err
[   42.777173] Disabling lock debugging due to kernel taint
[   42.777195] MCE: CPU2: machine check (Severe)  Real address =
Load/Store (foreign/control memory) [Not recovered]
[   42.777203] MCE: CPU2: PID: 2920 Comm: inject-ra-err NIP: =
[0000000010000e48]
[   42.777208] MCE: CPU2: Initiator CPU
[   42.777210] MCE: CPU2: Unknown
# test: inject-ra-err
# tags: git_version:v6.0-rc1-0-g568035b01cfb
# success: inject-ra-err
ok 1 selftests: powerpc/mce: inject-ra-err

Same problem is seen with 5.19 as well.

- Sachin=
