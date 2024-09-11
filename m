Return-Path: <linuxppc-dev+bounces-1233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223ED974B27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 09:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3X9V5b3tz2yRC;
	Wed, 11 Sep 2024 17:23:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726038198;
	cv=none; b=gffOa6C7FzrmthFDnInF5g4u/6TTEJyhCE2Z+pgmhrw38W8s24nLL0o+cufHwcB3Q7z4JVfDEOGRd6nSDs6ZhmCNwdp1PfE7E/X/ktU8B1chjYwiV09EfHCYt9FGQVMSeDxIPbe3Hgcccb8V1LUeEVPJ7P5iepyXYbOTJwoOahQGLdC04lTGUb8XHAW0JxUpx0FhOwaoO0uWRB6iMojIiSQpgHVguYp4CK3PwPFsBIc6ERrbronVWeD6KCTyJkVA0V+80mC+hI1phFOeMjEZXW1QnSwnjkZ8jHwydX4449iIWFMmjcPgumLw4iweP/cbAX6fibheMM3PnQaofwMBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726038198; c=relaxed/relaxed;
	bh=VwYc4An08sBS55DKeA632NYy7SQM0lGP59R9VF/yO6E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RgAbU33XqNiWV30MZOrcyh+maoJvyDiT2xw+NOOYgu6eQqvlryDb/jBITc/4m6d2/wRTIY5zZUdsmWW0LaJ9BzzqJrmS2L5JoLGMZAzj6cR8iMWhryUTgwds/AtuwmysLC6W2RhRr1G5Bx8Qq2EObWFHmyY8AnYHzrtKPti2cIeU9aD4qxZ1fokQtNgClF8PVZ6fkRGVobAXIAEFSmOZO6q5mzA8ulHRalH377qxdNL9i6ls6qvQnE2hT/oWCS7etL1yXt33TZ99dCPQtq7f9lg137BMO8Ty5nhfAoYX9L7ZO+h3G4jSiVxePsUHoy5u6tRpNAXm7TP00OO4KcmiZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h7Q8S2kZ; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h7Q8S2kZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3WkF3JTzz2xKg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 17:03:16 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B1mRW1014847;
	Wed, 11 Sep 2024 07:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=pp1; bh=VwYc4An08sBS55DKeA632NYy7S
	QM0lGP59R9VF/yO6E=; b=h7Q8S2kZZPtaZm0ygTElMUxPhNmGW8nYXmy09pMOGX
	B/1WKMOVCDwwUq+r5Y4SjsdpQfG3Nej2ZcLHtLV5twkJPv+tzl2HTXG4Dkbo51nT
	WDm7gTtxPDN/7HRr30fJbROqC8KanLOiv59ZxNNxjJTz7TGVOyCnv3rQ9a/22A5w
	QqZ8BUzxC0uPgbvZZJX2sBHF7WDa6zRyYpL+vsLocLe1ttWf4TKcQkYn7XUNx0Ck
	XT1Na1CEgRRYD2akOg50uU6IhD2YH8Q3b0mrbH8dbUE191SikKD9uVu4GWuSoE5i
	Q0nNKKgzg+mJnOxtKwWVTqQd3AF/S4hZzM3/Dj6hWFdw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gebac24w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:03:06 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48B50sLG027297;
	Wed, 11 Sep 2024 07:03:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3v37ffw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 07:03:05 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48B735ZG10289688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 07:03:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 173BF58045;
	Wed, 11 Sep 2024 07:03:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D3F758061;
	Wed, 11 Sep 2024 07:03:03 +0000 (GMT)
Received: from [9.61.250.4] (unknown [9.61.250.4])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Sep 2024 07:03:02 +0000 (GMT)
Message-ID: <ced64e0b-2ef7-48d6-b085-976aa878c017@linux.vnet.ibm.com>
Date: Wed, 11 Sep 2024 12:33:01 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: peterz@infradead.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Sachin Sant <sachinp@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [PowerPC][linux-next-6.11-rc7-20240910] Kernel Warnings at
 kernel/jump_label.c:266
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3nRN1RfavNm0kPdLEa_fMj95EXRZJ3m0
X-Proofpoint-GUID: 3nRN1RfavNm0kPdLEa_fMj95EXRZJ3m0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=666 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110052

