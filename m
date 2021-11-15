Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FFF450A32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 17:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtFcn4sb9z2ymr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 03:53:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Hgi/zdMp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Hgi/zdMp; 
 dkim-atps=neutral
X-Greylist: delayed 359 seconds by postgrey-1.36 at boromir;
 Tue, 16 Nov 2021 03:52:35 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtFc31kg0z2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 03:52:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636995150;
 bh=7X7opVIFUZ9gt0W6u/76B1ZJuHVq3lm9XgLe9rJcqwk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Hgi/zdMpCqWAHtlVwbgPgxtFvL1/9nbYOXEq0FBVZaO+XVG6oSfqbC9Guax2u3wx7
 auc3G0F2fbpx6q3ryMHKm8AQ2sK/YNlLtr9VbqkbKcNHYQctAmIPqFdYqzbQ7ibxvz
 qxlgGgodsNWt/o5bflM0XoVx0PIvEdRtZhMZpFNA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.172.2]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1mUiZj3MMl-00rlU4; Mon, 15
 Nov 2021 17:44:52 +0100
Message-ID: <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
Date: Mon, 15 Nov 2021 17:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Build regressions/improvements in v5.16-rc1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5BKtXEDuts0Z1GbTQQwbacSZ6Qy1U07fZEMQSQLpuPBBQDGFGvS
 jgmRgNw/0/YxGtzSDq/AyZLFtskYKCywXQ3lO2wtd3EGePe4Ixvqqh7DUZZeoRxCsQMl6GA
 by16J3GCpzXn/Msq8wegCjeZkFLZeq3tCjI3WXTxmaGR5bFXZPJKjDTbupJilCqt5Bs35DE
 Rw+BaHR8OgV3ewoQytQig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wUE+iqnwGwI=:pwHVkD1AMvYbCTmxseFl3e
 k9vlwHan6un72Vxz7GpgTocwsUv2jH8+/lwE70u8FEukJeArk3GTvQMeaIFGzyb4Imm2XOsTS
 YmVq9EFqJSgjQNs3ajgZjoViR3NvrzIX63AmjRJLWsbZiuzqwr31fVHyl8J8w3gXqrQuLqKOS
 Ak4xlHEbqVwA6koniJ8U1hl3uvkiCZwvroqOTq5a2aevRt1vWSvCOv301DmOGF9Q3FvZLXtrp
 nQvRstNb/ptBmmYy05UFqCVl/7ZHXXL+BiV4+vWagVV5GIhMpMxPKZ4vOuiG0r6wfebc/xqAn
 AiuSY0J1Y20Ythpr81ZqH9cnTc+Xm1uM6IFbg/JVZxBk+ehhIoFAYDiMhsAsXWj3tBvkMrPcp
 8AJdcTCiqOnezhO7YzQnsjQJLX/1PXC2qhadWL2lP+1Hmvy2DEGWnhfNu9cd4y0xXinAM1l0W
 EtVEPK+4MCXmoiMtMXW3wianCwvVwsY/yeV/+LLxOtnPZY+dJiwUqWZqIM3nA7PEqBgoi+RAZ
 CcGFLTJOn2IZK2mpliwx5YnFFU2ekdI7eM4d0ijmM+P4gfpTTNEcslYGy0WrquxON42kIzYkL
 Nat3+uvvdghfP1EI3n/l/iFvIc0z8Zyc3Af1xT3DZFgXfmEU+zHJJDNzLN5GnsPRDN8nSKHnt
 ZXfVvJVEQVPYaJyHpDgYA+JEmdfnrXXhc7/EjqfG4q48kuS1hvGpkribcSsF34Bdz0WDQAnC8
 NhzLqGMARTiSUT3/XLfosdmwkO1G06UG+ylSqziyfmCF9tf7BqVExcB1Q8N466NFeNEuEZ5Oa
 w/PUV4BFDkqIj8I3kgIqBIJwPjcgj2bP/mAn/AZh4VoiWhmTkgq6fBzPEf2kgRCNP2W4zq6uv
 dGTvv1FeHbivptsC9YOc2Z3ul5KTbwPa16o8VlvmRYa5X1DWbtDZ2WNnvDweWQwOjgnQ6OOg1
 v1tMei4JVuf00nKGL4qUA+kaODhJryGCdbB6ATfs8n040x5IRBIdvhR02t+pGrPKmPhGuO7I2
 sRnqLrGbHWP3SEsXfn4FAaZnYyAmSOdDfa+sUS3xcOd7vbcFue8j1iWc5pEsr/yTKvI8RrSev
 wcXxxrNTa9LHoI=
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/15/21 17:12, Geert Uytterhoeven wrote:
> On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.16-rc1[1] compared to v5.15[2].
>>
>> Summarized:
>>   - build errors: +20/-13
>>   - build warnings: +3/-28
>>
>> Happy fixing! ;-)
>>
>> Thanks to the linux-next team for providing the build service.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c=
1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca972ad5=
31c9b149c0a51ab43a417385813/ (all 90 configs)
>>
>>
>> *** ERRORS ***
>>
>> 20 error regressions:
>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expected '=
:' before '__stringify':  =3D> 33:4, 18:4
>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label 'l_y=
es' defined but not used [-Werror=3Dunused-label]:  =3D> 38:1, 23:1
>
>     due to static_branch_likely() in crypto/api.c
>
> parisc-allmodconfig

fixed now in the parisc for-next git tree.


>>   + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefined =
[-Werror]:  =3D> 531
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 3252 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 47:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 3360 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 499:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 5344 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 334:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 5380 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 354:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 1824 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 372:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 2224 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 204:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 3800 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 476:1
>
> parisc-allmodconfig

parisc needs much bigger frame sizes, so I'm not astonished here.
During the v5.15 cycl I increased it to 1536 (from 1280), so I'm simply te=
mpted to
increase it this time to 4096, unless someone has a better idea....

>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2240 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2304 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2320 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>
> powerpc-allmodconfig
>
>>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compi=
letime_assert_366' declared with attribute error: FIELD_PREP: value too la=
rge for the field:  =3D> 335:38
>
>     in drivers/pinctrl/pinctrl-apple-gpio.c
>
> arm64-allmodconfig (gcc8)
>
>>   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_=
overflow' declared with attribute error: detected read beyond size of obje=
ct (1st parameter):  =3D> 263:25, 277:17
>
>     in lib/test_kasan.c
>
> s390-all{mod,yes}config
> arm64-allmodconfig (gcc11)
>
>>   + error: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.=
ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-m=
t7621.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie=
-mt7621.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621=
.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621=
.ko] undefined!:  =3D> N/A
>
> mips-allmodconfig
>
>> 3 warning regressions:
>>   + <stdin>: warning: #warning syscall futex_waitv not implemented [-Wc=
pp]:  =3D> 1559:2
>
> powerpc, m68k, mips, s390, parisc (and probably more)

Will someone update all of them at once?




Helge


>>   + arch/m68k/configs/multi_defconfig: warning: symbol value 'm' invali=
d for MCTP:  =3D> 322
>>   + arch/m68k/configs/sun3_defconfig: warning: symbol value 'm' invalid=
 for MCTP:  =3D> 295
>
> Yeah, that happens when symbols are changed from tristate to bool...
> Will be fixed in 5.17-rc1, with the next defconfig refresh.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds
>

