Return-Path: <linuxppc-dev+bounces-15403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA522D010CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 06:17:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmtSr3LD4z2yG7;
	Thu, 08 Jan 2026 16:17:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767849452;
	cv=none; b=I0sho4LcUpvvavCr+BhikI+FxJ/2qnl9KqyIgNVSlhoG7RMmeXDjNvmAsAtikyUHR0RNoIfsbhzlduSXzb78ic1jaGJh8m0jJ2RV9puvIoHj4rsvBVvxaPWm5beb028Om43nevgiLqybHjwFnl8oZ/urMjR5SgYxMCsAphcSXfoOSeDj0Hk9CBsC/wHhZyZcXmS1lIAG/1i4coNUu/zHHFiTVXMXhORoTlYWHUDsiLUQLUkfWyxU1dGC9ihwznaiE60NUKV/HLIQ4I5FxsrGkw3jFIuefXTzfv+Z080cHmBE1P4jR6mvPIraeYA78WCq4w3RP+UwoGKh4QK8PapJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767849452; c=relaxed/relaxed;
	bh=QNMXWc8zZC88WCfCd3W4zfMLooI1smNxKTCmBHABSvM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XNnoVDiqPCdi8xMvzoy1oX4VFFaWNFWVjESwzIk1tVQbb2kqZ/2v+PTydN+m2gQ3bOclBqx7VTxG03Gcb6/uCl7cMB7g3L5z7PEuL211Ayf53WPSs0HS526NVrbYJBfR8xRSdfmVpN177RsK6PTUdi/eITjndqdKSC0w1bUubcDjYnhiH/HQsAsygLzQvhklZnEGyAwsVEEZaWPxlPuLfitRGk7CVhQg+dj9s3hRMysSR9IhLqO3vKGao9yBbDfcKaA5gPqxBv6X+4dOriQMlk0BfSylqrpe/n3BfZUwuS1TjfROByuxjxcDn00kzyAeKAGQPSJLn2Nx94R1qxrRRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bIvorRoV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bIvorRoV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmtSq4Wyrz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 16:17:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 607IaAGm022403;
	Thu, 8 Jan 2026 05:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QNMXWc
	8zZC88WCfCd3W4zfMLooI1smNxKTCmBHABSvM=; b=bIvorRoVKHBB2gIMJbMJlY
	Mg9Sx3cOIIqfvvWHoYNv3OYkt5l5rw8KiOO0e5jhOQLmiU3zxWO5QxqUjVyJt0IW
	M6t4/I0s4KjcnUcPh/5cpY/Mj3gAxxh2SUL7B/Eo6z/HBAsj6xkOFELYW6TmEmtD
	5ADCO87xfh7BZyEGHlFexFPQ3ZcYrC7qePpbeSL4xmlYr4iACulwWuMEWHsGVnAB
	/dQ5A7a7jJKxMNj6+NOrmhlbWdZsm6PuBUGysz93veLr+xWJz6g8bD+a3sSnbYFs
	a2UNO5qPTRm0kpZM1pfH3jhMKWj6tAK2QX+rAa9Gt9W7R5AuLVnxqzZU44MVJ2VA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrtu8tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 05:16:55 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60857JUm003932;
	Thu, 8 Jan 2026 05:16:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrtu8te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 05:16:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60857o9S015197;
	Thu, 8 Jan 2026 05:16:53 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfdesn9ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 05:16:53 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6085GqN125821776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Jan 2026 05:16:52 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 717A258056;
	Thu,  8 Jan 2026 05:16:52 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA82F58052;
	Thu,  8 Jan 2026 05:16:44 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.249.85])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Jan 2026 05:16:44 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
Date: Thu, 8 Jan 2026 10:46:31 +0530
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, chleroy@kernel.org,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        Peter Zijlstra <peterz@infradead.org>, namcao@linutronix.de,
        Thomas Gleixner <tglx@linutronix.de>,
        Kan Liang <kan.liang@linux.intel.com>, mark.barnett@arm.com,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BBCC728-0BF9-484A-85F9-2760DEFD56BD@linux.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=aaJsXBot c=1 sm=1 tr=0 ts=695f3dc7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=lTCwEwmScj06Li8tg0wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: a9JI1sSOURoSxXu05cUtI78IzWCSuUlb
