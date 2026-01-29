Return-Path: <linuxppc-dev+bounces-16404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEOtCWS5e2k0IAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 20:47:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56323B4155
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 20:47:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f28nB2GWyz2ydj;
	Fri, 30 Jan 2026 06:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769716062;
	cv=none; b=ZQikQuRcn3UUIgKsy64b83NPYE6pqYOeqcof0ONf3cou1dyQrjGNcXJO8PZMwcwaoZpEbR7aYkI6AcTuxocDpuLDAToZFQ8nmyucIiefV9oh7C3LHL9zb8vRPI/ySgg0ovIW2Vbl0CHDM3JkgSfklVuojattxUy/ttEEb6ZIuuPVPgr+6VOMtfPMT0H2g+UBv/jmGB0dogAxBPuyyjuHSTYNeKwzd3FYaEWDsVKrMqC7irSjouYV6NF3DpJbXVHGh48oPooesQZ0sjRLoOK08lz8vhVGxWcgcfTtOKBEXs5+GN5qF5UI5+QPVQeJQjmgc+jUNX39912jQuiIoJncXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769716062; c=relaxed/relaxed;
	bh=BAy5EBFlEZFFCzA9I+ENDRUYbPGo2bpDSSzDkXB6zGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8f5+v5wl3DG//bKczzB5uCbYQ6NhSOzc9+K6Iq658VNnx/1CWRnoY45o0zP7zatitiM9XUFM+6WuyMaUDIQGs4oy1O4Alzhlm+b4YsN7EXCFRd668obVjyHkX8F6KZQRRvzSYXEQG/eGxgg5LfeiXVAOFwMtIwBJarnzFDA0nQ8M8xym9JQnwkx+nT08KEhnczgxDjhNjgdmrAjKWmhx8mO8iue4gZ/F7CRNBcWzycFdk6vazhi7SVIwSx39dFswQvrhzTxmNwgH7GUW73GfXIiwtMx2G0CjxHQ5aaEOeFp2rhAcKC1psVoypzLS3XU8qn9sLxvnVZZAuNaiwnukQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePh6JtTz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePh6JtTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f28n86yYCz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 06:47:40 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60TD0cIV024543
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 19:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BAy5EB
	FlEZFFCzA9I+ENDRUYbPGo2bpDSSzDkXB6zGY=; b=ePh6JtTzhYe0+YHWQ/hsNE
	S18bVaXwT0wYZaaF0sYaOFTdFsvUet2XySBhWFmyhzXaglaoEfhYBI8zboSq/9sa
	24TALyRNclmDmYzQO7nHbK3hO68J0iW9Aswu/+Li37wdY4DudxV68FqPjRvmjgOZ
	LxlBv3/cqfhiJnq/rMgrEiQjpfV5sP9pVeNye6VTwUxTCLvYjcWXn+SPLNp3MZho
	j1AuU5wCuOJFtwXCH1lzx9FjPKMlOrx1w7WCVlYDYGO3cbx/uXmVgPhWxdaal+hH
	AFzEy251dVMgOHa2gztFJzOXexU5S8zdThZs/6W3u2Jcq0b25iHAKJn+DZBiZR6w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtthec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 19:47:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60TJYwR9023341
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 19:47:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwamk37yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 19:47:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60TJlWJs50856284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 19:47:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F7122004B;
	Thu, 29 Jan 2026 19:47:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D1BC20040;
	Thu, 29 Jan 2026 19:47:30 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.210.240])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 29 Jan 2026 19:47:30 +0000 (GMT)
