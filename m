Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C05413AFE16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 09:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8JFx2X9jz305r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 17:40:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZzIKOpEL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZzIKOpEL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8JFM4LtYz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 17:39:34 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M7XelO016992; Tue, 22 Jun 2021 03:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=ps+MxyIj04uVEqtlFH1SnSoPVeb9c0uCF51LMtYCfdI=;
 b=ZzIKOpELz4RZgla9tKGfmSOb+2QU2jwfVwefybrV12IRGruCFz4gbtHGRavmjaINa3AG
 n+W+p1t34pVT7dbq4anectJ3TMXnbOYcpZO6R5Gln8+jmPUwrUZdXnMa7i+i98ivRagm
 J5/vL3398VZY7MXoNylv2K/FysZDbzl1fuROipHgBDEeyWNHxt/10/1IQ6GU+re+bw7I
 0osDLJIObg9gYBcsz60J8ViEsbpb3ow9rQov9j04fncxqraERj2GlvlUGCPaJZJ7S2bw
 hvGX5mHwaVGC+za3/HdbBk2Cu3KNEWBsUbxuhi7vtZ/j9r8+pzqjXsTQelsDxMT5tWwh Yg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bahp9nsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 03:39:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M7XI3V016244;
 Tue, 22 Jun 2021 07:39:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh999r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 07:39:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15M7c8Ms36503936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 07:38:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8417611C052;
 Tue, 22 Jun 2021 07:39:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B42211C054;
 Tue, 22 Jun 2021 07:39:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.86.62])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 07:39:24 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277 during
 boot
Message-Id: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
Date: Tue, 22 Jun 2021 13:09:23 +0530
To: open list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 10l99-e5z4-sKwoUIQuEsdcHfNcJ0eg8
X-Proofpoint-GUID: 10l99-e5z4-sKwoUIQuEsdcHfNcJ0eg8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_04:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 mlxlogscore=978 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220046
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 Odin Ugedal <odin@uged.al>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While booting 5.13.0-rc7-next-20210621 on a PowerVM LPAR following =
warning
is seen

[   30.922154] ------------[ cut here ]------------
[   30.922201] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || =
cfs_rq->avg.runnable_avg
[   30.922219] WARNING: CPU: 6 PID: 762 at kernel/sched/fair.c:3277 =
update_blocked_averages+0x758/0x780
[   30.922259] Modules linked in: pseries_rng xts vmx_crypto =
uio_pdrv_genirq uio sch_fq_codel ip_tables sd_mod t10_pi sg fuse
[   30.922309] CPU: 6 PID: 762 Comm: augenrules Not tainted =
5.13.0-rc7-next-20210621 #1
[   30.922329] NIP:  c0000000001b27e8 LR: c0000000001b27e4 CTR: =
c0000000007cfda0
[   30.922344] REGS: c000000023fcb660 TRAP: 0700   Not tainted  =
(5.13.0-rc7-next-20210621)
[   30.922359] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: =
48488224  XER: 00000005
[   30.922394] CFAR: c00000000014d120 IRQMASK: 1=20
               GPR00: c0000000001b27e4 c000000023fcb900 c000000002a08400 =
0000000000000048=20
               GPR04: 00000000ffff7fff c000000023fcb5c0 0000000000000027 =
c000000f6fdd7e18=20
               GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c0000000028a6650=20
               GPR12: 0000000000008000 c000000f6fff7680 c000000f6fe62600 =
0000000000000032=20
               GPR16: 00000007331a989a c000000f6fe62600 c0000000238a6800 =
0000000000000001=20
               GPR20: 0000000000000000 c000000002a4dfe0 0000000000000000 =
0000000000000006=20
               GPR24: 0000000000000000 c000000f6fe63010 0000000000000001 =
c000000f6fe62680=20
               GPR28: 0000000000000006 c0000000238a69c0 0000000000000000 =
c000000f6fe62600=20
[   30.922569] NIP [c0000000001b27e8] =
update_blocked_averages+0x758/0x780
[   30.922599] LR [c0000000001b27e4] update_blocked_averages+0x754/0x780
[   30.922624] Call Trace:
[   30.922631] [c000000023fcb900] [c0000000001b27e4] =
update_blocked_averages+0x754/0x780 (unreliable)
[   30.922653] [c000000023fcba20] [c0000000001bd668] =
newidle_balance+0x258/0x5c0
[   30.922674] [c000000023fcbab0] [c0000000001bdaac] =
pick_next_task_fair+0x7c/0x4d0
[   30.922692] [c000000023fcbb10] [c000000000dcd31c] =
__schedule+0x15c/0x1780
[   30.922708] [c000000023fcbc50] [c0000000001a5a04] =
do_task_dead+0x64/0x70
[   30.922726] [c000000023fcbc80] [c000000000156338] do_exit+0x848/0xcc0
[   30.922743] [c000000023fcbd50] [c000000000156884] =
do_group_exit+0x64/0xe0
[   30.922758] [c000000023fcbd90] [c000000000156924] =
sys_exit_group+0x24/0x30
[   30.922774] [c000000023fcbdb0] [c0000000000310c0] =
system_call_exception+0x150/0x2d0
[   30.922792] [c000000023fcbe10] [c00000000000cc5c] =
system_call_common+0xec/0x278
[   30.922808] --- interrupt: c00 at 0x7fffb3acddcc
[   30.922821] NIP:  00007fffb3acddcc LR: 00007fffb3a27f04 CTR: =
0000000000000000
[   30.922833] REGS: c000000023fcbe80 TRAP: 0c00   Not tainted  =
(5.13.0-rc7-next-20210621)
[   30.922847] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28444202  XER: 00000000
[   30.922882] IRQMASK: 0=20
               GPR00: 00000000000000ea 00007fffc8f21780 00007fffb3bf7100 =
0000000000000000=20
               GPR04: 0000000000000000 0000000155f142f0 0000000000000000 =
00007fffb3d23740=20
               GPR08: fffffffffbad2a87 0000000000000000 0000000000000000 =
0000000000000000=20
               GPR12: 0000000000000000 00007fffb3d2aeb0 0000000116be95e0 =
0000000000000032=20
               GPR16: 0000000000000000 00007fffc8f21cd8 000000000000002d =
0000000000000024=20
               GPR20: 00007fffc8f21cd4 00007fffb3bf4f98 0000000000000001 =
0000000000000001=20
               GPR24: 00007fffb3bf0950 0000000000000000 0000000000000000 =
0000000000000001=20
               GPR28: 0000000000000000 0000000000000000 00007fffb3d23ec0 =
0000000000000000=20
[   30.923023] NIP [00007fffb3acddcc] 0x7fffb3acddcc
[   30.923035] LR [00007fffb3a27f04] 0x7fffb3a27f04
[   30.923045] --- interrupt: c00
[   30.923052] Instruction dump:
[   30.923061] 3863be48 9be97ae6 4bf9a8f9 60000000 0fe00000 4bfff980 =
e9210070 e8610088=20
[   30.923088] 39400001 99490003 4bf9a8d9 60000000 <0fe00000> 4bfffc24 =
3d22fff5 89297ae3=20
[   30.923113] ---[ end trace ed07974d2149c499 ]=E2=80=94

This warning was introduced with commit 9e077b52d86a
sched/pelt: Check that *_avg are null when *_sum are

next-20210618 was good.

Thanks
-Sachin=
