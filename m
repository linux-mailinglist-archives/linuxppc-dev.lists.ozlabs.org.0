Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89481BDCE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 14:58:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bz992xGjzDq5W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 22:58:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F1br0ski; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByCm1sJfzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:16:03 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id t3so1678026qkg.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s6yLkKL2RDPvj0ehntuz6yzYqVw4HJfxBcxm7sr0I1s=;
 b=F1br0skinTh7HBpC7lZCp6OjkBuNJLucEhazcspv/VrXZRfrO4FTng/i68uNqSv6QU
 zQewiY+PHvLs7GLybULIyU7S7zlDq5q0xnE5WYJKb5IGxpwlnJwQc3ZDCuUwA1g+Tr27
 ft7+B2nM4IUQk3ZGxOOSQZN1jexmWuKnK1x1veI+V0HhrJYlFPMXTgV1DtPz0v2RJSEy
 Xm922tltI5SqS2gLRKAboDD4EP2c09+f7R3jVF+40cuLWhzedbsAo5cLTpSDoCYu7xEd
 kK/qOMZlsxBg0pZ0V68oH3ByH7oFlKXjeFx+Q+KN65xQ2SsGaOjKLPAgzSuZmxcRlOqh
 pevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=s6yLkKL2RDPvj0ehntuz6yzYqVw4HJfxBcxm7sr0I1s=;
 b=LILfNGHJ8SjsGFJkqbtH/F1vGIu7z9kTJSlwPVGynBL01/CzcU5q+kn1mQgzxhuzzP
 gYWFOMkI3bZRiLJXKd1kWdtonLgow1AEGM8BCulBun3fN4NtSqDX+fgXBQdD5ZpRe/J2
 stUvLE956Ygf6ytRUaw96nkTXDpFDnuVljtBhYVyMeRxH0IeG+rSc2KjMWeMcMjOrbHU
 0o/MuSCXlZP75wXt6AiV96FjDt/cc9wYjYjGhOtQCzBaO+VPdIto7mkoVLYeJ89y9dtg
 OSl77I6cDcN1pDlKb/fgqmFiB/s6oh58pnc+BXEbWpeWY/gbU2j8XzWDkr7AyUa4PTcu
 C+5w==
X-Gm-Message-State: AGi0PubGDEtsiXurkRSDwmaUsfcZXhMVALwC7hmYLCtZincVy1ES8Hv5
 MSJssDREieeoXZZ8npocsRqDFw==
X-Google-Smtp-Source: APiQypLrOc/ksJ8GwNB1ssNL729PScg2AHLYHn+NrBPRx2MksLAb6IFkcgYbonr5y4Qj2QgN4RVerA==
X-Received: by 2002:ae9:e8c2:: with SMTP id a185mr31471013qkg.72.1588162559245; 
 Wed, 29 Apr 2020 05:15:59 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id
 q15sm15411689qkn.100.2020.04.29.05.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 05:15:58 -0700 (PDT)
