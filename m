Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB226C6684
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 12:27:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj32w5hbMz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:27:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FuoohEil;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FuoohEil;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj3201xB1z30hh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:26:16 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N9fhsi012465;
	Thu, 23 Mar 2023 11:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=xoje3N/M3YiHI7gHX+8r9SYjAJQE4s6xSGAisoOTOWw=;
 b=FuoohEil1GcdFM0P5mJuYEd4oC3MxFw+XYvhhiZgCs35BqC5QLoiVoLbCcTmOLENe0W5
 1aliHJHZEiBAAC3M/4+yoAM98POx9gxzvRXMhgDuVxx6xT4gt6FkE49z9ue+k/hmqViJ
 BVrJ4c3BQzXeZWqYGwMlABCjwuQ34w1eV7L8MHXrSnuw096gNJf21WsRM8QVAIkpUeer
 WTSWkUwwp1jttQs+LacILhdQS1pz40WcMSNqBat5WwNyn+84wmSsjgLCJLrw4CzzMk6u
 DHHNJCi5ttT+FanEi1H5qhvW10ILFgdf6uryhZpbTYD5vTv0gCe+gjQPgIiYLZHoWs9n 5Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgmc2javn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 11:26:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32N9QxWd017855;
	Thu, 23 Mar 2023 11:26:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6f8j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 11:26:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NBQ5CG27198198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 11:26:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF3EE20043;
	Thu, 23 Mar 2023 11:26:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 023B520040;
	Thu, 23 Mar 2023 11:26:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.16])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 11:26:04 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: [next-20230322] Kernel WARN at kernel/workqueue.c:3182 (rcutorture)
Message-Id: <139BEB3F-BC1C-4ABA-8928-9A8EF3FB5EDD@linux.ibm.com>
Date: Thu, 23 Mar 2023 16:55:54 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iUE4C630IDqL7XBPTaUONAr9MgdWcVdJ
X-Proofpoint-ORIG-GUID: iUE4C630IDqL7XBPTaUONAr9MgdWcVdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230084
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
Cc: linux-next@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running rcutorture tests from LTP on an IBM Power10 server booted =
with
6.3.0-rc3-next-20230322 following warning is observed:

[ 3629.242831] ------------[ cut here ]------------
[ 3629.242835] WARNING: CPU: 8 PID: 614614 at kernel/workqueue.c:3182 =
__flush_work.isra.44+0x44/0x370
[ 3629.242845] Modules linked in: rcutorture(-) torture vmac =
poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc =
ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc =
snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt =
crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache =
netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq =
zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod =
bonding rfkill tls sunrpc kmem device_dax nd_pmem nd_btt dax_pmem =
papr_scm pseries_rng libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod =
t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse =
[last unloaded: ltp_uaccess(O)]
[ 3629.242911] CPU: 8 PID: 614614 Comm: modprobe Tainted: G O =
6.3.0-rc3-next-20230322 #1
[ 3629.242917] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[ 3629.242923] NIP: c00000000018c204 LR: c00000000022306c CTR: =
c0000000002233c0
[ 3629.242927] REGS: c0000005c14e3880 TRAP: 0700 Tainted: G O =
(6.3.0-rc3-next-20230322)
[ 3629.242932] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
CR: 48002222 XER: 0000000a
[ 3629.242943] CFAR: c00000000018c5b0 IRQMASK: 0=20
[ 3629.242943] GPR00: c00000000022306c c0000005c14e3b20 c000000001401200 =
c00800000c4419e8=20
[ 3629.242943] GPR04: 0000000000000001 0000000000000001 0000000000000011 =
fffffffffffe0000=20
[ 3629.242943] GPR08: c000000efe9a8300 0000000000000001 0000000000000000 =
c00800000c42afe0=20
[ 3629.242943] GPR12: c0000000002233c0 c000000effff6700 0000000000000000 =
0000000000000000=20
[ 3629.242943] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.242943] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.242943] GPR24: c00800000c443400 c00800000c440f60 c00800000c4418c8 =
c000000002abb368=20
[ 3629.242943] GPR28: c00800000c440f58 0000000000000000 c00800000c4419e8 =
c00800000c443400=20
[ 3629.242987] NIP [c00000000018c204] __flush_work.isra.44+0x44/0x370
[ 3629.242993] LR [c00000000022306c] cleanup_srcu_struct+0x6c/0x1e0
[ 3629.242998] Call Trace:
[ 3629.243000] [c0000005c14e3b20] [c00800000c440f58] =
srcu9+0x0/0xfffffffffffef0a8 [rcutorture] (unreliable)
[ 3629.243009] [c0000005c14e3bb0] [c00000000022306c] =
cleanup_srcu_struct+0x6c/0x1e0
[ 3629.243015] [c0000005c14e3c50] [c000000000223428] =
srcu_module_notify+0x68/0x180
[ 3629.243021] [c0000005c14e3c90] [c00000000019a1e0] =
notifier_call_chain+0xc0/0x1b0
[ 3629.243027] [c0000005c14e3cf0] [c00000000019ad24] =
blocking_notifier_call_chain+0x64/0xa0
[ 3629.243033] [c0000005c14e3d30] [c00000000024a4c8] =
sys_delete_module+0x1f8/0x3c0
[ 3629.243039] [c0000005c14e3e10] [c000000000037480] =
system_call_exception+0x140/0x350
[ 3629.243044] [c0000005c14e3e50] [c00000000000d6a0] =
system_call_common+0x160/0x2e4
[ 3629.243050] --- interrupt: c00 at 0x7fff8cd39558
[ 3629.243054] NIP: 00007fff8cd39558 LR: 000000010d800398 CTR: =
0000000000000000
[ 3629.243057] REGS: c0000005c14e3e80 TRAP: 0c00 Tainted: G O =
(6.3.0-rc3-next-20230322)
[ 3629.243062] MSR: 800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 28008282 XER: 00000000
[ 3629.243072] IRQMASK: 0=20
[ 3629.243072] GPR00: 0000000000000081 00007fffe99fd9c0 00007fff8ce07300 =
000000013df30ec8=20
[ 3629.243072] GPR04: 0000000000000800 000000000000000a 1999999999999999 =
0000000000000000=20
[ 3629.243072] GPR08: 00007fff8cd98160 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.243072] GPR12: 0000000000000000 00007fff8d5fcb50 000000010d80a650 =
000000010d80a648=20
[ 3629.243072] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000010d80a428=20
[ 3629.243072] GPR20: 000000010d830068 0000000000000000 00007fffe99ff2f8 =
000000013df304f0=20
[ 3629.243072] GPR24: 0000000000000000 00007fffe99ff2f8 000000013df30ec8 =
0000000000000000=20
[ 3629.243072] GPR28: 0000000000000000 000000013df30e60 000000013df30ec8 =
000000013df30e60=20
[ 3629.243115] NIP [00007fff8cd39558] 0x7fff8cd39558
[ 3629.243118] LR [000000010d800398] 0x10d800398
[ 3629.243121] --- interrupt: c00
[ 3629.243123] Code: 89292e39 f821ff71 e94d0c78 f9410068 39400000 =
69290001 0b090000 fbc10080 7c7e1b78 e9230018 7d290074 7929d182 =
<0b090000> 7c0802a6 fb810070 f80100a0=20
[ 3629.243138] ---[ end trace 0000000000000000 ]=E2=80=94

Followed by following traces:

