Return-Path: <linuxppc-dev+bounces-16064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CCD3C30F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 10:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwM4c1P7hz2xKh;
	Tue, 20 Jan 2026 20:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768900256;
	cv=none; b=CfF+ncoKiF0O89ilU6CgLdC6PamqLIGdqpAj5RTHaB0kKRn7LwZMxtgZa4u6OQdCfP7g87075H0cOw4wMzH9dQOgTipcz5N+I2JJDLdDmPZdlc2QsUjuMKqE19KIN1GAK2jJzIer9odTW8V8L2ZUTqILpRmNpf19JVAhA2GPQQqeH0Gyao7WfCiG/ibYBTGlnJ/HfbQY7j/Bs+bvj3st9nD20+DHslPFqL59PrgRywMzKD1jgT6vNOQMsgYu6W3PQNfIz2hvBWE/OeezbYJwi4LpBh96zzPCD8k14IIXTL22Vgi7VlEgtCQMkwzs/t5oAJomx9+zWlb7lAYuiLGu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768900256; c=relaxed/relaxed;
	bh=9dsWq6XkAXNFhfY8VU7/RlHXFy5jAbCK6dzACQBzmvg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PE2b6pxlIbfc733llQwrDJJ5UAvwRuq8iXE50kMfVAbPZQrHdHV+qqvGzZsWM6gNHLKN+HaDkzo5C1TSzFfZK+P1zlQuavPOO3VzmsduU+WKZWyBmALu4YSSVQWk/M7zLDvqxiA8swHluKyzlxZfaeiG9+K6fAGM29Gp8sNFdgc/CN9Sc/K4kvP+VLZMx98aeHdyFLBgqPOC7fbWMn3I9zQKR1RbYF+ji6E8MWPE3NBbKVYJJnUcVvSeuKm5G4u//smlqEWVk2+JSkwnV30DGZsXmg3c51cYGoVu5MPLF0zqIntG2A455PVOCWGg2vqKWgdEOOaCKkr/niiNs7YAsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AidptloL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AidptloL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwM4Z5FGZz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 20:10:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60JNom3B024370
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9dsWq6XkAXNFhfY8VU7/RlHXFy5j
	AbCK6dzACQBzmvg=; b=AidptloLxf5C1NBPaei4h38NZkynv2fqLRamuPIDKrr9
	EYkyTAmDSHtGn241xGqQj14gEkn6IpzgPFixy7QRbm2UhEyp0Tmq0UfXLK886bjP
	LMEkMCTx9lxkjaly8sR0TaRORChtdOJ5wW+BsYqdEeEYUVj6q+Cx+T9X6e5EMD0q
	pllwikUbfYFUIRGR+4lXyc/6Wx/SiSbRwiec6PVlSkNUvPM9tYLYABSH/MRzZSq7
	UnQxGWHDc0/Nel7CgnIePeSYVpqVCkjeSi1HeW0LWahI0aqFo92GtOCc0niXtNDV
	/P/wxO494WFT5S2vMzcnTXB4fKlHJNN2OTFoTQV94w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0ufc2fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:10:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K8AKCM001404
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:10:49 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpyjkp98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:10:49 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60K9Al198323768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 09:10:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D55145805C;
	Tue, 20 Jan 2026 09:10:47 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D15D58054;
	Tue, 20 Jan 2026 09:10:46 +0000 (GMT)
Received: from [9.98.108.237] (unknown [9.98.108.237])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Jan 2026 09:10:46 +0000 (GMT)
Message-ID: <d6926384-0b4e-44e2-a828-1ddb57500b3b@linux.ibm.com>
Date: Tue, 20 Jan 2026 14:40:44 +0530
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
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [bpf] Observing Kernel Softlock up while running BPF self tests
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3VqjWApISXVtQQfZ7JJvm9t2x5b1Gd4T
X-Proofpoint-ORIG-GUID: 3VqjWApISXVtQQfZ7JJvm9t2x5b1Gd4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA3MiBTYWx0ZWRfX7UZH/IQMPsHp
 AFKP0yuxx3OONMqTQEqw7sHygBPwg5Alugvs81n+YWZrEJ9N0ZMao31y2db4W8JbR23Vbimu+/y
 xi97NEcRBQUYhBPW29JoFMx8TPVKFSE+jyuh/9HdtG2hksSG9ztHWGd7pWTjjdYtI5k7t4dL0Ko
 /9a3WjhyO7rVZxVQPgZSnQ9cED7LyZ1SlcYobBSFy+kNx6yktSRAFOr+biwejMCMZQCdm3fHZg4
 5FaS7Ao8b49TFoeMhEr090MhCpx6Qx4C6lYr26Clxad3FKiAQROp7hh/4LaRi3tb5nAIshDpuw1
 oKBzT2gWo2PlbgIwecLQ3/20T5up8iG+J84UBzi4ez9/BO4gmIk38u58Y6572lxzTnnH9K3rTaz
 Oi35E1OO/sd4ptXhjqqmMmXZQzSwQrm4kd3n08ISkgwggJc01jAwr3QC2cvswSLcXCeahBEU8Pa
 V9tUYwRmUXmHl8L+Sag==
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=696f469a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=W4kWWihBoIyN2mbi5FAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601200072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


