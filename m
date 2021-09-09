Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763924046ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 10:20:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4sQX0n17z2ypb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 18:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1349 seconds by postgrey-1.36 at boromir;
 Thu, 09 Sep 2021 18:20:25 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4sQ137cyz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 18:20:25 +1000 (AEST)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1mOEvf-0001T3-P1; Thu, 09 Sep 2021 09:57:03 +0200
Received: from [85.5.47.65] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1mOEvf-000H3n-3x; Thu, 09 Sep 2021 09:57:03 +0200
Subject: Re: [PATCH bpf-next] bpf: Change value of MAX_TAIL_CALL_CNT from 32
 to 33
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1631158350-3661-1-git-send-email-yangtiezhu@loongson.cn>
 <CAEf4BzZqoVZ7keWCLmC=A5oPPwj_xMNRWDkJUcjWn9yE_z1gSg@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <e9063116-617a-5916-bc6f-a1e917776bd7@iogearbox.net>
Date: Thu, 9 Sep 2021 09:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEf4BzZqoVZ7keWCLmC=A5oPPwj_xMNRWDkJUcjWn9yE_z1gSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.2/26288/Wed Sep  8 10:22:21 2021)
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
Cc: Song Liu <songliubraving@fb.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Shubham Bansal <illusionist.neo@gmail.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Paul Chaignon <paul@cilium.io>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 naveen.n.rao@linux.ibm.com, Yonghong Song <yhs@fb.com>,
 linux-mips@vger.kernel.org, Xi Wang <xi.wang@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Luke Nelson <luke.r.nels@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Networking <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/9/21 7:50 AM, Andrii Nakryiko wrote:
> On Wed, Sep 8, 2021 at 8:33 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> In the current code, the actual max tail call count is 33 which is greater
>> than MAX_TAIL_CALL_CNT (defined as 32), the actual limit is not consistent
>> with the meaning of MAX_TAIL_CALL_CNT, there is some confusion and need to
>> spend some time to think the reason at the first glance.
> 
> think *about* the reason
> 
>> We can see the historical evolution from commit 04fd61ab36ec ("bpf: allow
>> bpf programs to tail-call other bpf programs") and commit f9dabe016b63
>> ("bpf: Undo off-by-one in interpreter tail call count limit").
>>
>> In order to avoid changing existing behavior, the actual limit is 33 now,
>> this is resonable.
> 
> typo: reasonable
> 
>> After commit 874be05f525e ("bpf, tests: Add tail call test suite"), we can
>> see there exists failed testcase.
>>
>> On all archs when CONFIG_BPF_JIT_ALWAYS_ON is not set:
>>   # echo 0 > /proc/sys/net/core/bpf_jit_enable
>>   # modprobe test_bpf
>>   # dmesg | grep -w FAIL
>>   Tail call error path, max count reached jited:0 ret 34 != 33 FAIL
>>
>> On some archs:
>>   # echo 1 > /proc/sys/net/core/bpf_jit_enable
>>   # modprobe test_bpf
>>   # dmesg | grep -w FAIL
>>   Tail call error path, max count reached jited:1 ret 34 != 33 FAIL
>>
>> So it is necessary to change the value of MAX_TAIL_CALL_CNT from 32 to 33,
>> then do some small changes of the related code.
>>
>> With this patch, it does not change the current limit, MAX_TAIL_CALL_CNT
>> can reflect the actual max tail call count, and the above failed testcase
>> can be fixed.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
> 
> This change breaks selftests ([0]), please fix them at the same time
> as you are changing the kernel behavior:

The below selftests shouldn't have to change given there is no change in
behavior intended (MAX_TAIL_CALL_CNT is bumped to 33 but counter inc'ed
prior to the comparison). It just means that /all/ JITs must be changed
and in particular properly _tested_.

>    test_tailcall_2:PASS:tailcall 128 nsec
>    test_tailcall_2:PASS:tailcall 128 nsec
>    test_tailcall_2:FAIL:tailcall err 0 errno 2 retval 4
>    #135/2 tailcalls/tailcall_2:FAIL
>    test_tailcall_3:PASS:tailcall 128 nsec
>    test_tailcall_3:FAIL:tailcall count err 0 errno 2 count 34
>    test_tailcall_3:PASS:tailcall 128 nsec
>    #135/3 tailcalls/tailcall_3:FAIL
>    #135/4 tailcalls/tailcall_4:OK
>    #135/5 tailcalls/tailcall_5:OK
>    #135/6 tailcalls/tailcall_bpf2bpf_1:OK
>    test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
>    test_tailcall_bpf2bpf_2:FAIL:tailcall count err 0 errno 2 count 34
>    test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
>    #135/7 tailcalls/tailcall_bpf2bpf_2:FAIL
>    #135/8 tailcalls/tailcall_bpf2bpf_3:OK
>    test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
>    test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
>    #135/9 tailcalls/tailcall_bpf2bpf_4:FAIL
>    test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
>    test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
>    #135/10 tailcalls/tailcall_bpf2bpf_5:FAIL
>    #135 tailcalls:FAIL
> 
>    [0] https://github.com/kernel-patches/bpf/pull/1747/checks?check_run_id=3552002906
> 
>>   arch/arm/net/bpf_jit_32.c         | 11 ++++++-----
>>   arch/arm64/net/bpf_jit_comp.c     |  7 ++++---
>>   arch/mips/net/ebpf_jit.c          |  4 ++--
>>   arch/powerpc/net/bpf_jit_comp32.c |  4 ++--
>>   arch/powerpc/net/bpf_jit_comp64.c | 12 ++++++------
>>   arch/riscv/net/bpf_jit_comp32.c   |  4 ++--
>>   arch/riscv/net/bpf_jit_comp64.c   |  4 ++--
>>   arch/sparc/net/bpf_jit_comp_64.c  |  8 ++++----
>>   include/linux/bpf.h               |  2 +-
>>   kernel/bpf/core.c                 |  4 ++--
>>   10 files changed, 31 insertions(+), 29 deletions(-)
>>
> 
> [...]
> 

