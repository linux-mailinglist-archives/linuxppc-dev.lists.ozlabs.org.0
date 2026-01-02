Return-Path: <linuxppc-dev+bounces-15121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18CCEDA4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 05:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dj9WK0pzgz2xrC;
	Fri, 02 Jan 2026 15:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767327708;
	cv=none; b=c4aT1rXi7xQewXDXySFhsndfUPvmE/E6zC+gn9+LR9KJUjOWfc3AvqnapkbofRdWVMUNUKN5fPeECnPvGQRI1ne2pPXLgMvaykxD9StpwsdBKS4z62IOsoYNP5nqQ4pLT9e91hj9J0lt7KLHHYTHn3NCwhvctdNZDblG4kPwJ61T393pDuAmkhO3LYnj/LToT5xHB4/lEGPzsaJHZE5MBPeiW/Y3241ljtgT+pbKklTrkAcaPwLx3PN39HW8+COihRaKs3QVNy7N9baLM7Ly9lGDMmHhSBSiU/t/FS28sUlq1e9YCjcx4A85LTmWyloH800vg/dKzjnZOhnrnPKrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767327708; c=relaxed/relaxed;
	bh=7TNvsfzfylPyI3YGmk5XGioJ1cCgkBkSOkbMhfdMgrY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=UvMyycrFzgsoYoJuJxeihc3xiBc161bLrp2q+gXxNRI6qO6UB738PsvuALtypTenGmnYlYwkPZOIZlQMG5uBqxvYzutLPt5p5nDcTN/FOfxYRD9iwE9LHuJzMOBsWui1eNj18qXpYch5VspsdAhvRO2Qy+CkhFr2LfBYe6ZDIiQqLBCKf1q8cIN3h1og0TmC94E5pYqYtCHDjbhP7/thyr+WdRVts2bbVh+zau290rAGOZ1eZSFg+slFZV6SVHGYXTjggmlWFCQMHCfmrQ/geeHohFlAxRUN6WArV7H7K0UUt+YCuUlN6+pr7KW2jrSfV0hKfAJZnXhvVSmPpqADqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AgS304Ga; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AgS304Ga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dj9WG525qz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 15:21:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 601JlT9h013450;
	Fri, 2 Jan 2026 04:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=7TNvsfzfylPyI3YGmk5XGioJ1cCg
	kBkSOkbMhfdMgrY=; b=AgS304GagjidVdEEc2MprRenmdrn4dASpoaV6bBAAu0J
	Twtr3Cg5FVqz83WrCoxplY5A8zCOSmTUxc34NF8b7wZsy6zgtHRY9aXYmWb7aL/z
	UsF+/8mlJ6nlYuBPXolodtrdenpmadOhEvL5dpKKoJXO8rPqaL9zH+a2kLM/W+BA
	2uzpeXVjJTIknKvYQpbesQXZIDIJvyaeSjNKdD4VN80Aq+98rZ8GKZzmOmksGvXg
	K/gM5QxorOb1Xp2DRNrrce08bPqyg3kNvq8dADSjXkTxBrljlSGwrLw8QtZsXRJG
	edKlwAc+Zx0i/mAWv8Ek4ZcDwAN+Qw9S91IrClbvYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74ue0st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 04:21:41 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6024Leu5011668;
	Fri, 2 Jan 2026 04:21:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74ue0sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 04:21:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 601N8k8o026013;
	Fri, 2 Jan 2026 04:21:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsnn0pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 04:21:39 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6024LcIx1049262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 04:21:38 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28AF158058;
	Fri,  2 Jan 2026 04:21:38 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76CD058057;
	Fri,  2 Jan 2026 04:21:35 +0000 (GMT)
