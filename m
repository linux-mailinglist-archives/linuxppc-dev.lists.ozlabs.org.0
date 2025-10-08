Return-Path: <linuxppc-dev+bounces-12702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EABC3254
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 04:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chGhg4Kkkz302b;
	Wed,  8 Oct 2025 13:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759889491;
	cv=none; b=MY3AQ48jjdug0qzu/yzlMH1L4/vgKxkTl0UEvKpoyx2gc2pAbI57JG3S/ZC+PbwhTCpLZiIidD0uXk3iQmZbiDhx2ayPCCpHGK5mVRd5ZEu6KvgJ/OdtlFIzsM62RJcpnsZekAQBQrYudqErTMUoTFIx5qX35+Z1PsIV7/NhKK/EyQEQ+E1jMfpv1Y2AjRKxxm6rYPL9v03AlW2SWnAiQLZNUrvYFHTsfiUN5ybJbJGt8d8hGVpAQ0G5Qu9dniMNqqvKU0SX3YWdUrxliP7SFPnOBGoOdTkZVOjfYsovjXjCbi0uctBgOJ1OX7Bs1wZQ6j3t8wo379LfSjEyL9APLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759889491; c=relaxed/relaxed;
	bh=9RpcDUXyyy4RyljFBVdm2qPR5x/5ga6iK/kEeJtlPaA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ZHgKTQnu1qaUF6ELD/XqY+OOjg7bOEnDqVsiYmi+TUb9PIgbQ+GCy7Jrqp8IzsUm0rIu/mwd5sqSwANVSi5QLGkJnYH54Wcz5i6gYbcWQeUqgUv5O2xo45X16ltl5o94RXLTTYMurLfMZ9x2DUbIf9KEQxx/lPZxh2Zi1+B/4/nvafKdBssKDXB4YdkoIOg6SewicgglDKDgUE7Url7otuoLnhIde+PVXHMc51Y1ibHSvgdCysFh3sFS/5QhGgMqgG7nXnqT9ijRHjl1kEPvCVyu7nHvB54LdutLpPNpJiVPE8thQZNadx+Dq5yA5nGifpVs3za3PEUAd4ej8guApQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bm2Xc5aI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bm2Xc5aI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chGhf0LmKz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 13:11:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597F3Wh7024169;
	Wed, 8 Oct 2025 02:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9RpcDUXyyy4RyljFBVdm2qPR5x/5
	ga6iK/kEeJtlPaA=; b=bm2Xc5aIy5Zegce2FwaNiAvZY5TQw0CVlJxaeZbXJWO1
	9SKVirqOqUh+Fc0NtR4bdGE//IytyGoXFp05Prlqof8AzgXmVzsWdoe2p8Vq4VKs
	U1cuGJ5jDgFfWAMXHhefjW7kaAz8QPz3fDDfj+/JxzDuigd9VgjMpDqDI4JvOndY
	iX+LfoMGPUu75Y3jWtywZ8Vg8ek0V17wb1z+oGuzlsP4Nqk6nXLeJ8A6u93/3590
	IjnS5s+Ed0Hxgp0I6z7iC7IJhE205sqEugm+uALjOzgmTQDxJf8e9mrj05da2LCM
	oW2CzwffK0nvgU7OyuV+yz6z4QAhds5pPsl+L3O61A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49jt0phymq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 02:11:18 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5982BI1W011338;
	Wed, 8 Oct 2025 02:11:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49jt0phymn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 02:11:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 597LkZI2021251;
	Wed, 8 Oct 2025 02:11:17 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49kgm1e27j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 02:11:17 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5982BFIT37815006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 02:11:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1832758060;
	Wed,  8 Oct 2025 02:11:15 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5533C58056;
	Wed,  8 Oct 2025 02:11:12 +0000 (GMT)
