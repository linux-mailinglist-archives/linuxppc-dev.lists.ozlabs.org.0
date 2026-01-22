Return-Path: <linuxppc-dev+bounces-16160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL+6NP1XcmkpiwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:01:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D228F6A9C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:01:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxnQy2p92z30BR;
	Fri, 23 Jan 2026 04:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769101306;
	cv=none; b=U+JthhzipZij7lnXQfDVqBjlpuM+mw8RRWHJDicVWpS4QICGe16CyvvkIm1N8rfooxQDI8REob25CjuYLXk3cIMTSBHjTsbJcam8bT8i9cSj9hUsTAGdUVC4qPUcLYp1mhZ8VXvOPPE/Zbv7UXINQjj3HpvvPTg75fNNI6NIH/SMTiEFvPPkBcDM4yTWYE2gkuBGMQ6n6+7XIFwexWW2xRmgtl7xdAUo02FdLqYnPElKFuYWIZKUHzCkIzhJOouAu1r534iZsznB6pe1m0xlde85l0VrB9PH3fO6n/j+goXaOLtQQh5+Q6qSoIb6cRPEIFoDB2f7uP/MXXRSmLFvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769101306; c=relaxed/relaxed;
	bh=IoC31NcLIKhHl7nnDZao1pp9zOC5/bR7Hpi37dqAcwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PtsbN8qqAIjA9O1edifazi9pKETKlyyBFjHFuuup6RrkfPphY6Be4Av2dRB41XIUAu8l89zd4A0p2opgso9SkgUFzomJtgY9p7rMXCSQM5MIDsFG4N4q64ZqD8XQSKtD5sMHmMtga6/WqGMvFP0YLGJzJXQ6YXowBjqasEumTT8OhuQ7ZRzpJ0Ru3Wb4PQb3RskY3erZq/QrmUUzG3Cc37HfPhb6Tx+wc/wzz8cDV96oY8F0AuAyb6AruHg5K8dIEofErrvp3C2SSjPEDHRfZFxhVIKzUP4MBccxGQxy8yc+dkXjyCm07d4YszmBjgCiqaQXE5FvSMMv4BPjWndtKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VS65rKzA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VS65rKzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxnQx4NhLz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 04:01:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEpexk028705
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IoC31N
	cLIKhHl7nnDZao1pp9zOC5/bR7Hpi37dqAcwU=; b=VS65rKzArwSWNHOOm88VyN
	yUpaN/WZgzPIuHkDOYUB+D2lPGHRM+DkXE9mTr9DpvdAx1+K+zlaRiNYzp59Mr36
	jdw5IQO7OC4hE2AXe/iVCGIfd0hQM2h9R+ipa8q1wGxW4oGuFwkti+Yg6llQhMBt
	8OiaemkaojiEak+Hcuc4IhJsTyZHNNFTFAFwPdjBcveqPAwilpEyPPQvbotv82/m
	MylJiwG0qjqEDLqU3cRpJUldHGZ3imXLMAoOF6BqZsd2HFHd5jxpu/GIcYODxd8+
	JlqbyfElMg/dA/lb3nSI98VrIdS4ojkxXuVuYKs2aepjd8utYoCRzlU3AlKFVS/Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60exhch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:01:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MG3fPr027233
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:01:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brnrnbfxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 17:01:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60MH1aCg61669838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jan 2026 17:01:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC58B2004B;
	Thu, 22 Jan 2026 17:01:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECD4F20040;
	Thu, 22 Jan 2026 17:01:35 +0000 (GMT)
Received: from [9.43.78.102] (unknown [9.43.78.102])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Jan 2026 17:01:35 +0000 (GMT)
Message-ID: <70cd2d0d-334f-4f08-b568-419d40ebe470@linux.ibm.com>
Date: Thu, 22 Jan 2026 22:31:35 +0530
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
Subject: Re: [bpf] Observing Kernel Softlock up while running BPF self tests
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
References: <d6926384-0b4e-44e2-a828-1ddb57500b3b@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <d6926384-0b4e-44e2-a828-1ddb57500b3b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=697257f7 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVtHZ5YHyPqFQcMM3lEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jg9Sa-YN3syNOXSdPWlHiwEe2NWN-Qbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyOSBTYWx0ZWRfX/7JU2lO2FY/3
 bLluFlKZ1tjfzLMeBk0PL6V/IzADkYFo3Uop1eoIHfZaEdE7qQV6cD7BBbS6bQENyg6QNzhLqBX
 ZJLQswKqsO2Dq6vOHjNMlKt3ihbAyNSPA0FP6r2Wnog7WnMpv79yPQCRG6ayxShqTFiyzpQEQoL
 bfeMxwrT1GQMxtRV5lTPFUafcL7lgCmm5/7Q4gR09IrzcafNmm26YBUrg872ZonDIENVfZljAiv
 S58Uk7XHzwoVkg914s8X2DrqKFo4mycqhRYRXUGHnZyeyvxV2b7sbhJfkbN57Rbz7AcO2FkXrqv
 Me3Ci8UKlpNMnrk74t2kagFUeqqACjtoD/ReqmBJO1EF5yrMn7yMu/js+5kQOZDiv6FGfllco1M
 kcmyV+YxLw7oitRZfiJNmpi/G4qLek8c+C/dtN+/GIrQlKW0/+abU0TlzOBK4CrU/5l9DpKoN/7
 KSqj5wa9DCcdBQHDenw==
