Return-Path: <linuxppc-dev+bounces-16207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH5QBO8lc2nCsgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:40:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71971DB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy8wn70b5z2yF1;
	Fri, 23 Jan 2026 18:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769154025;
	cv=none; b=Q4Rp3FASfUXTuUoczy4gIkzkQOdm9KKFajXaoeLApGna+mwKtfTjxNoUALWjAzWmGNzZ5WTmTSuHgnjkwp0OoZx+HG8gvc7XjuzkRUQCHVbm6wwoohX5KRELQ+CxXtEOwzJK69CoAGmQAHVNDuzwSwj9uUPGBFPKovAdBhHxOCQbPY7H4j8BiMOVSoQKNZr/4FC5CsLRGBRjB2sl1Mml5PQYlgEFM89r0+d6s1bKCihfGu3O86LIEiNOAMdsIWKOVXE5A13iuwhNX7BYTTie37ArVk6Av9nJknrBCoqQKixrFzIW+7WVDk3FLZGcWgIjcnWMpgDnCbxQ4LiAJH3vLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769154025; c=relaxed/relaxed;
	bh=xTPybRJP8OVYkXfG9/a0F4gqsEh0oX8DQVBiN4ibEiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X9M7CoLTD2GN1u3TYpT2SKBjy4yTY8FtVn13yAFqQpgpj7J4o+l+NCxoUshBxvQr9gQYofGZO7SiIwZAH1cdG3eYVtbzq6bejsneJ7OmlK5rNQUx5phPirAgfkzR6b4r+sdQFN1999G1lgfmp2dA5Nyf+D7hdnh+eUOgBbgaXAxhfpYV2VbPKrSRPvys386PhmvEYXj84eHg1Sl8kf3NAnGcxBdmOU1Wvn5ZiBS4gX4F4HUHjahoq+tR4nMwGckjF5CpqwBRvRaI2i0bxxw0illQE3QWYqMohm2hRQdD0s8cv90F9z/pK2CoqkftK0xmWjoBn7Jg2w0RQp5Vv02caw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqDbiFxf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqDbiFxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy8wm6W1wz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 18:40:24 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MKaHMN028492;
	Fri, 23 Jan 2026 07:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=xTPybRJP8OVYkXfG9/a0F4gqsEh0
	oX8DQVBiN4ibEiI=; b=cqDbiFxfyzQH9eKmomhNXRBCVO9fud1JVlH3y9OGewqI
	QPed3xg4bPzyXg6XnsbadhDzyTeZKrr1d/vpWVJW27ivGgAVKf633llc9fOeS5eD
	4Mtd7r8Q3xibT1cMBc17cmGn0+O05impufmNrFq8OFqms2nbxRfoE+iLl4m/o8mL
	Y0eONiu8nT5S35uRkoMrquwHmrIW2hVPTlNrOIYaA8Q03Ilhe6ygnssnbRD9022M
	O2R2F1t1InPU4lIj4GVEpiM31ncsIfdvXsY82xDmYj9VcTe5UBnBYWVpPyv/c03B
	FX7kpoZKHjsfyQI/lzWw0ohoPjqmiYGr3yabLtCQCA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f271m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:39:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60N7XJ69004182;
	Fri, 23 Jan 2026 07:39:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f271h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:39:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N5F6I1006427;
	Fri, 23 Jan 2026 07:39:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf1yfxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:39:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60N7dZNY19071450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 07:39:35 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC3BC20043;
	Fri, 23 Jan 2026 07:39:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88AE720040;
	Fri, 23 Jan 2026 07:39:28 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.222.171])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 07:39:28 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        ruanjinjie@huawei.com, sshegde@linux.ibm.com,
        akpm@linux-foundation.org, charlie@rivosinc.com, deller@gmx.de,
        ldv@strace.io, macro@orcam.me.uk, segher@kernel.crashing.org,
        peterz@infradead.org, bigeasy@linutronix.de, namcao@linutronix.de,
        tglx@linutronix.de, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Subject: [PATCH v4 0/8] Generic IRQ entry/exit support for powerpc
Date: Fri, 23 Jan 2026 13:09:08 +0530
Message-ID: <20260123073916.956498-1-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=697325bc cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=qhNI7X2oh4BViAGumkMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qxVIxZlClOMHmGUk7ZykNwueZcuO5f0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NSBTYWx0ZWRfX+cqIm8qm5B2D
 lKyP3IULHXZMQ8fs65NZ0lm+S+UXLae0OX8aRjq7Chs9XGhgNbrNEnibvfWMUG4VuYIewa71x4b
 494siLzDuzUYVt2HskyU0PHzkr5GF8hWgqoS/X8kgA4XAgOkIdTXc/F9i8yZaAov7xrFXnCUvuF
 5zFdqa1Cc+0RVNffmN9bCzI4PaVtpiIF8V6MG3Wi2XfKKRCPG3isf29PgCX2P44O/iTtrunHdpJ
 dvbafp8MgZnR1wVwsFjQBVkAL9ogPhbA7zzdDa/K1aUegMjc/Ff0nHcjm2b7nl81hQPfIFDf4AL
 CJlrf2LtPnAiSaHt+UmpY3F4Y3mCRAkT2DwRtOWHyBQxlxa1dojRGlnG+i0ktuT/ifvNMFp5nzd
 87AKbZVMOc2Ibez7Ng9PtcENuUvevh6KGiYBR6CFYzuueEjG4GWzSNxLJlTf9Is3llo/7/+Ury6
 Rt/Qeru9oPn4U7/Qf2A==