Received: from [9.61.248.147] (unknown [9.61.248.147])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 02:11:12 +0000 (GMT)
Message-ID: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
Date: Wed, 8 Oct 2025 07:41:10 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>, jstultz@google.com,
        stultz@google.com
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [bisected][mainline]Kernel warnings at kernel/sched/cpudeadline.c:219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XvT3+FF9 c=1 sm=1 tr=0 ts=68e5c846 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=1XWaLZrsAAAA:8
 a=VwQbUJbxAAAA:8 a=hGzw-44bAAAA:8 a=VnNF1IyMAAAA:8 a=sGbenokq8W0xfwz70ZsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=HvKuF1_PTVFglORKqfwH:22
X-Proofpoint-ORIG-GUID: -JrYcKfkA45CCCE7SFj4uOV-XZZ6ckFw
X-Proofpoint-GUID: DDUco--7sH9Ejz1XpmcvosZ_Ja1TUNh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwOSBTYWx0ZWRfX86m+lOQMCEuT
 7/IjuO8i2y2TFAIrRZfYySLFNTtgkIg5Gxpcbwr7dvZZigP5yAqRpeMXROrYR3vu017Y63d3Vnb
 KO021SDQbcvihksddh+w+8+NNvZRYGt4V6SPnhfQy/Nk8nxthdKgCAFPvLHS+SWSM3N9VPk2BEm
 GhXyPFcIQzP1FM2KB9xD+hTsonJwUW8NaAiN0WzlLbN2dmN0eiCKi3Nz1ZpvG6Ha40F9RR4drrk
 F6urhf2wD0EAfk3Zho8FdT0yzF8nYBLd5bXDyl7OxD+n0WO7nowbfzmzyfo/Kgza0+u5DiqL/Wd
 x2cSsRNJyKIQo9MI1+cBUdaWHmhTpGrN8OsUVpE0J2N2GDgY1la9XM90X7Oy5F5WmNaTdiPUsVg
 OrynCF/tKmx2KZ7NOesW4pHVlpLYbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040009
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,TRACKER_ID autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


IBM CI has reported a kernel warnings while running CPU hot plug 
operation on IBM Power9 system.


Command to reproduce the issue:

drmgr -c cpu -r -q 1


Git Bisect is pointing to below commit as the first bad commit.


4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c


Traces:


[  464.306613] ------------[ cut here ]------------
[  464.306628] WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 
cpudl_set+0x58/0x170
[  464.306641] Modules linked in: rpadlpar_io(E) rpaphp(E) 
nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) 
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) 
bonding(E) nft_ct(E) tls(E) rfkill(E) nft_chain_nat(E) ip_set(E) hvcs(E) 
ibmveth(E) pseries_rng(E) hvcserver(E) vmx_crypto(E) sg(E) 
dm_multipath(E) drm(E) dm_mod(E) fuse(E) drm_panel_orientation_quirks(E) 
ext4(E) crc16(E) mbcache(E) jbd2(E) sr_mod(E) sd_mod(E) cdrom(E) 
ibmvscsi(E) scsi_transport_srp(E)
[  464.306703] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G       E  
      6.17.0-gfd94619c4336 #1 VOLUNTARY
[  464.306711] Tainted: [E]=UNSIGNED_MODULE
[  464.306714] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[  464.306720] NIP:  c0000000002b6ed8 LR: c0000000002b7cb8 CTR: 
c0000000002b7df0
[  464.306725] REGS: c000000002c2f5d0 TRAP: 0700   Tainted: G     E      
   (6.17.0-gfd94619c4336)
