Return-Path: <linuxppc-dev+bounces-1702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5C98B26A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 04:46:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHj4w2GmJz2xg3;
	Tue,  1 Oct 2024 12:46:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727750799;
	cv=none; b=EoG7QNHa9Y11j/CR5k862iK/53qVN2p6HTp00HK4jaJ+WlOR9iYFDky28fiVS+BPx7RaJZVUMZ6T08rv8tL29EdGwueWnaBM/fKzMckCwu8iMBkLEYEqd9UQU6N5p/GachOybEL3iZHe6qTTB06dydXVhQPL10SWDurWOn7OjqC3MjoWf2obQB1Lu4BGY9jCrg9/8VEFl0NCllPBo2GXfXGEMEvIJQ6vTjGVqlr+ptft0dS1ZHsuLm7RW97A6XllGqMR0ejc3/94vWTy/idUt894AVE8zNOOiVsWhcIydIKkmoNQD06J/KBGqB8na4RD4WDTrfxy/Yon0BOdt9oljw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727750799; c=relaxed/relaxed;
	bh=ZptkWOy322qhOaSHXW1hrCG2/1+Dfp1FTd9GDoMe60Q=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CEttHgtC7rz0WSImN6HmSN3cZxAXVmZ+ZhD4LQaUhv5AVOJTMwgc+iXtDBFNtF6FysdFe/5rJV/Gjku5byC2qayunW0cKd7RFxsTLeTXZvDyIZnxxovUaSqv42rtiIm/CdALKD+w8Asj45vdqnCWWrV7mDtlD579GK87ef29WrxOeXKkqlcFSg5NJ01b4WaivJ/EEobA3Nt9/veSQUUQfAon5960PUp4di3DEqlVEwsgi2bS9H5wgMU11TDIuJful+kpn+UVgh9olkcP/s7f+oJOyCcYn3P1l44JkDGg0GJeS6LwT58grlVvW0DzaAbBk1YE0FsUumEyU+gbnybcbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LJhsk7NC; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LJhsk7NC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHj4t5c3dz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 12:46:37 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UMAA7n017390;
	Tue, 1 Oct 2024 02:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:to:from:subject:content-type
	:content-transfer-encoding; s=pp1; bh=ZptkWOy322qhOaSHXW1hrCG2/1
	+Dfp1FTd9GDoMe60Q=; b=LJhsk7NCErmdCKQfeHK8ZJ4iuGSKXQNn6XzXG8ZmRk
	a52zkDOfw3Xv3SKy1yVmpOcTZu6Mn5boO4YO3dawxpBfm1hBTLzBjnP6n2BESx+X
	a7yDVUALFI6oEmXRnl1CFbovmipm/ldDsGw+WvT0UzrncAoDLKYV5lBoXvl9LbrE
	ebgsi/yMPcT+hiJ6o4EkB3i8Ykbkiyn9+DZp1nW2RZOcFVKZwqG2tTrRXkAN+JwI
	loS8AYKHUvM/CGl687RqY8PuVFpZt1Yc4H+j2qstT/4jy/vbwAyU/U6d1Sbkgd84
	0tNtLFp1IjJQ6dEtZf9D6siD6z0dDZBWyWBAv06nUqAw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41x87kmu0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 02:46:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4911Irxg017902;
	Tue, 1 Oct 2024 02:46:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xw4msw35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 02:46:32 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4912kVSB40632592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Oct 2024 02:46:32 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4FF958052;
	Tue,  1 Oct 2024 02:46:31 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25DEF58056;
	Tue,  1 Oct 2024 02:46:31 +0000 (GMT)
Received: from [9.61.255.206] (unknown [9.61.255.206])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Oct 2024 02:46:30 +0000 (GMT)
Message-ID: <99634d5a-3ce6-43f7-9921-801c7d8ca273@linux.vnet.ibm.com>
Date: Tue, 1 Oct 2024 08:16:29 +0530
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
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [PowerPC-Repo][Merge-Branch]Observing Watchdog Bug: Soft lock up,
 while running perf_fuzzer Test case
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lWn6nu4Z2YWE5WMiqRNVAUiyr183zPlP
X-Proofpoint-ORIG-GUID: lWn6nu4Z2YWE5WMiqRNVAUiyr183zPlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-09-30_22,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=570 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010016
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Greetings!!!


I am observing  kernel soft lock up error, while running few performance 
test case. Issue is seen on PowerPC repo merge branch.

Traces:


[ 7688.815763] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Kdump: loaded 
Tainted: G           O       6.11.0-gef28aca2b21c #1
[ 7688.815770] Tainted: [O]=OOT_MODULE
[ 7688.815773] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.00 (NH1110_009) hv:phyp pSeries
[ 7688.815778] NIP:  c00000000003a504 LR: c00000000017603c CTR: 
c00000000047d918
[ 7688.815783] REGS: c000000efdda7c10 TRAP: 0900   Tainted: G           
O        (6.11.0-gef28aca2b21c)
[ 7688.815788] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
22042824  XER: 00000001
[ 7688.815798] CFAR: 0000000000000000 IRQMASK: 0
[ 7688.815798] GPR00: c00000000017603c c000000efdda7eb0 c0000000015e3f00 
0000000000000000
[ 7688.815798] GPR04: c0000001130f4110 c000000efaa6e488 0000000000000068 
0000000000000000
[ 7688.815798] GPR08: 0000000ef87b0000 0000000000000000 0000000000008002 
0000000042000824
[ 7688.815798] GPR12: c000000004cc7740 c000000effffa700 0000000000000000 
0000000000000000
[ 7688.815798] GPR16: 0000000004200042 0000000000000000 0000000000000001 
c000000002ce2a80
[ 7688.815798] GPR20: 00000001000b3bdb 000000000000000a c0000000022c3980 
0000000000000000
[ 7688.815798] GPR24: 0000000000000000 0000000ef87b0000 c000000004b85580 
c000000002d1a988
[ 7688.815798] GPR28: 0000000000000002 0000000000000003 c000000002230400 
fcffffffffffffff
[ 7688.815844] NIP [c00000000003a504] arch_local_irq_restore+0x274/0x280
[ 7688.815853] LR [c00000000017603c] handle_softirqs+0xd8/0x3a0
[ 7688.815859] Call Trace:
[ 7688.815861] [c000000efdda7eb0] [c000000000255790] rcu_core+0x78/0x270 
(unreliable)
[ 7688.815869] [c000000efdda7ef0] [c00000000017603c] 
handle_softirqs+0xd8/0x3a0
[ 7688.815875] [c000000efdda7fe0] [c000000000017f40] 
do_softirq_own_stack+0x3c/0x50
[ 7688.815881] [c000000004cc7980] [c000000000175798] 
__irq_exit_rcu+0x12c/0x154
[ 7688.815886] [c000000004cc79b0] [c000000000176648] irq_exit+0x20/0x38
[ 7688.815891] [c000000004cc79d0] [c00000000002aee4] 
timer_interrupt+0x128/0x310
[ 7688.815896] [c000000004cc7a30] [c000000000009ffc] 
decrementer_common_virt+0x28c/0x290
[ 7688.815903] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
[ 7688.815909] NIP:  c0000000000faf64 LR: c0000000010758d8 CTR: 
0000000000000000
[ 7688.815913] REGS: c000000004cc7a60 TRAP: 0900   Tainted: G           
O        (6.11.0-gef28aca2b21c)
[ 7688.815917] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 22000224  XER: 00000001
[ 7688.815928] CFAR: 0000000000000000 IRQMASK: 0
[ 7688.815928] GPR00: 0000000000000000 c000000004cc7d00 c0000000015e3f00 
0000000000000000
[ 7688.815928] GPR04: 0000000000000000 0000000000000080 0000000000000000 
0004c4c45b000000
[ 7688.815928] GPR08: ffffffffffffffff 00022e10665720b4 0000000000010000 
00000000000000c0
[ 7688.815928] GPR12: 0000000000000000 c000000effffa700 0000000000000000 
000000002ef16180
[ 7688.815928] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 7688.815928] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000001
[ 7688.815928] GPR24: 0000000000000004 0000000000000000 000006f7fcc51e3e 
0000000000000000
[ 7688.815928] GPR28: 0000000000000000 0000000000000001 c0000000022318e0 
c0000000022318e8
[ 7688.815972] NIP [c0000000000faf64] plpar_hcall_norets_notrace+0x18/0x2c
[ 7688.815977] LR [c0000000010758d8] check_and_cede_processor+0x48/0x5c
[ 7688.815984] --- interrupt: 900
[ 7688.815987] [c000000004cc7d00] [c00000000029bc3c] 
tick_program_event+0x6c/0xe8 (unreliable)
[ 7688.815994] [c000000004cc7d60] [c000000001075d20] 
dedicated_cede_loop+0x94/0x1a0
[ 7688.816000] [c000000004cc7db0] [c000000001075124] 
cpuidle_enter_state+0x258/0x5e4
[ 7688.816006] [c000000004cc7e50] [c000000000c6c4ac] cpuidle_enter+0x4c/0x68
[ 7688.816012] [c000000004cc7e90] [c0000000001e6944] call_cpuidle+0x4c/0x94
[ 7688.816018] [c000000004cc7eb0] [c0000000001eec38] 
cpuidle_idle_call+0x164/0x240
[ 7688.816023] [c000000004cc7f10] [c0000000001eee18] do_idle+0x104/0x1ac
[ 7688.816028] [c000000004cc7f60] [c0000000001ef144] 
cpu_startup_entry+0x48/0x50
[ 7688.816034] [c000000004cc7f90] [c000000000060e3c] 
start_secondary+0x28c/0x290
[ 7688.816040] [c000000004cc7fe0] [c00000000000e358] 
start_secondary_prolog+0x10/0x14
[ 7688.816045] Code: 7f810164 4bfffe80 60000000 7d2000a6 71298000 
40820020 39200000 992d0932 39400000 992d0933 614a8002 7d410164 
<4bfffec8> 0fe00000 4bffffe0 3c4c015b


Regards,

Venkat.




