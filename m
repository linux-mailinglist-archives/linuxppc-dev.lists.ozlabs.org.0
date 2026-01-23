Return-Path: <linuxppc-dev+bounces-16250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM22Ce/Tc2kCywAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:02:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9757A746
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:02:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyTPR6JzTz2yF1;
	Sat, 24 Jan 2026 07:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769198571;
	cv=none; b=k7FNhcSN/MHRqt+ZBSFl+ki1G5d1wawGJHame/HKDSSXeQeVbTstKzbiM/PXYVn6Kap/07Em6DFHimFZQzjtWL1RQYkKIMzGPkswShqil4b66OuEL/PoDsLB6cxgQNyWS5FqbljAqtwb7XNL03beI3yqiBGgzqfUWRsJBAHEgVpBdMiqRBxPzE/sBfXV6lkiiFr1L07rE3qaPE+HaKrh3oJZApB8+IQbR/xeXHxyd1VLxHo5Xh6QxZN9n8nGHzwe4fTLOwvHbvAZgJQVe0eNBPFCl4v6ma5l2+MidXw9E42Rur67pCYESbvEudFvs+MNuSJy1n7a0t9113oQRA1DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769198571; c=relaxed/relaxed;
	bh=b8Mov375bZ6LpMbf3/ApUSOuke0Bc51Tv7nEe8J4Zf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=nNSheQhdn5RS1MHGhv0F+IKoMy01dRmCciuYixt0/uUavGWHzOvS56lrYf+YWG80fi3tdj84SPQfqBDQkvNt70Z70Oy+N8uvWrmNJJDfVZxUsg9jf/IfMnW3rtgWVtMDt/sM5hkEIqZ9FpmK2tPhp/u0OY1tLj8pCLAz2s/Q41SLP/hivT+aNRPKsfgZ1EDfYfJARduAh4yhfqYRPQIRdtgHy+Jz9tUHTH7LfnJu0LZ+YxnxUC/TOTns7H5gwX9BFBfbX64ebKsw8H2wM6cKcUn9oGuXLQheMLCFWYlK95DIZKqLfQsMWnLwaHGGQ6RAuyl1yPudl3zPkKpZQnu7tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8tzwRrG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8tzwRrG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyTPR0Fk5z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 07:02:50 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60NBluRl006766;
	Fri, 23 Jan 2026 17:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=b8Mov3
	75bZ6LpMbf3/ApUSOuke0Bc51Tv7nEe8J4Zf0=; b=Y8tzwRrGL17SbwrJz+ujuJ
	DErfUcWJH+XCGYrc5PkpIE47vzgj2VacAFWHvELMirtWv5jApHkuL4f+c7+q5Y+c
	D/TGjO5pYnVhP7ctWVGq87WsMW8nueQxQ0heatyp81N3jEAxq4n3DZfZoY6fYI8B
	CtpX5sB23NRf1KSVzi7c7HyeXiIbPjPcCNb7/80ob0ivB9gm1wuWKsj0JOKInrlj
	NnmNVS429CxACU1xXhTeyueNOdRdGgx0YbY7L/AckmLsuWB41o36IkTNBOjXhyzp
	Yd4J7sCYcR2Sw7fW55WkPAL1H9OkLWuwyez6dJngwcLVTXsmMdlF2FdWem1MOobQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23shkny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 17:54:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NHsRFa012047;
	Fri, 23 Jan 2026 17:54:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23shknv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 17:54:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NHfP0c001441;
	Fri, 23 Jan 2026 17:54:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpykaa2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 17:54:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NHsMKv57475528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 17:54:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA34320043;
	Fri, 23 Jan 2026 17:54:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BE7620040;
	Fri, 23 Jan 2026 17:54:16 +0000 (GMT)
Received: from [9.124.208.250] (unknown [9.124.208.250])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 17:54:16 +0000 (GMT)
Message-ID: <fe290d99-e81b-4af1-ac2f-5b2a603f2311@linux.ibm.com>
Date: Fri, 23 Jan 2026 23:24:15 +0530
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
Subject: Re: [PATCH v4 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
        chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        ruanjinjie@huawei.com, akpm@linux-foundation.org, charlie@rivosinc.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk,
        segher@kernel.crashing.org, peterz@infradead.org,
        bigeasy@linutronix.de, namcao@linutronix.de, tglx@linutronix.de,
        mark.barnett@arm.com, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, mpe@ellerman.id.au
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z8oFEMXIu77fQ1YXe_BcD7q1rWsCagL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNSBTYWx0ZWRfXwBwhBbIRDSrI
 hDumUhXCeHKXZkbfJXqUlIGQnGgaBpFl+T9ODv+QvLODVGhzHW5nAGSY3wh6jSYWcrbftL04LlI
 2z1jXdlafDD9Aqx+LL6ZacupzbjLWDenRRZlwVDv1LmFTEdlhtdt8D3RzZ0ZdaT+HTeet+RaGpb
 KiSceCXyhfn0CLTrwgrRf0Nr8sK9CtGb4wgvdrffqYG5End6jfsVU70if+LdWvdw8SmwN3DRj8j
 T1syo3KXCDr3FkdSTuEP5rniakzu7aSK1bMSDhWnx671/uZ69VItObsGDW4CjRStWaKh1gglwkl
 vXnnfaW3uvau9rinouZ6izB3208spfAxiXCVlo2bFQZPGo8AcaEVfk1DHXbjJq/LTg66EiXET7+
 iE5UYFaMzWZm9uGyTfQHYIyQgQk6pBzt0QTAII/xhBe5I3dv8pFqE2I9wjK/fcGEu/tyEK1xzCR
 QTIQTJMMJYNse+gEftg==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6973b5d4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=sMalUQvjKGqCotWJyjAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WpN86vPm6XmpPwOybC2qdTa6o26ixkyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230135
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16250-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@linux.ibm.com,m:maddy@linux.ibm.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:npiggin@gmail.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:mpe@ellerman.id.au,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,google.com,arm.com,redhat.com,kernel.org,amacapital.net,chromium.org,linux.ibm.com,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,vger.kernel.org,googlegroups.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.677];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2C9757A746
X-Rspamd-Action: no action