[  464.306730] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22000228  
XER: 00000000
[  464.306743] CFAR: c0000000002b726c IRQMASK: 3
[  464.306743] GPR00: c0000000002b7cb8 c000000002c2f870 c000000001df8100 
c000000002d6a710
[  464.306743] GPR04: 000000000000001e 0000006c566f51e0 0000000000000000 
c000000002d6adb0
[  464.306743] GPR08: 00000000ffffffff 0000000000000001 c000000002cac488 
0000000000000000
[  464.306743] GPR12: c0000000030a7000 c000000002fa0000 0000000000000000 
0000000000000000
[  464.306743] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  464.306743] GPR20: c0000009e940ac20 0000006c1aa50360 0000000000000001 
0000000000000002
[  464.306743] GPR24: 0000000000000000 0000000000000000 0000000000000003 
c0000009e940ab80
[  464.306743] GPR28: 000000000000001e 0000006c566f51e0 c000000002d6a710 
000000000000001e
[  464.306804] NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
[  464.306809] LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
[  464.306815] Call Trace:
[  464.306818] [c000000002c2f870] [c000000002c2f8c0] 
init_stack+0x78c0/0x8000 (unreliable)
[  464.306828] [c000000002c2f8c0] [c0000000002b7cb8] 
dl_server_timer+0x168/0x2a0
[  464.306835] [c000000002c2f920] [c00000000034df84] 
__hrtimer_run_queues+0x1a4/0x390
[  464.306842] [c000000002c2f9b0] [c00000000034f624] 
hrtimer_interrupt+0x124/0x300
[  464.306849] [c000000002c2fa60] [c00000000002a230] 
timer_interrupt+0x140/0x320
[  464.306856] [c000000002c2fac0] [c000000000009ffc] 
decrementer_common_virt+0x28c/0x290
[  464.306865] ---- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
[  464.306872] NIP:  c0000000001b75d8 LR: c0000000001bf274 CTR: 
0000000000000000
[  464.306877] REGS: c000000002c2faf0 TRAP: 0900   Tainted: G     E      
   (6.17.0-gfd94619c4336)
[  464.306882] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 24000228  XER: 20040000
[  464.306897] CFAR: 0000000000000000 IRQMASK: 0
[  464.306897] GPR00: 0000000000000000 c000000002c2fd90 c000000001df8100 
0000000000000000
[  464.306897] GPR04: 0000000000000010 000000002c000040 0000000000000002 
0000000000000040
[  464.306897] GPR08: 0000000000000000 0000000000000310 0000000000000031 
0000000000000000
[  464.306897] GPR12: 00000000d02f71f1 c000000002fa0000 0000000000000000 
0000000000000000
[  464.306897] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  464.306897] GPR20: 0000000000c00000 0000000000000008 0000000000000000 
0000000000000000
[  464.306897] GPR24: 0000000000000000 c000000000000000 c00000000a6e0000 
c000000002cad0c0
[  464.306897] GPR28: 0000000000000001 c0000000022418e0 c0000000022418e8 
c0000000022418e0
[  464.306956] NIP [c0000000001b75d8] plpar_hcall_norets_notrace+0x18/0x2c
[  464.306962] LR [c0000000001bf274] pseries_lpar_idle.part.0+0x74/0x160
[  464.306967] ---- interrupt: 900
[  464.306970] [c000000002c2fd90] [c0000009e940b3b0] 0xc0000009e940b3b0 
(unreliable)
[  464.306984] [c000000002c2fe10] [c0000000000212fc] 
arch_cpu_idle+0x4c/0x110
[  464.306993] [c000000002c2fe30] [c00000000134ddd0] 
default_idle_call+0x50/0x140
[  464.307001] [c000000002c2fe50] [c0000000002b4fdc] 
cpuidle_idle_call+0x1ac/0x240
[  464.307007] [c000000002c2fea0] [c0000000002b5164] do_idle+0xf4/0x1a0
[  464.307013] [c000000002c2fef0] [c0000000002b5498] 
cpu_startup_entry+0x48/0x50
[  464.307020] [c000000002c2ff20] [c0000000000113cc] rest_init+0xec/0xf0
[  464.307026] [c000000002c2ff50] [c0000000020052e0] do_initcalls+0x0/0x18c
[  464.307034] [c000000002c2ffe0] [c00000000000ea9c] 
start_here_common+0x1c/0x20
[  464.307040] Code: 549c06be 7c9f2378 7cbd2b78 7c7e1b78 39494388 
5489e8f8 f8010010 f821ffb1 7d2a482a 7d29e436 552907fe 69290001 
<0b090000> 490a428d 60000000 e93e0010
[  464.307060] ---[ end trace 0000000000000000 ]---
[  464.736380] ------------[ cut here ]------------
[  464.736397] WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 
cpudl_set+0x58/0x170
[  464.736408] Modules linked in: rpadlpar_io(E) rpaphp(E) 
nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) 
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) 
bonding(E) nft_ct(E) tls(E) rfkill(E) nft_chain_nat(E) ip_set(E) hvcs(E) 
ibmveth(E) pseries_rng(E) hvcserver(E) vmx_crypto(E) sg(E) 
dm_multipath(E) drm(E) dm_mod(E) fuse(E) drm_panel_orientation_quirks(E) 
ext4(E) crc16(E) mbcache(E) jbd2(E) sr_mod(E) sd_mod(E) cdrom(E) 
ibmvscsi(E) scsi_transport_srp(E)
[  464.736468] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G   W   E  
      6.17.0-gfd94619c4336 #1 VOLUNTARY
