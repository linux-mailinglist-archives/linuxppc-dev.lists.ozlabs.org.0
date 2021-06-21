Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AF3AE348
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 08:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7fqW2bB6z3bt8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 16:33:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=munKmZWZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=munKmZWZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7fpz6TMfz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 16:32:59 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L6FpRY139667; Mon, 21 Jun 2021 02:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=O9zYjVhYikxnBn0/u78dWoKTBAkFXxzezy2KUgZiIf4=;
 b=munKmZWZdPmGmq+8Qhe3z4wipTtJKOs1VYUjy5s+PXs87cda/zyMLUgpJ+iB9bGRs8oQ
 edw6L1jwdYbOzLur036O5NRPshJ6Op9eQHs0YnibW2QhvNEJQfclrN7vfwSPKaFAmRDg
 FN0K8f4kwOktWUocDX3UNmst6KpVH5Qg7J+f1ZRDr50vFzFxR7v+ouCI3JlCxRNPQWb/
 rT4cLj4YzKgPeNgppa07A3RMXH0SEJ3lzV18srT4+q8wPaSTlm6IpL8IFkJYs0iXgC+P
 CwG1hCu3spHAZCJjCiCG8HFMcFZPbFivZKOCZqLsmvlRs8VRqKFk0mrnRBTlw7dbrEF9 Tw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39anbkrbu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 02:32:49 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15L6Rrru006792;
 Mon, 21 Jun 2021 06:32:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3998788ce4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 06:32:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15L6VOqQ33685780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 06:31:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12A7E52050;
 Mon, 21 Jun 2021 06:32:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.196.19])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 359405204E;
 Mon, 21 Jun 2021 06:32:41 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401) while
 running LTP tests
Message-Id: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
Date: Mon, 21 Jun 2021 12:02:39 +0530
To: linux-kernel@vger.kernel.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r1XWqMWVYYOEqLqryipwYvqdythfyKrz
X-Proofpoint-GUID: r1XWqMWVYYOEqLqryipwYvqdythfyKrz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_02:2021-06-20,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210034
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
Cc: peterz@infradead.org, odin@uged.al, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running LTP tests (cfs_bandwidth01) against 5.13.0-rc7 kernel on a =
powerpc box
following warning is seen