[ 3629.243149] ------------[ cut here ]------------
[ 3629.243152] WARNING: CPU: 8 PID: 614614 at kernel/rcu/srcutree.c:663 =
cleanup_srcu_struct+0x11c/0x1e0
[ 3629.243159] Modules linked in: rcutorture(-) torture vmac =
poly1305_generic chacha_generic chacha20poly1305 n_gsm pps_ldisc =
ppp_synctty ppp_async ppp_generic serport slcan can_dev slip slhc =
snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore pcrypt =
crypto_user n_hdlc dummy veth tun nfsv3 nfs_acl nfs lockd grace fscache =
netfs brd overlay exfat vfat fat btrfs blake2b_generic xor raid6_pq =
zstd_compress xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod =
bonding rfkill tls sunrpc kmem device_dax nd_pmem nd_btt dax_pmem =
papr_scm pseries_rng libnvdimm vmx_crypto ext4 mbcache jbd2 sd_mod =
t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse =
[last unloaded: ltp_uaccess(O)]
[ 3629.243217] CPU: 8 PID: 614614 Comm: modprobe Tainted: G W O =
6.3.0-rc3-next-20230322 #1
[ 3629.243222] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1030.00 (NH1030_026) hv:phyp pSeries
[ 3629.243227] NIP: c00000000022311c LR: c0000000002230d8 CTR: =
c0000000002233c0
[ 3629.243230] REGS: c0000005c14e3910 TRAP: 0700 Tainted: G W O =
(6.3.0-rc3-next-20230322)
[ 3629.243235] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
CR: 28002228 XER: 0000000a
[ 3629.243245] CFAR: c0000000008040c0 IRQMASK: 0=20
[ 3629.243245] GPR00: c0000000002230b8 c0000005c14e3bb0 c000000001401200 =
0000000000000040=20
[ 3629.243245] GPR04: 0000000000000040 0000000000000040 0000000000000011 =
fffffffffffe0000=20
[ 3629.243245] GPR08: ffffffffffffffff 0000000000000001 0000000000000000 =
c00800000c42afe0=20
[ 3629.243245] GPR12: c0000000002233c0 c000000effff6700 0000000000000000 =
0000000000000000=20
[ 3629.243245] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.243245] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.243245] GPR24: c00800000c443400 c00800000c440f60 c00800000c4418c8 =
c000000002bdabe0=20
[ 3629.243245] GPR28: c00800000c440f58 c000000002bdbe00 0000000000000040 =
c009fffffeb8c500=20
[ 3629.243288] NIP [c00000000022311c] cleanup_srcu_struct+0x11c/0x1e0
[ 3629.243293] LR [c0000000002230d8] cleanup_srcu_struct+0xd8/0x1e0
[ 3629.243298] Call Trace:
[ 3629.243300] [c0000005c14e3bb0] [c0000000002230b8] =
cleanup_srcu_struct+0xb8/0x1e0 (unreliable)
[ 3629.243306] [c0000005c14e3c50] [c000000000223428] =
srcu_module_notify+0x68/0x180
[ 3629.243312] [c0000005c14e3c90] [c00000000019a1e0] =
notifier_call_chain+0xc0/0x1b0
[ 3629.243318] [c0000005c14e3cf0] [c00000000019ad24] =
blocking_notifier_call_chain+0x64/0xa0
[ 3629.243324] [c0000005c14e3d30] [c00000000024a4c8] =
sys_delete_module+0x1f8/0x3c0
[ 3629.243329] [c0000005c14e3e10] [c000000000037480] =
system_call_exception+0x140/0x350
[ 3629.243335] [c0000005c14e3e50] [c00000000000d6a0] =
system_call_common+0x160/0x2e4
[ 3629.243341] --- interrupt: c00 at 0x7fff8cd39558
[ 3629.243344] NIP: 00007fff8cd39558 LR: 000000010d800398 CTR: =
0000000000000000
[ 3629.243348] REGS: c0000005c14e3e80 TRAP: 0c00 Tainted: G W O =
(6.3.0-rc3-next-20230322)
[ 3629.243353] MSR: 800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 28008282 XER: 00000000
[ 3629.243363] IRQMASK: 0=20
[ 3629.243363] GPR00: 0000000000000081 00007fffe99fd9c0 00007fff8ce07300 =
000000013df30ec8=20
[ 3629.243363] GPR04: 0000000000000800 000000000000000a 1999999999999999 =
0000000000000000=20
[ 3629.243363] GPR08: 00007fff8cd98160 0000000000000000 0000000000000000 =
0000000000000000=20
[ 3629.243363] GPR12: 0000000000000000 00007fff8d5fcb50 000000010d80a650 =
000000010d80a648=20
[ 3629.243363] GPR16: 0000000000000000 0000000000000001 0000000000000000 =
000000010d80a428=20
[ 3629.243363] GPR20: 000000010d830068 0000000000000000 00007fffe99ff2f8 =
000000013df304f0=20
[ 3629.243363] GPR24: 0000000000000000 00007fffe99ff2f8 000000013df30ec8 =
0000000000000000=20
[ 3629.243363] GPR28: 0000000000000000 000000013df30e60 000000013df30ec8 =
000000013df30e60=20
[ 3629.243407] NIP [00007fff8cd39558] 0x7fff8cd39558
[ 3629.243410] LR [000000010d800398] 0x10d800398
[ 3629.243413] --- interrupt: c00
[ 3629.243415] Code: 419dffa4 e93a0078 39400001 552907be 2f890000 =
7d20579e 0b090000 e95a0078 e91a0080 39200001 7fa85000 7d204f9e =
<0b090000> 7f23cb78 4bfffd65 0b030000=20
[ 3629.243430] ---[ end trace 0000000000000000 ]=E2=80=94

These warnings are repeated few times. The LTP test is marked as PASS.

Git bisect point to the following patch
commit f46a5170e6e7d5f836f2199fe82cdb0b4363427f
    srcu: Use static init for statically allocated in-module srcu_struct


Thanks
- Sachin=