X-Proofpoint-ORIG-GUID: rQWVxKWvq52gHXGEXcwkidNjR42mBbsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601230055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16207-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	FORGED_SENDER(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:mkchauras@linux.ibm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 2D71971DB8
X-Rspamd-Action: no action

Adding support for the generic irq entry/exit handling for PowerPC. The
goal is to bring PowerPC in line with other architectures that already
use the common irq entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths.

This is slightly tested of ppc64le and ppc32.

The performance benchmarks are below:

perf bench syscall usec/op (-ve is improvement)

| Syscall | Base        | test        | change % |
| ------- | ----------- | ----------- | -------- |
| basic   | 0.093543    | 0.093023    | -0.56    |
| execve  | 446.557781  | 450.107172  | +0.79    |
| fork    | 1142.204391 | 1156.377214 | +1.24    |
| getpgid | 0.097666    | 0.092677    | -5.11    |

perf bench syscall ops/sec (+ve is improvement)

| Syscall | Base     | New      | change % |
| ------- | -------- | -------- | -------- |
| basic   | 10690548 | 10750140 | +0.56    |
| execve  | 2239     | 2221     | -0.80    |
| fork    | 875      | 864      | -1.26    |
| getpgid | 10239026 | 10790324 | +5.38    |


IPI latency benchmark (-ve is improvement)

| Metric         | Base (ns)     | New (ns)      | % Change |
| -------------- | ------------- | ------------- | -------- |
| Dry run        | 583136.56     | 584136.35     | 0.17%    |
| Self IPI       | 4167393.42    | 4149093.90    | -0.44%   |
| Normal IPI     | 61769347.82   | 61753728.39   | -0.03%   |
| Broadcast IPI  | 2235584825.02 | 2227521401.45 | -0.36%   |
| Broadcast lock | 2164964433.31 | 2125658641.76 | -1.82%   |


Thats very close to performance earlier with arch specific handling.

Tests done:
 - Build and boot on ppc64le pseries.
 - Build and boot on ppc64le powernv8 powernv9 powernv10.
 - Build and boot on ppc32.
 - Performance benchmark done with perf syscall basic on pseries.

Changelog:
V3 -> V4
 - Fixed the issue in older gcc version where linker couldn't find
   mem functions
 - Merged IRQ enable and syscall enable into a single patch
 - Cleanup for unused functions done in separate patch.
 - Some other cosmetic changes
V3: https://lore.kernel.org/all/20251229045416.3193779-1-mkchauras@linux.ibm.com/

V2 -> V3
 - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
 - Some functions made __always_inline
 - pt_regs padding changed to match 16byte interrupt stack alignment
 - And some cosmetic changes from reviews from earlier patch
V2: https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com/

V1 -> V2
 - Fix an issue where context tracking was showing warnings for
   incorrect context
V1: https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.com/

RFC -> PATCH V1
 - Fix for ppc32 spitting out kuap lock warnings.
 - ppc64le powernv8 crash fix.
 - Review comments incorporated from previous RFC.
RFC https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/

Mukesh Kumar Chaurasiya (8):
  powerpc: rename arch_irq_disabled_regs
  powerpc: Prepare to build with generic entry/exit framework
  powerpc: introduce arch_enter_from_user_mode
  powerpc: Introduce syscall exit arch functions
  powerpc: add exit_flags field in pt_regs
  powerpc: Prepare for IRQ entry exit
  powerpc: Enable GENERIC_ENTRY feature
  powerpc: Remove unused functions

 arch/powerpc/Kconfig                    |   1 +
 arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
 arch/powerpc/include/asm/kasan.h        |  15 +-
 arch/powerpc/include/asm/ptrace.h       |   6 +-
 arch/powerpc/include/asm/signal.h       |   1 -
 arch/powerpc/include/asm/stacktrace.h   |   6 +
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
 arch/powerpc/kernel/interrupt.c         | 254 ++---------
 arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
 arch/powerpc/kernel/signal.c            |  25 +-
 arch/powerpc/kernel/syscall.c           | 119 +-----
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 18 files changed, 690 insertions(+), 828 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

-- 
2.52.0


