Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEF84A0F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 18:37:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DbRFSScu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTD8m13Nhz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 04:37:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DbRFSScu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT20L1sGyz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 20:59:13 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4159s6aE012154;
	Mon, 5 Feb 2024 09:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : to : cc : from : subject; s=pp1;
 bh=qnt0/YaZaO9Jlj8C1mbaf/jfPoqerTYshnzWxfJ5GOw=;
 b=DbRFSScuVBI/cvNqfB0MIrXMw9D26pNmbzNq2oXHTp+T/VvzQAufRXWD8U2LEYuOpMTI
 iXF9dsVb7CwWO80kRsZKSAgmLaKXMUlj0ADj/dK3ZRnhDn21tfEz49Hogpzqb94QWak2
 M8mKGnvcyEIeIqRFtrru3l669x6iPh8kIoPl0MxM8UdH/T3skZfgB5XYTTJph8Q7jnLQ
 Sn+Fi89qUJoP5E12bC5SXiD4gBL0d8ZobmLRpoA97bV1nkGVNqexRsdWcJzZPSEfvduM
 j4yyiRo0XJxGTa1dRTUd7zx1f+dOLqSD4gYhjxZU56n3K6M/1Rit4+cUS+pldF/ZLPzn Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2ur8tjak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:54:25 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4159jltX016331;
	Mon, 5 Feb 2024 09:54:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2ur8tja7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:54:24 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4159YqZf016148;
	Mon, 5 Feb 2024 09:54:23 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w22h1q5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 09:54:23 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4159sNLs22413924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 09:54:23 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01E2A58059;
	Mon,  5 Feb 2024 09:54:23 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F09E45805B;
	Mon,  5 Feb 2024 09:54:18 +0000 (GMT)
Received: from [9.43.107.229] (unknown [9.43.107.229])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 09:54:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------U48kAVoBbpQQDhS00U81VIq1"
Message-ID: <a95f5bcd-3c49-4ebd-b1b3-a688c5b6727c@linux.vnet.ibm.com>
Date: Mon, 5 Feb 2024 15:24:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [Bisected] [commit dd6c3c544126] [linux-next] [6.8.0-rc2] Task hungs
 for infinite time call traces
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NobRK08RhqKJU6o0ZSEeJRRSI-FtOFc1
X-Proofpoint-ORIG-GUID: Hpdxxqkstj8M5A03faQ6PXuqHTFnx7MJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 clxscore=1011 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=1 lowpriorityscore=0 suspectscore=0
 mlxlogscore=219 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402050073
X-Mailman-Approved-At: Tue, 06 Feb 2024 04:36:17 +1100
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
Cc: "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, jiangshanlai@gmail.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, linux-arm-msm@vger.kernel.org, tj@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------U48kAVoBbpQQDhS00U81VIq1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings,

[Linux-next] [6.8.0-rc2-next-20240130] [FC / XFS] Task hangs for 
infinite time while running bonnie test XFS filesystem

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

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

--------------U48kAVoBbpQQDhS00U81VIq1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Greetings,<br>
    </p>
    <p>[Linux-next] [6.8.0-rc2-next-20240130] [FC / XFS] Task hangs for
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
[  981.281179] --- interrupt: 3000</pre>
    <p></p>
    <pre class="moz-signature" cols="72">
</pre>
    <p></p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center</pre>
  </body>
</html>

--------------U48kAVoBbpQQDhS00U81VIq1--

