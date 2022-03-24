Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB064E5E9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 07:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPFVP2DS8z30N6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 17:21:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=knuIUbxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=knuIUbxr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPFTc2STNz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 17:20:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22O6CVOG006463
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 06:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=nAZ0p+dTdUDu6I5h30QYGHZ8lvikSuFsLaXIANAsM0Q=;
 b=knuIUbxr6/hnjikxNm2Y/aKhlbFymcoN09MK3pL5VDGNHCObn3Q5la496/XxPnGLotPA
 JsVQTLQWO89ROcZ678eXNx9LJ2SsYimrh2xHu9DMy9uO4H6CvsIno2kJX9PfJujbZGMe
 TObD9GAm/aFYGmCJOPsIHNv3Sdv1D8q0GGzTmk9nXPB5MKZLAPQqPegrVrfuTkFTPdbN
 szVbPcU/HU6G9vH8Q42nYsvpxlydxvV0RzZJrwysBJtKkHPM1IBv7/wGwSbrXfRR8AD/
 e/oSWvtGAaOwx26WE5Hx0UicdEfHQ1uuSKSAmFepzB1xAVNCn5jEnlFg+wd2g8Gb9UlX cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0k5n845g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 06:20:47 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22O6JZnv030221
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 06:20:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0k5n8450-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 06:20:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22O6J2vU031475;
 Thu, 24 Mar 2022 06:20:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ew6ej2597-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 06:20:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22O6KlOj46924252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Mar 2022 06:20:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C37FA405B;
 Thu, 24 Mar 2022 06:20:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18410A4054;
 Thu, 24 Mar 2022 06:20:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.196.151])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Mar 2022 06:20:41 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [powerpc/perf] WARN_ONCE arch/powerpc/include/asm/interrupt.h:365
 with perf tests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <19CAFB8D-6D28-48F0-A23B-1D2744F85544@linux.ibm.com>
Date: Thu, 24 Mar 2022 11:50:40 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <93944B60-69AA-4CAC-95F7-AD6340BB6037@linux.ibm.com>
References: <19CAFB8D-6D28-48F0-A23B-1D2744F85544@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xrr4JroknHAsH5X7euJrzQvyhumr2UmT
X-Proofpoint-GUID: 0vCbHWXX7WyQOit0X5KlVtXP8AfEFFdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_08,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240036
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 04-Feb-2022, at 12:33 PM, Sachin Sant <sachinp@linux.ibm.com> =
wrote:
>=20
> While running perftool [1] test against 5.17-rc2 booted on Power 9 =
LPAR
> following warning is seen:
>=20
> [  442.002150] ------------[ cut here ]------------
> [  442.002164] WARNING: CPU: 7 PID: 76 at =
arch/powerpc/include/asm/interrupt.h:365 =
interrupt_nmi_exit_prepare+0x150/0x160

I continue to see this warning.=20

