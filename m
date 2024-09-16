Return-Path: <linuxppc-dev+bounces-1401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F9979B28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 08:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6Znk5KRkz2xxr;
	Mon, 16 Sep 2024 16:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726468314;
	cv=none; b=b/PC5FMxupkkymcw6rRmQ7OUH6Im4oII6REPRQmHNCZIwfeOF/g9/gZwpHZZaSKRr13s9oKtmLwHFtXZ+oyAqC9bhJkLiMOVfMEa/uMojqfpyVt275wtKUjP+/+II7NJ+ubGPgd4XedvP5ioOcHO+igJwsbypBm4Hs9xTtHcAFpPCLhxnONMfN8z8W1dSW8FyVhaF6b9hqrPkvsRhNOW3qoOcYHYQ488SGG2ZauFTPA22CmAq2RxP29YEDK0IY6hWqaBUhF8BrvYFO2QF5rxRYGzJRYaQEtH/vjH4aw5608Py75zP1yLSCXohpw7mquHIauiQ9jq4ANlsp4TId21VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726468314; c=relaxed/relaxed;
	bh=LCQbvyAjNQ5+01EpIV5/AJZaUvy3D0ecS16Xsq2w0ZY=;
	h=Content-Type:Message-ID:Date:From:To:Subject:MIME-Version; b=Sqa2gaX4CsxZJnFWlnGqP48KqSCBjPDG11XL3nPm/yi0O7J3poFM82wZy7ucVGjz+6WQmCAGKKB6D/34f+xDnQDQLdNo9tVDqqdB3dO4gLotxEadK0zSgSviEvJTtzOYC55TErS60CfodXBk/+YcNFspJQdYTl6HCnKPCANkYH+PgVN18r2HBLgLkVLUNJhovN4qCekkteCGW1mT+5t0YfaliXEbMZg+++ZuNfp4nRHG1t/+kd2SYh0gkIH6PiAuAnBfA5/3zkxKzJFNcZ+KGlSFRSX5BpmmI3ZzaXR8WbBSZSrdrqfGxg3HewXMEw8i6csKNhu76/ssTTVh74j4ZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eX8LFCwg; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eX8LFCwg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6Znj72Yjz2xvH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 16:31:53 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FMliQm017761;
	Mon, 16 Sep 2024 06:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:message-id:date:from:to:subject:mime-version; s=
	pp1; bh=LCQbvyAjNQ5+01EpIV5/AJZaUvy3D0ecS16Xsq2w0ZY=; b=eX8LFCwg
	pW7WYW0ih2O+baeIEQfMBg2IQ4zm/2LnVuZhf6ZC1zPu9hwITs7ZQL8vB6Bx8nhF
	vmCqtt3JmPW/PUHQfk8GvUTlFqoDWMPnLAXBVBYIi77x4lTOWteKRFKv42dNXNB7
	kevPjovbZih7xSnTfsrTWOuPaJAb/eQmokVqZwA5XS6WIOUX8DPJztnEt7Ihm3oP
	NXOAUBMxHIlWXK85ehUBV10uVMl53U+8CIuJM5I9DZusBg/xnlsrmOlM5RwcW9gl
	gkPqHquWcGEcDsCBA1g2+/tjqSoQimfou2LXiejGY9N1J8GSdX6iw1ZYdxOptvN2
	5RrVjqXcaSf7ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3ud026s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 06:30:58 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48G6Uwsl016913;
	Mon, 16 Sep 2024 06:30:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3ud026p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 06:30:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48G42W1G001915;
	Mon, 16 Sep 2024 06:30:57 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nmtudtcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 06:30:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48G6UvtT17564394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Sep 2024 06:30:57 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00BDA58052;
	Mon, 16 Sep 2024 06:30:57 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 062905805A;
	Mon, 16 Sep 2024 06:30:55 +0000 (GMT)
Received: from [9.61.253.7] (unknown [9.61.253.7])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Sep 2024 06:30:54 +0000 (GMT)
Content-Type: multipart/mixed; boundary="------------1E0st8aAOavP5NHL9IS0PDJY"
Message-ID: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
Date: Mon, 16 Sep 2024 12:00:52 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        peterz@infradead.org, vschneid@redhat.com, mingo@kernel.org,
        sfr@canb.auug.org.au
Subject: [PowerPC][Linux-next][6.11.0-rc4-next-20240820] OOPs while running
 LTP FS Stress
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Lh2Z1_2qMOi20n-mAEcqn98uQ_CNXuL
X-Proofpoint-ORIG-GUID: SP5Sp0lpiM_eIEIGd86kK2kT-ZiAJZZB
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_03,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=862
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160036

This is a multi-part message in MIME format.
--------------1E0st8aAOavP5NHL9IS0PDJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings!!!


I am seeing below kernel crash from 6.11.0-rc4-next-20240820.