[ 6611.331827] ------------[ cut here ]------------
[ 6611.331855] rq->tmp_alone_branch !=3D &rq->leaf_cfs_rq_list
[ 6611.331862] WARNING: CPU: 8 PID: 0 at kernel/sched/fair.c:401 =
unthrottle_cfs_rq+0x4cc/0x590
[ 6611.331883] Modules linked in: nfsv3 nfs_acl nfs lockd grace fscache =
netfs tun brd overlay vfat fat btrfs blake2b_generic xor zstd_compress =
raid6_pq xfs loop sctp ip6_udp_tunnel udp_tunnel libcrc32c dm_mod =
bonding rfkill sunrpc pseries_rng xts vmx_crypto sch_fq_codel ip_tables =
ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp =
fuse [last unloaded: init_module]
[ 6611.331957] CPU: 8 PID: 0 Comm: swapper/8 Tainted: G           OE     =
5.13.0-rc6-gcba5e97280f5 #1
[ 6611.331968] NIP:  c0000000001b7aac LR: c0000000001b7aa8 CTR: =
c000000000722d30
[ 6611.331976] REGS: c00000000274f3a0 TRAP: 0700   Tainted: G           =
OE      (5.13.0-rc6-gcba5e97280f5)
[ 6611.331985] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48000224  XER: 00000005
[ 6611.332002] CFAR: c00000000014ca20 IRQMASK: 1=20
[ 6611.332002] GPR00: c0000000001b7aa8 c00000000274f640 c000000001abaf00 =
000000000000002d=20
[ 6611.332002] GPR04: 00000000ffff7fff c00000000274f300 0000000000000027 =
c000000efdb07e08=20
[ 6611.332002] GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c000000001976680=20
[ 6611.332002] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f90 =
000000001eefe200=20
[ 6611.332002] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 6611.332002] GPR20: 0000000000000001 c000000000fa6c08 c000000000fa6030 =
0000000000000001=20
[ 6611.332002] GPR24: 0000000000000000 0000000000000000 c000000efde12380 =
0000000000000001=20
[ 6611.332002] GPR28: 0000000000000001 0000000000000000 c000000efde12400 =
0000000000000000=20
[ 6611.332094] NIP [c0000000001b7aac] unthrottle_cfs_rq+0x4cc/0x590
[ 6611.332104] LR [c0000000001b7aa8] unthrottle_cfs_rq+0x4c8/0x590
[ 6611.332113] Call Trace:
[ 6611.332116] [c00000000274f640] [c0000000001b7aa8] =
unthrottle_cfs_rq+0x4c8/0x590 (unreliable)
[ 6611.332128] [c00000000274f6e0] [c0000000001b7e38] =
distribute_cfs_runtime+0x1d8/0x280
[ 6611.332139] [c00000000274f7b0] [c0000000001b81d0] =
sched_cfs_period_timer+0x140/0x330
[ 6611.332149] [c00000000274f870] [c00000000022a03c] =
__hrtimer_run_queues+0x17c/0x380
[ 6611.332158] [c00000000274f8f0] [c00000000022ac68] =
hrtimer_interrupt+0x128/0x2f0
[ 6611.332168] [c00000000274f9a0] [c00000000002940c] =
timer_interrupt+0x13c/0x370
[ 6611.332179] [c00000000274fa00] [c000000000009c04] =
decrementer_common_virt+0x1a4/0x1b0
[ 6611.332189] --- interrupt: 900 at =
plpar_hcall_norets_notrace+0x18/0x24
[ 6611.332199] NIP:  c0000000000f6af8 LR: c000000000a05f68 CTR: =
0000000000000000
[ 6611.332206] REGS: c00000000274fa70 TRAP: 0900   Tainted: G           =
OE      (5.13.0-rc6-gcba5e97280f5)
[ 6611.332214] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28000224  XER: 00000000
[ 6611.332234] CFAR: 0000000000000c00 IRQMASK: 0=20
[ 6611.332234] GPR00: 0000000000000000 c00000000274fd10 c000000001abaf00 =
0000000000000000=20
[ 6611.332234] GPR04: 00000000000000c0 0000000000000080 0001a91c68b80fa1 =
00000000000003dc=20
[ 6611.332234] GPR08: 000000000001f400 0000000000000001 0000000000000000 =
0000000000000000=20
[ 6611.332234] GPR12: 0000000000000000 c000000effc0be80 c000000ef07b3f90 =
000000001eefe200=20
[ 6611.332234] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 6611.332234] GPR20: 0000000000000001 0000000000000002 0000000000000010 =
c0000000019fe2f8=20
[ 6611.332234] GPR24: 0000000000000001 00000603517d757e 0000000000000000 =
0000000000000000=20
[ 6611.332234] GPR28: 0000000000000001 0000000000000000 c000000001231f90 =
c000000001231f98=20
[ 6611.332323] NIP [c0000000000f6af8] =
plpar_hcall_norets_notrace+0x18/0x24
[ 6611.332332] LR [c000000000a05f68] check_and_cede_processor+0x48/0x60
[ 6611.332340] --- interrupt: 900
[ 6611.332345] [c00000000274fd10] [c000000efdb92380] 0xc000000efdb92380 =
(unreliable)
[ 6611.332355] [c00000000274fd70] [c000000000a063bc] =
dedicated_cede_loop+0x9c/0x1b0
[ 6611.332364] [c00000000274fdc0] [c000000000a02b04] =
cpuidle_enter_state+0x2e4/0x4e0
[ 6611.332375] [c00000000274fe20] [c000000000a02da0] =
cpuidle_enter+0x50/0x70
[ 6611.332385] [c00000000274fe60] [c0000000001a883c] =
call_cpuidle+0x4c/0x80
[ 6611.332393] [c00000000274fe80] [c0000000001a8ee0] do_idle+0x380/0x3e0
[ 6611.332402] [c00000000274ff00] [c0000000001a91bc] =
cpu_startup_entry+0x3c/0x40
[ 6611.332411] [c00000000274ff30] [c000000000063ff8] =
start_secondary+0x298/0x2b0
[ 6611.332421] [c00000000274ff90] [c00000000000c754] =
start_secondary_prolog+0x10/0x14
[ 6611.332430] Instruction dump:
[ 6611.332435] 4bfffc44 3d22fff6 8929f328 2f890000 409efea4 39200001 =
3d42fff6 3c62ff4f=20
[ 6611.332451] 3863bcd8 992af328 4bf94f15 60000000 <0fe00000> 4bfffe80 =
7f6407b4 7f43d378=20
[ 6611.332466] ---[ end trace 1346f865cd1cae91 ]=E2=80=94

5.13.0-rc6 was good. Bisect points to following patch

commit a7b359fc6a37
sched/fair: Correctly insert cfs_rq's to list on unthrottle

The test runs to completion(without this warning) if the patch is =
reverted.

Thanks
-Sachin

