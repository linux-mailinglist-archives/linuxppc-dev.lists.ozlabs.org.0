Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F348496EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 10:48:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R72f3n9i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT1m81lXkz3dLR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 20:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R72f3n9i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT1L80Zppz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 20:29:35 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4158evmc012158;
	Mon, 5 Feb 2024 09:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : to : cc : from : subject; s=pp1;
 bh=xSZuI3dTmXHsj3IIGtt3/BDUGhR8PhjehLFOyAqfDyw=;
 b=R72f3n9iR58/BhM4A/QS2RHLXxEpkUJQMZrekQhVKxo7YsNJW6RiTXgAmTVn2GKk9JbM
 5k1y59bnKuR1bdHxtdL+FGZ/cFM+3SU5gabUm9nZm9YD/HJuXcmMRGNjNy6py+0WXEjn
 dsGbLCpcVGaxKaZMGQ0WngM2Feno4qnueR67cBP5l3i9MnvU7NrsT7eaOhqczTT5VQoZ
 U5vfofsxLgYEjwhqdsv4uDkiB57YoEvbvWzBz1KrUm7lQU++5x2LP/6MxK8pg30XQUEk
 HbK0/eGUOrswik6+RYqAHmQKu94DVaEhZa0hTCOJE/t4yBhKtcGFkFxa76FHiv5SfMUD zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2tx8302c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:29:28 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4159GMTY032257;
	Mon, 5 Feb 2024 09:29:28 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2tx8301v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:29:28 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4159SbvB016215;
	Mon, 5 Feb 2024 09:29:26 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w22h1q1yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:29:26 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4159TQG918481730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 09:29:26 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B95A5805B;
	Mon,  5 Feb 2024 09:29:26 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BCE758063;
	Mon,  5 Feb 2024 09:29:22 +0000 (GMT)
Received: from [9.43.107.229] (unknown [9.43.107.229])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 09:29:22 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------0COfeomYyX0OmBCnOqBTJrKm"
Message-ID: <1f33af30-a834-48c2-8067-13eea6813981@linux.vnet.ibm.com>
Date: Mon, 5 Feb 2024 14:59:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [Bisected] [commit dd6c3c544126] [linux-next] [6.8.0-rc2] Task hungs
 for infinite time call traces
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 40KUe6iKOCvRR6Bw6jm1OeCm0dyxLMDA
X-Proofpoint-GUID: eYI2TfsT6c_DsO2wLXs3_zdtvGSd42hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=436 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050071
X-Mailman-Approved-At: Mon, 05 Feb 2024 20:46:38 +1100
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
Cc: tj@kernel.org, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiangshanlai@gmail.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------0COfeomYyX0OmBCnOqBTJrKm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[linux-next] [6.8.0-rc2-next-20240130] [FC/XFS] Task hungs for infinite 
time while running bonnie test XFS filesystem

Bisected the issue. Git bisect points to the below commit
commit dd6c3c5441263723305a9c52c5ccc899a4653000
           workqueue: Move pwq_dec_nr_in_flight() to the end of work 
item handling

--- Traces ---