Tried to do git bisect, but it didnt point to right patch. Attached is 
the bisect log.

Any help in fixing this is much appriciated.


[ 1246.652547] WARNING: CPU: 0 PID: 45927 at kernel/sched/fair.c:6049 
unthrottle_cfs_rq+0x624/0x634
[ 1246.652573] Modules linked in: raid0 dm_snapshot dm_bufio ext4 
mbcache jbd2 dm_mod rpadlpar_io rpaphp nft_compat nf_tables nfnetlink 
xsk_diag bonding tls rfkill sunrpc vmx_crypto pseries_rng dax_pmem 
binfmt_misc drm drm_panel_orientation_quirks fuse xfs libcrc32c sd_mod 
sg nd_pmem nd_btt ibmvscsi ibmveth scsi_transport_srp papr_scm libnvdimm tg3
[ 1246.652709] CPU: 0 UID: 0 PID: 45927 Comm: install Kdump: loaded Not 
tainted 6.11.0-rc4-next-20240820-auto #1
[ 1246.652723] Hardware name: IBM,9009-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
[ 1246.652734] NIP:  c0000000001e0710 LR: c0000000001e070c CTR: 
c00000000105bcd0
[ 1246.652744] REGS: c00000000ca67790 TRAP: 0700   Not tainted 
(6.11.0-rc4-next-20240820-auto)
[ 1246.652755] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE> CR: 48222281  
XER: 00000005
[ 1246.652784] CFAR: c0000000001690ac IRQMASK: 3
[ 1246.652784] GPR00: c0000000001e070c c00000000ca67a30 c0000000015a4200 
0000000000000011
[ 1246.652784] GPR04: 0000000000000000 c00000000ca67840 c00000000ca67838 
00000007f9dd0000
[ 1246.652784] GPR08: 0000000000000027 c0000007fc007c90 0000000000000001 
0000000000000001
[ 1246.652784] GPR12: c000000002a57e98 c000000003020000 0000000000000000 
0000000000000000
[ 1246.652784] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.652784] GPR20: 00000122107b5dad 0000000000000000 0000000000000001 
c0000000013b8cd0
[ 1246.652784] GPR24: c000000002c2ce46 0000000000000001 0000000000000001 
c0000007fc094500
[ 1246.652784] GPR28: 0000000000000000 c00000009166e400 c0000007fc094580 
c0000000912b8800
[ 1246.652921] NIP [c0000000001e0710] unthrottle_cfs_rq+0x624/0x634
[ 1246.652937] LR [c0000000001e070c] unthrottle_cfs_rq+0x620/0x634
[ 1246.652950] Call Trace:
[ 1246.652955] [c00000000ca67a30] [c0000000001e070c] 
unthrottle_cfs_rq+0x620/0x634 (unreliable)
[ 1246.652972] [c00000000ca67ad0] [c0000000001e0f64] 
distribute_cfs_runtime+0x3f0/0x51c
[ 1246.652986] [c00000000ca67be0] [c0000000001e1390] 
sched_cfs_period_timer+0x170/0x348
[ 1246.653002] [c00000000ca67ca0] [c00000000027c108] 
__hrtimer_run_queues+0x1bc/0x3d8
[ 1246.653017] [c00000000ca67d40] [c00000000027d5a0] 
hrtimer_interrupt+0x128/0x2fc
[ 1246.653032] [c00000000ca67df0] [c00000000002b0e0] 
timer_interrupt+0xf4/0x310
[ 1246.653044] [c00000000ca67e50] [c000000000009ffc] 
decrementer_common_virt+0x28c/0x290
[ 1246.653059] --- interrupt: 900 at 0x7fffa6e974a8
[ 1246.653070] NIP:  00007fffa6e974a8 LR: 00007fffa6e9fecc CTR: 
00007fffa701e360
[ 1246.653079] REGS: c00000000ca67e80 TRAP: 0900   Not tainted 
(6.11.0-rc4-next-20240820-auto)
[ 1246.653089] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 88222881  XER: 20040000
[ 1246.653123] CFAR: 0000000000000000 IRQMASK: 0
[ 1246.653123] GPR00: 00007fffa6e9fecc 00007fffd06dd1a0 00007fffa6f47f00 
0000010001680958
[ 1246.653123] GPR04: 00007fffd06dd440 0000000000000000 0000000000000000 
0000000000000000
[ 1246.653123] GPR08: 0000000000000033 00000000000000fc 0000000000000000 
0000000000002000
[ 1246.653123] GPR12: 00007fffa701e360 00007fffa731be00 00000001365e6808 
0000000000000000
[ 1246.653123] GPR16: 00007fffd06dd418 0000000000000001 0002aa0000000000 
00007fffd06dd440
[ 1246.653123] GPR20: 00007fffd06dd1c8 000000000000006c 000000000000006b 
000000000000006a
[ 1246.653123] GPR24: 000000000000006d 00007fffd06dd1c4 0000000000000000 
00007fffa6f26a38
[ 1246.653123] GPR28: 0000000000000000 000001000168095e 000000000000001d 
000000000000001d
[ 1246.653280] NIP [00007fffa6e974a8] 0x7fffa6e974a8
[ 1246.653293] LR [00007fffa6e9fecc] 0x7fffa6e9fecc
[ 1246.653303] --- interrupt: 900
[ 1246.653309] Code: 4bfffc74 3d220169 89298c60 2c090000 4082fd00 
3c62ffe1 39200001 3d420169 38635210 992a8c60 4bf8891d 60000000 
<0fe00000> 4bfffcdc eb010060 4bfffbb8
[ 1246.653370] ---[ end trace 0000000000000000 ]---
[ 1246.653404] ------------[ cut here ]------------
[ 1246.653417] delay && se->sched_delayed
[ 1246.653425] WARNING: CPU: 8 PID: 4577 at kernel/sched/fair.c:5477 
dequeue_entity+0x4b0/0x6d8
[ 1246.653446] Modules linked in: raid0 dm_snapshot dm_bufio ext4 
mbcache jbd2 dm_mod rpadlpar_io rpaphp nft_compat nf_tables nfnetlink 
xsk_diag bonding tls rfkill sunrpc vmx_crypto pseries_rng dax_pmem 
binfmt_misc drm drm_panel_orientation_quirks fuse xfs libcrc32c sd_mod 
sg nd_pmem nd_btt ibmvscsi ibmveth scsi_transport_srp papr_scm libnvdimm tg3
[ 1246.653532] CPU: 8 UID: 0 PID: 4577 Comm: uptycs-protect Kdump: 
loaded Tainted: G        W          6.11.0-rc4-next-20240820-auto #1
[ 1246.653546] Tainted: [W]=WARN
[ 1246.653551] Hardware name: IBM,9009-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
[ 1246.653560] NIP:  c0000000001dcb30 LR: c0000000001dcb2c CTR: 
c00000000105bcd0
[ 1246.653569] REGS: c00000008f2cf1d0 TRAP: 0700   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.653579] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
4800224a  XER: 00000005
[ 1246.653602] CFAR: c0000000001690ac IRQMASK: 1
[ 1246.653602] GPR00: c0000000001dcb2c c00000008f2cf470 c0000000015a4200 
000000000000001a
[ 1246.653602] GPR04: 0000000000000000 c00000008f2cf280 c00000008f2cf278 
00000007fa5d0000
[ 1246.653602] GPR08: 0000000000000027 c0000007fc807c90 0000000000000001 
0000000000000001
[ 1246.653602] GPR12: c000000002a57e98 c00000000f7c6700 c000000002d0c000 
0000000000000000
[ 1246.653602] GPR16: 0000000000000001 c0000000013b8cd0 0000000000000000 
0000000000000000
[ 1246.653602] GPR20: fffffffffffffdef 0000000000000000 0000000000000002 
c000000062771e00
[ 1246.653602] GPR24: 0000000000000000 0000000000000008 c0000007fc094500 
0000000000000000
[ 1246.653602] GPR28: 0000000000000001 0000000000000009 c0000007fc094580 
c0000000912b8800
[ 1246.653705] NIP [c0000000001dcb30] dequeue_entity+0x4b0/0x6d8
[ 1246.653715] LR [c0000000001dcb2c] dequeue_entity+0x4ac/0x6d8
[ 1246.653725] Call Trace:
[ 1246.653730] [c00000008f2cf470] [c0000000001dcb2c] 
dequeue_entity+0x4ac/0x6d8 (unreliable)
[ 1246.653746] [c00000008f2cf500] [c0000000001dd590] 
dequeue_entities+0x154/0x5f4
[ 1246.653758] [c00000008f2cf5d0] [c0000000001ddbb4] 
dequeue_task_fair+0x70/0x294
[ 1246.653771] [c00000008f2cf610] [c0000000001c4120] 
deactivate_task+0x100/0x218
[ 1246.653784] [c00000008f2cf690] [c0000000001da330] 
detach_tasks+0x150/0x398
[ 1246.653796] [c00000008f2cf700] [c0000000001e26b4] 
sched_balance_rq+0x258/0x7ec
[ 1246.653808] [c00000008f2cf870] [c0000000001e2e70] 
sched_balance_newidle+0x228/0x5ac
[ 1246.653821] [c00000008f2cf940] [c0000000001e32a8] 
pick_next_task_fair+0x54/0x58c
[ 1246.653834] [c00000008f2cf9e0] [c0000000001becd8] 
__pick_next_task+0x58/0x1fc
[ 1246.653846] [c00000008f2cfa30] [c0000000010647c8] __schedule+0x4e0/0x6fc
[ 1246.653858] [c00000008f2cfb00] [c000000001064a24] schedule+0x40/0x100
[ 1246.653870] [c00000008f2cfb70] [c0000000002a5550] 
futex_wait_queue+0xb4/0x134
[ 1246.653882] [c00000008f2cfbb0] [c0000000002a6150] __futex_wait+0xb4/0x15c
[ 1246.653892] [c00000008f2cfc90] [c0000000002a628c] futex_wait+0x94/0x144
[ 1246.653902] [c00000008f2cfd50] [c0000000002a0b5c] do_futex+0xe4/0x370
[ 1246.653913] [c00000008f2cfd90] [c0000000002a0e8c] sys_futex+0xa4/0x234
[ 1246.653923] [c00000008f2cfe10] [c000000000033728] 
system_call_exception+0x138/0x330
[ 1246.653935] [c00000008f2cfe50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[ 1246.653948] --- interrupt: 3000 at 0x7fff9ca437b4
[ 1246.653956] NIP:  00007fff9ca437b4 LR: 00007fff9ca437b4 CTR: 
0000000000000000
[ 1246.653965] REGS: c00000008f2cfe80 TRAP: 3000   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.653977] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44004a42  XER: 00000000
[ 1246.654006] IRQMASK: 0
[ 1246.654006] GPR00: 00000000000000dd 00007fff9993e170 00007fff9cbf7200 
0000010025a00098
[ 1246.654006] GPR04: 0000000000000189 0000000000000000 0000000000000000 
0000000000000000
[ 1246.654006] GPR08: 00000000ffffffff 0000000000000000 0000000000000000 
0000000000000000
[ 1246.654006] GPR12: 0000000000000000 00007fff999468c0 0000000000000000 
0000000000000000
[ 1246.654006] GPR16: 0000010025a00098 00007fff9993e218 00007fff9ca47930 
0000010025a00098
[ 1246.654006] GPR20: 0000000000000000 0000000000009ca9 0000000000000000 
0000000000013952
[ 1246.654006] GPR24: 00007fff9993e1f8 0000000000000000 0000000000000000 
0000010025a00038
[ 1246.654006] GPR28: 0000000000000002 0000000000000000 0000000000000000 
0000010025a00098
[ 1246.654109] NIP [00007fff9ca437b4] 0x7fff9ca437b4
[ 1246.654116] LR [00007fff9ca437b4] 0x7fff9ca437b4
[ 1246.654123] --- interrupt: 3000
[ 1246.654128] Code: 992a8c55 4bf8c521 60000000 0fe00000 4bfffbd4 
3c62ffe1 39200001 3d420169 38635240 992a8c56 4bf8c4fd 60000000 
<0fe00000> 4bffff30 60000000 60000000
[ 1246.654164] ---[ end trace 0000000000000000 ]---
[ 1246.656268] ------------[ cut here ]------------
[ 1246.656281] !se->on_rq
[ 1246.656288] WARNING: CPU: 6 PID: 45940 at kernel/sched/fair.c:704 
update_entity_lag+0xd0/0x120
[ 1246.656309] Modules linked in: raid0 dm_snapshot dm_bufio ext4 
mbcache jbd2 dm_mod rpadlpar_io rpaphp nft_compat nf_tables nfnetlink 
xsk_diag bonding tls rfkill sunrpc vmx_crypto pseries_rng dax_pmem 
binfmt_misc drm drm_panel_orientation_quirks fuse xfs libcrc32c sd_mod 
sg nd_pmem nd_btt ibmvscsi ibmveth scsi_transport_srp papr_scm libnvdimm tg3
[ 1246.656397] CPU: 6 UID: 0 PID: 45940 Comm: make Kdump: loaded 
Tainted: G        W          6.11.0-rc4-next-20240820-auto #1
[ 1246.656410] Tainted: [W]=WARN
[ 1246.656416] Hardware name: IBM,9009-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
[ 1246.656430] NIP:  c0000000001db87c LR: c0000000001db878 CTR: 
c00000000105bcd0
[ 1246.656439] REGS: c0000000692069c0 TRAP: 0700   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.656455] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 4828224a  XER: 00000005
[ 1246.656486] CFAR: c0000000001690ac IRQMASK: 1
[ 1246.656486] GPR00: c0000000001db878 c000000069206c60 c0000000015a4200 
000000000000000a
[ 1246.656486] GPR04: 0000000000000000 c000000069206a70 c000000069206a68 
00000007fa3d0000
[ 1246.656486] GPR08: 0000000000000027 c0000007fc607c90 0000000000000001 
0000000000000001
[ 1246.656486] GPR12: c000000002a57e98 c00000000f7c8f00 c000000002d0c000 
c00000000408b800
[ 1246.656486] GPR16: 0000000000000001 c0000000013b8cd0 0000000000000000 
0000000000000000
[ 1246.656486] GPR20: fffffffffffffdef 0000000000000000 0000000000000002 
c00000005d990080
[ 1246.656486] GPR24: 0000000000000000 0000000000000008 c0000007fc094500 
0000000000000000
[ 1246.656486] GPR28: 0000000000000001 0000000000000009 c0000007fc094580 
c0000000912b8800
[ 1246.656611] NIP [c0000000001db87c] update_entity_lag+0xd0/0x120
[ 1246.656624] LR [c0000000001db878] update_entity_lag+0xcc/0x120
[ 1246.656637] Call Trace:
[ 1246.656646] [c000000069206c60] [c0000000001db878] 
update_entity_lag+0xcc/0x120 (unreliable)
[ 1246.656670] [c000000069206cd0] [c0000000001dc734] 
dequeue_entity+0xb4/0x6d8
[ 1246.656685] [c000000069206d60] [c0000000001dd590] 
dequeue_entities+0x154/0x5f4
[ 1246.656700] [c000000069206e30] [c0000000001ddbb4] 
dequeue_task_fair+0x70/0x294
[ 1246.656714] [c000000069206e70] [c0000000001c4120] 
deactivate_task+0x100/0x218
[ 1246.656729] [c000000069206ef0] [c0000000001da330] 
detach_tasks+0x150/0x398
[ 1246.656743] [c000000069206f60] [c0000000001e26b4] 
sched_balance_rq+0x258/0x7ec
[ 1246.656759] [c0000000692070d0] [c0000000001e2e70] 
sched_balance_newidle+0x228/0x5ac
[ 1246.656773] [c0000000692071a0] [c0000000001e32a8] 
pick_next_task_fair+0x54/0x58c
[ 1246.656789] [c000000069207240] [c0000000001becd8] 
__pick_next_task+0x58/0x1fc
[ 1246.656803] [c000000069207290] [c0000000010647c8] __schedule+0x4e0/0x6fc
[ 1246.656820] [c000000069207360] [c000000001064a24] schedule+0x40/0x100
[ 1246.656833] [c0000000692073d0] [c0000000006847dc] 
fanotify_get_response.constprop.0+0x1b0/0x2d4
[ 1246.656852] [c000000069207480] [c00000000068543c] 
fanotify_handle_event+0x1e8/0x308
[ 1246.656865] [c000000069207550] [c00000000067bf1c] 
send_to_group+0x174/0x37c
[ 1246.656883] [c000000069207620] [c00000000067c5a8] fsnotify+0x484/0x618
[ 1246.656894] [c000000069207700] [c00000000067c9a8] 
__fsnotify_parent+0x26c/0x418
[ 1246.656907] [c0000000692077b0] [c000000000759d24] 
fsnotify_open_perm+0x170/0x220
[ 1246.656924] [c0000000692077e0] [c0000000005f1130] 
do_dentry_open+0x1bc/0x5b4
[ 1246.656937] [c000000069207830] [c0000000005f3678] vfs_open+0x44/0x120
[ 1246.656954] [c000000069207860] [c00000000060f66c] do_open+0x35c/0x504
[ 1246.656965] [c0000000692078c0] [c000000000616190] path_openat+0x16c/0x344
[ 1246.656981] [c000000069207940] [c000000000616414] do_filp_open+0xac/0x17c
[ 1246.656993] [c000000069207a70] [c000000000604c10] open_exec+0x80/0x120
[ 1246.657006] [c000000069207ad0] [c0000000006b0798] 
load_elf_binary+0x298/0xe80
[ 1246.657029] [c000000069207c10] [c000000000603938] 
search_binary_handler+0x118/0x354
[ 1246.657046] [c000000069207cb0] [c000000000603e10] exec_binprm+0x70/0x204
[ 1246.657058] [c000000069207d00] [c0000000006047b8] 
bprm_execve.part.0+0x1ec/0x2a4
[ 1246.657072] [c000000069207d40] [c000000000606680] 
do_execveat_common+0x188/0x250
[ 1246.657089] [c000000069207de0] [c00000000060679c] sys_execve+0x54/0x64
[ 1246.657106] [c000000069207e10] [c000000000033728] 
system_call_exception+0x138/0x330
[ 1246.657124] [c000000069207e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[ 1246.657142] --- interrupt: 3000 at 0x7fffaca8e054
[ 1246.657155] NIP:  00007fffaca8e054 LR: 00007fffaca8e054 CTR: 
0000000000000000
[ 1246.657165] REGS: c000000069207e80 TRAP: 3000   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.657175] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42422444  XER: 00000000
[ 1246.657212] IRQMASK: 0
[ 1246.657212] GPR00: 000000000000000b 00007fffac91fd80 00007fffacbd7200 
0000010035bd1840
[ 1246.657212] GPR04: 0000010035be4c70 0000010035bd81e0 0000000000000000 
0000000000000000
[ 1246.657212] GPR08: fffffffffffff000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.657212] GPR12: 0000000000000000 00007fffacc8a580 0000000000000057 
0000010035bd5630
[ 1246.657212] GPR16: 0000010035bb3760 00000000000006c8 0000000000000020 
0000010035bd5630
[ 1246.657212] GPR20: 00007fffac910000 00007ffff3ce1f64 00007fffac91fe10 
00000000ffffffff
[ 1246.657212] GPR24: fffffffffffff000 00007fffacc83590 00007ffff3ce1c68 
00007ffff3ce1f68
[ 1246.657212] GPR28: 0000000000000000 00007ffff3ce2038 0000010035ba4160 
0000000000100000
[ 1246.657323] NIP [00007fffaca8e054] 0x7fffaca8e054
[ 1246.657332] LR [00007fffaca8e054] 0x7fffaca8e054
[ 1246.657339] --- interrupt: 3000
[ 1246.657345] Code: 60000000 3d220169 89298c52 2c090000 4082ff88 
3c62ffe1 39200001 3d420169 38635188 992a8c52 4bf8d7b1 60000000 
<0fe00000> 7fc3f378 4bfffe95 e95f0080
[ 1246.657386] ---[ end trace 0000000000000000 ]---
[ 1246.657847] BUG: Kernel NULL pointer dereference at 0x00000051
[ 1246.657857] Faulting instruction address: 0xc0000000001dde14
[ 1246.657866] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1246.657875] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=8192 NUMA pSeries
[ 1246.657887] Modules linked in: raid0 dm_snapshot dm_bufio ext4 
mbcache jbd2 dm_mod rpadlpar_io rpaphp nft_compat nf_tables nfnetlink 
xsk_diag bonding tls rfkill sunrpc vmx_crypto pseries_rng dax_pmem 
binfmt_misc drm drm_panel_orientation_quirks fuse xfs libcrc32c sd_mod 
sg nd_pmem nd_btt ibmvscsi ibmveth scsi_transport_srp papr_scm libnvdimm tg3
[ 1246.657979] CPU: 0 UID: 0 PID: 45927 Comm: install Kdump: loaded 
Tainted: G        W          6.11.0-rc4-next-20240820-auto #1
[ 1246.657994] Tainted: [W]=WARN
[ 1246.658000] Hardware name: IBM,9009-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_141) hv:phyp pSeries
[ 1246.658011] NIP:  c0000000001dde14 LR: c0000000001dde14 CTR: 
c00000000002a864
[ 1246.658020] REGS: c00000000ca677b0 TRAP: 0380   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.658031] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
28008822  XER: 20040000
[ 1246.658058] CFAR: c0000000001d18bc IRQMASK: 1
[ 1246.658058] GPR00: c0000000001dde14 c00000000ca67a50 c0000000015a4200 
0000000000000000
[ 1246.658058] GPR04: c0000007fc094580 c00000000ca67c60 c0000007fc094f80 
c0000000585cfd20
[ 1246.658058] GPR08: 00000000000002d6 0000000000000000 fffffffffffffff0 
0000000000008000
[ 1246.658058] GPR12: c00000000002a864 c000000003020000 0000000000000000 
0000000000000000
[ 1246.658058] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.658058] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.658058] GPR24: 0000000000000000 0000000000000080 0000000000000000 
c00000005ea0c780
[ 1246.658058] GPR28: c00000005ea0c780 c0000007fc094500 c0000007fc094580 
c0000007fc094500
[ 1246.658184] NIP [c0000000001dde14] pick_next_entity+0x3c/0x17c
[ 1246.660612] LR [c0000000001dde14] pick_next_entity+0x3c/0x17c
[ 1246.660625] Call Trace:
[ 1246.660630] [c00000000ca67a50] [c0000000001dde14] 
pick_next_entity+0x3c/0x17c (unreliable)
[ 1246.660647] [c00000000ca67ad0] [c0000000001ddfb4] 
pick_task_fair+0x60/0x128
[ 1246.660661] [c00000000ca67b10] [c0000000001e32bc] 
pick_next_task_fair+0x68/0x58c
[ 1246.660675] [c00000000ca67bb0] [c0000000001becd8] 
__pick_next_task+0x58/0x1fc
[ 1246.660690] [c00000000ca67c00] [c0000000010647c8] __schedule+0x4e0/0x6fc
[ 1246.660711] [c00000000ca67cd0] [c0000000001c63a8] do_task_dead+0x64/0x68
[ 1246.660732] [c00000000ca67d00] [c0000000001733c4] do_exit+0x41c/0x5a0
[ 1246.660757] [c00000000ca67db0] [c000000000173734] do_group_exit+0x4c/0xbc
[ 1246.660772] [c00000000ca67df0] [c0000000001737cc] 
pid_child_should_wake+0x0/0x7c
[ 1246.660786] [c00000000ca67e10] [c000000000033728] 
system_call_exception+0x138/0x330
[ 1246.660800] [c00000000ca67e50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[ 1246.663889] --- interrupt: 3000 at 0x7fffa705d574
[ 1246.663898] NIP:  00007fffa705d574 LR: 00007fffa705d574 CTR: 
0000000000000000
[ 1246.663908] REGS: c00000000ca67e80 TRAP: 3000   Tainted: G        
W           (6.11.0-rc4-next-20240820-auto)
[ 1246.663919] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44002822  XER: 00000000
[ 1246.663951] IRQMASK: 0
[ 1246.663951] GPR00: 00000000000000ea 00007fffd06e3270 00007fffa71a7200 
0000000000000000
[ 1246.663951] GPR04: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.663951] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.663951] GPR12: 0000000000000000 00007fffa731be00 0000000000000000 
0000000000000000
[ 1246.663951] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1246.663951] GPR20: 0000000000000000 0000000000000000 0000000000000002 
0000000000000001
[ 1246.663951] GPR24: 0000000000000000 00007fffa71a0a38 0000000000000000 
0000000000000001
[ 1246.663951] GPR28: 00007fffa71a1fa8 00007fffa7314ef8 fffffffffffff000 
0000000000000000
[ 1246.667178] NIP [00007fffa705d574] 0x7fffa705d574
[ 1246.667185] LR [00007fffa705d574] 0x7fffa705d574
[ 1246.667190] --- interrupt: 3000
[ 1246.667195] Code: 60000000 7c0802a6 fba1ffe8 fbc1fff0 fbe1fff8 
7c7d1b78 7c9e2378 f8010010 f821ff81 60000000 7fc3f378 4bff392d 
<89230051> 7c7f1b78 2c090000 408200a0
[ 1246.667223] ---[ end trace 0000000000000000 ]---