To: Nicholas Piggin <npiggin@gmail.com>, Rich Felker <dalias@libc.org>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
 <1587855423.jug0f1n0b8.astroid@bobo.none>
 <20200425231119.GM11469@brightrain.aerifal.cx>
 <1587872025.rtx2ygrmn0.astroid@bobo.none>
 <e8a9d3d9-18a7-2cb9-db70-74f7b107f744@linaro.org>
 <1588126678.zjwj4d1d90.astroid@bobo.none>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 mQINBFcVGkoBEADiQU2x/cBBmAVf5C2d1xgz6zCnlCefbqaflUBw4hB/bEME40QsrVzWZ5Nq
 8kxkEczZzAOKkkvv4pRVLlLn/zDtFXhlcvQRJ3yFMGqzBjofucOrmdYkOGo0uCaoJKPT186L
 NWp53SACXguFJpnw4ODI64ziInzXQs/rUJqrFoVIlrPDmNv/LUv1OVPKz20ETjgfpg8MNwG6
 iMizMefCl+RbtXbIEZ3TE/IaDT/jcOirjv96lBKrc/pAL0h/O71Kwbbp43fimW80GhjiaN2y
 WGByepnkAVP7FyNarhdDpJhoDmUk9yfwNuIuESaCQtfd3vgKKuo6grcKZ8bHy7IXX1XJj2X/
 BgRVhVgMHAnDPFIkXtP+SiarkUaLjGzCz7XkUn4XAGDskBNfbizFqYUQCaL2FdbW3DeZqNIa
 nSzKAZK7Dm9+0VVSRZXP89w71Y7JUV56xL/PlOE+YKKFdEw+gQjQi0e+DZILAtFjJLoCrkEX
 w4LluMhYX/X8XP6/C3xW0yOZhvHYyn72sV4yJ1uyc/qz3OY32CRy+bwPzAMAkhdwcORA3JPb
 kPTlimhQqVgvca8m+MQ/JFZ6D+K7QPyvEv7bQ7M+IzFmTkOCwCJ3xqOD6GjX3aphk8Sr0dq3
 4Awlf5xFDAG8dn8Uuutb7naGBd/fEv6t8dfkNyzj6yvc4jpVxwARAQABtElBZGhlbWVydmFs
 IFphbmVsbGEgTmV0dG8gKExpbmFybyBWUE4gS2V5KSA8YWRoZW1lcnZhbC56YW5lbGxhQGxp
 bmFyby5vcmc+iQI3BBMBCAAhBQJXFRpKAhsDBQsJCAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJ
 EKqx7BSnlIjv0e8P/1YOYoNkvJ+AJcNUaM5a2SA9oAKjSJ/M/EN4Id5Ow41ZJS4lUA0apSXW
 NjQg3VeVc2RiHab2LIB4MxdJhaWTuzfLkYnBeoy4u6njYcaoSwf3g9dSsvsl3mhtuzm6aXFH
 /Qsauav77enJh99tI4T+58rp0EuLhDsQbnBic/ukYNv7sQV8dy9KxA54yLnYUFqH6pfH8Lly
 sTVAMyi5Fg5O5/hVV+Z0Kpr+ZocC1YFJkTsNLAW5EIYSP9ftniqaVsim7MNmodv/zqK0IyDB
 GLLH1kjhvb5+6ySGlWbMTomt/or/uvMgulz0bRS+LUyOmlfXDdT+t38VPKBBVwFMarNuREU2
 69M3a3jdTfScboDd2ck1u7l+QbaGoHZQ8ZNUrzgObltjohiIsazqkgYDQzXIMrD9H19E+8fw
 kCNUlXxjEgH/Kg8DlpoYJXSJCX0fjMWfXywL6ZXc2xyG/hbl5hvsLNmqDpLpc1CfKcA0BkK+
 k8R57fr91mTCppSwwKJYO9T+8J+o4ho/CJnK/jBy1pWKMYJPvvrpdBCWq3MfzVpXYdahRKHI
 ypk8m4QlRlbOXWJ3TDd/SKNfSSrWgwRSg7XCjSlR7PNzNFXTULLB34sZhjrN6Q8NQZsZnMNs
 TX8nlGOVrKolnQPjKCLwCyu8PhllU8OwbSMKskcD1PSkG6h3r0AquQINBFcVGkoBEACgAdbR
 Ck+fsfOVwT8zowMiL3l9a2DP3Eeak23ifdZG+8Avb/SImpv0UMSbRfnw/N81IWwlbjkjbGTu
 oT37iZHLRwYUFmA8fZX0wNDNKQUUTjN6XalJmvhdz9l71H3WnE0wneEM5ahu5V1L1utUWTyh
 VUwzX1lwJeV3vyrNgI1kYOaeuNVvq7npNR6t6XxEpqPsNc6O77I12XELic2+36YibyqlTJIQ
 V1SZEbIy26AbC2zH9WqaKyGyQnr/IPbTJ2Lv0dM3RaXoVf+CeK7gB2B+w1hZummD21c1Laua
 +VIMPCUQ+EM8W9EtX+0iJXxI+wsztLT6vltQcm+5Q7tY+HFUucizJkAOAz98YFucwKefbkTp
 eKvCfCwiM1bGatZEFFKIlvJ2QNMQNiUrqJBlW9nZp/k7pbG3oStOjvawD9ZbP9e0fnlWJIsj
 6c7pX354Yi7kxIk/6gREidHLLqEb/otuwt1aoMPg97iUgDV5mlNef77lWE8vxmlY0FBWIXuZ
 yv0XYxf1WF6dRizwFFbxvUZzIJp3spAao7jLsQj1DbD2s5+S1BW09A0mI/1DjB6EhNN+4bDB
 SJCOv/ReK3tFJXuj/HbyDrOdoMt8aIFbe7YFLEExHpSk+HgN05Lg5TyTro8oW7TSMTk+8a5M
 kzaH4UGXTTBDP/g5cfL3RFPl79ubXwARAQABiQIfBBgBCAAJBQJXFRpKAhsMAAoJEKqx7BSn
 lIjvI/8P/jg0jl4Tbvg3B5kT6PxJOXHYu9OoyaHLcay6Cd+ZrOd1VQQCbOcgLFbf4Yr+rE9l
 mYsY67AUgq2QKmVVbn9pjvGsEaz8UmfDnz5epUhDxC6yRRvY4hreMXZhPZ1pbMa6A0a/WOSt
 AgFj5V6Z4dXGTM/lNManr0HjXxbUYv2WfbNt3/07Db9T+GZkpUotC6iknsTA4rJi6u2ls0W9
 1UIvW4o01vb4nZRCj4rni0g6eWoQCGoVDk/xFfy7ZliR5B+3Z3EWRJcQskip/QAHjbLa3pml
 xAZ484fVxgeESOoaeC9TiBIp0NfH8akWOI0HpBCiBD5xaCTvR7ujUWMvhsX2n881r/hNlR9g
 fcE6q00qHSPAEgGr1bnFv74/1vbKtjeXLCcRKk3Ulw0bY1OoDxWQr86T2fZGJ/HIZuVVBf3+
 gaYJF92GXFynHnea14nFFuFgOni0Mi1zDxYH/8yGGBXvo14KWd8JOW0NJPaCDFJkdS5hu0VY
 7vJwKcyHJGxsCLU+Et0mryX8qZwqibJIzu7kUJQdQDljbRPDFd/xmGUFCQiQAncSilYOcxNU
 EMVCXPAQTteqkvA+gNqSaK1NM9tY0eQ4iJpo+aoX8HAcn4sZzt2pfUB9vQMTBJ2d4+m/qO6+
 cFTAceXmIoFsN8+gFN3i8Is3u12u8xGudcBPvpoy4OoG
