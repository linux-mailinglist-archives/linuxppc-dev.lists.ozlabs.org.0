Return-Path: <linuxppc-dev+bounces-6927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F102AA5D5D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 07:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCKmt2xQ9z2yvs;
	Wed, 12 Mar 2025 17:03:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741759390;
	cv=none; b=VHuxZ7xvTgLXv3fzgez5Qx01krY9WqfZ5NSEqe7RP0zOjwvRNgRpzTCCJxvUDflHQ1JNKHOUzd3kHhkcVZGHdxlWkf5/PcSUYsdBheoW1ZUW59Na7Dj/kOt/prj+jBR5NbVdI599/XcU0AprtXBhVDQpSCynyu/1L6guZMPn5YqRnX03+2ggMbmnkFFSbeWTW2yy6NhL8Yw+qtA11x2IQxR8TE18RLT5z6B/uXaEoLS5W0/d0Sd+koHMRfgDFS6uWNd/r+QGAguDCiRQH8ZJuWv1L63fK/8943D3xrBXfP3hcPBbtVE4Btl99UT9cO30hmTPrFOFNDwA+8+gvm9y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741759390; c=relaxed/relaxed;
	bh=zHbvP9t3W6uEmOv1+pjYYUlhNuoOIAj0TkrNSUOEeuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MLY2/DeakFkedPkFSw1aKTGJCwY73wCyCJnmsogOQmlm3rrWJZHMahV7rEN0xtJZceiTjPhneC7y/S+IDkZJG9inNM+3KQUPDOahg8lS63y2k72jBxeTmreCCSFcXByqUx+AAXdlU2GWWC3D3mJU74HvaSG4KTTJlChSO4PPmav3mj7t2EJcShKJYlu8Unw9YWTskazJLnopf1OyLn4LxY6NmBSGqvjw80VpsxMVsfexqDI1Q/BLL5bhAgXfXKUP/u7kJfmlqIxArX7IF1ov1Sk4qeYKmBnp7BmVWfbBIzD7Hbifv6tV0z0mRKF7+YOaEipwe018aq3inUjQF6foyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UqgqLpuY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UqgqLpuY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCKms1MfLz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 17:03:08 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BKpXR0021831;
	Wed, 12 Mar 2025 06:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zHbvP9
	t3W6uEmOv1+pjYYUlhNuoOIAj0TkrNSUOEeuI=; b=UqgqLpuYT1gf6fnJji1rHG
	fMWUF5BCf5v1E0LuugGH54TjU8BTFhQ+6CqfbbzZXNkuPZzo9uwjG3GseVp4msQp
	1X/sHdOBc8a6/y0e38I3b24HjxnGaPtJvbImglmYaAqNxW4k0SAGRoMPYwhkR99h
	w8ZUPKFzzdmqoi5WSzRvJEYmDzNZRNqMxcwl2KFi0I44YDqHvHCnL5wIVw17rti0
	UUp3/AyUrZ+ZX60Gb5GwY0uQZJ/Y/umCVbiZmtn3xUpMhdgV/AIhUaBQlxVgByDj
	PIyaRvUNVVU69RqHduXfMXIUW+rtMAdBbSkrzpMxWdusVdKUQTZqvNvvxwv1TDpA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45avk49v27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 06:02:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52C2WiBV003148;
	Wed, 12 Mar 2025 06:02:59 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstjhrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 06:02:59 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52C62wbC26346110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 06:02:58 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EA1258043;
	Wed, 12 Mar 2025 06:02:58 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8666858055;
	Wed, 12 Mar 2025 06:02:56 +0000 (GMT)
Received: from [9.61.240.129] (unknown [9.61.240.129])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Mar 2025 06:02:56 +0000 (GMT)
Message-ID: <e2498b0f-cc3d-43da-8422-9ef237d16d43@linux.ibm.com>
Date: Wed, 12 Mar 2025 11:32:54 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PowerPC: Observing Kernel softlockup while running ftrace
 selftest
Content-Language: en-GB
To: Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <dc78f68f-baae-4758-8f6c-86bbbbef54c3@linux.ibm.com>
 <87fae526-178b-4231-bbe7-dfdd61ac183c@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <87fae526-178b-4231-bbe7-dfdd61ac183c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RnpinlwDVM2XRdLdUOShRlVs-hbBxn73
