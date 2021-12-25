Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C189D47F30B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 12:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLh114bvtz3blF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 22:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LQLYQvPR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LQLYQvPR; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLh0K179pz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 22:04:46 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id 205so9643208pfu.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=gUtCyLQsycQFtRbUQo6GBEUij99uMbOT++CaP/ehmsE=;
 b=LQLYQvPR3FxgN7WrRRrlthrOLisN0lxn55B20rVaL16EDMyE9jyvvIBJeSi27OS6Ty
 yt7cWwzp4Hn2RqHkkCtd4k6HqozcanrPegubnIK8SRsWswBz65wjq9C4CPShmfhdFbSb
 gZ4GL0XKRRPux7CWSRPD82fRnis/UxHkIISdbIfdF+hbwvKy0sMmCcmQufJgD4uuUrIe
 0EVympRZ8LMP7oaWGQjFSNeBpjIOcXvgmBHUH6kOpnLO80qEI8Z0WknCxqoNISh3CqKp
 Ts+jYMFStkrNlMB5rdsgyqPy2+tKBEbbVgFoyUz4aQXKQOtEJWRW1gYDytv5rZA4zETl
 ZmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gUtCyLQsycQFtRbUQo6GBEUij99uMbOT++CaP/ehmsE=;
 b=czk3jVkPCllY4sc4HLtnhdcrdoe7nUrTk2+IF3x1q+3DUrdF//SynRS/e2ZZt3zuHW
 i5Yk1Gt01iUWiNoPyabgW4MfkbAWH8BTAWqLM3yJn3oAsZH7MPlCtb1qQElknyAVuXin
 mhbP6OmEQNvaQEH7KQuxmEYfdOfMp7IWNLH3j1lIEuToiGPTs1Jan06T7oWZuSxQV81l
 VrClkcJFmP/7mFuakOVzN1VwGOEbvxZEM1S2DmxOUCvVlm54j+XSS7wpXOHy/VVBcW+N
 qXno8zp/h+5ntKPbE8ZxCi6j1gqRCpUwSmIxVBgjILdOd1xZLVEUWDNQ9uBJxJRcJRnC
 saJQ==
X-Gm-Message-State: AOAM530mVWm9JXBM4vvg6DkUAsMDyhc63XWDJYOwOcjquJ5ZxHIcn68y
 3leDrw2mHd1IWeE+QMe6lVs=
X-Google-Smtp-Source: ABdhPJylUCKnuUHRcWemOFkwIPlwxs6vDbXGNhqq378aNwWiTTImv/OjbXn4ax2cLlMrLgSLVArO4w==
X-Received: by 2002:a63:5558:: with SMTP id f24mr8936141pgm.484.1640430283958; 
 Sat, 25 Dec 2021 03:04:43 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id w2sm9720928pgt.93.2021.12.25.03.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 03:04:43 -0800 (PST)
Date: Sat, 25 Dec 2021 21:04:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] Revert "mm/usercopy: Drop extra is_vmalloc_or_module()
 check"
To: =?iso-8859-1?q?Andrew=0A?= Morton <akpm@linux-foundation.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Kees Cook <keescook@chromium.org>,
 Laura Abbott <labbott@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland
 <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20211223102126.161848-1-wangkefeng.wang@huawei.com>
 <ffd77bcf-b9d8-956c-9f83-14b9f0b496e7@csgroup.eu>
 <96fe1826-aeaf-4ea0-9f01-03d6b3933b34@huawei.com>
 <6e2ddc83-bec3-fdd4-4d91-3ade0de0b7c8@csgroup.eu>
 <ccf311bd-c0ed-3e42-8057-849a9c3e9a98@huawei.com>