Subject: Re: New powerpc vdso calling convention
Message-ID: <be2ac7fa-ef57-37a7-2e3f-9746738a2e3a@linaro.org>
Date: Wed, 29 Apr 2020 09:15:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588126678.zjwj4d1d90.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com, binutils@sourceware.org,
 Andy Lutomirski <luto@kernel.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/04/2020 23:39, Nicholas Piggin wrote:
> Excerpts from Adhemerval Zanella's message of April 27, 2020 11:09 pm:
>>
>>
>> On 26/04/2020 00:41, Nicholas Piggin wrote:
>>> Excerpts from Rich Felker's message of April 26, 2020 9:11 am:
>>>> On Sun, Apr 26, 2020 at 08:58:19AM +1000, Nicholas Piggin wrote:
>>>>> Excerpts from Christophe Leroy's message of April 25, 2020 10:20 pm:
>>>>>>
>>>>>>
>>>>>> Le 25/04/2020 à 12:56, Nicholas Piggin a écrit :
>>>>>>> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>>>>>>>>
>>>>>>>>
>>>>>>>> Le 25/04/2020 à 07:22, Nicholas Piggin a écrit :
>>>>>>>>> As noted in the 'scv' thread, powerpc's vdso calling convention does not
>>>>>>>>> match the C ELF ABI calling convention (or the proposed scv convention).
>>>>>>>>> I think we could implement a new ABI by basically duplicating function
>>>>>>>>> entry points with different names.
>>>>>>>>
>>>>>>>> I think doing this is a real good idea.
>>>>>>>>
>>>>>>>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, and the
>>>>>>>> main pitfall has been that our vdso calling convention is not compatible
>>>>>>>> with C calling convention, so we have go through an ASM entry/exit.
>>>>>>>>
>>>>>>>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=171469
>>>>>>>>
>>>>>>>> We should kill this error flag return through CR[SO] and get it the
>>>>>>>> "modern" way like other architectectures implementing the C VDSO: return
>>>>>>>> 0 when successfull, return -err when failed.
>>>>>>>
>>>>>>> Agreed.
>>>>>>>
>>>>>>>>> The ELF v2 ABI convention would suit it well, because the caller already
>>>>>>>>> requires the function address for ctr, so having it in r12 will
>>>>>>>>> eliminate the need for address calculation, which suits the vdso data
>>>>>>>>> page access.
>>>>>>>>>
>>>>>>>>> Is there a need for ELF v1 specific calls as well, or could those just be
>>>>>>>>> deprecated and remain on existing functions or required to use the ELF
>>>>>>>>> v2 calls using asm wrappers?
>>>>>>>>
>>>>>>>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say
>>>>>>>> yes, it would be good to have it to avoid going through ASM in the middle.
>>>>>>>
>>>>>>> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with
>>>>>>> their address in r12 if called at their global entry point. ELFv1 have a
>>>>>>> function descriptor with call address and TOC in it, caller has to load
>>>>>>> the TOC if it's global.
>>>>>>>
>>>>>>> The vdso doesn't have TOC, it has one global address (the vdso data
>>>>>>> page) which it loads by calculating its own address.
>>>>>>>
>>>>>>> The kernel doesn't change the vdso based on whether it's called by a v1
>>>>>>> or v2 userspace (it doesn't really know itself and would have to export
>>>>>>> different functions). glibc has a hack to create something:
>>>>>>>
>>>>>>> # define VDSO_IFUNC_RET(value)                           \
>>>>>>>    ({                                                     \
>>>>>>>      static Elf64_FuncDesc vdso_opd = { .fd_toc = ~0x0 }; \
>>>>>>>      vdso_opd.fd_func = (Elf64_Addr)value;                \
>>>>>>>      &vdso_opd;                                           \
>>>>>>>    })
>>>>>>>
>>>>>>> If we could make something which links more like any other dso with
>>>>>>> ELFv1, that would be good. Otherwise I think v2 is preferable so it
>>>>>>> doesn't have to calculate its own address.
>>>>>>
>>>>>> I see the following in glibc. So looks like PPC32 is like PPC64 elfv1. 
>>>>>> By the way, they are talking about something not completely finished in 
>>>>>> the kernel. Can we finish it ?
>>>>>
>>>>> Possibly can. It seems like a good idea to fix all loose ends if we are 
>>>>> going to add new versions. Will have to check with the toolchain people 
>>>>> to make sure we're doing the right thing.
>>>>
>>>> "ELFv1" and "ELFv2" are PPC64-specific names for the old and new
>>>> version of the ELF psABI for PPC64. They have nothing at all to do
>>>> with PPC32 which is a completely different ABI from either.
>>>
>>> Right, I'm just talking about those comments -- it seems like the kernel 
>>> vdso should contain an .opd section with function descriptors in it for
>>> elfv1 calls, rather than the hack it has now of creating one in the 
>>> caller's .data section.
>>>
>>> But all that function descriptor code is gated by
>>>
>>> #if (defined(__PPC64__) || defined(__powerpc64__)) && _CALL_ELF != 2
>>>
>>> So it seems PPC32 does not use function descriptors but a direct pointer 
>>> to the entry point like PPC64 with ELFv2.
>>
>> Yes, this hack is only for ELFv1.  The missing ODP has not been an issue 
>> or glibc because it has been using the inline assembly to emulate the 
>> functions call since initial vDSO support (INTERNAL_VSYSCALL_CALL_TYPE).
>> It just has become an issue when I added a ifunc optimization to 
>> gettimeofday so it can bypass the libc.so and make plt branch to vDSO 
>> directly.
> 
> I can't understand if it's actually a problem for you or not.
> 
> Regardless if you can hack around it, it seems to me that if we're going 
> to add sane calling conventions to the vdso, then we should also just 
> have a .opd section for it as well, whether or not a particular libc 
> requires it.

