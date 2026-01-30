Return-Path: <linuxppc-dev+bounces-16465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONNPMTL1fGlLPgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 19:15:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F5BDA3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 19:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2kgw32jCz2y7b;
	Sat, 31 Jan 2026 05:15:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769796908;
	cv=none; b=ckHwouug8IVK6VLlY9OCXIX4FaDJqZQZWzSfyKToi2LZ0E8hKZiC7sB67DYdQdWiOZiY8hId1gKgTo5ryTdu4GV4xX1gka+jOf+2GmexGBG9KU5vcjv1CjHR31HyzuChC0uDmNNkEnhLw0OPs+2w7UaWFcKpd92jId5tDOY9Nfp+w8ExF8zuEaGaj20pTuBPmOpFv8fDALqFfSFc/A+pEb3wZ62rJbW6ReuyD4/M07LrdiIvLsJGts+H8BZ+KBhp6471Nr3rAlfjYIcYs9MaSxgfl9136fVelGhyEOrdtKGIEYJlLbYPm3GXFE3Xrib5zOIa5mB5lz2HbCtVavd7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769796908; c=relaxed/relaxed;
	bh=w1nW3KOUvCdqwlN8NuW8QfC4bZBs8Lgb4Y/hZ2Npil0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WwmlowIw+gp+vo2cJb30Xhmkm5q0xlDIo3DShWvAWEyP/pa5fKcGm65DrpIPioe23gR4CveFoa4vilfCaq27+WhUDRz747Vf4seTFP7yTRuegTPCogRvcoxJ3JPgNF/N82pMxFlMvE7uRx+/wb7/oL+OioxacZYrOfd+j7p4jm8Rj1JKGE3SUx1iQIWdLYeMzSYTS+OzOsk2RLx9jKtQ64yQU+fSeFcukIw5lJYqQSsN1wO3G1Psqy67FnTG4+7e6TFjarDqs9DDR8bn/0oNDAPYDXQC5IBEWbZV99PERB/X13atSgnJGh8YN3s5Aw+ejcogZaVKl2bn/0MkRKydPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=opNnqx2/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=opNnqx2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2kgv0GBqz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 05:15:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60UHReo8022770;
	Fri, 30 Jan 2026 18:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=w1nW3K
	OUvCdqwlN8NuW8QfC4bZBs8Lgb4Y/hZ2Npil0=; b=opNnqx2//MwLM+EqADZKxk
	phT8tVjGuap+crgn51EeW160Cty4OmR4C6hLMxy4mqlaVKQYMolLeTJ79MQ+SpDG
	WXkJlUI6iWu0Q2WiYW17KLvsuF2D3b24r/rn0wP0jtUVBej1HsawX/jQeH/5AMYH
	GWmmjYLe410wKrgq+mR5fBfKCMZczuwR97FUtpJ9J7xq4jfi6FNt05O29Ta1BZuX
	j68mMJJDdA1EjabcSSZesMTNk1hsPAQz4IKb/Wai+IKsSjP5JQhtyEd/2jvBkF6Z
	4BLcrQwh15Euvl2maPYGrFg2Ob6FsmjYENa1/sIbUE67NKTJcINZGA96gaPXe2jw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvkgn46rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 18:14:19 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60UIEJKv017601;
	Fri, 30 Jan 2026 18:14:19 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvkgn46rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 18:14:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60UHmidH017966;
	Fri, 30 Jan 2026 18:14:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwb4271t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 18:14:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60UIEGb131392440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 18:14:17 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9275058063;
	Fri, 30 Jan 2026 18:14:16 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F61058059;
	Fri, 30 Jan 2026 18:14:04 +0000 (GMT)
Received: from [9.39.21.87] (unknown [9.39.21.87])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Jan 2026 18:14:03 +0000 (GMT)
Message-ID: <381b6d7d-69b0-4fdc-bd42-5779e5778374@linux.ibm.com>
Date: Fri, 30 Jan 2026 23:44:01 +0530
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
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
        dvyukov@google.com, vincenzo.frascino@arm.com, oleg@redhat.com,
        kees@kernel.org, luto@amacapital.net, wad@chromium.org,
        mchauras@linux.ibm.com, thuth@redhat.com, ruanjinjie@huawei.com,
        sshegde@linux.ibm.com, akpm@linux-foundation.org, charlie@rivosinc.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk,
        segher@kernel.crashing.org, peterz@infradead.org,
        bigeasy@linutronix.de, namcao@linutronix.de, tglx@linutronix.de,
        mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