[  981.280811] Call Trace:
[  981.280813] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[  981.280820] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[  981.280827] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[  981.280832] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[  981.280836] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[  981.280841] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[  981.280845] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[  981.280852] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[  981.280913] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[  981.280969] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[  981.281023] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[  981.281029] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[  981.281034] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[  981.281088] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[  981.281093] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[  981.281098] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[  981.281102] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[  981.281107] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[  981.281112] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[  981.281116] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[  981.281122] --- interrupt: 3000 at 0x7fffaed4c11c
[  981.281125] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[  981.281128] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[  981.281131] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 48002402  XER: 00000000
[  981.281139] IRQMASK: 0
[  981.281139] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000
[  981.281139] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001
[  981.281139] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000
[  981.281139] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30
[  981.281139] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000
[  981.281139] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000
[  981.281139] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000
[  981.281139] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140
[  981.281175] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[  981.281177] LR [0000000000000000] 0x0
[  981.281179] --- interrupt: 3000
[ 1104.160797] INFO: taskumount:32506  blocked for more than 245 seconds.
[ 1104.160811]       Not tainted 6.8.0-rc2-next-20240130-auto #1
[ 1104.160814] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1104.160818]task:umount           state:D  stack:0      pid:32506  tgid:32506  ppid:32329   flags:0x00042080
[ 1104.160826] Call Trace:
[ 1104.160829] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[ 1104.160836] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[ 1104.160844] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[ 1104.160851] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[ 1104.160856] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[ 1104.160862] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[ 1104.160867] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[ 1104.160873] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[ 1104.160938] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[ 1104.160993] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[ 1104.161047] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[ 1104.161053] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[ 1104.161059] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[ 1104.161112] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[ 1104.161118] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[ 1104.161123] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[ 1104.161126] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[ 1104.161131] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[ 1104.161136] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[ 1104.161141] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[ 1104.161146] --- interrupt: 3000 at 0x7fffaed4c11c
[ 1104.161149] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[ 1104.161152] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[ 1104.161155] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 48002402  XER: 00000000
[ 1104.161163] IRQMASK: 0
[ 1104.161163] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000
[ 1104.161163] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001
[ 1104.161163] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000
[ 1104.161163] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30
[ 1104.161163] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000
[ 1104.161163] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000
[ 1104.161163] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000
[ 1104.161163] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140
[ 1104.161199] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[ 1104.161202] LR [0000000000000000] 0x0
[ 1104.161204] --- interrupt: 3000
[ 1227.040796] INFO: taskumount:32506  blocked for more than 368 seconds.
[ 1227.040810]       Not tainted 6.8.0-rc2-next-20240130-auto #1
[ 1227.040814] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1227.040817]task:umount           state:D  stack:0      pid:32506  tgid:32506  ppid:32329   flags:0x00042080
[ 1227.040823] Call Trace:
[ 1227.040826] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[ 1227.040832] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[ 1227.040839] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[ 1227.040844] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[ 1227.040848] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[ 1227.040853] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[ 1227.040857] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[ 1227.040863] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[ 1227.040925] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[ 1227.040980] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[ 1227.041035] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[ 1227.041041] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[ 1227.041045] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[ 1227.041099] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[ 1227.041105] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[ 1227.041109] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[ 1227.041113] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[ 1227.041118] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[ 1227.041123] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[ 1227.041128] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[ 1227.041133] --- interrupt: 3000 at 0x7fffaed4c11c
[ 1227.041136] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[ 1227.041139] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[ 1227.041142] MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 48002402  XER: 00000000
[ 1227.041150] IRQMASK: 0
[ 1227.041150] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000
[ 1227.041150] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001
[ 1227.041150] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000
[ 1227.041150] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30
[ 1227.041150] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000
[ 1227.041150] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000
[ 1227.041150] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000
[ 1227.041150] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140
[ 1227.041186] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[ 1227.041188] LR [0000000000000000] 0x0
[ 1227.041190] --- interrupt: 3000

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

--------------0COfeomYyX0OmBCnOqBTJrKm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>[linux-next] [6.8.0-rc2-next-20240130] [FC/XFS] Task hungs for
      infinite time while running bonnie test XFS filesystem</p>
    <p>Bisected the issue. Git bisect points to the below commit<br>
      commit dd6c3c5441263723305a9c52c5ccc899a4653000<br>
                workqueue: Move pwq_dec_nr_in_flight() to the end of
      work item handling<br>
    </p>
    <p>--- Traces ---</p>
    <pre