Regards,

Venkat.

--------------1E0st8aAOavP5NHL9IS0PDJY
Content-Type: text/plain; charset=UTF-8; name="bisect.log"
Content-Disposition: attachment; filename="bisect.log"
Content-Transfer-Encoding: base64

Z2l0IGJpc2VjdCBzdGFydAojIHN0YXR1czogd2FpdGluZyBmb3IgYm90aCBnb29kIGFuZCBiYWQg
Y29tbWl0cwojIGJhZDogW2JiMWIwYWNkY2Q2NmUwZDhlZWRlZTM1NzBkMjQ5ZTA3NmI4OWFiMzJd
IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDI0MDgyMApnaXQgYmlzZWN0IGJh
ZCBiYjFiMGFjZGNkNjZlMGQ4ZWVkZWUzNTcwZDI0OWUwNzZiODlhYjMyCiMgc3RhdHVzOiB3YWl0
aW5nIGZvciBnb29kIGNvbW1pdChzKSwgYmFkIGNvbW1pdCBrbm93bgojIGdvb2Q6IFs0N2FjMDli
OTFiZWZiYjZhMjM1YWI2MjBjMzJhZjcxOWY4MjA4Mzk5XSBMaW51eCA2LjExLXJjNApnaXQgYmlz
ZWN0IGdvb2QgNDdhYzA5YjkxYmVmYmI2YTIzNWFiNjIwYzMyYWY3MTlmODIwODM5OQojIGdvb2Q6
IFsxMDEzMmFmMjRiZWE1NDc5ZmM4ZmZlYzQyZDA2YzMwODE2NzdlMWFiXSBNZXJnZSBicmFuY2gg
J21hc3Rlcicgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2hlcmJlcnQvY3J5cHRvZGV2LTIuNi5naXQKZ2l0IGJpc2VjdCBnb29kIDEwMTMyYWYyNGJlYTU0
NzlmYzhmZmVjNDJkMDZjMzA4MTY3N2UxYWIKIyBnb29kOiBbZGFkNDI2NTQ3YmJlMzg3YzAzOGQ4
Yzk0ZWRhMDZjOGRjNDE1MDMzZl0gTWVyZ2UgYnJhbmNoICdmb3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JvYmgvbGludXguZ2l0CmdpdCBi
aXNlY3QgZ29vZCBkYWQ0MjY1NDdiYmUzODdjMDM4ZDhjOTRlZGEwNmM4ZGM0MTUwMzNmCiMgYmFk
OiBbOTY4NDkzNjIwYTExMjFiNGE0ODc1MDc4MTFhZTMyZGE0MDFiNTk1M10gTWVyZ2UgYnJhbmNo
ICd0dHktbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2dyZWdraC90dHkuZ2l0CmdpdCBiaXNlY3QgYmFkIDk2ODQ5MzYyMGExMTIxYjRhNDg3NTA3
ODExYWUzMmRhNDAxYjU5NTMKIyBiYWQ6IFtmNGY0NjUxZThhMDUyYTFmZDM0ODM0NGM3YWFmNWFj
MjIzOGI5YWZhXSBNZXJnZSBicmFuY2ggJ2Zvci1uZXh0JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdHJhY2UvbGludXgtdHJhY2UuZ2l0CmdpdCBiaXNl
Y3QgYmFkIGY0ZjQ2NTFlOGEwNTJhMWZkMzQ4MzQ0YzdhYWY1YWMyMjM4YjlhZmEKIyBnb29kOiBb
MmIzZWI0MzE2MDlhNDc5MTkzMDQ0YmJhMDY0MDkwMTQxYTUwNGI5YV0gTWVyZ2UgYnJhbmNoIGlu
dG8gdGlwL21hc3RlcjogJ3RpbWVycy9jb3JlJwpnaXQgYmlzZWN0IGdvb2QgMmIzZWI0MzE2MDlh
NDc5MTkzMDQ0YmJhMDY0MDkwMTQxYTUwNGI5YQojIGdvb2Q6IFs5NGM5YzZlZDY4ZGU1NDIzZTE1
YTM3MGRmMGEzMmQ4ODIzYzMxNjk0XSBNZXJnZSBicmFuY2ggaW50byB0aXAvbWFzdGVyOiAneDg2
L3BsYXRmb3JtJwpnaXQgYmlzZWN0IGdvb2QgOTRjOWM2ZWQ2OGRlNTQyM2UxNWEzNzBkZjBhMzJk
ODgyM2MzMTY5NAojIGdvb2Q6IFs1N2Y2OTgxNjc4ZTg5Yzc5NzIzY2Q1NzY3OWVlYzJmMDc2M2Q5
YjU2XSBNZXJnZSBicmFuY2ggJ2Zvci1uZXh0JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zcGkuZ2l0CmdpdCBiaXNlY3QgZ29vZCA1N2Y2
OTgxNjc4ZTg5Yzc5NzIzY2Q1NzY3OWVlYzJmMDc2M2Q5YjU2CiMgZ29vZDogWzRjNTdkMGJlNTI4
YjEyNTVhYmU2MWQ4Mjc3ZjMyMTNkNGQyMmU4NWZdIHRyYWNpbmcvZmdyYXBoOiBIYXZlIGZncmFw
aCBoYW5kbGUgcHJldmlvdXMgYm9vdCBmdW5jdGlvbiBhZGRyZXNzZXMKZ2l0IGJpc2VjdCBnb29k
IDRjNTdkMGJlNTI4YjEyNTVhYmU2MWQ4Mjc3ZjMyMTNkNGQyMmU4NWYKIyBnb29kOiBbYzMwM2U4
N2M1ZjEzMWYwNTcwOTliMjFhMTlhMzZkYTI5N2QwMDE3NV0gTWVyZ2UgYnJhbmNoICdtYXN0ZXIn
IG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlw
LmdpdApnaXQgYmlzZWN0IGdvb2QgYzMwM2U4N2M1ZjEzMWYwNTcwOTliMjFhMTlhMzZkYTI5N2Qw
MDE3NQojIGJhZDogWzRlMDUyZDVmODcwMTA0NWFmN2MzODZiODg0YzY4ZmVkM2QwNWFkMGRdIE1l
cmdlIGJyYW5jaCAnZWRhYy1mb3ItbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3Jhcy9yYXMuZ2l0CmdpdCBiaXNlY3QgYmFkIDRlMDUyZDVmODcw
MTA0NWFmN2MzODZiODg0YzY4ZmVkM2QwNWFkMGQKIyBnb29kOiBbMjZlNDNjOWE4OTQxNzZlN2I3
ZjdlYWZmNjFhYWYyNzQ4ZDRhYTUyMF0gUkFTL0FNRC9BVEw6IFRyYW5zbGF0ZSBub3JtYWxpemVk
IHRvIHN5c3RlbSBwaHlzaWNhbCBhZGRyZXNzZXMgdXNpbmcgUFJNCmdpdCBiaXNlY3QgZ29vZCAy
NmU0M2M5YTg5NDE3NmU3YjdmN2VhZmY2MWFhZjI3NDhkNGFhNTIwCiMgZ29vZDogWzA5MDc4NjQ3
OTMyNWQ4NWNmOWY4NTY1ZWY4MDJjZDZkYzYyYzUzMjFdIE1lcmdlIHJhcy9lZGFjLW1pc2MgaW50
byBmb3ItbmV4dApnaXQgYmlzZWN0IGdvb2QgMDkwNzg2NDc5MzI1ZDg1Y2Y5Zjg1NjVlZjgwMmNk
NmRjNjJjNTMyMQojIGZpcnN0IGJhZCBjb21taXQ6IFs0ZTA1MmQ1Zjg3MDEwNDVhZjdjMzg2Yjg4
NGM2OGZlZDNkMDVhZDBkXSBNZXJnZSBicmFuY2ggJ2VkYWMtZm9yLW5leHQnIG9mIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yYXMvcmFzLmdpdAo=

--------------1E0st8aAOavP5NHL9IS0PDJY--


