Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D166E2F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 17:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxDB91B52z3cfm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62; helo=www62.your-server.de; envelope-from=daniel@iogearbox.net; receiver=<UNKNOWN>)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxD9b2Dtvz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 02:59:45 +1100 (AEDT)
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1pHoN1-0007ZP-51; Tue, 17 Jan 2023 16:59:31 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1pHoN0-0009Hp-CC; Tue, 17 Jan 2023 16:59:30 +0100
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Tonghao Zhang <tong@infragraf.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
Date: Tue, 17 Jan 2023 16:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.7/26784/Tue Jan 17 09:29:12 2023)
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
Cc: KP Singh <kpsingh@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Alexei Starovoitov <ast@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hao Luo <haoluo@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/17/23 3:22 PM, Tonghao Zhang wrote:
> 
> 
>> On Jan 17, 2023, at 3:30 PM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 17/01/2023 à 06:30, Tonghao Zhang a écrit :
>>>
>>>
>>>> On Jan 9, 2023, at 4:15 PM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>>
>>>>
>>>> Le 06/01/2023 à 16:37, Daniel Borkmann a écrit :
>>>>> On 1/5/23 6:53 PM, Christophe Leroy wrote:
>>>>>> Le 05/01/2023 à 04:06, tong@infragraf.org a écrit :
>>>>>>> From: Tonghao Zhang <tong@infragraf.org>
>>>>>>>
>>>>>>> The x86_64 can't dump the valid insn in this way. A test BPF prog
>>>>>>> which include subprog:
>>>>>>>
>>>>>>> $ llvm-objdump -d subprog.o
>>>>>>> Disassembly of section .text:
>>>>>>> 0000000000000000 <subprog>:
>>>>>>>           0:       18 01 00 00 73 75 62 70 00 00 00 00 72 6f 67 00 r1
>>>>>>> = 29114459903653235 ll
>>>>>>>           2:       7b 1a f8 ff 00 00 00 00 *(u64 *)(r10 - 8) = r1
>>>>>>>           3:       bf a1 00 00 00 00 00 00 r1 = r10
>>>>>>>           4:       07 01 00 00 f8 ff ff ff r1 += -8
>>>>>>>           5:       b7 02 00 00 08 00 00 00 r2 = 8
>>>>>>>           6:       85 00 00 00 06 00 00 00 call 6
>>>>>>>           7:       95 00 00 00 00 00 00 00 exit
>>>>>>> Disassembly of section raw_tp/sys_enter:
>>>>>>> 0000000000000000 <entry>:
>>>>>>>           0:       85 10 00 00 ff ff ff ff call -1
>>>>>>>           1:       b7 00 00 00 00 00 00 00 r0 = 0
>>>>>>>           2:       95 00 00 00 00 00 00 00 exit
>>>>>>>
>>>>>>> kernel print message:
>>>>>>> [  580.775387] flen=8 proglen=51 pass=3 image=ffffffffa000c20c
>>>>>>> from=kprobe-load pid=1643
>>>>>>> [  580.777236] JIT code: 00000000: cc cc cc cc cc cc cc cc cc cc cc
>>>>>>> cc cc cc cc cc
>>>>>>> [  580.779037] JIT code: 00000010: cc cc cc cc cc cc cc cc cc cc cc
>>>>>>> cc cc cc cc cc
>>>>>>> [  580.780767] JIT code: 00000020: cc cc cc cc cc cc cc cc cc cc cc
>>>>>>> cc cc cc cc cc
>>>>>>> [  580.782568] JIT code: 00000030: cc cc cc
>>>>>>>
>>>>>>> $ bpf_jit_disasm
>>>>>>> 51 bytes emitted from JIT compiler (pass:3, flen:8)
>>>>>>> ffffffffa000c20c + <x>:
>>>>>>>       0:   int3
>>>>>>>       1:   int3
>>>>>>>       2:   int3
>>>>>>>       3:   int3
>>>>>>>       4:   int3
>>>>>>>       5:   int3
>>>>>>>       ...
>>>>>>>
>>>>>>> Until bpf_jit_binary_pack_finalize is invoked, we copy rw_header to
>>>>>>> header
>>>>>>> and then image/insn is valid. BTW, we can use the "bpftool prog dump"
>>>>>>> JITed instructions.
>>>>>>
>>>>>> NACK.
>>>>>>
>>>>>> Because the feature is buggy on x86_64, you remove it for all
>>>>>> architectures ?
>>>>>>
>>>>>> On powerpc bpf_jit_enable == 2 works and is very usefull.
>>>>>>
>>>>>> Last time I tried to use bpftool on powerpc/32 it didn't work. I don't
>>>>>> remember the details, I think it was an issue with endianess. Maybe it
>>>>>> is fixed now, but it needs to be verified.
>>>>>>
>>>>>> So please, before removing a working and usefull feature, make sure
>>>>>> there is an alternative available to it for all architectures in all
>>>>>> configurations.
>>>>>>
>>>>>> Also, I don't think bpftool is usable to dump kernel BPF selftests.
>>>>>> That's vital when a selftest fails if you want to have a chance to
>>>>>> understand why it fails.
>>>>>
>>>>> If this is actively used by JIT developers and considered useful, I'd be
>>>>> ok to leave it for the time being. Overall goal is to reach feature parity
>>>>> among (at least major arch) JITs and not just have most functionality only
>>>>> available on x86-64 JIT. Could you however check what is not working with
>>>>> bpftool on powerpc/32? Perhaps it's not too much effort to just fix it,
>>>>> but details would be useful otherwise 'it didn't work' is too fuzzy.
>>>>
>>>> Sure I will try to test bpftool again in the coming days.
>>>>
>>>> Previous discussion about that subject is here:
>>>> https://patchwork.kernel.org/project/linux-riscv/patch/20210415093250.3391257-1-Jianlin.Lv@arm.com/#24176847=
>>> Hi Christophe
>>> Any progress? We discuss to deprecate the bpf_jit_enable == 2 in 2021, but bpftool can not run on powerpc.
>>> Now can we fix this issue?
>>
>> Hi Tong,
>>
>> I have started to look at it but I don't have any fruitfull feedback yet.
>>
>> In the meantime, were you able to confirm that bpftool can also be used
>> to dump jitted tests from test_bpf.ko module on x86_64 ? In that can you
>> tell me how to proceed ?
> Now I do not test, but we can dump the insn after bpf_prog_select_runtime in test_bpf.ko. bpf_map_get_info_by_fd can copy the insn to userspace, but we can
> dump them in test_bpf.ko in the same way.

Issue is that these progs are not consumable from userspace (and therefore not bpftool).
it's just simple bpf_prog_alloc + copy of test insns + bpf_prog_select_runtime() to test
JITs (see generate_filter()). Some of them could be converted over to test_verifier, but
not all might actually pass verifier, iirc. Don't think it's a good idea to allow exposing
them via fd tbh.
