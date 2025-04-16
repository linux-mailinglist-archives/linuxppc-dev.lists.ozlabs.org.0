Return-Path: <linuxppc-dev+bounces-7707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E41A90C3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 21:24:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd9vZ2VkLz2yrN;
	Thu, 17 Apr 2025 05:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744831482;
	cv=none; b=nFzWaF1oGK2qKge7rmLXDFDZ7iv8XrS2Y+qy2QBhm6rEYXlEQqOiA711bjxGuBXrPWtt82ur6xVlNsufm01p5HSUNfc66PJDH9QBtpzpQAz4gZnGirWN/b/1Bcb6mxo90FA0Ska+eg77EJQw8pDXmG0Ctgzfa9DZI6JUtD7tMHHEbTa3QqAnWLcAaROx9W4Br8jQYqa5beSaHV5go24UAkqbLJqNyj+O9J0WO7T+6sPo4SluXuAyQnMSZ2qHNWJBtI+kPEdyfRiOlruTjupAAGtalR2+rgB7/9HHLa3flUgLOIEvs2dOFEIuXWV5S+fuITrCoA4HTckdvjsKI9Fe5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744831482; c=relaxed/relaxed;
	bh=ESx9ZWYVOviol+gu5GvYE6oR3Czemj4YTpdoVBjfivQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+JmmD1xX70o2WFYXMON9nnyyj9p+lygn2i4xhi+HCrHCF70bEWdXeW9uK1ODJh11HZroYIESaWficofFoRHy3GwxV8yB3Y8WrC5Zbg6VdaVj8tq+yd4amWxgfb1cdMZ0++qsW+agMoU+4Li8s+iKrPJ77iwUZO9lP4slO2WurtT2ApcvDkXoFGC6ptNG7DVGUPnSlQolu2PQSQAOVUW4SOil+LwX97B/vDhAEBHH+Lvptgc3aK4CygVYIrb4WtEHeBw8/pgKoKTCwBYOuWsqPLgYtVSgpcTIiGasrY0nMxQkiMip14g426zesth+YsdRpR3Tg/4BA0VCfpNLR39jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqq+QE+1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tqq+QE+1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd9vX6xRTz2yS6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 05:24:40 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GJAPJG028081;
	Wed, 16 Apr 2025 19:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ESx9ZW
	YVOviol+gu5GvYE6oR3Czemj4YTpdoVBjfivQ=; b=tqq+QE+1bs1NNEGlMeSu3z
	io3UDLsM8JzWosI5jAPs9RmMYH6RWPpQaLCK/U6koMFhxX/VnyAPrI1CofeCwCpt
	N3fg5iNEA19wkR0MWEk7wIDePmGRxUiZDhONI1cxWGthRZP8LD9/a9DpgyD8laOl
	Q7Z4II0vHIS8ulJZwjeo5tm1r69TrC8ioR9po3UEEifdrQ8/NoZI5QQukwxEUjmm
	eHmoS4A0qaSDfKlqaEOHpx3Q9VN4iYyBvEEolZ2k0PlKbrZwg5kzsyyTUTi23O8B
	aD9mzlnQlsrwniMNxhEBk8Q1XJjQRBx7zN2SvK1OLnwDdTbKQBHFIqmsHR7vWlxA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ykt5hnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:24:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GJN91l017855;
	Wed, 16 Apr 2025 19:24:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ykt5hnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:24:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GIQxdf017204;
	Wed, 16 Apr 2025 19:24:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m1u6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:24:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GJO7tr36635100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 19:24:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B519920043;
	Wed, 16 Apr 2025 19:24:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0B4E20040;
	Wed, 16 Apr 2025 19:24:02 +0000 (GMT)
Received: from [9.43.31.13] (unknown [9.43.31.13])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 19:24:02 +0000 (GMT)
Message-ID: <796f0cc9-a506-48e4-8c0e-f16e5af74a59@linux.ibm.com>
Date: Thu, 17 Apr 2025 00:54:01 +0530
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
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
To: Viktor Malik <vmalik@redhat.com>, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
        "Naveen N. Rao" <naveen@kernel.org>, bpf@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Miroslav Benes <mbenes@suse.cz>,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
 <1aec4a9a-a30b-43fd-b303-7a351caeccb7@redhat.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <1aec4a9a-a30b-43fd-b303-7a351caeccb7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JJAZFXP6kaIp9kJeQ6dHn81nUA9Q_RDO