[  464.736476] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  464.736480] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[  464.736486] NIP:  c0000000002b6ed8 LR: c0000000002b7cb8 CTR: 
c0000000002b7df0
[  464.736491] REGS: c000000002c2f4f0 TRAP: 0700   Tainted: G W   E      
   (6.17.0-gfd94619c4336)
[  464.736497] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22000424  
XER: 00000000
[  464.736509] CFAR: c0000000002b726c IRQMASK: 3
[  464.736509] GPR00: c0000000002b7cb8 c000000002c2f790 c000000001df8100 
c000000002d6a710
[  464.736509] GPR04: 000000000000001f 0000006c700d1304 0000000000000000 
c000000002d6adb0
[  464.736509] GPR08: 00000000ffffffff 0000000000000001 c000000002cac488 
0000000000000000
[  464.736509] GPR12: c0000000030a7000 c000000002fa0000 0000000000000000 
0000000000000000
[  464.736509] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  464.736509] GPR20: c0000009e940ac20 0000006c3442c73b 0000000000000001 
0000000000000002
[  464.736509] GPR24: 0000000000000000 0000000000000000 0000000000000003 
c0000009e940ab80
[  464.736509] GPR28: 000000000000001f 0000006c700d1304 c000000002d6a710 
000000000000001f
[  464.736569] NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
[  464.736574] LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
[  464.736580] Call Trace:
[  464.736582] [c000000002c2f790] [c000000002c2f7e0] 
init_stack+0x77e0/0x8000 (unreliable)
[  464.736592] [c000000002c2f7e0] [c0000000002b7cb8] 
dl_server_timer+0x168/0x2a0
[  464.736599] [c000000002c2f840] [c00000000034df84] 
__hrtimer_run_queues+0x1a4/0x390
[  464.736606] [c000000002c2f8d0] [c00000000034f624] 
hrtimer_interrupt+0x124/0x300
[  464.736613] [c000000002c2f980] [c00000000002a230] 
timer_interrupt+0x140/0x320
[  464.736620] [c000000002c2f9e0] [c000000000009ffc] 
decrementer_common_virt+0x28c/0x290
[  464.736627] ---- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
[  464.736634] NIP:  c0000000001b75d8 LR: c00000000134dfe8 CTR: 
0000000000000000
[  464.736638] REGS: c000000002c2fa10 TRAP: 0900   Tainted: G W   E      
   (6.17.0-gfd94619c4336)