X-Proofpoint-ORIG-GUID: 21VLi544cNKjIpxZg3nxo2OVABjpXr8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMSBTYWx0ZWRfX7VF6LSckk4Tk
 lT3bdCSnIQtWEavjQZa91abnI3sfSQ/v2efc390B7jKj1u8yseBb8N/eRQDjraXVCTYQMdqSjAd
 nL8NYAZ+huxUnAhY5o/gCi6CxvhTGAP/j4nJsJr7GE7a2GhIWGOlz8nHq8MLbKa7HBrrwrECKGg
 g/QDlgxRO8glDcqQ6XrTFngfIumGSMMMeUJafR+9Hs+Lgj2crV/fgS+3A0YKuRQ4f/o6COydqr1
 EV/3vM+K53EEQFPNhfNqkbnhVeB1AYD3+aR+Ps/KjcQB7eCteJ8cXsXNOtiQrt4czf0JSdVyEHD
 JkNIJeS2mhO25f/HdV4WHrppSucnstWaZpanG6WX/4UF/8Drfv1yOsU7IRP1G9aVBUQ1zhlCiKw
 pCDelCc3Xfp187tMYMADFXI5tE35zBA+Obysnmeg/dboVdTp4nndj5SV1TBwfBtFtSC4fKy1+hV
 /gdkY6P6piTLvrIX+Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601080031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With this patch set, build fails.