Date: Fri, 30 Jan 2026 01:17:22 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [bpf] Observing Kernel Softlock up while running BPF self tests
Message-ID: <aXu5Sv7K2Hrr9lay@linux.ibm.com>
References: <d6926384-0b4e-44e2-a828-1ddb57500b3b@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6926384-0b4e-44e2-a828-1ddb57500b3b@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZPUXMHs76KmSdry3qijElEnz5EC_Uowh
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=697bb958 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=3dM8K78k7W8P1kle2wUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: ZPUXMHs76KmSdry3qijElEnz5EC_Uowh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE0MiBTYWx0ZWRfX4baxzpw2P/Ha
 T+LPWu3zOGw47MyNw17xbsnPqJ7JTDO+szuVWdWZPPBEIBtw5+AQP0GmLtpIFcT9FZAPSWDdYHo
 n1gV3AjLYjyKD7BNeQYPr5XQ1vxZ0VMDwfR/AKyeyuURwxqHcz8IqzY+4MMCRsQMqeDWZl90qpL
 zNTEiRREpYi267ZPUzYJpWxiG7aABx3o9BBeMsGBUKFfqug756g0fqh7M93zq2CLLYWNOo08AAR
 2sXVQxv4iNPQh+QoctiOlN6rWqE0vcznIW1bE/KbX6fcurf1Ahv+b696EUz2pAHpl+ggQx4MLZM
 0LaBT0OKu4YuvicJd7eDtn1YMqh/pWatBADSXykV+kCumZMIsulgbqqJ3JmW6KctLxoaiM5geUH
 KlU4/6HrIHop22h5nrnqjUTm47oiJ2miyHne2f5UN+2uV+DC3zkxp+mPrf3t9tfm5BXDNxy1mrP
 Tq1N5j8zKbssqwHUkiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601290142
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16404-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:venkat88@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:hbathini@linux.ibm.com,m:maddy@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 56323B4155
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 02:40:44PM +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a kernel softlockup, while running BPF selftests on
> PowerPC kernel.
> 
> 
> Traces:
> 
> [ 1632.509843] audit: type=1334 audit(1769127975.721:164430): prog-id=82135
> op=LOAD
> [ 1632.509852] audit: type=1334 audit(1769127975.721:164431): prog-id=82135
> op=UNLOAD
> [ 1637.016921] Mode = AA
> [ 1660.780274] watchdog: BUG: soft lockup - CPU#8 stuck for 23s!
> [rqsl_w/8:51609]
> [ 1660.780283] Modules linked in: bpf_test_rqspinlock(OE+) 8021q(E) garp(E)
> mrp(E) stp(E) llc(E) vrf(E) tun(E) bpf_testmod(OE) veth(E) nft_fib_inet(E)
> nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E)
> nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) bonding(E) nft_ct(E)
> tls(E) nft_chain_nat(E) rfkill(E) sunrpc(E) ibmveth(E) hvcs(E) hvcserver(E)
> pseries_rng(E) vmx_crypto(E) dm_multipath(E) fuse(E) dm_mod(E) drm(E)
> drm_panel_orientation_quirks(E) zram(E) ext4(E) crc16(E) mbcache(E) jbd2(E)
> sr_mod(E) sd_mod(E) cdrom(E) ibmvscsi(E) scsi_transport_srp(E) [last
> unloaded: livepatch_sample(EK)]
> [ 1660.780352] CPU: 8 UID: 0 PID: 51609 Comm: rqsl_w/8 Tainted: G        
>  OE K     6.19.0-rc4-g960c1fd29055 #1 VOLUNTARY
> [ 1660.780359] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE, [K]=LIVEPATCH
> [ 1660.780362] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202
> 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [ 1660.780365] NIP:  c0000000000399a8 LR: c000000000039c24 CTR:
> c000000000039ca0
> [ 1660.780368] REGS: c000000bc19cfd28 TRAP: 0900   Tainted: G      OE K     
> (6.19.0-rc4-g960c1fd29055)
> [ 1660.780372] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR:
> 28000288  XER: 0000000a
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
> [ 1660.780487] Code: 60000000 7c0802a6 f8010010 f821fe51 e92d0c78 f92101a8
> 39200000 38610028 892d0933 61290040 992d0933 48102e15 <60000000> 39200000
> e9410130 f9210160
> 
> 
> 
> If you happen to fix this, Please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> 
> Regards,
> 
> Venkat.
> 
> 
Hi Venkat,

I tried on bpf-next-6.19.0-rc5+. It is recovering from softlockups after
sometime and the selftest is passing:

./test_progs -t res_spin_lock_stress
WATCHDOG: test case res_spin_lock_stress executes for 10 seconds...
#377     res_spin_lock_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

On powerpc, there is an arch-specific implementation of queued spinlocks,
but the resilient queued spinlock used by BPF currently falls back to a
simpler test-and-set (TAS) lock. Under heavy contention, this can lead 
to soft lockups like the one observed above. Once powerpc specific 
resilient queued spinlock implementation is added, the issue is expected
to disappear.

Thanks,
Saket

