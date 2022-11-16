Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18962C5B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8WQ2xSHz2xfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kiYp3xwy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kiYp3xwy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8VR0Mssz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:02:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGGL9gU015146;
	Wed, 16 Nov 2022 17:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fQAfOjNVmcMyguMJVu/TApN/7EJ15ITKLt/w10bxxwE=;
 b=kiYp3xwyL52dXmUQs/LZrRnd2X5qCd9G7jT6/8T/E0QreGh1DcuKP2MAwEI5oanLYbNb
 um4EhUiuurU9hkKzD6QOl80JGVS1O5ctpTvELoBN/DMevkns4nEFZMH8GV/qTqZ/QmOv
 fLuSBqCBWcMbWnHLgOC44NAQNqa9IdzELtwwTgW+Klr8QOosQ2t+Bn+0rbKLmkyKbEYY
 DYsfHf8JRiq0CBIoFeEKr6FiU1UDSMpZbzvMX76R5qhvhWL1AOzZMVcRsJeImavVFvi+
 /EfFmhdxklVoOIi+hEj2bv6ymn1eOkZUoMocNmitPpGvI4CTwkEUajvnSWchq/Ue3r0o 0A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw3a4h4xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 17:01:57 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGGoR0w020163;
	Wed, 16 Nov 2022 17:01:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rje9sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 17:01:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGGto3e37617956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 16:55:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B5D9A4059;
	Wed, 16 Nov 2022 17:01:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA667A4053;
	Wed, 16 Nov 2022 17:01:46 +0000 (GMT)
Received: from [9.163.79.108] (unknown [9.163.79.108])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 17:01:46 +0000 (GMT)
Message-ID: <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
Date: Wed, 16 Nov 2022 22:31:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
 <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu>
 <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f8CGcN0yt-cQKHdvTthmV1RKEUAt5AOe
X-Proofpoint-GUID: f8CGcN0yt-cQKHdvTthmV1RKEUAt5AOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160119
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/11/22 12:14 am, Christophe Leroy wrote:
> 
> 
> Le 14/11/2022 à 18:27, Christophe Leroy a écrit :
>>
>>
>> Le 14/11/2022 à 15:47, Hari Bathini a écrit :
>>> Hi Christophe,
>>>
>>> On 11/11/22 4:55 pm, Christophe Leroy wrote:
>>>> Le 10/11/2022 à 19:43, Hari Bathini a écrit :
>>>>> Most BPF programs are small, but they consume a page each. For systems
>>>>> with busy traffic and many BPF programs, this may also add significant
>>>>> pressure on instruction TLB. High iTLB pressure usually slows down the
>>>>> whole system causing visible performance degradation for production
>>>>> workloads.
>>>>>
>>>>> bpf_prog_pack, a customized allocator that packs multiple bpf programs
>>>>> into preallocated memory chunks, was proposed [1] to address it. This
>>>>> series extends this support on powerpc.
>>>>>
>>>>> Patches 1 & 2 add the arch specific functions needed to support this
>>>>> feature. Patch 3 enables the support for powerpc. The last patch
>>>>> ensures cleanup is handled racefully.
>>>>>
>>>
>>>>> Tested the changes successfully on a PowerVM. patch_instruction(),
>>>>> needed for bpf_arch_text_copy(), is failing for ppc32. Debugging it.
>>>>> Posting the patches in the meanwhile for feedback on these changes.
>>>>
>>>> I did a quick test on ppc32, I don't get such a problem, only something
>>>> wrong in the dump print as traps intructions only are dumped, but
>>>> tcpdump works as expected:
>>>
>>> Thanks for the quick test. Could you please share the config you used.
>>> I am probably missing a few knobs in my conifg...
>>>
>>
> 
> I also managed to test it on QEMU. The config is based on pmac32_defconfig.

I had the same config but hit this problem:

	# echo 1 > /proc/sys/net/core/bpf_jit_enable; modprobe test_bpf
	test_bpf: #0 TAX
	------------[ cut here ]------------
	WARNING: CPU: 0 PID: 96 at arch/powerpc/net/bpf_jit_comp.c:367 
bpf_int_jit_compile+0x8a0/0x9f8
	Modules linked in: test_bpf(+)
	CPU: 0 PID: 96 Comm: modprobe Not tainted 6.1.0-rc5+ #116
	Hardware name: PowerMac3,1 750CL 0x87210 PowerMac
	NIP:  c0038224 LR: c0037f74 CTR: 00000009
	REGS: f1b41b10 TRAP: 0700   Not tainted  (6.1.0-rc5+)
	MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 82004882  XER: 20000000

	GPR00: c0037f74 f1b41bd0 c12333c0 ffffffea c19747e0 c0123a08 c1974a00 