X-Proofpoint-ORIG-GUID: BNinUJpqI94Ol0cDOhk9_8_wuVqysaFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160155
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 07/04/25 2:12 pm, Viktor Malik wrote:
> On 3/31/25 15:19, Shung-Hsi Yu wrote:
>> Hi all,
>>
>> On ppc64le (v6.14, kernel config attached), I've observed that fentry
>> BPF programs stop being invoked after the target kernel function is live
>> patched. This occurs regardless of whether the BPF program was attached
>> before or after the live patch. I believe fentry/fprobe on ppc64le is
>> added with [1].
>>
>> Steps to reproduce on ppc64le:
>> - Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
>>    with fentry (kfunc is the older name bpftrace used for fentry, used
>>    here for max compatability)
>>
>>      bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'
>>
>> - Run `cat /proc/cmdline` and observe bpftrace output
>>
>> - Load samples/livepatch/livepatch-sample.ko
>>
>> - Run `cat /proc/cmdline` again. Observe "this has been live patched" in
>>    output, but no new bpftrace output.
>>
>> Note: once the live patching module is disabled through the sysfs interface
>> the BPF program invocation is restored.
>>
>> Is this the expected interaction between fentry BPF and live patching?
>> On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
>> unintended. Any insights appreciated.
> 
> I'm not sure if this is related but I found out that when a kernel is
> compiled with KASAN=y (full config attached), the above steps without
> the bpftrace part lead to a kernel panic upon running the second `cat
> /proc/cmdline` command (the livepatched one).
> 
> Here's the relevant part of the kdump:
> 
> [  457.405298] BUG: Unable to handle kernel data access on write at 0xc0000000000f9078
> [  457.405320] Faulting instruction address: 0xc0000000018ff958
> [  457.405328] Oops: Kernel access of bad area, sig: 11 [#1]
> [  457.405336] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
> [  457.405347] Modules linked in: livepatch_sample(K) bonding tls rfkill vmx_crypto ibmveth pseries_rng sg fuse loop nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vsock xfs sd_mod ibmvscsi scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod
> [  457.405410] CPU: 6 UID: 0 PID: 5141 Comm: cat Kdump: loaded Tainted: G              K     6.14.0+ #9 VOLUNTARY
> [  457.405424] Tainted: [K]=LIVEPATCH
> [  457.405430] Hardware name: IBM,9009-22A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW910.00 (VL910_062) hv:phyp pSeries
> [  457.405440] NIP:  c0000000018ff958 LR: c0000000018ff930 CTR: c0000000009c0790
> [  457.405449] REGS: c00000005f2e7790 TRAP: 0300   Tainted: G              K      (6.14.0+)
> [  457.405459] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2822880b  XER: 20040000
> [  457.405484] CFAR: c0000000008addc0 DAR: c0000000000f9078 DSISR: 0a000000 IRQMASK: 1
> GPR00: c0000000018f2584 c00000005f2e7a30 c00000000280a900 c000000017ffa488
> GPR04: 0000000000000008 0000000000000000 c0000000018f24fc 000000000000000d
> GPR08: fffffffffffe0000 000000000000000d 0000000000000000 0000000000008000
> GPR12: c0000000009c0790 c000000017ffa480 c00000005f2e7c78 c0000000000f9070
> GPR16: c00000005f2e7c90 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 c00000005f3efa80 c00000005f2e7c60 c00000005f2e7c88
> GPR24: c00000005f2e7c60 0000000000000001 c0000000000f9078 0000000000000000
> GPR28: 00007fff97960000 c000000017ffa480 0000000000000000 c0000000000f9078
> [  457.405605] NIP [c0000000018ff958] _raw_spin_lock_irqsave+0x68/0x110
> [  457.405619] LR [c0000000018ff930] _raw_spin_lock_irqsave+0x40/0x110
> [  457.405630] Call Trace:
> [  457.405635] [c00000005f2e7a30] [c000000000941804] check_heap_object+0x34/0x390 (unreliable)
> [  457.405651] [c00000005f2e7a70] [c0000000018f2584] __mutex_unlock_slowpath.isra.0+0xe4/0x230
> [  457.405665] [c00000005f2e7af0] [c0000000009c2f50] seq_read_iter+0x430/0xa90
> [  457.405679] [c00000005f2e7c00] [c000000000aade04] proc_reg_read_iter+0xa4/0x200
> [  457.405692] [c00000005f2e7c40] [c00000000095345c] vfs_read+0x41c/0x510
> [  457.405705] [c00000005f2e7d30] [c0000000009545d4] ksys_read+0xa4/0x190
> [  457.405716] [c00000005f2e7d90] [c00000000003a3f0] system_call_exception+0x1d0/0x440
> [  457.405729] [c00000005f2e7e50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec
> [  457.405744] --- interrupt: 3000 at 0x7fff97e75044
> [  457.405755] NIP:  00007fff97e75044 LR: 00007fff97e75044 CTR: 0000000000000000
> [  457.405764] REGS: c00000005f2e7e80 TRAP: 3000   Tainted: G              K      (6.14.0+)
> [  457.405773] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48222804  XER: 00000000
> [  457.405805] IRQMASK: 0
> GPR00: 0000000000000003 00007fffc1908930 00007fff97f87100 0000000000000003
> GPR04: 00007fff97960000 0000000000040000 0000000000000000 00007fff97f80248
> GPR08: 0000000000000002 0000000000000000 0000000000000000 0000000000000000
> GPR12: 0000000000000000 00007fff9805a5a0 0000000000000000 0000000000000000
> GPR16: 0000000000000000 0000000000040000 00007fffc19091c8 0000000000000000
> GPR20: 0000000000000000 0000000000000000 0000000000000000 00007fff9804f470
> GPR24: 0000000000000000 0000000000040000 00007fffc190f1c5 000000007ff00000
> GPR28: 0000000000000003 00007fff97960000 0000000000040000 0000000000000003
> [  457.405916] NIP [00007fff97e75044] 0x7fff97e75044
> [  457.405924] LR [00007fff97e75044] 0x7fff97e75044
> [  457.405932] --- interrupt: 3000
> [  457.405938] Code: 386d0008 4afae43d 60000000 a13d0008 3d00fffe 5529083c 61290001 7d40f829 7d474079 40c20018 7d474038 7ce74b78 <7ce0f92d> 40c2ffe8 7c2004ac 794a03e1
> [  457.405981] ---[ end trace 0000000000000000 ]---
> [  457.419259] pstore: backend (nvram) writing error (-1)
> 
> Interestingly, the panic doesn't occur when the bpftrace process is
> running. Then, running `cat /proc/cmdline` works (even prints the
> expected livepatched message) but doesn't appear in bpftrace output, as
> Shung-Hsi observed.
> 
> On a kernel with KASAN=n, no panic happens.
> 
> This panic doesn't seem to be related to BPF (as it happens when no BPF
> programs are involved) but it involves livepatch and occurs for the same
> sequence of commands, so the two cases may be related. In this case, I
> suspect that the issue is caused by an incorrect interaction of
> livepatch and the ftrace changes introduced for BPF trampolines [1].
> 
> FWIW, there is patch cfec8463d9a1 ("powerpc/ftrace: Fix ftrace bug with
> KASAN=y") which is fixing a bug in [1] appearing on KASAN=y kernel but
> I'm not sure if it's related to this issue.

Thanks for reporting this, Viktor.
There was a bug in how clobbered register was restored in livepatch path
leading this failure. Posted the fix patch upstream [1]

FWIW, the problem Shung-Hsi observed still exists. Will try and get that
working..

- Hari

[1] 
https://lore.kernel.org/linuxppc-dev/20250416191227.201146-1-hbathini@linux.ibm.com/

> 
> Viktor
> 
> [1] https://lore.kernel.org/all/20241030070850.1361304-1-hbathini@linux.ibm.com/
> 
>>
>>
>> Thanks,
>> Shung-Hsi Yu
>>
>> 1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/