X-Proofpoint-GUID: RnpinlwDVM2XRdLdUOShRlVs-hbBxn73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503120039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 10/03/25 4:25 pm, Hari Bathini wrote:
> Venkat, can you confirm if the issue is reproducible
> disabling CONFIG_PPC_IRQ_SOFT_MASK_DEBUG  ?

Hari,

This issue is reproducible after diabling CONFIG_PPC_IRQ_SOFT_MASK_DEBUG.

# powerpc Debugging
#
CONFIG_PPC_DISABLE_WERROR=y
CONFIG_PRINT_STACK_DEPTH=64
# CONFIG_HCALL_STATS is not set
CONFIG_PPC_EMULATED_STATS=y
# CONFIG_CODE_PATCHING_SELFTEST is not set
CONFIG_JUMP_LABEL_FEATURE_CHECKS=y
# CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG is not set
CONFIG_FTR_FIXUP_SELFTEST=y
CONFIG_MSI_BITMAP_SELFTEST=y
# CONFIG_GUEST_STATE_BUFFER_TEST is not set
# CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is not set
CONFIG_PPC_RFI_SRR_DEBUG=y
CONFIG_XMON=y
# CONFIG_XMON_DEFAULT is not set
CONFIG_XMON_DISASSEMBLY=y
CONFIG_XMON_DEFAULT_RO_MODE=y
CONFIG_DEBUGGER=y
CONFIG_BOOTX_TEXT=y
# CONFIG_PPC_EARLY_DEBUG is not set
# end of powerpc Debugging

Regards,

Venkat.

