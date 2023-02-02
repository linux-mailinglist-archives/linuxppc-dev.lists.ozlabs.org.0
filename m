Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84F68771E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 09:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6s9C0H3pz3f5y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 19:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSwyn1T9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSwyn1T9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6s8G034sz3cdx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 19:17:01 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31280S9d022616;
	Thu, 2 Feb 2023 08:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=wFWtsWl7jdHWXGu/ICKhA2vakJtqd/akmUYqFma9TRU=;
 b=ZSwyn1T9gGh9ckfiIUhsp740C93EagTwcvfr7pIyuY/FdkGXF/p65XvxFtvcOBaZnsas
 v5zBuPaICj10wBMtwC3TUyqZ6WzuTc/OTjHUHLYkfWfXLwwcIn9abwOe237k0xBcmtnP
 fvCz0lSwAIXcdyDNBgWGCwTH9/hNhe8qGofF9RW3b6RYg+uadE4Ckb6R4VXQPTCe//eA
 BUCyxTT128xOVFF+yetPviavBtgOINvhrRpO5EgBbNWABTgywCE+4eENQhCy4SuMHZTh
 7DjSexQvPYcfXeE44nWWqHRPZW+IJJ3x/+llONMSzwqP38wIDu2R/h8SDbfsp4OsdvV2 JQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng6dec6fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 08:16:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311Kdd3t013277;
	Thu, 2 Feb 2023 08:16:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtydvyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 08:16:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3128GjF641091560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 08:16:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F059B2004B;
	Thu,  2 Feb 2023 08:16:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3892820040;
	Thu,  2 Feb 2023 08:16:44 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.16])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 08:16:44 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: WARN include/linux/trace_recursion.h:162 (powerpc)
Message-Id: <4C073F6A-C812-4C4A-BB7A-ECD10B75FB88@linux.ibm.com>
Date: Thu, 2 Feb 2023 13:46:32 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cc5xhqA99fV6Zx_V8axKiIb6hA39RnYV
X-Proofpoint-GUID: Cc5xhqA99fV6Zx_V8axKiIb6hA39RnYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=943 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020076
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
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Following warning is seen with 6.2.0-rc6-next-20230201 on a
Power10 server.

------------[ cut here ]------------
RCU not on for: check_return_regs_valid+0xc/0x1e0
WARNING: CPU: 9 PID: 0 at include/linux/trace_recursion.h:162 =
arch_ftrace_ops_list_func+0x2c0/0x2e0
Modules linked in: kmem device_dax rpadlpar_io rpaphp uinput torture =
vmac poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc =
ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc =
snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt =
crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache =
netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq =
zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod =
bonding tls rfkill sunrpc nd_pmem nd_btt dax_pmem papr_scm pseries_rng =
libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft =
crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: =
ipistorm(O)]
CPU: 9 PID: 0 Comm: swapper/9 Tainted: G O 6.2.0-rc6-next-20230201 #1
Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 =
of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
NIP: c0000000002ee8a0 LR: c0000000002ee89c CTR: 0000000000725d90
REGS: c0000003c372f530 TRAP: 0700 Tainted: G O (6.2.0-rc6-next-20230201)
MSR: 8000000000021033 <SF,ME,IR,DR,RI,LE> CR: 28002824 XER: 00000002
CFAR: c000000000159fe0 IRQMASK: 3=20
GPR00: c0000000002ee89c c0000003c372f7d0 c0000000013d0e00 =
0000000000000031=20
GPR04: 00000001000055ef c0000003c372f5a0 c0000003c372f598 =
0000000000000027=20
GPR08: c000000efef48010 000000000559c4c9 0000000000000027 =
c000000002928150=20
GPR12: 0000000048002824 c000000effff5300 c000000000034fc0 =
0000000000000000=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR24: 0000000000000000 c000000000035770 c000000000034fbc =
c0000003c372f8a0=20
GPR28: 0000000000000000 c0000003c3686600 0000000000000000 =
0000000000000000=20
NIP [c0000000002ee8a0] arch_ftrace_ops_list_func+0x2c0/0x2e0
LR [c0000000002ee89c] arch_ftrace_ops_list_func+0x2bc/0x2e0
Call Trace:
[c0000003c372f7d0] [c0000000002ee89c] =
arch_ftrace_ops_list_func+0x2bc/0x2e0 (unreliable)
[c0000003c372f870] [c000000000080bb4] ftrace_call+0x4/0x50
[c0000003c372fa20] [c000000000035770] =
interrupt_exit_kernel_prepare+0xb0/0x250
[c0000003c372fa70] [c00000000000da68] =
interrupt_return_srr_kernel+0x8/0x18c
--- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
NIP: c0000000000faf80 LR: c000000000b5c5f8 CTR: 0000000000000000
REGS: c0000003c372faa0 TRAP: 0900 Tainted: G O (6.2.0-rc6-next-20230201)
MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 22000284 =
XER: 00000000
CFAR: 0000000000000000 IRQMASK: 0=20
GPR00: 0000000000000000 c0000003c372fd40 c0000000013d0e00 =
0000000000000000=20
GPR04: 00000000000000c0 0000000000000080 00132735029f6191 =
0000000000000110=20
GPR08: 000000000001f400 0000000000000001 0000000000000000 =
0000000000000000=20
GPR12: 0000000000000090 c000000effff5300 0000000000000000 =
000000001eef7920=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
c0000000029f9a00=20
GPR24: 0000000000000001 0000073e58cd47b6 0000000000000000 =
0000000000000001=20
GPR28: c0000000029f9a00 0000000000000001 c0000000021620a8 =
c0000000021620b0=20
NIP [c0000000000faf80] plpar_hcall_norets_notrace+0x18/0x2c
LR [c000000000b5c5f8] check_and_cede_processor+0x48/0x60
--- interrupt: 900
[c0000003c372fd40] [c0000003c372fd70] 0xc0000003c372fd70 (unreliable)
[c0000003c372fda0] [c000000000b5c8d8] shared_cede_loop+0x78/0x170
[c0000003c372fde0] [c000000000efb518] cpuidle_enter_state+0xa8/0x558
[c0000003c372fe80] [c000000000b59660] cpuidle_enter+0x50/0x70
[c0000003c372fec0] [c0000000001ccd2c] call_cpuidle+0x4c/0x80
[c0000003c372fee0] [c0000000001d3fa0] do_idle+0x350/0x3b0
[c0000003c372ff60] [c0000000001d4238] cpu_startup_entry+0x38/0x40
[c0000003c372ff90] [c000000000065360] start_secondary+0x290/0x2a0
[c0000003c372ffe0] [c00000000000e358] start_secondary_prolog+0x10/0x14
Code: 3b800000 4bfffdbc 60000000 60000000 3c62ffe0 39200001 3d420164 =
7f44d378 386330a8 992a7de9 4be6b661 60000000 <0fe00000> fb010060 =
60000000 60000000=20
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
RCU not on for: shared_cede_loop+0xc/0x170

The code in question was added by
commit d099dbfd330686a8c09cd8944bcc77a56f9e7815
    cpuidle: tracing: Warn about !rcu_is_watching()

- Sachin=
