Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD98A417F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 11:17:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fHuMCzhi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHPny2c9qz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 19:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fHuMCzhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHPn85FpWz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 19:16:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43E8q8YS003038;
	Sun, 14 Apr 2024 09:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=oFxpuBwyKlglKF0ZlBZ/TTfkdhNYzTIxxUO89DdUGYU=;
 b=fHuMCzhifwCw8N8Ss2+eNZFjzypQTusJZGsbOY0GB5YYXqSZQpZxIxg2Yi9oMKu9o3+T
 xbn5jrQOBOpGvPZEsC1g+rJ5OU3M23PICG1xexGaimERZqCQDHtPynJPlvuVWtyFQe61
 q1/w6cq/1c90g6H3TC5FGH212bJk0EGnjcBChQFXqZlTdD9w2lv11IeYrc6bmLqyDqGo
 gZZa2OMWuYyHYXntrD3cWnDA7oszqVyfTbthrzjZOI83ImeggWK8OEYDIcQ+bPYpFYeC
 fHaA8E2qqB7EsI8nWqE2mQ3OBkq4xmCVE8yPeEQTeMEGvCs2wr6o/dkPBhIUgkXyeKKu nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xfhsd1r3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 09:16:16 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43E9GGtJ001320;
	Sun, 14 Apr 2024 09:16:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xfhsd1r3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 09:16:16 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43E668Xt015835;
	Sun, 14 Apr 2024 09:16:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vkshcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 09:16:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43E9G2ME43123180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Apr 2024 09:16:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7674E20040;
	Sun, 14 Apr 2024 09:16:02 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1008B20049;
	Sun, 14 Apr 2024 09:16:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.83.81])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Apr 2024 09:16:00 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: [powerpc] WARN at drivers/md/dm-bio-prison-v1.c:128 [dm_bio_prison]
Message-Id: <6AD6FB25-14C0-48B7-A72C-0F9129ECBAEB@linux.ibm.com>
Date: Sun, 14 Apr 2024 14:45:49 +0530
To: dm-devel@redhat.com, linux-block@vger.kernel.org
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i398UtKSC3aR1sVWIMwT3S5K6DmGU5bN
X-Proofpoint-ORIG-GUID: FNlRFoJBgq80NEEh4a0X45ITd7APiqIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-13_11,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404140067
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
Cc: snitzer@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running file system tests (xfstest) on IBM Power following warning
was seen:

[ 750.845015] run fstests generic/347 at 2024-04-13 03:58:42
[ 751.017900] XFS (loop0): Mounting V5 Filesystem =
998a731d-ad3f-467d-ad31-92990b381696
[ 751.019105] XFS (loop0): Ending clean mount
[ 751.372715] ------------[ cut here ]------------
[ 751.372729] WARNING: CPU: 2 PID: 12 at =
drivers/md/dm-bio-prison-v1.c:128 dm_cell_key_has_valid_range+0x44/0x68 =
[dm_bio_prison]
[ 751.372741] Modules linked in: dm_thin_pool dm_persistent_data =
dm_bio_prison dm_snapshot dm_bufio dm_flakey xfs loop dm_mod =
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet =
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat =
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set =
nf_tables libcrc32c nfnetlink sunrpc pseries_rng vmx_crypto fuse ext4 =
mbcache jbd2 sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft crc64 =
sg ibmvscsi scsi_transport_srp ibmveth [last unloaded: scsi_debug]
[ 751.372785] CPU: 2 PID: 12 Comm: kworker/u256:1 Kdump: loaded Not =
tainted 6.9.0-rc3-next-20240412 #1
[ 751.372790] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 =
0xf000006 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
[ 751.372795] Workqueue: dm-thin do_worker [dm_thin_pool]
[ 751.372801] NIP: c00800000ca80100 LR: c00800000cfd66e8 CTR: =
c00800000ca800bc
[ 751.372805] REGS: c000000004bbf9b0 TRAP: 0700 Not tainted =
(6.9.0-rc3-next-20240412)
[ 751.372810] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> =
CR: 44002482 XER: 20040000
[ 751.372820] CFAR: c00800000ca800d4 IRQMASK: 0=20
[ 751.372820] GPR00: c00800000cfd66e8 c000000004bbfc50 c00800000d008b00 =
c000000004bbfcb8=20
[ 751.372820] GPR04: c0000001f7afb1b8 c000000156dd4a30 0000000000000005 =
0000000000000400=20
[ 751.372820] GPR08: 0000000000001000 0000000000001000 0000000000000000 =
c00800000cfdf390=20
[ 751.372820] GPR12: c00800000ca800bc c000000effffcf00 c0000000001a063c =
c000000004045380=20
[ 751.372820] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 751.372820] GPR20: c000000004082000 c000000156dd4890 0000000000000001 =
c00000006683d24c=20
[ 751.372820] GPR24: c000000156dd4a40 0000000000000000 0000000000000000 =
c00000006683d200=20
[ 751.372820] GPR28: c0000001f7afb1b8 c00000006683d200 0000000000000000 =
0000000000001000=20
[ 751.372865] NIP [c00800000ca80100] =
dm_cell_key_has_valid_range+0x44/0x68 [dm_bio_prison]
[ 751.372871] LR [c00800000cfd66e8] process_discard_bio+0xac/0x1f0 =
[dm_thin_pool]
[ 751.372877] Call Trace:
[ 751.372880] [c000000004bbfd00] [c00800000cfd89d4] =
process_thin_deferred_bios+0x158/0x428 [dm_thin_pool]
[ 751.372887] [c000000004bbfdc0] [c00800000cfd8d00] =
process_deferred_bios+0x5c/0x2f4 [dm_thin_pool]
[ 751.372894] [c000000004bbfe00] [c00800000cfd9098] =
do_worker+0x100/0x1f8 [dm_thin_pool]
[ 751.372900] [c000000004bbfe40] [c00000000019326c] =
process_one_work+0x20c/0x4f4
[ 751.372908] [c000000004bbfef0] [c0000000001941ec] =
worker_thread+0x378/0x544
[ 751.372914] [c000000004bbff90] [c0000000001a076c] kthread+0x138/0x140
[ 751.372919] [c000000004bbffe0] [c00000000000df98] =
start_kernel_thread+0x14/0x18
[ 751.372924] Code: 28280400 4181002c 3929ffff 794ab282 38600001 =
7929b282 7c2a4800 40820024 786307e0 4e800020 60000000 60000000 =
<0fe00000> 38600000 786307e0 4e800020=20
[ 751.372938] ---[ end trace 0000000000000000 ]---
[ 751.372941] device-mapper: thin: Discard doesn't respect bio prison =
limits
[ 751.373000] device-mapper: thin: Discard doesn't respect bio prison =
limits
[ 751.373022] device-mapper: thin: Discard doesn't respect bio prison =
limits

This WARN_ON_ONCE was introduced by

commit 3f8d3f5432078a558151e27230e20bcf93c23ffe
    dm bio prison v1: add dm_cell_key_has_valid_range


bool dm_cell_key_has_valid_range(struct dm_cell_key *key)
{
        if (WARN_ON_ONCE(key->block_end - key->block_begin > =
BIO_PRISON_MAX_RANGE))
                return false;

=E2=80=94 Sachin