Failure logs:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `memset'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: init/main.o: in function `do_one_initcall':
/root/linux/init/main.c:1384: undefined reference to `memcpy'
ld: arch/powerpc/kernel/process.o: in function `arch_dup_task_struct':
/root/linux/arch/powerpc/kernel/process.c:1724: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/process.o: in function `copy_thread':
/root/linux/arch/powerpc/kernel/process.c:1812: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/signal.o: in function `do_signal':
/root/linux/arch/powerpc/kernel/signal.c:247: undefined reference to =
`memset'
ld: arch/powerpc/kernel/sysfs.o: in function `show_smt_snooze_delay':
/root/linux/arch/powerpc/kernel/sysfs.c:66: undefined reference to =
`memcpy'
ld: /root/linux/arch/powerpc/kernel/sysfs.c:66: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/time.o: in function =
`register_decrementer_clockevent':
/root/linux/arch/powerpc/kernel/time.c:834: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/time.o: in function =
`platform_device_register_resndata':
/root/linux/./include/linux/platform_device.h:160: undefined reference =
to `memset'
ld: arch/powerpc/kernel/ptrace/ptrace-noadv.o: in function =
`ptrace_set_debugreg':
/root/linux/arch/powerpc/kernel/ptrace/ptrace-noadv.c:130: undefined =
reference to `memcpy'
ld: arch/powerpc/kernel/paca.o: in function `init_lppaca':
/root/linux/arch/powerpc/kernel/paca.c:112: undefined reference to =
`memset'
ld: arch/powerpc/kernel/hw_breakpoint.o: in function `ptrace_triggered':
/root/linux/arch/powerpc/kernel/hw_breakpoint.c:607: undefined reference =
to `memcpy'
ld: arch/powerpc/kernel/mce.o: in function `get_mce_event':
/root/linux/arch/powerpc/kernel/mce.c:206: undefined reference to =
`memcpy'
ld: /root/linux/arch/powerpc/kernel/mce.c:206: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/mce_power.o: in function =
`mce_find_instr_ea_and_phys':
/root/linux/arch/powerpc/kernel/mce_power.c:461: undefined reference to =
`memcpy'
ld: arch/powerpc/kernel/security.o: in function `cpu_show_meltdown':
/root/linux/arch/powerpc/kernel/security.c:172: undefined reference to =
`memcpy'
ld: =
arch/powerpc/kernel/security.o:/root/linux/arch/powerpc/kernel/security.c:=
166: more undefined references to `memcpy' follow
ld: arch/powerpc/mm/mem.o: in function `execmem_arch_setup':
/root/linux/arch/powerpc/mm/mem.c:423: undefined reference to `memset'
ld: arch/powerpc/mm/book3s64/subpage_prot.o: in function =
`subpage_mark_vma_nohuge':
/root/linux/arch/powerpc/mm/book3s64/subpage_prot.c:155: undefined =
reference to `memset'
ld: arch/powerpc/mm/numa.o: in function `vphn_get_nid':
/root/linux/arch/powerpc/mm/numa.c:676: undefined reference to `memset'
ld: arch/powerpc/mm/numa.o: in function `find_and_update_cpu_nid':
/root/linux/arch/powerpc/mm/numa.c:1416: undefined reference to `memset'
ld: arch/powerpc/mm/numa.o: in function `cpu_to_coregroup_id':
/root/linux/arch/powerpc/mm/numa.c:1438: undefined reference to `memset'
ld: =
arch/powerpc/mm/ptdump/ptdump.o:/root/linux/arch/powerpc/mm/ptdump/ptdump.=
c:370: more undefined references to `memset' follow
ld: arch/powerpc/lib/mem_64.o: in function `__memmove':
/root/linux/arch/powerpc/lib/mem_64.S:103: undefined reference to =
`memcpy'
/root/linux/arch/powerpc/lib/mem_64.S:103:(.text+0x10c): call to =
`memcpy' lacks nop, can't restore toc; (plt call stub)
ld: final link failed: bad value
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[1]: *** [/root/linux/Makefile:1276: vmlinux] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:248: __sub-make] Error 2

Regards,
Venkat.

> On 29 Dec 2025, at 10:24=E2=80=AFAM, Mukesh Kumar Chaurasiya =
<mkchauras@linux.ibm.com> wrote:
>=20
> Adding support for the generic irq entry/exit handling for PowerPC. =
The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>=20
> This is slightly tested of ppc64le and ppc32.
>=20
> The performance benchmarks are below:
>=20
> perf bench syscall usec/op
>=20
> | Syscall | Base       | New        | change % |
> | ------- | ---------- | ---------- | -------- |
> | basic   | 0.173212   | 0.133294   | -23.05   |
> | execve  | 363.176190 | 357.148150 | -1.66    |
> | fork    | 853.657880 | 840.268800 | -1.57    |
> | getpgid | 0.174832   | 0.135372   | -22.57   |
>=20
> perf bench syscall ops/sec
>=20
> | Syscall | Base    | New     | change % |
> | ------- | ------- | ------- | -------- |
> | basic   | 6006021 | 7502236 | +24.91   |
> | execve  | 2753    | 2800    | +1.71    |
> | fork    | 1171    | 1190    | +1.62    |
> | getpgid | 5942117 | 7387040 | +24.32   |
>=20
> IPI latency benchmark
>=20
> | Metric         | Base (ns)     | Test (ns)     | change % |
> | -------------- | ------------- | ------------- | -------- |
> | Dry-run        | 206652.45     | 209317.37     | +1.29    |
> | Self-IPI       | 3567895.23    | 3590444.77    | +0.63    |
> | Normal IPI     | 148570416.17  | 148564173.40  | -0.00    |
> | Broadcast IPI  | 4033489673.38 | 4007319512.62 | -0.65    |
> | Broadcast lock | 4011023005.48 | 4010267885.93 | -0.02    |
>=20
>=20
> Thats very close to performance earlier with arch specific handling.
>=20
> Tests done:
> - Build and boot on ppc64le pseries.
> - Build and boot on ppc64le powernv8 powernv9 powernv10.
> - Build and boot on ppc32.
> - Performance benchmark done with perf syscall basic on pseries.
>=20
> Changelog:
>=20
> V2 -> V3
> - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
> - Some functions made __always_inline
> - pt_regs padding changed to match 16byte interrupt stack alignment
> - And some cosmetic changes from reviews from earlier patch
> V2: =
https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com=
/
>=20
> V1 -> V2
> - Fix an issue where context tracking was showing warnings for
>   incorrect context
> V1: =
https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.c=
om/
>=20
> RFC -> PATCH V1
> - Fix for ppc32 spitting out kuap lock warnings.
> - ppc64le powernv8 crash fix.
> - Review comments incorporated from previous RFC.
> RFC =
https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com=
/
>=20
> Mukesh Kumar Chaurasiya (8):
>  powerpc: rename arch_irq_disabled_regs
>  powerpc: Prepare to build with generic entry/exit framework
>  powerpc: introduce arch_enter_from_user_mode
>  powerpc: Introduce syscall exit arch functions
>  powerpc: add exit_flags field in pt_regs
>  powerpc: Prepare for IRQ entry exit
>  powerpc: Enable IRQ generic entry/exit path.
>  powerpc: Enable Generic Entry/Exit for syscalls.
>=20
> arch/powerpc/Kconfig                    |   2 +
> arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
> arch/powerpc/include/asm/hw_irq.h       |   4 +-
> arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
> arch/powerpc/include/asm/ptrace.h       |   6 +-
> arch/powerpc/include/asm/signal.h       |   1 -
> arch/powerpc/include/asm/stacktrace.h   |   6 +
> arch/powerpc/include/asm/syscall.h      |   5 +
> arch/powerpc/include/asm/thread_info.h  |   1 +
> arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
> arch/powerpc/kernel/interrupt.c         | 255 ++----------
> arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
> arch/powerpc/kernel/signal.c            |  25 +-
> arch/powerpc/kernel/syscall.c           | 119 +-----
> arch/powerpc/kernel/traps.c             |   2 +-
> arch/powerpc/kernel/watchdog.c          |   2 +-
> arch/powerpc/perf/core-book3s.c         |   2 +-
> 17 files changed, 681 insertions(+), 824 deletions(-)
> create mode 100644 arch/powerpc/include/asm/entry-common.h
>=20
> --=20
> 2.52.0
>=20