Received: from [9.61.253.170] (unknown [9.61.253.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 04:21:35 +0000 (GMT)
Message-ID: <efde8090-bb33-4fdf-aa8a-38eef4ce8446@linux.ibm.com>
Date: Fri, 2 Jan 2026 09:51:33 +0530
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
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20251219]powerpc/pSeries: NULL deref in __dev_xmit_skb()
Cc: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lM8QmR_yNHwYTAbLI3iXcSx_4TKZdffk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDAzNyBTYWx0ZWRfX4osqgp+7025t
 vmLm5MlctP/APZsGShauKUUtG7fngtV/QUnEunSdJBVlvGq89Iu9/LhHN9itBxJXpjD3ebJIeme
 q/KRPXyFHm/gTiV2POGuIKCVzhqvGNXybMUe7HIIQjLVzMTD6IyxlVI5d/U37Niei9lEuqAOttO
 7oowHUmbEXO0+T8ekfxnzau1WS6g+FBnFK08Tyc0P4BgXakulLLmNztHmjNvz/3YpQSRpra2DL/
 jDWD/PN6nuxbB1hLxWoCC4NlVGXvGWLM+LyZfdwgHJeBlHj3PYIJiBTXS6Gm8H+/XvUQneiIu/t
 G/HRRXdglUKprr3Rq2JILLJeLHmCCOBWk/wfQ3gl0I8dotY9iDx3YqGNKhxaUScESD0I4rjmV1J
 esUFrC+FD13Dq4qEOiDGqolpnUhYkLeJfEyRYU0h+pSuNbjDlpP4TudCdhCgUrf0NODPArZOVqJ
 WNu02EO4rD2v7goZnBw==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=695747d5 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=c-j1JRP6kcQf8KaqAtMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: g-3L70J6R1MVjn1J1bcjxgzmZzp0iasp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601020037
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


IBM CI has reported a below crash. This occurs, in the TX path while 
sending data over TCP. e.g., cloning the linux repo or running iperf3 tool.


Environment
-----------
- Platform: IBM,9080-HEX Power11 (architected), HV: phyp (pSeries)
- Firmware: FW1110.01 (NH1110_069)
- Kernel: v6.19-rc3 (Linus master)
- Config: LE, PAGE_SIZE=64K, MMU=Radix, SMP NR_CPUS=8192, NUMA pSeries
- Workload: sustained TCP send from sshd


Traces:


[ 2480.578185] BUG: Kernel NULL pointer dereference on read at 0x00000000
[ 2480.578189] Faulting instruction address: 0xc000000000f92830
[ 2480.578192] Oops: Kernel access of bad area, sig: 11 [#1]
[ 2480.578195] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
[ 2480.578200] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
nft_chain_nat nf_nat nf_conntrack bonding nf_defrag_ipv6 nf_defrag_ipv4 
tls rfkill ip_set nf_tables nfnetlink kmem device_dax pseries_rng 
vmx_crypto dax_pmem fuse ext4 crc16 mbcache jbd2 sd_mod nd_pmem sg 
papr_scm libnvdimm ibmvscsi ibmveth scsi_transport_srp pseries_wdt
[ 2480.578234] CPU: 31 UID: 0 PID: 1895 Comm: sshd Kdump: loaded Not 
tainted 6.19.0-rc1-next-20251219 #1 VOLUNTARY
[ 2480.578239] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
[ 2480.578243] NIP:  c000000000f92830 LR: c000000000f92830 CTR: 
c00000000002852c
[ 2480.578246] REGS: c000000071d3f0c0 TRAP: 0300   Not tainted 
(6.19.0-rc1-next-20251219)
[ 2480.578250] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
28822448  XER: 00000000
[ 2480.578259] CFAR: c000000000f84354 DAR: 0000000000000000 DSISR: 
40000000 IRQMASK: 0
[ 2480.578259] GPR00: c000000000f92830 c000000071d3f360 c0000000019b8100 
0000000000000000
[ 2480.578259] GPR04: c00000001959fa68 c00000001959fa68 00000000000d19e0 
0000000002000000
[ 2480.578259] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000001
[ 2480.578259] GPR12: c00000000002852c c000000efde71b00 0000000000000040 
0000000000000001
[ 2480.578259] GPR16: c0000000a34af1a8 0000000082037405 000000000000005c 
00000000000004df
[ 2480.578259] GPR20: 0000000000000001 0000000000000001 c0000000a34af190 
c00000001959f914
[ 2480.578259] GPR24: c00000001959f918 0000000000000000 0000000000000001 
0000000000000000
[ 2480.578259] GPR28: c00000007ad9e400 0000000000000000 0000000000000000 
c00000001959f800
[ 2480.578298] NIP [c000000000f92830] __dev_xmit_skb+0x49c/0xc3c
[ 2480.578306] LR [c000000000f92830] __dev_xmit_skb+0x49c/0xc3c
[ 2480.578310] Call Trace:
[ 2480.578312] [c000000071d3f360] [c000000000f92830] 
__dev_xmit_skb+0x49c/0xc3c (unreliable)
[ 2480.578318] [c000000071d3f3e0] [c000000000f98294] 
__dev_queue_xmit+0x484/0xaa8
[ 2480.578323] [c000000071d3f540] [c0000000010a46d8] 
neigh_hh_output+0xbc/0x154
[ 2480.578329] [c000000071d3f590] [c0000000010a5454] 
ip_finish_output2+0x274/0x5e8
[ 2480.578333] [c000000071d3f630] [c0000000010a6a64] ip_output+0x74/0x12c
[ 2480.578338] [c000000071d3f6b0] [c0000000010a8524] 
__ip_queue_xmit+0x1b0/0x500
[ 2480.578342] [c000000071d3f720] [c0000000010d9a1c] 
__tcp_transmit_skb+0x53c/0xab8
[ 2480.578347] [c000000071d3f810] [c0000000010dc18c] 
tcp_write_xmit+0x6a0/0xed4
[ 2480.578351] [c000000071d3f8c0] [c0000000010dca00] 
__tcp_push_pending_frames+0x40/0x148
[ 2480.578354] [c000000071d3f940] [c0000000010bb97c] tcp_push+0xfc/0x1d8
[ 2480.578358] [c000000071d3f990] [c0000000010bd060] 
tcp_sendmsg_locked+0xe18/0x1124
[ 2480.578363] [c000000071d3faa0] [c0000000010bd3b8] tcp_sendmsg+0x4c/0x80
[ 2480.578366] [c000000071d3fae0] [c000000001117988] inet_sendmsg+0x60/0xac
[ 2480.578370] [c000000071d3fb20] [c000000000f506f8] 
sock_write_iter+0x1ac/0x1f4
[ 2480.578376] [c000000071d3fbd0] [c000000000759874] vfs_write+0x2a4/0x514
[ 2480.578381] [c000000071d3fc80] [c000000000759d44] ksys_write+0x104/0x144
[ 2480.578386] [c000000071d3fcd0] [c000000000030ec4] 
system_call_exception+0x144/0x2e0
[ 2480.578390] [c000000071d3fe50] [c00000000000d05c] 
system_call_vectored_common+0x15c/0x2ec
[ 2480.578396] ---- interrupt: 3000 at 0x7fff88333e74
[ 2480.578400] NIP:  00007fff88333e74 LR: 00007fff88333e74 CTR: 
0000000000000000
[ 2480.578403] REGS: c000000071d3fe80 TRAP: 3000   Not tainted 
(6.19.0-rc1-next-20251219)
[ 2480.578406] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48002444  XER: 00000000
[ 2480.578415] IRQMASK: 0
[ 2480.578415] GPR00: 0000000000000004 00007ffff7c1d100 00000001350e7e00 
0000000000000004
[ 2480.578415] GPR04: 000000016c125cc0 000000000000005c 0000000000000726 
000000000000703e
[ 2480.578415] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[ 2480.578415] GPR12: 0000000000000000 00007fff89094640 00000001350b5320 
00000001350b51a8
[ 2480.578415] GPR16: 0000000135083f58 00000001350b5348 0000000000000050 
000000016c128fb0
[ 2480.578415] GPR20: 0000000000000008 00007ffff7c1d2d8 0000000000000004 
00000001350b4fd0
[ 2480.578415] GPR24: 00007ffff7c1d358 000000000000000c 0000000000000001 
000000016c174c00
[ 2480.578415] GPR28: 000000016c104ff0 0000000000000004 000000000000005c 
000000016c1231c0
[ 2480.578451] NIP [00007fff88333e74] 0x7fff88333e74
[ 2480.578453] LR [00007fff88333e74] 0x7fff88333e74
[ 2480.578456] ---- interrupt: 3000
[ 2480.578457] Code: 3b200000 4800002c 60000000 60000000 7c004a2c 
7fa3eb78 7f86e378 38a10020 7fe4fb78 fb3d0000 7fddf378 4bff1a95 
<ebdd0000> 2fbe0000 419e0008 7c00f22c
[ 2480.578470] ---[ end trace 0000000000000000 ]---


If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