The main problem for glibc is the complication of having to handle two
different calling conventions.  Specially if kernel starts to provide 
new vDSO symbols with only with the new semantic. 

But I think it is doable, it will require some internal tinkering on
how to handle vDSO (to indicate which mechanism to use) which will 
most likely be powerpc specific.

> 
>> Recently on some y2038 refactoring it was suggested to get rid of this 
>> and make gettimeofday call clock_gettime regardless.  But some felt that 
>> the performance degradation was not worth for a symbol that is still used
>> extensibility, so we stuck with the hack.
>>
>> And I think having this synthetic opd entry is not an issue, since for 
>> full relro the program's will be used and correctly set as read-only.
> 
> I'm not quite sure what this means, I don't really know how glibc ifunc 
> works. How do you set r2 if you have no opd?

IFUNC itself is not an issue here, since it just a dynamic relocation that
instruct the dynamic linker to issue a defined function that provides the
actual symbol. The problem is symbol resolution for kernel vDSO symbol
that returns a pointer to the text segment instead of the expected ODP 
entry.

And currently glibc assumes that kernel vDSO does not use TOC or AUX,
so it sets a bogus value (~0x0) just to avoid trigger lazy resolution
in some cases. It makes sense with the current contract that vDSO calls
should behave as syscall, but lesser the flexibility of kernel 
implementation.