c12333c0
	GPR08: 00000000 00000b58 00009032 00000003 82004882 100d816a f2660000 
00000000
	GPR16: 00000000 c0c10000 00000000 c0c10000 c1913780 00000000 0000001a 
100a2ee3
	GPR24: 0000014c be857000 be857020 f1b41c00 c194c180 f1b46000 ffffffea 
f1b46000
	NIP [c0038224] bpf_int_jit_compile+0x8a0/0x9f8
	LR [c0037f74] bpf_int_jit_compile+0x5f0/0x9f8
	Call Trace:
	[f1b41bd0] [c0037f74] bpf_int_jit_compile+0x5f0/0x9f8 (unreliable)
	[f1b41ca0] [c0123790] bpf_prog_select_runtime+0x178/0x1c4
	[f1b41cd0] [c06cc4b0] bpf_prepare_filter+0x524/0x624
	[f1b41d20] [c06cc63c] bpf_prog_create+0x8c/0xd0
	[f1b41d40] [be85083c] test_bpf_init+0x46c/0x11b0 [test_bpf]
	[f1b41df0] [c0008534] do_one_initcall+0x58/0x1b8
	[f1b41e60] [c00b6c38] do_init_module+0x54/0x1e4
	[f1b41e80] [c00b8f80] sys_init_module+0x10c/0x174
	[f1b41f10] [c0014390] system_call_exception+0x94/0x144
	[f1b41f30] [c001a1ac] ret_from_syscall+0x0/0x2c
	--- interrupt: c00 at 0xfef48ac
	NIP:  0fef48ac LR: 10015de0 CTR: 00000000
	REGS: f1b41f40 TRAP: 0c00   Not tainted  (6.1.0-rc5+)
	MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 88002224  XER: 20000000

	GPR00: 00000080 aff34990 a7a8d380 a75c0010 00477e90 1051b9a0 0fedfdd8 
0000d032
	GPR08: 00000000 00000008 00478ffa 400f26fa 400f23c7 100d816a 00000000 
00000000
	GPR16: 00000000 1051b950 00000000 1051b92c 100d0000 100a2eab 100a2e97 
100a2ee3
	GPR24: 100a2ed5 1051b980 00000001 100d01a8 1051b920 a75c0010 1051b9a0 
a7a86388
	NIP [0fef48ac] 0xfef48ac
	LR [10015de0] 0x10015de0
	--- interrupt: c00
	Instruction dump:
	8081001c 38a00004 7f23cb78 4bfff5d1 7f23cb78 8081001c 480eba85 82410098
	8261009c 82a100a4 82e100ac 4bfffce8 <0fe00000> 92010090 92410098 92e100ac
	---[ end trace 0000000000000000 ]---
	jited:1
	kernel tried to execute exec-protected page (be857020) - exploit 
attempt? (uid: 0)
	BUG: Unable to handle kernel instruction fetch
	Faulting instruction address: 0xbe857020
	Vector: 400 (Instruction Access) at [f1b41c30]
	    pc: be857020
	    lr: be84eaa4: __run_one+0xec/0x248 [test_bpf]
	    sp: f1b41cf0
	   msr: 40009032
	  current = 0xc12333c0
	    pid   = 96, comm = modprobe
	Linux version 6.1.0-rc5+ (root@hbathini-Standard-PC-Q35-ICH9-2009) 
(powerpc-linux-gnu-gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld 
(GNU Binutils for Ubuntu) 2.38) #116 Wed Nov 16 20:48:10 IST 2022
	enter ? for help
	[link register   ] be84eaa4 __run_one+0xec/0x248 [test_bpf]
	[f1b41cf0] be84e9dc __run_one+0x24/0x248 [test_bpf] (unreliable)
	[f1b41d40] be850c78 test_bpf_init+0x8a8/0x11b0 [test_bpf]
	[f1b41df0] c0008534 do_one_initcall+0x58/0x1b8
	[f1b41e60] c00b6c38 do_init_module+0x54/0x1e4
	[f1b41e80] c00b8f80 sys_init_module+0x10c/0x174
	[f1b41f10] c0014390 system_call_exception+0x94/0x144
	[f1b41f30] c001a1ac ret_from_syscall+0x0/0x2c
	--- Exception: c00 (System Call) at 0fef48ac
	SP (aff34990) is in userspace
	mon>

bpf_jit_binary_pack_finalize() function failed due to patch_instruction() ..
Also, I am hitting the same problem with the other config too..

Thanks
Hari