Hi Mukesh.

On 1/23/26 1:09 PM, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
> 
> This is slightly tested of ppc64le and ppc32.
> 
> The performance benchmarks are below:
> 
> perf bench syscall usec/op (-ve is improvement)
> 
> | Syscall | Base        | test        | change % |
> | ------- | ----------- | ----------- | -------- |
> | basic   | 0.093543    | 0.093023    | -0.56    |
> | execve  | 446.557781  | 450.107172  | +0.79    |
> | fork    | 1142.204391 | 1156.377214 | +1.24    |
> | getpgid | 0.097666    | 0.092677    | -5.11    |
> 
> perf bench syscall ops/sec (+ve is improvement)
> 
> | Syscall | Base     | New      | change % |
> | ------- | -------- | -------- | -------- |
> | basic   | 10690548 | 10750140 | +0.56    |
> | execve  | 2239     | 2221     | -0.80    |
> | fork    | 875      | 864      | -1.26    |
> | getpgid | 10239026 | 10790324 | +5.38    |
> 
> 
> IPI latency benchmark (-ve is improvement)
> 
> | Metric         | Base (ns)     | New (ns)      | % Change |
> | -------------- | ------------- | ------------- | -------- |
> | Dry run        | 583136.56     | 584136.35     | 0.17%    |
> | Self IPI       | 4167393.42    | 4149093.90    | -0.44%   |
> | Normal IPI     | 61769347.82   | 61753728.39   | -0.03%   |
> | Broadcast IPI  | 2235584825.02 | 2227521401.45 | -0.36%   |
> | Broadcast lock | 2164964433.31 | 2125658641.76 | -1.82%   |
> 
> 
> Thats very close to performance earlier with arch specific handling.
> 
> Tests done:
>   - Build and boot on ppc64le pseries.
>   - Build and boot on ppc64le powernv8 powernv9 powernv10.
>   - Build and boot on ppc32.
>   - Performance benchmark done with perf syscall basic on pseries.
> 
> Changelog:
> V3 -> V4
>   - Fixed the issue in older gcc version where linker couldn't find
>     mem functions
>   - Merged IRQ enable and syscall enable into a single patch
>   - Cleanup for unused functions done in separate patch.
>   - Some other cosmetic changes
> V3: https://lore.kernel.org/all/20251229045416.3193779-1-mkchauras@linux.ibm.com/
> 
> V2 -> V3
>   - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
>   - Some functions made __always_inline
>   - pt_regs padding changed to match 16byte interrupt stack alignment
>   - And some cosmetic changes from reviews from earlier patch
> V2: https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com/
> 
> V1 -> V2
>   - Fix an issue where context tracking was showing warnings for
>     incorrect context
> V1: https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.com/
> 
> RFC -> PATCH V1
>   - Fix for ppc32 spitting out kuap lock warnings.
>   - ppc64le powernv8 crash fix.
>   - Review comments incorporated from previous RFC.
> RFC https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/
> 
> Mukesh Kumar Chaurasiya (8):
>    powerpc: rename arch_irq_disabled_regs
>    powerpc: Prepare to build with generic entry/exit framework
>    powerpc: introduce arch_enter_from_user_mode
>    powerpc: Introduce syscall exit arch functions
>    powerpc: add exit_flags field in pt_regs
>    powerpc: Prepare for IRQ entry exit
>    powerpc: Enable GENERIC_ENTRY feature
>    powerpc: Remove unused functions
> 
>   arch/powerpc/Kconfig                    |   1 +
>   arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
>   arch/powerpc/include/asm/hw_irq.h       |   4 +-
>   arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
>   arch/powerpc/include/asm/kasan.h        |  15 +-
>   arch/powerpc/include/asm/ptrace.h       |   6 +-
>   arch/powerpc/include/asm/signal.h       |   1 -
>   arch/powerpc/include/asm/stacktrace.h   |   6 +
>   arch/powerpc/include/asm/syscall.h      |   5 +
>   arch/powerpc/include/asm/thread_info.h  |   1 +
>   arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>   arch/powerpc/kernel/interrupt.c         | 254 ++---------
>   arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
>   arch/powerpc/kernel/signal.c            |  25 +-
>   arch/powerpc/kernel/syscall.c           | 119 +-----
>   arch/powerpc/kernel/traps.c             |   2 +-
>   arch/powerpc/kernel/watchdog.c          |   2 +-
>   arch/powerpc/perf/core-book3s.c         |   2 +-
>   18 files changed, 690 insertions(+), 828 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h
> 

Ran it a bit on powernv (power9) too. Not warnings and similar
micro benchmark numbers.

I think this is in better shape now. With that,

for the series.
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