> 
>> The issue is more for glibc itself, and I wouldn't mind to just remove the
>> gettimeofday and time optimizations and use the default vDSO support
>> (which might increase in function latency though).
>>
>> As Rich has put, it would be simpler to just have powerpc vDSO symbols
>> to have a default function call semantic so we could issue a function
>> call directly.  But for powerpc64, we glibc will need to continue to 
>> support this non-standard call on older kernels and I am not sure if
>> adding new symbols with a different semantic will help much.
> 
> Yeah, we will add entry points with default function call semantics.
> At which point we make the things look like any other dso unless there 
> is good reason otherwise.

I think the move to make vDSO has the same semantic as an usual DSO is
the correct one.  I am just pointing out that different than musl, glibc
already support vDSO for powerpc and changing its interface will most
likely require more handling in powerpc specific bits.

> 
>> GLibc already hides this powerpc semantic on INTERNAL_VSYSCALL_CALL_TYPE,
>> so internally all syscalls are assumed to have the new semantic (-errno
>> on error, 0 on success). Adding another ELFv1 would require to add
>> more logic to handle multiple symbol version for vDSO setup
>> (sysdeps/unix/sysv/linux/dl-vdso-setup.h), which would mostly likely to
>> require an arch-specific implementation to handle it.
> 
> Is it not a build-time choice? The arch can set its own vdso symbol 
> names AFAIKS.

To enable vDSO support the architecture just need to define the
correspondent macros with the expected names. For instance, for powerpc:

sysdeps/unix/sysv/linux/powerpc/sysdep.h
[...]
195 #if defined(__PPC64__) || defined(__powerpc64__)
196 #define HAVE_CLOCK_GETRES64_VSYSCALL    "__kernel_clock_getres"
197 #define HAVE_CLOCK_GETTIME64_VSYSCALL   "__kernel_clock_gettime"
198 #else
199 #define HAVE_CLOCK_GETRES_VSYSCALL      "__kernel_clock_getres"
200 #define HAVE_CLOCK_GETTIME_VSYSCALL     "__kernel_clock_gettime"
201 #endif
202 #define HAVE_GETCPU_VSYSCALL            "__kernel_getcpu"
203 #define HAVE_TIME_VSYSCALL              "__kernel_time"
204 #define HAVE_GETTIMEOFDAY_VSYSCALL      "__kernel_gettimeofday"
205 #define HAVE_GET_TBFREQ                 "__kernel_get_tbfreq"
[...]

GLIBC will create and initialize the vDSO pointers in a arch neutral 
way, however the vDSO call itself is parametrized to handle the 
powerpc specific bits (the INTERNAL_VSYSCALL_CALL_TYPE which is called
by INLINE_SYSCALL_CALL).

> 
> Thanks,
> Nick
> 