Content-Language: en-US
From: Samir M <samir@linux.ibm.com>
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Gr1PO01C c=1 sm=1 tr=0 ts=697cf4fb cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Yqzg2m6fQhnNyKgerrwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JGzjuNtitJMVHxJlJV3X6tzSw1CTD6F7
X-Proofpoint-ORIG-GUID: SsXK2U34AYQ4lw-l7K_LPzM9FXnK_LAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE0NiBTYWx0ZWRfX1H8YSZfRyKlE
 IsgOACPSoIh12ZMHDu2CUAVnzTNvBO9qSqAbs0tGLk5KKBeaO2/wEoPzK5j2F+cVcIyYKrjqQtQ
 gAd1qPGOL/u/vduSzvbdaolKzD9kfH5UoWMKM29OpJMGNlcw/QeKlDtpniVjCWsns+xCCQjvCLS
 Q+v7w4Mw/pNRxdvRWNeiWMZoVxbhwSKjVv3nkr4cFTxaBBFn8fnHloEXwkTtHIynlVCvGnczAIR
 1aRFohRBF3gsW4Z3ZY2zVqfm/yPtBf2Q0bvDWTiu2RtrzjAmqeDWwFM3NMMAiCg/sxuNPzCfz3u
 XUqW+FkLaCvELrERht22DllDzvNSJGuzTZ7YkY/rATA8mbM5wJHNM42UqM74OqpF6QNVHS7lZT0
 p0cCphib+l5yxVZyYjoJJ4DMWZeYHGJ5rWcAX1SteDjQY3d/oYwusgi+IaaGmtUQP+8mc1KtwtD
 2Vb/oEQYoZt3Cg8mtrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601300146
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16465-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[samir@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samir@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: D87F5BDA3E
X-Rspamd-Action: no action


On 23/01/26 1:09 pm, Mukesh Kumar Chaurasiya wrote:
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
Hi Mukesh,

I verified this patch with the following configuration and test coverage.

Test configuration:

  * Kernel version: 6.19.0-rc6
  * Number of CPUs: 80

Tests that are performed:
1. Kernel selftests
2. LTP
3. will-it-scale
4. stress-ng (IRQ and syscall focused)
5. DLPAR with SMT stress testing
6. DLPAR with CPU folding scenarios
7. ptrace, ftrace and perf related tests.
8. Build and boot.

No functional issues were observed during testing.


Performance Tests:
perf bench syscall usec/op:(+ve is regression)
syscall  | without_patch | with_patch |  %change |
--------------------------------------------------
getppid  |   0.100       |  0.102    |  +2.0 %  |
fork.    |   363.281     |  369.995  |  +1.85%  |
execve.  |   360.610     |  360.826  |  +0.06%  |


perf bench syscall ops/sec:(-ve is regression)
syscall  | without_patch | with_patch  |  %change |
--------------------------------------------------
getppid  |   10,048,674  | 9,851,574|   −1.96% |
fork.    |   2,752       |    2,703   |   −1.78% |
execve.  |   2,772       | 2,771    |   −0.04% |


IPI latency benchmark (-ve is improvement)

| Metric  | without_patch (ns)| with_patch (ns) | % Change |
| -------------- | ----------------- | --------------- | -------- |
| Dry run        | 202259.20        | 201962.38       | -0.15%   |
| Self IPI       | 3565899.21       | 3271122.04      | -8.27%   |
| Normal IPI     | 47146345.28       | 42920014.89     | -8.97%   |
| Broadcast IPI  | 3920749623.87     | 3838799420.04   | -2.09%   |
| Broadcast lock | 3877260906.55     | 3803805814.03   | -1.89%   |

Please add the below tag,

Tested-by: Samir M <samir@linux.ibm.com>


Regards,
Samir.