IBM CI has reported a kernel softlockup, while running BPF selftests on 
PowerPC kernel.


Traces:

[ 1632.509843] audit: type=1334 audit(1769127975.721:164430): 
prog-id=82135 op=LOAD
[ 1632.509852] audit: type=1334 audit(1769127975.721:164431): 
prog-id=82135 op=UNLOAD
[ 1637.016921] Mode = AA
[ 1660.780274] watchdog: BUG: soft lockup - CPU#8 stuck for 23s! 
[rqsl_w/8:51609]
[ 1660.780283] Modules linked in: bpf_test_rqspinlock(OE+) 8021q(E) 
garp(E) mrp(E) stp(E) llc(E) vrf(E) tun(E) bpf_testmod(OE) veth(E) 
nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) 
nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) 
bonding(E) nft_ct(E) tls(E) nft_chain_nat(E) rfkill(E) sunrpc(E) 
ibmveth(E) hvcs(E) hvcserver(E) pseries_rng(E) vmx_crypto(E) 
dm_multipath(E) fuse(E) dm_mod(E) drm(E) drm_panel_orientation_quirks(E) 
zram(E) ext4(E) crc16(E) mbcache(E) jbd2(E) sr_mod(E) sd_mod(E) cdrom(E) 
ibmvscsi(E) scsi_transport_srp(E) [last unloaded: livepatch_sample(EK)]
[ 1660.780352] CPU: 8 UID: 0 PID: 51609 Comm: rqsl_w/8 Tainted: G       
    OE K     6.19.0-rc4-g960c1fd29055 #1 VOLUNTARY
[ 1660.780359] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [K]=LIVEPATCH
[ 1660.780362] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
[ 1660.780365] NIP:  c0000000000399a8 LR: c000000000039c24 CTR: 
c000000000039ca0
[ 1660.780368] REGS: c000000bc19cfd28 TRAP: 0900   Tainted: G      OE K  
     (6.19.0-rc4-g960c1fd29055)
[ 1660.780372] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 28000288  XER: 0000000a
[ 1660.780386] CFAR: 0000000000000000 IRQMASK: 0
[ 1660.780386] GPR00: c000000000039c24 c000000bc19cfd00 c000000001f58100 
c000000bc19cfcf8
[ 1660.780386] GPR04: c000000bc19cfea8 0000000000000000 4000000000000002 
c0000013ff916e08
[ 1660.780386] GPR08: 00000013fd6c0000 0000000000000049 fffffffffffffffc 
c0080000f73e0f98
[ 1660.780386] GPR12: c000000000039ca0 c00000002e9b6700 c000000000270808 
c000000bad8fe980
[ 1660.780386] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1660.780386] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 1660.780386] GPR24: 0000000000000000 0000000000000000 c0080000f7360048 
0000000000000000
[ 1660.780386] GPR28: 0000000000000008 0000000000000000 000001827223b155 
0000000000000003
[ 1660.780433] NIP [c0000000000399a8] __replay_soft_interrupts+0x38/0x150
[ 1660.780443] LR [c000000000039c24] 
arch_local_irq_restore.part.0+0xe4/0x160
[ 1660.780449] Call Trace:
[ 1660.780452] [c000000bc19cfd00] [c000000000039a0c] 
__replay_soft_interrupts+0x9c/0x150 (unreliable)
[ 1660.780460] [c000000bc19cfeb0] [c000000000039c24] 
arch_local_irq_restore.part.0+0xe4/0x160
[ 1660.780468] [c000000bc19cfef0] [c0080000f73e042c] 
rqspinlock_worker_fn+0x244/0x300 [bpf_test_rqspinlock]
[ 1660.780476] [c000000bc19cff90] [c000000000270954] kthread+0x154/0x170
[ 1660.780482] [c000000bc19cffe0] [c00000000000df78] 
start_kernel_thread+0x14/0x18
[ 1660.780487] Code: 60000000 7c0802a6 f8010010 f821fe51 e92d0c78 
f92101a8 39200000 38610028 892d0933 61290040 992d0933 48102e15 
<60000000> 39200000 e9410130 f9210160



If you happen to fix this, Please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.