[  464.736644] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 22000424  XER: 20040000
[  464.736659] CFAR: 0000000000000000 IRQMASK: 0
[  464.736659] GPR00: 0000000000000000 c000000002c2fcb0 c000000001df8100 
0000000000000000
[  464.736659] GPR04: 0000000000000010 000000002c000040 0000000000000002 
0000000000000040
[  464.736659] GPR08: 0000000000000000 0000000000000290 0000000000000029 
0000000000000000
[  464.736659] GPR12: 00000000d02f74a9 c000000002fa0000 0000000000000000 
0000000000000000
[  464.736659] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  464.736659] GPR20: 0000000000c00000 0000000000000008 0000000000000000 
0000000000000000
[  464.736659] GPR24: 0000000000000000 0000000000000000 0000006c3469239a 
0000000000000001
[  464.736659] GPR28: c0000009e9419cc0 0000000000000001 c0000000022418e0 
c0000000022418e8
[  464.736717] NIP [c0000000001b75d8] plpar_hcall_norets_notrace+0x18/0x2c
[  464.736723] LR [c00000000134dfe8] check_and_cede_processor+0x48/0x60
[  464.736730] ---- interrupt: 900
[  464.736733] [c000000002c2fcb0] [c0000000026a1080] 
init_task+0x0/0x1d00 (unreliable)
[  464.736741] [c000000002c2fd10] [c00000000134e210] 
shared_cede_loop+0x70/0x170
[  464.736748] [c000000002c2fd50] [c00000000134d830] 
cpuidle_enter_state+0x2b0/0x648
[  464.736756] [c000000002c2fdf0] [c000000000e09f70] cpuidle_enter+0x50/0x80
[  464.736764] [c000000002c2fe30] [c0000000002ad868] call_cpuidle+0x48/0x90
[  464.736772] [c000000002c2fe50] [c0000000002b4f94] 
cpuidle_idle_call+0x164/0x240
[  464.736779] [c000000002c2fea0] [c0000000002b5164] do_idle+0xf4/0x1a0
[  464.736785] [c000000002c2fef0] [c0000000002b549c] 
cpu_startup_entry+0x4c/0x50
[  464.736791] [c000000002c2ff20] [c0000000000113cc] rest_init+0xec/0xf0
[  464.736797] [c000000002c2ff50] [c0000000020052e0] do_initcalls+0x0/0x18c
[  464.736804] [c000000002c2ffe0] [c00000000000ea9c] 
start_here_common+0x1c/0x20
[  464.736810] Code: 549c06be 7c9f2378 7cbd2b78 7c7e1b78 39494388 
5489e8f8 f8010010 f821ffb1 7d2a482a 7d29e436 552907fe 69290001 
<0b090000> 490a428d 60000000 e93e0010
[  464.736831] ---[ end trace 0000000000000000 ]---
[  493.843328] Non-volatile memory driver v1.3



Git Bisect logs:

git bisect bad
4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c is the first bad commit
commit 4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c (HEAD)
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Sep 16 23:02:41 2025 +0200

     sched/deadline: Fix dl_server getting stuck

     John found it was easy to hit lockup warnings when running locktorture
     on a 2 CPU VM, which he bisected down to: commit cccb45d7c429
     ("sched/deadline: Less agressive dl_server handling").

     While debugging it seems there is a chance where we end up with the
     dl_server dequeued, with dl_se->dl_server_active. This causes
     dl_server_start() to return without enqueueing the dl_server, thus it
     fails to run when RT tasks starve the cpu.

     When this happens, dl_server_timer() catches the
     '!dl_se->server_has_tasks(dl_se)' case, which then calls
     replenish_dl_entity() and dl_server_stopped() and finally return
     HRTIMER_NO_RESTART.

     This ends in no new timer and also no enqueue, leaving the dl_server
     'dead', allowing starvation.

     What should have happened is for the bandwidth timer to start the
     zero-laxity timer, which in turn would enqueue the dl_server and cause
     dl_se->server_pick_task() to be called -- which will stop the
     dl_server if no fair tasks are observed for a whole period.

     IOW, it is totally irrelevant if there are fair tasks at the moment of
     bandwidth refresh.

     This removes all dl_se->server_has_tasks() users, so remove the whole
     thing.

     Fixes: cccb45d7c4295 ("sched/deadline: Less agressive dl_server 
handling")
     Reported-by: John Stultz <jstultz@google.com>
     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Tested-by: John Stultz <jstultz@google.com>

  include/linux/sched.h   |  1 -
  kernel/sched/deadline.c | 12 +-----------
  kernel/sched/fair.c     |  7 +------
  kernel/sched/sched.h    |  4 ----
  4 files changed, 2 insertions(+), 22 deletions(-)

# git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [038d61fd642278bab63ee8ef722c50d10ab01e8f] Linux 6.16
git bisect good 038d61fd642278bab63ee8ef722c50d10ab01e8f
# status: waiting for bad commit, 1 good commit known
# bad: [c746c3b5169831d7fb032a1051d8b45592ae8d78] Merge tag 
'for-6.18-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect bad c746c3b5169831d7fb032a1051d8b45592ae8d78
# good: [e25079858627916b22c4a789005a90a9fae808d8] Merge branch 
'net-better-drop-accounting'
git bisect good e25079858627916b22c4a789005a90a9fae808d8
# bad: [05a54fa773284d1a7923cdfdd8f0c8dabb98bd26] Merge tag 
'sound-6.18-rc1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect bad 05a54fa773284d1a7923cdfdd8f0c8dabb98bd26
# bad: [ae28ed4578e6d5a481e39c5a9827f27048661fdd] Merge tag 
'bpf-next-6.18' of 
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
git bisect bad ae28ed4578e6d5a481e39c5a9827f27048661fdd
# bad: [6855f06042ae8d134f96c63feb5dfb3943c6d789] Merge tag 
'i2c-for-6.17-rc8' of 
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
git bisect bad 6855f06042ae8d134f96c63feb5dfb3943c6d789
# good: [3d1e36499e02457f8de0edc9d87783cce97e8677] Merge tag 
'gpio-fixes-for-v6.17-rc5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
git bisect good 3d1e36499e02457f8de0edc9d87783cce97e8677
# good: [86cc796e5e9bff0c3993607f4301b8188095516c] Merge tag 'for-linus' 
of git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect good 86cc796e5e9bff0c3993607f4301b8188095516c
# good: [f975f08c2e899ae2484407d7bba6bb7f8b6d9d40] Merge tag 
'for-6.17-rc6-tag' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect good f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
# good: [4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4] Merge tag 
'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
git bisect good 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
# good: [f26a24662cd2875f82029e28879a20cea212214c] Merge tag 
'v6.17rc7-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
git bisect good f26a24662cd2875f82029e28879a20cea212214c
# bad: [51a24b7deaae5c3561965f5b4b27bb9d686add1c] Merge tag 
'trace-tools-v6.17-rc5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
git bisect bad 51a24b7deaae5c3561965f5b4b27bb9d686add1c
# bad: [083fc6d7fa0d974a3663b97c8b0466737a544236] Merge tag 
'sched-urgent-2025-09-26' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 083fc6d7fa0d974a3663b97c8b0466737a544236
# good: [2cea0ed9796381b142f46bd8de97bb6b54b1df61] Merge tag 
'locking-urgent-2025-09-26' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 2cea0ed9796381b142f46bd8de97bb6b54b1df61
# bad: [a3a70caf7906708bf9bbc80018752a6b36543808] sched/deadline: Fix 
dl_server behaviour
git bisect bad a3a70caf7906708bf9bbc80018752a6b36543808
# bad: [4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c] sched/deadline: Fix 
dl_server getting stuck
git bisect bad 4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c
# first bad commit: [4ae8d9aa9f9dc7137ea5e564d79c5aa5af1bc45c] 
sched/deadline: Fix dl_server getting stuck


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.