[ 2989.536335] ------------[ cut here ]------------
[ 2989.536346] WARNING: CPU: 15 PID: 1153191 at =
arch/powerpc/include/asm/interrupt.h:362 =
performance_monitor_exception_nmi+0x2a0/0x2b0
[ 2989.536356] Modules linked in: dm_mod ip_set bonding rfkill nf_tables =
libcrc32c nfnetlink sunrpc pseries_rng xts uio_pdrv_genirq vmx_crypto =
uio sch_fq_codel ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg =
ibmvscsi ibmveth scsi_transport_srp ipmi_devintf ipmi_msghandler fuse
[ 2989.536387] CPU: 15 PID: 1153191 Comm: kworker/15:3 Not tainted =
5.17.0-next-20220323 #1
[ 2989.536393] Workqueue: events perf_sched_delayed
[ 2989.536398] NIP:  c00000000002b870 LR: c00000000002b838 CTR: =
c0000000003342f0
[ 2989.536402] REGS: c00000001339f490 TRAP: 0700   Not tainted  =
(5.17.0-next-20220323)
[ 2989.536406] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002828  =
XER: 00000000
[ 2989.536416] CFAR: c00000000002b794 IRQMASK: 3=20
[ 2989.536416] GPR00: c00000000002b838 c00000001339f730 c000000002a03700 =
0000000000000000=20
[ 2989.536416] GPR04: 0000000006008010 c000000002a43524 c000000001150140 =
c0000000000b2f30=20
[ 2989.536416] GPR08: c000000000016cec 0000000000000001 c00000001ec3a280 =
7265677368657265=20
[ 2989.536416] GPR12: 0000000000002000 c00000001ec3a280 c00000000018f058 =
c00000000963a340=20
[ 2989.536416] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 2989.536416] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 2989.536416] GPR24: fffffffffffffef7 0000000000000001 c000000002a3dfd8 =
0000000000000001=20
[ 2989.536416] GPR28: 0000000000002001 0000000000000000 0000000000000021 =
c00000001339f810=20
[ 2989.536468] NIP [c00000000002b870] =
performance_monitor_exception_nmi+0x2a0/0x2b0
[ 2989.536474] LR [c00000000002b838] =
performance_monitor_exception_nmi+0x268/0x2b0
[ 2989.536480] Call Trace:
[ 2989.536482] [c00000001339f730] [c00000000002b70c] =
performance_monitor_exception_nmi+0x13c/0x2b0 (unreliable)
[ 2989.536490] [c00000001339f780] [c00000000002c624] =
performance_monitor_exception+0x44/0x50
[ 2989.536496] [c00000001339f7a0] [c00000000000af28] =
performance_monitor_common_virt+0x208/0x210
[ 2989.536503] --- interrupt: f00 at __patch_instruction+0x10/0x60
[ 2989.536509] NIP:  c0000000000b2f30 LR: c0000000000b3604 CTR: =
c000000000335020
[ 2989.536513] REGS: c00000001339f810 TRAP: 0f00   Not tainted  =
(5.17.0-next-20220323)
[ 2989.536516] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 24002224  XER: 00000000
[ 2989.536529] CFAR: 0000000000000000 IRQMASK: 1=20
[ 2989.536529] GPR00: c0000000000b3578 c00000001339fab0 c000000002a03700 =
c0000000001a1068=20
[ 2989.536529] GPR04: 0000000060000000 c008000000201068 8e011a00000000c0 =
0000000000103907=20
[ 2989.536529] GPR08: ffffffffffffffff 0000000000000018 0000000060000000 =
0000000000000006=20
[ 2989.536529] GPR12: 0000000000002000 c00000001ec3a280 c00000000018f058 =
c00000000963a340=20
[ 2989.536529] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 2989.536529] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 2989.536529] GPR24: fffffffffffffef7 0000000000000001 c000000001000918 =
0000000000000000=20
[ 2989.536529] GPR28: c008000000200000 0000000000000000 0000000060000000 =
c0000000001a1068=20
[ 2989.536577] NIP [c0000000000b2f30] __patch_instruction+0x10/0x60
[ 2989.536583] LR [c0000000000b3604] patch_instruction+0x124/0x160
[ 2989.536588] --- interrupt: f00
[ 2989.536590] [c00000001339fab0] [c0000000000b3578] =
patch_instruction+0x98/0x160 (unreliable)
[ 2989.536597] [c00000001339fb00] [c00000000005fa28] =
arch_jump_label_transform+0x38/0x78
[ 2989.536603] [c00000001339fb20] [c000000000359854] =
__jump_label_update+0x144/0x180
[ 2989.536609] [c00000001339fbc0] [c000000000359e38] =
static_key_disable_cpuslocked+0xe8/0x130
[ 2989.536615] [c00000001339fc30] [c000000000359eb0] =
static_key_disable+0x30/0x50
[ 2989.536620] [c00000001339fc60] [c0000000003350b8] =
perf_sched_delayed+0x98/0xc0
[ 2989.536626] [c00000001339fc90] [c000000000182738] =
process_one_work+0x288/0x560
[ 2989.536632] [c00000001339fd30] [c000000000182a88] =
worker_thread+0x78/0x620
[ 2989.536637] [c00000001339fdc0] [c00000000018f174] kthread+0x124/0x130
[ 2989.536642] [c00000001339fe10] [c00000000000ce64] =
ret_from_kernel_thread+0x5c/0x64
[ 2989.536647] Instruction dump:
[ 2989.536650] 4182ff2c 39400000 f87f0100 b14d0930 4bffff1c 60000000 =
60000000 60000000=20
[ 2989.536659] 38600001 482cf905 60000000 4bfffe6c <0fe00000> 60000000 =
60000000 60000000=20
[ 2989.536668] ---[ end trace 0000000000000000 ]=E2=80=94

- Sachin=