style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">[  981.280811] Call Trace:
[  981.280813] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[  981.280820] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[  981.280827] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[  981.280832] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[  981.280836] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[  981.280841] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[  981.280845] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[  981.280852] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[  981.280913] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[  981.280969] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[  981.281023] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[  981.281029] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[  981.281034] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[  981.281088] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[  981.281093] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[  981.281098] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[  981.281102] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[  981.281107] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[  981.281112] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[  981.281116] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[  981.281122] --- interrupt: 3000 at 0x7fffaed4c11c
[  981.281125] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[  981.281128] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[  981.281131] MSR:  800000000000d033 &lt;SF,EE,PR,ME,IR,DR,RI,LE&gt;  CR: 48002402  XER: 00000000
[  981.281139] IRQMASK: 0 
[  981.281139] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000 
[  981.281139] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001 
[  981.281139] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000 
[  981.281139] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30 
[  981.281139] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000 
[  981.281139] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000 
[  981.281139] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000 
[  981.281139] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140 
[  981.281175] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[  981.281177] LR [0000000000000000] 0x0
[  981.281179] --- interrupt: 3000
[ 1104.160797] INFO: task <a class="moz-txt-link-freetext"
    href="umount:32506">umount:32506</a> blocked for more than 245 seconds.
[ 1104.160811]       Not tainted 6.8.0-rc2-next-20240130-auto #1
[ 1104.160814] "echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1104.160818] <a class="moz-txt-link-freetext" href="task:umount">task:umount</a>          <a
    class="moz-txt-link-freetext" href="state:D">state:D</a> <a
    class="moz-txt-link-freetext" href="stack:0">stack:0</a>     <a
    class="moz-txt-link-freetext" href="pid:32506">pid:32506</a> <a
    class="moz-txt-link-freetext" href="tgid:32506">tgid:32506</a> <a
    class="moz-txt-link-freetext" href="ppid:32329">ppid:32329</a>  <a
    class="moz-txt-link-freetext" href="flags:0x00042080">flags:0x00042080</a>
[ 1104.160826] Call Trace:
[ 1104.160829] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[ 1104.160836] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[ 1104.160844] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[ 1104.160851] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[ 1104.160856] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[ 1104.160862] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[ 1104.160867] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[ 1104.160873] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[ 1104.160938] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[ 1104.160993] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[ 1104.161047] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[ 1104.161053] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[ 1104.161059] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[ 1104.161112] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[ 1104.161118] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[ 1104.161123] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[ 1104.161126] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[ 1104.161131] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[ 1104.161136] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[ 1104.161141] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[ 1104.161146] --- interrupt: 3000 at 0x7fffaed4c11c
[ 1104.161149] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[ 1104.161152] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[ 1104.161155] MSR:  800000000000d033 &lt;SF,EE,PR,ME,IR,DR,RI,LE&gt;  CR: 48002402  XER: 00000000
[ 1104.161163] IRQMASK: 0 
[ 1104.161163] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000 
[ 1104.161163] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001 
[ 1104.161163] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000 
[ 1104.161163] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30 
[ 1104.161163] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000 
[ 1104.161163] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000 
[ 1104.161163] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000 
[ 1104.161163] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140 
[ 1104.161199] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[ 1104.161202] LR [0000000000000000] 0x0
[ 1104.161204] --- interrupt: 3000
[ 1227.040796] INFO: task <a class="moz-txt-link-freetext"
    href="umount:32506">umount:32506</a> blocked for more than 368 seconds.
[ 1227.040810]       Not tainted 6.8.0-rc2-next-20240130-auto #1
[ 1227.040814] "echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1227.040817] <a class="moz-txt-link-freetext" href="task:umount">task:umount</a>          <a
    class="moz-txt-link-freetext" href="state:D">state:D</a> <a
    class="moz-txt-link-freetext" href="stack:0">stack:0</a>     <a
    class="moz-txt-link-freetext" href="pid:32506">pid:32506</a> <a
    class="moz-txt-link-freetext" href="tgid:32506">tgid:32506</a> <a
    class="moz-txt-link-freetext" href="ppid:32329">ppid:32329</a>  <a
    class="moz-txt-link-freetext" href="flags:0x00042080">flags:0x00042080</a>
