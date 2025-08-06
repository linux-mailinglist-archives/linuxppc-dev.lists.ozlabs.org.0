Return-Path: <linuxppc-dev+bounces-10688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45009B1C18F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 09:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxjC15NPzz30MY;
	Wed,  6 Aug 2025 17:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754466637;
	cv=none; b=EcWcT3H25QJR5b1dEZTVdOy9nQr6IG9/DhwxUt94re753utFOd0kQSsB0o8z/8CBrKOP1LQumFaPzT6Sw05yKd896J3FKcwL+UlNSkO0x7d1iPJfr85S1YQN2jCDsHdwanz/w3U8DwAO6k0faYeaVjzIRwqmQ2DSVfGcuw1Lj61sCiRLeXEXdxL7JD7N9PpPGKqyWDGukdZN0OXP/e1yv6myzaPbLvZXMsGtdAAOAkMb2LJjSsmhoN/rhGCUN3VxJj13dmloDNkBoVUOZMKCih71OqVf77ewfBnJmLZjhkUWnjsLZJkSyZIWpkdUBJEIUDF6IcVEiDSfjC7h5xcHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754466637; c=relaxed/relaxed;
	bh=q7WeqYxr9LyB2ITPrLEgQscewLi02wsbV0qE7/XDjzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcdJWL04B99GEsz4bIVwRVlO//oQB7djvFiM1BSj+4e569M1m0rszCoMZrd7aZnzt6UepLrruh0tiR6P4MUcUjyp/SowcJFKPERTMhVV43Gq3DkzB9YRlsAjESq/8q1VZYaExHuhdVeEs+rS0JDrJds9D+NZ0VfHGTeMEf98V2rY1Y43OZMtwFKLyGLLTxNOFrUbyKgkgAc7/ElINwEklKNPY80AmzP8AeC3q79wfQB6abVH8p/P6oBevExE+q/n4b5SjPKqCeFvHMw/g42JOSf0u+SS2Adz6jeXgZyoitOs5G/YJNFmOJFMTYmjjz9FUSfTWkPKTv+pfs/5v5ogsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 1800 seconds by postgrey-1.37 at boromir; Wed, 06 Aug 2025 17:50:36 AEST
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxjC05Ldqz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 17:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4bxh4d2QtTz9sRh;
	Wed,  6 Aug 2025 09:00:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EE6QsNR5sOkc; Wed,  6 Aug 2025 09:00:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4bxh4d1G7Tz9sRg;
	Wed,  6 Aug 2025 09:00:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 119908B765;
	Wed,  6 Aug 2025 09:00:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4moU8TC_Njvz; Wed,  6 Aug 2025 09:00:00 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0D438B763;
	Wed,  6 Aug 2025 08:59:59 +0200 (CEST)
Message-ID: <e8c39250-e9a0-4075-92b2-ffa2344a9212@csgroup.eu>
Date: Wed, 6 Aug 2025 08:59:59 +0200
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
Subject: Re: [bpf-next 1/6] bpf,powerpc: Introduce
 bpf_jit_emit_probe_mem_store() to emit store instructions
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
 eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, naveen@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com, iii@linux.ibm.com,
 shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
 <20250805062747.3479221-2-skb99@linux.ibm.com>
 <e65548d0-14aa-4b9c-8051-7c91c5dffd1f@csgroup.eu>
 <8cfa1cb2-57bf-4984-a64e-53c82440e87f@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <8cfa1cb2-57bf-4984-a64e-53c82440e87f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 13:59, Venkat Rao Bagalkote a écrit :
> 
> On 05/08/25 1:04 pm, Christophe Leroy wrote:
>>
>>
>> Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
>>> bpf_jit_emit_probe_mem_store() is introduced to emit instructions for
>>> storing memory values depending on the size (byte, halfword,
>>> word, doubleword).
>>
>> Build break with this patch
>>
>>   CC      arch/powerpc/net/bpf_jit_comp64.o
>> arch/powerpc/net/bpf_jit_comp64.c:395:12: error: 
>> 'bpf_jit_emit_probe_mem_store' defined but not used [-Werror=unused- 
>> function]
>>  static int bpf_jit_emit_probe_mem_store(struct codegen_context *ctx, 
>> u32 src_reg, s16 off,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:287: arch/powerpc/net/ 
>> bpf_jit_comp64.o] Error 1
>>
> I tried this on top of bpf-next, and for me build passed.

