Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC846862BC7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 17:32:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJAjd7SY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjTnH4K92z3cRd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 03:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJAjd7SY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjTmW4MC6z2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 03:32:11 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41PEUmnT018902;
	Sun, 25 Feb 2024 16:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=L1aXfVUt122bzamlXskyPuF+10LSL46ZGKKDv8sgeHo=;
 b=dJAjd7SYkeyOJiMitfN8J3S4QCGqaKUbv7Z89X5C4doEfyr3pu39bOkAQpRkXIDYc3Cn
 nqd45YGVkLx6HoRKLqs23z5YJ1o/0kHX8IWpz/1I9tG5b2gU/Xq5PjNEFWOkzAnI2KJe
 Jgcwz/hjliPx4/tKBw+0kmHO1hc7ynyyvQt8acH7kEhtmXlrw/Odx9S/969vufIC6OiQ
 2r980+CDcrWbR9zyxCaUtpP83VVNo1qkqSh+CAVGrYSctb6Im3Y6UiNCNm0jGAtkALgV
 Yv9Mw5+zNDYP69LbNNuhSaCnAQnorIgUS05CwBINGDX9cAG8c7gisUi00+Lay7cX0JKJ 6A== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wg7cj9856-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 16:32:07 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41PDcqIA024154;
	Sun, 25 Feb 2024 16:32:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0jubg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 16:32:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41PGW38J24642126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 25 Feb 2024 16:32:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05CE920067;
	Sun, 25 Feb 2024 16:32:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4975520063;
	Sun, 25 Feb 2024 16:32:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.48.90])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 25 Feb 2024 16:32:01 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace kernel
 selftests
Message-Id: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
Date: Sun, 25 Feb 2024 22:01:50 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qSodc_Lz8a9ctneSEKO1neiNU2DyOOBw
X-Proofpoint-GUID: qSodc_Lz8a9ctneSEKO1neiNU2DyOOBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_18,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=764 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402250132
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running ftrace specific kernel selftests following warning
is seen on a Power10 logical partition (LPAR) booted with
latest mainline kernel.

------------[ cut here ]------------
precision 63492 too large
WARNING: CPU: 15 PID: 2538829 at lib/vsprintf.c:2721 =
set_precision+0x68/0xa4
Modules linked in: nvram rpadlpar_io rpaphp uinput torture vmac =
poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc =
ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc =
snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt =
crypto_user n_hdlc dummy veth tun nfsv3 nfs netfs brd overlay exfat vfat =
fat btrfs blake2b_generic xor raid6_pq zstd_compress xfs loop sctp =
ip6_udp_tunnel udp_tunnel nfsd auth_rpcgss nfs_acl lockd grace configs =
dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set =
nf_tables libcrc32c nfnetlink sunrpc pseries_rng vmx_crypto ext4 mbcache =
jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi ibmveth =
scsi_transport_srp fuse [last unloaded: test_cpuidle_latency(O)]
CPU: 15 PID: 2538829 Comm: awk Tainted: G M O K 6.8.0-rc5-gfca7526b7d89 =
#1
Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
NIP: c000000000f57c34 LR: c000000000f57c30 CTR: c000000000f5cdf0
REGS: c000000a58e4f5f0 TRAP: 0700 Tainted: G M O K =
(6.8.0-rc5-gfca7526b7d89)
MSR: 8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE> CR: 48000824 XER: =
00000005
CFAR: c00000000016154c IRQMASK: 0=20
GPR00: c000000000f57c30 c000000a58e4f890 c000000001482800 =
0000000000000019=20
GPR04: 0000000100011559 c000000a58e4f660 c000000a58e4f658 =
0000000000000027=20
GPR08: c000000e84e37c10 0000000000000001 0000000000000027 =
c000000002a47e50=20
GPR12: 0000000000000000 c000000e87bf7300 0000000000000000 =
0000000000000000=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR20: c0000004a43ec590 0000000000400cc0 0000000000000003 =
c0000000012c3e65=20
GPR24: c000000a58e4fa18 0000000000000025 0000000000000020 =
000000000001ff97=20
GPR28: c0000001168a00dd c0000001168c0074 c000000a58e4f920 =
000000000000f804=20
NIP [c000000000f57c34] set_precision+0x68/0xa4
LR [c000000000f57c30] set_precision+0x64/0xa4
Call Trace:
[c000000a58e4f890] [c000000000f57c30] set_precision+0x64/0xa4 =
(unreliable)
[c000000a58e4f900] [c000000000f5ccc4] vsnprintf+0x198/0x4c8
[c000000a58e4f980] [c000000000f53228] seq_buf_vprintf+0x50/0xa0
[c000000a58e4f9b0] [c00000000031cec0] trace_seq_printf+0x60/0xe0
[c000000a58e4f9e0] [c00000000031b5f0] trace_print_print+0x78/0xa4
[c000000a58e4fa60] [c0000000003133a4] print_trace_line+0x2ac/0x6d8
[c000000a58e4fb20] [c0000000003145c0] s_show+0x58/0x2c0
[c000000a58e4fba0] [c0000000005dfb2c] seq_read_iter+0x448/0x618
[c000000a58e4fc70] [c0000000005dfe08] seq_read+0x10c/0x174
[c000000a58e4fd10] [c00000000059a7e0] vfs_read+0xe0/0x39c
[c000000a58e4fdc0] [c00000000059b59c] ksys_read+0x7c/0x140
[c000000a58e4fe10] [c000000000035d74] system_call_exception+0x134/0x330
[c000000a58e4fe50] [c00000000000d6a0] system_call_common+0x160/0x2e4
--- interrupt: c00 at 0x7fff84521684
NIP: 00007fff84521684 LR: 00000001252f0dc4 CTR: 0000000000000000
REGS: c000000a58e4fe80 TRAP: 0c00 Tainted: G M O K =
(6.8.0-rc5-gfca7526b7d89)
MSR: 800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE> CR: 22000202 XER: =
00000000
IRQMASK: 0=20
GPR00: 0000000000000003 00007fffcd076c30 00007fff84607300 =
0000000000000005=20
GPR04: 000000012a8a1a20 0000000000010000 fffffffffffffff5 =
000000012a9bcce6=20
GPR08: 0000000000000001 0000000000000000 0000000000000000 =
0000000000000000=20
GPR12: 0000000000000000 00007fff84a5d2a0 0000000000000001 =
000000012a8851d8=20
GPR16: 000000012a884268 00007fff84601888 0000000125377f50 =
00007fff84601880=20
GPR20: 0000000000000044 000000000000000f ffffffffffffffff =
0000000000000000=20
GPR24: 00007fffcd076e48 00007fffcd076d98 0000000000000000 =
0000000000000000=20
GPR28: 00007fffcd076e48 0000000000000000 00007fffcd076da0 =
000000012a8a1900=20
NIP [00007fff84521684] 0x7fff84521684
LR [00000001252f0dc4] 0x1252f0dc4
--- interrupt: c00
Code: f821ff91 2f890000 409e0034 7c0802a6 3c62fff0 39200001 3d420177 =
3863e310 992ad6db f8010080 4b209899 60000000 <0fe00000> e8010080 =
7c0803a6 2f9f0000=20
---[ end trace 0000000000000000 ]=E2=80=94

This warning is seen while running test that was added by
following commit:

commit 3bf7009251f0f41cdd0188ab7b3879df81810703
     tracing/selftests: Add test to test the trace_marker


- Sachin=