[ 1227.040823] Call Trace:
[ 1227.040826] [c0000001d10b7560] [c000000006e9b934] 0xc000000006e9b934 (unreliable)
[ 1227.040832] [c0000001d10b7710] [c00000000001fbac] __switch_to+0x13c/0x220
[ 1227.040839] [c0000001d10b7770] [c000000001002840] __schedule+0x268/0x7c4
[ 1227.040844] [c0000001d10b7840] [c000000001002ddc] schedule+0x40/0x108
[ 1227.040848] [c0000001d10b78b0] [c00000000100b748] schedule_timeout+0x19c/0x1c0
[ 1227.040853] [c0000001d10b7980] [c000000001004044] __wait_for_common+0x148/0x340
[ 1227.040857] [c0000001d10b7a10] [c00000000018fa98] __flush_workqueue+0x15c/0x530
[ 1227.040863] [c0000001d10b7ab0] [c008000008f89e9c] xfs_inodegc_flush+0x54/0x15c [xfs]
[ 1227.040925] [c0000001d10b7b00] [c008000008f9f47c] xfs_unmountfs+0x30/0x1e4 [xfs]
[ 1227.040980] [c0000001d10b7b80] [c008000008fa825c] xfs_fs_put_super+0x5c/0x110 [xfs]
[ 1227.041035] [c0000001d10b7bf0] [c0000000005c8774] generic_shutdown_super+0xc0/0x16c
[ 1227.041041] [c0000001d10b7c60] [c0000000005c8a50] kill_block_super+0x30/0x68
[ 1227.041045] [c0000001d10b7c90] [c008000008fa5c54] xfs_kill_sb+0x28/0x4c [xfs]
[ 1227.041099] [c0000001d10b7cc0] [c0000000005ca9d4] deactivate_locked_super+0x70/0x144
[ 1227.041105] [c0000001d10b7cf0] [c000000000605728] cleanup_mnt+0x10c/0x1d8
[ 1227.041109] [c0000001d10b7d40] [c00000000019b5e4] task_work_run+0xe0/0x16c
[ 1227.041113] [c0000001d10b7d90] [c000000000022974] do_notify_resume+0x134/0x13c
[ 1227.041118] [c0000001d10b7dc0] [c000000000032378] interrupt_exit_user_prepare_main+0x1ac/0x264
[ 1227.041123] [c0000001d10b7e20] [c000000000032580] syscall_exit_prepare+0x150/0x178
[ 1227.041128] [c0000001d10b7e50] [c00000000000d068] system_call_vectored_common+0x168/0x2ec
[ 1227.041133] --- interrupt: 3000 at 0x7fffaed4c11c
[ 1227.041136] NIP:  00007fffaed4c11c LR: 0000000000000000 CTR: 0000000000000000
[ 1227.041139] REGS: c0000001d10b7e80 TRAP: 3000   Not tainted  (6.8.0-rc2-next-20240130-auto)
[ 1227.041142] MSR:  800000000000d033 &lt;SF,EE,PR,ME,IR,DR,RI,LE&gt;  CR: 48002402  XER: 00000000
[ 1227.041150] IRQMASK: 0 
[ 1227.041150] GPR00: 0000000000000034 00007fffec649770 00007fffaef07f00 0000000000000000 
[ 1227.041150] GPR04: 0000000000000000 ffffffffff000000 0000000000000000 0000000000000001 
[ 1227.041150] GPR08: 000000014cd61390 0000000000000000 0000000000000000 0000000000000000 
[ 1227.041150] GPR12: 0000000000000000 00007fffaefbc140 000000000ee6b280 00007fffec649a30 
[ 1227.041150] GPR16: 00007fffec649bd8 0000000118b66478 0000000000000000 0000000000000000 
[ 1227.041150] GPR20: ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000 
[ 1227.041150] GPR24: 00007fffec64b0b0 0000000118b663d8 0000000118b66a58 0000000000000000 
[ 1227.041150] GPR28: 000000014cd61250 0000000000000000 000000014cd61370 000000014cd61140 
[ 1227.041186] NIP [00007fffaed4c11c] 0x7fffaed4c11c
[ 1227.041188] LR [0000000000000000] 0x0
[ 1227.041190] --- interrupt: 3000</pre>
    <p></p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center</pre>
  </body>
</html>

--------------0COfeomYyX0OmBCnOqBTJrKm--

