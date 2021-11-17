Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B946454599
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:24:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLF06MzMz3bYD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:24:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=BrRmlP/G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=BrRmlP/G; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLDG1NsMz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:24:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637148180;
 bh=ggLkZ223a9rE1OZ+PtXEoMzttDhYwxytr42VAXoV0yE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BrRmlP/GY5IAtD5RaALvtRW3ze40rofBypyrcN9z9QxIw8txqLRrgARH9jEXOqYwh
 KXJCBFDLvp+noaK8NG3dViHrGLXr9PXWBhDRREmClfx7gTSDyQRXtDGKChgyuXIeTh
 g1w/aYiaxLQznFcOTR3PWbtxZg5OKDTwRDI8qycI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.76]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1mEFOM2tNZ-00ZhYR; Wed, 17
 Nov 2021 12:22:59 +0100
Message-ID: <525f9914-04bd-2d8a-0bbf-daf2d0d2053d@gmx.de>
Date: Wed, 17 Nov 2021 12:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Build regressions/improvements in v5.16-rc1
Content-Language: en-US
To: Nick Terrell <terrelln@fb.com>, Randy Dunlap <rdunlap@infradead.org>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
 <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ecyVoIRPJxDu1rgYw3do9p97wWm9wU+AYBS1tvVaJ0qieCw2VM+
 F4AcfYMJ6m/o5RfywfI4addVn5UKeIySukwDZx6nGaNJwYzhtTxzP+5Y9QaJhX+4OlwpAV1
 nMwCfILf2+U0diPU2I9nlEi9f/czGOv/sIbvk3rRkJXeX3DOr1WSt6X93xYlDMTGlwHCyLR
 l+dXL+dPRpL0TjoJpT37A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/MV6HsODHM=:GxGTU642o4q5r5Bwlk703U
 vxYQ3KuDo6YpbOEcuglfWGzzkjMlrIx0ZlWv4JsMVqaIrnJ1r7AEdn0mG05l77wBkj9tPDp2p
 cxqkTdS0Rn8a3/aO+1h66Qc6kxo7zYE5k8wzhKYhg57qAdkipTcoDbYTRbCnwgd66capkEccM
 ninD/hUvLoeWSvRDoqj7mDSeesjpteCG2ikmPDhTRIHWTyXcduB6vwRQJADGEDklW8y85wAX2
 8V74xNrEaQisjP8JC8Mjxt9pQ89HFPW5iIeFMhqGBusMX2Qc1A/dgqLsCecHDNVdOsLIZiVmd
 ZaVJy8Y4j1gCmWXjdIK4tPA2f2F7zz0I3Vr1J6DABpXhDXWjOi2t8Vc8FVWAkhlq0GDbOEa22
 LvVPGyYOXK+zVo3NTpR2SRDD5inFdZofQgk3STxUADjWe0pADXhySizKoqI3hOiS+RCzugymz
 P013TEBW0pCuBuvtAqKPpPOVumpI1YuDb+ncGhnSEeZguPYfyEJiUT3LqBFxh2V2X/9WDi1OL
 qNNEwvJJpR2wgmPCQ/kQ3qSQwou+kAe5ZuGqjdVpjbC2+1SPL7YspRkKKCFCjlGLvlpcujvTj
 zxtITxo9yGX25rS+k4QKT7FDY+rDz9LFNYsvT3HSCPcBFodYcELgos1uLT9n1PzJIIFglJTNy
 cpq+8ki7uxvrFMqw7bsyXNJxR68GWOY013x2dDtJgKhUdBk4WQNZ/Me0K/gC1a3qgmWbxZVEH
 GtYiU9JkuGLmQpINKuY0akrnFChvA784RgR2Y+oWWX7bHsqEa0qmvePFVafGjVha3pfS3jDwL
 y23unIOpTU0uAViTehWJfapqMdY3tpQoYWYdv/SmH5afY7QhFeTXGQ8FRB1s2XKDJLBt9n3lx
 IDTZVBbDmPftiGHN4qbiC+2vCAg+1tRLbsC5sRU19gzI7dfG8Prt3dDPwiqfcixG4zTa7VAhA
 H7orwyCYt9MsOsiUyOjbPeaXA1amq+2kIKl82/FS6TVco9YcnlGYmRMIv09URP4HnnwNXA5hj
 sTan1CyZPpbhoC1X7yQVhT2hokL8Bo8TnOGfc+9A/n3r6zaF4fFADZRSvl/CYXmsCxwIXL3cV
 VuJSqXhAe0zLjg=
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/17/21 03:19, Nick Terrell wrote:
>
>
>> On Nov 16, 2021, at 6:05 PM, Randy Dunlap <rdunlap@infradead.org> wrote=
:
>>
>> On 11/16/21 5:59 PM, Nick Terrell wrote:
>>>> On Nov 15, 2021, at 8:44 AM, Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> On 11/15/21 17:12, Geert Uytterhoeven wrote:
>>>>> On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>>>>>> Below is the list of build error/warning regressions/improvements i=
n
>>>>>> v5.16-rc1[1] compared to v5.15[2].
>>>>>>
>>>>>> Summarized:
>>>>>>  - build errors: +20/-13
>>>>>>  - build warnings: +3/-28
>>>>>>
>>>>>> Happy fixing! ;-)
>>>>>>
>>>>>> Thanks to the linux-next team for providing the build service.
>>>>>>
>>>>>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcd=
c43c1aa1ba12bca9d2dd4318c2a0dbf/   (all 90 configs)
>>>>>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca97=
2ad531c9b149c0a51ab43a417385813/   (all 90 configs)
>>>>>>
>>>>>>
>>>>>> *** ERRORS ***
>>>>>>
>>>>>> 20 error regressions:
>>>>>>  + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expecte=
d ':' before '__stringify':  =3D> 33:4, 18:4
>>>>>>  + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label '=
l_yes' defined but not used [-Werror=3Dunused-label]:  =3D> 38:1, 23:1
>>>>>
>>>>>    due to static_branch_likely() in crypto/api.c
>>>>>
>>>>> parisc-allmodconfig
>>>>
>>>> fixed now in the parisc for-next git tree.
>>>>
>>>>
>>>>>>  + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefin=
ed [-Werror]:  =3D> 531
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 3252 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 47:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 3360 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 499:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 5344 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 334:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 5380 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 354:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 1824 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 372:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 2224 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 204:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 3800 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 476:1
>>>>>
>>>>> parisc-allmodconfig
>>>>
>>>> parisc needs much bigger frame sizes, so I'm not astonished here.
>>>> During the v5.15 cycl I increased it to 1536 (from 1280), so I'm simp=
ly tempted to
>>>> increase it this time to 4096, unless someone has a better idea....
>>> This patch set should fix the zstd stack size warnings [0]. I=E2=80=99=
ve
>>> verified the fix using the same tooling: gcc-8-hppa-linux-gnu.
>>> I=E2=80=99ll send the PR to Linus tomorrow. I=E2=80=99ve been informed=
 that it
>>> isn't strictly necessary to send the patches to the mailing list
>>> for bug fixes, but its already done, so I=E2=80=99ll wait and see if t=
here
>>> is any feedback.
>>
>> IMO several (or many more) people would disagree with that.
>>
>> "strictly?"  OK, it's probably possible that almost any patch
>> could be merged without being on a mailing list, but it's not
>> desirable (except in the case of "security" patches).
>
> Good to know! Thanks for the advice, I wasn=E2=80=99t really sure what
> the best practice is for sending patches to your own tree, as I
> didn't see anything about it in the maintainer guide.

Nick, thanks a lot for your efforts to get the frame size usage down!

I've applied your patch series to the parisc for-next tree [1], so that it
gets some testing in the upstream for-next tree.
My tests so far are good, although I'm only using gcc-11.

If you don't mind, and if it doesn't generate issues for other
platforms & architectures I could submit them upstream to Linus when
I send the next pull request.

Helge

[1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.gi=
t/log/?h=3Dfor-next