Greetings!!!


I am observing kernel warnings while booting with 
linux-next-6.11-rc7-20240910 kernel. Below are the warnings.


[   63.613506] WARNING: CPU: 20 PID: 214 at kernel/jump_label.c:266 
static_key_dec+0x78/0x8c
[   63.613518] Modules linked in: ext4 mbcache jbd2 dm_service_time 
sd_mod sg ibmvfc mlx5_core ibmvnic scsi_transport_fc ibmveth mlxfw 
psample dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
[   63.613542] CPU: 20 UID: 0 PID: 214 Comm: kworker/20:1 Not tainted 
6.11.0-rc7-next-20240910-auto #1
[   63.613549] Hardware name: IBM,9080-HEX POWER10 (architected) 
0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
[   63.613556] Workqueue: cgroup_destroy css_free_rwork_fn
[   63.613563] NIP:  c00000000048ca20 LR: c00000000048d060 CTR: 
c0000000005cb330
[   63.613568] REGS: c00000005a1afa80 TRAP: 0700   Not tainted 
(6.11.0-rc7-next-20240910-auto)
[   63.613573] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 24000884  XER: 20040001
[   63.613586] CFAR: c00000000048c9cc IRQMASK: 0
[   63.613586] GPR00: c00000000048d060 c00000005a1afd20 c0000000015f4300 
c000000002faa440
[   63.613586] GPR04: 0000000000000001 000000000000009e c0000000084bae00 
000000000000009d
[   63.613586] GPR08: 0000000000000000 0000000000000000 ffffffffffffffff 
c00000005b852780
[   63.613586] GPR12: c0000000005cb330 c000000c7db7df00 c0000000001a779c 
c0000000084b27c0
[   63.613586] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   63.613586] GPR20: c000000c7b914300 c000000002de73c8 c0000000027b07a8 
fffffffffffffef7
[   63.613586] GPR24: 0000000000000402 c00000005b852780 c000000008eabc05 
0000000000000010
[   63.613586] GPR28: c000000002d2fac0 c00000000e9d6000 c000000070444000 
c000000002faa440
[   63.613633] NIP [c00000000048ca20] static_key_dec+0x78/0x8c
[   63.613639] LR [c00000000048d060] 
__static_key_slow_dec_cpuslocked+0x38/0xb4
[   63.613645] Call Trace:
[   63.613647] [c00000005a1afd20] [c00000005a1afd50] 0xc00000005a1afd50 
(unreliable)
[   63.613653] [c00000005a1afd50] [c00000000048d124] 
static_key_slow_dec+0x48/0xb0
[   63.613660] [c00000005a1afdc0] [c0000000005cb40c] 
mem_cgroup_css_free+0xdc/0x104
[   63.613667] [c00000005a1afdf0] [c0000000002c4d58] 
css_free_rwork_fn+0x70/0x394
[   63.613673] [c00000005a1afe40] [c00000000019a7dc] 
process_one_work+0x1fc/0x4dc
[   63.613680] [c00000005a1afef0] [c00000000019b73c] 
worker_thread+0x340/0x504
[   63.613686] [c00000005a1aff90] [c0000000001a78cc] kthread+0x138/0x140
[   63.613691] [c00000005a1affe0] [c00000000000df98] 
start_kernel_thread+0x14/0x18
[   63.613697] Code: 7c0004ac 7c074800 40820018 38600001 5463063e 
4e800020 60000000 60000000 7ce93b78 4bffffa4 60000000 60000000 
<0fe00000> 38600001 7c60189e 5463063e
[   63.613711] ---[ end trace 0000000000000000 ]---


Issue is introduced by the commit: de752774f38bb766941ed1bf910ba5a9f6cc6bf7


Reverting the above commit, issue is not seen.


Regards,

Venkat.