In-Reply-To: <ccf311bd-c0ed-3e42-8057-849a9c3e9a98@huawei.com>
MIME-Version: 1.0
Message-Id: <1640429980.38ev9qg7xc.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Kefeng Wang's message of December 25, 2021 12:05 pm:
>=20
> On 2021/12/24 21:18, Christophe Leroy wrote:
>>
>> Le 24/12/2021 =C3=A0 08:06, Kefeng Wang a =C3=A9crit=C2=A0:
>>> On 2021/12/24 14:01, Christophe Leroy wrote:
>>>> Le 23/12/2021 =C3=A0 11:21, Kefeng Wang a =C3=A9crit=C2=A0:
>>>>> This reverts commit 517e1fbeb65f5eade8d14f46ac365db6c75aea9b.
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 usercopy: Kernel memory exposure attempt detected=
 from SLUB
>>>>> object not in SLUB page?! (offset 0, size 1048)!
>>>>>  =C2=A0=C2=A0=C2=A0 kernel BUG at mm/usercopy.c:99
>>>>>  =C2=A0=C2=A0=C2=A0 ...
>>>>>  =C2=A0=C2=A0=C2=A0 usercopy_abort+0x64/0xa0 (unreliable)
>>>>>  =C2=A0=C2=A0=C2=A0 __check_heap_object+0x168/0x190
>>>>>  =C2=A0=C2=A0=C2=A0 __check_object_size+0x1a0/0x200
>>>>>  =C2=A0=C2=A0=C2=A0 dev_ethtool+0x2494/0x2b20
>>>>>  =C2=A0=C2=A0=C2=A0 dev_ioctl+0x5d0/0x770
>>>>>  =C2=A0=C2=A0=C2=A0 sock_do_ioctl+0xf0/0x1d0
>>>>>  =C2=A0=C2=A0=C2=A0 sock_ioctl+0x3ec/0x5a0
>>>>>  =C2=A0=C2=A0=C2=A0 __se_sys_ioctl+0xf0/0x160
>>>>>  =C2=A0=C2=A0=C2=A0 system_call_exception+0xfc/0x1f0
>>>>>  =C2=A0=C2=A0=C2=A0 system_call_common+0xf8/0x200
>>>>>
>>>>> When run ethtool eth0, the BUG occurred, the code shows below,
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 data =3D vzalloc(array_size(gstrings.len, ETH_GST=
RING_LEN));
>>>>>  =C2=A0=C2=A0=C2=A0 copy_to_user(useraddr, data, gstrings.len * ETH_G=
STRING_LEN))
>>>>>
>>>>> The data is alloced by vmalloc(),=C2=A0 virt_addr_valid(ptr) will ret=
urn true
>>>>> on PowerPC64, which leads to the panic, add back the
>>>>> is_vmalloc_or_module()
>>>>> check to fix it.
>>>> Is it expected that virt_addr_valid() returns true on PPC64 for
>>>> vmalloc'ed memory ? If that's the case it also means that
>>>> CONFIG_DEBUG_VIRTUAL won't work as expected either.
>>> Our product reports this bug to me, after let them do some test,
>>>
>>> I found virt_addr_valid return true for vmalloc'ed memory on their boar=
d.
>>>
>>> I think DEBUG_VIRTUAL could not be work well too, but I can't test it.
>>>
>>>> If it is unexpected, I think you should fix PPC64 instead of adding th=
is
>>>> hack back. Maybe the ARM64 fix can be used as a starting point, see
>>>> commit 68dd8ef32162 ("arm64: memory: Fix virt_addr_valid() using
>>>> __is_lm_address()")
>>> Yes=EF=BC=8C I check the history,=C2=A0 fix virt_addr_valid() on PowerP=
C is what I
>>> firstly want to do,
>>>
>>> but I am not familiar with PPC, and also HARDENED_USERCOPY on other's
>>> ARCHs could
>>>
>>> has this issue too, so I add the workaround back.
>>>
>>>
>>> 1) PPC maintainer/expert, any suggestion ?
>>>
>>> 2) Maybe we could add some check to WARN this scenario.
>>>
>>> --- a/mm/usercopy.c
>>> +++ b/mm/usercopy.c
>>> @@ -229,6 +229,8 @@ static inline void check_heap_object(const void
>>> *ptr, unsigned long n,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!virt_addr_valid(ptr))
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(is_vmalloc_or_module=
_addr(ptr));
>=20
>>>
>>>> In the meantime, can you provide more information on your config,
>>>> especially which memory model is used ?
>>> Some useful configs,
>>>
>>> CONFIG_PPC64=3Dy
>>> CONFIG_PPC_BOOK3E_64=3Dy
>>> CONFIG_E5500_CPU=3Dy
>>> CONFIG_TARGET_CPU_BOOL=3Dy
>>> CONFIG_PPC_BOOK3E=3Dy
>>> CONFIG_E500=3Dy
>>> CONFIG_PPC_E500MC=3Dy
>>> CONFIG_PPC_FPU=3Dy
>>> CONFIG_FSL_EMB_PERFMON=3Dy
>>> CONFIG_FSL_EMB_PERF_EVENT=3Dy
>>> CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy
>>> CONFIG_BOOKE=3Dy
>>> CONFIG_PPC_FSL_BOOK3E=3Dy
>>> CONFIG_PTE_64BIT=3Dy
>>> CONFIG_PHYS_64BIT=3Dy
>>> CONFIG_PPC_MMU_NOHASH=3Dy
>>> CONFIG_PPC_BOOK3E_MMU=3Dy
>>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>>> CONFIG_FLATMEM_MANUAL=3Dy
>>> CONFIG_FLATMEM=3Dy
>>> CONFIG_FLAT_NODE_MEM_MAP=3Dy
>>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>>>
>> OK so it is PPC64 book3e and with flatmem.
>>
>> The problem is virt_to_pfn() which uses __pa()
>>
>> __pa(x) on PPC64 is (x) & 0x0fffffffffffffffUL
>>
>> And on book3e/64 we have
>>
>> VMALLOC_START =3D KERN_VIRT_START =3D ASM_CONST(0x8000000000000000)
>>
>>
>> It means that __pa() will return a valid PFN for VMALLOCed addresses.
>>
>>
>> So an additional check is required in virt_addr_valid(), maybe check
>> that (kaddr & PAGE_OFFSET) =3D=3D PAGE_OFFSET
>>
>> Can you try that ?
>>
>> #define virt_addr_valid(kaddr)	((kaddr & PAGE_OFFSET) =3D=3D PAGE_OFFSET=
 &&