>
>
> On 06/03/25 6:04 pm, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>
>> I am observing soft lock up's while running ftrace selftest on linux- 
>> next kernel.
>>
>> Kernel Version: next-20250305
>>
>> make run_tests
>> TAP version 13
>> 1..2
>> # timeout set to 0
>> # selftests: ftrace: poll
>> # Error: Polling file is not specified
>> not ok 1 selftests: ftrace: poll # exit=255
>> # timeout set to 0
>> # selftests: ftrace: ftracetest-ktap
>> # TAP version 13
>> # 1..155
>> # ok 1 Basic trace file check
>> # ok 2 Basic test for tracers
>> # ok 3 Basic trace clock test
>> # ok 4 Basic event tracing check
>> # ok 5 Test tracefs GID mount option
>> # ok 6 Change the ringbuffer size
>> # ok 7 Change the ringbuffer sub-buffer size
>> # ok 8 Snapshot and tracing_cpumask
>> # ok 9 Snapshot and tracing setting
>> # ok 10 Test file and directory ownership changes for eventfs
>> # ok 11 Basic tests on writing to trace_marker
>> # ok 12 trace_pipe and trace_marker
>> # not ok 13 Test ftrace direct functions against tracers # UNRESOLVED
>> # not ok 14 Test ftrace direct functions against kprobes # UNRESOLVED
>> # ok 15 Generic dynamic event - add/remove probes with BTF arguments 
>> # SKIP
>> # ok 16 Generic dynamic event - add/remove eprobe events
>> # ok 17 Generic dynamic event - Repeating add/remove fprobe events # 
>> SKIP
>> # ok 18 Generic dynamic event - add/remove fprobe events # SKIP
>> # ok 19 Generic dynamic event - add/remove kprobe events
>> # ok 20 Generic dynamic event - add/remove synthetic events
>> # ok 21 Generic dynamic event - add/remove tracepoint probe events on 
>> module # SKIP
>> # ok 22 Generic dynamic event - add/remove tracepoint probe events # 
>> SKIP
>> # ok 23 Generic dynamic event - add/remove/test uprobe events
>> # ok 24 Generic dynamic event - selective clear (compatibility)
>> # ok 25 Checking dynamic events limitations
>> # ok 26 Event probe event parser error log check
>> # ok 27 Fprobe event VFS type argument # SKIP
>> # ok 28 Function return probe entry argument access # SKIP
>> # ok 29 Fprobe event parser error log check # SKIP
>> # ok 30 Generic dynamic event - generic clear event
>> # ok 31 Generic dynamic event - check if duplicate events are caught
>> # ok 32 Tracepoint probe event parser error log check # SKIP
>> # ok 33 event tracing - enable/disable with event level files
>> # not ok 34 event tracing - enable/disable with module event # 
>> UNRESOLVED
>> # ok 35 event tracing - restricts events based on pid notrace filtering
>> # ok 36 event tracing - restricts events based on pid
>> # ok 37 event tracing - enable/disable with subsystem level files
>> # ok 38 event tracing - enable/disable with top level files
>> # not ok 39 Test trace_printk from module # UNRESOLVED
>> # ok 40 event filter function - test event filtering on functions
>> # ok 41 ftrace - function graph filters with stack tracer
>> # ok 42 ftrace - function graph filters
>> # ok 43 ftrace - function graph filters
>> # ok 44 ftrace - function profiler with function graph tracing
>> # ok 45 ftrace - function graph print function return value # SKIP
>> # ok 46 ftrace - function trace with cpumask
>> # ok 47 ftrace - test for function event triggers
>> # ok 48 ftrace - function glob filters
>> # ok 49 ftrace - function pid notrace filters
>> # ok 50 ftrace - function pid filters
>> # ok 51 ftrace - stacktrace filter command
>>
>>
>> Warnings:
>>
>>
>> [ 2668.008907] watchdog: BUG: soft lockup - CPU#0 stuck for 2265s! 
>> [swapper/0:0]
>> [ 2668.008954] Modules linked in: bonding(E) nft_fib_inet(E) 
>> nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) 
>> nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) 
>> nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) 
>> nf_defrag_ipv4(E) ip_set(E) rfkill(E) nf_tables(E) nfnetlink(E) 
>> mlx5_ib(E) ib_uverbs(E) ib_core(E) pseries_rng(E) vmx_crypto(E) 
>> dax_pmem(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) sr_mod(E) 
>> cdrom(E) sd_mod(E) sg(E) lpfc(E) nd_pmem(E) nvmet_fc(E) nd_btt(E) 
>> ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) nvmet(E) nvme_fc(E) 
>> mlx5_core(E) nvme_fabrics(E) papr_scm(E) mlxfw(E) nvme_core(E) 
>> libnvdimm(E) tls(E) psample(E) scsi_transport_fc(E) fuse(E)
>> [ 2668.010198] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Kdump: loaded 
>> Tainted: G        W   EL     6.14.0-rc5-next-20250305 #1
>> [ 2668.010242] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE, [L]=SOFTLOCKUP
>> [ 2668.010276] Hardware name: IBM,8375-42A POWER9 (architected) 
>> 0x4e0202 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
>> [ 2668.010316] NIP:  c000000000039f90 LR: c00000000007c1a4 CTR: 
>> c000000000039f44
>> [ 2668.010354] REGS: c000000002c9f538 TRAP: 0900   Tainted: G        
>> W EL      (6.14.0-rc5-next-20250305)
>> [ 2668.010392] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
>> 22002844  XER: 20040000
>> [ 2668.010639] CFAR: 0000000000000000 IRQMASK: 0
>> [ 2668.010639] GPR00: c00000000007c1a4 c000000002c9f510 
>> c000000001688100 c000000002c9f508
>> [ 2668.010639] GPR04: 8000000002823033 c000000002c61700 
>> c000000002c61700 0000000000000178
>> [ 2668.010639] GPR08: 0000000000000002 0000000000000049 
>> 0000000000000000 0000000000002000
>> [ 2668.010639] GPR12: c000000000328588 c000000003020000 
>> 0000000000000000 0000000000000000
>> [ 2668.010639] GPR16: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 2668.010639] GPR20: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 2668.010639] GPR24: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000003
>> [ 2668.010639] GPR28: 0000000000000002 0000000000000000 
>> fcffffffffffffff c000000002c9f760
>> [ 2668.011572] NIP [c000000000039f90] 
>> __replay_soft_interrupts+0x5c/0x22c
>> [ 2668.011628] LR [c00000000007c1a4] return_to_handler+0x0/0x40
>> [ 2668.011680] Call Trace:
>> [ 2668.011715] [c000000002c9f510] [c00000000003a018] 
>> __replay_soft_interrupts+0xe4/0x22c (unreliable)
>> [ 2668.011809] [c000000002c9f6c0] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (replay_soft_interrupts+0x28/0x40)
>> [ 2668.011918] [c000000002c9f6e0] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (interrupt_exit_kernel_prepare+0x20c/0x250)
>> [ 2668.012025] [c000000002c9f730] [c00000000000da68] 
>> interrupt_return_srr_kernel+0x8/0x18c
>> [ 2668.012098] --- interrupt: 700 at arch_local_irq_restore+0x90/0x280
>> [ 2668.012149] NIP:  c00000000003a1f0 LR: c00000000033b458 CTR: 
>> 00000000000008fb
>> [ 2668.012188] REGS: c000000002c9f760 TRAP: 0700   Tainted: G        
>> W EL      (6.14.0-rc5-next-20250305)
>> [ 2668.012224] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE> 
>> CR: 28002844  XER: 20040000
>> [ 2668.012509] CFAR: c00000000033b454 IRQMASK: 0
>> [ 2668.012509] GPR00: c00000000033b458 c000000002c9fa00 
>> c000000001688100 0000000000000000
>> [ 2668.012509] GPR04: 000000000000001c 0000000000000000 
>> 0000000000000018 c0000000c89ff980
>> [ 2668.012509] GPR08: c0000000c89ff980 0000000000000000 
>> c0000000c89ff980 0000000028002844
>> [ 2668.012509] GPR12: c000000000325fd0 c000000003020000 
>> c0000000000ffde8 0000000000000000
>> [ 2668.012509] GPR16: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 2668.012509] GPR20: 0000000000c00000 0000000000000008 
>> 0000000000000000 0000000000000000
>> [ 2668.012509] GPR24: 0000000000000000 c000000000000000 
>> fffffffffffffeff c000000004070500
>> [ 2668.012509] GPR28: 0000000000000002 0000000000000003 
>> 00000000913f411d fcffffffffffffff
>> [ 2668.013441] NIP [c00000000003a1f0] arch_local_irq_restore+0x90/0x280
>> [ 2668.013492] LR [c00000000033b458] rb_commit+0xc8/0x280
>> [ 2668.013541] --- interrupt: 700
>> [ 2668.013575] [c000000002c9fa00] [0000000000000000] 0x0 (unreliable)
>> [ 2668.013667] [c000000002c9fa40] [c00000000033b458] 
>> rb_commit+0xc8/0x280
>> [ 2668.013738] [c000000002c9fa70] [c00000000033e6a4] 
>> ring_buffer_unlock_commit+0x38/0x1b0
>> [ 2668.013807] [c000000002c9fab0] [c00000000034d53c] 
>> trace_function+0xcc/0x19c
>> [ 2668.013877] [c000000002c9fb00] [c00000000035ec14] 
>> function_trace_call+0x154/0x1d4
>> [ 2668.013951] [c000000002c9fb50] [c000000000329f88] 
>> arch_ftrace_ops_list_func+0x15c/0x290
>> [ 2668.014021] [c000000002c9fc20] [c00000000007c0cc] 
>> ftrace_call+0x4/0x4c
>> [ 2668.014092] [c000000002c9fdd0] [c0000000000ffde8] 
>> pseries_lpar_idle.part.0+0x10/0x164
>> [ 2668.014163] [c000000002c9fdf0] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (arch_cpu_idle+0x50/0x120)
>> [ 2668.014269] [c000000002c9fe10] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (default_idle_call+0x50/0x10c)
>> [ 2668.014375] [c000000002c9fe30] [c0000000001f52bc] 
>> cpuidle_idle_call+0x1b8/0x240
>> [ 2668.014447] [c000000002c9fe90] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (do_idle+0x100/0x1ac)
>> [ 2668.014554] [c000000002c9fee0] [c00000000007c1a4] 
>> return_to_handler+0x0/0x40 (cpu_startup_entry+0x4c/0x50)
>> [ 2668.014661] [c000000002c9ff10] [c000000000011280] rest_init+0xf0/0xf4
>> [ 2668.014732] [c000000002c9ff40] [c000000002006604] 
>> start_kernel+0x50c/0x5e0
>> [ 2668.014806] [c000000002c9ffe0] [c00000000000ea9c] 
>> start_here_common+0x1c/0x20
>> [ 2668.014878] Code: 71298000 408201ec 892d0933 7d2a48f8 554a07fe 
>> 0b0a0000 792ad7e2 0b0a0000 61290040 38610028 992d0933 48042259 
>> <60000000> 39200000 e9410130 f9210160
>>
>>
>> If you fix this issue please add below tag.
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.
>>
>>
>