Build of _this_ patch (alone) passed ?

This patch defines a static function but doesn't use it, so the build 
must breaks because of that, unless you have set CONFIG_PPC_DISABLE_WERROR.

Following patch starts using this function so then the build doesn't 
break anymore. But until next patch is applied the build doesn't work. 
Both patches have to be squashed together in order to not break 
bisectability of the kernel.

Christophe

> 
> Note: I applied https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Flore.kernel.org%2Fbpf%2F20250717202935.29018-2- 
> puranjay%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0468473019834e07ef2b08ddd4179b9c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638899920058624267%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iZLg9NUWxtH3vO1STI8wRYLzwvhohd2KKTAGYDe3WnM%3D&reserved=0 before applying current patch.
> 
> gcc version 14.2.1 20250110
> 
> uname -r: 6.16.0-gf2844c7fdb07
> 
> bpf-next repo: https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fkernel.googlesource.com%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbpf%2Fbpf-next&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0468473019834e07ef2b08ddd4179b9c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638899920058644309%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=OrMauttrzPbaFYhzKdkH5l%2FltISc95MwitnUC7YLhJQ%3D&reserved=0
> 
> HEAD:
> 
> commit f3af62b6cee8af9f07012051874af2d2a451f0e5 (origin/master, origin/ 
> HEAD)
> Author: Tao Chen <chen.dylane@linux.dev>
> Date:   Wed Jul 23 22:44:42 2025 +0800
> 
>      bpftool: Add bash completion for token argument
> 
> 
> Build Success logs:
> 
>    TEST-OBJ [test_progs-cpuv4] xdp_vlan.test.o
>    TEST-OBJ [test_progs-cpuv4] xdpwall.test.o
>    TEST-OBJ [test_progs-cpuv4] xfrm_info.test.o
>    BINARY   bench
>    BINARY   test_maps
>    BINARY   test_progs
>    BINARY   test_progs-no_alu32
>    BINARY   test_progs-cpuv4
> 
> 
> Regards,
> 
> Venkat.
> 
>>
>>>
>>> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
>>> ---
>>>   arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>> bpf_jit_comp64.c
>>> index 025524378443..489de21fe3d6 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>> @@ -409,6 +409,36 @@ asm (
>>>   "        blr                ;"
>>>   );
>>>   +static int bpf_jit_emit_probe_mem_store(struct codegen_context 
>>> *ctx, u32 src_reg, s16 off,
>>> +                    u32 code, u32 *image)
>>> +{
>>> +    u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
>>> +    u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
>>> +
>>> +    switch (BPF_SIZE(code)) {
>>> +    case BPF_B:
>>> +        EMIT(PPC_RAW_STB(src_reg, tmp1_reg, off));
>>> +        break;
>>> +    case BPF_H:
>>> +        EMIT(PPC_RAW_STH(src_reg, tmp1_reg, off));
>>> +        break;
>>> +    case BPF_W:
>>> +        EMIT(PPC_RAW_STW(src_reg, tmp1_reg, off));
>>> +        break;
>>> +    case BPF_DW:
>>> +        if (off % 4) {
>>> +            EMIT(PPC_RAW_LI(tmp2_reg, off));
>>> +            EMIT(PPC_RAW_STDX(src_reg, tmp1_reg, tmp2_reg));
>>> +        } else {
>>> +            EMIT(PPC_RAW_STD(src_reg, tmp1_reg, off));
>>> +        }
>>> +        break;
>>> +    default:
>>> +        return -EINVAL;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>>   static int emit_atomic_ld_st(const struct bpf_insn insn, struct 
>>> codegen_context *ctx, u32 *image)
>>>   {
>>>       u32 code = insn.code;
>>