>> pfn_valid(virt_to_pfn(kaddr)))
>=20
> I got this commit,
>=20
> commit 4dd7554a6456d124c85e0a4ad156625b71390b5c
>=20
> Author: Nicholas Piggin <npiggin@gmail.com>
> Date:=C2=A0=C2=A0 Wed Jul 24 18:46:37 2019 +1000
>=20
>  =C2=A0=C2=A0=C2=A0 powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __=
pa addresses
>=20
>  =C2=A0=C2=A0=C2=A0 Ensure __va is given a physical address below PAGE_OF=
FSET, and __pa is
>  =C2=A0=C2=A0=C2=A0 given a virtual address above PAGE_OFFSET.
>=20
> It has check the PAGE_OFFSET in __pa,=C2=A0 will test it and resend the=20
> patch(with above warning changes).

What did you get with this commit? Is this what causes the crash?

riscv for example with flatmem also relies on pfn_valid to do the right
thing, so as far as I can see the check should exclude vmalloc addresses
and it's just a matter of virt_addr_valid not to give virt_to_pfn an
address < PAGE_OFFSET.

If we take riscv's implementation

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/pag=
e.h
index 254687258f42..7713188516a6 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -132,7 +132,10 @@ static inline bool pfn_valid(unsigned long pfn)
 #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
 #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
=20
-#define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
+#define virt_addr_valid(vaddr) ({                                      \
+       unsigned long _addr =3D (unsigned long)vaddr;                     \
+       (unsigned long)(_addr) >=3D PAGE_OFFSET && pfn_valid(virt_to_pfn(_a=
ddr)); \
+})
=20
 /*
  * On Book-E parts we need __va to parse the device tree and we can't