X-Proofpoint-ORIG-GUID: jg9Sa-YN3syNOXSdPWlHiwEe2NWN-Qbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601220129
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16160-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:venkat88@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:skb99@linux.ibm.com,m:maddy@linux.ibm.com,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D228F6A9C9
X-Rspamd-Action: no action

Hi Venkat,

Thanks for reporting..

On 20/01/26 2:40 pm, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a kernel softlockup, while running BPF selftests on 
> PowerPC kernel.
> 
> 
> Traces:
> 
> [ 1632.509843] audit: type=1334 audit(1769127975.721:164430): prog- 
> id=82135 op=LOAD
> [ 1632.509852] audit: type=1334 audit(1769127975.721:164431): prog- 
> id=82135 op=UNLOAD
> [ 1637.016921] Mode = AA
> [ 1660.780274] watchdog: BUG: soft lockup - CPU#8 stuck for 23s! 
> [rqsl_w/8:51609]
> [ 1660.780283] Modules linked in: bpf_test_rqspinlock(OE+) 8021q(E) 
> garp(E) mrp(E) stp(E) llc(E) vrf(E) tun(E) bpf_testmod(OE) veth(E) 
> nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) 
> nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) 
> bonding(E) nft_ct(E) tls(E) nft_chain_nat(E) rfkill(E) sunrpc(E) 
> ibmveth(E) hvcs(E) hvcserver(E) pseries_rng(E) vmx_crypto(E) 
> dm_multipath(E) fuse(E) dm_mod(E) drm(E) drm_panel_orientation_quirks(E) 
> zram(E) ext4(E) crc16(E) mbcache(E) jbd2(E) sr_mod(E) sd_mod(E) cdrom(E) 
> ibmvscsi(E) scsi_transport_srp(E) [last unloaded: livepatch_sample(EK)]
> [ 1660.780352] CPU: 8 UID: 0 PID: 51609 Comm: rqsl_w/8 Tainted: G    OE 
> K     6.19.0-rc4-g960c1fd29055 #1 VOLUNTARY
> [ 1660.780359] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [K]=LIVEPATCH
> [ 1660.780362] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
> 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [ 1660.780365] NIP:  c0000000000399a8 LR: c000000000039c24 CTR: 
> c000000000039ca0
> [ 1660.780368] REGS: c000000bc19cfd28 TRAP: 0900   Tainted: G      OE K 
>      (6.19.0-rc4-g960c1fd29055)
> [ 1660.780372] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> 
> CR: 28000288  XER: 0000000a
> [ 1660.780386] CFAR: 0000000000000000 IRQMASK: 0
> [ 1660.780386] GPR00: c000000000039c24 c000000bc19cfd00 c000000001f58100 
> c000000bc19cfcf8
> [ 1660.780386] GPR04: c000000bc19cfea8 0000000000000000 4000000000000002 
> c0000013ff916e08
> [ 1660.780386] GPR08: 00000013fd6c0000 0000000000000049 fffffffffffffffc 
> c0080000f73e0f98
> [ 1660.780386] GPR12: c000000000039ca0 c00000002e9b6700 c000000000270808 
> c000000bad8fe980
> [ 1660.780386] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [ 1660.780386] GPR20: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [ 1660.780386] GPR24: 0000000000000000 0000000000000000 c0080000f7360048 
> 0000000000000000
> [ 1660.780386] GPR28: 0000000000000008 0000000000000000 000001827223b155 
> 0000000000000003
> [ 1660.780433] NIP [c0000000000399a8] __replay_soft_interrupts+0x38/0x150
> [ 1660.780443] LR [c000000000039c24] 
> arch_local_irq_restore.part.0+0xe4/0x160
> [ 1660.780449] Call Trace:
> [ 1660.780452] [c000000bc19cfd00] [c000000000039a0c] 
> __replay_soft_interrupts+0x9c/0x150 (unreliable)
> [ 1660.780460] [c000000bc19cfeb0] [c000000000039c24] 
> arch_local_irq_restore.part.0+0xe4/0x160
> [ 1660.780468] [c000000bc19cfef0] [c0080000f73e042c] 
> rqspinlock_worker_fn+0x244/0x300 [bpf_test_rqspinlock]
> [ 1660.780476] [c000000bc19cff90] [c000000000270954] kthread+0x154/0x170
> [ 1660.780482] [c000000bc19cffe0] [c00000000000df78] 
> start_kernel_thread+0x14/0x18
> [ 1660.780487] Code: 60000000 7c0802a6 f8010010 f821fe51 e92d0c78 
> f92101a8 39200000 38610028 892d0933 61290040 992d0933 48102e15 
> <60000000> 39200000 e9410130 f9210160
> 

Does the system recover after this or is it unresponsive?

- Hari

